--[[ require("tokyonight").setup() ]]
vim.g.style = "storm" -- night, day, night, moon
vim.o.background = "dark"
--[[ vim.g.tokyonight_transparent = true ]]

local theme = {
	color29 = "#565656",
	color85 = "#808080",
	color92 = "#d8d8d8",
	color63 = "#1e2030",
	color57 = "#1f2335",
	color0 = "#21222c",
	color64 = "#222436",
	color58 = "#24283b",
	color1 = "#282a36",
	color93 = "#2a2e40",
	color94 = "#292a30",
	color59 = "#292e42",
	color65 = "#2f334d",
	color95 = "#332e55",
	color96 = "#103234",
	color97 = "#404254",
	color61 = "#3b4261",
	color60 = "#414868",
	color66 = "#444a73",
	color2 = "#44475a",
	color24 = "#545c7e",
	color36 = "#394b70",
	color28 = "#565f89",
	color68 = "#828bb8",
	color69 = "#7a88cf",
	color26 = "#737aa2",
	color3 = "#6272a4",
	color62 = "#3d59a1",
	color70 = "#3e68d7",
	color67 = "#c8d3f5",
	color22 = "#c0caf5",
	color23 = "#a9b1d6",
	color98 = "#e0d8f4",
	color21 = "#f8f8f2",
	color83 = "#8aa2f7",
	color71 = "#82aaff",
	color72 = "#86e1fc",
	color73 = "#65bcff",
	color79 = "#41a6b5",
	color90 = "#51afef",
	color55 = "#536c9e",
	color38 = "#1098f8",
	color19 = "#8be9fd",
	color47 = "#41a6b5",
	color84 = "#10f0f0",
	color18 = "#26d7fd",
	color6 = "#8be9fd",
	color32 = "#2ac3de",
	color30 = "#7dcfff",
	color31 = "#6790eb",
	color33 = "#0db9d7",
	color34 = "#89ddff",
	color35 = "#b4f9f8",
	color37 = "#7aa2f7",
	color20 = "#b1f0fd",
	color54 = "#266d6a",
	color51 = "#1abc9c",
	color12 = "#96faaf",
	color7 = "#50fa7b",
	color13 = "#0dfa49",
	color17 = "#59b690",
	color48 = "#62ff00",
	color49 = "#73daca",
	color50 = "#9ece6a",
	color80 = "#4fd6be",
	color78 = "#c3e88d",
	color89 = "#A9FF68",
	color25 = "#c678dd",
	color5 = "#bd93f9",
	color8 = "#ffa6d9",
	color4 = "#ff33a8",
	color15 = "#ff79c6",
	color14 = "#8c42ab",
	color27 = "#ff8fff",
	color39 = "#bb9af7",
	color40 = "#ff007c",
	color74 = "#fca7ea",
	color75 = "#c099ff",
	color91 = "#D484FF",
	color86 = "#a9a1e1",
	color41 = "#c66bfe",
	color42 = "#9d7cd8",
	color43 = "#c34bfe",
	color44 = "#ff9e64",
	color9 = "#ffd4a6",
	color10 = "#ffb86c",
	color11 = "#ff9c33",
	color77 = "#ffc777",
	color88 = "#F79000",
	color45 = "#f1fa8c",
	color46 = "#e0af68",
	color76 = "#ff966c",
	color52 = "#db4b4b",
	color16 = "#ff5555",
	color81 = "#ff757f",
	color82 = "#c53b53",
	color87 = "#ec5f67",
	color53 = "#f7768e",
	color56 = "#b2555b",
}

require("tokyonight.colors").default = {
	none = "NONE",
	bg_dark = theme.color0,
	bg = theme.color0,
	bg_highlight = theme.color1,
	terminal_black = theme.color0,
	fg = theme.color22,
	fg_dark = theme.color23,
	fg_gutter = theme.color2,
	dark3 = theme.color2,
	comment = theme.color3,
	dark5 = theme.color3,
	blue0 = theme.color29,
	blue = theme.color5,
	cyan = theme.color30,
	blue1 = theme.color32,
	blue2 = theme.color33,
	blue5 = theme.color34,
	blue6 = theme.color35,
	blue7 = theme.color36,
	magenta = theme.color39,
	magenta2 = theme.color40,
	purple = theme.color43,
	orange = theme.color10,
	yellow = theme.color45,
	green = theme.color7,
	green1 = theme.color37,
	green2 = theme.color47,
	teal = theme.color51,
	red = theme.color16,
	red1 = theme.color52,
	git = {
		add = theme.color54,
		change = theme.color55,
		delete = theme.color56,
	},
	gitSigns = {
		add = theme.color54,
		change = theme.color55,
		delete = theme.color56,
	},
}

