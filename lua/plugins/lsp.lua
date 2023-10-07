local enable = require("config").enable
local lsp = require("config.lsp")

local default_event = require("config.event").default

local M = {
  {
    "neovim/nvim-lspconfig",
    enabled = enable.lspconfig,
    dependencies = lsp.lspconfig_dependencies,
    servers = lsp.lspconfig_servers,
    config = lsp.lspconfig_config,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = enable.mason_lspconfig,
    config = lsp.mason_lspconfig_config,
  },
  {
    "williamboman/mason.nvim",
    build = lsp.mason_build,
    enabled = enable.mason,
    config = lsp.mason_config,
  },
  {
    'nvimdev/lspsaga.nvim',
    enabled = enable.lspsaga,
    event = default_event,
    -- config = lsp.lspsaga_config,
    dependencies = lsp.lspsaga_dependencies,
  },
  {
    "elentok/format-on-save.nvim",
    event = default_event,
    enabled = enable.format_on_save,
    config = lsp.formart_on_save_config,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = lsp.branch,
  },
}

return M
