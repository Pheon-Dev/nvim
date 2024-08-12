local M = {}

M.dependencies = {
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
}

M.opts = {
  diagnostic = {
    -- See `:help vim.diagnostic.Opts.Float`
    float = {},
  },
  -- Create default keymaps
  keymaps = {
    -- Create `t`/`T`/`f`/`F` key mappings
    horizontal_motions = true,
    -- Create ]d/[d, etc. key mappings to jump to diganostics. See demicolon.keymaps.create_default_diagnostic_keymaps
    diagnostic_motions = false,
    -- Create `;` and `,` key mappings
    repeat_motions = true,
  },
}

return M
