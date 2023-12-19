local M = {}

M.dependencies = { "arsham/arshlib.nvim" }

local mappings = {
  space = {
    before = "[<space>",
    after = "]<space>",
    -- before = "<S-CR>",
    -- after = "<CR>",
  },
  ending = {
    period = {
      add = ".",
      remove = ">",
    },
    comma = {
      add = ",",
      remove = "lt",
    },
    semicolon = {
      add = ";",
      remove = ":",
    },
  },
  brackets = "<M-{>",
  augment_vim = {
    jumplist = 4, -- put in jumplist if count of j/k is more than 4
  },
}

local textobj = {
  next_obj = {
    i_next = "in",
    a_next = "an",
  },
  -- i_ i. i: i, i; i| i/ i\ i* i+ i- i#
  -- a_ a. a: a, a; a| a/ a\ a* a+ a- a#
  in_chars = { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "-", "#" },
  line = {
    i_line = "il",
    a_line = "al",
  },
  backtick = "`",
  numeric = {
    i_number = "in",
    a_number = "an",
  },
  fold = {
    i_block = "iz",
    a_block = "az",
  },
  context = { "ix", "ax" },      -- n lines from above and below.
  last_changed = { "ic", "ac" }, -- last pasted or changed text.
}

M.config = function()
  require("archer").config({
    mappings = mappings,
    textobj = false,
    -- textobj = textobj,
  })
end

return M
