local colors = require("tokyonight.colors").setup()

require("scrollbar").setup({
  show = true,
  show_in_active_only = false,
  set_highlights = true,
  folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
  max_lines = false, -- disables if no. of lines in buffer exceeds this
  handle = {
    text = " ",
    color = colors.bg_highlight1,
    cterm = nil,
    highlight = "CursorColumn",
    hide_if_all_visible = true, -- Hides handle if all lines are visible
  },
  marks = {
    Search = {
      text = { "-", "=" },
      priority = 0,
      color = colors.orange,
      cterm = nil,
      highlight = "Search",
    },
    Error = {
      text = { "-", "=" },
      priority = 1,
      color = colors.error,
      cterm = nil,
      highlight = "DiagnosticVirtualTextError",
    },
    Warn = {
      text = { "-", "=" },
      priority = 2,
      color = colors.warning,
      cterm = nil,
      highlight = "DiagnosticVirtualTextWarn",
    },
    Info = {
      text = { "-", "=" },
      priority = 3,
      color = colors.info,
      cterm = nil,
      highlight = "DiagnosticVirtualTextInfo",
    },
    Hint = {
      text = { "-", "=" },
      priority = 4,
      color = colors.hint,
      cterm = nil,
      highlight = "DiagnosticVirtualTextHint",
    },
    Misc = {
      text = { "-", "=" },
      priority = 5,
      color = colors.purple,
      cterm = nil,
      highlight = "Normal",
    },
  },
  excluded_buftypes = {
    "terminal",
  },
  excluded_filetypes = {
    "prompt",
    "TelescopePrompt",
    "noice",
  },
  autocmd = {
    render = {
      "BufWinEnter",
      "TabEnter",
      "TermEnter",
      "WinEnter",
      "CmdwinLeave",
      "TextChanged",
      "VimResized",
      "WinScrolled",
    },
    clear = {
      "BufWinLeave",
      "TabLeave",
      "TermLeave",
      "WinLeave",
    },
  },
  handlers = {
    diagnostic = true,
    search = false, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
  },
})

--[[ require("scrollbar.handlers").register(name, handler_function) ]]
--[[ require("scrollbar.handlers").register("my_marks", function(bufnr) ]]
--[[     return { ]]
--[[         { line = 0 }, ]]
--[[         { line = 1, text = "x", type = "Warn" }, ]]
--[[         { line = 2, type = "Error" } ]]
--[[     } ]]
--[[ end) ]]
