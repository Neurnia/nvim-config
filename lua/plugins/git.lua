-- nvim/lua/plugins/GIT.lua
-- plugins directly related to git

return {
	-- fzf-lua
	-- searchable git history
	{
		"ibhagwan/fzf-lua",
		keys = {
			{ "<leader>gl", "<cmd>FzfLua git_commits<cr>", desc = "Git log" },
			{ "<leader>gL", "<cmd>FzfLua git_bcommits<cr>", desc = "Git log current file" },
		},
	},
	-- gitsigns.nvim
	-- the one-and-only git-related plugin people must install
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs_staged_enable = true,
			signcolumn = true,
			numhl = true,
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("<leader>gb", gitsigns.blame_line, "Git blame line")
				map("<leader>gh", gitsigns.preview_hunk_inline, "Git preview hunk")
				map("<leader>gs", gitsigns.stage_hunk, "Toggle git stage hunk")
			end,
		},
	},
	-- lazygit.nvim
	-- open up lazygit in nvim
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	-- diffs.nvim
	-- simple, syntax-aware diff views
	{
		"barrettruth/diffs.nvim",
		lazy = false,
		init = function()
			vim.g.diffs = {
				integrations = {
					gitsigns = true,
				},
			}
		end,
		keys = {
			{ "<leader>gd", "<cmd>Diff review HEAD<cr>", desc = "Review git changes" },
		},
	},
}
