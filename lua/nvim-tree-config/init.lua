-- vim.g.nvim_tree_active = true
-- vim.g.nvim_tree_on_config_done = nil
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- local function print_node_path(node) {
--   print(node.absolute_path)
-- }
require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
   "startify",
   "dashboard",
   "alpha",
  },
  update_to_buf_dir = {
   enable = true,
   auto_open = true,
  },
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  diagnostics = {
   enable = true,
   icons = {
     hint = "",
     info = "",
     warning = "",
     error = "",
   },
  },
  update_focused_file = {
   enable = true,
   update_cwd = true,
   ignore_list = {},
  },
  system_open = {
   cmd = nil,
   args = {},
  },
  git = {
   enable = true,
   ignore = false,
   timeout = 200,
  },
  view = {
   width = 30,
   height = 30,
   hide_root_folder = false,
   side = "left",
   auto_resize = false,
   mappings = {
     custom_only = false,
 list = {
  { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
  { key = "h", cb = tree_cb "close_node" },
  { key = "v", cb = tree_cb "vsplit" },
  { key = "C", cb = tree_cb "cd" },
}
   },
   number = false,
   relativenumber = false,
   signcolumn = "yes",
  },
  filters = {
   dotfiles = false,
   custom = { "node_modules", ".cache" },
  },
  trash = {
   cmd = "trash",
   require_confirm = true,
  },
}
-- vim.g.nvim_tree_show_icons = {
--      git = 1,
--      folders = 1,
--      files = 1,
--      folder_arrows = 1,
--      }
-- -- vim.g.nvim_tree_width = 24
-- -- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_quit_on_open = 0
-- vim.g.nvim_tree_git_hl = 1
-- -- vim.g.nvim_tree_highlight_opened_files = 1
-- vim.g.nvim_tree_disable_window_picker = 0
-- vim.g.nvim_tree_root_folder_modifier = ':t'
-- -- vim.g.nvim_tree_add_trailing = 1
-- -- vim.g.nvim_tree_group_empty = 1
-- -- vim.g.nvim_tree_icon_padding = ' '
-- -- vim.g.nvim_tree_symlink_arrow = ' >> '
-- -- vim.g.nvim_tree_respect_buf_cwd = 1
-- -- vim.g.nvim_tree_update_cwd = true
-- -- vim.g.nvim_tree_create_in_closed_folder = 1
-- vim.g.nvim_tree_icons = {
--  default = '',
--  symlink = '',
--  git = {
--    unstaged = "✗",
--    staged = "✓",
--    unmerged = "",
--    renamed = "➜",
--    untracked = "★",
--    deleted = "",
--    ignored = "◌"
--    },
--  folder = {
--    arrow_open = "↓",
--    arrow_closed = "→",
--    default = "",
--    open = "",
--    empty = "",
--    empty_open = "",
--    symlink = "",
--    symlink_open = "",
--    },
-- }
-- vim.cmd([[ 
-- let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }
-- ]])
