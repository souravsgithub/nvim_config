local keymap = vim.keymap.set
local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
	},
}

function M.config()
	local dap = require("dap")
	local dapui = require("dapui")
	dapui.setup()

	-- automatically open and close the ui of dap-ui
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
	-- keymaps for the debugger
  -- <Ctrl-\+n will exit out of the DAP-terminal after inputting the text and hitting Enter
	keymap("n", "<leader>dt", dap.toggle_breakpoint, {})
	keymap("n", "<leader>dc", dap.continue, {})
	keymap("n", "<leader>di", dap.step_into, {})
	keymap("n", "<leader>do", dap.step_over, {})
  keymap("n", "<leader>dO", dap.step_out, {})
	-- keymap("n", "<leader>dr", dap.toggle_repl, {})


	-- configuration for codelldb
	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = "/home/sourav/codelldb-x86_64-linux/extension/adapter/codelldb",
			args = { "--port", "${port}" },
		},
	}
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}

	dap.configurations.c = dap.configurations.cpp

end

return M
