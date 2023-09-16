local M = {}
M.config = function()
  local opts = { noremap = true }
  local map = vim.keymap.set
  -- Setup
  -- Navigate buffers bypassing the menu
  local harpoon = require("harpoon.ui")
  local keys = 'hjklasdfgn'
  for i = 1, #keys do
    local key = keys:sub(i, i)
    map(
      'n',
      string.format('<C-%s>', key),
      function() harpoon.nav_file(i) end,
      opts
    )
  end
  -- map({ 't', 'n' }, '<leader>k', harpoon.toggle_quick_menu, opts)
  -- vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("harpoon.ui").nav_file(vim.v.count1)<cr>',
  --   { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_next()<cr>',
  --   { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua require("harpoon.ui").nav_prev()<cr>',
  --   { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua require("harpoon.mark").add_file()<cr>',
  --   { noremap = true, silent = true })

  -- map({ 't', 'n' }, '<C-M>', function()
  --   harpoon.toggle_quick_menu()
  --   -- wait for the menu to open
  --   vim.defer_fn(function()
  --     vim.fn.feedkeys('/')
  --   end, 50)
  -- end, opts)
  -- Next/Prev
  -- map('n', '<M-l>', harpoon.nav_next, opts)
  -- map('n', '<M-h>', harpoon.nav_prev, opts)
end

return M
