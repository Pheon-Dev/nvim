local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "folke/todo-comments.nvim",
    event = default_event,
    enabled = enable.todo_comments,
    config = require("config.todo").config
  },
  {
    "numToStr/Comment.nvim",
    event = default_event,
    enabled = enable.comment,
    dependencies = require("config.comment").dependencies,
    config = require("config.comment").config,
  },
}

return M
