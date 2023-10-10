local M = {}


M.keys = {
  { "ic", mode = { "o", "x" }, desc = "Select comment block" },
  { "ac", mode = { "o", "x" }, desc = "Select comment block" },
}

M.dependencies = { "kana/vim-textobj-user" }


return M
