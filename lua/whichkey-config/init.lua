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

local toggle_btop = function()
  local lazygit = Terminal:new({cmd = 'btop', direction = "float"})
  return lazygit:toggle()
end

local mappings = {
  d = {":Dashboard<cr>", "Home"},
  f = {":Telescope find_files<cr>", "Telescope Find Files"},
  r = {":Telescope live_grep<cr>", "Telescope Live Grep"},
  v = {":ToggleTerm size=20 dir=. direction=horizontal<cr>", "Bottom Terminal"},
  -- c = {":BufferClose!<cr>", "Close Buffer"},
  h = {":Twilight<cr>", "Twilight"},
  q = {":q!<cr>", "Quit"},
  g = {toggle_lazygit, "LazyGit"},
  b = {toggle_btop, "System Performance"},
  -- b = {":Telescope buffers<cr>", "Buffers"},
  t = {toggle_float, "Floating Terminal"},
  o = {
    name = "Telescope Git",
    s = {":Telescope git_status<cr>", "Git Status"},
    c = {":Telescope git_commits<cr>", "Git Commits"},
    b = {":Telescope git_branches<cr>", "Git Branches"},
    p = {":Telescope command_history<cr>", "Command History"},
    h = {":Telescope help_tags<cr>", "Help Tags"},
  },
  p = {
    name = "Prettier",
    p = {":Prettier<cr>", "Prettier"},
    a = {":PrettierAsync", "Prettier Async"}
  },
  s = {
    name = "Split",
    v = {":vsplit<cr>", "Vertical Split"},
    h = {":split<cr>", "Horizontal Split"},
    j = {"<C-w>t<C-w>H", "Horiz > Vert Alignment"},
    k = {"<C-w>t<C-w>K", "Vert > Horiz Alignment"}
  },
  l = {
    name = "LSP",
    i = {":LspInfo<cr>", "Connected Language Servers"},
    k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
    K = {"<cmd>Lspsaga hover_doc<cr>", "Hover Commands"},
    w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder"},
    W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder"},
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    t = {'<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition"},
    d = {'<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition"},
    D = {'<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration"},
    r = {'<cmd>lua vim.lsp.buf.references()<cr>', "References"},
    R = {'<cmd>Lspsaga rename<cr>', "Rename"},
    a = {'<cmd>Lspsaga code_action<cr>', "Code Action"},
    e = {'<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics"},
    n = {'<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic"},
    N = {'<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic"}
  },
  z = {
    name = "Folds",
    z = {"zR", "Open Folds Recursively"},
    a = {"zA", "Toggle Open|Close Folds Recursively"},
    c = {"zC", "Close All Folds Under Cursor"},
    o = {"zO", "Open All Folds Under Cursor"},
  }
}

local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
