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
        disabledKeymaps = { "L", "r", "R" },
      })
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
