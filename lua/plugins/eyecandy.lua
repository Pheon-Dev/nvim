local enable = require("config").enable

local dressing = require("config.eyecandy.dressing")
local noice = require("config.eyecandy.noicey")
local notify = require("config.eyecandy.notify")
local hlargs = require("config.eyecandy.hlargs")
local windows = require("config.eyecandy.windows")

local default_event = require("config.event").default

local M = {
  {
    "stevearc/dressing.nvim",
    enabled = enable.dressing,
    init = dressing.init,
    config = dressing.config,
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
    -- event = lazy_event,
    enabled = enable.noice,
    dependencies = noice.dependencies,
    config = noice.config,
  },
  {
    'm-demare/hlargs.nvim',
    enabled = enable.hlargs,
    event = default_event,
    dependencies = hlargs.dependencies,
    config = hlargs.config
  },
  {
    "anuvyklack/windows.nvim",
    enabled = enable.windows,
    event = default_event,
    dependencies = windows.dependencies,
    config = windows.config
  },
}

return M
