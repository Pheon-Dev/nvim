local present, mason = pcall(require, "mason")

if not present then
  return
end

require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "tsserver", "gopls" }
})

vim.api.nvim_create_augroup("_mason", { clear = true })

local options = {
  ensure_installed = { "lua-language-server", "typescript-language-server", "prisma-language-server" },

  PATH = "prepend", -- append | skip

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
    },

    keymaps = {
      toggle_server_expand = "l",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

mason.setup(options)
