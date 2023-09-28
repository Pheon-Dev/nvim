local enable = require("config").enable

local dressing = require("config.eyecandy.dressing")
local noice = require("config.eyecandy.noicey")
local notify = require("config.eyecandy.notify")
local scroll = require("config.eyecandy.scroll")

local default_event = require("config.event").default

local M = {
  {
    "stevearc/dressing.nvim",
    enabled = enable.dressing,
    init = dressing.init,
    config = dressing.config,
  },
  {
    'declancm/cinnamon.nvim',
    event = default_event,
    enabled = enable.scroll,
    config = scroll.config
  },
  {
    "rcarriga/nvim-notify",
    enabled = enable.notify,
    event = default_event,
    config = notify.config
  },
  {
    "folke/noice.nvim",
    event = default_event,
    enabled = enable.noice,
    dependencies = noice.dependencies,
    config = noice.config,
  },
}

return M
