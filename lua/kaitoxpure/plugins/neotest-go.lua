return {
  "nvim-neotest/neotest-go",
  dependencies = { "nvim-neotest/neotest" },
  config = function()
    require("neotest").setup({
      require("neotest-go")({
        dap = { justMyCode = false },
        experimental = {
          test_table = true,
        },
        args = { "-count=1", "-timeout=60s" },
      }),
    })
  end,
}
