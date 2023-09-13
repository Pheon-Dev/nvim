-- function _G.custom_fold_text()
--   local line = vim.fn.getline(vim.v.foldstart)
--
--   local line_count = vim.v.foldend - vim.v.foldstart + 1
--
--   -- return "       " .. line .. "···········" .. line_count .. " lines"
--   return "  " .. line .. "      [" .. line_count .. "]"
-- end
--
-- vim.opt.foldtext = 'v:lua.custom_fold_text()'
--
vim.opt.fillchars = { eob = "-", fold = " " }
--
-- vim.opt.viewoptions:remove("options")

-- -- -- opt.exrc = true
-- opt.foldenable = true
-- opt.foldlevel = 99
-- opt.foldlevelstart = 99
-- opt.foldcolumn = "0"  -- '1', '0' is not bad
-- vim.o.foldnestmax = 3 -- '1', '0' is not bad
-- vim.o.foldmethod = "manual"

vim.cmd([[
  set nofoldenable
  set foldlevel=99
  set fillchars=fold:
  set foldtext=CustomFoldText()
  setlocal foldmethod=expr
  setlocal foldexpr=GetPotionFold(v:lnum)

  function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
      return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
      return this_indent
    elseif next_indent < this_indent
      return this_indent
    elseif next_indent > this_indent
      return '>' . next_indent
    endif
  endfunction

  function! IndentLevel(lnum)
      return indent(a:lnum) / &shiftwidth
  endfunction

  function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
  endfunction

  function! CustomFoldText()
    " get first non-blank line
    let fs = v:foldstart

    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile

    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " [" . foldSize . " lines] "
    let foldLevelStr = repeat(" ", v:foldlevel)
    let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
    return line . expansionString . foldSizeStr . foldLevelStr
  endfunction
]])
