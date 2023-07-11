return {
  "nvim-lua/plenary.nvim",
{
    "junegunn/fzf",
    event = { "BufReadPost", "BufNewFile" },
    -- event = "VeryLazy",
},
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
