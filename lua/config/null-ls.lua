local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    --[[ null_ls.builtins.formatting.stylua, ]]
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
    --[[ null_ls.builtins.formatting.prettier ]]
  },
  --[[ debug = true, ]]
  --[[ on_attach = function(client) ]]
  --[[   client.server_capabilities.document_formatting = false ]]
  --[[ end ]]
  cmd = { "nvim" },
  debounce = 250,
  debug = false,
  default_timeout = 10000,
  diagnostic_config = nil,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log_level = "warn",
  notify_format = "[null-ls] %s",
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
  update_in_insert = false,
})
