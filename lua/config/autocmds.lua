local format_sync_grp = vim.api.nvim_create_augroup("format_sync_grp", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

vim.cmd("autocmd!")
vim.cmd("autocmd Insertleave * set nopaste")
vim.cmd('autocmd VimEnter * :silent exec "!kill -s SIGNWINCH $PPID"')
vim.cmd("autocmd FileType coffee setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType ruby setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType yaml setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart")
vim.cmd("autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear")

vim.cmd([[
    augroup zap_config
        autocmd!
        autocmd BufWritePost zap.zsh !shfmt -l -w .
    augroup END
]])

vim.cmd("au BufnewFile,BufRead term:* setf Terminal")
vim.cmd("au BufnewFile,BufRead *.lua setf lua")
vim.cmd("au BufnewFile,BufRead *.js setf javascript")
vim.cmd("au BufnewFile,BufRead *.jsx setf javascript")
vim.cmd("au BufnewFile,BufRead *.es6 setf javascript")
vim.cmd("au BufnewFile,BufRead *.tsx setf tsx")
vim.cmd("au BufnewFile,BufRead *.html setf html")
vim.cmd("au BufnewFile,BufRead *.ts setf typescript")
vim.cmd("au BufnewFile,BufRead *.md set filetype=markdown")
vim.cmd("au BufnewFile,BufRead *.mdx set filetype=markdown")
vim.cmd("au BufnewFile,BufRead *.flow set filetype=javascript")
vim.cmd("au BufnewFile,BufRead *.fish set filetype=fish")
vim.cmd("au BufnewFile,BufRead *.norg set filetype=norg")
--[[ vim.cmd("au BufnewFile,BufRead *.sh set filetype=bash") ]]
vim.cmd("au BufnewFile,BufRead *.zsh set filetype=bash")

vim.cmd([[
	augroup BgHighlight
		autocmd!
		autocmd WinEnter * set cul
		autocmd WinLeave * set nocul
	augroup END
]])

-- vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
-- 	callback = function()
-- 		require("scrollbar.handlers.search").handler.hide()
-- 	end,
-- })

--[[ vim.cmd([[ ]]
--[[     augroup scrollbar_search_hide ]]
--[[         autocmd! ]]
--[[         autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide() ]]
--[[     augroup END ]]
-- ]]) ]]

vim.cmd([[
	if &term =~ "screen"
  		autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  		autocmd VinLeave * silent! exe '!echo -n "\ek[`hostname`;`basename $PWD`]\e\\"'
	endif
]])

vim.cmd([[
	if has("nvim")
		set inccommand=split
	endif 
]])
vim.cmd([[
  if has("syntax")
    syntax on
  endif
]])
vim.cmd([[
    let &l:cc = join(range(getpos("'<")[2], getpos("'>")[2]),',')
  ]])
vim.cmd([[
    vnoremap <F5> <ESC>:let &l:cc = join(range(getpos("'<")[2], getpos("'>")[2]),',')<CR>
  ]])
