local M = {}

M.dependencies = { "arsham/arshlib.nvim" }

M.config = function()
  require("archer").config({
    mappings = {
      space = {
        --[[ before = "[<space>",
        after = "]<space>", ]]
        before = "<S-CR>",
        after = "<CR>",
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
    },
    textobj = {
      next_obj = {
        i_next = "in",
        a_next = "an",
      },
      -- i_ i. i: i, i; i| i/ i\ i* i+ i- i#
      -- a_ a. a: a, a; a| a/ a\ a* a+ a- a#
      in_chars = { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "-", "#" },
      line = {
        i_line = "iL",
        a_line = "aL",
      },
      backtick = "`",
      numeric = {
        i_number = "iN",
        a_number = "aN",
      },
      fold = {
        i_block = "iZ",
        a_block = "aZ",
      },
      context = { "ix", "ax" },      -- n lines from above and below.
      last_changed = { "iC", "aC" }, -- last pasted or changed text.
    },
  })
end

return M
