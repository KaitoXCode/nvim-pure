-- safely import (only if installed) mason
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- safely import (only if installed) mason lsp config
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup()

mason_lspconfig.setup({
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
    -- "pkgbuild_language_server",
    -- c/c++
    "clangd",
    "cmake",
    -- web
    -- "cssls",
    -- "html",
    -- "htmx",
    -- "jsonls",
    -- "tsserver",
    -- docker
    -- "dockerls",
    -- "docker_compose_language_service",
    -- go
    -- "golangci_lint_ls",
    -- "gopls",
    -- java
    -- "jdtls",
    -- "java_language_server",
  }
})
