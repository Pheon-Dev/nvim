local wk = require("which-key")
wk.setup({
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      nav = false,
      z = false,
      g = false,
    },
  },
})

local Terminal = require("toggleterm.terminal").Terminal

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
  return lazygit:toggle()
end

local mappings = {
  a = { ":Telescope live_grep theme=dropdown<cr>", "Live Grep" },
  b = { ":Telescope buffers initial_mode=normal previewer=false theme=dropdown<cr>", "Buffers" },
  c = { ":PackerCompile --preview<cr>", "Packer Compile" },
  d = {
    name = "DAP & Dashboard",
    d = { ":Dashboard<cr>", "Dashboard" },
    p = { ":Telescope dap commands theme=dropdown previewer=false initial_mode=normal<cr>", "Commands" },
    h = { ":Telescope dap configurations theme=ivy initial_mode=insert<cr>", "Configurations" },
    b = { ":Telescope dap list_breakpoints theme=ivy initial_mode=insert<cr>", "List Breakpoints" },
    v = { ":Telescope dap variables theme=ivy initial_mode=insert<cr>", "Variables" },
    f = { ":Telescope dap frames theme=ivy initial_mode=insert<cr>", "Framse" },
    g = { ":lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    r = { ":lua require'dap'.repl.open()<cr>", "Open Repl" },
    o = { ":lua require'dap'.step_over()<cr>", "Step Over" },
    i = { ":lua require'dap'.step_into()<cr>", "Step Into" },
    c = { ":lua require'dap'.continue()<cr>", "Continue" },
    j = { ":lua require'dapui'.open()<cr>", "Open" },
    k = { ":lua require'dapui'.close()<cr>", "Close" },
    l = { ":lua require'dapui'.toggle()<cr>", "Toggle" },
  },
  e = { ":NvimTreeToggle<cr>", "Nvim Tree" },
  f = { ":Telescope find_files theme=dropdown initial_mode=insert previewer=false<cr>", "Find Files" },
  g = {
    name = "Diff View",
    g = { ":DiffviewClose<cr>", "Close" },
    f = { ":DiffviewFocusFiles<cr>", "Focus Files" },
    h = { ":DiffviewFileHistory %<cr>", "Current File History" },
    o = { ":DiffviewOpen<cr>", "Open" },
    r = { ":DiffviewRefresh<cr>", "Refresh" },
    t = { ":DiffviewToggleFiles<cr>", "Toggle Files" },
    w = { ":DiffviewFileHistory ", "Which File History" },
    b = { ":Telescope git_branches theme=dropdown previewer=false<cr>", "Git Branches" },
    c = { ":Telescope git_commits theme=dropdown initial_mode=normal<cr>", "Git Commits" },
    s = { ":Telescope git_status theme=dropdown initial_mode=normal<cr>", "Git Status" },
  },
  h = {
    name = "Harpoon",
    h = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
    j = { ":lua require('harpoon.ui').nav_prev()<cr>", "Previous" },
    k = { ":lua require('harpoon.ui').nav_next()<cr>", "Next" },
    l = { ":lua require('harpoon.mark').add_file()<cr>", "Mark File" },
    t = { ":lua require('harpoon.tmux').gotoTerminal(1)<cr>", "Tmux" },
  },
  i = { ":Telescope gh issues initial_mode=normal<cr>", "Issues" },
  j = { ":lua require('lir.float').toggle()<cr>", "Lir" },
  k = { ":Telescope harpoon marks theme=dropdown initial_mode=normal previewer=false<cr>", "Harpoon" },
  l = { toggle_lazygit, "LazyGit" },
  m = { ":Mason<cr>", "Mason" },
  n = { ":Telescope notify theme=dropdown initial_mode=normal<cr>", "Issues" },
  o = {
    name = "Others",
    c = { ":Telescope command_history theme=dropdown previewer=false initial_mode=normal<cr>", "Command History" },
    h = { ":Telescope help_tags theme=dropdown initial_mode=insert<cr>", "Help Tags" },
    f = { ":Prettier<cr><esc>:w! | noh<cr>", "Prettier" },
    l = { ":PackerLoad --preview", "Packer Load arg1 arg2" },
    i = { ":PackerInstall --preview<cr>", "Packer Install" },
    u = { ":PackerUpdate --preview<cr>", "Packer Update" },
    x = { ":PackerClean --preview<cr>", "Packer Clean" },
  },
  p = { ":Telescope projects theme=dropdown initial_mode=normal previewer=false<cr>", "Projects" },
  q = { ":bd<cr>", "Close Buffer" },
  r = { ":Telescope gh pull_request theme=ivy initial_mode=normal<cr>", "PR" },
  s = { ":PackerSync --preview<cr>", "Packer Sync" },
  t = {
    name = "TODO | TypeScript | Terminal",
    a = { ":TypescriptAddMissingImports<cr>", "Add Missing Imports" },
    b = { ":ToggleTerm size=20 direction=horizontal<cr>", "Horizontal Terminal" },
    o = { ":TypescriptOrganizeImports<cr>", "Organise Imports" },
    r = { ":TypescriptRemoveUnused<cr>", "Remove Unused" },
    f = { ":TypescriptFixAll<cr>", "Fix All" },
    h = { ":TodoTrouble cwd=.<cr>", "Trouble" },
    j = { ":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<cr>",
      "Telescope" },
    k = { ":TodoQuickFix<cr>", "Quick Fix" },
    l = { ":TodoLocList<cr>", "Loclist" },
  },
  x = { ":qa!<cr>", "Quit All!" },
  y = { ":Telescope neoclip theme=dropdown initial_mode=normal previewer=false<cr>", "Neoclip" },
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
