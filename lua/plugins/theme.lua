-- nvim/lua/plugins/theme.lua
-- colorschemes

return {
	-- tokyonight.nvim
	-- default colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- gruvbox.nvim
	-- alternative colorscheme
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
