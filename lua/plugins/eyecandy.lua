local enable = require("config").enable

local dressing = require("config.eyecandy.dressing")
local noice = require("config.eyecandy.noice")
local notify = require("config.eyecandy.notify")
local virt_column = require("config.eyecandy.virt-column")

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
    "lukas-reineke/virt-column.nvim",
    event = default_event,
    enabled = enable.virt_column,
    dependencies = virt_column.dependencies,
    config = virt_column.config,
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
