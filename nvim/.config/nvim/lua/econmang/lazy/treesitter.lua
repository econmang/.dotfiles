-- [[ Syntax Highlighting ]]
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "bash", "c", "diff", "go", "html", "javascript", "lua", "luadoc", "markdown", "typescript" },
				auto_install = true,
				sync_install = false,
				ignore_install = {},
				modules = {},
				highlight = {
					enable = true
				},

				indent = {
					enabled = true
				},
			})
		end
	}
}
