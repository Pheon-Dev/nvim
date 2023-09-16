local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "neovim/nvim-lspconfig",
    enabled = enable.lspconfig,
    dependencies = require("config.lsp").lspconfig_dependencies,
    servers = require("config.lsp").lspconfig_servers,
    config = require("config.lsp").lspconfig_config,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = enable.mason_lspconfig,
    config = require("config.lsp").mason_lspconfig_config,
  },
  {
    "williamboman/mason.nvim",
    build = require("config.lsp").mason_build,
    enabled = enable.mason,
    config = require("config.lsp").mason_config,
  },
  {
    'nvimdev/lspsaga.nvim',
    enabled = enable.lspsaga,
    config = require("config.lsp").lspsaga_config,
    dependencies = require("config.lsp").lspsaga_dependencies,
  },
  {
    "elentok/format-on-save.nvim",
    event = default_event,
    enabled = enable.format_on_save,
    config = require("config.lsp").formart_on_save_config,
  }
}

return M
