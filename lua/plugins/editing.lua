-- nvim/lua/plugins/editing.lua
-- plugins related to editing text and code

return {
	-- conform.nvim
	-- code formatter
	{
		"stevearc/conform.nvim",
		dependencies = { "mason-org/mason.nvim" },
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
				tex = { "latexindent" },
				plaintex = { "latexindent" },

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
			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				-- Manual formatting for LaTex
				if ft == "tex" or ft == "plaintex" or ft == "bib" then
					return nil
				end

				return { timeout_ms = 500 }
			end,
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
	-- mason-tool-installer
	-- automatically install formatters used by conform.nvim
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier",
				"prettierd",
				"stylua",
				"taplo",
			},
		},
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
	},
}
