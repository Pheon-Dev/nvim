local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)

local purple2 = '#464646'
local purple1 = '#363636'
local purple3 = '#363636'
local red1 = '#ec5f67'
local green1 = '#2ccf00'
local blue1 = '#6272a4'
local blue2 = '#51afef'

----------------------------------------------------------------------
--                              Prompt                              --
----------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {
  fg = purple3,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {
  fg = normal_hl.foreground,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {
  fg = normal_hl.foreground,
  bg = red1,
})

vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {
  fg = red1,
  bg = purple3,
})

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
  fg = red1,
  bg = purple3,
})

----------------------------------------------------------------------
--                              Result                              --
----------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {
  fg = purple2,
  bg = purple2,
})

vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', {
  fg = normal_hl.foreground,
  bg = purple2,
})

vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {
  fg = normal_hl.foreground,
  bg = blue1,
})

vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', {
  fg = blue1,
  bg = vim.api.nvim_get_hl_by_name('TelescopeSelection', true).background,
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
  fg = purple3,
  bg = green1,
})
