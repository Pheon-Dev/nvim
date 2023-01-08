-- return {
-- 	"glepnir/dashboard-nvim",
-- 	event = "VimEnter",
-- 	config = function()
-- 		vim.g.dashboard_default_executive = "telescope"
--
-- 		local db = require("dashboard")
--
-- 		db.confirm_key = "l"
--
-- 		db.custom_header = {
-- 			[[ ███████╗  ██╗   ██╗ ███████╗  ██████╗  ███╗   ██╗     ⠀⠀⠀⠀ ███████╗  ███████╗ ██╗   ██╗ ]],
-- 			[[ ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔═══██╗ ████═╗ ██║          ██╔═══██╗ ██╔════╝ ██║   ██║ ]],
-- 			[[ ███████╔╝ ████████║ █████╗   ██║   ██║ ██╔███╗██║ ███████╗ ██║   ██║ █████╗   ██║   ██║ ]],
-- 			[[ ██╔════╝  ██╔═══██║ ██╔══╝   ██║   ██║ ██║╚═████║  ╚═════╝ ██║   ██║ ██╔══╝   ╚██╗ ██╔╝ ]],
-- 			[[ ██║       ██║   ██║ ███████╗ ╚██████╔╝ ██║  ╚███║         ⠀███████╔╝ ███████╗  ╚████╔╝  ]],
-- 			[[ ╚═╝       ╚═╝⠀  ╚═╝ ╚══════╝  ╚═════┘  ╚═╝  ⠀ ╚═╝      ⠀    ╚═════╝  ╚══════╝   ╚═══╝   ]],
-- 		}
--
-- 		local Terminal = require("toggleterm.terminal").Terminal
--
-- 		local toggle_terminal = function()
-- 			local float = Terminal:new({ direction = "float" })
-- 			return float:toggle()
-- 		end
--
-- 		local toggle_fm = function()
-- 			local fm = Terminal:new({ cmd = "fm", direction = "float" })
-- 			return fm:toggle()
-- 		end
--
-- 		local toggle_gh = function()
-- 			local gh = Terminal:new({ cmd = "gh-dash", direction = "float" })
-- 			return gh:toggle()
-- 		end
--
-- 		local toggle_lazygit = function()
-- 			local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
-- 			return lazygit:toggle()
-- 		end
--
-- 		db.custom_center = {
-- 			{
-- 				icon = "ﯠ ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Harpoon          ",
-- 				action = "lua require('harpoon.ui').toggle_quick_menu()",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Grapple Tags     ",
-- 				action = "GrapplePopup tags",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Find File        ",
-- 				action = "Telescope find_files theme=dropdown initial_mode=insert",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ lir              ",
-- 				action = "lua require('lir.float').toggle()",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Search Word      ",
-- 				action = "Telescope live_grep theme=dropdown",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ File Manager     ",
-- 				action = toggle_fm,
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ NeoConf          ",
-- 				action = "Neoconf",
-- 			},
-- 			{
-- 				icon = "פּ ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ NeoTree          ",
-- 				action = "Neotree",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ TODO             ",
-- 				action = "TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Mason            ",
-- 				action = "Mason",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ PRs              ",
-- 				action = toggle_gh,
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Lazygit          ",
-- 				action = toggle_lazygit,
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Terminal         ",
-- 				action = toggle_terminal,
-- 			},
-- 			{
-- 				icon = "炙",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Help Tags        ",
-- 				action = "Telescope help_tags theme=dropdown initial_mode=insert",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Startup Time     ",
-- 				action = "StartupTime",
-- 			},
-- 			{
-- 				icon = " ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Lazy             ",
-- 				action = "Lazy",
-- 			},
-- 			{
-- 				icon = "✗ ",
-- 				desc = " ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ Exit             ",
-- 				action = "q!",
-- 			},
-- 		}
--
-- 		db.custom_footer = {}
-- 	end,
-- }

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
   ███████╗  ██╗   ██╗ ███████╗  ██████╗  ███╗   ██╗     ⠀⠀⠀⠀ ███████╗  ███████╗ ██╗   ██╗ 
   ██╔═══██╗ ██║   ██║ ██╔════╝ ██╔═══██╗ ████═╗ ██║          ██╔═══██╗ ██╔════╝ ██║   ██║ 
   ███████╔╝ ████████║ █████╗   ██║   ██║ ██╔███╗██║ ███████╗ ██║   ██║ █████╗   ██║   ██║ 
   ██╔════╝  ██╔═══██║ ██╔══╝   ██║   ██║ ██║╚═████║  ╚═════╝ ██║   ██║ ██╔══╝   ╚██╗ ██╔╝ 
   ██║       ██║   ██║ ███████╗ ╚██████╔╝ ██║  ╚███║         ⠀███████╔╝ ███████╗  ╚████╔╝  
   ╚═╝       ╚═╝⠀  ╚═╝ ╚══════╝  ╚═════┘  ╚═╝  ⠀ ╚═╝      ⠀    ╚═════╝  ╚══════╝   ╚═══╝   
      ]]

		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("h", "ﯠ " .. "   Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<cr>"),
			dashboard.button("g", " " .. "   Grapple Tags", ":GrapplePopup tags<cr>"),
			dashboard.button(
				"f",
				" " .. "   Find File",
				":Telescope find_files theme=dropdown initial_mode=insert<cr>"
			),
			dashboard.button("l", " " .. "   Lir", ":lua require('lir.float').toggle()<cr>"),
			dashboard.button("n", " " .. "   New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("c", " " .. "   Neoconf", ":Neoconf<CR>"),
			dashboard.button("e", "פּ " .. "   Neotree", ":Neotree<CR>"),
			dashboard.button("r", " " .. "   Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button(
				"t",
				" " .. "   Find text",
				":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<CR>"
			),
			dashboard.button("i", " " .. "   Config", ":e $MYVIMRC <CR>"),
			dashboard.button("a", " " .. "   Mason", ":Mason<CR>"),
			dashboard.button("l", "鈴" .. "   Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. "   Quit", ":qa<CR>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.opts.layout[1].val = 8
		vim.b.miniindentscope_disable = true

		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
