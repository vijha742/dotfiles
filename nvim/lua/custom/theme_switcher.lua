local theme_file = vim.fn.stdpath 'data' .. '/last_theme.txt'
local M = {}
local themes = require 'custom.themes'
-- Load previous theme if exists
if vim.fn.filereadable(theme_file) == 1 then
  local last = vim.fn.readfile(theme_file)[1]
  if last then
    pcall(vim.cmd.colorscheme, last)
  end
end

local current_index = 1

local function apply_theme(theme)
  local ok = pcall(vim.cmd.colorscheme, theme)
  if ok then
    vim.fn.writefile({ theme }, theme_file)
  else
    vim.notify('Could not load theme: ' .. theme, vim.log.levels.ERROR)
  end
end

function M.next()
  current_index = (current_index % #themes) + 1
  apply_theme(themes[current_index])
end

function M.prev()
  current_index = (current_index - 2) % #themes + 1
  apply_theme(themes[current_index])
end

-- (Optional) direct picker integration
function M.pick()
  local pickers = require 'telescope.pickers'
  local finders = require 'telescope.finders'
  local conf = require('telescope.config').values
  local actions = require 'telescope.actions'
  local action_state = require 'telescope.actions.state'

  pickers
    .new({}, {
      prompt_title = 'Select Theme',
      finder = finders.new_table { results = themes },
      sorter = conf.generic_sorter(),
      attach_mappings = function(_, map)
        map('i', '<CR>', function(prompt_bufnr)
          local selection = action_state.get_selected_entry(prompt_bufnr)
          apply_theme(selection[1])
          actions.close(prompt_bufnr)
        end)
        return true
      end,
    })
    :find()
end

return M
