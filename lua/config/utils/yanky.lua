local M = {}

M.opts = {
  ring = {
    history_length = 100,
    storage = "shada",
    sync_with_numbered_registers = true,
    cancel_event = "update",
  },
  picker = {
    select = {
      action = nil, -- nil to use default put action
    },
    telescope = {
      use_default_mappings = true, -- if default mappings should be used
      mappings = nil,              -- nil to use default mappings or no mappings (see `use_default_mappings`)
    },
  },
  system_clipboard = {
    sync_with_ring = true,
  },
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 150,
  },
  preserve_cursor_position = {
    enabled = true,
  },
}

M.keys = {
  -- stylua: ignore
  {
    "<leader>P",
    function() require("telescope").extensions.yank_history.yank_history({}) end,
    desc =
    "Paste from Yanky"
  },
  { "y",  "<Plug>(YankyYank)",                     mode = { "n", "x" } },
  { "p",  "<Plug>(YankyPutAfter)",                 mode = { "n", "x" } },
  { "P",  "<Plug>(YankyPutBefore)",                mode = { "n", "x" } },
  { "gp", "<Plug>(YankyGPutAfter)",                mode = { "n", "x" } },
  { "gP", "<Plug>(YankyGPutBefore)",               mode = { "n", "x" } },
  { "[y", "<Plug>(YankyCycleForward)" },
  { "]y", "<Plug>(YankyCycleBackward)" },
  { "]p", "<Plug>(YankyPutIndentAfterLinewise)" },
  { "[p", "<Plug>(YankyPutIndentBeforeLinewise)" },
  { "]P", "<Plug>(YankyPutIndentAfterLinewise)" },
  { "[P", "<Plug>(YankyPutIndentBeforeLinewise)" },
  { ">p", "<Plug>(YankyPutIndentAfterShiftRight)" },
  { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)" },
  { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)" },
  { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)" },
  { "=p", "<Plug>(YankyPutAfterFilter)" },
  { "=P", "<Plug>(YankyPutBeforeFilter)" },
  -- { "<c-n>", "<Plug>(YankyCycleForward)" },
  -- { "<c-p>", "<Plug>(YankyCycleBackward)" },
}

M.config = function()
  local function augroup(name)
    return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
  end

  vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
  local theme = require("core.colors")
  require("yanky").setup({})
  vim.api.nvim_set_hl(0, "YankyYanked", { bg = theme.color65 })
  vim.api.nvim_set_hl(0, "YankyPut", { bg = theme.color93 })
end

return M
