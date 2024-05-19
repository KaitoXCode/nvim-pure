-- add tooling support for go development in neovim
return {
  "olexsmir/gopher.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local gopher = require("gopher")
    gopher.setup({
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "~/go/bin/gotests", -- also you can set custom command path
        impl = "impl",
        iferr = "iferr",
      },
    })
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
  keys = {
    {
      "<leader>gi",
      "<cmd>GoIfErr<CR>",
      desc = "Generate if error",
    },
    {
      "<leader>gj",
      "<cmd>GoTagAdd json<CR>",
      desc = "Generate json tag",
    },
    {
      "<leader>gr",
      "<cmd>GoTagRm<CR>",
      desc = "Remove json tag",
    },
  },
}
