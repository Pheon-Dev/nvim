local enable = require("config").enable

local lspsaga = require("config.lsp.lspsaga")
local lspconfig = require("config.lsp.lspconfig")
local zero = require("config.lsp.zero")
local mason = require("config.lsp.mason")

local default_event = require("config.event").default

local M = {
  {
    "neovim/nvim-lspconfig",
    enabled = enable.lspconfig,
    dependencies = lspconfig.dependencies,
    servers = lspconfig.servers,
    config = lspconfig.config,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = enable.mason_lspconfig,
    config = mason.mason_lspconfig,
  },
  {
    "williamboman/mason.nvim",
    build = mason.build,
    enabled = enable.mason,
    config = mason.config,
  },
  {
    'nvimdev/lspsaga.nvim',
    enabled = enable.lspsaga,
    event = default_event,
    config = lspsaga.config,
    dependencies = lspsaga.dependencies,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = zero.branch,
  },
}

return M
