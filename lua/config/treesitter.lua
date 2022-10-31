vim.lsp.handlers['textDocument/publishDiagnostics'] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = { spacing = 5, severity_limit = 'Warning' },
  update_in_insert = true
})

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "javascript", "lua", "typescript", "tsx", "vue", "json", "css", "prisma", "bash" },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" }, -- optional, list of language that will be disabled
    -- [options]
    --:MatchupWhereAmI?
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    highlight_current_scope = { enable = false },
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil
  },
  autopairs = { enable = true }
}
