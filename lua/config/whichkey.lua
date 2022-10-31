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
  a = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
  b = { ":Telescope buffers initial_mode=normal previewer=false theme=dropdown<cr>", "Buffers" },
  c = {
    name = "Others",
    p = { ":Telescope command_history theme=dropdown previewer=false initial_mode=normal<cr>", "Command History" },
    h = { ":Telescope help_tags theme=ivy initial_mode=insert<cr>", "Help Tags" },
  },
  d = { ":Dashboard<cr>", "Buffers" },
  e = { ":NvimTreeToggle<cr>", "Nvim Tree" },
  f = { ":Telescope find_files initial_mode=insert previewer=false<cr>", "Find Files" },
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
  h = { ":lua require('harpoon.mark').add_file()<cr>", "Mark File" },
  i = {
    name = "TODO",
    h = { ":TodoTrouble cwd=.<cr>", "Trouble" },
    j = { ":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<cr>",
      "Telescope" },
    k = { ":TodoQuickFix<cr>", "Quick Fix" },
    l = { ":TodoLocList<cr>", "Loclist" },
  },
  j = { ":lua require('lir.float').toggle()<cr>", "Lir" },
  k = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
  l = { toggle_lazygit, "LazyGit" },
  m = { ":Mason<cr>", "Mason" },
  o = { ":lua require('pheon')<cr>", "Select Item" },
  p = {
    name = "Packer & Prettier",
    p = { ":Prettier<cr><esc>:w! | noh<cr>", "Prettier" },
    s = { ":PackerSync<cr>", "Packer Sync" },
    c = { ":PackerCompile<cr>", "Packer Compile" },
  },
  q = { ":bd<cr>", "Close Buffer" },
  r = { ":Telescope repo list theme=dropdown initial_mode=normal previewer=false<cr>", "Git Repos" },
  s = { ":Telescope live_grep theme=ivy<cr>", "Live Grep" },
  --[[ s = { ":w! | noh<cr>", "Save File" }, ]]
  t = {
    name = "TypeScript",
    a = { ":TypescriptAddMissingImports<cr>", "Add Missing Imports" },
    o = { ":TypescriptOrganizeImports<cr>", "Organise Imports" },
    r = { ":TypescriptRemoveUnused<cr>", "Remove Unused" },
    f = { ":TypescriptFixAll<cr>", "Fix All" },
  },
  x = { ":qa!<cr>", "Quit All!" },
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
