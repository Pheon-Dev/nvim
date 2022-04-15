local staline = require('staline')
local percentage = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = {
    "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"
  }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end
local time = function()
  return os.date("%a │ %H:%M %x")
end
local my_colors = {n = "#7aa2f7", i = "#bd93f9", c = "#10e070", v = "#c66bfe", V="#966bfe", R="#f62bfe"}
staline.setup {
  sections = {
    left = {
      'mode', ' ', {'StalineBranch', 'branch'}
      -- branch,
    },
    mid = {{'StalineName', 'file_name'}},
    right = {'-lsp', ' ', time, '  ', percentage}
  },
  defaults = {
    true_colors = true, -- LSP highlighing
    font_active = "none",
    branch_symbol = " ", -- Change the branch symbol
    mod_symbol = "  " -- Change the modified symbol
  },
  mode_icons = {
    ['n'] = ' NORMAL',
    ['no'] = ' NORMAL',
    ['nov'] = ' NORMAL',
    ['noV'] = ' NORMAL',
    ['niI'] = ' NORMAL',
    ['niR'] = ' NORMAL',
    ['niV'] = ' NORMAL',
    ['i'] = ' INSERT',
    ['ic'] = ' INSERT',
    ['ix'] = ' INSERT',
    ['s'] = ' INSERT',
    ['S'] = ' INSERT',
    ['v'] = ' VISUAL',
    ['V'] = ' VISUAL',
    [''] = ' VISUAL',
    ['r'] = ' REPLACE',
    ['r?'] = ' REPLACE',
    ['R'] = ' REPLACE',
    ['c'] = ' COMMAND',
    ['t'] = ' TERMINAL'
  },
  mode_colors = my_colors, -- Change mode colors
  special_table = {
    NvimTree = {'File Explorer', ' '},
    packer = {'Packer', ' '},
    TelescopePrompt = {'Telescope', ' '}
  },
  lsp_symbols = {Error = " ", Info = " ", Warn = " ", Hint = " "}
}
vim.cmd [[hi StalineBranch guifg=#bd93f9]]
vim.cmd [[hi StalineName guifg=#6272a4]]
-- require"staline".setup {
--   sections = {
--     left = {'  ', 'mode', ' ', 'branch', ' ', 'lsp'},
--     mid = {},
--     right = {'file_name', 'line_column'}
--   },
--   mode_colors = {n = "#3d59a1", i = "#7aa2f7", c = "#bd93f9", v = "#c66bfe", V = "#bb9af7"},
--   defaults = {true_colors = true, line_column = " [%l/%L] :%c  ", branch_symbol = " "}
-- }
