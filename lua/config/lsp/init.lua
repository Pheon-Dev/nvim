local M = {}

local config = require("config.lsp")

M.lspconfig = config.lspconfig
M.mason_lspconfig = config.mason_lspconfig
M.mason = config.mason
M.lspsaga = config.lspsaga
M.garbage = config.garbage
M.format = config.format
M.zero = config.zero

return M
