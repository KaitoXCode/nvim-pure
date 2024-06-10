-- better git integration: git indicators, hunk movements, hunk management, blame, diff, etc.
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map("n", "<leader>gn", gs.next_hunk, "Next Hunk")
      map("n", "<leader>gp", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>gR", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>gs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("v", "<leader>gR", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")

      map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")

      map("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")

      map("n", "<leader>gg", gs.diffthis, "Diff this")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- Text object
      map({ "o", "x" }, "gih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}
