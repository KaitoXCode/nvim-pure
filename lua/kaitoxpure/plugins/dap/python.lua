local lsp = "pyright"
local ruff = "ruff_lsp"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- pyright = {
        --   enabled = lsp == "pyright",
        -- },
        basedpyright = {
          enabled = lsp == "basedpyright",
        },
        [lsp] = {
          enabled = true,
        },
        -- ruff_lsp = {
        --   enabled = ruff == "ruff_lsp",
        -- },
        -- ruff = {
        --   enabled = ruff == "ruff",
        -- },
        -- [ruff] = {
        --   keys = {
        --     {
        --       "<leader>co",
        --       function()
        --         vim.lsp.buf.code_action({
        --           apply = true,
        --           context = {
        --             only = { "source.organizeImports" },
        --             diagnostics = {},
        --           },
        --         })
        --       end,
        --       desc = "Organize Imports",
        --     },
        --   },
        -- },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>pdt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>pdc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
      },
      config = function()
        local dap = require("dap")
        dap.configurations.python = {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return ".venv/bin/activate"
          end,
        }
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = function(_, opts)
      opts.dap_enabled = true
      return vim.tbl_deep_extend("force", opts, {
        name = {
          "venv",
          ".venv",
          "env",
          ".env",
        },
      })
    end,
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
    end,
  },
}
