local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = "plugins",
	defaults = { lazy = true, version = "*" }, -- version = nil
	install = { colorscheme = { "tokyonight" } },
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		-- concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		-- notify = true, -- get a notification when new updates are found
		-- frequency = 3600, -- check for updates every hour
	},
	performance = {
		-- cache = {
		-- 	enabled = true,
		-- 	path = vim.fn.stdpath("cache") .. "/lazy/cache",
		-- 	-- Once one of the following events triggers, caching will be disabled.
		-- 	-- To cache all modules, set this to `{}`, but that is not recommended.
		-- 	-- The default is to disable on:
		-- 	--  * VimEnter: not useful to cache anything else beyond startup
		-- 	--  * BufReadPre: this will be triggered early when opening a file from the command line directly
		-- 	disable_events = { "VimEnter", "BufReadPre" },
		-- 	ttl = 3600 * 24 * 5, -- keep unused modules for up to 5 days
		-- },
		-- reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},

	root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
	git = {
		-- defaults for the `Lazy log` command
		-- log = { "-10" }, -- show the last 10 commits
		log = { "--since=3 days ago" }, -- show commits from the last 3 days
		timeout = 120, -- kill processes that take more than 2 minutes
		url_format = "https://github.com/%s.git",
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.8, height = 0.8 },
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "none",
		icons = {
			loaded = "●",
			not_loaded = "○",
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			keys = " ",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = "✔ ",
			lazy = "鈴 ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
		-- leave nil, to automatically select a browser depending on your OS.
		-- If you want to use a specific browser, you can define it here
		browser = nil, ---@type string?
		throttle = 20, -- how frequently should the ui process render events
	},
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = "git",
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	-- lazy can generate helptags from the headings in markdown readme files,
	-- so :help works even for plugins that don't have vim docs.
	-- when the readme opens with :help it will be correctly displayed as markdown
	readme = {
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md", "lua/**/README.md" },
		-- only generate markdown helptags for plugins that dont have docs
		skip_if_doc_exists = true,
	},
})
