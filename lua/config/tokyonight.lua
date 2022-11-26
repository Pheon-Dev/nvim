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
	color83 = "#8aa2f7",
	color84 = "#10f0f0",
	color85 = "#808080",
	color86 = "#a9a1e1",
	color87 = "#ec5f67",
	color88 = "#F79000",
	color89 = "#A9FF68",
	color90 = "#51afef",
	coloro1 = "#D484FF",
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
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = theme.color3 })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = theme.color83 })
--[[ vim.api.nvim_set_hl(0, "DashboardFooter", { fg = theme.color83 }) ]]
--[[ vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = theme.color83 }) ]]
--[[ vim.api.nvim_set_hl(0, "WinBar", { fg = theme.color83, bg = theme.color0 }) ]]
--[[ vim.api.nvim_set_hl(0, "WinBarNC", { fg = theme.color83, bg = theme.color0 }) ]]

--[[ Lir ]]
vim.api.nvim_set_hl(0, "LirFloatNormal", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "LirFloatCursorLine", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "LirFloatBorder", { fg = theme.color1, bg = theme.color0 })

--[[ CMP ]]
vim.api.nvim_set_hl(0, "CmpPmenu", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = theme.color3 })
vim.api.nvim_set_hl(0, "CmpBorder", { fg = theme.color1, bg = theme.color0 })
vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = theme.color2, bg = theme.color0 })

--[[ Noice ]]
vim.api.nvim_set_hl(0, "NoiceConfirm", { fg = theme.color86, bg = theme.color0 })
vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = theme.color1, bg = theme.color0 })

vim.api.nvim_set_hl(0, "NoicePopup", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = theme.color1, bg = theme.color0 })
vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = theme.color1, bg = theme.color0 })

vim.api.nvim_set_hl(0, "NoiceCmdline", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = theme.color0 })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = theme.color1, bg = theme.color0 })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = theme.color1, bg = theme.color0 })

--[[ Notify ]]
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

--[[ Blankline ]]
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = theme.color1 })
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = theme.color2 })

--[[ Fold Preview ]]
vim.api.nvim_set_hl(0, "FoldPreview", { bg = theme.color1 })
vim.api.nvim_set_hl(0, "FoldPreviewBorder", { fg = theme.color1, bg = theme.color1 })

--[[ Yanky ]]
vim.api.nvim_set_hl(0, "YankyYanked", { bg = theme.color2 })

--[[ Popup ]]
vim.api.nvim_set_hl(0, "FloatBorder", { fg = theme.color1, bg = theme.color0 })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = theme.color22, bg = theme.color0 })
