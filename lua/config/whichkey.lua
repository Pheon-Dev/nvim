local wk = require("which-key")
wk.setup {
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
      g = false
    }
  }
}

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local toggle_turbo_build = function()
  local lazygit = Terminal:new({ cmd = 'yarn turbo run build && lazygit', direction = "float" })
  return lazygit:toggle()
end

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end

local toggle_ranger = function()
  local ranger = Terminal:new({ cmd = 'ranger', direction = "float" })
  return ranger:toggle()
end

local mappings = {
  a = { ":Telescope frecency<cr>", "Frecency" },
  b = { ":Telescope buffers<cr>", "Buffers" },
  c = {
    name = "Others",
    p = { ":Telescope command_history<cr>", "Command History" },
    h = { ":Telescope help_tags<cr>", "Help Tags" },
  },
  --[[ e = { ":lua require('lir.float').toggle()<cr>", "Nvim-Tree" }, ]]
  d = {
    name = "Telescope LSP",
    d = { ":Dashboard<cr>", "Dashboard" },
    r = { ":Telescope lsp_references<cr>", "References" },
    f = { ":Telescope lsp_definitions<cr>", "Definitions" },
    c = { ":Telescope lsp_declarations<cr>", "Declarations" },
    i = { ":Telescope lsp_implementations<cr>", "Implementations" },
  },
  f = { ":Telescope find_files<cr>", "Find Files" },
  g = {
    name = "Telescope Git",
    g = { toggle_lazygit, "LazyGit" },
    p = { ":Telescope repo list<cr>", "Git Repos" },
    i = { ":Telescope gh list issues<cr>", "Git Issues" },
    t = { ":Telescope gh list gist<cr>", "Git Gist" },
    r = { ":Telescope gh list run<cr>", "Git Run" },
    q = { ":Telescope gh list pull_request<cr>", "Git Pull Request" },
    s = { ":Telescope git_status<cr>", "Git Status" },
    c = { ":Telescope git_commits<cr>", "Git Commits" },
    b = { ":Telescope git_branches<cr>", "Git Branches" },
  },
  h = {
    name = "Harpoon",
    m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark File" },
    h = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Quick Menu" },
    n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next" },
    p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Previous" },
    t = { ":lua require('harpoon.tmux').gotoTerminal(1)<cr>", "New Tmux Window" },
  },
  i = { ":lua require('lir.float').toggle()<cr>", "Nvim-Tree" },
  j = { toggle_turbo_build, "Build Trubo Repo" },
  k = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
  l = { toggle_lazygit, "LazyGit" },
  m = { ":Mason<cr>", "Mason" },
  n = {
    name = "Utils",
    n = { ":Telescope neoclip<cr>", "Neoclip" },
    r = { ":RnvimrToggle<cr>", "Ranger" },
  },
  o = { ":Prettier<cr>", "Format" },
  p = { ":PackerSync<cr>", "Packer Sync" },
  q = { ":wq!<cr>", "Write & Quit" },
  r = { ":Telescope live_grep<cr>", "Live Grep" },
  s = { ":w! | noh<cr>", "Write" },
  t = {
    name = "Toggle",
    t = { toggle_float, "Terminal" },
    r = { toggle_ranger, "Ranger" },
    b = { ":ToggleTerm size=20 dir=. direction=horizontal<cr>", "Bottom Terminal" },
  },
  v = {
    name = "Split",
    v = { ":vsplit<cr>", "Vertical Split" },
    h = { ":split<cr>", "Horizontal Split" },
    j = { "<C-w>t<C-w>H", "Horiz > Vert Alignment" },
    k = { "<C-w>t<C-w>K", "Vert > Horiz Alignment" }
  },
  w = { ":Telescope bookmarks<cr>", "Bookmarks" },
  x = { ":qa!<cr>", "Quit All!" },
  z = { ":Telescope zoxide list<cr>", "Zoxide" },
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
