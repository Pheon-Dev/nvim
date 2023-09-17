local enable = require("config").enable

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy

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
