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
end

return M
