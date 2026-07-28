-- nvim/lua/plugins/ui.lua
-- plugins related to UI

return {
	-- which-key.nvim
	-- that famous plugin
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			spec = {
				{
					"<leader>b",
					group = "buffers",
					expand = function()
						return require("which-key.extras").expand.buf()
					end,
				},
				{ "<leader>c", group = "code" },
				{ "<leader>e", group = "explorer" },
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "git" },
				{ "<leader>s", group = "surround" },
				{ "<leader>w", group = "windows" },
				{ "<leader>x", group = "diagnostics" },
			},
		},
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
	-- lualine.nvim
	-- enhanced status bar
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = { theme = "auto" },
		},
	},
	-- indent-blankline.nvim
	-- indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			scope = {
				show_exact_scope = true,
				highlight = { "Function", "Label" },
			},
		},
	},
	-- bufferline.nvim
	-- a bufferline for nvim
	{
		"akinsho/bufferline.nvim",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("bufferline").setup({})
		end,
		keys = {
			{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
			{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Close buffer" },
		},
	},
	-- noice.nvim
	-- new ui for messages, cmdline and popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- nvim-highlight-colors
	-- directly view colors in neovim
	{
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
		opts = {},
	},
}
