return {
  {
    "Exafunction/codeium.vim",
    keys = {
      {
        "<C-l>",
        mode = { "i" },
        function()
  return vim.fn["codeium#Accept"]()
        end,
        desc = "Accept Suggestion",
      },
      {
        "<C-n>",
        mode = { "i" },
        function()
  return vim.fn["codeium#CycleCompletions"](1)
        end,
        desc = "Cycle Completions Forward",
      },
      {
        "<C-p>",
        mode = { "i" },
        function()
  return vim.fn["codeium#CycleCompletions"](-1)
        end,
        desc = "Cycle Completions Backward",
      },
      {
        "<C-u>",
        mode = { "i" },
        function()
  return vim.fn["codeium#Clear"]()
        end,
        desc = "Clear Completions",
      },
    },
    config = function()
    end,
  },
}
