return {
  "nvim-lua/plenary.nvim",

  "Pheon-Dev/harpoon",
  -- "ThePrimeagen/harpoon",
  {
    "booperlv/nvim-gomove",
    event = "BufReadPre",
    config = function()
      require("gomove").setup({
        -- whether or not to map default key bindings, (true/false)
        map_defaults = false,
        -- whether or not to reindent lines moved vertically (true/false)
        reindent = true,
        -- whether or not to undojoin same direction moves (true/false)
        undojoin = true,
        -- whether to not to move past end column when moving blocks horizontally, (true/false)
        move_past_end_col = false,
      })
    end,
  },
  { "kevinhwang91/nvim-hlslens", event = "BufReadPre", config = true },

  -- { "ckipp01/stylua-nvim" },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()

      --           Old text                    Command         New text
      -- --------------------------------------------------------------------------------
      --     surr*ound_words             ysiw)           (surround_words)
      --     *make strings               ys$"            "make strings"
      --     [delete ar*ound me!]        ds]             delete around me!
      --     remove <b>HTML t*ags</b>    dst             remove HTML tags
      --     'change quot*es'            cs'"            "change quotes"
      --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
      --     delete(functi*on calls)     dsf             function calls
    end,
  },
  {
    "xiyaowong/virtcolumn.nvim",
    event = "BufReadPre",
  },
  {
    "utilyre/sentiment.nvim",
    event = "BufReadPre",
    config = function()
      require("sentiment").setup({})
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "BufReadPre",
  },
  {
    "smjonas/inc-rename.nvim",
    event = "BufReadPre",
    cmd = "IncRename",
    config = true,
    -- config = function()
    --   require("inc_rename").setup {
    --     input_buffer_type = "dressing",
    --   }
    -- end,
  },
}
