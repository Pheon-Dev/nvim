local M = {}

M.config = function()
  local function augroup(name)
    return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
  end

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'harpoon',
    callback = function()
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "h",
        "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
        { silent = true }
      )
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "l",
        "<Cmd>lua require('harpoon.ui').select_menu_item()<CR>",
        {}
      )
    end,
  })

  local opts = { noremap = true }
  local map = vim.keymap.set
  -- Setup
  -- Navigate buffers bypassing the menu
  local harpoon = require("harpoon.ui")
  local keys = '123456789'
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
  local theme = require("core.colors")

  vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "Harpoon", { fg = theme.color3, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "HarpoonInactive", { fg = theme.color3, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "HarpoonActive", { fg = theme.color101, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = theme.color4, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { fg = theme.color3, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = theme.color0 })
end

return M
