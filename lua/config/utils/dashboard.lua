local M = {}

M.dependencies = { { 'nvim-tree/nvim-web-devicons' } }

M.config = function()
  local has_dashboard, dashboard = pcall(require, "dashboard")

  if not has_dashboard then return end
  dashboard.setup({
    -- theme = 'hyper',            --  theme is doom and hyper default is hyper
    disable_move = false,       --  default is false disable move keymap for hyper
    shortcut_type = "letter",   --  shorcut type 'letter' or 'number'
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
  -- {
  --   icon = '󰊳 ',
  --   desc = 'Updates',
  --   icon_hl = 'DashboardIcon',
  --   group = '@property',
  --   action = 'Lazy update',
  --   key = 'u'
  -- },
  {
    icon = "鈴",
    icon_hl = 'DashboardIcon',
    desc = 'lazy',
    group = 'Number',
    action = 'Lazy',
    key = 'z'
  },
  {
    icon = 'פּ ',
    icon_hl = 'DashboardIcon',
    desc = 'nt',
    group = '@integer',
    action = 'NvimTreeToggle',
    key = 'j'
  },
  -- {
  --   icon = ' ',
  --   icon_hl = 'DashboardIcon',
  --   desc = 'lf',
  --   group = '@property',
  --   action = 'FloatermNew lf',
  --   key = 'l'
  -- },
  {
    icon = 'ﯠ ',
    icon_hl = 'DashboardIcon',
    desc = 'harp',
    group = '@function',
    action = "lua require('harpoon.ui').toggle_quick_menu()",
    key = 'k'
  },
  {
    icon = ' ',
    icon_hl = 'DashboardIcon',
    desc = 'fzf',
    group = 'Label',
    action = 'FloatermNew fzf',
    key = 'f',
  },
  {
    icon = ' ',
    icon_hl = 'DashboardIcon',
    desc = 'rg',
    group = 'DiagnosticHint',
    action = 'FloatermNew rg',
    key = 's',
  },
  {
    icon = ' ',
    icon_hl = 'DashboardIcon',
    desc = 'ft',
    group = '@string',
    action = 'FloatermNew',
    key = 'i',
  },
  {
    icon = ' ',
    icon_hl = 'DashboardIcon',
    desc = 'lg',
    group = 'DiagnosticInfo',
    action = 'FloatermNew lazygit',
    key = 'l',
  },
  {
    icon = ' ',
    desc = '',
    group = 'DiagnosticError',
    action = 'q',
    key = 'h',
  },
}
M.footer = {}
M.project = { enable = false, limit = 8, icon = 'your icon', label = '', action = 'FloatermNew fzf' }
M.mru = { limit = 5, icon = ' ', label = 'Recent Files', }

return M
