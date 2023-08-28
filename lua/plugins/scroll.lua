return {
  {
    'declancm/cinnamon.nvim',
    event = { "BufReadPost", "BufNewFile" },
    -- event = "VeryLazy",
    enabled = true,
    config = function()
      require('cinnamon').setup {
        -- KEYMAPS:
        default_keymaps = true,   -- Create default keymaps.
        extra_keymaps = false,    -- Create extra keymaps.
        extended_keymaps = false, -- Create extended keymaps.
        override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

        -- OPTIONS:
        always_scroll = false,    -- Scroll the cursor even when the window hasn't scrolled.
        centered = true,          -- Keep cursor centered in window when using window scrolling.
        disabled = false,         -- Disables the plugin.
        default_delay = 7,        -- The default delay (in ms) between each line when scrolling.
        hide_cursor = true,       -- Hide the cursor while scrolling. Requires enabling termguicolors!
        horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
        max_length = -1,          -- Maximum length (in ms) of a command. The line delay will be
        -- re-calculated. Setting to -1 will disable this option.
        scroll_limit = 150,       -- Max number of lines moved before scrolling is skipped. Setting
        -- to -1 will disable this option.
      }

      -- Half-window movements:
      vim.keymap.set({ 'n', 'x' }, '<C-u>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<C-d>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

      -- Page movements:
      vim.keymap.set({ 'n', 'x' }, '<C-b>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<C-f>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<PageUp>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<PageDown>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

      -- EXTRA_KEYMAPS:

      -- Start/end of file and line number movements:
      vim.keymap.set({ 'n', 'x' }, 'gg', "<Cmd>lua Scroll('gg')<CR>")
      vim.keymap.set({ 'n', 'x' }, 'G', "<Cmd>lua Scroll('G', 0, 1)<CR>")

      -- Start/end of line:
      vim.keymap.set({ 'n', 'x' }, '0', "<Cmd>lua Scroll('0')<CR>")
      vim.keymap.set({ 'n', 'x' }, '^', "<Cmd>lua Scroll('^')<CR>")
      vim.keymap.set({ 'n', 'x' }, '$', "<Cmd>lua Scroll('$', 0, 1)<CR>")

      -- Paragraph movements:
      vim.keymap.set({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{')<CR>")
      vim.keymap.set({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}')<CR>")

      -- Previous/next search result:
      vim.keymap.set('n', 'n', "<Cmd>lua Scroll('n', 1)<CR>")
      vim.keymap.set('n', 'N', "<Cmd>lua Scroll('N', 1)<CR>")
      vim.keymap.set('n', '*', "<Cmd>lua Scroll('*', 1)<CR>")
      vim.keymap.set('n', '#', "<Cmd>lua Scroll('#', 1)<CR>")
      vim.keymap.set('n', 'g*', "<Cmd>lua Scroll('g*', 1)<CR>")
      vim.keymap.set('n', 'g#', "<Cmd>lua Scroll('g#', 1)<CR>")

      -- Previous/next cursor location:
      vim.keymap.set('n', '<C-o>', "<Cmd>lua Scroll('<C-o>', 1)<CR>")
      vim.keymap.set('n', '<C-i>', "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

      -- Screen scrolling:
      vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
      vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
      vim.keymap.set('n', '<C-l>', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
      vim.keymap.set('n', '<C-h>', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
      vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
      vim.keymap.set('n', 'z.', "<Cmd>lua Scroll('z.', 0, 1)<CR>")
      vim.keymap.set('n', 'z<CR>', "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
      vim.keymap.set('n', 'z-', "<Cmd>lua Scroll('z-', 0, 1)<CR>")
      vim.keymap.set('n', 'z^', "<Cmd>lua Scroll('z^', 0, 1)<CR>")
      vim.keymap.set('n', 'z+', "<Cmd>lua Scroll('z+', 0, 1)<CR>")
      vim.keymap.set('n', '<C-y>', "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
      vim.keymap.set('n', '<C-e>', "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

      -- Horizontal screen scrolling:
      vim.keymap.set('n', 'zH', "<Cmd>lua Scroll('zH')<CR>")
      vim.keymap.set('n', 'zL', "<Cmd>lua Scroll('zL')<CR>")
      vim.keymap.set('n', 'zs', "<Cmd>lua Scroll('zs')<CR>")
      vim.keymap.set('n', 'ze', "<Cmd>lua Scroll('ze')<CR>")
      vim.keymap.set('n', 'zh', "<Cmd>lua Scroll('zh', 0, 1)<CR>")
      vim.keymap.set('n', 'zl', "<Cmd>lua Scroll('zl', 0, 1)<CR>")

      -- EXTENDED_KEYMAPS:

      -- Up/down movements:
      vim.keymap.set({ 'n', 'x' }, 'k', "<Cmd>lua Scroll('k', 0, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, 'j', "<Cmd>lua Scroll('j', 0, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<Up>', "<Cmd>lua Scroll('k', 0, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<Down>', "<Cmd>lua Scroll('j', 0, 1)<CR>")

      -- Left/right movements:
      vim.keymap.set({ 'n', 'x' }, 'h', "<Cmd>lua Scroll('h', 0, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, 'l', "<Cmd>lua Scroll('l', 0, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<Left>', "<Cmd>lua Scroll('h', 0, 1)<CR>")
      vim.keymap.set({ 'n', 'x' }, '<Right>', "<Cmd>lua Scroll('l', 0, 1)<CR>")

      -- SCROLL_WHEEL_KEYMAPS:

      vim.keymap.set({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
      vim.keymap.set({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

      -- LSP_KEYMAPS:

      -- LSP go-to-definition:
      vim.keymap.set('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")

      -- LSP go-to-declaration:
      vim.keymap.set('n', 'gD', "<Cmd>lua Scroll('declaration')<CR>")
    end
  },
  {
    "karb94/neoscroll.nvim",
    enabled = false,
    event = { "BufReadPost", "BufNewFile" },
    -- event = "VeryLazy",
    config = function()
      local ok, neoscroll = pcall(require, "neoscroll")

      if not ok then
        return
      end
      -- local ot, ts_ctx = require("treesitter-context")

      neoscroll.setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = "cubic",   -- quadratic, cubic, quartic, quintic, circular, sine
        pre_hook = function()        -- Function to run before the scrolling animation starts
          -- ts_ctx.disable()
          -- vim.cmd [[TSBufToggle highlight]]
        end,
        post_hook = function() -- Function to run after the scrolling animation ends
          -- ts_ctx.enable()
          -- vim.cmd [[TSBufToggle highlight]]
        end,
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      })

      -- Syntax scrolling function: `scroll(lines, move_cursor, time[, easing_function_name])`
      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }
      t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '250' } }
      t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
      t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
      t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
      t['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
      t['<C-h>'] = { 'zt', { '250' } }
      t['<C-l>'] = { 'zb', { '250' } }
      t['M'] = { 'zz', { '250' } }
      t['zt'] = { 'zt', { '250' } }
      t['zz'] = { 'zz', { '250' } }
      t['zb'] = { 'zb', { '250' } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
}

-- The :SatelliteDisable command disables scrollbars.
-- The :SatelliteEnable command enables scrollbars. This is only necessary if scrollbars have previously been disabled.
-- The :SatelliteRefresh command refreshes the scrollbars. This is relevant when the scrollbars are out-of-sync, which can occur as a result of some window arrangement actions.
--
