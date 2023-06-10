return {
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "BufReadPre",
    opts = { useDefaultKeymaps = true },
    config = function()
      require("various-textobjs").setup({
        lookForwardSmall = 5,
        lookForwardBig = 15,
        useDefaultKeymaps = true,
        -- disabledKeymaps = { "ai", "ii", "aI", "iI" },
      })
    end,
  },
  {
    "kana/vim-textobj-user",
    event = "BufReadPre",
    dependencies = {
      "beloglazov/vim-textobj-quotes",
      "kana/vim-textobj-entire",
    },
    config = function()
      vim.keymap.set("n", "q", "iq", { noremap = true, silent = true })
    end,
  },
  {
    "glts/vim-textobj-comment",
    keys = {
      { "ic", mode = { "o", "x" }, desc = "Select comment block" },
      { "ac", mode = { "o", "x" }, desc = "Select comment block" },
    },
    dependencies = { "kana/vim-textobj-user" },
  },
}
