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

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	-- manage + install lsp servers, formatters & linters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim") -- link mason with below
	-- configure lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp") -- configure lsp to apear in auto complete
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced ui for lsp
	use("onsails/lspkind.nvim") -- better icons for autocomplete window
	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git signs
	use("lewis6991/gitsigns.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