vim.cmd("colorscheme tokyonight")

vim.api.nvim_set_hl(0, "Visual", { bg = theme.color2 })
--[[ vim.api.nvim_set_hl(0, "Cursor", { bg = theme.color74 }) ]]
vim.api.nvim_set_hl(0, "IncSearch", { fg = theme.color0, bg = theme.color25 })

--[[ Dashboard ]]
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = theme.color3 })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = theme.color83 })
--[[ vim.api.nvim_set_hl(0, "DashboardFooter", { fg = theme.color83 }) ]]
--[[ vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = theme.color83 }) ]]
--[[ vim.api.nvim_set_hl(0, "WinBar", { fg = theme.color83, bg = theme.color0 }) ]]
--[[ vim.api.nvim_set_hl(0, "WinBarNC", { fg = theme.color83, bg = theme.color0 }) ]]

--[[ Lir ]]
vim.api.nvim_set_hl(0, "LirFloatNormal", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "LirFloatCursorLine", { bg = theme.color2 })
vim.api.nvim_set_hl(0, "LirFloatBorder", { fg = theme.color1, bg = theme.color1 })

--[[ Harpoon ]]
vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = theme.color1, bg = theme.color1 })
vim.api.nvim_set_hl(0, "Harpoon", { fg = theme.color3, bg = theme.color0 })
--[[ vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = theme.color4, bg = theme.color8 }) ]]

--[[ CMP ]]
--[[ vim.api.nvim_set_hl(0, "PmenuThumb", { fg = theme.color59, bg = theme.color59 }) ]]
vim.api.nvim_set_hl(0, "Blame", { fg = theme.color3, bg = theme.color1 })
vim.api.nvim_set_hl(0, "CmpPmenu", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "CmpBorder", { fg = theme.color2, bg = theme.color0 })
vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = theme.color2, bg = theme.color0 })

--[[ Noice ]]
vim.api.nvim_set_hl(0, "NoiceConfirm", { bg = theme.color2 })
vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = theme.color2, bg = theme.color2 })

vim.api.nvim_set_hl(0, "NoicePopup", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = theme.color93, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = theme.color93, bg = theme.color93 })

vim.api.nvim_set_hl(0, "NoiceCmdline", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = theme.color93, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = theme.color93, bg = theme.color93 })

--[[ Matchup ]]
--[[ vim.api.nvim_set_hl(0, "MatchParen", { fg = theme.color89 }) ]]
--[[ vim.api.nvim_set_hl(0, "MatchWord", { fg = theme.color89 }) ]]
--[[ vim.api.nvim_set_hl(0, "MatchParenCur", { fg = theme.color89 }) ]]
--[[ vim.api.nvim_set_hl(0, "MatchWordCur", { fg = theme.color89 }) ]]

--[[ Notify ]]
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = theme.color93, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = theme.color93, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = theme.color93, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = theme.color93, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = theme.color93, bg = theme.color93 })

vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = theme.color87, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = theme.color88, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = theme.color89, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = theme.color90, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = theme.color91, bg = theme.color93 })

vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = theme.color87, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = theme.color88, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = theme.color89, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = theme.color90, bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = theme.color91, bg = theme.color93 })

vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = theme.color93 })

--[[ Blankline ]]
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = theme.color1 })
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = theme.color2 })

--[[ Yanky ]]
vim.api.nvim_set_hl(0, "YankyYanked", { bg = theme.color2 })

--[[ Popup ]]
vim.api.nvim_set_hl(0, "FloatBorder", { fg = theme.color1, bg = theme.color1 })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = theme.color1 })

--[[ Fold ]]
vim.api.nvim_set_hl(0, "Folded", { bg = theme.color93 })

--[[ Reach ]]
vim.api.nvim_set_hl(0, "ReachBorder", { fg = theme.color2, bg = theme.color0 })
vim.api.nvim_set_hl(0, "ReachMarkLocation", { fg = theme.color4 })
vim.api.nvim_set_hl(0, "ReachHandleMarkLocal", { fg = theme.color7, bg = theme.color0 })

