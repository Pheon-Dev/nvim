-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
return {
	"kyazdani42/nvim-tree.lua",
	cmd = "NvimTreeToggle",
	config = function()
		local ok, _ = pcall(require, "nvim-tree")
		if not ok then
			vim.notify("Nvim-Tree didn't load properly!", "error")
		end

		local tree_cb = require("nvim-tree.config").nvim_tree_callback

		_.setup({
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			disable_netrw = false,
			hijack_netrw = false,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = false,
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				update_root = true,
				ignore_list = {},
			},
			system_open = {
				cmd = nil,
				args = {},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 200,
			},
			hijack_unnamed_buffer_when_opening = true,
			view = {
				adaptive_size = true,
				width = 30,
				hide_root_folder = true,
				side = "left",
				mappings = {
					custom_only = false,
					list = {
						{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
						{ key = "h", cb = tree_cb("close_node") },
						{ key = "v", cb = tree_cb("vsplit") },
						{ key = "C", cb = tree_cb("cd") },
					},
				},
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
				custom = { "node_modules", ".cache" },
			},
			trash = {
				cmd = "trash",
				require_confirm = true,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				highlight_git = true,
				highlight_opened_files = "none",

				indent_markers = {
					enable = false,
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},

					glyphs = {
						default = "",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "↓",
							arrow_closed = "→",
						},
						git = {
							unstaged = "∗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		})
	end,
}