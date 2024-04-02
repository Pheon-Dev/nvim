local M = {}

M.keys = {
  {
    "[k",
    function()
      require("treesitter-context").go_to_context()
    end,
  },
}

M.config = function()
  require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  })
  local theme = require("core.colors")
  vim.api.nvim_set_hl(0, "TreesitterContext", { bg = theme.color01 })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = theme.color01, fg = theme.color101 })
  vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { bg = theme.color01 })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { bg = theme.color01 })
  vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = theme.color01 })
  --[[ vim.keymap.set("n", "]k", function()
    require("treesitter-context").go_to_context(vim.v.count1)
  end, { silent = true }) ]]
end

return M
