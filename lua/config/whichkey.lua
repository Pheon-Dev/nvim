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
  --[[ a = { ":Telescope frecency<cr>", "Frecency" }, ]]
  b = { ":Telescope buffers<cr>", "Buffers" },
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
  j = { toggle_turbo_build, "Build Trubo Repo" },
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
    b = { ":ToggleTerm size=20 dir=. direction=horizontal<cr>", "Bottom Terminal" },
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
