local M = {}

M.dependencies = {
  "ray-x/guihua.lua",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
}

M.config = function()
  require("go").setup({ lsp_inlay_hints = { enable = true } })
end

M.ft = { "go", 'gomod' }

M.build = ':lua require("go.install").update_all_sync()'

return M
