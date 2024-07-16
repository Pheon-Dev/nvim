local M = {}

M.config = function(_)
  --[[ require("supermaven-nvim").setup(M.opts)

  -- PENDING https://github.com/supermaven-inc/supermaven-nvim/issues/49
  require("supermaven-nvim.completion_preview").suggestion_group = "NonText" ]]
  require("supermaven-nvim").setup({
    keymaps = {
      accept_suggestion = "<A-a>",
      accept_word = "<A-c>",
      clear_suggestion = "<A-x>",
    },
    ignore_filetypes = { cpp = true },
    --[[ color = {
      suggestion_color = "#ffffff",
      cterm = 244,
    }, ]]
    log_level = "info", -- set to "off" to disable logging completely
    disable_inline_completion = false, -- disables inline completion for use with cmp
    disable_keymaps = false, -- disables built in keymaps for more manual control
  })
  -- vim.cmd(":SupermavenUseFree")

  vim.api.nvim_create_autocmd("RecordingEnter", { command = "SupermavenStop" })
  vim.api.nvim_create_autocmd("RecordingLeave", { command = "SupermavenStart" })
end

return M
