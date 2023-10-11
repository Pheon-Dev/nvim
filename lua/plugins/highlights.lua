local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "utilyre/sentiment.nvim",
    event = default_event,
    enabled = enable.sentiment,
    config = true,
  },
  {
    -- "brenoprata10/nvim-highlight-colors",
    "RRethy/vim-hexokinase",
    event = default_event,
    enabled = enable.highlight_colors,
    -- config = true,
  },
}

return M
