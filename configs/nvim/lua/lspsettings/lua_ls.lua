return {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim", "spec" },
      },
      runtime = {
        version = "LuaJIT",
        special = {
          spec = "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$HOME/.config/wezterm/lua"] = true,
          [vim.fn.expand "$HOME/.config/hammerspoon/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
