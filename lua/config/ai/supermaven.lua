local M = {}

M.build = ":SupermavenUseFree" -- needs to be run once to set the API key

M.keys = {
  { "<A-a>", mode = "i", desc = "󰚩 Accept Suggestion" },
  { "<A-c>", mode = "i", desc = "󰚩 Accept Word" },
  {
    "<leader>oa",
    function()
      vim.cmd.SupermavenToggle()
      local text = require("supermaven-nvim.api").is_running() and "enabled" or "disabled"
      require("config.utils").notify("󰚩 Supermaven", text)
    end,
    desc = "󰚩 Supermaven Suggestions",
  },
}

M.opts = {
  keymaps = {
    accept_suggestion = "<A-a>",
    accept_word = "<A-c>",
    clear_suggestion = "<A-x>",
  },
  --[[ color = {
    suggestion_color = "#ffffff",
    cterm = 244,
  }, ]]
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = false, -- disables built in keymaps for more manual control
  -- log_level = "info", -- set to "off" to disable logging completely
  log_level = "off", -- silence notifications
  ignore_filetypes = {
    gitcommit = true,
    DressingInput = true,
    TelescopePrompt = true,
    text = true, -- `pass`' filetype when editing passwords
    ["rip-substitute"] = true,
  },
}

M.config = function(_)
  require("supermaven-nvim").setup(M.opts)

  -- PENDING https://github.com/supermaven-inc/supermaven-nvim/issues/49
  require("supermaven-nvim.completion_preview").suggestion_group = "NonText"

  -- disable while recording
  vim.api.nvim_create_autocmd("RecordingEnter", { command = "SupermavenStop" })
  vim.api.nvim_create_autocmd("RecordingLeave", { command = "SupermavenStart" })
end

return M
