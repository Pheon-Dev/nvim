local u = require("config.util")

local M = {}

M.dependencies = {
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
}

---@param bufnr number
local function highlightsInStacktrace(bufnr)
  vim.defer_fn(function()
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    vim.api.nvim_buf_call(bufnr, function()
      vim.fn.matchadd("WarningMsg", [[[^/]\+\.lua:\d\+\ze:]]) -- files with error
      vim.fn.matchadd("WarningMsg", [[E\d\+]]) -- vim error codes
    end)
  end, 1)
end

M.init = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "noice",
    callback = function(ctx)
      highlightsInStacktrace(ctx.buf)
      -- do not let noice override my versions of the mappings
      vim.defer_fn(function()
        pcall(vim.keymap.del, "n", "K", { buffer = ctx.buf })
        pcall(vim.keymap.del, "n", "gx", { buffer = ctx.buf })
      end, 1)
    end,
  })
  u.colorschemeMod("NoiceCmdline", { link = "NormalFloat" })
end

M.keys = {
  {
    "<Esc>",
    function()
      vim.snippet.stop()
      vim.cmd.NoiceDismiss()
    end,
    desc = "󰎟 Clear Notifications & Snippet",
  },
  { "<A-0>", vim.cmd.NoiceHistory, mode = { "n", "x", "i" }, desc = "󰎟 Noice Log" },
  { "<A-9>", vim.cmd.NoiceLast, mode = { "n", "x", "i" }, desc = "󰎟 Noice Last" },
}

