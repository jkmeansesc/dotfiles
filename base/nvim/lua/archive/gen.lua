local M = {
    "David-Kunz/gen.nvim",
    cmd = "Gen",
}

function M.config()
    require("gen").setup {
        model = "mistral", -- The default model to use.
        display_mode = "float", -- The display mode. Can be "float" or "split".
        show_prompt = true, -- Shows the Prompt submitted to Ollama.
        show_model = true, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = true, -- Never closes the window automatically.
    }
end
return M
