local M = {}

M.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind-nvim",
  'VonHeikemen/lsp-zero.nvim',
  'neovim/nvim-lspconfig',
  "mason.nvim",
}

M.servers = nil

M.config = function(plugin)
  local lsp_zero = require('lsp-zero')

  lsp_zero.on_attach(function(client, buffer)
    lsp_zero.default_keymaps({ buffer = buffer })
  end)

  require("config.lsp.lspsaga").config()

  local server = require('config.lsp.servers')
  local lsp = require("lspconfig")

  lsp.lua_ls.setup(server.lua_ls)
  lsp.rust_analyzer.setup(server.rust_analyzer)
  lsp.clangd.setup(server.clangd)
  lsp.gopls.setup(server.gopls)
  lsp.tsserver.setup(server.tsserver)
end

return M
