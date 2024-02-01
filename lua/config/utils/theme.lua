local M = {}

M.name = "catppuccin"

M.lazy = false

M.priority = 1000

M.config = function()
  local theme = require("core.colors")

  require("catppuccin").setup({})

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

  vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = theme.color1 })
  vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = theme.color3 })

  vim.api.nvim_set_hl(0, "Visual", { bg = theme.color61 })
  vim.api.nvim_set_hl(0, "Search", { fg = theme.color1, bg = theme.color89 })
  -- vim.api.nvim_set_hl(0, "IncSearch", { fg = theme.color89, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "VirtColumn", { fg = theme.color1 })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = theme.color1 })
  vim.api.nvim_set_hl(0, "CursorLineNR", { fg = theme.color20 })
  vim.api.nvim_set_hl(0, "Title", { link = "Keyword" })
  -- vim.api.nvim_set_hl(0, "CursorLineNR", { link = "Title" })
  -- vim.api.nvim_set_hl(0, "Title", { fg = theme.color101, bg = theme.color0 })

  -- CMP
  -- vim.api.nvim_set_hl(0, "PmenuThumb", { fg = theme.color59, bg = theme.color59 })
  vim.api.nvim_set_hl(0, "CmpPmenu", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = theme.color1 })
  vim.api.nvim_set_hl(0, "CmpBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = theme.color2, bg = theme.color0 })

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
