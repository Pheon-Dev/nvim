local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup({
  defaults = {
    hidden = false,
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '   ',
    --[[ initial_mode = "insert", ]]
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
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    extensions = {
      frecency = {
        db_root = "~/.local/share/nvim",
        --[[ show_filter_column = { "LSP", "CWD", "FOO" }, ]]
        show_scores = false,
        show_unindexed = true,
        ignore_patterns = { "*.git/*", "*/tmp/*" },
        disable_devicons = true,
        workspaces = {
          ["conf"]    = "~/.config",
          ["data"]    = "~/.local/share",
          ["project"] = "~/projects",
          ["wiki"]    = "~/wiki"
        }
      }
    },
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
      theme = "dropdown", -- cursor , dropdown, ivy
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

require("telescope").load_extension("harpoon")
require("telescope").load_extension("noice")
require('telescope').load_extension("repo")
require('telescope').load_extension("dap")
require('telescope').load_extension("live_grep_args")
require('telescope').load_extension("frecency")

--[[ require'telescope'.extensions.dap.commands{} ]]
--[[ require'telescope'.extensions.dap.configurations{} ]]
--[[ require'telescope'.extensions.dap.list_breakpoints{} ]]
--[[ require'telescope'.extensions.dap.variables{} ]]
--[[ require'telescope'.extensions.dap.frames{} ]]

local z_utils = require("telescope._extensions.zoxide.utils")
require("telescope._extensions.zoxide.config").setup({
  {
    prompt_title = "[ Zoxide List ]",
    -- Zoxide list command with score
    list_command = "zoxide query -ls",
    mappings = {
      default = {
        action = function(selection)
          vim.cmd("cd " .. selection.path)
        end,
        after_action = function(selection)
          print("Directory changed to " .. selection.path)
        end
      },
      ["<C-s>"] = { action = z_utils.create_basic_command("split") },
      ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
      ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
      ["<C-b>"] = {
        keepinsert = true,
        action = function(selection)
          builtin.file_browser({ cwd = selection.path })
        end
      },
      ["<C-f>"] = {
        keepinsert = true,
        action = function(selection)
          builtin.find_files({ cwd = selection.path })
        end
      }
    }
  }
})
