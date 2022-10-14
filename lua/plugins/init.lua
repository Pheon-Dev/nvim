local packer = require("packer")

return packer.startup({ function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Essentials
  use {
    'nvim-lua/popup.nvim',
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use {
    "kevinhwang91/rnvimr",
    run = "make sync",
  }

  -- Theme
  use {
    'folke/tokyonight.nvim',
    config = "require('config.tokyonight')"
  }

  -- Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = "require('config.treesitter')"
  }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'p00f/nvim-ts-rainbow' }
  use 'junegunn/rainbow_parentheses.vim'

  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = "NvimTreeToggle",
    config = "require('config.nvim-tree')"
  }

  -- Status Bars
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    event = "BufRead",
    config = "require('config.lualine')",
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = "require('config.bufferline')"
  }

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    config = "require('config.toggleterm')"
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('gitsigns').setup { current_line_blame = true }
    end
  }
  use 'airblade/vim-gitgutter'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    },
    cmd = "Telescope",
    config = "require('config.telescope')",
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  -- Utils
  use 'terryma/vim-multiple-cursors' -- C-N
  use { "antoinemadec/FixCursorHold.nvim" } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use { 'norcalli/nvim-colorizer.lua', config = "require('config.colorizer')" }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = "require('config.blankline')"
  }

  -- Formatting
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use {
    'windwp/nvim-autopairs',
    after = "nvim-cmp",
    config = "require('config.autopairs')"
  }

  -- Keybindings
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = "require('config.whichkey')"
  }

  -- Motion
  use 'matze/vim-move'
  use {
    'karb94/neoscroll.nvim',
    config = "require('config.neoscroll')"
  }
  use 'easymotion/vim-easymotion'
  use 'christoomey/vim-tmux-navigator'

  -- LSP & Completions
  use { 'neovim/nvim-lspconfig', config = "require('config.lsp')" }
  use {
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
      { "Saecki/crates.nvim" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-cmdline" },
      { "tamago324/cmp-zsh" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  }
  use {
    "ray-x/lsp_signature.nvim",
  }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  }
  use 'folke/lsp-colors.nvim'
  use 'onsails/lspkind-nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use {
    'williamboman/mason.nvim',
    config = "require('config.mason')",
    commit = "d1c860da4b89fd29a45decfb490c79748d954493"
  }
  use { "tamago324/nlsp-settings.nvim" }
  use { 'tami5/lspsaga.nvim', config = "require('config.lspsaga')" }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('config.null-ls')"
  }


  -- Snippets
  use 'mattn/emmet-vim'
  use {
    "rafamadriz/friendly-snippets",
  }
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  }
  use {
    "saadparwaiz1/cmp_luasnip",
  }
  use
  {
    "folke/lua-dev.nvim",
    module = "lua-dev",
  }

  -- Commentary
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufWinEnter"
  }
  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = "require('config.comment')",
  }

  -- Decors
  use {
    'glepnir/dashboard-nvim',
    config = "require('config.dashboard')",
  }
  use {
    'sunjon/Shade.nvim',
    config = "require('config.shade')"
  }
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  } }
)