M.config = function()
  require("noice").setup({
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom 'cmdline_popup'
      opts = {}, -- global options for the cmdline. See section on views
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        -- title: set to anything or empty string to hide
        cmdline = { pattern = "^:", icon = "command ❯", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = "search down ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = "search up ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "shell ", lang = "bash" },
        lua = { pattern = "^:%s*lua%s+", icon = "lua ", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "search " },
        input = {}, -- Used by input()
        -- lua = false, -- to disable a format, set to `false`
      },
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = true, -- enables the Noice messages UI
      view = "notify", -- default view for messages
      view_error = "notify", -- view for errors
      view_warn = "notify", -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    popupmenu = {
      enabled = false, -- enables the Noice popupmenu UI
      backend = "nui", -- backend to use to show regular cmdline completions `nui|cmp`
      -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
      kind_icons = {}, -- set to `false` to disable icons
    },
    redirect = {
      view = "popup",
      filter = {
        event = "msg_show",
      },
    },
    -- You can add any custom commands below that will be available with `:Noice command`
    commands = {
      history = {
        filter_opts = { reverse = true }, -- show newest entries first
        -- https://github.com/folke/noice.nvim#-formatting
        opts = { format = { "{title} ", "{cmdline} ", "{message}" } },
        -- opts = { enter = true, format = "details" },
        view = "split",
        filter = {
          any = {
            { event = "notify" },
            { error = true },
            { warning = true },
            { event = "msg_show", kind = { "" } },
            { event = "lsp", kind = "message" },
          },
        },
      },
      -- :Noice last
      last = {
        view = "popup",
        opts = { format = { "{title} ", "{cmdline} ", "{message}" } },
        -- opts = { enter = true, format = "details" },
        filter = {
          any = {
            { event = "notify" },
            { error = true },
            { warning = true },
            { event = "msg_show", kind = { "" } },
            { event = "lsp", kind = "message" },
          },
        },
        filter_opts = { count = 1 },
      },
      -- :Noice errors
      errors = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = { error = true },
        filter_opts = { reverse = true },
      },
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = true,
      view = "notify",
    },
    lsp = {
      progress = {
        enabled = true,
        -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
        -- See the section on formatting for more details on how to customize.
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30, -- frequency to update lsp progress message
        view = "mini",
      },
      override = {
        -- override the default lsp markdown formatter with Noice
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        -- override the lsp markdown formatter with Noice
        ["vim.lsp.util.stylize_markdown"] = true,
        -- override cmp documentation with Noice (needs the other options to work)
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = false,
        border = { style = vim.g.borderStyle },
        size = { max_width = 80 },
        win_options = { scrolloff = 4, wrap = true },
        view = nil, -- when nil, use defaults from documentation
        opts = {}, -- merged with defaults from documentation
      },
      signature = {
        enabled = false,
        auto_open = {
          enabled = true,
          trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
          throttle = 50, -- Debounce lsp signature help request by 50ms
        },
        view = nil, -- when nil, use defaults from documentation
        opts = {}, -- merged with defaults from documentation
      },
      message = {
        -- Messages shown by lsp servers
        enabled = true,
        view = "notify",
        opts = {},
      },
      -- defaults for hover and signature help
      documentation = {
        view = "hover",
        opts = {
          lang = "markdown",
          replace = true,
          render = "plain",
          format = { "{message}" },
          win_options = { concealcursor = "n", conceallevel = 3 },
        },
      },
    },
    markdown = {
      hover = {
        ["|(%S-)|"] = vim.cmd.help, -- vim help links
        ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
      },
      highlights = {
        ["|%S-|"] = "@text.reference",
        ["@%S+"] = "@parameter",
        ["^%s*(Parameters:)"] = "@text.title",
        ["^%s*(Return:)"] = "@text.title",
        ["^%s*(See also:)"] = "@text.title",
        ["{%S-}"] = "@parameter",
      },
    },
    health = {
      checker = true, -- Disable if you don't want health checks to run
    },
    smart_move = {
      -- noice tries to move out of the way of existing floating windows.
      enabled = true, -- you can disable this behaviour here
      -- add any filetypes here, that shouldn't trigger smart move.
      excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "muren", "floaterm", "harpoon", "NvimTree" },
    },
    presets = {
      -- you can enable a preset by setting it to true, or a table that will override the preset config
      -- you can also add custom presets that you can enable/disable with enabled=true
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
    views = {
      cmdline_popup = {
        -- view = "popupmenu",
        -- zindex = 200,
        border = { style = vim.g.borderStyle },
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      mini = {
        backend = "mini",
        relative = "editor",
        align = "message-right",
        timeout = 2000,
        reverse = true,
        focusable = false,
        position = {
          row = -1,
          col = "100%",
          -- col = 0,
        },
        size = "auto",
        border = {
          style = "none",
        },
        -- zindex = 60,
        -- timeout = 3000,
        zindex = 4, -- lower, so it does not cover nvim-notify (zindex 50)
        -- position = { col = -3 }, -- to the left to avoid collision with scrollbar
        format = { "{title} ", "{message}" }, -- leave out "{level}"
        win_options = {
          winblend = 30,
          winhighlight = {
            Normal = "NoiceMini",
            IncSearch = "",
            CurSearch = "",
            Search = "",
          },
        },
      },
      popup = {
        border = { style = vim.g.borderStyle },
        size = { width = 90, height = 25 },
        win_options = { scrolloff = 8, wrap = true, concealcursor = "nv" },
        close = { keys = { "q", "<D-w>", "<D-9>", "<D-0>" } },
      },
      popupmenu = {
        enabled = true,
        backend = "nui", -- nui/cmp
        kind_icons = {},
        relative = "editor",
        -- zindex = 65,
        -- position = "auto",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60, -- "auto"
          height = 10, -- "auto"
          max_height = 20,
          -- min_width = 10,
        },
        border = {
          style = "rounded",
          -- padding = { -1, 1 },
        },
        win_options = {
          winbar = "",
          foldenable = false,
          cursorline = true,
          cursorlineopt = "line",
          winhighlight = {
            Normal = "NoicePopupmenu", -- change to NormalFloat to make it look like other floats
            FloatBorder = "NoicePopupmenuBorder", -- border highlight
            CursorLine = "NoicePopupmenuSelected", -- used for highlighting the selected item
            PmenuMatch = "NoicePopupmenuMatch", -- used to highlight the part of the item that matches the input
          },
        },
      },
      virtualtext = {
        backend = "virtualtext",
        format = { "{message}" },
        hl_group = "NoiceVirtualText",
      },
      notify = {
        backend = "notify",
        fallback = "mini",
        format = "notify",
        replace = false,
        merge = false,
      },
      split = {
        backend = "split",
        enter = false,
        relative = "editor",
        position = "bottom",
        size = "20%",
        close = {
          keys = { "q", "<A-w>", "<A-9>", "<A-0>" },
        },
        win_options = {
          winhighlight = { Normal = "NoiceSplit", FloatBorder = "NoiceSplitBorder" },
          wrap = true,
          scrolloff = 6,
        },
      },
      cmdline_output = {
        format = "details",
        view = "split",
      },
      messages = {
        --[[ view = "split",
        enter = true, ]]
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
      },
      vsplit = {
        view = "split",
        position = "right",
      },
    },
    routes = {
      -- { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true }, },
      {
        view = "popup",
        filter = {
          event = "msg_show",
          -- kind = { "Notifications", "history" },
          kind = "history",
          min_height = 20,
        },
      },
      -- { filter = { event = "msg_show", kind = "", find = "plugins/" },  opts = { skip = true } },
      { filter = { find = "UndefinedParserError" }, opts = { skip = true } },
      { filter = { warning = true, find = "node" }, opts = { skip = true } },
      -- REDIRECT TO POPUP
      {
        filter = {
          min_height = 10,
          ["not"] = {
            cond = function(msg)
              local title = (msg.opts and msg.opts.title) or ""
              return title:find("Commit Preview") or title:find("tinygit") or title:find("Changed Files")
            end,
          },
        },
        view = "popup",
      },
      -- output from `:Inspect`
      { filter = { event = "msg_show", find = "Treesitter.*- @" }, view = "popup" },

      -----------------------------------------------------------------------------
      -- REDIRECT TO MINI

      -- write/deletion messages
      { filter = { event = "msg_show", find = "%d+B written$" }, view = "mini" },
      { filter = { event = "msg_show", find = "%d+L, %d+B$" }, view = "mini" },
      { filter = { event = "msg_show", find = "%-%-No lines in buffer%-%-" }, view = "mini" },

      -- search pattern not found
      { filter = { event = "msg_show", find = "^E486: Pattern not found" }, view = "mini" },

      -- Word added to spellfile via `zg`
      { filter = { event = "msg_show", find = "^Word .*%.add$" }, view = "mini" },

      { -- Mason
        filter = {
          event = "notify",
          cond = function(msg)
            return msg.opts and (msg.opts.title or ""):find("mason")
          end,
        },
        view = "mini",
      },

      -- nvim-treesitter
      { filter = { event = "msg_show", find = "^%[nvim%-treesitter%]" }, view = "mini" },
      { filter = { event = "notify", find = "All parsers are up%-to%-date" }, view = "mini" },

      -----------------------------------------------------------------------------
      -- SKIP

      -- FIX LSP bugs?
      { filter = { event = "msg_show", find = "lsp_signature? handler RPC" }, skip = true },
      {
        filter = { event = "msg_show", find = "^%s*at process.processTicksAndRejections" },
        skip = true,
      },

      -- code actions
      { filter = { event = "notify", find = "No code actions available" }, skip = true },

      -- unneeded info on search patterns
      { filter = { event = "msg_show", find = "^[/?]." }, skip = true },

      -- E211 no longer needed, since auto-closing deleted buffers
      { filter = { event = "msg_show", find = "E211: File .* no longer available" }, skip = true },
    },
    status = {}, --- @see section on statusline components
    format = {
      ---@type table<string, NoiceFormat>
      builtin = {
        default = { "{level} ", "{title} ", "{message}" },
        notify = { "{message}" },
        details = {
          "{level} ",
          "{date} ",
          "{event}",
          { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } },
          " ",
          "{title} ",
          "{cmdline} ",
          "{message}",
        },
        telescope = {
          "{level} ",
          "{date} ",
          "{title} ",
          "{message}",
        },
        telescope_preview = {
          "{level} ",
          "{date} ",
          "{event}",
          { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } },
          "\n",
          "{title}\n",
          "\n",
          "{message}",
        },
        lsp_progress = {
          {
            "{progress} ",
            key = "progress.percentage",
            contents = {
              { "{data.progress.message} " },
            },
          },
          "({data.progress.percentage}%) ",
          { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
        lsp_progress_done = {
          { "✔ ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
      },

      ---@class NoiceFormatOptions
      defaults = {
        ---@class NoiceFormatOptions.debug
        debug = {
          enabled = true,
        },
        ---@class NoiceFormatOptions.cmdline
        cmdline = {},
        ---@class NoiceFormatOptions.level
        level = {
          hl_group = {
            trace = "NoiceFormatLevelTrace",
            debug = "NoiceFormatLevelDebug",
            info = "NoiceFormatLevelInfo",
            warn = "NoiceFormatLevelWarn",
            error = "NoiceFormatLevelError",
            off = "NoiceFormatLevelOff",
          },
          icons = { error = " ", warn = " ", info = " " },
        },
        ---@class NoiceFormatOptions.progress
        progress = {
          ---@type NoiceFormat
          contents = {},
          width = 20,
          align = "right",
          key = "progress", -- key in message.opts For example: "progress.percentage"
          hl_group = "NoiceFormatProgressTodo",
          hl_group_done = "NoiceFormatProgressDone",
        },
        ---@class NoiceFormatOptions.text
        text = {
          text = nil,
          hl_group = nil,
        },
        ---@class NoiceFormatOptions.spinner
        spinner = {
          ---@type Spinner
          name = "dots",
          hl_group = nil,
        },
        ---@class NoiceFormatOptions.data
        data = {
          key = nil, -- Key in the message.opts object.
          hl_group = nil, -- Optional hl_group
        },
        ---@class NoiceFormatOptions.title
        title = {
          hl_group = "NoiceFormatTitle",
        },
        ---@class NoiceFormatOptions.event
        event = {
          hl_group = "NoiceFormatEvent",
        },
        ---@class NoiceFormatOptions.kind
        kind = {
          hl_group = "NoiceFormatKind",
        },
        ---@class NoiceFormatOptions.date
        date = {
          format = "%X", --- @see https://www.lua.org/pil/22.1.html
          hl_group = "NoiceFormatDate",
        },
        ---@class NoiceFormatOptions.message
        message = {
          hl_group = nil, -- if set, then the hl_group will be used instead of the message highlights
        },
        ---@class NoiceFormatOptions.confirm
        confirm = {
          hl_group = {
            choice = "NoiceFormatConfirm",
            default_choice = "NoiceFormatConfirmDefault",
          },
        },
      },
    },
  })
  local theme = require("core.colors")

  vim.api.nvim_set_hl(0, "NoiceConfirm", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = theme.color2, bg = theme.color0 })

  -- vim.api.nvim_set_hl(0, "NoiceMini", { bg = theme.color3 })
  vim.api.nvim_set_hl(0, "NoicePopup", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = theme.color2, bg = theme.color0 })

  vim.api.nvim_set_hl(0, "NoiceCmdline", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = theme.color2, bg = theme.color0 })
end

return M
