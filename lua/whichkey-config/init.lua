local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {enabled = false, suggestions = 20},
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
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end

local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})
  return lazygit:toggle()
end

local mappings = {
  f = {":Telescope find_files<cr>", "Telescope Find Files"},
  r = {":Telescope live_grep<cr>", "Telescope Live Grep"},
  v = {":ToggleTerm size=20 dir=. direction=horizontal<cr>", "Bottom Terminal"},
  h = {":Twilight<cr>", "Twilight"},
  z = {":Telescope zoxide list<cr>", "Zoxide"},
  n = {":Telescope neoclip<cr>", "Neoclip"},
  w = {":Telescope bookmarks<cr>", "Bookmarks"},
  b = {":Telescope frecency<cr>", "Frecency"},
  p = {":PackerSync<cr>", "Sync"},
  l = {toggle_lazygit, "LazyGit"},
  t = {toggle_float, "Floating Terminal"},
  g = {
    name = "Telescope Git",
    g = {toggle_lazygit, "LazyGit"},
    p = {":Telescope repo list<cr>", "Repos"},
    i = {":Telescope gh list issues<cr>", "Git Issues"},
    t = {":Telescope gh list gist<cr>", "Git Gist"},
    r = {":Telescope gh list run<cr>", "Git Run"},
    q = {":Telescope gh list pull_request<cr>", "Git Pull Request"},
    s = {":Telescope git_status<cr>", "Git Status"},
    c = {":Telescope git_commits<cr>", "Git Commits"},
    b = {":Telescope git_branches<cr>", "Git Branches"},
  },
  c = {
    name = "Telescope Git",
    p = {":Telescope command_history<cr>", "Command History"},
    h = {":Telescope help_tags<cr>", "Help Tags"},
    d = {":Dashboard<cr>", "Home"},
  },
  s = {
    name = "Split",
    v = {":vsplit<cr>", "Vertical Split"},
    h = {":split<cr>", "Horizontal Split"},
    j = {"<C-w>t<C-w>H", "Horiz > Vert Alignment"},
    k = {"<C-w>t<C-w>K", "Vert > Horiz Alignment"}
  },
}

local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
