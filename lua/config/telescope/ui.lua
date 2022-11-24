local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)

local purple0 = '#777777'
local purple1 = '#44475a'
local purple2 = '#282a36'
local purple3 = '#282a36'
local bg = '#21222c'
local red1 = '#ff5555'
local green1 = '#50fa7b'
local blue2 = '#bd93f9'

----------------------------------------------------------------------
--                              Prompt                              --
----------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {
  fg = purple3,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {
  fg = blue2,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {
  fg = bg,
  bg = blue2,
})

vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {
  fg = blue2,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
  fg = blue2,
  bg = purple3,
})

----------------------------------------------------------------------
--                              Result                              --
----------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {
  fg = purple3,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', {
  fg = normal_hl.foreground,
  bg = purple2,
})

vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {
  --[[ fg = normal_hl.foreground, ]]
  fg = bg,
  bg = green1,
})

vim.api.nvim_set_hl(0, 'TelescopeSelection', {
  fg = vim.api.nvim_get_hl_by_name('TelescopeSelection', true).foreground,
  bg = purple1,
})

vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', {
  fg = purple0,
  bg = purple1,
})

----------------------------------------------------------------------
--                             Preview                              --
----------------------------------------------------------------------

vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {
  fg = purple1,
  bg = purple1,
})

vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', {
  fg = normal_hl.foreground,
  bg = purple1,
})

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {
  fg = bg,
  bg = red1,
})

vim.api.nvim_set_hl(0, 'TelescopePreviewLine', {
  fg = normal_hl.foreground,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopePreviewMatch', {
  fg = normal_hl.foreground,
  bg = purple1,
})

--[[ TelescopeSelection ]]
--[[ TelescopeSelectionCaret ]]
--[[ TelescopeMultiSelection ]]
--[[ TelescopeMultiIcon ]]
--[[]]
--[[ -- "Normal" in the floating windows created by telescope. ]]
--[[ TelescopeNormal ]]
--[[ TelescopePreviewNormal ]]
--[[ TelescopePromptNormal ]]
--[[ TelescopeResultsNormal ]]
--[[]]
--[[ -- Border highlight groups. ]]
--[[ --   Use TelescopeBorder to override the default. ]]
--[[ --   Otherwise set them specifically ]]
--[[ TelescopeBorder ]]
--[[ TelescopePromptBorder ]]
--[[ TelescopeResultsBorder ]]
--[[ TelescopePreviewBorder ]]
--[[]]
--[[ -- Title highlight groups. ]]
--[[ --   Use TelescopeTitle to override the default. ]]
--[[ --   Otherwise set them specifically ]]
--[[ TelescopeTitle ]]
--[[ TelescopePromptTitle ]]
--[[ TelescopeResultsTitle ]]
--[[ TelescopePreviewTitle ]]
--[[]]
--[[ TelescopePromptCounter ]]
--[[]]
--[[ -- Used for highlighting characters that you match. ]]
--[[ TelescopeMatching ]]
--[[]]
--[[ -- Used for the prompt prefix ]]
--[[ TelescopePromptPrefix ]]
--[[]]
--[[ -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer) ]]
--[[ TelescopePreviewLine ]]
--[[ TelescopePreviewMatch ]]
--[[]]
--[[ TelescopePreviewPipe ]]
--[[ TelescopePreviewCharDev ]]
--[[ TelescopePreviewDirectory ]]
--[[ TelescopePreviewBlock ]]
--[[ TelescopePreviewLink ]]
--[[ TelescopePreviewSocket ]]
--[[ TelescopePreviewRead ]]
--[[ TelescopePreviewWrite ]]
--[[ TelescopePreviewExecute ]]
--[[ TelescopePreviewHyphen ]]
--[[ TelescopePreviewSticky ]]
--[[ TelescopePreviewSize ]]
--[[ TelescopePreviewUser ]]
--[[ TelescopePreviewGroup ]]
--[[ TelescopePreviewDate ]]
--[[ TelescopePreviewMessage ]]
--[[ TelescopePreviewMessageFillchar ]]
--[[]]
--[[ -- Used for Picker specific Results highlighting ]]
--[[ TelescopeResultsClass ]]
--[[ TelescopeResultsConstant ]]
--[[ TelescopeResultsField ]]
--[[ TelescopeResultsFunction ]]
--[[ TelescopeResultsMethod ]]
--[[ TelescopeResultsOperator ]]
--[[ TelescopeResultsStruct ]]
--[[ TelescopeResultsVariable ]]
--[[]]
--[[ TelescopeResultsLineNr ]]
--[[ TelescopeResultsIdentifier ]]
--[[ TelescopeResultsNumber ]]
--[[ TelescopeResultsComment ]]
--[[ TelescopeResultsSpecialComment ]]
--[[]]
--[[ -- Used for git status Results highlighting ]]
--[[ TelescopeResultsDiffChange ]]
--[[ TelescopeResultsDiffAdd ]]
--[[ TelescopeResultsDiffDelete ]]
--[[ TelescopeResultsDiffUntracked ]]
