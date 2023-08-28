return {
  {
    "echasnovski/mini.pairs",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mini.splitjoin").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        -- Created for both Normal and Visual modes.
        mappings = {
          toggle = 'gS',
          split = '',
          join = '',
        },

        -- Detection options: where split/join should be done
        detect = {
          -- Array of Lua patterns to detect region with arguments.
          -- Default: { '%b()', '%b[]', '%b{}' }
          brackets = nil,

          -- String Lua pattern defining argument separator
          separator = ',',

          -- Array of Lua patterns for sub-regions to exclude separators from.
          -- Enables correct detection in presence of nested brackets and quotes.
          -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
          exclude_regions = nil,
        },

        -- Split options
        split = {
          hooks_pre = {},
          hooks_post = {},
        },

        -- Join options
        join = {
          hooks_pre = {},
          hooks_post = {},
        },
      })
    end,
  },
  {
    "echasnovski/mini.move",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- No need to copy this inside `setup()`. Will be used automatically.
      local config = {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = 'H',
          right = 'L',
          down = 'J',
          up = 'K',

          -- Move current line in Normal mode
          line_left = '<',
          line_right = '>',
          line_down = '-',
          line_up = '=',
        },

        -- Options which control moving behavior
        options = {
          -- Automatically reindent selection during linewise vertical move
          reindent_linewise = true,
        },
      }
      require("mini.move").setup(config)
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "alpha", "lazy", "floaterm", "NvimTree" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require("mini.indentscope").setup({
        symbol = "│",
        -- symbol = "┊",
        options = { try_as_border = true },
      })
    end,
  },
}
