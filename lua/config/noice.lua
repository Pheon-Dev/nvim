require("noice").setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {}, -- global options for the cmdline. See section on views
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      cmdline = { pattern = "^:", icon = " ❯", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "炙?" },
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
    enabled = true, -- enables the Noice popupmenu UI
    backend = "nui", -- backend to use to show regular cmdline completions
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
    kind_icons = {}, -- set to `false` to disable icons
  },
  -- You can add any custom commands below that will be available with `:Noice command`
  commands = {
    history = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
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
      opts = { enter = true, format = "details" },
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
      view = nil, -- when nil, use defaults from documentation
      opts = {}, -- merged with defaults from documentation
    },
    signature = {
      enabled = true,
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
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
  },
  presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  views = {
    cmdline_popup = {
      --[[ position = { ]]
      --[[   row = 5, ]]
      --[[   col = "50%", ]]
      --[[ }, ]]
      size = {
        width = 60,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  routes = {
    --[[ { filter = { event = "msg_show", kind = "", find = "written", }, opts = { skip = true }, }, ]]
    {
      filter = { event = "msg_show", kind = "error", find = "vim/meta.lua:0: Expected lua string" },
      opts = { skip = true },
    },
    { filter = { event = "msg_show", kind = "", find = "<" }, opts = { skip = true } },
    { filter = { event = "msg_show", kind = "", find = "plugins/" }, opts = { skip = true } },
  },
  status = {}, --- @see section on statusline components
  format = {}, --- @see section on formatting
})

--[[ Default keymaps ]]
--[[ mode 	key 	function ]]
--[[ n 	gr 	async references, definitions and context ]]
--[[ n 	<Leader>gr 	show reference and context ]]
--[[ i 	<m-k> 	signature help ]]
--[[ n 	<c-k> 	signature help ]]
--[[ n 	gW 	workspace symbol ]]
--[[ n 	gD 	declaration ]]
--[[ n 	gd 	definition ]]
--[[ n 	g0 	document symbol ]]
--[[ n 	<C-]> 	go to definition (if multiple show listview) ]]
--[[ n 	gp 	definition preview (show Preview) ]]
--[[ n 	<C-LeftMouse> 	definition ]]
--[[ n 	g<LeftMouse> 	implementation ]]
--[[ n 	<Leader>gt 	treesitter document symbol ]]
--[[ n 	<Leader>gT 	treesitter symbol for all open buffers ]]
--[[ n 	<Leader> ct 	ctags symbol search ]]
--[[ n 	<Leader> cg 	ctags symbol generate ]]
--[[ n 	K 	hover doc ]]
--[[ n 	<Space>ca 	code action (when you see cricket_game ) ]]
--[[ n 	<Space>la 	code lens action (when you see a codelens indicator) ]]
--[[ v 	<Space>ca 	range code action (when you see cricket_game ) ]]
--[[ n 	<Space>rn 	rename with floating window ]]
--[[ n 	<Leader>re 	rename (lsp default) ]]
--[[ n 	<Leader>gi 	hierarchy incoming calls ]]
--[[ n 	<Leader>go 	hierarchy outgoing calls ]]
--[[ n 	gi 	implementation ]]
--[[ n 	<Space> D 	type definition ]]
--[[ n 	gL 	show line diagnostic ]]
--[[ n 	gG 	show diagnostic for all buffers ]]
--[[ n 	]d 	next diagnostic ]]
--[[ n 	[d 	previous diagnostic ]]
--[[ n 	<Leader> dt 	diagnostic toggle(enable/disable) ]]
--[[ n 	]r 	next treesitter reference/usage ]]
--[[ n 	[r 	previous treesitter reference/usage ]]
--[[ n 	<Space> wa 	add workspace folder ]]
--[[ n 	<Space> wr 	remove workspace folder ]]
--[[ n 	<Space> wl 	print workspace folder ]]
--[[ n 	<Leader>k 	toggle reference highlight ]]
--[[ i/n 	<C-p> 	previous item in list ]]
--[[ i/n 	<C-n> 	next item in list ]]
--[[ i/n 	number 1~9 	move to ith row/item in the list ]]
--[[ i/n 	<Up> 	previous item in list ]]
--[[ i/n 	<Down> 	next item in list ]]
--[[ n 	<Ctrl-w>j 	move cursor to preview (windows move to bottom view point) ]]
--[[ n 	<Ctrl-w>k 	move cursor to list (windows move to up view point) ]]
--[[ i/n 	<C-o> 	open preview file in nvim/Apply action ]]
--[[ n 	<C-v> 	open preview file in nvim with vsplit ]]
--[[ n 	<C-s> 	open preview file in nvim with split ]]
--[[ n 	<Enter> 	open preview file in nvim/Apply action ]]
--[[ n 	<ESC> 	close listview of floating window ]]
--[[ i/n 	<C-e> 	close listview of floating window ]]
--[[ n 	<C-q> 	close listview and send results to quickfix ]]
--[[ i/n 	<C-b> 	previous page in listview ]]
--[[ i/n 	<C-f> 	next page in listview ]]
--[[ i/n 	<C-s> 	save the modification to preview window to file ]]
