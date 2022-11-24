--[[ require("tokyonight").setup() ]]
vim.g.style = "storm" -- night, day, night, moon
vim.o.background = 'dark'
--[[ vim.g.tokyonight_transparent = true ]]

require("tokyonight.colors").default = {
  none = "NONE",
  bg_dark = "#21222c",
  bg = "#21222c",
  bg_highlight = "#282a36",
  bg_highlight1 = "#44475a",
  terminal_black = "#21222c",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#44475a",
  dark3 = "#44475a",
  dark4 = "#545c7e",
  comment = "#6272a4",
  comment1 = "#c678dd",
  comment2 = "#737aa2",
  comment3 = "#ff8fff",
  dark5 = "#6272a4",
  dark6 = "#565f89",
  blue0 = "#565656",
  cyan = "#7dcfff",
  blue = "#bd93f9",
  blues = "#6790eb",
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
  pink = "#ff79c6", --
  orange = "#ffb86c",
  orange1 = "#ff9e64",
  yellow = "#f1fa8c",
  yellow1 = "#e0af68",
  green = "#50fa7b",
  green1 = "#7aa2f7",
  green2 = "#41a6b5",
  green3 = "#62ff00",
  green4 = "#73daca",
  green5 = "#9ece6a",
  teal = "#1abc9c",
  red = "#ff5555",
  red1 = "#db4b4b",
  red2 = "#f7768e",
  git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
  gitSigns = {
    add = "#266d6a",
    change = "#536c9e",
    delete = "#b2555b",
  },
}

vim.cmd("colorscheme tokyonight")

--[[ Dashboard ]]
vim.cmd("highlight DashboardHeader guifg=#44475a ")
vim.cmd("highlight DashboardCenter guifg=#8aa2f7 ")
--[[ vim.cmd("highlight DashboardFooter guifg=#10f0f0 ") ]]
--[[ vim.cmd("highlight DashboardShortCut guifg=#62ff00 ") ]]
--[[ vim.cmd("highlight WinBar guifg=#8aa2f7 guibg=#21222c ") ]]
--[[ vim.cmd("highlight WinBarNC guifg=#808080 guibg=#21222c ") ]]

--[[ Lir ]]
vim.cmd("highlight LirFloatNormal guibg='#282a36'")
vim.cmd("highlight LirFloatCursorLine guibg='#44475a'")
vim.cmd("highlight LirFloatBorder guibg='#282a36' guifg='#282a36'")

--[[ CMP ]]
vim.cmd("highlight CmpPmenu guibg='#282a36'")
vim.cmd("highlight PmenuSel guibg='#44475a'")
vim.cmd("highlight CmpBorder guifg='#282a36' guibg='#282a36'")
vim.cmd("highlight CmpDocBorder guifg='#282a36' guibg='#21222c'")

--[[ Noice ]]
vim.cmd("highlight NoiceConfirm guifg='#a9a1e1' guibg='#282a36'")
vim.cmd("highlight NoiceConfirmBorder guifg='#282a36' guibg='#282a36'")

vim.cmd("highlight NoicePopup guibg='#282a36'")
vim.cmd("highlight NoicePopupBorder guifg='#282a36' guibg='#282a36'")
vim.cmd("highlight NoicePopupmenuBorder guifg='#282a36' guibg='#282a36'")

vim.cmd("highlight NoiceCmdline guibg='#282a36'")
vim.cmd("highlight NoiceCmdlinePopup guibg='#282a36'")
vim.cmd("highlight NoiceCmdlinePopupBorder guifg='#282a36' guibg='#282a36'")
vim.cmd("highlight NoiceCmdlinePopupBorderSearch guifg='#282a36' guibg='#282a36'")

--[[ Notify ]]
vim.cmd("highlight NotifyERRORBorder guifg=#282a36 guibg=#282a36")
vim.cmd("highlight NotifyWARNBorder guifg=#282a36 guibg=#282a36")
vim.cmd("highlight NotifyINFOBorder guifg=#282a36 guibg=#282a36")
vim.cmd("highlight NotifyDEBUGBorder guifg=#282a36 guibg=#282a36")
vim.cmd("highlight NotifyTRACEBorder guifg=#282a36 guibg=#282a36")

vim.cmd("highlight NotifyERRORIcon guifg=#ec5f67 guibg=#282a36")
vim.cmd("highlight NotifyWARNIcon guifg=#F79000 guibg=#282a36")
vim.cmd("highlight NotifyINFOIcon guifg=#A9FF68 guibg=#282a36")
vim.cmd("highlight NotifyDEBUGIcon guifg=#51afef guibg=#282a36")
vim.cmd("highlight NotifyTRACEIcon guifg=#D484FF guibg=#282a36")

vim.cmd("highlight NotifyERRORTitle guifg=#ec5f67 guibg=#282a36")
vim.cmd("highlight NotifyWARNTitle guifg=#F79000 guibg=#282a36")
vim.cmd("highlight NotifyINFOTitle guifg=#A9FF68 guibg=#282a36")
vim.cmd("highlight NotifyDEBUGTitle guifg=#51afef guibg=#282a36")
vim.cmd("highlight NotifyTRACETitle guifg=#D484FF guibg=#282a36")

vim.cmd("highlight NotifyERRORBody guibg=#282a36")
vim.cmd("highlight NotifyWARNBody guibg=#282a36")
vim.cmd("highlight NotifyINFOBody guibg=#282a36")
vim.cmd("highlight NotifyDEBUGBody guibg=#282a36")
vim.cmd("highlight NotifyTRACEBody guibg=#282a36")

--[[ Blankline ]]
vim.cmd("highlight IndentBlanklineChar guifg='#282a36'")
vim.cmd("highlight IndentBlanklineContextChar guifg='#44475a'")

--[[ Fold Preview ]]
vim.cmd("highlight FoldPreview guibg='#282a36'")
vim.cmd("highlight FoldPreviewBorder guibg='#282a36'")

--[[ Yanky ]]
vim.cmd("highlight YankyYanked guibg='#44475a'")

--[[ Popup ]]
vim.cmd("highlight FloatBorder guifg='#44475a' guibg='#44475a'")
vim.cmd("highlight NormalFloat guifg='#c0caf5' guibg='#44475a'")
