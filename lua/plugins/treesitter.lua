-- nvim/lua/plugins/treesitter.lua
-- treesitter parsing, highlighting, and indentation

return {
	-- nvim-treesitter
	-- enhanced treesitter experience
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local parsers = {
				"c",
				"cpp",
				"lua",
				"python",
				"markdown",
				"markdown_inline",
				"latex",
				"html",
				"vim",
				"regex",
				"bash",
				"gotmpl",
				"qmljs",
				"diff",
			}

			local treesitter = require("nvim-treesitter")
			treesitter.install(parsers)

			local group = vim.api.nvim_create_augroup("treesitter", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					if pcall(vim.treesitter.start, args.buf) then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
