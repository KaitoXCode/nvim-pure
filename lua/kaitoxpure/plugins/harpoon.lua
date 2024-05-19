return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({})
  end,
  keys = {
    {
      "<leader>po",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon View",
    },
    {
      "<leader>pa",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Harpoon Add File",
    },
    {
      "<leader>pw",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon Next File",
    },
    {
      "<leader>pq",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon Previous File",
    },
  },
}
