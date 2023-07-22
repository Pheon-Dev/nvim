return {
  {
    "onsails/diaglist.nvim",
    event = { "BufNewFile", "BufReadPost" },
    enabled = true,
    config = function()
      require("diaglist").init({
        -- optional settings
        -- below are defaults
        debug = false,

        -- increase for noisy servers
        debounce_ms = 150,
      })
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    enabled = true,
    event = { "BufNewFile", "BufReadPost" },
    config = function()
      local fn = vim.fn

      function _G.qftf(info)
        local items
        local ret = {}
        -- The name of item in list is based on the directory of quickfix window.
        -- Change the directory for quickfix window make the name of item shorter.
        -- It's a good opportunity to change current directory in quickfixtextfunc :)
        --
        -- local alterBufnr = fn.bufname('#') -- alternative buffer is the buffer before enter qf window
        -- local root = getRootByAlterBufnr(alterBufnr)
        -- vim.cmd(('noa lcd %s'):format(fn.fnameescape(root)))
        --
        if info.quickfix == 1 then
          items = fn.getqflist({ id = info.id, items = 0 }).items
        else
          items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
        end
        local limit = 31
        local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
        local validFmt = '%s │%5d:%-3d│%s %s'
        for i = info.start_idx, info.end_idx do
          local e = items[i]
          local fname = ''
          local str
          if e.valid == 1 then
            if e.bufnr > 0 then
              fname = fn.bufname(e.bufnr)
              if fname == '' then
                fname = '[No Name]'
              else
                fname = fname:gsub('^' .. vim.env.HOME, '~')
              end
              -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
              if #fname <= limit then
                fname = fnameFmt1:format(fname)
              else
                fname = fnameFmt2:format(fname:sub(1 - limit))
              end
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
            str = validFmt:format(fname, lnum, col, qtype, e.text)
          else
            str = e.text
          end
          table.insert(ret, str)
        end
        return ret
      end

      vim.o.qftf = '{info -> v:lua._G.qftf(info)}'

      require('bqf').setup({
        auto_enable = true,
        auto_resize_height = true, -- highly recommended enable
        preview = {
          win_height = 16,
          win_vheight = 12,
          delay_syntax = 80,
          border = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' },
          show_title = true,
          should_preview_cb = function(bufnr, qwinid)
            local ret = true
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 100 * 1024 then
              -- skip file size greater than 100k
              ret = false
            elseif bufname:match('^fugitive://') then
              -- skip fugitive buffer
              ret = false
            end
            return ret
          end
        },
        -- make `drop` and `tab drop` to become preferred
        func_map = {
          drop = 'l',
          openc = 'o',
          split = 'b',
          vsplit = 'v',
          tabdrop = 't',
          prevfile = 'p',
          nextfile = 'n',
          pscrollup = "<C-b>",
          pscrolldown = "<C-f>",
          -- tabc = '',
          ptogglemode = 'F',
          fzffilter = 'f',
        },
        filter = {
          fzf = {
            action_for = { ['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop' },
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--bind', 'ctrl-j:down', '--bind', 'ctrl-k:up' }
          }
        }
      })
    end,
  },
}
