-- Built-in Neovim keymaps
local map = vim.keymap.set

-- Window navigation
map("n", "<leader>wh", "<C-w>h", { noremap = true, desc = "Go to the left window" })
map("n", "<leader>wj", "<C-w>j", { noremap = true, desc = "Go to the down window" })
map("n", "<leader>wk", "<C-w>k", { noremap = true, desc = "Go to the up window" })
map("n", "<leader>wl", "<C-w>l", { noremap = true, desc = "Go to the right window" })

-- Move window to far edge
map("n", "<leader>wH", "<C-w>H", { noremap = true, desc = "Move window to far left" })
map("n", "<leader>wJ", "<C-w>J", { noremap = true, desc = "Move window to far bottom" })
map("n", "<leader>wK", "<C-w>K", { noremap = true, desc = "Move window to far top" })
map("n", "<leader>wL", "<C-w>L", { noremap = true, desc = "Move window to far right" })

-- Window layout
map("n", "<leader>wo", "<C-w>o", { noremap = true, desc = "Close all other windows" })
map("n", "<leader>wq", "<C-w>q", { noremap = true, desc = "Quit a window" })
map("n", "<leader>ws", "<C-w>s", { noremap = true, desc = "Split window" })
map("n", "<leader>wv", "<C-w>v", { noremap = true, desc = "Split window vertically" })
map("n", "<leader>wT", "<C-w>T", { noremap = true, desc = "Break out into a new tab" })
map("n", "<leader>ww", "<C-w>w", { noremap = true, desc = "Switch windows" })
map("n", "<leader>wx", "<C-w>x", { noremap = true, desc = "Swap current with next" })

-- Resize windows
map("n", "<leader>w+", "<C-w>+", { noremap = true, desc = "Increase height" })
map("n", "<leader>w-", "<C-w>-", { noremap = true, desc = "Decrease height" })
map("n", "<leader>w<", "<C-w><", { noremap = true, desc = "Decrease width" })
map("n", "<leader>w=", "<C-w>=", { noremap = true, desc = "Equally high and wide" })
map("n", "<leader>w>", "<C-w>>", { noremap = true, desc = "Increase width" })
map("n", "<leader>w_", "<C-w>_", { noremap = true, desc = "Max out the height" })
map("n", "<leader>w|", "<C-w>|", { noremap = true, desc = "Max out the width" })
