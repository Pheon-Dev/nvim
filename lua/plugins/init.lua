return require('packer').startup({ function()
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
    config = "require('tokyonight-config')"
  }

  -- Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = "require('treesitter-config')"
  }
  use { 'windwp/nvim-ts-autotag' }
  use { 'p00f/nvim-ts-rainbow' }
  use 'junegunn/rainbow_parentheses.vim'

  -- Completions
  use 'nvim-lua/completion-nvim'

  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = "NvimTreeToggle",
    config = "require('nvim-tree-config')"
  }

  -- Status Bars
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    event = "BufRead",
    config = "require('lualine-config')"
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = "require('bufferline-config')"
  }

  -- Terminal
  use {
    'akinsho/toggleterm.nvim',
    config = "require('toggleterm-config')"
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
    config = "require('telescope-config')",
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }

  -- Utils
  use 'terryma/vim-multiple-cursors' -- C-N 
  use { "antoinemadec/FixCursorHold.nvim" } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use { 'norcalli/nvim-colorizer.lua', config = "require('colorizer-config')" }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = "require('blankline-config')"
  }

  -- Formatting
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use {
    'windwp/nvim-autopairs',
    after = "nvim-cmp",
    config = "require('autopairs-config')"
  }

  -- Keybindings
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = "require('whichkey-config')"
  }

  -- Motion
  use 'matze/vim-move'
  use {
    'karb94/neoscroll.nvim',
    config = "require('neoscroll-config')"
  }
  use 'easymotion/vim-easymotion'
  use 'christoomey/vim-tmux-navigator'

  -- LSP & Completions
  use { 'neovim/nvim-lspconfig', config = "require('lsp')" }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "ray-x/cmp-treesitter" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
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
  use 'folke/lsp-colors.nvim'
  use 'onsails/lspkind-nvim'
  use 'pantharshit00/vim-prisma'
  use 'williamboman/mason-lspconfig.nvim'
  use {
    'williamboman/mason.nvim',
    config = "require('mason-config')"
  }
  use { "tamago324/nlsp-settings.nvim" }
  use { 'tami5/lspsaga.nvim', config = "require('lspsaga-config')" }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('null-ls-config')"
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
    config = "require('comment-config')",
  }

  -- Decors
  use {
    'glepnir/dashboard-nvim',
    config = "require('dashboard-config')",
  }
  use {
    'sunjon/Shade.nvim',
    config = "require('shade-config')"
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
