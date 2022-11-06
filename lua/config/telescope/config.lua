local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local fb_actions = require "telescope".extensions.file_browser.actions

local z_utils = require("telescope._extensions.zoxide.utils")
require("telescope._extensions.zoxide.config").setup({
  {
    prompt_title = "[ Zoxide List ]",
    -- Zoxide list command with score
    -- yay -S zoxide z
    -- zoxide import --from z ~/.z
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
    prompt_prefix = '  ',
    selection_caret = '  ',
    entry_prefix = '   ',
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
    --[[ borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, ]]
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
    zoxide = {
      prompt_title = "[ Walking on the shoulders of TJ ]",
      mappings = {
        default = {
          after_action = function(selection)
            print("Update to (" .. selection.z_score .. ") " .. selection.path)
          end
        },
        ["<C-s>"] = {
          before_action = function(selection) print("before C-s") end,
          action = function(selection)
            vim.cmd("edit " .. selection.path)
          end
        },
        ["<C-q>"] = { action = z_utils.create_basic_command("split") },
      },
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<A-c>"] = fb_actions.create,
          ["<S-CR>"] = fb_actions.create_from_prompt,
          ["<A-r>"] = fb_actions.rename,
          ["<A-m>"] = fb_actions.move,
          ["<A-y>"] = fb_actions.copy,
          ["<A-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-g>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-s>"] = fb_actions.toggle_all,
        },
        ["n"] = {
          ["c"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["m"] = fb_actions.move,
          ["y"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["o"] = fb_actions.open,
          ["g"] = fb_actions.goto_parent_dir,
          ["e"] = fb_actions.goto_home_dir,
          ["w"] = fb_actions.goto_cwd,
          ["t"] = fb_actions.change_cwd,
          ["f"] = fb_actions.toggle_browser,
          ["."] = fb_actions.toggle_hidden,
          ["s"] = fb_actions.toggle_all,
        },
      },
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
require('telescope').load_extension("file_browser")
require('telescope').load_extension("projects")
