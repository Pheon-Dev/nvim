require("neodev").setup({
  debug = true,
  experimental = {
    pathStrict = true,
  },
  library = {
    -- runtime = "~/projects/neovim/runtime/",
  },
})
require("mason")
require("config.lsp.diagnostic_signs")
require("config.lsp.language_servers")
require("config.lsp.cmp")
