---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    { "folke/persistence.nvim", config = true },
  },
  keys = {
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "[N]otification" },
    { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    { "D", function() Snacks.bufdelete() end, desc = "[D]elete Buffer" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git [O]pen", mode = { "n", "v" } },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git [B]lame Line" },
    { "<leader>gh", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File [H]istory" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit [L]og" },
  },
  config = function()
    require("snacks").setup {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          header = [[                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        },
      },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 5000, -- default: 3000
        top_down = false, -- false = down to top
        style = "compat",
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      scope = { enabled = true },
      styles = {
        notification = {
          border = "single",
        },
        scratch = {
          wo = { winhighlight = "SnacksNormal:Normal" },
        },
        notification_history = {
          wo = { winhighlight = "SnacksNormal:Normal" },
        },
        input = {
          border = "single",
        },
      },
    }

    -- HACK: auto open dashboard on last buffer deleted
    -- FIX: right now it is buggy
    vim.api.nvim_create_autocmd("BufDelete", {
      group = vim.api.nvim_create_augroup("bufdelpost_autocmd", {}),
      desc = "BufDeletePost User autocmd",
      callback = function()
        vim.schedule(
          function()
            vim.api.nvim_exec_autocmds("User", {
              pattern = "BufDeletePost",
            })
          end
        )
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BufDeletePost",
      group = vim.api.nvim_create_augroup("dashboard_delete_buffers", {}),
      desc = "Open Dashboard when no available buffers",
      callback = function(ev)
        local deleted_name = vim.api.nvim_buf_get_name(ev.buf)
        local deleted_ft = vim.api.nvim_get_option_value("filetype", { buf = ev.buf })
        local deleted_bt = vim.api.nvim_get_option_value("buftype", { buf = ev.buf })
        local dashboard_on_empty = deleted_name == "" and deleted_ft == "" and deleted_bt == ""
        if dashboard_on_empty then Snacks.dashboard() end
      end,
    })

    -- Lsp progress
    -- https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md#-examples
    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then return end
        local p = progress[client.id]

        for i = 1, #p + 1 do
          if i == #p + 1 or p[i].token == ev.data.params.token then
            p[i] = {
              token = ev.data.params.token,
              msg = ("[%3d%%] %s%s"):format(
                value.kind == "end" and 100 or value.percentage or 100,
                value.title or "",
                value.message and (" **%s**"):format(value.message) or ""
              ),
              done = value.kind == "end",
            }
            break
          end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v) return table.insert(msg, v.msg) or not v.done end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        ---@diagnostic disable-next-line: param-type-mismatch
        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
          opts = function(notif)
            notif.icon = #progress[client.id] == 0 and " "
              ---@diagnostic disable-next-line: undefined-field
              or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
}