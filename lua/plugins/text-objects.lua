local enable = require("config").enable

local various = require("config.text-objects.various_text_objects")
local comment = require("config.text-objects.comment_text_objects")

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
    enabled = enable.textobjects,
    keys = comment.keys,
    dependencies = comment.dependencies,
  },
  {
    "wellle/targets.vim",
    event = default_event,
    enabled = enable.targets,
  },
}

return M
