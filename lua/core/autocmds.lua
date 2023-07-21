-- Igone TextChangedI,TextChange events
vim.cmd([[
  " set ei=TextChangedI
  " autocmd User targets#mappings#user call targets#mappings#extend({
  " \ 'b': {},
  " \ 'B': {},
  " \ })
  ]])

local function augroup(name)
  return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
-- local format_sync_grp = vim.api.nvim_create_augroup("format_sync_grp", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		require("go.format").goimport()
-- 	end,
-- 	group = format_sync_grp,
-- })
--
-- vim.cmd("autocmd!")
-- vim.cmd("autocmd Insertleave * set nopaste")
-- vim.cmd('autocmd VimEnter * :silent exec "!kill -s SIGNWINCH $PPID"')
-- vim.cmd("autocmd FileType coffee setlocal shiftwidth=2 tabstop=2")
-- vim.cmd("autocmd FileType ruby setlocal shiftwidth=2 tabstop=2")
-- vim.cmd("autocmd FileType yaml setlocal shiftwidth=2 tabstop=2")
-- vim.cmd("autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart")
-- vim.cmd("autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear")
-- vim.cmd("au BufnewFile,BufRead term:* setf Terminal")
-- vim.cmd("au BufnewFile,BufRead *.lua setf lua")
-- vim.cmd("au BufnewFile,BufRead *.js setf javascript")
-- -- vim.cmd("au BufnewFile,BufRead *.jsx setf javascript")
-- vim.cmd("au BufnewFile,BufRead *.jsx setf javascriptreact")
-- vim.cmd("au BufnewFile,BufRead *.es6 setf javascript")
-- vim.cmd("au BufnewFile,BufRead *.rs setf rust")
-- vim.cmd("au BufnewFile,BufRead *.go setf go")
-- vim.cmd("au BufnewFile,BufRead *.html setf html")
-- vim.cmd("au BufnewFile,BufRead *.ts setf typescript")
-- vim.cmd("au BufnewFile,BufRead *.tsx setf typescriptreact")
-- vim.cmd("au BufnewFile,BufRead *.md set filetype=markdown")
-- vim.cmd("au BufnewFile,BufRead *.mdx set filetype=markdown")
-- vim.cmd("au BufnewFile,BufRead *.flow set filetype=javascript")
-- vim.cmd("au BufnewFile,BufRead *.fish set filetype=fish")
-- vim.cmd("au BufnewFile,BufRead *.norg set filetype=norg")
-- vim.cmd("au BufnewFile,BufRead *.sh set filetype=bash")
-- vim.cmd("au BufnewFile,BufRead *.zsh set filetype=bash")
