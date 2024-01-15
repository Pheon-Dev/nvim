local M = {}

M.config = function()
  require("diaglist").init({
    -- optional settings
    -- below are defaults
    debug = false,

    -- increase for noisy servers
    debounce_ms = 150,
  })
end

return M
