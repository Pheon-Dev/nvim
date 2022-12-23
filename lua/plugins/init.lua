local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local packer = require("packer")

return packer.startup({
	function(use)
		--[[ PACKER ]]
		use({ "wbthomason/packer.nvim" })

		--[[ REQUIRED ]]
		use({ "lewis6991/impatient.nvim" })
		use({ "tweekmonster/startuptime.vim" })
		use({ "nathom/filetype.nvim" })
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "nvim-lua/popup.nvim" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "rcarriga/nvim-notify" })
		use({ "MunifTanjim/nui.nvim" })

		--[[ START UP ]]
		use({ "folke/tokyonight.nvim" })
		use({ "glepnir/dashboard-nvim" })
		use({ "akinsho/toggleterm.nvim" })
		use({ "tamago324/lir.nvim" })
		use({ "Pheon-Dev/harpoon" })
		use({ "nvim-telescope/telescope-file-browser.nvim" })

		--[[ AESTHETICS ]]
		use({ "petertriho/nvim-scrollbar" })
		use({ "anuvyklack/windows.nvim" })
		use({ "anuvyklack/middleclass" })
		use({ "anuvyklack/animation.nvim" })
		use({ "sindrets/winshift.nvim" })
		use({ "nmac427/guess-indent.nvim" })
		use({ "SmiteshP/nvim-navic" })

		--[[ TREESITTER ]]
		use({ "nvim-treesitter/nvim-treesitter-refactor" })
		use({ "windwp/nvim-ts-autotag" })
		use({ "p00f/nvim-ts-rainbow" })

		--[[ SYNTAX ]]
		use({ "junegunn/rainbow_parentheses.vim" })
		use({ "norcalli/nvim-colorizer.lua" })
		use({ "ray-x/sad.nvim" })
		use({ "dnlhc/glance.nvim" })

		--[[ COMPLETION ]]
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-nvim-lua" })
		use({ "ray-x/cmp-treesitter" })
		use({ "f3fora/cmp-spell" })
		use({ "hrsh7th/cmp-cmdline" })
		use({ "tamago324/cmp-zsh" })
		use({ "tzachar/cmp-tabnine", run = "./install.sh" })
		use({ "lukas-reineke/cmp-under-comparator" })
		use({ "ms-jpq/coq_nvim" })

		--[[ SNIPPETS ]]
		use({ "rafamadriz/friendly-snippets" })
		use({ "L3MON4D3/LuaSnip" })
		use({ "saadparwaiz1/cmp_luasnip" })

		--[[ COMMENTS ]]
		use({ "folke/todo-comments.nvim" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufWinEnter" })

		--[[ HIGHLIGHTS ]]
		use({ "kevinhwang91/nvim-hlslens" })
		use({ "phaazon/hop.nvim", branch = "v2" })
		use({ "mg979/vim-visual-multi", branch = "master", event = "BufReadPre" })

		--[[ FORMATTING ]]
		use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })
		use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })

		--[[ GIT ]]
		use({ "lewis6991/gitsigns.nvim" })
		use({ "f-person/git-blame.nvim" })

		--[[ LSP ]]
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		use({ "onsails/lspkind-nvim" })
		use({
			"neovim/nvim-lspconfig",
			config = "require('config.lsp')",
		})
		use({ "folke/lsp-colors.nvim" })
		use({ "tami5/lspsaga.nvim", branch = "main" })
		use({ "jose-elias-alvarez/null-ls.nvim" })
		use({ "jayp0521/mason-null-ls.nvim" })

		--[[ FOLD ]]
		use({ "kevinhwang91/nvim-ufo" })
		use({ "kevinhwang91/promise-async" })

		--[[ UTILS ]]
		use({ "booperlv/nvim-gomove" })
		use({ "numToStr/Navigator.nvim" })
		use({ "monaqa/dial.nvim" })
		use({ "karb94/neoscroll.nvim" })
		use({ "Pocco81/auto-save.nvim" })
		use({ "kkharji/sqlite.lua" })
		use({ "jghauser/mkdir.nvim" })
		use({ "xiyaowong/virtcolumn.nvim" })
		use({ "xiyaowong/link-visitor.nvim" })
		use({ "lvimuser/lsp-inlayhints.nvim" })
		use({ "mbbill/undotree" })
		use({ "ray-x/navigator.lua" })
		use({ "toppair/reach.nvim" })
		use({ "haringsrob/nvim_context_vt" })
		use({ "cbochs/grapple.nvim" })
		use({ "cbochs/portal.nvim" })

		--[[ TS ]]
		use({ "jose-elias-alvarez/typescript.nvim", module = "typescript" })

		--[[ GO ]]
		use({ "ray-x/go.nvim" })
		use({ "ray-x/guihua.lua" })
		use({ "nsf/gocode" })
		use({ "crusj/structrue-go.nvim", branch = "main" })
		use({ "olexsmir/gopher.nvim" })

		use({
			"folke/persistence.nvim",
			event = "BufReadPre",
			module = "persistence",
			config = function()
				require("persistence").setup()
			end,
		})
		use({
			"folke/which-key.nvim",
			event = "BufWinEnter",
			config = "require('config.whichkey')",
		})
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			config = "require('config.telescope')",
		})
		use({
			"folke/noice.nvim",
			event = "VimEnter",
			config = "require('config.noice')",
		})
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = "require('config.nvim-tree')",
		})
		use({
			"nvim-lualine/lualine.nvim",
			event = "BufRead",
			config = "require('config.lualine')",
		})
		use({
			"akinsho/bufferline.nvim",
			event = "BufWinEnter",
			config = "require('config.bufferline')",
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = "require('config.treesitter')",
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = "require('config.blankline')",
		})
		use({
			"gbprod/yanky.nvim",
			event = "BufReadPre",
			config = "require'config.yanky'",
		})
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = "require('config.autopairs')",
		})
		use({
			"numToStr/Comment.nvim",
			event = "BufRead",
			config = "require('config.comment')",
		})
		use({
			"andymass/vim-matchup",
			event = "BufReadPost",
		})

		--[[ QUICKFIX ]]
		use({
			"folke/trouble.nvim",
			event = "BufReadPre",
			module = "trouble",
			cmd = { "TroubleToggle", "Trouble" },
			config = "require('config.trouble')",
		})
		use({ "kevinhwang91/nvim-bqf" })
		use({ "onsails/diaglist.nvim" })
		use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" })

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
			non_interactive = false,
			compact = false,
			open_cmd = "65vnew",
			working_sym = "⟳",
			error_sym = "✗",
			done_sym = "✓",
			removed_sym = "-",
			moved_sym = "→",
			item_sym = "•",
			header_sym = "━",
			header_lines = 2,
			title = "packer.nvim",
			show_all_info = true,
			prompt_border = "single",
			keybindings = {
				quit = "h",
				toggle_update = "u",
				continue = "c",
				toggle_info = "l",
				diff = "d",
				prompt_revert = "r",
				retry = "R",
			},
		},
	},
})
