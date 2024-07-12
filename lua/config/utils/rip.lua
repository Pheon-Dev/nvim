local M = {}

M.cmd = "RipSubstitute"

M.keys = {
  {
    "<leader>r",
    function()
      require("rip-substitute").sub()
    end,
    mode = { "n", "x" },
    desc = " rip substitute",
  },
}

M.config = function()
  -- default settings
  require("rip-substitute").setup({
    popupWin = {
      title = " rip-substitute",
      border = "single",
      matchCountHlGroup = "Keyword",
      noMatchHlGroup = "ErrorMsg",
      hideSearchReplaceLabels = false,
      position = "top", -- "top"|"bottom"
    },
    prefill = {
      normal = "cursorWord", -- "cursorWord"|false
      visual = "selectionFirstLine", -- "selectionFirstLine"|false
      startInReplaceLineIfPrefill = false,
    },
    keymaps = {
      -- normal & visual mode
      confirm = "<CR>",
      abort = "q",
      prevSubst = "<Up>",
      nextSubst = "<Down>",
      insertModeConfirm = "<C-CR>", -- (except this one, obviously)
    },
    incrementalPreview = {
      matchHlGroup = "IncSearch",
      rangeBackdrop = {
        enabled = true,
        blend = 50, -- between 0 and 100
      },
    },
    regexOptions = {
      -- pcre2 enables lookarounds and backreferences, but performs slower
      pcre2 = true,
      ---@type "case-sensitive"|"ignore-case"|"smart-case"
      casing = "case-sensitive",
      -- disable if you use named capture groups (see README for details)
      autoBraceSimpleCaptureGroups = true,
    },
    editingBehavior = {
      -- Experimental. When typing `()` in the `search` line, automatically
      -- adds `$n` to the `replace` line.
      autoCaptureGroups = false,
    },
    notificationOnSuccess = true,
  })
end

return M
