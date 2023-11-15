local M = {}

M.treesitter = {
  ensure_installed = {
            "bash",
            "c",
            "html",
            "css",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
            "java",
            "latex",
            "dockerfile",
            "gitignore",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.whichkeyinit= function ()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
      require "which-key".register {
        ["<leader>b"] = { name = " 󰓩.Buffer" },
        ["<leader>s"] = { name = " 󰤼 Split" },
        ["<leader>g"] = { name = "  Git" },
        ["<leader>f"] = { name = "  Find" },
        ["<leader>l"] = { name = "  Lsp" },
        ["<leader>m"] = { name = "  Nvchad" },
    }

end

M.whichkeyconfig=function ()
    require "which-key".setup {
        icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
        disable = { filetypes = { "TelescopePrompt" } },
    }

end

return M
