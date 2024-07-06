local M = {}

M.config = function()
  -- lua, default settings
  require("better_escape").setup({
    timeout = vim.o.timeoutlen,
    mappings = {
      i = {
        j = {
          -- These can all also be functions
          k = "<Esc>",
          j = "<Esc>",
        },
      },
      c = {
        j = {
          k = "<Esc>",
          j = "<Esc>",
        },
      },
      t = {
        j = {
          k = "<Esc>",
          j = "<Esc>",
        },
      },
      n = {
        t = {
          n = "FloatermNew",
          j = "FloatermPrev",
          k = "FloatermNext",
          x = "FloatermKill",
        },
      },
      v = {
        j = {
          k = "<Esc>",
        },
      },
      s = {
        j = {
          k = "<Esc>",
        },
      },
    },
  })
  function escape_status()
    local ok, m = pcall(require, "better_escape")
    return ok and m.waiting and "✺" or ""
  end
end

return M
