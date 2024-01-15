local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = enable.codeium,
  },
}

return M
