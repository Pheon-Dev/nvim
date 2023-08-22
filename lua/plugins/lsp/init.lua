return {
  {
    "neovim/nvim-lspconfig",
    -- event = "BufReadPre",
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
    "simrat39/inlay-hints.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = false,
    config = function()
      require("inlay-hints").setup({
        only_current_line = false,

        eol = {
          right_align = false,
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "rust_analyzer",
          "clangd",
          "gopls",
          "bash-language-server",
          "lua-language-server",
          "typescript-language-server",
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    build = "MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✔",
            package_pending = "➜",
            package_uninstalled = "",
          },
        },
      })
    end,
  },
}
