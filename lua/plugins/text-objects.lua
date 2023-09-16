local enable = require("config").enable

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
    opts = require("config.text-objects").various_opts,
    config = require("config.text-objects").various_config,
  },
  {
    "glts/vim-textobj-comment",
    enabled = enable.comment_textobjects,
    keys = require("config.text-objects").comment_keys,
    dependencies = require("config.text-objects").comment_dependencies,
  },
  {
    "wellle/targets.vim",
    event = default_event,
    enabled = enable.targets,
  },
}

return M
