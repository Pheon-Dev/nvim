local M = {}

M.dependencies = {
  "anuvyklack/middleclass",
  "anuvyklack/animation.nvim",
}

M.config = function()
  vim.o.winwidth = 10
  vim.o.winminwidth = 10
  vim.o.equalalways = false
  require("windows").setup()

  local function cmd(command)
    return table.concat({ "<Cmd>", command, "<CR>" })
  end

  -- :WindowsEnableAutowidth
  -- :WindowsDisableAutowidth
  -- :WindowsToggleAutowidth

  vim.keymap.set("n", "<leader>wf", cmd("WindowsMaximize"))
  vim.keymap.set("n", "<leader>wl", cmd("WindowsMaximizeVertically"))
  vim.keymap.set("n", "<leader>wh", cmd("WindowsMaximizeHorizontally"))
  vim.keymap.set("n", "<leader>we", cmd("WindowsEqualize"))
end

return M
