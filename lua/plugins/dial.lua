return {
  {
    "monaqa/dial.nvim",
    event = "VeryLazy",
    config = function()
      local map = vim.api.nvim_set_keymap
      map("n", "<C-x>", require("dial.map").inc_normal(), { noremap = true })
      map("n", "X", require("dial.map").dec_normal(), { noremap = true })
      map("v", "<C-x>", require("dial.map").inc_visual(), { noremap = true })
      map("v", "X", require("dial.map").dec_visual(), { noremap = true })
      map("v", "g<C-x>", require("dial.map").inc_gvisual(), { noremap = true })
      map("v", "gX", require("dial.map").dec_gvisual(), { noremap = true })

    end
  },
}
