local M = {}

M.config = function()
  require('eyeliner').setup {
    highlight_on_key = false, -- show highlights only after keypress
    dim = true,               -- dim all other characters if set to true (recommended!)
  }
end

return M
