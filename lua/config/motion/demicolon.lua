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
    -- diagnostic_motions = false,
    -- Create `;` and `,` key mappings
    -- Create ; and , key mappings. Set it to 'stateless', 'stateful', or false to
    -- not create any mappings. 'stateless' means that ;/, move right/left.
    -- 'stateful' means that ;/, will remember the direction of the original
    -- jump, and `,` inverts that direction (Neovim's default behaviour).
    repeat_motions = 'stateless', -- true
    -- Keys that shouldn't be repeatable (because aren't motions), excluding the prefix `]`/`[`
    -- If you have custom motions that use one of these, make sure to remove that key from here
    disabled_keys = { 'p', 'I', 'A', 'f', 'i' },
  },
}

return M