vim.api.nvim_set_hl(0, "ReachMark", { fg = theme.color23, bg = theme.color0 })

--[[ vim.api.nvim_set_hl(0, "ReachCurrent", { bg = theme.color42 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachMatchExact", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vij.api.nvim_set_hl(0, "ReachPriority", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachDirectory", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachModifiedIndicator", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachHandleBuffer", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachHandleDelete", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachHandleSplit", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachTail", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachHandleMarkGlobal", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachHandleTabpage", { fg = theme.color1, bg = theme.color1 }) ]]
--[[ vim.api.nvim_set_hl(0, "ReachGrayOut", { fg = theme.color1, bg = theme.color1 }) ]]

--[[ ReachBorder             -> 'Comment' ]]
--[[ ReachDirectory          -> 'Directory' ]]
--[[ ReachModifiedIndicator  -> 'String' ]]
--[[ ReachHandleBuffer       -> 'String' ]]
--[[ ReachHandleDelete       -> 'Error' ]]
--[[ ReachHandleSplit        -> 'Directory' ]]
--[[ ReachTail               -> 'Normal' ]]
--[[ ReachHandleMarkLocal    -> 'Type' ]]
--[[ ReachHandleMarkGlobal   -> 'Number' ]]
--[[ ReachMark               -> 'Normal' ]]
--[[ ReachMarkLocation       -> 'Comment' ]]
--[[ ReachHandleTabpage      -> 'TabLineSel' ]]
--[[ ReachGrayOut            -> 'Comment' ]]
--[[ ReachMatchExact         -> 'String' ]]
--[[ ReachPriority           -> 'Special' ]]
--[[ ReachCurrent            -> 'Title' ]]

--[[ Virt-Column ]]
vim.api.nvim_set_hl(0, "ColorColumn", { bg = theme.color1 })

--[[ Glances ]]
vim.api.nvim_set_hl(0, "GlancePreviewNormal", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "GlancePreviewMatch", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "GlancePreviewCursorLine", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "GlancePreviewSignColumn", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "GlancePreviewEndOfBuffer", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "GlancePreviewLineNr", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "GlancePreviewBorderBottom", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { fg = theme.color27, bg = theme.color93 })
vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "GlanceListNormal", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "GlanceListFilename", { fg = theme.color89 })
vim.api.nvim_set_hl(0, "GlanceListFilepath", { fg = theme.color5 })
vim.api.nvim_set_hl(0, "GlanceListCount", { fg = theme.color7 })
vim.api.nvim_set_hl(0, "GlanceListMatch", { fg = theme.color25 })
vim.api.nvim_set_hl(0, "GlanceListCursorLine", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "GlanceListEndOfBuffer", { bg = theme.color93 })
vim.api.nvim_set_hl(0, "GlanceListBorderBottom", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "GlanceFoldIcon", { fg = theme.color69 })
--[[ vim.api.nvim_set_hl(0, "GlanceIndent", { bg = theme.color93 }) ]]
vim.api.nvim_set_hl(0, "GlanceBorderTop", { bg = theme.color0 })

--[[ Navigator ]]
--[[ vim.api.nvim_set_hl(0, "GuihuaTextViewDark ", { fg = theme.color98, bg = theme.color95 }) ]]
--[[ vim.api.nvim_set_hl(0, "GuihuaListDark ", { fg = theme.color98, bg = theme.color61 }) ]]
--[[ vim.api.nvim_set_hl(0, "GuihuaListHl ", { fg = theme.color98, bg = theme.color97 }) ]]

--[[ bqf ]]
--[[ vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { fg = theme.color27, bg = theme.color93 }) ]]
vim.api.nvim_set_hl(0, "BqfPreviewFloat", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "BqfPreviewBorder", { fg = theme.color1, bg = theme.color1 })
--[[ vim.api.nvim_set_hl(0, "BqfPreviewCursor", { fg = theme.color27, bg = theme.color93 }) ]]
--[[ vim.api.nvim_set_hl(0, "BqfPreviewRange", { fg = theme.color27, bg = theme.color93 }) ]]
--[[ vim.api.nvim_set_hl(0, "BqfPreviewCountLabel", { fg = theme.color27, bg = theme.color93 }) ]]
--[[ vim.api.nvim_set_hl(0, "BqfSign", { fg = theme.color27, bg = theme.color93 }) ]]
