local enable = require("config").enable

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy
local insert_enter_event = require("config.event").enter.insert

local M = {
  {
    "nvim-lua/plenary.nvim",
    enabled = enable.plenary,
  },
  {
    "nvim-lua/popup.nvim",
    enabled = enable.popup,
  },
  {
    "voldikss/vim-floaterm",
    event = lazy_event,
    enabled = enable.floaterm,
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = enable.cmp,
    event = insert_enter_event,
    dependencies = require("config.cmp").dependencies,
    config = require("config.cmp").config,
  },
  {
    "lambdalisue/suda.vim",
    event = default_event,
    enabled = enable.suda,
  },
  {
    "AckslD/muren.nvim",
    enable = enable.muren,
    event = default_event,
    config = require("config.muren").config,
  },
}

return M
