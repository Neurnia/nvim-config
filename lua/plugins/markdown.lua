-- nvim/lua/plugins/markdown.lua
-- plugins related to markdown files

return {
	-- markdown-preview.nvim
	-- using browser to preview markdown files
	{
		"iamcco/markdown-preview.nvim",
		pin = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- install with npm
		build = "cd app && npm install && git restore .",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		-- keymap for markdown-preview
		keys = {
			{
				"<leader>cM",
				"<cmd>MarkdownPreviewToggle<cr>",
				mode = { "n", "v" },
				desc = "Toggle markdown preview",
			},
		},
	},
	-- render-markdown.nvim
	-- better markdown display
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { blink = { enabled = true } },
			latex = { enabled = false },
		},
	},
	-- detailed config for markdown
	{
		"plasticboy/vim-markdown",
		branch = "master",
		dependencies = { "godlygeek/tabular" },
		config = function()
			vim.g.vim_markdown_conceal = 0
			vim.g.tex_conceal = ""
			vim.g.vim_markdown_math = 1
			vim.g.vim_markdown_conceal_code_blocks = 0
		end,
	},
}
