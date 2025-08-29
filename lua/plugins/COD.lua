-- nvim/lua/plugins/COD.lua
-- plugins that directly related to code(insert mode)

return {
	-- conform.nvim
	-- code formatter
	{
		"stevearc/conform.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = { "BufReadPost" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>cf",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				markdown = { "prettierd" },

				-- the config filetypes
				yaml = { "prettierd" },
				toml = { "taplo" },
				lua = { "stylua" },

				-- cpp and c formatting have done by LSPs
				-- cpp = { "clangd" },
				-- c = { "clangd" },
				-- python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
			-- Customize formatters
			formatters = {
				taplo = {
					command = "taplo",
					-- stylua: ignore 
					args = {
						"format",
						"--option", "align_entries=true",
						"--option", "indent_string=\t",
						"-",
					},
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	-- mason-conform
	-- automatically download formatters in conform configs in mason
	{
		"zapling/mason-conform.nvim",
		dependencies = { "stevearc/conform.nvim" },
		opts = {},
	},
	-- nvim-autopairs
	-- autopair for multiple characters
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = { check_ts = true },
	},
	-- mini.surround
	-- surround actions
	{
		"echasnovski/mini.surround",
		version = "*",
		opts = {
			mappings = {
				add = "<leader>sa", -- Add surrounding in Normal and Visual modes
				delete = "<leader>sd", -- Delete surrounding
				find = "<leader>sf", -- Find surrounding (to the right)
				find_left = "<leader>sF", -- Find surrounding (to the left)
				highlight = "<leader>sh", -- Highlight surrounding
				replace = "<leader>sr", -- Replace surrounding
				update_n_lines = "<leader>sn", -- Update `n_lines`
			},
		},
	},
}
