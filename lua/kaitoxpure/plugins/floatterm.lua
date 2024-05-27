-- floating terminal
return {
  "voldikss/vim-floaterm",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- import floaterm
    -- local floaterm = require("floaterm")
    -- set keymaps
    local keymap = vim.keymap.set -- for conciseness
    keymap({ "n", "t" }, "<leader>tt", "<cmd>FloatermToggle<CR>", { desc = "Toggle floating terminal" })
    keymap({ "n", "t" }, "<leader>tc", "<cmd>FloatermNew<CR>", { desc = "Create floating terminal" })
    keymap({ "n", "t" }, "<leader>tn", "<cmd>FloatermNext<CR>", { desc = "Next floating terminal" })
    keymap({ "n", "t" }, "<leader>tp", "<cmd>FloatermPrev<CR>", { desc = "Prev floating terminal" })
    -- floaterm.setup()
  end,
}
