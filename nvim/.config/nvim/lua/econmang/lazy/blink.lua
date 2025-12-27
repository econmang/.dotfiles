-- [[ Autocompletion ]]
return {
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {"rafamadriz/friendly-snippets"},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				local ls = require("luasnip")
				local s = ls.snippet
				local t = ls.text_node
				local i = ls.insert_node

				ls.add_snippets("lua", {
					s("hello", {
						t('print("hello")')
					})
				})

				ls.add_snippets("go", {
					s("ier", {
						t({'if err != nil {',"\t"}),
						i(0),
						t({"",'}'})
					})
				})
			end,
			opts = {}
			},
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = {
				preset = "default",
			},
			appearance = {
				nerd_font_variant = 'mono',
			},
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},
			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },
			signature = { enabled = true },
		},
	}
}
