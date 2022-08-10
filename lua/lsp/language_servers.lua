local capability = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require'lspconfig'.html.setup {
--   capabilities = capabilities,
-- }

-- require'lspconfig'.cssls.setup {
--   capabilities = capabilities,
-- }

-- require'lspconfig'.emmet_ls.setup {
--   capabilities = capabilities,
-- }

-- require'lspconfig'.pylsp.setup {
--   capabilities = capabilities,
-- }

require'lspconfig'.tsserver.setup {
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
    require'lsp_signature'.on_attach()
  end
}

-- local lsp_installer = require('nvim-lsp-installer')
-- lsp_installer.on_server_ready(function(server)
--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--
--   local opts = {capabilities = capabilities}
--   if server.name == "sumneko_lua" then
--     opts = vim.tbl_deep_extend("force", {
--       settings = {
--         Lua = {
--           runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
--           diagnostics = {globals = {'vim'}},
--           workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
--           telemetry = {enable = false}
--         }
--       }
--     }, opts)
--   end
--   server:setup(opts)
-- end)
