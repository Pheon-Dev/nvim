return {
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "BufReadPre",
  --   config = function()
  --     require("chatgpt").setup()
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },
  {
    "Exafunction/codeium.vim",
    event = "VeryLazy",
    config = function()
      -- vim.g.codeium_disable_bindings = 1
    end,
  },
}
