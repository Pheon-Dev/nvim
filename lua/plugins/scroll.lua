return {
  {
    "karb94/neoscroll.nvim",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    -- event = "VeryLazy",
    config = function()
      local ok, neoscroll = pcall(require, "neoscroll")

      if not ok then
        return
      end
      -- local ot, ts_ctx = require("treesitter-context")
      local ok, p = pcall(require, "ufo")
      if not ok then return end
      -- if not ot then return end

      neoscroll.setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = "cubic",   -- quadratic, cubic, quartic, quintic, circular, sine
        pre_hook = function()        -- Function to run before the scrolling animation starts
          p.disable()
          -- ts_ctx.disable()
          -- vim.cmd [[TSBufToggle highlight]]
        end,
        post_hook = function() -- Function to run after the scrolling animation ends
          p.enable()
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
      t['zt'] = { 'zt', { '250' } }
      t['zz'] = { 'zz', { '250' } }
      t['zb'] = { 'zb', { '250' } }

      require("neoscroll.config").set_mappings(t)
    end,
  },
  {
    "lewis6991/satellite.nvim",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("satellite").setup({
        current_only = false,
        winblend = 50,
        zindex = 40,
        excluded_filetypes = {},
        width = 2,
        handlers = {
          search = {
            enable = true,
          },
          diagnostic = {
            enable = true,
            signs = { "-", "=", "≡" },
            min_severity = vim.diagnostic.severity.HINT,
          },
          gitsigns = {
            enable = true,
            signs = { -- can only be a single character (multibyte is okay)
              add = "│",
              change = "│",
              delete = "-",
            },
          },
          marks = {
            enable = true,
            show_builtins = true, -- shows the builtin marks like [ ] < >
          },
        },
      })
    end,
  },
}

-- The :SatelliteDisable command disables scrollbars.
-- The :SatelliteEnable command enables scrollbars. This is only necessary if scrollbars have previously been disabled.
-- The :SatelliteRefresh command refreshes the scrollbars. This is relevant when the scrollbars are out-of-sync, which can occur as a result of some window arrangement actions.
--
