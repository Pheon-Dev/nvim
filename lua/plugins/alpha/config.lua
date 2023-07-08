local M = {}

M.section_header = {
	type = "text",
	val = {
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⢀⣠⣤⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣀⠀⠀]],
		[[⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⡀⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠎⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀]],
		[[⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀]],
		[[⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠧⠉⠻⣶⣄⠀⠈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⢀⣠⡾⠛⠉⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀]],
		[[⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣖⡒⠀⠀⠀⠀⠈⠻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⠀⣠⣾⠋⠀⠀⠀⠀⠀⢒⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀]],
		[[⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣟⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠟⠁⠀⠀⠀⠀⠀⠀⢘⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀]],
		[[⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⠟⠂⠀⠀⠀⠀⠀⠀⠀⠀⠉⢷⡀⠀⠀⠀⠀⠀⠀⢠⡿⠁⠀⠀⠀⠀⠀⠀⠀⠐⢒⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀]],
		[[⠀⠀⠀⠀⠘⣿⣿⣿⣿⡿⠟⠛⠉⡁⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠀⠱⣀⣀⠀⢀⠟⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⢿⣿⣿⣿⣿⣿⠀   ]],
		[[⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠟⠋⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠃⢸⣿⣿⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⢿⣷⣿⣿⣿⣿⡟⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⡷⠖⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣤⣿⣿⣿⣇⡠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠲⠶⣿⣿⣿⣿⣿⠁    ]],
		[[⠀⠀⠀⠀⠀⠀⠙⠻⠿⠿⢿⣶⣤⣤⣤⣤⣄⠐⠒⠒⠀⠀⠀⠀⣻⣿⣿⣿⣿⡇⠀⠀⠀⠀⠐⠂⠀⣤⣤⣤⣤⣤⡾⠿⠿⠿⠛⠁⠀⠀⠀⠀ ]],
		[[⠀⠀⠀⠀⠀⠀⠀ ⢀⣤⣶⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠩⢿⣿⣿⣿⣷⣦⡄⠀⠀⠀ ⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣯⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢼⣿⣿⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢬⣽⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣏⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠸⣿⡟⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣈⣛⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡿⢁⣤⡖⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⣿⡇⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⢤⡀⠸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣵⣿⣿⣤⡄⠀⠀⠀⠀⠀⠀⡌⠀⠀⠙⠁⠀⠈⡇⠀⠀⠀⠀⠀⠀⣠⣌⣿⣷⣼⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣡⣴⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠰⣤⣹⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣧⣤⣀⣤⢀⡎⠀⠀⠀⠀⠀⠀⠀⠀⣇⢀⡄⢀⣤⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀   ⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ⠉⠉⠛⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠛⠛⠉⠉    ⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
		[[⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠀   ]],
	},
	opts = {
		position = "center",
		hl = "Comment",
	},
}

function M.buttons()
	local keybind_opts = { silent = true, noremap = true }
	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "AlphaReady" },
		callback = function(_)
			vim.api.nvim_buf_set_keymap(0, "n", "j", ":NvimTreeToggle<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "k", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "f", ":Telescope find_files initial_mode=insert<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "s", ":Telescope live_grep<cr>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "z", ":Lazy<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"l",
				":lua require('toggleterm.terminal').Terminal:new({cmd = 'lazygit', direction = 'float'}):toggle()<cr>",
				keybind_opts
			)
			-- vim.api.nvim_buf_set_keymap(0, "n", "m", ":Mason<CR>", keybind_opts)

			-- Quit
			vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>q<CR>", keybind_opts)
			vim.api.nvim_buf_set_keymap(0, "n", "h", "<cmd>q<CR>", keybind_opts)
		end,
	})


	local button_hl = {
					{ "AlphaQuit", 1, 60 },
	}

	local buttons_hl = {
					{ "AlphaIcon", 1, 5 },
					{ "Keyword", 6, 18 },
					{ "AlphaKeys", 19, 25 },
          { "AlphaLine", 25, 30 },
					{ "AlphaIcon", 31, 37 },
					{ "Keyword", 38, 48 },
					{ "AlphaKeys", 49, 55 },
          { "AlphaQuit", 56, 60 },
	}
	return {
		{
			type = "text",
			val = {
				"                        │                       ",
				"ﯠ   Harpoon        k    │    פּ   Nvim Tree     j",
        "󰈞   Find File      f    │       Search        s",
        "   Lazygit        t    │    鈴  Lazy          z",
				"                        │                       ",
        "                        │       Quit          h",
				"                        │                       ",
			},
			opts = {
				position = "center",
				hl = {
					buttons_hl,
					buttons_hl,
					buttons_hl,
					buttons_hl,
					buttons_hl,
					button_hl,
					buttons_hl,
				},
			},
		},
	}
end

M.section_buttons = { type = "group", val = M.buttons }

function M.info_text()
	---@diagnostic disable-next-line:undefined-field
	local datetime = os.date(" %Y-%m-%d   %A")
	local lazy_stats = require("lazy").stats()
	local ms = (math.floor(lazy_stats.startuptime * 100 + 0.5) / 100)
	local total_plugins = "  " .. lazy_stats.loaded .. "/" .. lazy_stats.count .. " in " .. ms .. " ms"
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "LazyVimStarted" },
		callback = function()
			pcall(vim.cmd.AlphaRedraw)
		end,
	})
	return datetime .. total_plugins .. nvim_version_info
end

M.section_info = {
	type = "text",
	val = function()
		return M.info_text()
	end,
	opts = {
		hl = "AlphaInfo",
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
      print("alpha ready")
			-- require("lazy").show()
		end,
	})
end

M.config = {
	layout = {
		M.section_header,
		{ type = "padding", val = 1 },
		{ type = "padding", val = 1 },
		M.section_buttons,
		{ type = "padding", val = 1 },
		M.section_info,
	},
}

return M
