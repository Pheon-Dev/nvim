local enable = require("config").enable

local dressing = require("config.eyecandy.dressing")
local noice = require("config.eyecandy.noicey")
local notify = require("config.eyecandy.notify")
local scroll = require("config.eyecandy.scroll")
local hlslens = require("config.eyecandy.hlslens")
local hlargs = require("config.eyecandy.hlargs")

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy

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
    -- event = default_event,
    event = lazy_event,
    enabled = enable.noice,
    dependencies = noice.dependencies,
    config = noice.config,
  },
  {
    'kevinhwang91/nvim-hlslens',
    enabled = enable.hlslens,
    event = default_event,
    config = hlslens.config
  },
  {
    'm-demare/hlargs.nvim',
    enabled = enable.hlargs,
    event = default_event,
    dependencies = hlargs.dependencies,
    config = hlargs.config
  }
}

return M
