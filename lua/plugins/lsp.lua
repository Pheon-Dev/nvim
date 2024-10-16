local enable = require("config").enable

local inlay = require("config.lsp.inlay")
local lspsaga = require("config.lsp.lspsaga")
local format = require("config.lsp.format")
local lspconfig = require("config.lsp.lspconfig")
local zero = require("config.lsp.zero")
local mason = require("config.lsp.mason")

local default_event = require("config.event").default
local attach_event = require("config.event").attach

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
    "nvimdev/lspsaga.nvim",
    enabled = enable.lsp,
    event = default_event,
    config = lspsaga.config,
    dependencies = lspsaga.dependencies,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    enabled = enable.lsp,
    branch = zero.branch,
  },
  {
    "stevearc/conform.nvim",
    event = default_event,
    enabled = enable.lsp,
    keys = format.keys,
    cmd = format.cmd,
    init = format.init,
    config = format.config,
    opts = format.opts,
  },
  {
    "felpafel/inlay-hint.nvim",
    event = attach_event,
    -- enabled = enable.lsp,
    enabled = false,
    config = inlay.config,
  },
}

return M
