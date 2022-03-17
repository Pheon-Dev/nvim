-- NeoSolarized onenord onedark tokyonight
vim.cmd('colorscheme tokyonight')
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.o.background = 'dark'
vim.o.termguicolors = true
-- require('onedark').setup {
--   tokyonight_transparent = true
-- }
-- require('onedark').load()
-- vim.cmd([[
-- 	if exists("&termguicolors") && exists("winblend")
-- 		syntax enable
-- 		set winblend = 0
-- 		set wildoptions = pum
-- 		set pumblend = 5
-- 		let g:neosolarized_termtrans = 1
-- 	endif
-- ]])

-- Visual highlight  2b506e 2b5030 
-- vim.cmd('highlight Visual cterm=reverse ctermfg=10 ctermbg=8 gui=nocombine guibg=#3b3b3b guifg=#10f0f0 ')
-- vim.cmd('highlight LineNr cterm=NONE ctermfg=8 guifg=#3b3b3b guibg=NONE')

-- -- Pmenu
-- vim.cmd('highlight Pmenu cterm=reverse ctermfg=12 ctermbg=8 gui=reverse guibg=#10f080 guifg=#262626 ')
-- vim.cmd('highlight PmenuSel cterm=reverse ctermfg=12 ctermbg=8 gui=reverse guibg=#10f0f0 guifg=#3a3a3a ')
-- vim.cmd('highlight PmenuSBar cterm=reverse ctermfg=12 ctermbg=8 gui=reverse guibg=#1080e0 guifg=#262626 ')

-- -- WhichKey
-- vim.cmd('highlight WhichKey cterm=reverse ctermfg=12 ctermbg=0 gui=reverse guibg=#10f0f0 guifg=#262626 ')
-- vim.cmd('highlight WhichKeyDesc cterm=reverse ctermfg=12 ctermbg=0 gui=reverse guibg=#10f0f0 guifg=#262626 ')
-- vim.cmd('highlight WhichKeyGroup cterm=reverse ctermfg=12 ctermbg=0 gui=reverse guibg=#10f080 guifg=#262626 ')

-- -- LSP
-- vim.cmd('highlight LspInstallerHeading cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=NONE guibg=#10f0f0 ')
-- vim.cmd('highlight LspInstallerHeader cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=NONE guibg=#10f080 ')
-- vim.cmd('highlight LspInstallerLink cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=NONE guibg=#e0f080 ')
-- vim.cmd('highlight LspInstallerMuted cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=NONE guibg=#10f0a0 ')
-- vim.cmd('highlight LspInstallerLabel cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=NONE guibg=#108080 ')
-- vim.cmd('highlight LspInstallerServerExpanded cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=#ffff20 guibg=#107080 ')
-- vim.cmd('highlight LspInstallerHighlighted cterm=reverse ctermfg=10 ctermbg=8 gui=reverse guifg=NONE guibg=#10f010 ')

-- Dashboard Header
vim.cmd('highlight DashboardHeader guifg=#1080f0 ')
vim.cmd('highlight DashboardCenter guifg=#10a0f0 ')
vim.cmd('highlight DashboardFooter guifg=#10f0f0 ')
vim.cmd('highlight DashboardShortCut guifg=#10f030 ')

