local M = {}

M.config = function()
  require('lspsaga').setup({
    ui = {
      border = "rounded",
      devicon = true,
      title = true,
      expand = '⊟',
      code_action = "",
      actionfix = " ",
      lines = { "╭", "─", "╮", "│", "╯", "─", "╰", "│", },
      kind = {},
      imp_sign = "󰳛",
    },
    symbol_in_winbar = {
      enable = true,
      separator = '  ',
      show_file = true,
      folded_level = 1,
      color_mode = true,
      delay = 1,
    },
    code_action = {
      num_shortcut = 2,
      show_server_name = false,
      extend_gitsigns = false,
      keys = {
        quit = { 'q', '<ESC>' },
        exec = '<CR>'
      }
    },
    diagnostic = {
      show_code_action = true,
      jump_num_shortcut = true,
      max_width = 0.80,
      max_height = 0.8,
      text_hl_follow = true,
      border_follow = true,
      extend_relatedInformation = false,
      show_layout = 'float',
      show_normal_height = 10,
      max_show_width = 0.9,
      max_show_height = 0.6,
      diagnostic_only_current = true,
      keys = {
        quit = { 'q', '<ESC>' },
        exec_action = "o",
        toggle_or_jump = '<CR>',
        quit_in_show = { 'q', '<ESC>' },
      }
    },
  })
  local signs = {
    Error = ' ',
    Warn = '',
    Info = ' ',
    Hint = ' ',
    Question = ' ',
  }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    signs = true,
    -- underline = false,
    update_in_insert = false,
    virtual_lines = false,
    severity_sort = true,
    -- No virtual text (distracting!), show popup window on hover.
    -- virtual_text = { spacing = 4, prefix = "●" },
    virtual_text = false,
    -- virtual_text = {
    --   severity = { min = vim.diagnostic.severity.WARN },
    -- source = true,
    --   prefix = vim.fn.has("nvim-0.10") > 0 and function(diagnostic) ---@param diagnostic Diagnostic
    --     return (icons[diagnostic.severity] or "") .. " "
    --   end,
    -- },
    underline = true,
    -- underline = {
    --   -- Do not underline text when severity is low (INFO or HINT).
    --   -- severity = { min = vim.diagnostic.severity.WARN },
    -- },
    float = {
      source = "always",
      focusable = true,
      focus = false,
      border = "rounded",

      -- Customize how diagnostic message will be shown: show error code.
      format = function(diagnostic)
        -- See null-ls.nvim#632, neovim#17222 for how to pick up `code`
        local user_data
        user_data = diagnostic.user_data or {}
        user_data = user_data.lsp or user_data.null_ls or user_data
        local code = (
        -- TODO: symbol is specific to pylint (will be removed)
          diagnostic.symbol
          or diagnostic.code
          or user_data.symbol
          or user_data.code
        )
        if code then
          return string.format("%s (%s)", diagnostic.message, code)
        else
          return diagnostic.message
        end
      end,
    },
  })
end

return M
