local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "kevinhwang91/nvim-ufo",
    enabled = enable.fold,
    event = default_event,
    dependencies = require("config.fold").dependencies,
    keys = require("config.fold").keys,
    config = require("config.fold").config,
  },
}

return M
