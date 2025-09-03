return {
	"mobill/undotree",

	config = function()
		vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
	end
}
