local enable = require("config").enable

local lspsaga = require("config.lsp.lspsaga")
local format = require("config.lsp.format")
local lspconfig = require("config.lsp.lspconfig")
local zero = require("config.lsp.zero")
local mason = require("config.lsp.mason")

local default_event = require("config.event").default

local M = {
  {
    "neovim/nvim-lspconfig",
    enabled = enable.lsp,
    dependencies = lspconfig.dependencies,
    servers = lspconfig.servers,
    config = lspconfig.config,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = enable.lsp,
    config = mason.mason_lspconfig,
  },
  {
    "williamboman/mason.nvim",
    build = mason.build,
    enabled = enable.lsp,
    config = mason.config,
  },
  {
    'nvimdev/lspsaga.nvim',
    enabled = enable.lsp,
    event = default_event,
    config = lspsaga.config,
    dependencies = lspsaga.dependencies,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    enabled = enable.lsp,
    branch = zero.branch,
  },
  {
    "elentok/format-on-save.nvim",
    event = default_event,
    enabled = enable.lsp,
    config = format.config,
  },
}

return M
