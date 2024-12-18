return {
	"NicholasMata/nvim-dap-cs",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap",
    "Samsung/netcoredbg",
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
				path = "/home/root/.config/netcoredbg/src",
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
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>db", dap.continue, {})
		vim.keymap.set("n", "<F10>", dap.step_over, {})
		vim.keymap.set("n", "<F11>", dap.step_into, {})
		vim.keymap.set("n", "<F12>", dap.step_out, {})
	end,
}
