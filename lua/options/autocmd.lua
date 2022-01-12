vim.cmd('autocmd!')
vim.cmd('autocmd Insertleave * set nopaste')
vim.cmd('autocmd VimEnter * :silent exec "!kill -s SIGNWINCH $PPID"')

vim.cmd('autocmd FileType coffee setlocal shiftwidth=2 tabstop=2')
vim.cmd('autocmd FileType ruby setlocal shiftwidth=2 tabstop=2')
vim.cmd('autocmd FileType yaml setlocal shiftwidth=2 tabstop=2')

vim.cmd('autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart')
vim.cmd('autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear')

vim.cmd([[
	augroup BgHighlight
		autocmd!
		autocmd WinEnter * set cul
		autocmd WinLeave * set nocul
	augroup END
]])

vim.cmd([[
	if &term =~ "screen"
  		autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  		autocmd VinLeave * silent! exe '!echo -n "\ek[`hostname`;`basenane $PWD`]\e\\"'
	endif
]])

