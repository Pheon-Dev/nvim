return {
  "nvim-lua/plenary.nvim",
  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
  },
  {
    "Pheon-Dev/harpoon",
    -- "ThePrimeagen/harpoon",
  },
  {
    "utilyre/sentiment.nvim",
    event = "BufReadPre",
    config = function()
      require("sentiment").setup({})
    end,
  },
}
