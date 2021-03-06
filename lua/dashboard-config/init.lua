vim.g.dashboard_default_executive = 'telescope'
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
db.custom_footer = {'If in doubt, flat out - Collin McRae'}

