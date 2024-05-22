vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymap
-- example: keymap.set("i", "jk", "j")

keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>To", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>Tx", "<cmd>tabclose<CR>") -- close current tab
keymap.set("n", "<leader>Tn", "<cmd>tabn<CR>") -- go to next tab
keymap.set("n", "<leader>Tp", "<cmd>tabp<CR>") -- go to prev tab
keymap.set("n", "<leader>Tf", "<cmd>tabnew %<CR>") -- mv buffer to next tab

keymap.set("n", ";", ":") -- easier cmd mode
