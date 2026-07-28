-- nvim/lua/plugins/navigation.lua
-- plugins for searching, jumping, projects, and files

return {
	-- fzf-lua
	-- fuzzy finding for files, text, buffers, and Neovim features
	{
		"ibhagwan/fzf-lua",
		dependencies = { "folke/which-key.nvim" },
		opts = {},
		config = function(_, opts)
			require("fzf-lua").setup(opts)
			require("which-key").add({ "<leader>f", group = "find" })
		end,
		keys = {
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
			{ "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Help tags" },
			{ "<leader>fp", "<cmd>FzfLua builtin<cr>", desc = "FzfLua pickers" },
			{ "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume last picker" },
			{ "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "Find todos" },
		},
	},
	-- neovim-project
	-- project discovery, switching, and per-project sessions
	{
		"coffebar/neovim-project",
		lazy = false,
		opts = {
			projects = {
				"~/Project/*",
				"~/.config/nvim",
				"~/.config/quickshell",
				"~/.local/share/chezmoi",
			},
			last_session_on_startup = false,
			per_branch_sessions = false,
			picker = {
				type = "fzf-lua",
				preview = {
					enabled = true,
					git_status = true,
					git_fetch = false,
				},
			},
		},
		init = function()
			vim.opt.sessionoptions:append("globals")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"Shatur/neovim-session-manager",
		},
		keys = {
			{ "<leader>fw", "<cmd>NeovimProjectDiscover<cr>", desc = "Find project workspace" },
		},
	},
}
