local M        = {}

M.ft           = "norg"

M.build        = ":Neorg sync-parsers"

M.cmd          = "Neorg"

M.priority     = 30

M.dependencies = { "nvim-lua/plenary.nvim" }

M.config       = function()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},  -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = {      -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/.nb/home",
            -- home = "~/notes/home",
            -- work = "~/notes/work",
          },
        },
      },
    },
  })
end

return M
