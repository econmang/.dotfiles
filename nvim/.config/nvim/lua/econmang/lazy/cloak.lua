-- [[ Hide sensitive info ]]
return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
			-- color to apply for cloaking
			highlight_group = "Comment",
			patterns = {
				{
					file_pattern = {
						".env*",
						"wrangler.toml",
						".dev.vars",
					},
					-- match an equal sign and any character after it
					-- can also be a table of pattern (i.e. { "=.+", "-.+" })
					cloak_pattern = "=.+"
				}
			}
		})
	end
}
