-- nvim/lua/plugins/diagnostics.lua
-- plugins for diagnostics and code annotations

return {
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
	-- trouble.nvim
	-- efficiently view all the troubles
	{
		"folke/trouble.nvim",
		lazy = false,
		opts = {
			focus = true,
			win = { type = "float" },
		},
		config = function(_, opts)
			require("trouble").setup(opts)
			require("which-key").add({ "<leader>x", group = "troubles" })
		end,
		keys = {
			{
				"<leader>xx",
				function()
					require("trouble").toggle("diagnostics")
				end,
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				function()
					require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } })
				end,
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				function()
					require("trouble").toggle({ mode = "symbols", focus = false })
				end,
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				function()
					require("trouble").toggle({ mode = "lsp", focus = false, win = { position = "right" } })
				end,
				desc = "LSP Definitions / References / … (Trouble)",
			},
			{
				"<leader>xL",
				function()
					require("trouble").toggle("loclist")
				end,
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				function()
					require("trouble").toggle("qflist")
				end,
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
