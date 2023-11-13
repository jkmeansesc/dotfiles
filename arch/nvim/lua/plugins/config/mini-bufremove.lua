local bufs = vim.fn.getbufinfo { buflisted = true }
local keymap = vim.keymap
local close = function()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 1 then -- Yes
            vim.cmd.write()
            bd(0)
        elseif choice == 2 then -- No
            bd(0, true)
        end
    else
        bd(0)
    end
    -- open alpha automatically when no more buffers
    if not bufs[2] then require("alpha").start(true) end
end

local closeForce = function()
    require("mini.bufremove").delete(0, true)
    -- open alpha automatically when no more buffers
    if not bufs[2] then require("alpha").start(true) end
end

keymap.set("n", "<leader>bc", close, { desc = "close buffer" })
keymap.set("n", "<leader>bC", closeForce, { desc = "close buffer (force)" })
keymap.set("n", "<leader>c", close, { desc = "close buffer" })
keymap.set("n", "<leader>C", closeForce, { desc = "close buffer (force)" })
