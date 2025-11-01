return {
  "williamboman/mason.nvim",
  version = "v1.10.0",
  dependencies = {
    {"williamboman/mason-lspconfig.nvim", version="v1.31.0" },
    {"WhoIsSethDaniel/mason-tool-installer.nvim", version="v2.11.0" },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      -- ensure_installed = {
      --   -- go
      --   "delve",
      --   "gotestsum",
      --   "iferr",
      --   "impl",
      --   "json-to-struct",
      --   "gomodifytags",
      --   "gotests",
      --   "nilaway",
      --   -- python
      --   "debugpy",
      --   -- java
      --   "java-debug-adapter",
      --   "java-test",
      -- },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- all
        "typos_lsp",
        -- make
        "autotools_ls",
        -- markdown
        -- "markdown_oxide",
        -- python
        "pyright",
        "pylsp",
        -- "pylyzer",
        -- lua
        "lua_ls",
        -- bash
        --   "pkgbuild_language_server",
        -- c/c++
        -- "clangd",
        -- j"cmake",
        -- web
        --   "cssls",
        --   "html",
        --   "htmx",
        --   "jsonls",
        --   "tsserver",
        -- docker
        --   "dockerls",
        --   "docker_compose_language_service",
        -- go
        "gopls",
        "templ",
        "html",
        "htmx",
        -- java
        "jdtls",
        --   "java_language_server",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- web
        "prettier",
        "eslint_d",
        -- lua
        "stylua",
        -- go
        "gofumpt",
        "goimports-reviser",
        "golines",
        -- "golangci-lint",
        -- docker
        "hadolint",
        "revive",
        "staticcheck",
        -- python
        -- "ruff",
        "isort",
        "black",
        "pylint",
      },
    auto_update = false, -- disable auto updates for stability
    run_on_start = true, -- ensures tools installed automatically on start up
    })
  end,
}
