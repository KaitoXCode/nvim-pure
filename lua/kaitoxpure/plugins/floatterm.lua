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
    -- floaterm.setup()
  end,
}
