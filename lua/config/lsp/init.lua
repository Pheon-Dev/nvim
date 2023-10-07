local M = {}

M.lspconfig_dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind-nvim",
  'VonHeikemen/lsp-zero.nvim',
  'neovim/nvim-lspconfig',
  "mason.nvim",
}

M.lspconfig_servers = nil

M.lspconfig_config = function(plugin)
  local lsp_zero = require('lsp-zero')

  lsp_zero.on_attach(function(client, buffer)
    lsp_zero.default_keymaps({ buffer = buffer })
  end)

  require("config.lsp.config").lsp_config(plugin)

  -- require("config.lsp.diagnostics")
  require("config.lsp.lspsaga").config()
  local conf = require('config.lsp.servers')
  local lsp = require("lspconfig")

  lsp.lua_ls.setup(conf.lua_ls)
  lsp.rust_analyzer.setup(conf.rust_analyzer)
  lsp.clangd.setup(conf.clangd)
  lsp.gopls.setup(conf.gopls)
  lsp.tsserver.setup(conf.tsserver)
end

M.mason_lspconfig_config = function()
  local lsp_zero = require('lsp-zero')
  require("mason-lspconfig").setup({
    automatic_installation = true,
    handlers = { lsp_zero.default_setup },
    ensure_installed = {
      "rust-analyzer",
      "clangd",
      "codelldb",
      "prettierd",
      "shfmt",
      "gopls",
      "lua_ls",
      "goimports-reviser",
      "bash-language-server",
      "lua-language-server",
      "prisma-language-server",
      "typescript-language-server",
    },
  })
end

M.mason_build = "MasonUpdate"

M.mason_config = function()
  require("mason").setup({
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✔",
        package_pending = "➜",
        package_uninstalled = "",
      },
    },
  })
end

M.lspsaga_dependencies = {
  'nvim-treesitter/nvim-treesitter',
  'nvim-tree/nvim-web-devicons',
}

M.formart_on_save_config = function()
  require("config.lsp.format")
end

return M
