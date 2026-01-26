-- Make line numbers default
vim.opt.number = true
-- add relative line numbers, to help with jumping.
vim.o.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- set color to 256
vim.o.termguicolors = true
-- Font settings
vim.o.guifont = 'JetBrains Mono'
-- highlight search
vim.o.hlsearch = true
-- preferred : indentation and tab
vim.o.tabstop = 2
vim.o.shiftwidth = 2
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true
-- Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- Enable break indent
-- vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searcharacters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type! //TODO: What are other options?
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- function to access files with gf
vim.o.path = vim.o.path .. ',**'
-- to override tokyonight_background
vim.g.tokyonight_transparent = false
-- //TODO:What is this shit?
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
vim.cmd 'hi NormalNC guibg=NONE ctermbg=NONE'
-- vim: ts=2 sts=2 sw=2 et
