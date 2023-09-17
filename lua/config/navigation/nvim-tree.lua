local M = {}

M.cmd = "NvimTreeToggle"

M.config = function()
  local ok, _ = pcall(require, "nvim-tree")
  if not ok then
    vim.notify("Nvim-Tree didn't load properly!", "error")
  end
  -- local tree_cb = require("nvim-tree.config").nvim_tree_callback

  local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function retain_focus(action)
      local eventignore = vim.opt.eventignore:get()
      vim.opt.eventignore:append("WinLeave")
      if action == "Create" then
        api.fs.create()
      end
      if action == "Rename" then
        api.fs.rename()
      end
      if action == "Delete" then
        api.fs.remove()
      end
      vim.opt.eventignore = eventignore
    end

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings. Feel free to modify or remove as you wish.
    --
    -- BEGIN_DEFAULT_ON_ATTACH
    vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
    vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
    vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
    vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
    vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "b", api.node.open.horizontal, opts("Open: Horizontal Split"))
    vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
    vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
    vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
    vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
    vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
    vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "a", function()
      retain_focus("Create")
    end, opts("Create"))
    vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
    vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
    vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
    vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
    vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
    vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
    vim.keymap.set("n", "d", function()
      retain_focus("Delete")
    end, opts("Delete"))
    vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
    vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
    vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
    vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
    vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
    vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
    vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
    vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
    vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
    vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
    vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
    vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
    vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
    vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
    vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
    vim.keymap.set("n", "q", api.tree.close, opts("Close"))
    vim.keymap.set("n", ";", api.tree.close, opts("Close"))
    vim.keymap.set("n", "r", function()
      retain_focus("Rename")
    end, opts("Rename"))
    vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
    vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
    vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
    vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
    vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
    vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
    vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
    vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
    vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
    -- END_DEFAULT_ON_ATTACH

    -- Mappings migrated from view.mappings.list
    --
    -- You will need to insert "your code goes here" for any mappings with a custom action_cb

    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
  end

  local width = math.floor(vim.o.columns * 0.2)
  local height = math.floor(vim.o.lines * 0.90)
  local gh = vim.api.nvim_list_uis()[1].height
  local gw = vim.api.nvim_list_uis()[1].width

  _.setup({
    on_attach = on_attach,
    sync_root_with_cwd = true,
    auto_reload_on_write = true,
    respect_buf_cwd = true,
    disable_netrw = false,
    hijack_netrw = false,
    open_on_tab = false,
    hijack_cursor = false,
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    reload_on_bufenter = false,
    select_prompts = false,
    update_cwd = false,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      update_root = true,
      ignore_list = {},
    },
    hijack_unnamed_buffer_when_opening = false,
    view = {
      adaptive_size = true,
      width = 30,
      side = "left",
      -- mappings = {
      -- 	custom_only = false,
      -- 	list = {
      -- 		{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
      -- 		{ key = "h", cb = tree_cb("close_node") },
      -- 		{ key = "v", cb = tree_cb("vsplit") },
      -- 		{ key = "C", cb = tree_cb("cd") },
      -- 	},
      -- },
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = width,
          height = height,
          row = (gh - height) * 0.5,
          col = (gw - width) * 0.95,
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    renderer = {
      add_trailing = true,
      group_empty = false,
      full_name = false,
      highlight_modified = "none",
      highlight_git = true,
      highlight_opened_files = "none",
      root_folder_label = ":~:s?$?/..?",
      -- root_folder_label = false,
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },

      icons = {
        webdev_colors = true,
        modified_placement = "after",
        git_placement = "before",
        padding = " ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = true,
        },

        glyphs = {
          default = "",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "", -- ○
            arrow_closed = "", -- ●
          },
          git = {
            unstaged = "∗",
            staged = "✓",
            unmerged = "",
            renamed = "",
            untracked = "…",
            deleted = "",
            ignored = "",
          },
        },
      },
    },
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    system_open = {
      cmd = "", -- nil
      args = {},
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    filters = {
      dotfiles = false,
      git_clean = false,
      no_buffer = false,
      exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
      custom = { "node_modules", ".cache" },
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 50,
      ignore_dirs = {},
    },
    git = {
      enable = true,
      ignore = false,
      show_on_dirs = true,
      show_on_open_dirs = true,
      timeout = 200,
    },
    modified = {
      enable = false,
      show_on_dirs = true,
      show_on_open_dirs = true,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      expand_all = {
        max_folder_discovery = 300,
        exclude = {},
      },
      file_popup = {
        open_win_config = {
          col = 1,
          row = 1,
          relative = "cursor",
          border = "shadow",
          style = "minimal",
        },
      },
      open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
          enable = true,
          picker = "default",
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
      remove_file = {
        close_window = true,
      },
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = true,
    },
    tab = {
      sync = {
        open = false,
        close = false,
        ignore = {},
      },
    },
    notify = {
      threshold = vim.log.levels.INFO,
    },
    ui = {
      confirm = {
        remove = true,
        trash = true,
      },
    },
    experimental = {
      git = {
        async = true,
      },
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        dev = false,
        diagnostics = false,
        git = false,
        profile = false,
        watcher = false,
      },
    },
  })
end

return M
