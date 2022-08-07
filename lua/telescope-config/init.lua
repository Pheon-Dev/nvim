local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    hidden = false,
    layout_config = {
      width = 0.75,
      prompt_position = "bottom",
      preview_cutoff = 120,
      horizontal = {mirror = false},
      vertical = {mirror = false}
    },
    find_command = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
    },
    prompt_prefix = " ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {"./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*"},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    },
  extensions = {
    bookmarks = {
        -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox', 'vivaldi'
        selected_browser = 'brave',

        -- Either provide a shell command to open the URL
        url_open_command = 'open',

        -- Or provide the plugin name which is already installed
        -- Available: 'vim_external', 'open_browser'
        url_open_plugin = 'vim_external',

        -- Show the full path to the bookmark instead of just the bookmark name
        full_path = true,
      },
    },
    -- frecency = {
    --   -- db_root = "home/pheon/path/to/db_root",
    --   show_scores = false,
    --   show_unindexed = true,
    --   ignore_patterns = {"*.git/*", "*/tmp/*"},
    --   disable_devicons = false,
    --   workspaces = {
    --     ["conf"]    = "/home/pheon/.config",
    --     ["data"]    = "/home/pheon/.local/share",
    --     ["project"] = "/home/pheon/projects",
    --     ["wiki"]    = "/home/pheon/wiki"
    --   }
    -- },
  },
  -- pickers = {
  --   find_files = {
  --     -- theme = "dropdown",
  --     hidden = false
  --   }
  -- }
}

require('telescope').load_extension "fzf"
-- require('telescope').load_extension "zoxide"
-- require('telescope').load_extension "neoclip"
-- require('telescope').load_extension "bookmarks"
-- require('telescope').load_extension "repo"
-- require('telescope').load_extension "frecency"
-- require('telescope').load_extension "gh"

-- local z_utils = require("telescope._extensions.zoxide.utils")

-- require("telescope._extensions.zoxide.config").setup({
-- {
--   prompt_title = "[ Zoxide List ]",
--
--   -- Zoxide list command with score
--   list_command = "zoxide query -ls",
--   mappings = {
--     default = {
--       action = function(selection)
--         vim.cmd("cd " .. selection.path)
--       end,
--       after_action = function(selection)
--         print("Directory changed to " .. selection.path)
--       end
--     },
--     ["<C-s>"] = { action = z_utils.create_basic_command("split") },
--     ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
--     ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
--     ["<C-b>"] = {
--       keepinsert = true,
--       action = function(selection)
--         builtin.file_browser({ cwd = selection.path })
--       end
--     },
--     ["<C-f>"] = {
--       keepinsert = true,
--       action = function(selection)
--         builtin.find_files({ cwd = selection.path })
--       end
--     }
--   }
-- }
-- })
