vim.o.suffixesadd = '.js,.es,.jsx,.json,.css,.less,.sass,.styl,.lua,.php,.md,.py,.html,.tsx,.rs,.c,.cpp'
vim.cmd('let g:prettier#autoformat=1')
vim.cmd('autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.lua,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync')
vim.cmd('let g:prettier#quickfix_enabled=0')
vim.cmd('let g:prettier#config#single_quote = "true"')
vim.cmd('let g:prettier#config#trailing_comma = "all"')
