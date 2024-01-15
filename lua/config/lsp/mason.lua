local M = {}
M.mason_lspconfig = function()
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

M.build = "MasonUpdate"

M.config = function()
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

return M
