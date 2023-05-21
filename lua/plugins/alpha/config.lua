local has_project, project_history = pcall(require, "project_nvim.utils.history")
local theme = require("config.colors")
local M = {}

local function header_hl_today()
	local wday = os.date("*t").wday
	local colors = { "Keyword", "Constant", "Number", "Type", "String", "Special", "Function" }
	return colors[wday]
end

M.section_header = {
	type = "text",
	val = {
		[[                                                                                         ]],
		[[                                                                                         ]],
		[[                                                                                         ]],
		[[ ░░░░░░░   ░░    ░░  ░░░░░░░   ░░░░░░   ░░░    ░░           ░░░░░░░   ░░░░░░░  ░░    ░░  ]],
		[[ ░███████  ░██   ░██ ░███████ ░░██████  ░███   ░██      ⠀⠀⠀⠀░███████  ░███████ ░██   ░██ ]],
		[[ ░██░░░░██ ░██░░░░██ ░██░░    ░██   ░██ ░████░ ░██ ░░░░░░░  ░██   ░██ ░██░░    ░██   ░██ ]],
		[[ ░███████  ░████████ ░█████   ░██   ░██ ░██ ███░██  ███████ ░██   ░██ ░█████    ██  ░░██ ]],
		[[ ░██       ░██   ░██ ░██░░░░   ██░░░░██ ░██   ████          ░██░░░░██ ░██░░░░    ██░░██  ]],
		[[  ██        ██    ██  ███████   ██████   ██    ███           ███████   ███████    ████   ]],
		[[                                                                                         ]],
		[[                                                                                         ]],
		[[                                                                                         ]],
	},
	opts = {
		position = "center",
		hl = header_hl_today(),
	},
}
function M.open_project(project_path)
	local success = require("project_nvim.project").set_pwd(project_path, "alpha")
	if not success then
		return
	end
	require("telescope.builtin").find_files({
		cwd = project_path,
	})
end

function M.recent_projects(start, target_width)
	if start == nil then
		start = 1
	end
	if target_width == nil then
		target_width = 50
	end
	if not has_project then
		return require("alpha.themes.theta").mru(start, vim.fn.getcwd())
	end
	local buttons = {}
	local project_paths = project_history.get_recent_projects()
	local added_projects = 0
	-- most recent project is the last
	for i = #project_paths, 1, -1 do
		if added_projects == 9 then
			break
		end
		local project_path = project_paths[i]
		local stat = vim.loop.fs_stat(project_path .. "/.git")
		if stat ~= nil and stat.type == "directory" then
			added_projects = added_projects + 1
			local shortcut = tostring(added_projects)
			local display_path = project_path:gsub(vim.env.HOME, "~")
			local path_ok, plenary_path = pcall(require, "plenary.path")
			if #display_path > target_width and path_ok then
				display_path = plenary_path.new(display_path):shorten(1, { -2, -1 })
				if #display_path > target_width then
					display_path = plenary_path.new(display_path):shorten(1, { -1 })
				end
			end
			buttons[added_projects] = {
				type = "button",
				val = " " .. display_path,
				on_press = function()
					M.open_project(project_path)
				end,
				opts = {
					position = "center",
					shortcut = shortcut,
					cursor = target_width + 3,
					width = target_width + 3,
					align_shortcut = "right",
					hl_shortcut = "Keyword",
					hl = {
						{ "Number", 1, 3 },
						{ "Comment", 4, 100 },
					},
					keymap = {
						"n",
						shortcut,
						"<cmd>lua require('custom.configs.alpha').open_project('" .. project_path .. "')<CR>",
						{ noremap = true, silent = true, nowait = true },
					},
				},
			}
		end
	end
	return buttons
end

M.section_projects = {
	type = "group",
	val = {
		{
			type = "text",
			val = " Recent Projects",
			opts = {
				hl = "SpecialComment",
				shrink_margin = false,
				position = "center",
			},
		},
		{ type = "group", val = M.recent_projects },
	},
}

