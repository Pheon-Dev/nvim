local actions_ok, actions = pcall(require, "lir.actions")
local mark_actions_ok, mark_actions = pcall(require, "lir.mark.actions")
local clip_actions_ok, clipboard_actions = pcall(require, "lir.clipboard.actions")

local lir_ok, lir = pcall(require, "lir")

if not actions_ok then
	vim.notify("Lir Actions Not Properly Loaded!", "error")
end

if not mark_actions_ok then
	vim.notify("Lir Mark Actions Not Properly Loaded!", "error")
end

if not clip_actions_ok then
	vim.notify("Lir Clipboard Mark Actions Not Properly Loaded!", "error")
end

if not lir_ok then
	vim.notify("Lir Not Properly Loaded!", "error")
end

lir.setup({
	show_hidden_files = false,
	ignore = {},
	devicons_enable = true,
	mappings = {
		["<CR>"] = actions.edit,
		["h"] = actions.up,
		["l"] = actions.edit,
		["b"] = actions.split,
		["n"] = actions.vsplit,
		["t"] = actions.tabedit,

		["q"] = actions.quit,
		["<esc>"] = actions.quit,
		[";"] = actions.quit,

		["A"] = actions.mkdir,
		["a"] = actions.newfile,
		["r"] = actions.rename,
		["@"] = actions.cd,
		["Y"] = actions.yank_path,
		["."] = actions.toggle_show_hidden,
		["d"] = actions.delete,

		["c"] = clipboard_actions.copy,
		["x"] = clipboard_actions.cut,
		["p"] = clipboard_actions.paste,

		["m"] = function()
			mark_actions.toggle_mark("n")
			vim.cmd("normal! j")
		end,
	},
	float = {
		winblend = 0,
		curdir_window = {
			enable = false,
			highlight_dirname = false,
		},

		-- You can define a function that returns a table to be passed as the third
		-- argument of nvim_open_win()s
		win_opts = function()
			local width = math.floor(vim.o.columns * 0.2)
			local height = math.floor(vim.o.lines * 0.6)
			return {
				border = "rounded",
				width = width,
				height = height,
				--[[ row = 2, ]]
				--[[ col = math.floor((vim.o.columns - width) * 3), ]]
			}
		end,
	},
	hide_cursor = true,
	on_init = function()
		-- use visual mode
		vim.api.nvim_buf_set_keymap(
			0,
			"x",
			"m",
			':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
			{ noremap = true, silent = true }
		)

		-- echo cwd
		--[[ vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {}) ]]
	end,
})

-- custom folder icon
require("nvim-web-devicons").set_icon({
	lir_folder_icon = {
		icon = "",
		color = "#7ebae4",
		name = "LirFolderNode",
	},
})
