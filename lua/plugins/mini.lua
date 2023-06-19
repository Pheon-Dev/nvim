return {
  {
    "echasnovski/mini.pairs",
    event = "BufReadPre",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPre",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "alpha", "lazy", "NvimTree" },
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

  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")

      -- local function put(cmd, regtype)
      --   local body = vim.fn.getreg(vim.v.register)
      --   local type = vim.fn.getregtype(vim.v.register)
      --   ---@diagnostic disable-next-line: param-type-mismatch
      --   vim.fn.setreg(vim.v.register, body, regtype or "l")
      --   bracketed.register_put_region()
      --   vim.cmd(('normal! "%s%s'):format(vim.v.register, cmd:lower()))
      --   ---@diagnostic disable-next-line: param-type-mismatch
      --   vim.fn.setreg(vim.v.register, body, type)
      -- end
      --
      -- for _, cmd in ipairs({ "]p", "[p" }) do
      --   vim.keymap.set("n", cmd, function()
      --     put(cmd)
      --   end)
      -- end
      -- for _, cmd in ipairs({ "]P", "[P" }) do
      --   vim.keymap.set("n", cmd, function()
      --     put(cmd, "c")
      --   end)
      -- end
      --
      -- local put_keys = { "p", "P" }
      -- for _, lhs in ipairs(put_keys) do
      --   vim.keymap.set({ "n", "x" }, lhs, function()
      --     return bracketed.register_put_region(lhs)
      --   end, { expr = true })
      -- end

      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },
}
