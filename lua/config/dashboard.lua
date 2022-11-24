vim.g.dashboard_default_executive = "telescope"

local db = require("dashboard")
db.confirm_key = "l"
db.custom_header = {

  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[ ███████╗  ██╗   ██╗ ███████╗  ██████╗  ███╗   ██╗     ⠀⠀⠀⠀ ███████╗  ███████╗ ██╗   ██╗ ]],
  [[ ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔═══██╗ ████═╗ ██║          ██╔═══██╗ ██╔════╝ ██║   ██║ ]],
  [[ ███████╔╝ ████████║ █████╗   ██║   ██║ ██╔███╗██║ ███████╗ ██║   ██║ █████╗   ██║   ██║ ]],
  [[ ██╔════╝  ██╔═══██║ ██╔══╝   ██║   ██║ ██║╚═████║  ╚═════╝ ██║   ██║ ██╔══╝   ╚██╗ ██╔╝ ]],
  [[ ██║       ██║   ██║ ███████╗ ╚██████╔╝ ██║  ╚███║         ⠀███████╔╝ ███████╗  ╚████╔╝  ]],
  [[ ╚═╝       ╚═╝⠀  ╚═╝ ╚══════╝  ╚═════┘  ╚═╝  ⠀ ╚═╝      ⠀    ╚═════╝  ╚══════╝   ╚═══╝   ]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
  [[                                                              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],

}
local Terminal = require("toggleterm.terminal").Terminal
local toggle_terminal = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
  return lazygit:toggle()
end

db.custom_center = {
  {
    icon = "ﯠ ",
    desc = "⇓ ------------------------------------------------- Harpoon          ",
    action = "Telescope harpoon marks theme=dropdown initial_mode=normal previewer=false",
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- Find File        ",
    action = "Telescope find_files theme=dropdown initial_mode=insert previewer=false",
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- Search Word      ",
    action = "Telescope live_grep theme=dropdown",
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- lir              ",
    action = "lua require('lir.float').toggle()",
  },
  { icon = " ", desc = "⇕ ------------------------------------------------- Projects         ",
    action = "Telescope projects theme=dropdown initial_mode=normal" },
  { icon = " ", desc = "⇕ ------------------------------------------------- NVIM Tree        ",
    action = "NvimTreeToggle" },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- TODO             ",
    action = "TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE",
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- Mason            ",
    action = "Mason",
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- Issues           ",
    action = "Telescope gh issues initial_mode=normal",
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- PRs              ",
    action = "Telescope gh pull_request theme=ivy initial_mode=normal",
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- Lazygit          ",
    action = toggle_lazygit,
  },
  {
    icon = " ",
    desc = "⇕ ------------------------------------------------- Terminal         ",
    action = toggle_terminal,
  },
  {
    icon = "炙",
    desc = "⇕ ------------------------------------------------- Help Tags        ",
    action = "Telescope help_tags theme=dropdown initial_mode=insert",
  },
  { icon = " ", desc = "⇕ ------------------------------------------------- Sync             ",
    action = "PackerSync --preview" },
  { icon = " ", desc = "⇕ ------------------------------------------------- Compile          ",
    action = "PackerCompile" },
  { icon = "✗ ", desc = "⇑ ------------------------------------------------- Exit             ", action = "q!" },
}
db.custom_footer = {}
