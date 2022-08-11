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
  b = { ":ToggleTerm size=20 dir=. direction=horizontal<cr>", "Bottom Terminal" },
  c = {
    name = "Others",
    p = { ":Telescope command_history<cr>", "Command History" },
    h = { ":Telescope help_tags<cr>", "Help Tags" },
    d = { ":Dashboard<cr>", "Home" },
  },
  d = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
  f = { ":Telescope find_files<cr>", "Find Files" },
  k = { ":Dashboard<cr>", "Dashboard" },
  l = { toggle_lazygit, "LazyGit" },
  m = { ":Mason<cr>", "Mason" },
  n = { ":RnvimrToggle<cr>", "Ranger" },
  o = { ":Prettier<cr>", "Format" },
  p = { ":PackerSync<cr>", "Packer Sync" },
  q = { ":wq!<cr>", "Write & Quit" },
  r = { ":Telescope live_grep<cr>", "Live Grep" },
  s = { ":w! | noh<cr>", "Write" },
  t = {
    name = "Toggle",
    t = { toggle_float, "Terminal" },
    r = { toggle_ranger, "Ranger" },
    b = { toggle_btop, "Btop" },
    m = { toggle_mc, "mc" },
  },
  v = {
    name = "Split",
    v = { ":vsplit<cr>", "Vertical Split" },
    h = { ":split<cr>", "Horizontal Split" },
    j = { "<C-w>t<C-w>H", "Horiz > Vert Alignment" },
    k = { "<C-w>t<C-w>K", "Vert > Horiz Alignment" }
  },
  x = { ":qa!<cr>", "Quit All!" },
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
