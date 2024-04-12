return {
    "hotoo/pangu.vim",
    lazy = false,
    config = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.markdown", "*.md", "*.text", "*.txt", "*.wiki", "*.cnx" },
            callback = function()
                vim.cmd "PanguAll"
                require("core.utils").notify("Formated with Pangu", "INFO")
            end,
        })
    end,
}
