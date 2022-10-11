local capability = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require 'lspconfig'.tsserver.setup {
  capabilities = capability,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim"
  },
  root_dir = function(fname)
    return vim.loop.cwd()
  end,
  on_attach = function(client)
    require 'lsp_signature'.on_attach()
  end
}

require 'lspconfig'.sumneko_lua.setup {
  on_attach = function(client)
    require 'lsp_signature'.on_attach()
  end,
  capabilities = capability,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
