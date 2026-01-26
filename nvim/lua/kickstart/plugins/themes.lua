return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.g.tokyonight_transparent = true
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
}
-- vim: ts=2 sts=2 sw=2 et
