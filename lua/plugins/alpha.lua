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
			dashboard.button("a", " " .. "   New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("b", " " .. "   Bookmarks", ":Telescope marks theme=dropdown initial_mode=insert<CR>"),
			dashboard.button("c", " " .. "   Config", ":e $MYVIMRC <CR>"),
			dashboard.button("e", "פּ " .. "   Nvim-Tree", ":NvimTreeToggle<CR>"),
			dashboard.button(
				"f",
				" " .. "   Find File",
				":Telescope find_files theme=dropdown initial_mode=insert<cr>"
			),
			dashboard.button("h", " " .. "   Quit", ":qa<CR>"),
			dashboard.button("j", " " .. "   Lir", ":lua require('lir.float').toggle()<cr>"),
			dashboard.button("k", "ﯠ " .. "   Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<cr>"),
			dashboard.button(
				"l",
				" " .. "   Lazygit",
				":lua require('toggleterm.terminal').Terminal:new({cmd = 'lazygit', direction = 'float'}):toggle()<cr>"
			),
			dashboard.button("m", " " .. "   Mason", ":Mason<CR>"),
			dashboard.button("n", " " .. "   Neoconf", ":Neoconf<CR>"),
			dashboard.button(
				"p",
				" " .. "   File Manager",
				":lua require('toggleterm.terminal').Terminal:new({cmd = 'joshuto', direction = 'float'}):toggle()<cr>"
			),
			dashboard.button("r", " " .. "   Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("s", " " .. "   Search Word", ":Telescope live_grep theme=dropdown<cr>"),
			dashboard.button(
				"t",
				" " .. "   TODO",
				":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<CR>"
			),
			dashboard.button("z", "鈴" .. "   Lazy", ":Lazy<CR>"),
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
