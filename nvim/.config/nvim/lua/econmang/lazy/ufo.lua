return {
	{
		"chrisgrieser/nvim-origami",
		event = "VeryLazy",
		opts = {},
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
		config = function()
			require("origami").setup({
				useLspFoldsWIthTreesitterFallback = true,
				pauseFoldsOnSearch = true,
				foldtext = {
					enabled = true,
					padding = 3,
					lineCount = {
						template = "%d lines",
						hlgroup = "Comment",
					},
					diagnosticsCount = true,
					gitsignsCount = true,
				},
				autoFold = {
					enabled = true,
					kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
				},
				foldKeyMaps = {
					setup = true,
					hOnlyOpensOnFirstColumn = false,
				},
			})
		end
	}
}
