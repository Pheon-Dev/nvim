return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		vim.g.dashboard_default_executive = "telescope"

		local db = require("dashboard")

		db.confirm_key = "l"

		db.custom_header = {
			[[ ███████╗  ██╗   ██╗ ███████╗  ██████╗  ███╗   ██╗     ⠀⠀⠀⠀ ███████╗  ███████╗ ██╗   ██╗ ]],
			[[ ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔═══██╗ ████═╗ ██║          ██╔═══██╗ ██╔════╝ ██║   ██║ ]],
			[[ ███████╔╝ ████████║ █████╗   ██║   ██║ ██╔███╗██║ ███████╗ ██║   ██║ █████╗   ██║   ██║ ]],
			[[ ██╔════╝  ██╔═══██║ ██╔══╝   ██║   ██║ ██║╚═████║  ╚═════╝ ██║   ██║ ██╔══╝   ╚██╗ ██╔╝ ]],
			[[ ██║       ██║   ██║ ███████╗ ╚██████╔╝ ██║  ╚███║         ⠀███████╔╝ ███████╗  ╚████╔╝  ]],
			[[ ╚═╝       ╚═╝⠀  ╚═╝ ╚══════╝  ╚═════┘  ╚═╝  ⠀ ╚═╝      ⠀    ╚═════╝  ╚══════╝   ╚═══╝   ]],
		}

		local Terminal = require("toggleterm.terminal").Terminal

		local toggle_terminal = function()
			local float = Terminal:new({ direction = "float" })
			return float:toggle()
		end

		local toggle_fm = function()
			local fm = Terminal:new({ cmd = "fm", direction = "float" })
			return fm:toggle()
		end

		local toggle_gh = function()
			local gh = Terminal:new({ cmd = "gh-dash", direction = "float" })
			return gh:toggle()
		end

		local toggle_lazygit = function()
			local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
			return lazygit:toggle()
		end

		db.custom_center = {
			{
				icon = "ﯠ ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Harpoon          ",
				action = "lua require('harpoon.ui').toggle_quick_menu()",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Grapple Tags     ",
				action = "GrapplePopup tags",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Find File        ",
				action = "Telescope find_files theme=dropdown initial_mode=insert",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ lir              ",
				action = "lua require('lir.float').toggle()",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Search Word      ",
				action = "Telescope live_grep theme=dropdown",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ File Manager     ",
				action = toggle_fm,
			},
			{
				icon = "פּ ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ NeoTree          ",
				action = "Neotree",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ TODO             ",
				action = "TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Mason            ",
				action = "Mason",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ PRs              ",
				action = toggle_gh,
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Lazygit          ",
				action = toggle_lazygit,
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Termianl         ",
				action = toggle_terminal,
			},
			{
				icon = "炙",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Help Tags        ",
				action = "Telescope help_tags theme=dropdown initial_mode=insert",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Startup Time     ",
				action = "StartupTime",
			},
			{
				icon = " ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Lazy             ",
				action = "Lazy",
			},
			{
				icon = "✗ ",
				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Exit             ",
				action = "q!",
			},
		}

		db.custom_footer = {}
	end,
}
