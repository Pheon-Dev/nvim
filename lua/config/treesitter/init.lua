local M = {}

local config = require("config.treesitter")

M.treesitter = config.treesitter
M.context = config.context
M.autopair = config.autopair
M.autotag = config.autotag
M.illuminate = config.illuminate

return M
