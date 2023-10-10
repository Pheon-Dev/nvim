local M = {}

M.config = function()
  local ft = require("hlchunk.utils.filetype")
  require('hlchunk').setup({
    indent = {
      enable = false,
      chars = { "│", "¦", "┆", "┊", }, -- more code can be found in https://unicodeplus.com/

      style = {
        "#8B00FF",
      },
    },
    blank = {
      enable = false,
    },
    line_num = {
      enable = true,
    },
    chunk = {
      enable = true,
      notify = true,
      use_treesitter = false,
      support_filetypes = ft.support_filetypes,
      exclude_filetypes = ft.exclude_filetypes,
      chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "╭",
        left_bottom = "╰",
        right_arrow = "─",
      },
      style = {
        { fg = "#806d9c" },
        { fg = "#c21f30" },
      },
      textobject = "",
      max_file_size = 1024 * 1024,
      error_sign = true,
    },
  })
end

return M
