local M = {}

M.dependencies = {}

M.event = { "BufReadPost", "BufNewFile" }

M.keys = {
  -- { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
  -- { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
}

M.config = function()
  local augend = require("dial.augend")
  require("dial.config").augends:register_group({
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias["%Y/%m/%d"],
      augend.constant.alias.bool,
      augend.semver.alias.semver,
      augend.constant.new({ elements = { "let", "const" } }),
    },
  })
end
return M
