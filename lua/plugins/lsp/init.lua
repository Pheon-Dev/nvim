return {
  -- {
  --   "lvimuser/lsp-inlayhints.nvim",
  --   event = "BufReadPre",
  -- },
  -- { "jose-elias-alvarez/typescript.nvim", event = "BufReadPre" },
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
    -- "jose-elias-alvarez/null-ls.nvim",
    -- event = "BufReadPre",
    -- dependencies = { "mason.nvim" },
    -- config = function()
    --   local null_ls = require("null-ls")
    --
    --   null_ls.setup({
    --     sources = {
    --       null_ls.builtins.formatting.stylua,
    --       null_ls.builtins.completion.spell,
    --       require("typescript.extensions.null-ls.code-actions"),
    --     },
    --   })
    -- end,
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
    -- event = "VeryLazy",
    build = "MasonUpdate",
    -- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    -- ensure_installed = {
    -- 	"stylua",
    -- 	"shellcheck",
    -- 	"shfmt",
    -- 	"flake8",
    -- },
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
