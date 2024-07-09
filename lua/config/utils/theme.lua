local M = {}

M.name = "catppuccin"

M.lazy = false

M.priority = 1000

M.config = function()
  local theme = require("core.colors")

  require("catppuccin").setup({
    integrations = {
      cmp = true,
      gitsigns = true,
      ufo = true,
      treesitter = true,
      noice = false,
      lsp_saga = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      illuminate = {
        enabled = true,
        lsp = false,
      },
    },
  })

  -- setup must be called before loading
  vim.cmd.colorscheme("catppuccin-mocha")

  -- local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)
  vim.api.nvim_set_hl(0, "WinBar", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "WinBarNC", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "SagaWinbarSep", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "SagaWinbarFolder", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "SagaWinbarFileName", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "SagaWinbarFolderName", { bg = theme.color0 })

  -- Eyeliner
  -- vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = true, underline = true })
  -- vim.api.nvim_set_hl(0, 'EyelinerSecondary', { underline = true })

  -- Float Term
  vim.api.nvim_set_hl(0, "FloatermBorder", { fg = theme.color2, bg = theme.color0 })

  vim.api.nvim_set_hl(0, "WinSeparator", {
    fg = theme.color2,
    bg = theme.color0,
  })

  vim.api.nvim_set_hl(0, "StatusLineNC", {
    fg = theme.color2,
    bg = theme.color0,
  })

  --[[ vim.api.nvim_set_hl(0, "StatusLine", {
    fg = theme.color2,
    bg = theme.color0,
  }) ]]

  -- GitSigns

  vim.api.nvim_set_hl(0, "GitSignsAddLnInline", { fg = theme.colour7 })
  vim.api.nvim_set_hl(0, "GitSignsChangeLnInline", { fg = theme.color99 })
  vim.api.nvim_set_hl(0, "GitSignsDeleteLnInline", { fg = theme.color16 })
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = theme.color7 })
  vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = theme.color7 })
  vim.api.nvim_set_hl(0, "GitSignsAddLn", { fg = theme.color7 })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = theme.color99 })
  vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = theme.color99 })
  vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = theme.color99 })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = theme.color16 })
  vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = theme.color16 })
  vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { fg = theme.color16 })
  -- vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = theme.color05, bg = theme.color1 })
  vim.api.nvim_set_hl(0, "GitBlame", { fg = theme.color68, bg = theme.color101 })
  vim.api.nvim_set_hl(0, "CustomContextVt", { link = "Comment" })
  vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })

  vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = theme.color1 })
  vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = theme.color3 })

  vim.api.nvim_set_hl(0, "Visual", { bg = theme.color61 })
  vim.api.nvim_set_hl(0, "Search", { fg = theme.color1, bg = theme.color89 })
  -- vim.api.nvim_set_hl(0, "IncSearch", { fg = theme.color89, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "VirtColumn", { fg = theme.color1 })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "CursorLineNR", { fg = theme.color20 })
  vim.api.nvim_set_hl(0, "Title", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "CursorLineNR", { link = "Comment" })
  -- vim.api.nvim_set_hl(0, "Title", { fg = theme.color101, bg = theme.color0 })

  -- CMP
  vim.api.nvim_set_hl(0, "CmpPmenu", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = theme.color1 })
  vim.api.nvim_set_hl(0, "CmpBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = theme.color2, bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "Pmenu", { bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "PmenuExtra", { fg = theme.color2, bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "PmenuKind", { fg = theme.color2, bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = theme.color2, bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = theme.color2, bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "PmenuSbar", { fg = theme.color89, bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "PmenuThumb", { fg = theme.color99, bg = theme.color1 })

  -- Popup
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = theme.color0 })

  -- Match
  vim.api.nvim_set_hl(0, "MatchParen", { fg = theme.color99 })
  vim.api.nvim_set_hl(0, "MatchWord", { fg = theme.color100 })
  vim.api.nvim_set_hl(0, "MatchParenCur", { fg = theme.color100 })
  vim.api.nvim_set_hl(0, "MatchWordCur", { fg = theme.color100 })

  -- Indent
  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = theme.color24 })

  -- Mason
  vim.api.nvim_set_hl(0, "MasonNormal", { bg = theme.color0 })

  -- Lazy
  vim.api.nvim_set_hl(0, "LazyNormal", { bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "LazyButtonActive", { bg = theme.color0, fg = theme.color89 })
  -- vim.api.nvim_set_hl(0, "LazyProgressDone", { bg = theme.color0, fg = theme.color89 })
  -- vim.api.nvim_set_hl(0, "LazyProgressTodo", { bg = theme.color0, fg = theme.color89 })
end

return M
