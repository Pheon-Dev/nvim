local M = {}

---@param bufnr number
local function highlightsInStacktrace(bufnr)
  vim.defer_fn(function()
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    vim.api.nvim_buf_call(bufnr, function()
      vim.fn.matchadd("WarningMsg", [[[^/]\+\.lua:\d\+\ze:]]) -- files with error
      vim.fn.matchadd("WarningMsg", [[E\d\+]]) -- vim error codes
    end)
  end, 1)
end

M.opts = {
  max_width = 50,
  minimum_width = 25, -- wider for title in border
  top_down = false,
  level = 0, -- minimum severity, 0 = show all
  stages = "slide",
  icons = { ERROR = "", WARN = "", INFO = "", DEBUG = "", TRACE = "" },

  -- PENDING https://github.com/rcarriga/nvim-notify/pull/280
  -- render = "wrapped-minimal",
  render = require("funcs.TEMP-wrapped-minimal"),
  on_open = function(win, record)
    if not vim.api.nvim_win_is_valid(win) then
      return
    end

    -- put title into border PENDING https://github.com/rcarriga/nvim-notify/issues/279
    local opts = { border = vim.g.borderStyle }
    local hasTitle = record.title[1] and record.title[1] ~= ""
    if hasTitle then
      local title = " " .. record.title[1] .. " "
      if record.level ~= "INFO" then
        title = " " .. record.icon .. title
      end
      local titleHl = ("Notify%sTitle"):format(record.level)
      opts.title = { { title, titleHl } }
      opts.title_pos = "left"
    end
    vim.api.nvim_win_set_config(win, opts)

    local bufnr = vim.api.nvim_win_get_buf(win)
    highlightsInStacktrace(bufnr)
  end,
}

M.config = function()
  local config = {
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
