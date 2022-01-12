return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'overcache/NeoSolarized'
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ":TSUpdate",
    -- event = "BufWinEnter",
    config = "require('treesitter-config')"
  }
  use {'windwp/nvim-ts-autotag'}
  use {'p00f/nvim-ts-rainbow'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}, 
    cmd = "NvimTreeToggle",
    config = "require('nvim-tree-config')"
  }
  use 'kyazdani42/nvim-web-devicons'
  use {'vim-airline/vim-airline'}
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
    'windwp/nvim-autopairs',
    after = "nvim-cmp",
    config = "require('autopairs-config')"
  }
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter",
    config = "require('whichkey-config')"
  }
  use 'nvim-lua/completion-nvim'
  use {'neovim/nvim-lspconfig', config = "require('lsp')"}
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind-nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'tpope/vim-commentary' -- For Commenting gcc & gc
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
  use {'folke/zen-mode.nvim', config = "require('zen-mode-config')"}
  use {'folke/twilight.nvim', config = "require('twilight-config')"}
  -- use 'tpope/vim-surround'
  use 'preservim/tagbar'
  use 'terryma/vim-multiple-cursors' -- C-N 
  -- use 'neoclide/coc.vim'
  use 'maxmellon/vim-jsx-pretty'
  use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'}
  use 'styled-components/vim-styled-components'
  use 'mlaursen/vim-react-snippets'
  -- use 'jpraise/vim-graphql'
  use {'liuchengxu/vim-clap',  run =  'Clap install-binary' }
  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  -- use '/'
end)
