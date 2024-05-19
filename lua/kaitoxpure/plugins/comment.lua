-- easier commenting: type g in normal mode to get suggestions
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- set keymaps
    local keymap = vim.keymap.set -- for conciseness

    keymap("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Comment line" })
    keymap(
      "v",
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Comment block" }
    )

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
