return {
  {
    "mfussenegger/nvim-dap",
    enabled = false,
    event = 'VeryLazy',
    config = function()
      local get_competitive_program = function()
        -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        local filename = vim.api.nvim_buf_get_name(0)
        filename = string.reverse(filename)
        filename = string.reverse(
          string.sub(
            filename,
            string.find(filename, '%.') + 1,
            string.len(filename)))
        return filename
      end

      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = get_competitive_program,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }
      vim.keymap.set('n', '<F9>', function()
        require('dap').continue()
      end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      -- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = false,
    event = 'VeryLazy',
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      -- dap.listeners.before.run.dapui_config = function()
      --   dapui.open()
      -- end
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  }
}
