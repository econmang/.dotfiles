-- [[ Keymaps ]]
-- Background transparency
local transparent_groups = {
	'Normal',
	'NormalNC',
	'NormalFloat',
	'SignColumn',
	'LineNr',
	'FoldColumn',
	'EndOfBuffer',
}

local function toggle_transparent_background()
	vim.g.transparent_background = not vim.g.transparent_background

	if vim.g.transparent_background then
		for _, group in ipairs(transparent_groups) do
			vim.cmd.highlight({ group, 'guibg=none', 'ctermbg=none' })
		end
	else
		vim.cmd.colorscheme(vim.g.colors_name)
	end
end

vim.keymap.set('n', '<leader>bg', toggle_transparent_background, { desc = 'Toggle transparent [B]ack[G]round' })

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Window Focus
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus right' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus up' })
-- Rename
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
-- Code Action
local autocmd = vim.api.nvim_create_autocmd
autocmd("LspAttach", {
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	end
})
