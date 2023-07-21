return {
  "goolord/alpha-nvim",
  enabled = true,
  event = { "VimEnter" },
  config = function()
    local has_alpha, alpha = pcall(require, "alpha")

    if not has_alpha then return end

    local config = require("plugins.alpha.config").config

    alpha.setup(config)
  end,
}
