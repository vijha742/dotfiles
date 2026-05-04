return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<Tab>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
        ignore_filetypes = { 'bigfile', 'snacks_dashboard' },
        disable_inline_completion = false,
        disable_keymaps = false,
        log_level = 'off', -- set to "info" for debugging
      }
    end,
  },
}
