local null_ls = require('null-ls')

null_ls.setup({
  debug = true,
  sources = { null_ls.builtins.formatting.prettier },
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end
})
