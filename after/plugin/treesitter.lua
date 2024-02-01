require"nvim-treesitter.configs".setup {
	ensure_installed = { "go", "lua", "vim", "vimdoc", "css", "rust", "typescript", "javascript", "html" },
       	sync_install = false,
	highlight = { 
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
}
