vim.g.dashboard_default_executive = 'telescope'
vim.cmd('highlight DashboardHeader guifg=#1080f0 ')
vim.cmd('highlight DashboardCenter guifg=#10a0f0 ')
vim.cmd('highlight DashboardFooter guifg=#10f0f0 ')
vim.cmd('highlight DashboardShortCut guifg=#10f030 ')
vim.cmd('lua vim.o.ls = 0')
vim.cmd('lua vim.o.ch = 0')
vim.cmd('set winbar=%f%m')

local db = require('dashboard')
db.custom_header = {
    [[                                                             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
    [[                                                             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
    [[                                     ⣳⣤⠴⠖⠄ ⠖⣶⣤⡀⠀                                        ]],
    [[                         ⡴⠖⣶⣤⡀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀                                    ]],
    [[ ███████╗  ██╗   ██╗ ███████╗  ██████╗  ███╗   ██╗⢡⠘⢦⡀⠀⠀⠀⠀ ███████╗  ███████╗ ██╗   ██╗ ]],
    [[ ██╔═══██╗ ██║   ██║⡴██╔════╝ ██╔═══██╗ ████═╗ ██║⢹⠛⢤⣉⠢⡀   ██╔═══██╗ ██╔════╝ ██║   ██║ ]],
    [[ ███████╔╝ ████████⣼ █████⠈⢻⡄ ██║⡞ ⣻██║ ██╔███╗██║⣿⠿⣳⣤⠴⠖⠛╗ ██║   ██║ █████╗   ██║   ██║ ]],
    [[ ██╔════╝  ██╔═══██║ ██╔══╝ ⢿⡀██║⢧⣰⢿██║ ██║╚═████║╚═════⣇╝ ██║   ██║ ██╔══╝   ╚██╗ ██╔╝ ]],
    [[ ██║       ██║   ██║ ███████╗ ╚██████╔╝ ██║ ⢡╚███⣇⡴⠋⢡⣯⣀⠘⠘⢦⠀███████╔╝ ███████╗  ╚████╔╝  ]],
    [[ ╚═╝       ╚═╝⠀  ⠣═╝ ⠡══════╝  ╚═════┘⣧⠸╚═╝ ⣤⠀ ╚═┘  ⢹⠛⠂⠀⡀⢤⣉⠢╚═════╝  ╚══════╝   ╚═══╝   ]],
    [[                 ⢣⠈ ⣭⣤⡈⢑ ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾   ⢣⢹ ⢀⣿⣿⠄  ⢸⢀⠤⣀⣀⣠⣄⣀⣀⠙⢯⣾⡄⠀⠀⠀                        ]],
    [[                ⣡⠁  ⠀⠀⣰⢫ ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉   ⠸⢀⣿⠄⣬⣍⠤⢤⣌⣀⠾⢛⠲⠄⠄⠄                        ]],
    [[                ⠇⠀  ⢀⡞⣡⡌⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄⠈⢾⣷⢤⣬⠛⡹⠋⠀⠀⠀⠀                        ]],
    [[              ⠟⠘⠀⠀ ⣰⡞⣼⣿⣤⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄⠸⣿⣇⠈⠻⣤⠲⠄⠀                           ]],
    [[             ⠏⠀⠁⠀⠀⡞ ⣻⡿⠏⠁⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰⣿⠛⡄⠀⣾⣽⠟⠑                            ]],
    [[            ⡏⠀⠀⠀⠀⠀⢧⣰⢿⠛⠀⠀⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣼⡇⣀⡾⣴⠃⣡⣷⢤⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ⢀⠤⠄        ]],
    [[            ⡇⢠⡆⠀⠀⢰⢧⣀⠈⢧⣀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⣸⠙⢷⡿⡇⠀⠋⠸⣿⠲⠄⠄ ⠄⠉⠓⠶⣤⣄⣀⡀⣀⣠⡴⠖⠋⠁          ]],
    [[            ⢣⠸⣇⠀⠀⠘⢧⠉⠓⠶⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡾⠋⣿⣯⣾⠋⣇⠀⠀⠀⠀⠀       ⠉⠉⠉               ]],
    [[             ⢣⣽⣦⠀⠀⠄⠉⠓⠶⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⣠⡴⠋⢡⣯⣀⠘⢦⡀⠀⠀⠀                         ]],
    [[              ⠻⡏⠀⠀    ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆  ⠄     ⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃   ⢹⠛⠂⠀⢤⣉⠢⡀⠀                         ]],
    [[               ⡇⢠⡆     ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄ ⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⢀⢀⠤⣀⣀⣠⣄⣀⣀⠙⢯⣾⡄                         ]],
    [[               ⣧⠸⣇      ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿ ⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⢀⠈⢀⡴⠈⠁⣿⠖⣠⣮⠀⠀⣿⠇                         ]],
    [[                ⢣⣽        ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁ ⡀⠤⠚⠁ ⡀⠤⠚⣟⡻⠋⢀⡴⠁⠀                         ]],
    [[                 ⠃ ⣠⣴⣮⣥⣒     ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁ ⣠⣴⣮⣥⣒  ⡀⠺⣿⣙⣛⠭⠝⠋⠀⠀⠀                      ⠀⠀⠀]],
    [[                ⣠⣴⣧⡴⠄⠄⠟⠋⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃  ⣠⣴⣳⣤⠴⠖⠄⣠⣶⣤⡀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀             ⠀⠀⠀⠀⠀]],
    [[             ⣠⣴⣿⠟⠲⠶⠦⢤⣤⣤⣄⣀⣀⣼⠁⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠄⠄⠟⠋⠿⠛⡗⠾⢛⣵⣠⣶⠿⣶⣦⣶⣮⣥⣒⠲⠄⠄⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
    [[                                                             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]],
    [[                                                             ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀]]
}
local Terminal = require('toggleterm.terminal').Terminal
local toggle_terminal = function()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end

local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})
  return lazygit:toggle()
end

-- Custom Section ﰟ                               
db.custom_center = {
  { icon = ' ', desc = '0 ---⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏--- Find File        ', action = 'Telescope find_files' },
  { icon = ' ', desc = '1 ---⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿--- Search Text      ', action = 'Telescope live_grep' },
  { icon = ' ', desc = '2 ---⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏--- Recent Files     ', action = 'Telescope oldfiles'},
  { icon = ' ', desc = '3 ---⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄--- New File         ', action = 'DashboardNewFile'},
  { icon = ' ', desc = '4 ---⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂--- Menu             ', action = 'NvimTreeToggle'},
  { icon = ' ', desc = '5 ---⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄--- Terminal         ', action = toggle_terminal},
  { icon = ' ', desc = '6 ---⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄--- Git              ', action = toggle_lazygit},
  { icon = ' ', desc = '7 ---⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄--- Colour Scheme    ', action = 'DashboardChangeColorscheme'},
  { icon = ' ', desc = '8 ---⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁--- Jump Mark        ', action = 'DashboardJumpMarks'},
  { icon = '✗ ', desc = '9 ---⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄--- Exit             ', action = 'q!'},
}
db.custom_footer = {'LET IT RIP! (KBL) - MIKEY'}

