local augend = require("dial.augend")

require("dial.config").augends:register_group {
  -- default augends used when no group name is specified
  default = {
    augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
    augend.constant.alias.bool,
    augend.integer.new {
      radix = 16,
      prefix = "0x",
      natural = true,
      case = "upper",
    },
    augend.date.new {
      pattern = "%Y/%m/%d",
      default_kind = "day",
      -- if true, it does not match dates which does not exist, such as 2022/05/32
      only_valid = true,
      -- if true, it only matches dates with word boundary
      word = false,
    },
    -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
    augend.constant.new {
      elements = { "and", "or" },
      word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
      cyclic = true, -- "or" is incremented into "and".
    },
    augend.constant.new {
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    },
    augend.user.new {
      find = require("dial.augend.common").find_pattern("%d+"),
      add = function(text, addend, cursor)
        local n = tonumber(text)
        n = math.floor(n * (2 ^ addend))
        text = tostring(n)
        cursor = #text
        return { text = text, cursor = cursor }
      end
    },
  },
  typescript = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.new { elements = { "let", "const" } },
  },
  visual = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.alpha,
    augend.constant.alias.bool,
    augend.constant.alias.Alpha,
  },
  -- augends used when group with name `mygroup` is specified
  mygroup = {
    augend.integer.alias.decimal,
    augend.constant.alias.bool, -- boolean value (true <-> false)
    augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
  }
}
--[[ enable only for specific FileType ]]
