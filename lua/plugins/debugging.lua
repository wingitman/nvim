return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
		"NicholasMata/nvim-dap-cs",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dapui").setup({})
		require("dap-go").setup({})
		require("dap-cs").setup({
			dap_configurations = {
				{
					type = "coreclr",
					name = "Attach remote",
					mode = "remote",
					request = "attach",
				},
			},
			netcoredbg = {
				path = "netcoredbg",
			},
		})

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
		vim.keymap.set("n", "<leader>cb", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>cc", dap.continue, {})
	end,
}
