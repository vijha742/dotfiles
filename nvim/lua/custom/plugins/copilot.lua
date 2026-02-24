return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = false,  -- Disable default to set custom ones
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-\\>',
          },
        },
      }
      
      -- Set up keymaps that work in all filetypes
      vim.keymap.set('i', '<C-g>', function()
        require('copilot.suggestion').accept()
      end, { silent = true, desc = 'Accept Copilot suggestion (Ctrl-g)' })
      
      vim.keymap.set('i', '<M-l>', function()
        require('copilot.suggestion').accept()
      end, { silent = true, desc = 'Accept Copilot suggestion (Alt-l)' })
      
      vim.keymap.set('i', '<C-y>', function()
        require('copilot.suggestion').accept()
      end, { silent = true, desc = 'Accept Copilot suggestion (Ctrl-y)' })
    end,
  },
  { 'AndreM222/copilot-lualine' },
}
