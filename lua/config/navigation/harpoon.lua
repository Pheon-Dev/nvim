local M = {}

M.branch = "harpoon2"

M.config = function()
  local harpoon = require("harpoon")

  harpoon:setup({
    settings = {
      save_on_toggle = false,
      sync_on_ui_close = false,
      key = function()
        return vim.loop.cwd()
      end,
    },
  })

  vim.keymap.set("n", "<leader>h", function() harpoon:list():append() end)
  vim.keymap.set("n", "<leader>k", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
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
