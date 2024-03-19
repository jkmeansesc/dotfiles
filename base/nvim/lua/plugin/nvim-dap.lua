local M = {
  "mfussenegger/nvim-dap",
  enabled = vim.fn.has "win32" == 0,
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    { "rcarriga/cmp-dap", dependencies = { "nvim-cmp" } },
    { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  event = { "BufReadPre", "BufNewFile" },
}

function M.init()
  local map = require("core.utils").map
  map("n", "<Leader>du", function() require("dapui").toggle() end, { desc = "Dap UI" })
  map({ "n", "v" }, "<Leader>de", function() require("dapui").toggle() end, { desc = "Eval" })
  map(
    "n",
    "<Leader>dB",
    function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
    { desc = "Breakpoint Condition" }
  )
  map("n", "<Leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
  map("n", "<Leader>dc", function() require("dap").continue() end, { desc = "Continue" })
  map("n", "<Leader>da", function()
    require("dap").continue {
      before = function(config)
        local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
        config = vim.deepcopy(config)
        ---@cast args string[]
        config.args = function()
          local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
          return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
        end
        return config
      end,
    }
  end, { desc = "Run with Args" })
  map("n", "<Leader>dC", function() require("dap").run_to_cursor() end, { desc = "Run to Cursor" })
  map("n", "<Leader>dg", function() require("dap").goto_() end, { desc = "Go to line (no execute)" })
  map("n", "<Leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
  map("n", "<Leader>dj", function() require("dap").down() end, { desc = "Down" })
  map("n", "<Leader>dk", function() require("dap").up() end, { desc = "Up" })
  map("n", "<Leader>dl", function() require("dap").run_last() end, { desc = "Run Last" })
  map("n", "<Leader>do", function() require("dap").step_out() end, { desc = "Step Out" })
  map("n", "<Leader>dO", function() require("dap").step_over() end, { desc = "Step Over" })
  map("n", "<Leader>dp", function() require("dap").pause() end, { desc = "Pause" })
  map("n", "<Leader>dr", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
  map("n", "<Leader>ds", function() require("dap").session() end, { desc = "Session" })
  map("n", "<Leader>dt", function() require("dap").terminate() end, { desc = "Terminate" })
  map("n", "<Leader>dw", function() require("dap.ui.widgets").hover() end, { desc = "Widgets" })
end
function M.config()
  local dap, dapui = require "dap", require "dapui"

  require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })

  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
  dapui.setup {
    floating = {
      border = "rounded",
    },
  }

  require("dap").adapters["codelldb"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "codelldb",
      args = {
        "--port",
        "${port}",
      },
    },
  }
  for _, lang in ipairs { "c", "cpp", "objc", "cuda", "proto" } do
    dap.configurations[lang] = {
      {
        type = "codelldb",
        request = "launch",
        name = "Launch file",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
        cwd = "${workspaceFolder}",
      },
      {
        type = "codelldb",
        request = "attach",
        name = "Attach to process",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
  end
  -- for c/c++ debugging end
end
return M
