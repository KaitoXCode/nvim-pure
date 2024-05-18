local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	ensurue_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"gotmpl",
		"templ",
		"gowork",
		"java",
		"python",
		"regex",
		"rust",
		"sql",
		"c",
		"c_sharp",
		"c_sharp",
	},
	auto_install = true,
})
