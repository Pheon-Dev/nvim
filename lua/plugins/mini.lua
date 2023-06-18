return {
  {
    "echasnovski/mini.pairs",
    event = "BufReadPre",
    config = function()
      require("mini.pairs").setup()
    end,
  },
	{
		"echasnovski/mini.indentscope",
		event = "BufReadPre",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "alpha", "lazy", "NvimTree" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup({
				symbol = "│",
				-- symbol = "┊",
				options = { try_as_border = true },
			})
		end,
	},
}
