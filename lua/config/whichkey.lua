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
  b = { ":Telescope buffers<cr>", "Buffers" },
  c = {
    name = "Others",
    p = { ":Telescope command_history theme=dropdown previewer=false initial_mode=normal<cr>", "Command History" },
    h = { ":Telescope help_tags theme=ivy initial_mode=insert<cr>", "Help Tags" },
  },
  f = { ":Telescope find_files theme=dropdown initial_mode=insert previewer=false<cr>", "Find Files" },
  l = { toggle_lazygit, "LazyGit" },
  k = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
  j = { ":lua require('lir.float').toggle()<cr>", "Lir" },
  m = { ":Mason<cr>", "Mason" },
  o = { ":lua require('pheon')<cr>", "Select Item" },
  p = { ":Prettier<cr><esc>:w! | noh<cr>", "Prettier" },
  q = { ":bd<cr>", "Close Buffer" },
  r = { ":Telescope live_grep theme=ivy<cr>", "Live Grep" },
  s = { ":w! | noh<cr>", "Save File" },
  t = {
    name = "TypeScript",
    a = { ":TypescriptAddMissingImports<cr>", "Add Missing Imports" },
    o = { ":TypescriptOrganizeImports<cr>", "Organise Imports" },
    r = { ":TypescriptRemoveUnused<cr>", "Remove Unused" },
    f = { ":TypescriptFixAll<cr>", "Fix All" },
  },
  v = {
    name = "Split",
    v = { ":vsplit<cr>", "Vertical Split" },
    h = { ":split<cr>", "Horizontal Split" },
    j = { "<C-w>t<C-w>H", "Horiz > Vert Alignment" },
    k = { "<C-w>t<C-w>K", "Vert > Horiz Alignment" },
  },
  x = { ":qa!<cr>", "Quit All!" },
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
