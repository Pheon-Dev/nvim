local enable = require("config").enable.lsp
return {
  {
    "neovim/nvim-lspconfig",
    -- event = "BufReadPre",
    enabled = enable.lspconfig,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      -- "folke/lsp-colors.nvim",
      "mason.nvim",
    },
    servers = nil,
    config = function(plugin)
      -- diagnostics
      require("plugins.lsp.diagnostics")

      -- lspconfig
      require("plugins.lsp.config").lsp_config(plugin)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = enable.mason_lspconfig,
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
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
    end,
  },
  {
    "williamboman/mason.nvim",
    build = "MasonUpdate",
    enabled = enable.mason,
    config = function()
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
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    enabled = enable.lspsaga,
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    "elentok/format-on-save.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = enable.format_on_save,
    config = function()
      require("plugins.lsp.format")
    end,
  }
}
