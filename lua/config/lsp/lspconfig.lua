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

  local server = require('config.lsp.servers')
  local lsp = require("lspconfig")
  local ui = require("lspconfig.ui.windows")

  ui.default_options.border = "rounded"

  lsp.lua_ls.setup(server.lua_ls)
  lsp.rust_analyzer.setup(server.rust_analyzer)
  lsp.clangd.setup(server.clangd)
  lsp.gopls.setup(server.gopls)
  lsp.tsserver.setup(server.tsserver)
  local function lspSymbol(name, icon)
    vim.fn.sign_define(
      "DiagnosticSign" .. name,
      { text = icon, numhl = "DiagnosticDefault" .. name }
    )
  end
  lspSymbol("Error", "")
  lspSymbol("Information", "")
  lspSymbol("Hint", "")
  lspSymbol("Info", "")
  lspSymbol("Warning", "")
  require("config.lsp.lspsaga").config()
end

return M
