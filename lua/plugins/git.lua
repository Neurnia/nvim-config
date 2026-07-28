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
			on_attach = function()
				-- keymaps
				local gitsigns = require("gitsigns")
				vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "Git blame line" })
				vim.keymap.set("n", "<leader>gh", gitsigns.preview_hunk_inline, { desc = "Git preview hunk" })
				vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Toggle git stage hunk" })
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

			vim.keymap.set("n", "<leader>gd", "<cmd>Diff review HEAD<cr>", {
				silent = true,
				desc = "Review git changes",
			})
		end,
	},
}
