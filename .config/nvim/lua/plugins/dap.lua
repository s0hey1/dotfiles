local wk = require("which-key")

wk.register({
  d = {
    name = "debug", -- optional group name
    b = { name = "debug toggle breakpoint" },
    B = { name = "debug set breakpoint, breakpoint condition" },
    p = { name = "debug set breakpoint, long point" },
    r = { name = "debug repl open" },
    l = { name = "debug run last" },
  },
}, { prefix = "<leader>" })
wk.register({

  ["<F5>"] = { name = "debug continue" },
  ["<F10>"] = { name = "debug step over" },
  ["<F11>"] = { name = "debug step into" },
  ["<F12>"] = { name = "debug step out" },
})

return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#993939", bg = "#31353f" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef", bg = "#31353f" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379", bg = "#31353f" })
      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapLogPoint",
        { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
      )
      vim.fn.sign_define(
        "DapStopped",
        { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
      )
      local dap_status, dap = pcall(require, "dap")
      if not dap_status then
        return
      end
      --dart debug
      dap.adapters.dart = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
        args = { "flutter" },
      }
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = os.getenv("HOME") .. "/linuxSoftwares/flutter/bin/cache/dart-sdk/",
          flutterSdkPath = os.getenv("HOME") .. "/linuxSoftwares/flutter",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        },
      }

      --nlua debugger for nvim lua debug
      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
        },
      }

      dap.adapters.nlua = function(callback, config)
        callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
      local bufopts = { noremap = true, silent = true }
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { noremap = true, silent = true, desc = "debug continue" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { noremap = true, silent = true, desc = "debug step over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { noremap = true, silent = true, desc = "debug step into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { noremap = true, silent = true, desc = "debug step out" })
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, { noremap = true, silent = true, desc = "debug toggle breakpoint" })
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { noremap = true, silent = true, desc = "debug set breakpoint, breakpoint condition" })
      vim.keymap.set("n", "<leader>dp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { noremap = true, silent = true, desc = "debug set breakpoint, long point" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { noremap = true, silent = true, desc = "debug repl open" })
      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { noremap = true, silent = true, desc = "debug run last" })
    end,
    keys = {
      { "<F5>", nil, { noremap = true, silent = true, desc = "debug continue" } },
      { "<F10>", nil, { noremap = true, silent = true, desc = "debug step over" } },
      { "<F11>", nil, { noremap = true, silent = true, desc = "debug step into" } },
      { "<F12>", nil, { noremap = true, silent = true, desc = "debug step out" } },
      { "<leader>db", nil, { noremap = true, silent = true, desc = "debug toggle breakpoint" } },
      { "<leader>dB", nil, { noremap = true, silent = true, desc = "debug set breakpoint, breakpoint condition" } },
      { "<leader>dp", nil, { noremap = true, silent = true, desc = "debug set breakpoint, long point" } },
      { "<leader>dr", nil, { noremap = true, silent = true, desc = "debug repl open" } },
      { "<leader>dl", nil, { noremap = true, silent = true, desc = "debug run last" } },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    keys = {
      { "<F5>" },
      { "<F10>" },
      { "<F11>" },
      { "<F12>" },
      { "<leader>db" },
      { "<leader>dB" },
      { "<leader>dp" },
      { "<leader>dr" },
      { "<leader>dl" },
      -- { "<F5>", nil, { noremap = true, silent = true, desc = "debug continue" } },
      -- { "<F10>", nil, { noremap = true, silent = true, desc = "debug step over" } },
      -- { "<F11>", nil, { noremap = true, silent = true, desc = "debug step into" } },
      -- { "<F12>", nil, { noremap = true, silent = true, desc = "debug step out" } },
      -- { "<leader>db", nil, { noremap = true, silent = true, desc = "debug toggle breakpoint" } },
      -- { "<leader>dB", nil, { noremap = true, silent = true, desc = "debug set breakpoint, breakpoint condition" } },
      -- { "<leader>dp", nil, { noremap = true, silent = true, desc = "debug set breakpoint, long point" } },
      -- { "<leader>dr", nil, { noremap = true, silent = true, desc = "debug repl open" } },
      -- { "<leader>dl", nil, { noremap = true, silent = true, desc = "debug run last" } },
    },
    config = function()
      local dap_status, dap = pcall(require, "dap")
      if not dap_status then
        return
      end
      local dapui_status, dapui = pcall(require, "dapui")
      if not dapui_status then
        return
      end

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    lazy = true,
    keys = {
      { "<F5>" },
      { "<F10>" },
      { "<F11>" },
      { "<F12>" },
      { "<leader>db" },
      { "<leader>dB" },
      { "<leader>dp" },
      { "<leader>dr" },
      { "<leader>dl" },
    },
    config = function()
      local dap_vt_status, dap_vt = pcall(require, "nvim-dap-virtual-text")
      if not dap_vt_status then
        return
      end
    end,
  },
  {
    "jayp0521/mason-nvim-dap.nvim",
    lazy = true,
    keys = {
      { "<F5>" },
      { "<F10>" },
      { "<F11>" },
      { "<F12>" },
      { "<leader>db" },
      { "<leader>dB" },
      { "<leader>dp" },
      { "<leader>dr" },
      { "<leader>dl" },
    },
    config = function()
      local dap_status, dap = pcall(require, "dap")
      if not dap_status then
        return
      end

      local mason_dap_status, mason_dap_autosetup = pcall(require, "mason-nvim-dap.automatic_setup")
      local mason_dap_status, mason_dap = pcall(require, "mason-nvim-dap")
      if mason_dap_status then
        mason_dap.setup({
          ensure_installed = {},
          automatic_setup = true,
        })
      end
      local setup_handlers = {
        function(source_name)
          -- all sources with no handler get passed here

          -- Keep original functionality of `automatic_setup = true`
          if mason_dap_status then
            mason_dap_autosetup(source_name)
          end
        end,
        python = function(source_name)
          dap.adapters.python = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter",
          }

          dap.configurations.python = {
            {
              type = "python",
              request = "launch",
              name = "Launch file",
              program = "${file}", -- This configuration will launch the current file if used.
            },
          }
        end,
        bash = function(source_name)
          dap.adapters.bashdb = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/bash-debug-adapter",
            name = "bashdb",
          }
          dap.configurations.sh = {
            {
              type = "bashdb",
              request = "launch",
              name = "Launch file",
              showDebugOutput = true,
              pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
              pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
              trace = true,
              file = "${file}",
              program = "${file}",
              cwd = "${workspaceFolder}",
              pathCat = "cat",
              pathBash = "/bin/bash",
              pathMkfifo = "mkfifo",
              pathPkill = "pkill",
              args = {},
              env = {},
              terminalKind = "integrated",
            },
          }
        end,
        cppdbg = function(source_name)
          dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
          }
          dap.configurations.cpp = {
            {
              name = "Launch file",
              type = "cppdbg",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopAtEntry = true,
              setupCommands = {
                {
                  text = "-enable-pretty-printing",
                  description = "enable pretty printing",
                  ignoreFailures = false,
                },
              },
            },
            {
              name = "Attach to gdbserver :1234",
              type = "cppdbg",
              request = "launch",
              MIMode = "gdb",
              miDebuggerServerAddress = "localhost:1234",
              miDebuggerPath = "/usr/bin/gdb",
              cwd = "${workspaceFolder}",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              setupCommands = {
                {
                  text = "-enable-pretty-printing",
                  description = "enable pretty printing",
                  ignoreFailures = false,
                },
              },
            },
          }
          dap.configurations.c = dap.configurations.cpp
          dap.configurations.rust = dap.configurations.cpp
        end,
        delve = function(source_name)
          dap.adapters.delve = {
            type = "server",
            port = "${port}",
            executable = {
              command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
              args = { "dap", "-l", "127.0.0.1:${port}" },
            },
          }
          dap.configurations.go = {
            {
              type = "delve",
              name = "Debug",
              request = "launch",
              program = "${file}",
            },
            {
              type = "delve",
              name = "Debug test", -- configuration for debugging test files
              request = "launch",
              mode = "test",
              program = "${file}",
            },
            -- works with go.mod packages and sub packages
            {
              type = "delve",
              name = "Debug test (go.mod)",
              request = "launch",
              mode = "test",
              program = "./${relativeFileDirname}",
            },
          }
        end,
        node2 = function(source_name)
          dap.adapters.node2 = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/node-debug2-adapter",
          }

          dap.configurations.javascript = {
            {
              name = "Launch",
              type = "node2",
              request = "launch",
              program = "${file}",
              cwd = vim.fn.getcwd(),
              sourceMaps = true,
              protocol = "inspector",
              console = "integratedTerminal",
            },
            {
              -- For this to work you need to make sure the node process is started with the `--inspect` flag.
              name = "Attach to process",
              type = "node2",
              request = "attach",
              processId = require("dap.utils").pick_process,
            },
          }
        end,
        chrome = function(source_name)
          dap.adapters.chrome = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/chrome-debug-adapter",
          }
          dap.configurations.javascriptreact = { -- change this to javascript if needed
            {
              type = "chrome",
              request = "attach",
              program = "${file}",
              cwd = vim.fn.getcwd(),
              sourceMaps = true,
              protocol = "inspector",
              port = 9222,
              webRoot = "${workspaceFolder}",
            },
          }

          dap.configurations.typescriptreact = { -- change to typescript if needed
            {
              type = "chrome",
              request = "attach",
              program = "${file}",
              cwd = vim.fn.getcwd(),
              sourceMaps = true,
              protocol = "inspector",
              port = 9222,
              webRoot = "${workspaceFolder}",
            },
          }
        end,
        firefox = function(source_name)
          dap.adapters.firefox = {
            type = "executable",
            command = vim.fn.stdpath("data") .. "/mason/bin/firefox-debug-adapter",
          }

          dap.configurations.typescript = {
            name = "Debug with Firefox",
            type = "firefox",
            request = "launch",
            reAttach = true,
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            firefoxExecutable = "/usr/bin/firefox",
          }
        end,
      }

      mason_dap.setup_handlers(setup_handlers)
    end,
  },
}
