vim.cmd([[
	let g:coc_global_extensions = [
	\ "coc-tsserver"
	\ ]
]])

vim.cmd([[
	function! ShowDocIfNoDiagnostic(timer_id)
		if (coc#float#has_float() == 0 && CocHasProvider("hover") == 1)
			silent call CocActionAsync("doHover")
		endif
	endfunction
]])

vim.cmd([[
	function! s:show_hover_doc()
  		call timer_start(500, 'ShowDocIfNoDiagnostic')
	endfunction
]])

-- vim.cmd('autocmd CursorHoldI * :call <SID>show_hover_doc()')
-- vim.cmd('autocmd CursorHold * :call <SID>show_hover_doc()')

vim.cmd([[
	if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  		let g:coc_global_extensions += ['coc-prettier']
	endif
]])

vim.cmd([[
	if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  		let g:coc_global_extensions += ['coc-eslint']
	endif
]])

vim.cmd('inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"')
