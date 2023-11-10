local M = {}

-- generate keymap options
function M.keymap_opts(desc, expr)
    local opts = {
        noremap = true,
        silent = true,
        desc = desc,
    }
    if expr then opts.expr = true end
    return opts
end

return M
