-- nvim/lua/plugins/QOF.lua
-- plugins related to quality of life

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
	-- which-key.nvim
	-- that famous plugin
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local map = require("which-key")

			map.add({
				{ "<leader>c", group = "codes" },
				{ "<leader>g", group = "git" },
				{ "<leader>s", group = "surrounds" },
				{ "<leader>w", group = "window" },
			})
		end,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- todo-comments.nvim
	-- Highlight, list and search todo comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		opts = {},
		-- keymaps for todo-comments
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
		},
	},
	-- grug-far.nvim
	-- find and replace plugin for neovim
	{
		"MagicDuck/grug-far.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {},
		-- keymaps for grug-far
		keys = {
			{
				"<leader>cR",
				"<cmd>GrugFar<cr>",
				mode = "n",
				desc = "Search and replace",
			},
			{
				"<leader>cR",
				"<cmd>GrugFarWithIn<cr>",
				mode = "v",
				desc = "Search and replace selected",
			},
		},
		-- trouble.nvim
		-- efficiently view all the troubles
		{
			"folke/trouble.nvim",
			lazy = false,
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			cmd = "Trouble",
			config = function()
				require("which-key").add({ "<leader>x", group = "troubles" })
			end,
			keys = {
				{
					"<leader>xx",
					"<cmd>Trouble diagnostics toggle<cr>",
					desc = "Diagnostics (Trouble)",
				},
				{
					"<leader>xX",
					"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
					desc = "Buffer Diagnostics (Trouble)",
				},
				{
					"<leader>cs",
					"<cmd>Trouble symbols toggle focus=false<cr>",
					desc = "Symbols (Trouble)",
				},
				{
					"<leader>cl",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					desc = "LSP Definitions / references / ... (Trouble)",
				},
				{
					"<leader>xL",
					"<cmd>Trouble loclist toggle<cr>",
					desc = "Location List (Trouble)",
				},
				{
					"<leader>xQ",
					"<cmd>Trouble qflist toggle<cr>",
					desc = "Quickfix List (Trouble)",
				},
			},
		},
	},
}
