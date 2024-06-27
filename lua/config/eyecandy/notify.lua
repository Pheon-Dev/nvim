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
  background_colour = "Normal",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "minimal", -- compact, minimal, simple, default
  stages = "slide",
  top_down = true,
  timeout = 3000,
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.35)
  end,

  -- max_width = 50,
  -- minimum_width = 25, -- wider for title in border
  -- top_down = false,
  -- level = 0, -- minimum severity, 0 = show all
  -- stages = "slide",
  -- icons = { ERROR = "", WARN = "", INFO = "", DEBUG = "", TRACE = "" },

  -- PENDING https://github.com/rcarriga/nvim-notify/pull/280
  -- render = "wrapped-minimal",
  -- render = require("funcs.TEMP-wrapped-minimal"),
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
  require("notify").setup({
    M.opts,
  })
  local theme = require("core.colors")

  vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = theme.color1, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = theme.color1, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = theme.color1, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = theme.color1, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = theme.color1, bg = theme.color0 })

  vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = theme.color87, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = theme.color88, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = theme.color89, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = theme.color90, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = theme.color91, bg = theme.color0 })

  vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = theme.color87, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = theme.color88, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = theme.color89, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = theme.color90, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = theme.color91, bg = theme.color0 })

  vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = theme.color0 })
end

return M
