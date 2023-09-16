local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "stevearc/dressing.nvim",
    enabled = enable.dressing,
    init = require("config.dressing").init,
    config = require("config.dressing").config,
  },
  {
    "rcarriga/nvim-notify",
    enabled = enable.notify,
    event = default_event,
    config = require("config.notify").config
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = default_event,
    enabled = enable.virt_column,
    dependencies = require("config.virt-column").dependencies,
    config = require("config.virt-column").config,
  },
  {
    "folke/noice.nvim",
    event = default_event,
    enabled = enable.noice,
    dependencies = require("config.noice").dependencies,
    config = require("config.noice").config,
  },
}

return M
