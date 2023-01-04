return {

  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- library used by other plugins
  "nvim-lua/plenary.nvim",

  --[[ Terminal ]]
  "akinsho/toggleterm.nvim",

  --[[ Notifications ]]
  {
    "rcarriga/nvim-notify",
    config = true,
  },
  "Pheon-Dev/harpoon",
	"petertriho/nvim-scrollbar",
	"sindrets/winshift.nvim",
	"nmac427/guess-indent.nvim",
	"SmiteshP/nvim-navic",
	"booperlv/nvim-gomove",
	"numToStr/Navigator.nvim",
	"xiyaowong/virtcolumn.nvim",
	"xiyaowong/link-visitor.nvim",
	"cbochs/grapple.nvim",
	"cbochs/portal.nvim",
	--[[ { "phaazon/hop.nvim", branch = "v2" }, ]]
}
