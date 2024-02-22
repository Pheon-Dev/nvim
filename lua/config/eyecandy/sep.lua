local M = {}

local theme = require("core.colors")

M.config = function()
  require("accidentslipt").setup({
    -- highlight for Window separator
    hi = {
      bg = theme.color0,
      fg = theme.color2,
    },
    -- This plugin will not be activated for filetype in the following table.
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
    symbols = {
      "─",
      "│",
      "╭",
      "╮",
      "╰",
      "╯",
    },
    anchor = {
      left = { height = 1, x = -1, y = -1 },
      right = { height = 1, x = -1, y = 0 },
      up = { width = 0, x = -1, y = 0 },
      bottom = { width = 0, x = 1, y = 0 },
    },
  })
end

return M
