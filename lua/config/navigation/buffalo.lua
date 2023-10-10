local M = {}

M.config = function()
  local opts = { noremap = true }
  local map = vim.keymap.set
  -- Setup
  require("buffalo").setup({
    tab_commands = {
      select = {
        key = "l",
        command = "tabnext"
      },
      accept = {
        key = "<CR>",
        command = "tabnext"
      },
      close = {
        key = "x",
        command = "tabclose"
      },
      new = {
        key = "n",
        command = "tabnew"
      },
      only = {
        key = "o",
        command = "tabonly"
      }
    },
    buffer_commands = {
      enter = {
        key = "<CR>",
        command = "edit"
      },
      edit = {
        key = "l",
        command = "edit"
      },
      vsplit = {
        key = "v",
        command = "vsplit"
      },
      split = {
        key = "b",
        command = "split"
      }
    },
    general_commands = {
      cycle = true,
      exit_menu = "h",
    },
    go_to = {
      enabled = false,
      go_to_tab = "<leader>%s",
      go_to_buffer = "<M-%s>",
    },
    filter = {
      enabled = false,
      filter_tabs = "<M-t>",
      filter_buffers = "<M-b>",
    },
    ui = {
      width = 60,
      height = 10,
      row = 2,
      col = 2,
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
  })

  local buffalo = require("buffalo.ui")

  -- map({ 't', 'n' }, '<leader>b', buffalo.toggle_buf_menu, { desc = 'Toggle Buffer Menu', noremap = opts.noremap })
  map({ 't', 'n' }, '<M-Space>', buffalo.toggle_buf_menu, opts)
  -- map({ 't', 'n' }, '<C-Space>', buffalo.toggle_tab_menu, opts)

  map('n', '<C-j>', buffalo.nav_buf_next, opts)
  map('n', '<C-k>', buffalo.nav_buf_prev, opts)
  -- map('n', '<C-n>', buffalo.nav_tab_next, opts)
  -- map('n', '<C-p>', buffalo.nav_tab_prev, opts)
  local theme = require("core.colors")

  vim.api.nvim_set_hl(0, "BuffaloBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "BuffaloWindow", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "BuffaloModified", { link = "Keyword" })
  -- vim.api.nvim_set_hl(0, "Buffalo", { fg = theme.color3, bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "BuffaloInactive", { fg = theme.color3, bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "BuffaloActive", { fg = theme.color101, bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "BuffaloNumberActive", { fg = theme.color4, bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "BuffaloNumberInactive", { fg = theme.color3, bg = theme.color0 })
end

return M
