return {
  {
    "echasnovski/mini.pairs",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mini.pairs").setup()
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
