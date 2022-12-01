if not vim.fn.filetype == "dashboard" then
  local mark_opts = {
    filter = function(mark)
      return mark:match("[a-zA-Z]") -- return true to disable
    end,
    -- A map of action to key that should be used to invoke it
    actions = {
      split = "-",
      vertsplit = "/",
      tabsplit = "]",
      delete = "<Space>",
    },
  }

  require("reach").marks(mark_opts)
end
