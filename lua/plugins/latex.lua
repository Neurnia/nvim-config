-- nvim/lua/plugins/latex.lua
-- LaTeX editing, compilation, and PDF preview

return {
	{
		-- VimTex
		-- A modern Vim and neovim filetype plugin for LaTeX files.
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_compiler_method = "latexmk"

			-- Okular support
			vim.g.vimtex_view_general_viewer = "okular"
			vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

			-- Keep the quickfix window out of the way
			vim.g.vimtex_quickfix_mode = 0
		end,
		config = function()
			local group = vim.api.nvim_create_augroup("latex_options", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				pattern = "tex",
				callback = function()
					-- Wrap long prose visually without inserting hard line breaks.
					vim.opt_local.textwidth = 0
					vim.opt_local.wrap = true
					vim.opt_local.linebreak = true
					vim.opt_local.breakindent = true

					-- LTeX+ provides prose diagnostics; keep raw LaTeX visible.
					vim.opt_local.spell = false
					vim.opt_local.conceallevel = 0
				end,
			})
		end,
	},
}
