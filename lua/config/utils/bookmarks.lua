local M = {}

M.config = function()
  local map = vim.api.nvim_set_keymap
  map("n", "mm", "<Plug>BookmarkToggle", { noremap = true, silent = true })
  map("n", "mi", "<Plug>BookmarkAnnotate", { noremap = true, silent = true })
  map("n", "ma", "<Plug>BookmarkShowAll", { noremap = true, silent = true })
  map("n", "mn", "<Plug>BookmarkNext", { noremap = true, silent = true })
  map("n", "mp", "<Plug>BookmarkPrev", { noremap = true, silent = true })
  map("n", "mc", "<Plug>BookmarkClear", { noremap = true, silent = true })
  map("n", "mx", "<Plug>BookmarkClearAll", { noremap = true, silent = true })
  map("n", "mk", "<Plug>BookmarkMoveUp", { noremap = true, silent = true })
  map("n", "mj", "<Plug>BookmarkMoveDown", { noremap = true, silent = true })
  map("n", "mg", "<Plug>BookmarkMoveToLine", { noremap = true, silent = true })
end

return M
