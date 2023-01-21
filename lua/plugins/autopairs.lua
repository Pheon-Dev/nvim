return {
	"windwp/nvim-autopairs",
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

		npairs.setup({
			enable_check_bracket_line = false,
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%)%>%]%)%}%,]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				typescript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
			disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },

			--[[ if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then ]]
			--[[   require'cmp'.setup.buffer { completion = {enable = false} } ]]
			--[[ end, ]]

			vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }"),
			vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }"),
		})

		local ts_conds = require("nvim-autopairs.ts-conds")

		-- press % => %% only while inside a comment or string
		npairs.add_rules({
			Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
			Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
		})
	end,
}