local enable = require("config").enable

local various = require("config.text-objects.various_text_objects")
local comment = require("config.text-objects.comment_text_objects")
local archer = require("config.text-objects.archer_text_objects")

local default_event = require("config.event").default

local M = {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = enable.treesitter_textobjects,
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    enabled = enable.various_textobjects,
    event = default_event,
    opts = various.opts,
    config = various.config,
  },
  {
    "glts/vim-textobj-comment",
    enabled = enable.comment_textobjects,
    keys = comment.keys,
    dependencies = comment.dependencies,
  },
  {
    "wellle/targets.vim",
    event = default_event,
    enabled = enable.targets,
  },
  {
    "arsham/archer.nvim",
    enabled = enable.archer_textobjects,
    event = default_event,
    dependencies = archer.dependencies,
    config = archer.config,
  }
}

return M
