local M = {}

M.dependencies = {}

M.event = {}

M.keys = {}

M.init = function()
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.ui.select = function(...)
    require("lazy").load({ plugins = { "dressing.nvim" } })
    return vim.ui.select(...)
  end
end

M.config = function()
  require("dressing").setup {
    input = {
      override = function(conf)
        conf.col = -1
        conf.row = 0
        return conf
      end,
    },
  }
end
return M
