return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<S-l>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    { '<leader>bp', '<Cmd>BufferLinePick<CR>', desc = 'Pick buffer' },
    { '<leader>bd', '<Cmd>bdelete<CR>', desc = 'Delete buffer' },
    { '<leader>bD', '<Cmd>BufferLinePickClose<CR>', desc = 'Pick buffer to close' },
  },
  opts = {
    options = {
      mode = 'buffers',
      show_buffer_close_icons = false,
      show_close_icon = false,
      always_show_bufferline = false,
    },
  },
}
