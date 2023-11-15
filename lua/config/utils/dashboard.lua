local M = {}

-- M.dependencies = { { 'nvim-tree/nvim-web-devicons' } }
M.dependencies = {}

M.config = function()
  local has_dashboard, dashboard = pcall(require, "dashboard")

  if not has_dashboard then return end
  dashboard.setup({
    -- theme = 'hyper',             --  theme is doom and hyper default is hyper
    disable_move = false,       --  default is false disable move keymap for hyper
    shortcut_type = "number",   --  shorcut type 'letter' or 'number'
    change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
    config = {
      header = M.header,
      shortcut = M.shortcut,
      footer = M.footer,
      project = M.project,
      mru = M.mru,
    },                   --  config used for theme
    hide = {
      statusline = true, -- hide statusline default is true
      tabline = true,    -- hide the tabline
      winbar = true,     -- hide winbar
    },
    -- preview = {
    --   command     -- preview command
    --   file_path   -- preview file path
    --   file_height -- preview file height
    --   file_width  -- preview file width
    -- },
  })
  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "DashboardLoaded",
      callback = function()
        require("lazy").show()
      end,
    })
  end
  local theme = require("core.colors")

  vim.api.nvim_set_hl(0, "DashboardIcon", { fg = theme.color75, bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = theme.color3, bg = theme.color0 })
  -- General
  -- DashboardHeader DashboardFooter
  -- Hyper theme
  -- DashboardProjectTitle DashboardProjectTitleIcon DashboardProjectIcon
  -- DashboardMruTitle DashboardMruIcon DashboardFiles DashboardShotCutIcon
  -- Doome theme
  -- DashboardDesc DashboardKey DashboardIcon DashboardShotCut
end

M.confirm_key = "l"

M.header = {
  [[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
  [[⠀⠀⢀⣠⣤⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣀⠀⠀]],
  [[⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⡀⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠎⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀]],
  [[⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀]],
  [[⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠧⠉⠻⣶⣄⠀⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⢀⣠⡾⠛⠉⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀]],
  [[⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣖⡒⠀⠀⠀⠀⠈⠻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⠀⣠⣾⠋⠀⠀⠀⠀⠀⢒⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀]],
  [[⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣟⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠟⠁⠀⠀⠀⠀⠀⠀⢘⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀]],
  [[⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⠟⠂⠀⠀⠀⠀⠀⠀⠀⠀⠉⢷⡀⠀⠀⠀⠀⠀⠀⢠⡿⠁⠀⠀⠀⠀⠀⠀⠀⠐⢒⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀]],
  [[⠀⠀⠀⠀⠘⣿⣿⣿⣿⡿⠟⠛⠉⡁⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠀⠱⣀⣀⠀⢀⠟⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⢿⣿⣿⣿⣿⣿⠀   ]],
  [[⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠟⠋⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠃⢸⣿⣿⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⢿⣷⣿⣿⣿⣿⡟⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⡷⠖⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣤⣿⣿⣿⣇⡠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠲⠶⣿⣿⣿⣿⣿⠁    ]],
  [[⠀⠀⠀⠀⠀⠀⠙⠻⠿⠿⢿⣶⣤⣤⣤⣤⣄⠐⠒⠒⠀⠀⠀⠀⣻⣿⣿⣿⣿⡇⠀⠀⠀⠀⠐⠂⠀⣤⣤⣤⣤⣤⡾⠿⠿⠿⠛⠁⠀⠀⠀⠀ ]],
  [[⠀⠀⠀⠀⠀⠀⠀ ⢀⣤⣶⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠩⢿⣿⣿⣿⣷⣦⡄⠀⠀⠀ ⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣯⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢼⣿⣿⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢬⣽⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣏⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠸⣿⡟⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣈⣛⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡿⢁⣤⡖⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⣿⡇⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⢤⡀⠸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣵⣿⣿⣤⡄⠀⠀⠀⠀⠀⠀⡌⠀⠀⠙⠁⠀⠈⡇⠀⠀⠀⠀⠀⠀⣠⣌⣿⣷⣼⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣡⣴⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠰⣤⣹⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣧⣤⣀⣤⢀⡎⠀⠀⠀⠀⠀⠀⠀⠀⣇⢀⡄⢀⣤⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀   ⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ⠉⠉⠛⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠛⠛⠉⠉    ⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
}

M.shortcut = {
  {
    icon = '󰏇 ', -- פּ 󱁕
    group = 'DashboardIcon',
    desc = '',
    icon_hl = '@string',
    -- action = 'NvimTreeToggle',
    action = 'Oil',
    key = 'j'
  },
  {
    icon = '󱡅 ',
    group = 'DashboardIcon',
    desc = '',
    icon_hl = '@function',
    action = "lua require('harpoon.ui').toggle_quick_menu()",
    key = 'k'
  },
  {
    icon = ' ',
    group = 'DashboardIcon',
    desc = '',
    icon_hl = 'DiagnosticInfo',
    action = 'FloatermNew lazygit',
    key = 'l',
  },
  {
    icon = ' ',
    group = 'DashboardIcon',
    desc = '',
    icon_hl = '@property',
    action = 'FloatermNew lf',
    key = ';'
  },
  -- {
  --   icon = '󰊳 ',
  --   desc = 'Updates',
  --   group = 'DashboardIcon',
  --   icon_hl = '@property',
  --   action = 'Lazy update',
  --   key = 'u'
  -- },
  {
    icon = '󰱽 ',
    group = 'DashboardIcon',
    desc = '',
    icon_hl = 'Label',
    action = 'FloatermNew fzf',
    key = 'f',
  },
  {
    icon = '󰺯 ',
    group = 'DashboardIcon',
    desc = '',
    icon_hl = 'DiagnosticHint',
    action = 'FloatermNew rg',
    key = 's',
  },
  {
    icon = ' ',
    group = 'DashboardIcon',
    desc = '',
    icon_hl = '@property',
    action = 'FloatermNew',
    key = '`',
  },
  {
    icon = "鈴",
    group = 'DashboardIcon',
    desc = '',
    icon_hl = 'Number',
    action = 'Lazy',
    key = 'z'
  },
  {
    icon = '󰟿 ',
    desc = '',
    group = 'DiagnosticError',
    icon_hl = 'DiagnosticError',
    action = 'q',
    key = 'h',
  },
}
M.footer = {}
M.project = { enable = false, limit = 8, icon = 'your icon', label = '', action = 'FloatermNew fzf' }
M.mru = {
  limit = 3,
  icon = '↘',
  label = '',
}

return M
