return {
  "gbprod/yanky.nvim",
  enabled = true,
  -- event = "VeryLazy",
  event = "BufReadPre",
  dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
  opts = {
    highlight = { timer = 150 },
    ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
  },
  keys = {
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
  },
  config = function()
    local theme = require("core.colors")
    require("yanky").setup({
      ring = {
        history_length = 100,
        storage = "shada", -- sqlite "kkharji/sqlite.lua",
        sync_with_numbered_registers = true,
        cancel_event = "update",
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
    })
    vim.api.nvim_set_hl(0, "YankyYanked", { bg = theme.color65 })
    vim.api.nvim_set_hl(0, "YankyPut", { bg = theme.color93 })
  end,
}
