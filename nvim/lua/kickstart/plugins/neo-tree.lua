return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '|', ':Neotree float<CR>', desc = 'NeoTree reveal float', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        width = 26,
        mappings = {
          ['Z'] = 'expand_all_nodes',
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
