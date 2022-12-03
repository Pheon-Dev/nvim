local gs = package.loaded.gitsigns
local wk = require("which-key")
wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = {
    gc = "Comments",
  },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example: ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
  return lazygit:toggle()
end

local toggle_btop = function()
  local btop = Terminal:new({ cmd = "btop", direction = "float" })
  return btop:toggle()
end

local next_hunk = function()
  gs.next_hunk()
end

local prev_hunk = function()
  gs.prev_hunk()
end

local blame_line = function()
  gs.blame_line({ full = true })
end

local diff_this = gs.diffthis

local mappings = {
  [";"] = { ":TagbarToggle<cr>", "Tagbar" },
  ["'"] = { ":lua require'structrue-go'.toggle()<cr>", "Structrue" },
  a = { ":ASToggle<cr>", "Auto Save Toggle" },
  b = { ":Telescope buffers initial_mode=normal previewer=false theme=dropdown<cr>", "Buffers" },
  c = { ":lua require('harpoon.mark').clear_all()<cr>", "Clear All Marks" },
  d = {
    name = "DAP & Dashboard",
    d = { ":Dashboard<cr>", "Dashboard" },
    g = { ":lua require('dap-go').debug_test()<cr>", "Dap Go" },
    h = {
      name = "Telescope DAP",
      g = { ":Telescope dap commands theme=dropdown previewer=false initial_mode=normal<cr>", "Commands" },
      h = { ":Telescope dap configurations theme=ivy initial_mode=insert<cr>", "Configurations" },
      j = { ":Telescope dap list_breakpoints theme=ivy initial_mode=insert<cr>", "List Breakpoints" },
      k = { ":Telescope dap variables theme=ivy initial_mode=insert<cr>", "Variables" },
      l = { ":Telescope dap frames theme=ivy initial_mode=insert<cr>", "Framse" },
    },
    j = {
      name = "DAP",
      j = { ":lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      k = { ":lua require'dap'.repl.open()<cr>", "Open Repl" },
      h = { ":lua require'dap'.step_over()<cr>", "Step Over" },
      l = { ":lua require'dap'.step_into()<cr>", "Step Into" },
      c = { ":lua require'dap'.continue()<cr>", "Continue" },
    },
    k = {
      name = "DAP UI",
      j = { ":lua require'dapui'.open()<cr>", "Open" },
      l = { ":lua require'dapui'.close()<cr>", "Close" },
      k = { ":lua require'dapui'.toggle()<cr>", "Toggle" },
    },
  },
  e = { ":NvimTreeToggle<cr>", "Nvim Tree" },
  f = { ":Telescope find_files theme=dropdown initial_mode=insert<cr>", "Find Files" },
  g = {
    name = "Git",
    d = {
      name = "DiffView",
      x = { ":DiffviewClose<cr>", "Close" },
      f = { ":DiffviewFocusFiles<cr>", "Focus Files" },
      h = { ":DiffviewFileHistory %<cr>", "Current File History" },
      o = { ":DiffviewOpen<cr>", "Open" },
      r = { ":DiffviewRefresh<cr>", "Refresh" },
      t = { ":DiffviewToggleFiles<cr>", "Toggle Files" },
      w = { ":DiffviewFileHistory ", "Which File History" },
    },
    g = {
      name = "Gitsigns",
      s = {
        name = "Stage",
        s = { ":Gitsigns stage_hunk<CR>", "Stage Hunks" },
        b = { gs.stage_buffer, "Stage Buffer" },
        l = { gs.undo_stage_hunk, "Undo Stage Hunk" },
      },
      r = {
        name = "Reset",
        b = { gs.reset_buffer, "Reset Buffer" },
        h = { ":Gitsigns reset_hunk<CR>", "Reset Hunks" },
      },
      b = { blame_line, "Blame Line" },
      j = { next_hunk, "Next Hunk" },
      k = { prev_hunk, "Previous Hunk" },
      d = { diff_this, "Diff This" },
      x = { gs.toggle_deleted, "Toggle Deleted" },
    },
    t = {
      name = "Telescope git",
      b = { ":Telescope git_branches theme=dropdown previewer=false<cr>", "Git Branches" },
      c = { ":Telescope git_commits theme=dropdown initial_mode=normal<cr>", "Git Commits" },
      s = { ":Telescope git_status theme=dropdown initial_mode=normal<cr>", "Git Status" },
    },
    j = {
      name = "gh",
      p = { ":Telescope gh pull_request theme=ivy initial_mode=normal<cr>", "PR" },
      i = { ":Telescope gh issues initial_mode=normal<cr>", "Issues" },
    },
  },
  h = { ":Twilight<cr>", "Twilight" },
  i = { toggle_btop, "Btop" },
  j = { ":lua require('lir.float').toggle()<cr>", "Lir" },
  k = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
  l = { toggle_lazygit, "LazyGit" },
  n = { ":ReachOpen marks<cr>", "Marks" },
  m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark File" },
  o = {
    name = "Others",
    c = { ":Telescope command_history theme=dropdown previewer=false initial_mode=normal<cr>", "Command History" },
    b = { ":ReachOpen buffers<cr>", "Buffers" },
    m = { ":Mason<cr>", "Mason" },
    t = { ":Telescope help_tags theme=dropdown initial_mode=insert<cr>", "Help Tags" },
    n = { ":Telescope notify theme=dropdown initial_mode=normal<cr>", "Issues" },
    h = { ":Telescope harpoon marks theme=dropdown initial_mode=normal previewer=false<cr>", "Harpoon" },
  },
  p = {
    name = "Peas",
    p = { ":Telescope projects theme=dropdown initial_mode=normal previewer=false<cr>", "Projects" },
    f = { ":Prettier<cr><esc>:w! | noh<cr>", "Prettier" },
    l = { ":PackerLoad", "Packer Load arg1 arg2" },
    i = { ":PackerInstall<cr>", "Packer Install" },
    u = { ":PackerUpdate<cr>", "Packer Update" },
    x = { ":PackerClean<cr>", "Packer Clean" },
    c = { ":PackerCompile<cr>", "Packer Compile" },
    s = { ":PackerSync<cr>", "Packer Sync" },
  },
  q = { ":bd<cr>", "Close Buffer" },
  r = { ":RnvimrToggle<cr>", "Ranger" },
  s = { ":Telescope live_grep theme=dropdown<cr>", "Live Grep" },
  t = {
    name = "TODO | TypeScript | Terminal",
    a = { ":TypescriptAddMissingImports<cr>", "Add Missing Imports" },
    b = { ":ToggleTerm size=20 direction=horizontal<cr>", "Horizontal Terminal" },
    o = { ":TypescriptOrganizeImports<cr>", "Organise Imports" },
    r = { ":TypescriptRemoveUnused<cr>", "Remove Unused" },
    f = { ":TypescriptFixAll<cr>", "Fix All" },
    h = { ":TodoTrouble cwd=.<cr>", "Trouble" },
    j = {
      ":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<cr>",
      "Telescope",
    },
    k = { ":TodoQuickFix<cr>", "Quick Fix" },
    l = { ":TodoLocList<cr>", "Loclist" },
  },
  v = { ":VisitLinkUnderCursor<cr>", "Visit Link" },
  w = {
    name = "Windows",
    w = { ":WinShift<cr><esc>:WindowsEqualize<cr>", "Window Shift" },
    h = { ":WinShift left<cr><esc>:WindowsEqualize<cr>", "Shift Left" },
    j = { ":WinShift down<cr><esc>:WindowsEqualize<cr>", "Shift Down" },
    k = { ":WinShift up<cr><esc>:WindowsEqualize<cr>", "Shift Up" },
    l = { ":WinShift right<cr><esc>:WindowsEqualize<cr>", "Shift Right" },
  },
  x = { ":TroubleToggle<cr>", "Toggle Trouble" },
  z = { ":ZenMode<cr>", "Zen Mode" },
}

local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}
wk.register(mappings, opts)
