vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- other mappings must be loaded before lazy.nvim
require("config.options")
require("config.keymaps")
require("config.lazy")
