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

local gitsigns = require("gitsigns").blame_line{full = true}

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
  f = {
    name = "Telescope",
    f = {":Telescope find_files<cr>", "Telescope Find Files"},
    r = {":Telescope live_grep<cr>", "Telescope Live Grep"},
    b = {":Telescope buffers<cr>", "Buffers"}   
  },
  t = {
    name = "Terminal",
    t = {":ToggleTerm<cr>", "Split Below"},
    f = {toggle_float, "Floating Terminal"},
    b = {":TagbarToggle<cr>", "Tagbar"},
    l = {toggle_lazygit, "LazyGit"},
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
  h = {
    name = "Git VC",
    g = {toggle_lazygit, "LazyGit"},
    b = {gitsigns, "Blame Line"},
    s = {"Gitsigns stage_hunk<cr>", "Stage Hunk"},
    u = {"Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk"},
    r = {"Gitsigns reset_hunk<cr>", "Reset Hunk"},
    R = {"Gitsigns reset_buffer<cr>", "Reset Buffer"},
    P = {"Gitsigns preview_hunk<cr>", "Preview Hunk"},
    S = {"Gitsigns stage_buffer<cr>", "Stage Buffer"},
    U = {"Gitsigns reset_buffer_index<cr>", "Reset Buffer Index"},
  },
  b = {
    name = "Buffers",
    q = {":BufferLineGoToBuffer 1<cr>", "Buffer 1"},
  },
  c = {
    name = "Source",
    s = {":!source %,cr>", "Source Current File"},
    S = {":!tmux source %,cr>", "Source Current Tmux File"},
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
    name = "Focus",
    z = {":ZenMode<cr>", "Toggle Zen Mode"},
    t = {":Twilight<cr>", "Toggle Twilight"}
  }
}

local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
