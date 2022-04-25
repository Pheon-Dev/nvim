-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
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
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local my_colors = {n = "#7aa2f7", i = "#bd93f9", c = "#10e070", v = "#c66bfe", V="#966bfe", R="#f62bfe"}

ins_left {
  function()
    return '▊'
  end,
  color = function()
    -- auto change color according to neovims mode
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
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  -- 'mode',
  function()
    return ' 🎲'
  end,
  color = function()
    -- auto change color according to neovims mode
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
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
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
  function()
    return "%f"
  end,
  color = { fg = my_colors.v, gui = 'bold' },
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
  'filetype',
  cond = conditions.buffer_not_empty,
  color = { fg = my_colors.v, gui = 'bold' },
}

ins_right {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
  color = function()
    -- auto change color according to neovims mode
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
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_right { 'location',
  color = function()
    -- auto change color according to neovims mode
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
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_right { 'progress',
  color = function()
    -- auto change color according to neovims mode
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
    return { fg = mode_color[vim.fn.mode()] }
  end,
}

ins_right {
  function()
    return '▊'
  end,
  color = function()
    -- auto change color according to neovims mode
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
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
