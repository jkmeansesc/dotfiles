-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 } end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Notify when the current buffer is not UTF-8 encoded",
  group = vim.api.nvim_create_augroup("buf_check", { clear = true }),
  callback = function()
    local encoding = vim.bo.fileencoding
    if encoding ~= "utf-8" and encoding ~= "" then
      vim.notify(
        "Warning: The current buffer is not encoded in UTF-8. Detected encoding: " .. encoding,
        vim.log.levels.WARN
      )
    end
  end,
})
