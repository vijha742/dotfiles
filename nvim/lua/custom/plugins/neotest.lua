return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'rcasia/neotest-java',
    },
    ft = 'java',
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-java' {
            junit_jar = nil, -- Uses JDTLS for test detection
            ignore_patterns = { '*/target/*' },
          },
        },
      }

      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = desc })
      end

      map('<leader>tn', function()
        require('neotest').run.run()
      end, '[T]est [N]earest')

      map('<leader>tf', function()
        require('neotest').run.run(vim.fn.expand '%')
      end, '[T]est [F]ile')

      map('<leader>ta', function()
        require('neotest').run.run(vim.fn.getcwd())
      end, '[T]est [A]ll')

      map('<leader>ts', function()
        require('neotest').summary.toggle()
      end, '[T]est [S]ummary')
    end,
  },
}
