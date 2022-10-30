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
    use({
      "Pheon-Dev/dashboard-nvim",
      config = "require('config.dashboard')",
    })
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      event = "BufRead",
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
      "folke/noice.nvim",
      event = "VimEnter",
      requires = {
        "rcarriga/nvim-notify",
        "MunifTanjim/nui.nvim",
      },
      config = "require('config.noice')",
    })
    use({
      "kyazdani42/nvim-web-devicons",
    })
    use({
      "nvim-lua/plenary.nvim",
    })
    use({
      "Pheon-Dev/harpoon",
    })
    use({
      "folke/tokyonight.nvim",
      config = "require('config.tokyonight')",
    })
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
      cmd = "Telescope",
      config = "require('config.telescope')",
    })
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
      "tpope/vim-surround",
    })
    --[[ use({ ]]
    --[[   "kylechui/nvim-surround", ]]
    --[[   event = "BufReadPre", ]]
    --[[   config = function() ]]
    --[[     require("nvim-surround").setup({}) ]]
    --[[   end, ]]
    --[[ }) ]]
    --[[   use({ ]]
    --[[   "simrat39/symbols-outline.nvim", ]]
    --[[   cmd = { "SymbolsOutline" }, ]]
    --[[   config = function() ]]
    --[[     require("symbols-outline").setup() ]]
    --[[   end, ]]
    --[[   setup = function() ]]
    --[[     vim.keymap.set("n", "<leader>cs", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" }) ]]
    --[[   end, ]]
    --[[ }) ]]
    use({
      "junegunn/rainbow_parentheses.vim",
    })
    --[[ use { 'echasnovski/mini.nvim' } ]]
    use({
      "edluffy/specs.nvim",
      config = "require('config.specs')",
    })
    use({
      "m-demare/hlargs.nvim",
      --[[ event = "User PackerDefered", ]]
      config = "require('config.hlargs')",
    })
    use({
      "danymat/neogen",
      module = "neogen",
      requires = "nvim-treesitter/nvim-treesitter",
      config = "require('config.neogen')",
    })
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
    use({
      "williamboman/mason.nvim",
      config = "require('config.mason')",
    })
    use({
      "williamboman/mason-lspconfig.nvim",
    })
    use({
      "folke/neodev.nvim",
      module = "neodev",
      config = function()
        require("neodev").setup({})
      end,
    })
    use({
      "onsails/lspkind-nvim",
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
    --[[ use({ ]]
    --[[ 	"ray-x/lsp_signature.nvim", ]]
    --[[ }) ]]
    use({
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig",
    })
    --[[ use({ ]]
    --[[   "lsp-inlayhints.nvim", ]]
    --[[ }) ]]
    use({
      "b0o/schemastore.nvim",
    })
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = "require('config.todo')"
    }
    use({
      "theHamsta/nvim-semantic-tokens",
    })
    use({ "stevearc/dressing.nvim",
      --[[ event = "User PackerDefered", ]]
      config = "require('config.dressing')"
    })
    --[[ use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }) ]]
    use {
      "b0o/incline.nvim",
      config = "require('config.incline')"
    }
    use {
      "smjonas/inc-rename.nvim",
      config = "require('config.inc_rename')"
    }
    use({
      "andymass/vim-matchup",
      event = "BufReadPost",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
      end,
    })
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = "require('config.diffview')" }
    use { "nvim-telescope/telescope-file-browser.nvim", requires = "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-live-grep-args.nvim", requires = "nvim-telescope/telescope.nvim" }
    use { "nvim-telescope/telescope-dap.nvim", requires = "nvim-telescope/telescope.nvim" }
    use({
      "folke/lsp-colors.nvim",
    })
    use({
      "tami5/lspsaga.nvim",
      config = "require('config.lspsaga')",
    })
    use({
      "ckipp01/stylua-nvim",
      run = "cargo install stylua",
    })

    use({ "b0o/SchemaStore.nvim", module = "schemastore" })
    use({ "jose-elias-alvarez/typescript.nvim", module = "typescript" })

    use { "anuvyklack/windows.nvim",
      requires = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim"
      },
      config = "require('config.windows')",
    }

    use({
      "monaqa/dial.nvim",
      config = "require('config.dial')",
    })
    use({
      "ThePrimeagen/refactoring.nvim",
      config = "require('config.refactoring')",
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = "require('config.null-ls')",
    })
    use({
      "jayp0521/mason-null-ls.nvim",
    })
    use({
      "matze/vim-move",
    })
    use({
      "christoomey/vim-tmux-navigator",
    })
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
    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = "require('config.autopairs')",
    })
    use({
      "akinsho/toggleterm.nvim",
      config = "require('config.toggleterm')",
    })
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("gitsigns").setup({ current_line_blame = true })
      end,
    })
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
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufWinEnter",
    })
    use({
      "numToStr/Comment.nvim",
      event = "BufRead",
      config = "require('config.comment')",
    })
    use({
      "karb94/neoscroll.nvim",
      config = "require('config.neoscroll')",
    })
    use({
      "petertriho/nvim-scrollbar",
      config = "require('config.scrollbar')",
    })
    use({
      "kevinhwang91/nvim-hlslens",
      config = "require('config.hlslens')",
    })
    use({
      "easymotion/vim-easymotion",
    })
    use({
      "airblade/vim-gitgutter",
    })
    use({
      "prettier/vim-prettier",
      run = "yarn install --frozen-lockfile --production",
    })
    use({
      "nathom/filetype.nvim",
    })
    use({
      "cljoly/telescope-repo.nvim",
      requires = "airblade/vim-rooter",
    })
    use({
      "j-hui/fidget.nvim",
      config = "require('config.fidget')",
    })
    use({
      "folke/persistence.nvim",
      event = "BufReadPre",
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
    })
    use({
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
      config = function()
        vim.g.startuptime_tries = 10
      end,
    })
    use({
      "folke/trouble.nvim",
      event = "BufReadPre",
      module = "trouble",
      cmd = { "TroubleToggle", "Trouble" },
      config = function()
        require("trouble").setup({
          auto_open = false,
          use_diagnostic_signs = true, -- en
        })
      end,
    })

    --[[ use { "mfussenegger/nvim-dap" } ]]
    --[[    use { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" } ]]
    --[[    use { "rcarriga/cmp-dap", requires = "mfussenegger/nvim-dap" } ]]
    --[[    use { "Weissle/persistent-breakpoints.nvim", requires = "mfussenegger/nvim-dap" } ]]
    --[[ use { ]]
    --[[   "jayp0521/mason-nvim-dap.nvim", ]]
    --[[   requires = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" }, ]]
    --[[ } ]]
    --[[ use({ ]]
    --[[   "folke/neoconf.nvim", ]]
    --[[   module = "neoconf", ]]
    --[[   cmd = "Neoconf", ]]
    --[[ }) ]]

    --[[ use({ ]]
    --[[ 	"Pheon-Dev/pheon.nvim", ]]
    --[[ 	config = "require('config.pheon')", ]]
    --[[ }) ]]
    --[[ use({ ]]
    --[[ 	"sunjon/Shade.nvim", ]]
    --[[ 	config = "require('config.shade')", ]]
    --[[ }) ]]
    --[[ use({ ]]
    --[[ 	"jvgrootveld/telescope-zoxide", ]]
    --[[ }) ]]
    --[[ use({ ]]
    --[[ 	"AckslD/nvim-neoclip.lua", ]]
    --[[ 	requires = { ]]
    --[[ 		{ "tami5/sqlite.lua", module = "sqlite" }, ]]
    --[[ 		{ "nvim-telescope/telescope.nvim" }, ]]
    --[[ 	}, ]]
    --[[ 	config = "require('config.neoclip')", ]]
    --[[ }) ]]
    --[[ use({ ]]
    --[[ 	"nvim-telescope/telescope-fzf-native.nvim", ]]
    --[[ 	run = "make", ]]
    --[[ }) ]]
    --[[ use({ ]]
    --[[ 	"ahmedkhalf/project.nvim", ]]
    --[[ 	config = "require('config.project')", ]]
    --[[ }) ]]
    --[[ use({ ]]
    --[[ 	"tamago324/nlsp-settings.nvim", ]]
    --[[ }) ]]
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
