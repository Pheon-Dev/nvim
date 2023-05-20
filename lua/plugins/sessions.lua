return {
	"jedrzejboczar/possession.nvim",
	event = "VeryLazy",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("possession").setup({
			-- session_dir = (Path:new(vim.fn.stdpath('data')) / 'possession'):absolute(),
			session_dir = vim.fn.stdpath("data") .. "/sessions/",
			silent = false,
			load_silent = true,
			debug = false,
			logfile = false,
			prompt_no_cr = false,
			autosave = {
				current = false, -- or fun(name): boolean
				tmp = false, -- or fun(): boolean
				tmp_name = "tmp",
				on_load = true,
				on_quit = true,
			},
			commands = {
				save = "PossessionSave",
				load = "PossessionLoad",
				rename = "PossessionRename",
				close = "PossessionClose",
				delete = "PossessionDelete",
				show = "PossessionShow",
				list = "PossessionList",
				migrate = "PossessionMigrate",
			},
			hooks = {
				before_save = function(name)
					return {}
				end,
				after_save = function(name, user_data, aborted) end,
				before_load = function(name, user_data)
					return user_data
				end,
				after_load = function(name, user_data) end,
			},
			plugins = {
				close_windows = {
					hooks = { "before_save", "before_load" },
					preserve_layout = true, -- or fun(win): boolean
					match = {
						floating = true,
						buftype = {},
						filetype = {},
						custom = false, -- or fun(win): boolean
					},
				},
				delete_hidden_buffers = {
					hooks = {
						"before_load",
						vim.o.sessionoptions:match("buffer") and "before_save",
					},
					force = false, -- or fun(buf): boolean
				},
				nvim_tree = true,
				tabby = true,
				dap = true,
				delete_buffers = false,
			},
		})
	end,
}
