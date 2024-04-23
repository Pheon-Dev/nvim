local M = {}

M.config = function()
  require("mpv").setup({
    width = 50,
    height = 5, -- Changing these two might break the UI 😬
    border = "single",
    setup_widgets = true, -- to activate the widget components
    timer = {
      after = 1000,
      throttle = 250, -- Update time for the widgets. (lesser the faster)
    },
  })
end

return M
