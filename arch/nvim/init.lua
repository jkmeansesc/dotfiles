for _, source in ipairs {
    "wen.keymaps",
    "wen.options",
    "wen.utils",
    "wen.lazy",
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end
