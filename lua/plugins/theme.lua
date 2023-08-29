local M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      local theme = require("core.colors")

      require("catppuccin").setup()

      vim.cmd("colorscheme catppuccin-mocha")
      -- vim.cmd("colorscheme catppuccin-macchiato")
      -- vim.cmd("colorscheme catppuccin-latte")
      -- vim.cmd("colorscheme catppuccin-frappe")

      local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)

      -- Alpha
      vim.api.nvim_set_hl(0, "AlphaKeys", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AlphaDesc", { fg = theme.color5, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AlphaIcon", { fg = theme.color5, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AlphaQuit", { fg = theme.color16, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AlphaFoot", { fg = theme.color3, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AlphaInfo", { fg = theme.color68, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AlphaLine", { fg = theme.color1, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AlphaButtons", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = theme.color0 })

      -- Float Term
      vim.api.nvim_set_hl(0, "FloatermBorder", { fg = theme.color2, bg = theme.color0 })

      vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = theme.color1 })
      vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = theme.color3 })

      vim.api.nvim_set_hl(0, "Visual", { bg = theme.color61 })
      vim.api.nvim_set_hl(0, "Search", { fg = theme.color1, bg = theme.color89 })
      -- vim.api.nvim_set_hl(0, "IncSearch", { fg = theme.color89, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "VirtColumn", { fg = theme.color1 })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = theme.color1 })
      -- vim.api.nvim_set_hl(0, "CursorLineNR", { fg = theme.color101 })
      vim.api.nvim_set_hl(0, "Title", { link = "Keyword" })
      vim.api.nvim_set_hl(0, "CursorLineNR", { link = "Title" })
      -- vim.api.nvim_set_hl(0, "Title", { fg = theme.color101, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "RustToolsInlayHints", { fg = theme.color24 })

      -- Flash
      vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = theme.color3, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "FlashMatch", { bg = theme.color0, fg = theme.color4 })
      vim.api.nvim_set_hl(0, "FlashCurrent", { bg = theme.color0, fg = theme.color4 })
      vim.api.nvim_set_hl(0, "FlashLabel", { fg = theme.color101, bg = theme.color0 })

      -- BQF
      vim.api.nvim_set_hl(0, "BqfPreviewBorder", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "BqfPreviewTitle", { fg = theme.color101, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "BqfPreviewThumb", { fg = theme.color99, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "BqfPreviewRange", { fg = theme.color0, bg = theme.color89 })

      -- Harpoon
      vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "Harpoon", { fg = theme.color3, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "HarpoonInactive", { fg = theme.color3, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "HarpoonActive", { fg = theme.color101, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = theme.color4, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { fg = theme.color3, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = theme.color0 })

      -- vim.api.nvim_set_hl(0, "HarpoonInactive", { link = "Tabline" })
      -- vim.api.nvim_set_hl(0, "HarpoonActive", { link = "TablineSel" })
      -- vim.api.nvim_set_hl(0, "HarpoonNumberActive", { link = "TablineSel" })
      -- vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { link = "Tabline" })

      -- CMP
      -- vim.api.nvim_set_hl(0, "PmenuThumb", { fg = theme.color59, bg = theme.color59 })
      vim.api.nvim_set_hl(0, "CmpPmenu", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = theme.color1 })
      vim.api.nvim_set_hl(0, "CmpBorder", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = theme.color2, bg = theme.color0 })

      -- Popup
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = theme.color0 })

      -- Noice
      vim.api.nvim_set_hl(0, "NoiceConfirm", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = theme.color2, bg = theme.color0 })

      -- vim.api.nvim_set_hl(0, "NoiceMini", { bg = theme.color3 })
      vim.api.nvim_set_hl(0, "NoicePopup", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = theme.color2, bg = theme.color0 })

      vim.api.nvim_set_hl(0, "NoiceCmdline", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = theme.color2, bg = theme.color0 })

      -- Match
      vim.api.nvim_set_hl(0, "MatchParen", { fg = theme.color99 })
      vim.api.nvim_set_hl(0, "MatchWord", { fg = theme.color100 })
      vim.api.nvim_set_hl(0, "MatchParenCur", { fg = theme.color100 })
      vim.api.nvim_set_hl(0, "MatchWordCur", { fg = theme.color100 })

      -- Illuminate
      vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = theme.color99, bg = theme.color1 })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = theme.color99, bg = theme.color1 })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { fg = theme.color89, bg = theme.color1 })

      -- Notify
      vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = theme.color1, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = theme.color1, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = theme.color1, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = theme.color1, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = theme.color1, bg = theme.color0 })

      vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = theme.color87, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = theme.color88, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = theme.color89, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = theme.color90, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = theme.color91, bg = theme.color0 })

      vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = theme.color87, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = theme.color88, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = theme.color89, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = theme.color90, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = theme.color91, bg = theme.color0 })

      vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = theme.color0 })
      vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = theme.color0 })

      -- Indent
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = theme.color24 })

      -- Yanky
      vim.api.nvim_set_hl(0, "YankyYanked", { bg = theme.color1 })
      vim.api.nvim_set_hl(0, "YankyPut", { bg = theme.color4 })

      -- Fold
      -- TODO: hover highlights
      vim.api.nvim_set_hl(0, "Folded", { bg = theme.color93, fg = theme.color26 })
      vim.api.nvim_set_hl(0, "FoldColumn", { bg = theme.color19, fg = theme.color99 })

      -- GitSigns
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = theme.color7 })
      vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = theme.color7 })
      vim.api.nvim_set_hl(0, "GitSignsAddLn", { fg = theme.color7 })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = theme.color99 })
      vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = theme.color99 })
      vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = theme.color99 })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = theme.color16 })
      vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = theme.color16 })
      vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { fg = theme.color16 })
      vim.api.nvim_set_hl(0, "Blame", { fg = theme.color3, bg = theme.color1 })
      vim.api.nvim_set_hl(0, "GitBlame", { fg = theme.color68, bg = theme.color1 })

      -- Antelope
      vim.api.nvim_set_hl(0, "AntelopeBorder", { fg = theme.color2, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AntelopeMarkLocation", { fg = theme.color4 })
      vim.api.nvim_set_hl(0, "AntelopeHandleMarkLocal", { fg = theme.color7, bg = theme.color0 })

      vim.api.nvim_set_hl(0, "AntelopeMark", { fg = theme.color23, bg = theme.color0 })
      vim.api.nvim_set_hl(0, "AntelopeHandleTabpage", { fg = theme.color7, bg = theme.color0 })

      -- Mason
      vim.api.nvim_set_hl(0, "MasonNormal", { bg = theme.color0 })

      -- Lazy
      vim.api.nvim_set_hl(0, "LazyNormal", { bg = theme.color0 })
      -- vim.api.nvim_set_hl(0, "LazyButtonActive", { bg = theme.color0, fg = theme.color89 })
      -- vim.api.nvim_set_hl(0, "LazyProgressDone", { bg = theme.color0, fg = theme.color89 })
      -- vim.api.nvim_set_hl(0, "LazyProgressTodo", { bg = theme.color0, fg = theme.color89 })
    end,
  },
}
return M
