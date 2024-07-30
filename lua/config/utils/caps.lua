local M = {}

M.opts = {}

M.keys = {
  {
    mode = { "i", "n" },
    "<C-s>",
    "<cmd>lua require('caps-word').toggle()<CR>",
  },
}

return M
