local config = require("config.languages")

local M = {}

M.markdown = config.markdown
M.rust = config.rust
M.go = config.go
M.typescript = config.typescript
M.tsc = config.tsc
M.rest = config.rest

return M
