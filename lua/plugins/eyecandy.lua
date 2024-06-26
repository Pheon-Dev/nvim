local enable = require("config").enable

local dressing = require("config.eyecandy.dressing")
local noice = require("config.eyecandy.noicey")
local notify = require("config.eyecandy.notify")
local hlargs = require("config.eyecandy.hlargs")
local windows = require("config.eyecandy.windows")
local context = require("config.eyecandy.context")

local default_event = require("config.event").default

local M = {
  {
    "stevearc/dressing.nvim",
    enabled = enable.dressing,
    init = dressing.init,
    config = dressing.config,
  },
  {
    "rcarriga/nvim-notify",
    enabled = enable.notify,
    event = default_event,
    config = notify.config,
  },
  {
    "folke/noice.nvim",
    event = default_event,
    -- event = lazy_event,
    enabled = enable.noice,
    dependencies = noice.dependencies,
    config = noice.config,
  },
  {
    "m-demare/hlargs.nvim",
    enabled = enable.hlargs,
    event = default_event,
    dependencies = hlargs.dependencies,
    config = hlargs.config,
  },
  {
    "anuvyklack/windows.nvim",
    enabled = enable.windows,
    event = default_event,
    dependencies = windows.dependencies,
    config = windows.config,
  },
  {
    "andersevenrud/nvim_context_vt",
    enabled = enable.context,
    event = default_event,
    config = context.config,
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      local SymbolKind = vim.lsp.protocol.SymbolKind

      ---@type UserOpts
      require("symbol-usage").setup({
        ---@type table<string, any> `nvim_set_hl`-like options for highlight virtual text
        hl = { link = "Comment" },
        ---@type lsp.SymbolKind[] Symbol kinds what need to be count (see `lsp.SymbolKind`)
        kinds = { SymbolKind.Function, SymbolKind.Method },
        ---Additional filter for kinds. Recommended use in the filetypes override table.
        ---fiterKind: function(data: { symbol:table, parent:table, bufnr:integer }): boolean
        ---`symbol` and `parent` is an item from `textDocument/documentSymbol` request
        ---See: #filter-kinds
        ---@type table<lsp.SymbolKind, filterKind[]>
        kinds_filter = {},
        ---@type 'above'|'end_of_line'|'textwidth'|'signcolumn' `above` by default
        vt_position = "end_of_line",
        vt_priority = nil, ---@type integer Virtual text priority (see `nvim_buf_set_extmark`)
        ---Text to display when request is pending. If `false`, extmark will not be
        ---created until the request is finished. Recommended to use with `above`
        ---vt_position to avoid "jumping lines".
        ---@type string|table|false
        request_pending_text = "loading...",
        ---The function can return a string to which the highlighting group from `opts.hl` is applied.
        ---Alternatively, it can return a table of tuples of the form `{ { text, hl_group }, ... }`` - in this case the specified groups will be applied.
        ---If `vt_position` is 'signcolumn', then only a 1-2 length string or a `{{ icon, hl_group }}` table is expected.
        ---See `#format-text-examples`
        ---@type function(symbol: Symbol): string|table Symbol{ definition = integer|nil, implementation = integer|nil, references = integer|nil }
        -- text_format = function(symbol) end,
        references = { enabled = true, include_declaration = false },
        definition = { enabled = false },
        implementation = { enabled = false },
        ---@type { lsp?: string[], filetypes?: string[], cond?: function[] } Disables `symbol-usage.nvim' for specific LSPs, filetypes, or on custom conditions.
        ---The function in the `cond` list takes an argument `bufnr` and returns a boolean. If it returns true, `symbol-usage` will not run in that buffer.
        disable = { lsp = {}, filetypes = {}, cond = {} },
        ---@type UserOpts[] See default overridings in `lua/symbol-usage/langs.lua`
        -- filetypes = {},
        ---@type 'start'|'end' At which position of `symbol.selectionRange` the request to the lsp server should start. Default is `end` (try changing it to `start` if the symbol counting is not correct).
        symbol_request_pos = "end", -- Recommended redefine only in `filetypes` override table
      })
    end,
  },
}

return M
