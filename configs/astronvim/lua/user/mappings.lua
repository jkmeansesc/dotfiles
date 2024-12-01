return {
  n = {
    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- select all
    ["<leader>a"] = { "gg<S-v>G", desc = "Select All" },

    -- keep cursor stays at current location when appending the next line to the current line with "J"
    ["J"] = { "mzJ`z" },

    -- allow search terms to stay in the middle
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    -- open Alpha automatically when no more buffers
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
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
