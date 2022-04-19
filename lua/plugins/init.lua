return require('packer').startup({function()
  use 'wbthomason/packer.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'folke/tokyonight.nvim'
  use {
    'karb94/neoscroll.nvim',
    config = "require('neoscroll-config')"
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = "require('treesitter-config')"
  }
  use {'windwp/nvim-ts-autotag'}
  use {'p00f/nvim-ts-rainbow'}
  use 'junegunn/rainbow_parentheses.vim'
  use 'folke/lsp-colors.nvim'
  use 'nvim-lua/completion-nvim'
  use {
    'nvim-lua/popup.nvim',
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    cmd = "NvimTreeToggle",
    config = "require('nvim-tree-config')"
  }
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = "BufRead",
    config = "require('lualine-config')"
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = "require('bufferline-config')"
  }
  use {
    'akinsho/toggleterm.nvim',
    config = "require('toggleterm-config')"
  }
  use {
    'glepnir/dashboard-nvim',
    config = "require('dashboard-config')"
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function()
      require('gitsigns').setup {current_line_blame = true}
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {"nvim-telescope/telescope-github.nvim"},
    },
    cmd = "Telescope",
    config = "require('telescope-config')"
  }
  use 'nvim-lua/plenary.nvim'
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = {"tami5/sqlite.lua"}
  }
  use {
    'dhruvmanila/telescope-bookmarks.nvim',
    requires = {
      'tami5/sqlite.lua',
    },
  }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'tami5/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = "require('neoclip-config')"
  }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = "require('octo-config')"
  }
  use 'jvgrootveld/telescope-zoxide'
  use 'airblade/vim-rooter'
  use 'cljoly/telescope-repo.nvim'
  use {
    'windwp/nvim-autopairs',
    after = "nvim-cmp",
    config = "require('autopairs-config')"
  }
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = "require('whichkey-config')"
  }
  use 'easymotion/vim-easymotion'
  use {
    'sunjon/Shade.nvim',
    config = "require('shade-config')"
  }
  use {'neovim/nvim-lspconfig', config = "require('lsp')"}
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
  use 'onsails/lspkind-nvim'
  use 'williamboman/nvim-lsp-installer'
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufWinEnter"
  }
  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = "require('comment-config')",
    commit = "026ec9530b6691db8c68a3ae4fc44c56aa281f52"
  }
  use { "tamago324/nlsp-settings.nvim"}
  use { "antoinemadec/FixCursorHold.nvim"} -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use {'norcalli/nvim-colorizer.lua', config = "require('colorizer-config')"}
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufRead",
    config = "require('blankline-config')"
  }
  use {'tami5/lspsaga.nvim', config = "require('lspsaga-config')"}
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('null-ls-config')"
  }
  use 
  {
    "folke/lua-dev.nvim",
    module = "lua-dev",
  }
  use 'tpope/vim-surround'
  use {
    'pechorin/any-jump.vim',
  }
  use 'tpope/vim-fugitive'
  use 'preservim/tagbar'
  use {'folke/twilight.nvim', config = "require('twilight-config')"}
  use 'terryma/vim-multiple-cursors' -- C-N 
  use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'}
end,
config = {
  display = {
    open_fn = function ()
      return  require('packer.util').float({border = 'single'})
    end
  }
}}
)
