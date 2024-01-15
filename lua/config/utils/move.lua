local M = {}

M.config = function()
  -- No need to copy this inside `setup()`. Will be used automatically.
  local config = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      -- left = 'H',
      -- right = 'L',
      -- down = 'J',
      -- up = 'K',
      left = '_',
      right = '+',
      down = '-',
      up = '=',

      -- Move current line in Normal mode
      line_left = '_',
      line_right = '+',
      line_down = '-',
      line_up = '=',
    },

    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  }
  require("mini.move").setup(config)
end

return M
