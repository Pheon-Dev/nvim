local lualine = require('lualine')

local colors = {
  bg       = '#2e2e2e',
  fg       = '#8aa2f7',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#82cf00',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  purple   = '#6272a4',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    icons_enabled = true,
    globalstatus = true,
    component_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local my_colors = { n = "#7aa2f7", i = "#bd93f9", c = "#10e070", v = "#c66bfe", V = "#966bfe", R = "#f62bfe" }

local mode_color = {
  n = my_colors.n,
  i = my_colors.i,
  v = my_colors.v,
  [''] = colors.magenta,
  V = my_colors.V,
  c = my_colors.c,
  no = my_colors.n,
  s = colors.violet,
  S = colors.violet,
  [''] = colors.violet,
  ic = colors.blue,
  R = my_colors.R,
  Rv = my_colors.R,
  cv = colors.green,
  ce = colors.green,
  r = colors.magenta,
  rm = colors.magenta,
  ['r?'] = colors.magenta,
  ['!'] = colors.green,
  t = colors.green,
  gui = 'bold',
}

ins_left {
  function()
    --[[ return '▊' ]]
    return '|'
  end,
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 0, right = 1 },
}

--[[ ins_left { ]]
--[[   function() ]]
--[[     return 'DE' ]]
--[[   end, ]]
--[[   color = function() ]]
--[[     return { fg = mode_color[vim.fn.mode()] } ]]
--[[   end, ]]
--[[   padding = { left = 1, right = 1 }, ]]
--[[ } ]]

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_left {
  'diff',
  symbols = { added = ' ', modified = '柳', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_left {
  function()
    return '%='
  end,
}

ins_left {
  'filetype',
  cond = conditions.buffer_not_empty,
  icon_only = true,
  color = { fg = my_colors.v, gui = 'bold' },
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = my_colors.v, gui = 'bold' },
  path = 1,
}

ins_right {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

ins_right {
  'filesize',
  cond = conditions.buffer_not_empty,
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_right { 'location',
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_right { 'progress',
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_right {
  'mode',
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 1, right = 1 },
}

ins_right {
  function()
    --[[ return '▊' ]]
    return '|'
  end,
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 1 },
}

lualine.setup(config)

vim.o.winbar = "%{%v:lua.require('config.winbar').eval()%}%=%{%v:lua.require'nvim-navic'.get_location()%}"
