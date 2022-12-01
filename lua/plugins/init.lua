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

    --[[ ESSENTIALS ]]
    use({ "lewis6991/impatient.nvim" })
    use({ "tweekmonster/startuptime.vim" })
    use({ "nathom/filetype.nvim" })
    use({ "kyazdani42/nvim-web-devicons" })
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-lua/plenary.nvim" })
    use({
      "folke/persistence.nvim",
      event = "BufReadPre",
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
    })

    --[[ START UP ]]
    use({ "folke/tokyonight.nvim", config = "require('config.tokyonight')" })
    use({ "glepnir/dashboard-nvim", config = "require('config.dashboard')" })
    use({ "akinsho/toggleterm.nvim", config = "require('config.toggleterm')" })
    use({ "folke/which-key.nvim", event = "BufWinEnter", config = "require('config.whichkey')" })
    use({ "tamago324/lir.nvim", config = "require('config.lir')" })
    use({ "Pheon-Dev/harpoon", config = "require('config.harpoon')" })
    use({ "ahmedkhalf/project.nvim", config = "require('config.projects')" })
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-telescope/telescope-github.nvim" }, { "nvim-lua/plenary.nvim" } },
      cmd = "Telescope",
      config = "require('config.telescope')",
    })
    use({
      "folke/noice.nvim",
      event = "VimEnter",
      requires = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
      config = "require('config.noice')",
    })
    use({
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = "NvimTreeToggle",
      config = "require('config.nvim-tree')",
    })
    use({
      "folke/zen-mode.nvim",
      config = "require('config.zen')",
    })
    use({
      "folke/twilight.nvim",
      config = "require('config.twilight')",
    })

    --[[ AESTHETICS ]]
    use({ "petertriho/nvim-scrollbar", config = "require('config.scrollbar')" })
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      event = "BufRead",
      config = "require('config.lualine')",
    })
    use({
      "akinsho/bufferline.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      event = "BufWinEnter",
      config = "require('config.bufferline')",
    })
    use({
      "anuvyklack/windows.nvim",
      requires = { "anuvyklack/middleclass", "anuvyklack/animation.nvim", "sindrets/winshift.nvim" },
      config = "require('config.windows')",
    })
    use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" })
    use({
      "nmac427/guess-indent.nvim",
      config = "require('config.indent')",
    })
    use({ "kevinhwang91/rnvimr" })

    --[[ TREESITTER ]]
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = "require('config.treesitter')" })
    use({ "nvim-treesitter/nvim-treesitter-refactor" })
    use({ "windwp/nvim-ts-autotag" })
    use({ "p00f/nvim-ts-rainbow" })

    --[[ SYNTAX ]]
    use({ "tpope/vim-surround" })
    use({ "junegunn/rainbow_parentheses.vim" })
    use({ "norcalli/nvim-colorizer.lua", config = "require('config.colorizer')" })
    use({ "lukas-reineke/indent-blankline.nvim", event = "BufRead", config = "require('config.blankline')" })
    use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = "require('config.autopairs')" })

    --[[ COMPLETION ]]
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        --[[ { "hrsh7th/cmp-vsnip" }, ]]
        { "f3fora/cmp-spell" },
        { "hrsh7th/cmp-cmdline" },
        { "tamago324/cmp-zsh" },
      },
    })
    use({ "ms-jpq/coq_nvim" })

    --[[ SNIPPETS ]]
    use({ "rafamadriz/friendly-snippets" })
    --[[ use({ "hrsh7th/vim-vsnip" }) ]]
    --[[ use({ "hrsh7th/vim-vsnip-integ" }) ]]
    use({
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    })
    use({ "saadparwaiz1/cmp_luasnip" })

    --[[ COMMENTS ]]
    use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim", config = "require('config.todo')" })
    use({ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufWinEnter" })
    use({ "numToStr/Comment.nvim", event = "BufRead", config = "require('config.comment')" })

    --[[ HIGHLIGHTS ]]
    use({ "kevinhwang91/nvim-hlslens", config = "require('config.hlslens')" })
    use({ "phaazon/hop.nvim", branch = "v2", config = "require('config.hop')" })
    use({ "terryma/vim-multiple-cursors" })
    use({
      "andymass/vim-matchup",
      event = "BufReadPost",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
      end,
    })

    --[[ FORMATTING ]]
    use({ "prettier/vim-prettier", run = "yarn install --frozen-lockfile --production" })
    use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })

    --[[ GIT ]]
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim", config = "require('config.diffview')" })
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = "require('config.gitsigns')",
    })
    use({
      "f-person/git-blame.nvim",
    })

    --[[ DIAGNOSTICS ]]
    use({
      "folke/trouble.nvim",
      event = "BufReadPre",
      module = "trouble",
      cmd = { "TroubleToggle", "Trouble" },
      config = "require('config.trouble')",
    })

    --[[ DAP ]]
    use({ "nvim-telescope/telescope-dap.nvim", requires = "nvim-telescope/telescope.nvim" })
    --[[ use({ "theHamsta/nvim-dap-virtual-text" }) ]]
    use({ "Weissle/persistent-breakpoints.nvim", requires = "mfussenegger/nvim-dap" })
    use({
      "jayp0521/mason-nvim-dap.nvim",
      requires = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "jbyuki/one-small-step-for-vimkind",
      },
    })
    use({ "leoluz/nvim-dap-go" })
    use({ "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap", config = "require('config.dap')" })

    --[[ LSP ]]
    use({ "williamboman/mason.nvim", config = "require('config.mason')" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "onsails/lspkind-nvim" })
    use({ "neovim/nvim-lspconfig", config = "require('config.lsp')" })
    use({ "folke/lsp-colors.nvim" })
    use({ "tami5/lspsaga.nvim", branch = "main", config = "require('config.lspsaga')" })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = "require('config.null-ls')",
    })
    use({ "jayp0521/mason-null-ls.nvim" })

    --[[ FOLD ]]
    use({
      "kevinhwang91/nvim-ufo",
      requires = { "kevinhwang91/promise-async" },
      config = "require('config.fold')",
    })

    --[[ UTILS ]]
    use({ "matze/vim-move" })
    use({
      "numToStr/Navigator.nvim",
      config = function()
        require("Navigator").setup()
      end,
    })
    use({ "monaqa/dial.nvim", config = "require('config.dial')" })
    use({ "karb94/neoscroll.nvim", config = "require('config.neoscroll')" })
    use({
      "Pocco81/auto-save.nvim",
      config = "require('config.auto-save')",
    })
    use({ "gbprod/yanky.nvim", requires = { "kkharji/sqlite.lua" }, config = "require('config.yanky')" })
    use({ "jghauser/mkdir.nvim" })

    --[[ Links ]]
    use({
      "xiyaowong/link-visitor.nvim",
      config = "require('config.link')",
    })

    --[[ Language Specific ]]
    use({ "jose-elias-alvarez/typescript.nvim", module = "typescript" })
    --[[ use({ "fatih/vim-go" }) ]]
    use({
      "ray-x/go.nvim",
      requires = { "ray-x/guihua.lua" },
      config = function()
        require("go").setup()
      end,
    })

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
