-- [[ Basic Keymaps ]]

-- Set <space> as the leader key
-- Leader is mapped to space at the top of the lazy.lua file so it can be used by lazy.nvim
--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigation/Motions
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '*', '*zzzv')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'G', 'Gzz')

-- Paste and send removed text to void register
vim.keymap.set('n', '<leader>p', '"_dP')

-- Paste and send removed text to void register
vim.keymap.set('n', '<leader>p', '"_dP')

-- Delete to void register
vim.keymap.set('n', '<leader>d', '"_d')

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
