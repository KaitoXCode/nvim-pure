-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- configure plugins
return packer.startup(function(use)

  use("wbthomason/packer.nvim")

  -- more lua functions that many plugins use
  use("nvim-lua/plenary.nvim")

  -- use("bluz71/vim-nightfly-guicolors") -- check if this colorscheme is any good
  use("christoomey/vim-tmux-navigator") -- C-h, k, j, l
  use("szw/vim-maximizer") -- maximise + restore current window

  -- normal mode: ys{word or other}{" or other}
  -- normal mode: ds{" or other}
  -- normal mode: cs{from " or other}{to ' or other}
  use("tpope/vim-surround")

  -- y{w or other} gr{w or other} (copy text)
  -- text1 text2
  use("vim-scripts/ReplaceWithRegister")

  -- commenting with gc
  -- gcc single line
  -- gc{num}j multi line
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- status line
  use("nvim-lualine/lualine.nvim")

  -- fuzzy find
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer") -- source: recommend text
  use("hrsh7th/cmp-path") -- source: filepath
  if packer_bootstrap then
    require("packer").sync()
  end
end)
