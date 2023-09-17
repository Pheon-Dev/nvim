local enable = require("config").enable

local comment = require("config.comment.comment")
local todo = require("config.comment.todo")

local default_event = require("config.event").default

local M = {
  {
    "folke/todo-comments.nvim",
    event = default_event,
    enabled = enable.todo_comments,
    config = todo.config
  },
  {
    "numToStr/Comment.nvim",
    event = default_event,
    enabled = enable.comment,
    dependencies = comment.dependencies,
    config = comment.config,
  },
}

return M
