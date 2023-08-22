return {
  {
    "nvim-telescope/telescope.nvim",
    -- event = "VeryLazy",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    cmd = "Telescope",
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          hidden = true,
          find_command = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "   ",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "vertical",
          layout_config = {
            horizontal = { mirror = false },
            vertical = { mirror = false },
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" }, -- "smart"
          winblend = 0,
          border = {}, --[[ borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, ]]
          color_devicons = true,
          use_less = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          extensions = {},
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default + actions.center,
              ["<C-l>"] = actions.select_default + actions.center,
            },
            n = {
              ["h"] = actions.close,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["l"] = actions.select_default + actions.center,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-e>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          buffers = {
            -- theme = "dropdown",
            initial_mode = "normal",
            previewer = false,
          },
          lsp_references = {
            theme = "ivy",
            initial_mode = "normal",
          },
          lsp_definitions = {
            theme = "ivy",
            initial_mode = "normal",
          },
          lsp_declarations = {
            theme = "ivy",
            initial_mode = "normal",
          },
          lsp_implementations = {
            theme = "ivy",
            initial_mode = "normal",
          },
        },
      })

      require("telescope").load_extension("noice")
      require("telescope").load_extension("notify")
      require("telescope").load_extension("yank_history")
    end,
  },
}
