local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap =
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local packer = require("packer")

return packer.startup({
  function(use)
    --[[ PACKER ]]
    use("wbthomason/packer.nvim")

    --[[ ESSENTIALS ]]
    use("lewis6991/impatient.nvim")
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
      "nvim-lua/popup.nvim",
    })
    use({
      "nvim-lua/plenary.nvim",
    })
    use({
      "nathom/filetype.nvim",
    })
    use({
      "folke/persistence.nvim",
      event = "BufReadPre",
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
    })

    --[[ START UP ]]
    use({
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
      config = function()
        vim.g.startuptime_tries = 10
      end,
    })
    use({
      "folke/tokyonight.nvim",
      config = "require('config.tokyonight')",
    })
    use({
      "Pheon-Dev/dashboard-nvim",
      config = "require('config.dashboard')",
    })
    use({
      "folke/which-key.nvim",
      event = "BufWinEnter",
      config = "require('config.whichkey')",
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
      "Pheon-Dev/harpoon",
    })
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
      cmd = "Telescope",
      config = "require('config.telescope')",
    })
    use 'jvgrootveld/telescope-zoxide'
    use {
      "nvim-telescope/telescope-frecency.nvim",
      requires = { "kkharji/sqlite.lua" }
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      cmd = "NvimTreeToggle",
      config = "require('config.nvim-tree')"
    }
    use({
      "akinsho/toggleterm.nvim",
      config = "require('config.toggleterm')",
    })
    use { "nvim-telescope/telescope-live-grep-args.nvim", requires = "nvim-telescope/telescope.nvim" }

    --[[ UTILS ]]
    use({
      "matze/vim-move",
    })
    use({
      "christoomey/vim-tmux-navigator",
    })
    use({
      "monaqa/dial.nvim",
      config = "require('config.dial')",
    })
    use({
      "karb94/neoscroll.nvim",
      config = "require('config.neoscroll')",
    })

    --[[ AESTHETICS ]]
    use({
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons", opt = true,
      },
      event = "BufRead",
      config = "require('config.lualine')",
    })
    use({
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      event = "BufWinEnter",
      config = "require('config.bufferline')",
    })
    use { "anuvyklack/windows.nvim",
      requires = {
        "anuvyklack/middleclass",
        "anuvyklack/animation.nvim"
      },
      config = "require('config.windows')",
    }
    use({
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig",
    })
    use({
      "petertriho/nvim-scrollbar",
      config = "require('config.scrollbar')",
    })
    use({
      "j-hui/fidget.nvim",
      config = "require('config.fidget')",
    })
    use {
      "b0o/incline.nvim",
      config = "require('config.incline')"
    }

    --[[ TREESITTER ]]
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

    --[[ SYNTAX ]]
    use({
      "tpope/vim-surround",
    })
    use({
      "junegunn/rainbow_parentheses.vim",
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

    --[[ LSP ]]
    use({
      "folke/neodev.nvim",
      module = "neodev",
      config = function()
        require("neodev").setup({})
      end,
    })
    use({
      "williamboman/mason.nvim",
      config = "require('config.mason')",
    })
    use({
      "williamboman/mason-lspconfig.nvim",
    })
    use({
      "onsails/lspkind-nvim",
    })
    use({
      "neovim/nvim-lspconfig",
      config = "require('config.lsp')",
    })
    use({
      "folke/lsp-colors.nvim",
    })
    use({
      "tami5/lspsaga.nvim",
      config = "require('config.lspsaga')",
    })
    --[[ use({ ]]
    --[[   "ray-x/lsp_signature.nvim", ]] -- Noice's Signature
    --[[ }) ]]
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = "require('config.null-ls')",
    })
    use({
      "jayp0521/mason-null-ls.nvim",
    })

    --[[ COMPLETION ]]
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        { "hrsh7th/cmp-vsnip" },
        { "f3fora/cmp-spell" },
        { "hrsh7th/cmp-cmdline" },
        { "tamago324/cmp-zsh" },
      },
    })

    --[[ SNIPPETS ]]
    use({
      "rafamadriz/friendly-snippets",
    })
    use({
      "hrsh7th/vim-vsnip",
    })
    use({
      "hrsh7th/vim-vsnip-integ",
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
      "danymat/neogen",
      module = "neogen",
      requires = "nvim-treesitter/nvim-treesitter",
      config = "require('config.neogen')",
    })
    use({ "b0o/SchemaStore.nvim", module = "schemastore" })

    --[[ COMMENTS ]]
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = "require('config.todo')"
    }
    use({
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufWinEnter",
    })
    use({
      "numToStr/Comment.nvim",
      event = "BufRead",
      config = "require('config.comment')",
    })

    --[[ HIGHLIGHTS ]]
    use({
      "kevinhwang91/nvim-hlslens",
      config = "require('config.hlslens')",
    })
    use({
      "easymotion/vim-easymotion",
    })
    use({
      "m-demare/hlargs.nvim",
      event = "User PackerDefered",
      config = "require('config.hlargs')",
    })
    use({
      "terryma/vim-multiple-cursors",
    })
    use({
      "andymass/vim-matchup",
      event = "BufReadPost",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
      end,
    })

    --[[ FORMATTING ]]
    use({
      "prettier/vim-prettier",
      run = "yarn install --frozen-lockfile --production",
    })
    use({
      "ckipp01/stylua-nvim",
      run = "cargo install stylua",
    })
    use({ "jose-elias-alvarez/typescript.nvim", module = "typescript" })

    --[[ GIT ]]
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
      "cljoly/telescope-repo.nvim",
      requires = "airblade/vim-rooter",
    })
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = "require('config.diffview')" }

    --[[ DIAGNOSTICS ]]
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

    --[[ DAP ]]
    use { "nvim-telescope/telescope-dap.nvim", requires = "nvim-telescope/telescope.nvim" }
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" }
    use { "rcarriga/cmp-dap", requires = "mfussenegger/nvim-dap" }
    use { "Weissle/persistent-breakpoints.nvim", requires = "mfussenegger/nvim-dap" }
    use {
      "jayp0521/mason-nvim-dap.nvim",
      requires = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    }

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
    --[[ 	"tamago324/nlsp-settings.nvim", ]]
    --[[ }) ]]
    --[[ use { 'echasnovski/mini.nvim' } ]]
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
