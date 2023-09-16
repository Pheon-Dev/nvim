local M = {}

M.lspconfig_dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind-nvim",
  -- "folke/lsp-colors.nvim",
  "mason.nvim",
}

M.lspconfig_servers = nil

M.lspconfig_config = function(plugin)
  -- diagnostics
  require("config.lsp.diagnostics")

  -- lspconfig
  require("config.lsp.config").lsp_config(plugin)
end

M.mason_lspconfig_config = function()
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

M.lspsaga_config = function()
  require('lspsaga').setup({})
end

M.lspsaga_dependencies = {
  'nvim-treesitter/nvim-treesitter',
  'nvim-tree/nvim-web-devicons',
}

M.formart_on_save_config = function()
  require("config.lsp.format")
end

return M
