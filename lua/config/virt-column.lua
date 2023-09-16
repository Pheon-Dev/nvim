local M = {}
M.dependencies = {
  "m4xshen/smartcolumn.nvim",
}

M.config = function()
  require('virt-column').setup({
    char = '┊',
  })
  require('smartcolumn').setup()
  vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved", "CursorMovedI", "WinScrolled" }, {
    callback = function()
      vim.cmd("VirtColumnRefresh")
    end
  })
end
return M
