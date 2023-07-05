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
  {
    "utilyre/sentiment.nvim",
    event = "BufReadPre",
    config = function()
      require("sentiment").setup({})
    end,
  },
}
