--[[ require("tokyonight").setup() ]]
vim.g.style = "storm" -- night, day, night, moon
vim.o.background = 'dark'
--[[ vim.g.tokyonight_transparent = true ]]

require("tokyonight.colors").default = {
  none = "NONE",
  bg_dark = "#2e2e2e",
  bg = "#2e2e2e",
  bg_highlight = "#363636",
  bg_highlight1 = "#464646",
  terminal_black = "#2e2e2e",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#565656",
  dark3 = "#565656",
  dark4 = "#545c7e",
  comment = "#7f7f7f",
  comment1 = "#c678dd",
  comment2 = "#737aa2",
  comment3 = "#ff8fff",
  dark5 = "#7f7f7f",
  dark6 = "#565f89",
  blue0 = "#565656",
  blue = "#6790eb",
  cyan = "#7dcfff",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8",
  blue7 = "#394b70",
  blue8 = "#7aa2f7",
  blue9 = "#1098f8",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  purple = "#c66bfe",
  purple1 = "#9d7cd8",
  purple2 = "#bd93f9",
  purple3 = "#c34bfe", --
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#9ece6a",
  green1 = "#7aa2f7",
  green2 = "#41a6b5",
  green3 = "#62ff00",
  green4 = "#73daca",
  teal = "#1abc9c",
  red = "#f7768e",
  red1 = "#db4b4b",
  git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
  gitSigns = {
    add = "#266d6a",
    change = "#536c9e",
    delete = "#b2555b",
  },
}

vim.cmd("colorscheme tokyonight")

--[[ Dashboard ]]
vim.cmd("highlight DashboardHeader guifg=#1080f0 ")
vim.cmd("highlight DashboardCenter guifg=#10a0f0 ")
vim.cmd("highlight DashboardFooter guifg=#10f0f0 ")
vim.cmd("highlight DashboardShortCut guifg=#10f030 ")
--[[ vim.cmd("highlight WinBar guifg=#8aa2f7 guibg=#2e2e2e ") ]]
--[[ vim.cmd("highlight WinBarNC guifg=#808080 guibg=#2e2e2e ") ]]

--[[ Lir ]]
vim.cmd("highlight LirFloatNormal guibg='#333333'")
vim.cmd("highlight LirFloatCursorLine guibg='#3f3f3f'")
vim.cmd("highlight LirFloatBorder guibg='#333333' guifg='#333333'")

--[[ CMP ]]
vim.cmd("highlight CmpPmenu guibg='#363636'")
vim.cmd("highlight PmenuSel guibg='#5e5e5e'")
vim.cmd("highlight CmpBorder guifg='#363636' guibg='#363636'")
vim.cmd("highlight CmpDocBorder guifg='#363636' guibg='#2e2e2e'")

--[[ Noice ]]
vim.cmd("highlight NoiceConfirm guifg='#7f7f7f' guibg='#363636'")
vim.cmd("highlight NoiceConfirmBorder guifg='#363636' guibg='#363636'")

vim.cmd("highlight NoicePopup guibg='#363636'")
vim.cmd("highlight NoicePopupBorder guifg='#363636' guibg='#363636'")
vim.cmd("highlight NoicePopupmenuBorder guifg='#363636' guibg='#363636'")

vim.cmd("highlight NoiceCmdline guibg='#363636'")
vim.cmd("highlight NoiceCmdlinePopup guibg='#363636'")
vim.cmd("highlight NoiceCmdlinePopupBorder guifg='#363636' guibg='#363636'")
vim.cmd("highlight NoiceCmdlinePopupBorderSearch guifg='#363636' guibg='#363636'")

--[[ Notify ]]
vim.cmd("highlight NotifyERRORBorder guifg=#3f3f3f guibg=#3f3f3f")
vim.cmd("highlight NotifyWARNBorder guifg=#3f3f3f guibg=#3f3f3f")
vim.cmd("highlight NotifyINFOBorder guifg=#3f3f3f guibg=#3f3f3f")
vim.cmd("highlight NotifyDEBUGBorder guifg=#3f3f3f guibg=#3f3f3f")
vim.cmd("highlight NotifyTRACEBorder guifg=#3f3f3f guibg=#3f3f3f")

vim.cmd("highlight NotifyERRORIcon guifg=#ec5f67 guibg=#3f3f3f")
vim.cmd("highlight NotifyWARNIcon guifg=#F79000 guibg=#3f3f3f")
vim.cmd("highlight NotifyINFOIcon guifg=#A9FF68 guibg=#3f3f3f")
vim.cmd("highlight NotifyDEBUGIcon guifg=#51afef guibg=#3f3f3f")
vim.cmd("highlight NotifyTRACEIcon guifg=#D484FF guibg=#3f3f3f")

vim.cmd("highlight NotifyERRORTitle guifg=#ec5f67 guibg=#3f3f3f")
vim.cmd("highlight NotifyWARNTitle guifg=#F79000 guibg=#3f3f3f")
vim.cmd("highlight NotifyINFOTitle guifg=#A9FF68 guibg=#3f3f3f")
vim.cmd("highlight NotifyDEBUGTitle guifg=#51afef guibg=#3f3f3f")
vim.cmd("highlight NotifyTRACETitle guifg=#D484FF guibg=#3f3f3f")

vim.cmd("highlight NotifyERRORBody guibg=#3f3f3f")
vim.cmd("highlight NotifyWARNBody guibg=#3f3f3f")
vim.cmd("highlight NotifyINFOBody guibg=#3f3f3f")
vim.cmd("highlight NotifyDEBUGBody guibg=#3f3f3f")
vim.cmd("highlight NotifyTRACEBody guibg=#3f3f3f")

--[[ Blankline ]]
vim.cmd("highlight IndentBlanklineChar guifg='#363636'")
vim.cmd("highlight IndentBlanklineContextChar guifg='#3f3f3f'")

--[[ Fold Preview ]]
vim.cmd("highlight FoldPreview guibg='#363636'")
vim.cmd("highlight FoldPreviewBorder guibg='#363636'")

--[[ Yanky ]]
vim.cmd("highlight YankyYanked guibg='#525252'")
