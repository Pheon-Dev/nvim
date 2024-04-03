local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "Exafunction/codeium.vim",
    event = default_event,
    enabled = enable.codeium,
  },
  {
    "monkoose/neocodeium",
    event = default_event,
    enabled = enable.codeium,
    config = false,
    --[[ config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
    end, ]]
  },
}

return M
