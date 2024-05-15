vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymap
-- example: keymap.set("i", "jk", "j")
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search filter

keymap.set("n", "x", '"_x') -- do not cp with "x"

keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement numebr

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split windo

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":q<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab

keymap.set("n", ";", ":") -- easier cmd mode

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
-- nvim-tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- find current string cursor is on
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- show active buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- show help tags
