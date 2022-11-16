local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify("Lualine didn't load properly!", "error")
end

local oc, navic = pcall(require, "nvim-navic")

if not oc then
  vim.notify("Navic didn't load properly!", "error")
end

local colors = {
  bg = "#2e2e2e",
  bg1 = "#363636",
  grey = "#7f7f7f",
  fg = "#8aa2f7",
  yellow = '#ffff0f',
  cyan = "#008080",
  darkblue = "#081633",
  green = "#82cf00",
  green1 = "#A9FF68",
  orange2 = "#c03000",
  orange1 = "#ff7222",
  orange3 = "#ff9e64",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
  purple = "#6272a4",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    icons_enabled = true,
    globalstatus = true,
    component_separators = "",
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  statusline = {},
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
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

local function wins_left(component)
  table.insert(config.winbar.lualine_c, component)
  table.insert(config.inactive_winbar.lualine_c, component)
end

local function wins_right(component)
  table.insert(config.winbar.lualine_x, component)
  table.insert(config.inactive_winbar.lualine_x, component)
end

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local my_colors = { n = "#7aa2f7", i = "#bd93f9", c = "#10e070", v = "#c66bfe", V = "#966bfe", R = "#f62bfe" }

local mode = {
  n = "",
  i = "●",
  ic = "●",
  v = "◌",
  V = "◌",
  [""] = "◌",
  s = "",
  S = "",
  [""] = "",
  r = "∅",
  R = "∅",
  Rv = "∅",
  rm = "∅",
  ["r?"] = "∅",
  c = "○",
  cv = "○",
  ce = "○",
  t = "○",
  ["!"] = "○",
  no = "✪",
  gui = "",
}

local mode_color = {
  n = my_colors.n,
  i = my_colors.i,
  v = my_colors.v,
  [""] = colors.magenta,
  V = my_colors.V,
  c = my_colors.c,
  no = my_colors.n,
  s = colors.violet,
  S = colors.violet,
  [""] = colors.violet,
  ic = colors.blue,
  R = my_colors.R,
  Rv = my_colors.R,
  cv = colors.green,
  ce = colors.green,
  r = colors.magenta,
  rm = colors.magenta,
  ["r?"] = colors.magenta,
  ["!"] = colors.green,
  t = colors.green,
  gui = "bold",
}

--[[ WINBAR ]]
wins_left({
  function()
    return mode[vim.fn.mode()]
  end,
  color = function()
    return { fg = colors.orange1 }
  end,
  padding = { right = 1, left = 3 },
})

wins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
  path = 1,
})

wins_left({
  function()
    return "%="
  end,
})

wins_right({
  "filesize",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.purple },
})

wins_right({
  "location",
  color = { fg = colors.purple },
})

wins_right({
  "progress",
  color = { fg = colors.purple },
})

--[[ STATUSLINE ]]
ins_left({
  "filetype",
  color = function()
    return { fg = mode_color[vim.fn.mode()] }
  end,
  icon_only = false,
  icon = { align = "left" },
  padding = { right = 1, left = 3 },
})

ins_left({
  "diff",
  symbols = { added = " ", modified = "柳", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
  padding = { right = 2, left = 1 },
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
  padding = { right = 1, left = 2 },
})

ins_left({
  function()
    return "%="
  end,
})

ins_left({
  require("noice").api.statusline.mode.get,
  cond = require("noice").api.statusline.mode.has,
  color = { fg = colors.orange1 },
  padding = { right = 1, left = 1 },
})

ins_right({
  navic.get_location,
  cond = navic.is_available,
  color = { fg = colors.grey },
  padding = { right = 1 },
})

ins_right({
  "branch",
  icon = "",
  color = { fg = colors.yellow },
  padding = { right = 1, left = 1 },
})

lualine.setup(config)
