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
  d = {":Dashboard<cr>", "Home"},
  f = {":Telescope find_files<cr>", "Telescope Find Files"},
  r = {":Telescope live_grep<cr>", "Telescope Live Grep"},
  v = {":ToggleTerm size=20 dir=. direction=horizontal<cr>", "Bottom Terminal"},
  h = {":Twilight<cr>", "Twilight"},
  q = {":q!<cr>", "Quit"},
  g = {toggle_lazygit, "LazyGit"},
  z = {":Telescope zoxide list<cr>", "Zoxide"},
  n = {":Telescope neoclip<cr>", "Neoclip"},
  w = {":Telescope bookmarks<cr>", "Bookmarks"},
  c = {":Telescope repo list<cr>", "Repos"},
  b = {":Telescope frecency<cr>", "Frecency"},
  p = {":PackerSync<cr>", "Sync"},
  t = {
    name = "Telescope Git",
    t = {toggle_float, "Floating Terminal"},
    s = {":Telescope git_status<cr>", "Git Status"},
    c = {":Telescope git_commits<cr>", "Git Commits"},
    b = {":Telescope git_branches<cr>", "Git Branches"},
    p = {":Telescope command_history<cr>", "Command History"},
    h = {":Telescope help_tags<cr>", "Help Tags"},
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
