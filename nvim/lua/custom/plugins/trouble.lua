return {
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {
      auto_close = true, -- auto close when there are no items
      auto_open = false, -- don't auto open
      auto_preview = true, -- automatically open preview when on an item
      auto_refresh = true, -- auto refresh when open
      focus = true, -- Focus trouble window when opened

      modes = {
        -- Workspace diagnostics
        diagnostics = {
          mode = 'diagnostics',
          preview = {
            type = 'split',
            relative = 'win',
            position = 'right',
            size = 0.4,
          },
        },
        -- Buffer diagnostics only
        buffer_diagnostics = {
          mode = 'diagnostics',
          filter = { buf = 0 },
          preview = {
            type = 'split',
            relative = 'win',
            position = 'right',
            size = 0.4,
          },
        },
        -- LSP references, definitions, etc
        lsp = {
          mode = 'lsp',
          focus = false,
          win = {
            position = 'right',
            size = 0.4,
          },
        },
        -- Document symbols
        symbols = {
          mode = 'lsp_document_symbols',
          focus = false,
          win = {
            position = 'right',
            size = 0.4,
          },
        },
      },

      -- Clean, minimal icons
      icons = {
        indent = {
          fold_open = '▾',
          fold_closed = '▸',
        },
        folder_closed = '▸',
        folder_open = '▾',
      },

      -- Simple keymaps within trouble window
      keys = {
        ['?'] = 'help',
        q = 'close',
        ['<esc>'] = 'cancel',
        ['<cr>'] = 'jump_close',
        ['<2-leftmouse>'] = 'jump',
        o = 'jump',
        p = 'preview',
        P = 'toggle_preview',
        zo = 'fold_open',
        zc = 'fold_close',
        za = 'fold_toggle',
        zm = 'fold_close_all',
        zr = 'fold_open_all',
        zM = 'fold_close_recursive',
        zR = 'fold_open_recursive',
      },
    },

    keys = {
      -- Main diagnostics toggle
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      -- Buffer-only diagnostics
      {
        '<leader>xX',
        '<cmd>Trouble buffer_diagnostics toggle<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      -- Document symbols
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle<cr>',
        desc = 'Symbols (Trouble)',
      },
      -- LSP references/definitions
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle<cr>',
        desc = 'LSP Definitions / references (Trouble)',
      },
      -- Quickfix and location lists
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
    },
  },
}
