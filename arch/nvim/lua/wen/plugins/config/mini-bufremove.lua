local M = {}

M.config = function()
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
    end

    local closeForce = function() require("mini.bufremove").delete(0, true) end

    require("which-key").register {
        ["<leader>bc"] = { close, "Close buffer" },
        ["<leader>bC"] = { closeForce, "Close buffer (force)" },
        ["<leader>c"] = { close, "Close buffer" },
        ["<leader>C"] = { closeForce, "Close buffer (force)" },
    }
end

return M
