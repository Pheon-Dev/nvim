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

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end

local toggle_ranger = function()
  local ranger = Terminal:new({ cmd = 'ranger', direction = "float" })
  return ranger:toggle()
end

local toggle_btop = function()
  local btop = Terminal:new({ cmd = 'btop', direction = "float" })
  return btop:toggle()
end

local toggle_cmus = function()
  local cmus = Terminal:new({ cmd = 'cmus', direction = "float" })
  return cmus:toggle()
end

local toggle_mc = function()
  local mc = Terminal:new({ cmd = 'mc', direction = "float" })
  return mc:toggle()
end

local mappings = {
  f = { ":Telescope find_files<cr>", "Find Files" },
  k = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
  r = { ":Telescope live_grep<cr>", "Live Grep" },
  s = { ":Telescope frecency<cr>", "Frecency" },
  z = { ":Telescope zoxide list<cr>", "Zoxide" },
  n = { ":Telescope neoclip<cr>", "Neoclip" },
  w = { ":Telescope bookmarks<cr>", "Bookmarks" },
  p = { ":PackerSync<cr>", "Packer Sync" },
  h = { ":Twilight<cr>", "Twilight" },
  b = { ":ToggleTerm size=20 dir=. direction=horizontal<cr>", "Bottom Terminal" },
  l = { toggle_lazygit, "LazyGit" },
  t = {
    name = "Toggle",
    t = { toggle_float, "Terminal" },
    r = { toggle_ranger, "Ranger" },
    b = { toggle_btop, "Btop" },
    m = { toggle_mc, "mc" },
    c = { toggle_cmus, "cmus" },
  },
  m = {
    name = "Music",
    m = { toggle_cmus, "cmus" },
    s = { ":CmusPlay<cr>", "Start" },
    p = { ":CmusCurrent<cr>", "Current" },
    c = { ":Cmus<cr>", "Info" },
    n = { ":CmusNext<cr>", "Next" },
    b = { ":CmusPrevious<cr>", "Previous" },
    v = { ":CmusStop<cr>", "Stop" },
  },
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
  c = {
    name = "Others",
    p = { ":Telescope command_history<cr>", "Command History" },
    h = { ":Telescope help_tags<cr>", "Help Tags" },
    d = { ":Dashboard<cr>", "Home" },
  },
  v = {
    name = "Split",
    v = { ":vsplit<cr>", "Vertical Split" },
    h = { ":split<cr>", "Horizontal Split" },
    j = { "<C-w>t<C-w>H", "Horiz > Vert Alignment" },
    k = { "<C-w>t<C-w>K", "Vert > Horiz Alignment" }
  },
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
