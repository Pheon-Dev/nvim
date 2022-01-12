vim.g.nvim_tree_width = 24
vim.g.nvim_tree_indent_markers = 1
require'nvim-tree'.setup {
  -- auto_open = true,
  -- auto_close = true,
  gitignore = true,
  -- disable_netrw = true,
  -- hijack_netrw = true,
  -- gitignore = true,
  -- open_on_setup = true,
  -- update_to_buf_dir = {
  --   enable = true,
  --   auto_open = true,
  -- },
  -- auto_close = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
    hint = "",
    info = "",
    warning = "",
    error = ""
    }
  }
}
