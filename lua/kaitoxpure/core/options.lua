vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- line number
opt.relativenumber = true
opt.number = true

-- tabs & indentations
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
-- change below when using iTerm2 or when nerd font installed
opt.termguicolors = false
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use sys clipboard

-- split windows
opt.splitright = true
opt.splitbelow = true
