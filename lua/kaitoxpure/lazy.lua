local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- FOLDS CONFIG
-- Create an augroup to manage the autocommands
local augroup = vim.api.nvim_create_augroup("MyAutocommands", {})
-- Autocommand to set foldmethod to 'indent' before reading the buffer
vim.api.nvim_create_autocmd("BufReadPre", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.opt_local.foldmethod = "indent"
  end,
})
-- Autocommand to set foldmethod to 'manual' when entering the buffer window
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.opt_local.foldmethod:get() == "indent" then
      vim.opt_local.foldmethod = "manual"
    end
  end,
})
-- FOLDS CONFIG

require("lazy").setup({
  { import = "kaitoxpure.plugins" },
  { import = "kaitoxpure.plugins.lsp" },
  { import = "kaitoxpure.plugins.dap" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
