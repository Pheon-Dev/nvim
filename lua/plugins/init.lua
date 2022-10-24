local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local packer = require("packer")

return packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use("lewis6991/impatient.nvim")

		-- Essentials
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			--[[ event = "BufRead", ]]
			config = "require('config.lualine')",
		})
		use({
			"tamago324/lir.nvim",
			config = "require('config.lir')",
		})
		use({
			"tamago324/lir-git-status.nvim",
			config = function()
				require("lir.git_status").setup({
					show_ignored = false,
				})
			end,
		})
		use({
			"nvim-lua/popup.nvim",
		})
		use({
			"kyazdani42/nvim-web-devicons",
		})
		use({
			"nvim-lua/plenary.nvim",
		})
		use({
			"ThePrimeagen/harpoon",
		})
		use({
			"j-hui/fidget.nvim",
			config = "require('config.fidget')",
		})
		-- Theme
		use({
			"folke/tokyonight.nvim",
			config = "require('config.tokyonight')",
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-github.nvim" },
			},
			cmd = "Telescope",
			config = "require('config.telescope')",
		})
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		})

		-- Highlighting
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = "require('config.treesitter')",
		})
		use({
			"nvim-treesitter/nvim-treesitter-refactor",
		})
		use({
			"windwp/nvim-ts-autotag",
		})
		use({
			"p00f/nvim-ts-rainbow",
		})
		use({
			"folke/persistence.nvim",
		})
		use({
			"nathom/filetype.nvim",
		})
		use({
			"tpope/vim-surround",
		})
		use({
			"junegunn/rainbow_parentheses.vim",
		})

		-- Keybindings
		use({
			"folke/which-key.nvim",
			event = "BufWinEnter",
			config = "require('config.whichkey')",
		})

		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			event = "BufWinEnter",
			config = "require('config.bufferline')",
		})

		-- LSP & Completions
		use({
			"folke/neodev.nvim",
			config = function()
				require("neodev").setup({})
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = "require('config.lsp')",
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "ray-x/cmp-treesitter" },
				{ "hrsh7th/cmp-vsnip" },
				{ "hrsh7th/vim-vsnip" },
				{ "hrsh7th/vim-vsnip-integ" },
				--[[ { "Saecki/crates.nvim" }, ]]
				{ "f3fora/cmp-spell" },
				{ "hrsh7th/cmp-cmdline" },
				{ "tamago324/cmp-zsh" },
				{ "rafamadriz/friendly-snippets" },
			},
		})
		use({
			"ray-x/lsp_signature.nvim",
		})
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
		})
		use({
			"folke/lsp-colors.nvim",
		})
		use({
			"onsails/lspkind-nvim",
		})
		use({
			"williamboman/mason-lspconfig.nvim",
		})
		use({
			"tamago324/nlsp-settings.nvim",
		})
		use({
			"williamboman/mason.nvim",
			config = "require('config.mason')",
			commit = "d1c860da4b89fd29a45decfb490c79748d954493",
		})
		use({
			"tami5/lspsaga.nvim",
			config = "require('config.lspsaga')",
		})
		use({
			"ckipp01/stylua-nvim",
			run = "cargo install stylua",
		})
		use({
			"jose-elias-alvarez/typescript.nvim",
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = "require('config.null-ls')",
		})
		-- Motion
		use({
			"matze/vim-move",
		})
		use({
			"karb94/neoscroll.nvim",
			config = "require('config.neoscroll')",
		})
		use({
			"easymotion/vim-easymotion",
		})
		use({
			"christoomey/vim-tmux-navigator",
		})

		-- Utils
		use({
			"terryma/vim-multiple-cursors",
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = "require('config.colorizer')",
		})
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = "require('config.blankline')",
		})
		-- Formatting
		use({
			"prettier/vim-prettier",
			run = "yarn install --frozen-lockfile --production",
		})
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = "require('config.autopairs')",
		})

		-- Terminal
		use({
			"akinsho/toggleterm.nvim",
			config = "require('config.toggleterm')",
		})

		-- Git
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("gitsigns").setup({ current_line_blame = true })
			end,
		})
		use({
			"airblade/vim-gitgutter",
		})

		use({
			"nvim-telescope/telescope-github.nvim",
		})
		use({
			"jvgrootveld/telescope-zoxide",
		})
		use({
			"airblade/vim-rooter",
		})
		--[[ use 'cljoly/telescope-repo.nvim' ]]
		use({
			"AckslD/nvim-neoclip.lua",
			requires = {
				{ "tami5/sqlite.lua", module = "sqlite" },
				{ "nvim-telescope/telescope.nvim" },
			},
			config = "require('config.neoclip')",
		})
		use({
		    "rcarriga/nvim-notify",
		})
		--[[ use({ ]]
		--[[   "folke/noice.nvim", ]]
		--[[   event = "VimEnter", ]]
		--[[   config = "require('config.noice')", ]]
		--[[   requires = { ]]
		--[[     "MunifTanjim/nui.nvim", ]]
		--[[     "rcarriga/nvim-notify", ]]
		--[[   }, ]]
		--[[ }) ]]

		-- Snippets
		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		})
		use({
			"saadparwaiz1/cmp_luasnip",
		})
		use({
			"folke/lua-dev.nvim",
		})

		-- Commentary
		use({
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "BufWinEnter",
		})
		use({
			"numToStr/Comment.nvim",
			event = "BufRead",
			config = "require('config.comment')",
		})

		-- Decors
		use({
			"sunjon/Shade.nvim",
			config = "require('config.shade')",
		})
		use({
			"ahmedkhalf/project.nvim",
			config = "require('config.project')",
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
