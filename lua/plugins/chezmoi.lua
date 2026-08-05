-- nvim/lua/plugins/chezmoi.lua
-- chezmoi-template.nvim
-- Neovim integration for chezmoi templates

return {
	{
		"dpezto/chezmoi-template.nvim",
		lazy = false,
		opts = {
			apply = { on_save = false },
		},
	},
}
