return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			on_config_done = nil,
			open_mapping = [[`]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = false,
			persist_size = false,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved", -- single, double, shadow, curved,
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
					cursor = "Normal",
				},
			},
			--[[ autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened ]]
			--[[ terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals ]]
			--[[ persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered ]]
			--[[ auto_scroll = true, -- automatically scroll to the bottom on terminal output ]]
			--[[ -- This field is only relevant if direction is set to 'float' ]]
			highlights = {
				-- highlights which map to a highlight group name and a table of it's values
				-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
				Normal = {
					guibg = "#282a36",
				},
				NormalFloat = {
					link = "PmenuSel",
				},
				FloatBorder = {
					guifg = "#282a36",
					guibg = "#282a36",
				},
			},
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
		})
		-- function _G.set_terminal_keymaps()
		-- 	local opts = { noremap = true }
		-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-J>", [[<C-\><C-n><C-W>h]], opts)
		-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-K>", [[<C-\><C-n><C-W>l]], opts)
		-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		-- 	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		-- 	-- vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		-- end
		--
		-- vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
	end,
}
