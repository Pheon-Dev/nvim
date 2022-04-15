return require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- use 'overcache/NeoSolarized'
  use 'folke/tokyonight.nvim'
  use {
    'karb94/neoscroll.nvim',
    config = "require('neoscroll-config')"
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    -- event = "BufWinEnter",
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
  -- use {'vim-airline/vim-airline'}
  use {
    'tamton-aquib/staline.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = "BufRead",
    config = "require('staline-config')"
  }
  -- use {
  -- 'nvim-lualine/lualine.nvim',
  --   config = "require('lualine-config')",
  --     requires = { "kyazdani42/nvim-web-devicons", opt = true },
  -- }
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
    -- event = "BufRead",
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
    requires = {{'nvim-lua/plenary.nvim'}},
    cmd = "Telescope",
    config = "require('telescope-config')"
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
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
    -- config = "require('cmp-config')",
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
--   use {
-- "Tastyep/structlog.nvim",
--     -- config = "require('logger-config')"
--   }
  use 'onsails/lspkind-nvim'
  use 'williamboman/nvim-lsp-installer'
  use {
"JoosepAlviste/nvim-ts-context-commentstring",
event = "BufWinEnter"
  }
  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = "require('comment-config')"
  }
  use { "tamago324/nlsp-settings.nvim"}
  use { "antoinemadec/FixCursorHold.nvim"} -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use {
    "rcarriga/nvim-notify",
    config = "require('notify-config')",
    event = "BufRead",
  }
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
  -- use {'folke/zen-mode.nvim', config = "require('zen-mode-config')"}
  use {'folke/twilight.nvim', config = "require('twilight-config')"}
  -- use 'tpope/vim-surround'
  -- use 'preservim/tagbar'
  use 'terryma/vim-multiple-cursors' -- C-N 
  -- use 'neoclide/coc.vim'
  -- use 'maxmellon/vim-jsx-pretty'
  -- use {
  --   'MunifTanjim/prettier.nvim',
  --   config = "require('prettier-config')"
  -- }
  use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'}
  -- use 'styled-components/vim-styled-components'
  -- use 'mlaursen/vim-react-snippets'
  -- use 'jpraise/vim-graphql'
  -- use {'liuchengxu/vim-clap',  run =  'Clap install-binary' }
  -- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- use '/'
end,
config = {
  display = {
    open_fn = function ()
      return  require('packer.util').float({border = 'single'})
    end
  }
}}
)
