local enable = require("config").enable

local neocodeium = require("config.ai.neocodeium")

local default_event = require("config.event").default
local lazy_event = require("config.event").lazy
local insert_enter_event = require("config.event").enter.insert
local cmd_enter_event = require("config.event").enter.cmd

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
