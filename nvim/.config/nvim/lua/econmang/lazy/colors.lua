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
		end
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		config = function()
			require('onedark').setup {
				style = 'darker'
			}
			--ColorMyPencils('onedark')
		end
	}
}
