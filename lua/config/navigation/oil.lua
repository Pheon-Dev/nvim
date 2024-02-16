local M = {}

M.dependencies = { "nvim-tree/nvim-web-devicons", "SirZenith/oil-vcs-status" }

M.config = function()
  require("oil").setup({
    -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
    -- Set to false if you still want to use netrw.
    default_file_explorer = true,
    -- Id is automatically added at the beginning, and name at the end
    -- See :help oil-columns
    columns = {
      -- "size",
      -- "permissions",
      -- "mtime",
      "icon",
    },
    -- Buffer-local options to use for oil buffers
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },
    -- Window-local options to use for oil buffers
    win_options = {
      wrap = false,
      signcolumn = "yes:2",
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = false,
    -- Skip the confirmation popup for simple operations
    skip_confirm_for_simple_edits = false,
    -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
    prompt_save_on_select_new_entry = true,
    -- Oil will automatically delete hidden buffers after this delay
    -- You can set the delay to false to disable cleanup entirely
    -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
    cleanup_delay_ms = 2000,
    -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
    -- Additionally, if it is a string that matches "actions.<name>",
    -- it will use the mapping at require("oil.actions").<name>
    -- Set to `false` to remove a keymap
    -- See :help oil-actions for a list of all available actions
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["l"] = "actions.select",
      ["<C-k>"] = "actions.select_vsplit",
      ["<C-j>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["q"] = "actions.close",
      ["esc"] = "actions.close",
      ["r"] = "actions.refresh",
      ["h"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
    -- Set to false to disable all of the above keymaps
    use_default_keymaps = true,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = false,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
      -- This function defines what will never be shown, even when `show_hidden` is set
      is_always_hidden = function(name, bufnr)
        return false
      end,
      sort = {
        -- sort order can be "asc" or "desc"
        -- see :help oil-columns to see which columns are sortable
        { "type", "asc" },
        { "name", "asc" },
      },
    },
    -- Configuration for the floating window in oil.open_float
    float = {
      -- Padding around the floating window
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },
    -- Configuration for the actions floating preview window
    preview = {
      -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_width and max_width can be a single value or a list of mixed integer/float types.
      -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
      max_width = 0.9,
      -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
      min_width = { 40, 0.4 },
      -- optionally define an integer/float for the exact width of the preview window
      width = nil,
      -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- min_height and max_height can be a single value or a list of mixed integer/float types.
      -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
      max_height = 0.9,
      -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
      min_height = { 5, 0.1 },
      -- optionally define an integer/float for the exact height of the preview window
      height = nil,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    -- Configuration for the floating progress window
    progress = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      minimized_border = "none",
      win_options = {
        winblend = 0,
      },
    },
  })

  local status_const = require("oil-vcs-status.constant.status")

  local StatusType = status_const.StatusType

  require("oil-vcs-status").setup({
    -- Executable path of each version control system.
    vcs_executable = {
      git = "git",
      svn = "svn",
    },

    -- If trigger time between two file system event of the same entry is less
    -- than this value, newer event will be ignored, unit: milisecond.
    ---@type integer
    fs_event_debounce = 500,

    -- Sign character used by each status.
    ---@type table<oil-vcs-status.StatusType, string>
    status_symbol = {
      [StatusType.Added] = "",
      [StatusType.Copied] = "󰆏",
      [StatusType.Deleted] = "",
      [StatusType.Ignored] = "",
      [StatusType.Modified] = "",
      [StatusType.Renamed] = "",
      [StatusType.TypeChanged] = "󰉺",
      [StatusType.Unmodified] = " ",
      [StatusType.Unmerged] = "",
      [StatusType.Untracked] = "",
      [StatusType.External] = "",

      [StatusType.UpstreamAdded] = "󰈞",
      [StatusType.UpstreamCopied] = "󰈢",
      [StatusType.UpstreamDeleted] = "",
      [StatusType.UpstreamIgnored] = " ",
      [StatusType.UpstreamModified] = "󰏫",
      [StatusType.UpstreamRenamed] = "",
      [StatusType.UpstreamTypeChanged] = "󱧶",
      [StatusType.UpstreamUnmodified] = " ",
      [StatusType.UpstreamUnmerged] = "",
      [StatusType.UpstreamUntracked] = " ",
      [StatusType.UpstreamExternal] = "",
    },

    -- Highlight group name used by each status type.
    ---@type table<oil-vcs-status.StatusType, string | false>
    status_hl_group = {
      [StatusType.Added] = "OilVcsStatusAdded",
      [StatusType.Copied] = "OilVcsStatusCopied",
      [StatusType.Deleted] = "OilVcsStatusDeleted",
      [StatusType.Ignored] = "OilVcsStatusIgnored",
      [StatusType.Modified] = "OilVcsStatusModified",
      [StatusType.Renamed] = "OilVcsStatusRenamed",
      [StatusType.TypeChanged] = "OilVcsStatusTypeChanged",
      [StatusType.Unmodified] = "OilVcsStatusUnmodified",
      [StatusType.Unmerged] = "OilVcsStatusUnmerged",
      [StatusType.Untracked] = "OilVcsStatusUntracked",
      [StatusType.External] = "OilVcsStatusExternal",

      [StatusType.UpstreamAdded] = "OilVcsStatusUpstreamAdded",
      [StatusType.UpstreamCopied] = "OilVcsStatusUpstreamCopied",
      [StatusType.UpstreamDeleted] = "OilVcsStatusUpstreamDeleted",
      [StatusType.UpstreamIgnored] = "OilVcsStatusUpstreamIgnored",
      [StatusType.UpstreamModified] = "OilVcsStatusUpstreamModified",
      [StatusType.UpstreamRenamed] = "OilVcsStatusUpstreamRenamed",
      [StatusType.UpstreamTypeChanged] = "OilVcsStatusUpstreamTypeChanged",
      [StatusType.UpstreamUnmodified] = "OilVcsStatusUpstreamUnmodified",
      [StatusType.UpstreamUnmerged] = "OilVcsStatusUpstreamUnmerged",
      [StatusType.UpstreamUntracked] = "OilVcsStatusUpstreamUntracked",
      [StatusType.UpstreamExternal] = "OilVcsStatusUpstreamExternal",
    },

    -- Sign priority of each staus. When sign column width is less then staus
    -- symbol number, symbol with higher priority will be shown.
    -- If signcolumn is wide enough, signs will be display from left to right in
    -- order of priority from low to high.
    ---@type table<oil-vcs-status.StatusType, number>
    status_priority = {
      [StatusType.UpstreamIgnored] = 0,
      [StatusType.Ignored] = 0,

      [StatusType.UpstreamUntracked] = 1,
      [StatusType.Untracked] = 1,

      [StatusType.UpstreamUnmodified] = 2,
      [StatusType.Unmodified] = 2,
      [StatusType.UpstreamExternal] = 2,
      [StatusType.External] = 2,

      [StatusType.UpstreamCopied] = 3,
      [StatusType.UpstreamRenamed] = 3,
      [StatusType.UpstreamTypeChanged] = 3,

      [StatusType.UpstreamDeleted] = 4,
      [StatusType.UpstreamModified] = 4,
      [StatusType.UpstreamAdded] = 4,

      [StatusType.UpstreamUnmerged] = 5,

      [StatusType.Copied] = 13,
      [StatusType.Renamed] = 13,
      [StatusType.TypeChanged] = 13,

      [StatusType.Deleted] = 14,
      [StatusType.Modified] = 14,
      [StatusType.Added] = 14,

      [StatusType.Unmerged] = 15,
    },
  })
end

return M
