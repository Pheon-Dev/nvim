local M = {}

function M.eval()
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  local modified = vim.api.nvim_eval_statusline('%M', {}).str == '+' and ' ●' or ' '


  file_path = file_path:gsub('/', ' » ')

  local count = require('lualine.components.diff.git_diff').get_sign_count()
  --[[ local status = "  " .. count.added .. " 柳" .. count.modified .. "  " .. count.removed ]]
  local status = " "

  return string.format(' %s %s %s', modified, file_path, status)


end

return M
