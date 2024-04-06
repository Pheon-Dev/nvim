local M = {}

local theme = require("core.colors")

M.tag = "v0.2.0"

M.config = function()
  require("modes").setup({
    colors = {
      copy = theme.color89,
      delete = theme.color16,
      insert = theme.color101,
      visual = theme.color27,
      replace = theme.color99,
    },

    -- Set opacity for cursorline and number background
    line_opacity = 0.15,

    -- Enable cursor highlights
    set_cursor = true,

    -- Enable cursorline initially, and disable cursorline for inactive windows
    -- or ignored filetypes
    set_cursorline = true,

    -- Enable line number highlights to match cursorline
    set_number = true,

    -- Disable modes highlights in specified filetypes
    -- Please PR commonly ignored filetypes
    ignore_filetypes = { "floaterm", "yankbank", "dashboard" },
  })
end

return M
