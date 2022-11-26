--[[ require("tokyonight").setup() ]]
vim.g.style = "storm" -- night, day, night, moon
vim.o.background = "dark"
--[[ vim.g.tokyonight_transparent = true ]]

local theme = {
	color0 = "#21222c",
	color1 = "#282a36",
	color2 = "#44475a",
	color3 = "#6272a4",
	color4 = "#ff33a8",
	color5 = "#bd93f9",
	color6 = "#8be9fd",
	color7 = "#50fa7b",
	color8 = "#ffa6d9",
	color9 = "#ffd4a6",
	color10 = "#ffb86c",
	color11 = "#ff9c33",
	color12 = "#96faaf",
	color13 = "#0dfa49",
	color14 = "#8c42ab",
	color15 = "#ff79c6",
	color16 = "#ff5555",
	color17 = "#59b690",
	color18 = "#26d7fd",
	color19 = "#8be9fd",
	color20 = "#b1f0fd",
	color21 = "#f8f8f2",
	color22 = "#c0caf5",
	color23 = "#a9b1d6",
	color24 = "#545c7e",
	color25 = "#c678dd",
	color26 = "#737aa2",
	color27 = "#ff8fff",
	color28 = "#565f89",
	color29 = "#565656",
	color30 = "#7dcfff",
	color31 = "#6790eb",
	color32 = "#2ac3de",
	color33 = "#0db9d7",
	color34 = "#89ddff",
	color35 = "#b4f9f8",
	color36 = "#394b70",
	color37 = "#7aa2f7",
	color38 = "#1098f8",
	color39 = "#bb9af7",
	color40 = "#ff007c",
	color41 = "#c66bfe",
	color42 = "#9d7cd8",
	color43 = "#c34bfe",
	color44 = "#ff9e64",
	color45 = "#f1fa8c",
	color46 = "#e0af68",
	color47 = "#41a6b5",
	color48 = "#62ff00",
	color49 = "#73daca",
	color50 = "#9ece6a",
	color51 = "#1abc9c",
	color52 = "#db4b4b",
	color53 = "#f7768e",
	color54 = "#266d6a",
	color55 = "#536c9e",
	color56 = "#b2555b",
	color57 = "#1f2335",
	color58 = "#24283b",
	color59 = "#292e42",
	color60 = "#414868",
	color61 = "#3b4261",
	color62 = "#3d59a1",
	color63 = "#1e2030",
	color64 = "#222436",
	color65 = "#2f334d",
	color66 = "#444a73",
	color67 = "#c8d3f5",
	color68 = "#828bb8",
	color69 = "#7a88cf",
	color70 = "#3e68d7",
	color71 = "#82aaff",
	color72 = "#86e1fc",
	color73 = "#65bcff",
	color74 = "#fca7ea",
	color75 = "#c099ff",
	color76 = "#ff966c",
	color77 = "#ffc777",
	color78 = "#c3e88d",
	color79 = "#41a6b5",
	color80 = "#4fd6be",
	color81 = "#ff757f",
	color82 = "#c53b53",
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

--[[ Dashboard ]]
vim.cmd("highlight DashboardHeader guifg=#6272a4 ")
vim.cmd("highlight DashboardCenter guifg=#8aa2f7 ")
--[[ vim.cmd("highlight DashboardFooter guifg=#10f0f0 ") ]]
--[[ vim.cmd("highlight DashboardShortCut guifg=#62ff00 ") ]]
--[[ vim.cmd("highlight WinBar guifg=#8aa2f7 guibg=#21222c ") ]]
--[[ vim.cmd("highlight WinBarNC guifg=#808080 guibg=#21222c ") ]]

--[[ Lir ]]
vim.cmd("highlight LirFloatNormal guibg='#21222c'")
vim.cmd("highlight LirFloatCursorLine guibg='#282a36'")
vim.cmd("highlight LirFloatBorder guibg='#21222c' guifg='#282a36'")

--[[ CMP ]]
vim.cmd("highlight CmpPmenu guibg='#21222c'")
vim.cmd("highlight PmenuSel guibg='#282a36'")
vim.cmd("highlight CmpBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight CmpDocBorder guifg='#44475a' guibg='#21222c'")

--[[ Noice ]]
vim.cmd("highlight NoiceConfirm guifg='#a9a1e1' guibg='#21222c'")
vim.cmd("highlight NoiceConfirmBorder guifg='#282a36' guibg='#21222c'")

vim.cmd("highlight NoicePopup guibg='#21222c'")
vim.cmd("highlight NoicePopupBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight NoicePopupmenuBorder guifg='#282a36' guibg='#21222c'")

vim.cmd("highlight NoiceCmdline guibg='#21222c'")
vim.cmd("highlight NoiceCmdlinePopup guibg='#21222c'")
vim.cmd("highlight NoiceCmdlinePopupBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight NoiceCmdlinePopupBorderSearch guifg='#282a36' guibg='#21222c'")

--[[ Notify ]]
vim.cmd("highlight NotifyERRORBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight NotifyWARNBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight NotifyINFOBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight NotifyDEBUGBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight NotifyTRACEBorder guifg='#282a36' guibg='#21222c'")

vim.cmd("highlight NotifyERRORIcon guifg='#ec5f67' guibg='#21222c'")
vim.cmd("highlight NotifyWARNIcon guifg='#F79000' guibg='#21222c'")
vim.cmd("highlight NotifyINFOIcon guifg='#A9FF68' guibg='#21222c'")
vim.cmd("highlight NotifyDEBUGIcon guifg='#51afef' guibg='#21222c'")
vim.cmd("highlight NotifyTRACEIcon guifg='#D484FF' guibg='#21222c'")

vim.cmd("highlight NotifyERRORTitle guifg='#ec5f67' guibg='#21222c'")
vim.cmd("highlight NotifyWARNTitle guifg='#F79000' guibg='#21222c'")
vim.cmd("highlight NotifyINFOTitle guifg='#A9FF68' guibg='#21222c'")
vim.cmd("highlight NotifyDEBUGTitle guifg='#51afef' guibg='#21222c'")
vim.cmd("highlight NotifyTRACETitle guifg='#D484FF' guibg='#21222c'")

vim.cmd("highlight NotifyERRORBody guibg='#21222c'")
vim.cmd("highlight NotifyWARNBody guibg='#21222c'")
vim.cmd("highlight NotifyINFOBody guibg='#21222c'")
vim.cmd("highlight NotifyDEBUGBody guibg='#21222c'")
vim.cmd("highlight NotifyTRACEBody guibg='#21222c'")

--[[ Blankline ]]
vim.cmd("highlight IndentBlanklineChar guifg='#282a36'")
vim.cmd("highlight IndentBlanklineContextChar guifg='#44475a'")

--[[ Fold Preview ]]
vim.cmd("highlight FoldPreview guibg='#282a36'")
vim.cmd("highlight FoldPreviewBorder guifg='#282a36' guibg='#282a36'")

--[[ Yanky ]]
vim.cmd("highlight YankyYanked guibg='#44475a'")

--[[ Popup ]]
vim.cmd("highlight FloatBorder guifg='#282a36' guibg='#21222c'")
vim.cmd("highlight NormalFloat guifg='#c0caf5' guibg='#21222c'")
