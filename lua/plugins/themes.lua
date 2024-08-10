return {
  {
		dependencies = {
			{
				"catppuccin/nvim",
				name = "catppuccin",
				priority = 1000,
				config = function()
					vim.cmd.colorscheme("catppuccin")
				end,
			},
			{ "eldritch-theme/eldritch.nvim" },
			{ "scottmckendry/cyberdream.nvim" },
			{ "sainnhe/everforest" },
			{ "shaunsingh/nord.nvim" },
			{ "Yazeed1s/minimal.nvim" },
			{ "rose-pine/neovim" },
      
			{ "rebelot/kanagawa.nvim" },
		},
		config = function()
			--vim.cmd.colorscheme "rose-pine"
			--vim.cmd.colorscheme "minimal"
			--vim.cmd.colorscheme "nord"
			--vim.cmd.colorscheme "everforest"
			--vim.cmd.colorscheme "eldritch"
			--vim.cmd.colorscheme "cyberdream"
			--vim.cmd.colorscheme("tokyonight")
			--vim.cmd.colorscheme "catppuccin"
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				}
        --[[
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "dragon", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus",
				},
        ]]
			})
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
