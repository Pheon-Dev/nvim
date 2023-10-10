local M = {}


M.config = function()
  require("notify").setup({
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
    -- minimum_width = 50,
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
