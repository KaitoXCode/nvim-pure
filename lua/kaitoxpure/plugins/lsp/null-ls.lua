-- for later move from null ls to conform & nvim-lint
-- https://github.com/LazyVim/LazyVim/discussions/1522
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier.with({
			filetypes = { "html", "json", "yaml", "markdown" },
		}),
		formatting.stylua.with({
			filetypes = { "lua" },
		}),
		formatting.gofumpt.with({
			filetypes = { "go" },
		}),
		formatting.goimports.with({
			filetypes = { "go" },
		}),
		formatting.goimports_reviser.with({
			filetypes = { "go" },
		}),
		formatting.golines.with({
			filetypes = { "go" },
		}),
		diagnostics.golangci_lint.with({
			filetypes = { "go" },
		}),
		diagnostics.hadolint,
		diagnostics.revive,
		diagnostics.staticcheck,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
