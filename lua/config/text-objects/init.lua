local M = {}

local config = require("config.text-objects")

M.treesitter_text_objects = config.treesitter_text_objects
M.comment_text_objects = config.comment_text_objects
M.archer_text_objects = config.archer_text_objects
M.various_text_objects = config.various_text_objects

return M
