return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
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
      ensure_installed = {
        -- go
        "gotestsum",
        "iferr",
        "impl",
        "json-to-struct",
        "gomodifytags",
        "gotests",
        "nilaway",
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- all
        "snyk_ls",
        "typos_lsp",
        -- make
        "autotools_ls",
        -- markdown
        "markdown_oxide",
        -- python
        "pylyzer",
        "pylsp",
        -- lua
        "lua_ls",
        -- bash
        --   "pkgbuild_language_server",
        -- c/c++
        "clangd",
        "cmake",
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
        -- java
        --   "jdtls",
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
        "goimports",
        "golines",
        -- docker
        "hadolint",
        "revive",
        "staticcheck",
        -- python
        "isort",
        "black",
        "pylint",
      },
    })
  end,
}
