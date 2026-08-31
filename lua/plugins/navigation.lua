-- nvim/lua/plugins/navigation.lua
-- plugins for searching, jumping, projects, and files

return {
	-- flash.nvim
	-- smart jump
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = { modes = { search = { enabled = true } } },
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},
	-- fzf-lua
	-- fuzzy finding for files, text, buffers, and Neovim features
	{
		"ibhagwan/fzf-lua",
		opts = {},
		config = function(_, opts)
			require("fzf-lua").setup(opts)
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
				"~/Projects/*",
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
