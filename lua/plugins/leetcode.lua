-- nvim/lua/plugins/leetcode.lua
-- leetcode.nvim
-- LeetCoding right inside neovim
return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		"ibhagwan/fzf-lua",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		picker = { provider = "fzf-lua" },
		storage = {
			home = "~/leetcode",
			cache = "~/leetcode/cache",
		},
	},
}
