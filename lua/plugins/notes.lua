local enable = require("config").enable

local neorg = require("config.notes.neorg")

local default_event = require("config.event").default

local M = {
  {
    "nvim-neorg/neorg",
    enabled = enable.neorg,
    dependencies = enable.dependencies,
    event = default_event,
    config = neorg.config,
    build = neorg.build,
    ft = neorg.ft,
    cmd = neorg.cmd,
    priority = neorg.priority,
  }
}

return M
