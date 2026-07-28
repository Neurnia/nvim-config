-- nvim/lua/plugins/lsp.lua
-- plugins related to LSPs

return {
	-- mason.nvim
	-- auto management of LSPs
	-- need to be loaded first in LSP-related plugins
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
		keys = {
			-- set keymap for open mason ui
			{ "<leader>cm", "<cmd>Mason<CR>", noremap = true, silent = true, desc = "Open Mason" },
		},
	},
	-- mason-lspconfig.nvim
	-- connect mason and lspconfig to make a smoother LSP configurating experience
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- NOTE: add new LSPs here
				-- the plugin now automatically setup LSPs with nvim-lspconfig default settings
				"lua_ls",
				"clangd",
				"texlab",
				"ltex",
				"qmlls",
			},
			automatic_enable = {
				exclude = { "stylua" }, -- remain a formatter
			},
		},
	},
	-- nvim-lspconfig
	-- enables detailed configuration for LSPs
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- compensate for the shortcomings of ltex in Neovim
			"barreiroleo/ltex_extra.nvim",
		},
		config = function()
			-- NOTE: config some nvim's builtin LSP-related things here
			vim.diagnostic.config({
				virtual_lines = { current_line = true },
			})

			local keymaps = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = keymaps,
				callback = function(args)
					local function map(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
					end

					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					-- map("gi", vim.lsp.buf.implementation, "Go to implementation")
					-- map("gr", vim.lsp.buf.references, "Show references")
					map("K", vim.lsp.buf.hover, "Hover documentation")
					map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
				end,
			})

			-- NOTE: special settings for LSPs

			-- lua_ls for lua
			-- Thanks to lazydev.nvim, now we only need to set up this minor setting!!
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							disable = { "missing-fields" },
						},
					},
				},
			})

			-- ltex for the english language
			vim.lsp.config("ltex", {
				on_attach = function()
					require("ltex_extra").setup({
						path = vim.fn.stdpath("config") .. "/ltex",
					})
				end,
				settings = {
					ltex = {
						language = "en-US",
					},
				},
			})

			-- Prefer Arch's Qt-matched qmlls over Mason's bundled binary.
			-- The latter currently requires libodbc.so.2, which is not otherwise
			-- needed by this system.
			local system_qmlls = "/usr/lib/qt6/bin/qmlls"
			if vim.fn.executable(system_qmlls) == 1 then
				vim.lsp.config("qmlls", {
					cmd = { system_qmlls },
				})
			end

			-- NOTE: set up other LSPs here
		end,
	},
	-- lazydev.nvim
	-- add VIMRUNTIME library and other 3rd party libraries to lua_ls
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	-- actions-preview.nvim
	-- a brand new ui for code actions
	{
		"aznhe21/actions-preview.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			backend = { "nui" },
			diff = {
				algorithm = "patience",
				ignore_whitespace = true,
			},
		},
		keys = {
			{
				"<leader>ca",
				function()
					require("actions-preview").code_actions()
				end,
				mode = { "n", "v" },
				desc = "Show code actions ",
			},
		},
	},
}