function M.buttons()
	local keybind_opts = { silent = true, noremap = true }
	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "AlphaReady" },
		callback = function(_)
			vim.api.nvim_buf_set_keymap(0, "n", "p", "<cmd>Telescope projects<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "t", "<cmd>Telescope themes<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "s", "<cmd>e $MYVIMRC<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "f", ":Telescope find_files initial_mode=insert<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "i", ":lua require('lir.float').toggle()<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"g",
				":lua require('toggleterm.terminal').Terminal:new({cmd = 'lazygit', direction = 'float'}):toggle()<cr>",
				keybind_opts
			)
			vim.api.nvim_buf_set_keymap(0, "n", "m", ":Mason<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "n", ":Telescope notify<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "ps", ":lua require('nvim-possession').list()<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "pj", "<cmd>Telescope projects<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "s", ":Telescope live_grep<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"t",
				":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<CR>",
				keybind_opts
			)
		end,
	})
	local buttons_hl = { { "AlphaKeys", 0, 5 }, { "AlphaIcon", 5, 20 }, { "AlphaDesc", 20, 70 } }
	return {
		{
			type = "text",
			val = {
				"[f]" .. "               " .. " Find File",
				"[i]" .. "               " .. " Lir",
				"[l]" .. "               " .. " Lazygit",
				"[m]" .. "               " .. " Mason",
				"[n]" .. "               " .. " Notifications",
				"[p]" .. "               " .. " Possessions",
				"[s]" .. "               " .. " Search",
				"[t]" .. "               " .. " TODO",
			},
			opts = {
				position = "center",
				hl = {
					buttons_hl,
					buttons_hl,
					buttons_hl,
					buttons_hl,
					buttons_hl,
					buttons_hl,
					buttons_hl,
					buttons_hl,
				},
			},
		},
	}
end

function M.shortcuts()
	local keybind_opts = { silent = true, noremap = true }
	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "AlphaReady" },
		callback = function(_)
			vim.api.nvim_buf_set_keymap(0, "n", "<leader>j", ":NvimTreeToggle<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "e", ":NvimTreeToggle<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "h", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<leader>k",
				":lua require('harpoon.ui').toggle_quick_menu()<cr>",
				keybind_opts
			)
			vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>q<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "<esc>", "<cmd>q<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "l", "<cmd>q<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", ";", "<cmd>q<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "z", ":Lazy<CR>", keybind_opts)
		end,
	})
	return {
		{
			type = "text",
			val = {
				"ﯠ Harpoon [h]    פּ Nvim-Tree [e]    鈴 Lazy [z]     Quit [q]",
			},
			opts = {
				position = "center",
				hl = {
					{ "Constant", 1, 20 },
					{ "Keyword", 20, 38 },
					{ "Function", 38, 58 },
					{ "AlphaQuit", 58, 70 },
				},
			},
		},
	}
end

M.section_shortcuts = { type = "group", val = M.shortcuts }

M.section_buttons = { type = "group", val = M.buttons }

function M.info_text()
	---@diagnostic disable-next-line:undefined-field
	local datetime = os.date(" %Y-%m-%d   %A")
	local lazy_stats = require("lazy").stats()
	local ms = (math.floor(lazy_stats.startuptime * 100 + 0.5) / 100)
	local total_plugins = "  " .. lazy_stats.loaded .. "/" .. lazy_stats.count .. " in " .. ms .. " ms"
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	return datetime .. total_plugins .. nvim_version_info
end

M.section_info = {
	type = "text",
	val = M.info_text(),
	opts = {
		hl = "Comment",
		position = "center",
	},
}

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

M.config = {
	layout = {
		M.section_header,
		{ type = "padding", val = 1 },
		M.section_shortcuts,
		{ type = "padding", val = 1 },
		M.section_info,
		{ type = "padding", val = 1 },
		{ type = "padding", val = 1 },
		M.section_buttons,
		{ type = "padding", val = 1 },
		M.section_projects,
		{ type = "padding", val = 1 },
		M.section_footer,
	},
}

return M
