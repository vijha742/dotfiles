vim.cmd 'set verbosefile=~/.nvim-verbose.log verbose=15'
-- :Tutor
-- run AND READ `:help` or use "<space>sh" to [s]earch the [h]elp documentation
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Hi! I am Vikas Jha...
-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- ? do I need modeline or not, and what is it used for.
-- vim: ts=2 sts=2 sw=2 et
