local M = {}

M.config = function()
  local config =
  {
    -- Content management
    content = {
      -- Function which formats the notification message
      -- By default prepends message with notification time
      format = nil,

      -- Function which orders notification array from most to least important
      -- By default orders first by level and then by update timestamp
      sort = nil,
    },

    -- Notifications about LSP progress
    lsp_progress = {
      -- Whether to enable showing
      enable = true,

      -- Duration (in ms) of how long last message should be shown
      duration_last = 1000,
    },

    -- Window options
    window = {
      -- Floating window config
      config = {},

      -- Value of 'winblend' option
      winblend = 25,
    },
  }
  require("mini.animate").setup(config)
end

return M
