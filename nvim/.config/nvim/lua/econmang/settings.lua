-- [[ Settings ]]
-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Fonts
vim.g.have_nerd_font = true

-- Column Setups
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'

-- Buffer Setup
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.undofile = true
vim.o.inccommand = 'split'
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- Spacing/Wrap
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = false

-- Search
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Timing
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Highlight when yanking (copying) text
vim.opt.hlsearch = false
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('nvim-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Colors
vim.opt.termguicolors = true
