-- nvim/lua/plugins/yazi.lua
-- plugin(s) that related to yazi file manager

return {
	-- yazi.nvim
	-- yazi inside neovim
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		config = function(_, opts)
			require("yazi").setup(opts)
			require("which-key").add({ "<leader>e", group = "explorer" })
		end,
		keys = {
			{
				"<leader>ee",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Explore current file",
			},
			{
				"<leader>ed",
				"<cmd>Yazi cwd<cr>",
				desc = "Explore workspace directory",
			},
			{
				"<leader>er",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume explorer",
			},
		},
		---@type YaziConfig | {}
		opts = {
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},
}
