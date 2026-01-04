-- [[ Color Themes & Settings ]]
function ColorMyPencils(color)
	color = color or "habamax"
	vim.cmd.colorscheme(color)
end

return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
		config = function()
			require("tokyonight").setup({
				transparent = false,
				styles = {
					comments = { italic = false },
				},
			})
			ColorMyPencils("tokyonight-night")
		end
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		opts = {},
		config = function()
			--ColorMyPencils("kanagawa")
		end
	},
	{
		"catppuccin/nvim",
		lazy = false,
		opts = {},
		config = function()
			--ColorMyPencils("kanagawa")
		end
	}
}
