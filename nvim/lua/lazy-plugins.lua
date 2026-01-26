require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tribela/vim-transparent', -- Used for transparency
  require 'kickstart/plugins/gitsigns',
  require 'kickstart/plugins/which-key',
  require 'kickstart/plugins/telescope',
  require 'kickstart/plugins/lspconfig',
  require 'kickstart/plugins/conform', -- Used as formatter
  require 'kickstart/plugins/cmp',
  require 'kickstart/plugins/themes',
  require 'kickstart/plugins/fzf-lua',
  require 'kickstart/plugins/todo-comments',
  require 'kickstart/plugins/treesitter',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  --  require 'kickstart/plugins/mini',
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  { import = 'custom.plugins' },
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
