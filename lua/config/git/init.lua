local M = {}

M.keys = {
  {
    "<leader>ga",
    mode = { "n" },
    function()
      require("gitsigns").stage_buffer()
    end,
    desc = "Stage Buffer",
  },
  {
    "<leader>gb",
    mode = { "n" },
    function()
      require("gitsigns").blame_line()
    end,
    desc = "Blame line",
  },
  {
    "<leader>gd",
    mode = { "n" },
    function()
      require("gitsigns").diff_this()
    end,
    desc = "Diff This",
  },
  {
    "<leader>gl",
    mode = { "n" },
    function()
      require("gitsigns").toggle_current_line_blame()
    end,
    desc = "Toggle Current Line Blame",
  },
  {
    "]h",
    mode = { "n" },
    function()
      require("gitsigns").next_hunk()
    end,
    desc = "Next Hunk",
  },
  {
    "[h",
    mode = { "n" },
    function()
      require("gitsigns").prev_hunk()
    end,
    desc = "Previous Hunk",
  },
  {
    "<leader>gu",
    mode = { "n" },
    function()
      require("gitsigns").undo_stage_hunk()
    end,
    desc = "Undo Stage Hunk",
  },
  {
    "<leader>gp",
    mode = { "n" },
    function()
      require("gitsigns").preview_hunk()
    end,
    desc = "Preview Hunk",
  },
  {
    "<leader>gr",
    mode = { "n" },
    function()
      require("gitsigns").reset_hunk()
    end,
    desc = "Reset Hunk",
  },
  {
    "<leader>gs",
    mode = { "n" },
    function()
      require("gitsigns").stage_hunk()
    end,
    desc = "Stage Hunk",
  },
  {
    "<leader>gt",
    mode = { "n" },
    function()
      require("gitsigns").select_hunk()
    end,
    desc = "Select Hunk",
  },
  {
    "<leader>gx",
    mode = { "n" },
    function()
      require("gitsigns").toggle_deleted()
    end,
    desc = "Toggle Deleted",
  },
}

M.config = function()
  require("gitsigns").setup({
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    auto_attach = true,
    signcolumn = false,
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = true,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    --[[ yadm = {
      enable = false,
    }, ]]
  })
end

return M
