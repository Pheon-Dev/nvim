local M = {}

M.config = function()
  require("lint").linters_by_ft = {
    markdown = { "vale" },
    lua = { "luacheck" }, -- yay -Syu luarocks && luarocks install luacheck
    css = { "stylelint" },
    json = { "jsonlint" },
    javascript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
  }
end

return M
