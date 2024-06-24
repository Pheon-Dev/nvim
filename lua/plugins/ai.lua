local default_event = require("config.event").default
local lazy_event = require("config.event").lazy

local M = {
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = true,
  },
}

return M
