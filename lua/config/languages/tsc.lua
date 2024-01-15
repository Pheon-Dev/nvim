local M = {}

M.config = function()
  local utils = require("tsc.utils")
  require('tsc').setup({
    auto_open_qflist = true,
    auto_close_qflist = false,
    auto_focus_qflist = false,
    auto_start_watch_mode = false,
    bin_path = utils.find_tsc_bin(),
    enable_progress_notifications = true,
    flags = {
      noEmit = true,
      project = function()
        return utils.find_nearest_tsconfig()
      end,
      watch = false,
      build = true,
    },
    hide_progress_notifications_from_history = true,
    spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
    pretty_errors = true,
  })
  -- require('notify')

  --[[ vim.notify = function(message, level, opts)
    return notify(message, level, opts) -- <-- Important to return the value from `nvim-notify`
  end ]]
end

return M
