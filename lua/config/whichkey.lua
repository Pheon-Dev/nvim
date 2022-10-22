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
		h = { ":Telescope help_tags theme=ivy previewer=true initial_mode=insert<cr>", "Help Tags" },
	},
	d = {
		name = "Diagnostics",
		d = { ":Dashboard<cr>", "Dashboard" },
		r = { ":Telescope lsp_references<cr>", "References" },
		f = { ":Telescope lsp_definitions<cr>", "Definitions" },
		l = { ":Telescope lsp_declarations<cr>", "Declarations" },
		i = { ":Telescope lsp_implementations<cr>", "Implementations" },
	},
	f = { ":Telescope find_files theme=dropdown previewer=false<cr>", "Find Files" },
	g = {
		name = "Telescope Git",
		p = { ":Telescope repo list<cr>", "Git Repos" },
		i = { ":Telescope gh list issues<cr>", "Git Issues" },
		t = { ":Telescope gh list gist<cr>", "Git Gist" },
		r = { ":Telescope gh list run<cr>", "Git Run" },
		q = { ":Telescope gh list pull_request<cr>", "Git Pull Request" },
		s = { ":Telescope git_status<cr>", "Git Status" },
		m = { ":Telescope git_commits<cr>", "Git Commits" },
		h = { ":Telescope git_branches<cr>", "Git Branches" },
	},
	h = {
		name = "Harpoon",
		h = { ":lua require('harpoon.mark').add_file()<cr>", "Mark File" },
		n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next" },
		p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Previous" },
		t = { ":lua require('harpoon.tmux').gotoTerminal(1)<cr>", "New Tmux Window" },
		o = { ":lua require('harpoon.ui').select_menu_item()<cr>", "Select Item" },
	},
	j = { ":lua require('lir.float').toggle()<cr>", "Lir" },
	k = { ":Telescope harpoon marks theme=dropdown previewer=false initial_mode=normal<cr>", "Harpoon" },
	l = { toggle_lazygit, "LazyGit" },
	m = { ":Mason<cr>", "Mason" },
	n = {
		name = "Utils",
		n = { ":Telescope neoclip theme=cursor previewer=false initial_mode=normal<cr>", "Neoclip" },
		r = { ":RnvimrToggle<cr>", "Ranger" },
	},
	o = { ":lua require('harpoon.ui').select_menu_item()<cr>", "Select Item" },
	s = {
		name = "Projects & Packer",
		c = { ":PackerCompile<cr>", "Packer Compile" },
		r = { ":Prettier<cr>", "Format" },
		p = { ":Telescope projects theme=dropdown previewer=false initial_mode=normal<cr>", "Projects" },
		s = { ":PackerSync<cr>", "Packer Sync" },
		w = { ":w! | noh<cr>", "Write" },
	},
	q = { ":bd<cr>", "Write & Quit" },
	r = { ":Telescope live_grep theme=dropdown<cr>", "Live Grep" },
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
	w = { ":Telescope bookmarks<cr>", "Bookmarks" },
	x = { ":qa!<cr>", "Quit All!" },
	z = { ":Telescope zoxide list theme=dropdown previewer=false initial_mode=normal<cr>", "Zoxide" },
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
