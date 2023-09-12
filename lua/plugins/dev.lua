return {
  "folke/neodev.nvim",
  enabled = false,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    debug = true,
    experimental = {
      pathStrict = true,
    },
  },
}
