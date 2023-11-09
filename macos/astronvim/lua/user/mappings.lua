-- Mapping data with "desc" stored directly by vim.[).
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
    -- first key is the mode
    n = {
        -- second key is the lefthand side of the map

        -- open alpha automatically when no more buffers
        ["<leader>c"] = {
            function()
                local bufs = vim.fn.getbufinfo { buflisted = true }
                require("astronvim.utils.buffer").close(0)
                if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
                    require("alpha").start(true)
                end
            end,
            desc = "Close buffer",
        },

        -- navigate buffer tabs with `H` and `L`
        L = {
            function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
            desc = "Next buffer",
        },
        H = {
            function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
            desc = "Previous buffer",
        },

        -- mappings seen under group name "Buffer"
        ["<leader>bD"] = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
                )
            end,
            desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

        -- select all
        ["<leader>a"] = { "gg<S-v>G", desc = "Select All" },

        -- keep cursor stays at current location when appending the next line to the current line with "J"
        ["J"] = { "mzJ`z" },

        -- keep cursor in the middle when jumping <C-d/u>
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },

        -- allow search terms to stay in the middle
        ["n"] = { "nzzzv" },
        ["N"] = { "Nzzzv" },
    },

    v = {
        -- move line(s) up and down
        ["J"] = { ":m '>+1<CR>gv=gv" },
        ["K"] = { ":m '>-2<CR>gv=gv" },
    },

    t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
    },
}
