local M = {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
}
function M.config()
  local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
  local root_dir = require("jdtls.setup").find_root(root_markers)
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
  -- local workspace_dir = os.getenv "HOME" .. "/git/Java/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  os.execute("mkdir" .. workspace_dir)

  local jdtls = require "jdtls"
  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
  extendedClientCapabilities.onCompletionItemSelectedCommand = "editor.action.triggerParameterHints"

  local mason_registry = require "mason-registry"
  local bundles = {} ---@type string[]
  if mason_registry.is_installed "java-debug-adapter" then
    local java_dbg_pkg = mason_registry.get_package "java-debug-adapter"
    local java_dbg_path = java_dbg_pkg:get_install_path()
    local jar_patterns = {
      java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
    }
    -- java-test also depends on java-debug-adapter.
    if mason_registry.is_installed "java-test" then
      local java_test_pkg = mason_registry.get_package "java-test"
      local java_test_path = java_test_pkg:get_install_path()
      vim.list_extend(jar_patterns, {
        java_test_path .. "/extension/server/*.jar",
      })
    end
    for _, jar_pattern in ipairs(jar_patterns) do
      for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
        table.insert(bundles, bundle)
      end
    end
  end

  local opts = {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      "-javaagent:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
      "-Xbootclasspath/a:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
      "-jar",
      vim.fn.glob "$MASON/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
      "-configuration",
      vim.fn.expand "$MASON/share/jdtls/config",
      "-data",
      workspace_dir,
    },

    root_dir = root_dir,

    settings = {
      java = {
        eclipse = { downloadSources = true },
        configuration = { updateBuildConfiguration = "interactive" },
        maven = { downloadSources = true, updateSnapshots = true },
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true },
        project = {
          encoding = "UTF-8",
        },
        foldingRange = { enabled = true },
        selectionRange = { enabled = true },
        import = {
          gradle = { enabled = true },
          maven = { enabled = true },
          exclusions = {
            "**/node_modules/**",
            "**/.metadata/**",
            "**/archetype-resources/**",
            "**/META-INF/maven/**",
            "**/.git/**",
          },
        },
        inlayhints = {
          parameterNames = { enabled = true },
        },
        autobuild = { enabled = true },
        templates = {
          fileHeader = {
            "/**",
            " * ${type_name}",
            " * @author ${user}",
            " */",
          },
          typeComment = {
            "/**",
            " * ${type_name}",
            " * @author ${user}",
            " */",
          },
        },
        signatureHelp = {
          enabled = true,
          description = {
            enabled = true,
          },
        },
        contentProvider = { preferred = "fernflower" },
      },

      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
      },
      -- signatureHelp = { enabled = true },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "org.graalvm.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
    },

    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),

    init_options = {
      bundles = bundles,
      extendedClientCapabilities = extendedClientCapabilities,
    },
    handlers = { ["$/progress"] = function() end }, -- disable progress updates.
  }

  local function attach_jdtls() require("jdtls").start_or_attach(opts) end

  -- Attach the jdtls for each java buffer. HOWEVER, this plugin loads
  -- depending on filetype, so this autocmd doesn't run for the first file.
  -- For that, we call directly below.
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java" },
    callback = attach_jdtls,
  })

  -- Setup keymap and dap after the lsp is fully attached.
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "jdtls" then
        if mason_registry.is_installed "java-debug-adapter" and mason_registry.is_installed "java-test" then
          require("jdtls").setup_dap { hotcodereplace = "auto", config_overrides = {} }
          require("jdtls.dap").setup_dap_main_class_configs()
        end

        vim.g.inlay_hints_visible = true
        vim.lsp.inlay_hint.enable(0, true)

        require("core.utils").load_mappings "on_attach_default"
        require("core.utils").load_mappings "on_attach_java"
      end
    end,
  })

  -- Avoid race condition by calling attach the first time, since the autocmd won't fire.
  attach_jdtls()
end

return M
