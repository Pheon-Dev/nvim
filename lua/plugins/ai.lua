local neocodeium = require("config.ai.neocodeium")

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy

local M = {
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = function()
      if vim.fn.has("nvim-0.10.0") == 1 then
        return false
      else
        return true
      end
    end,
  },
  {
    "monkoose/neocodeium",
    event = lazy_event,
    enabled = function()
      if vim.fn.has("nvim-0.10.0") == 1 then
        return true
      else
        return false
      end
    end,
    config = neocodeium.config,
  },
}

return M
