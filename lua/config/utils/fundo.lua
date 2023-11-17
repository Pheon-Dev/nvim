local M = {}

M.dependencies = 'kevinhwang91/promise-async'

M.build = function() require('fundo').install() end

M.config = function()
  require('fundo').setup()
end

return M
