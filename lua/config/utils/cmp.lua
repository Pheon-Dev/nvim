local M = {}

M.dependencies = {
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "lukas-reineke/cmp-under-comparator",
}

--[[ M.expand = function(fallback)
  local luasnip = require("luasnip")
  local suggestion = require("supermaven-nvim.completion_preview")

  if luasnip.expandable() then
    luasnip.expand()
  elseif suggestion.has_suggestion() then
    suggestion.on_accept_suggestion()
  else
    fallback()
  end
end ]]

M.config = function()
  -- vim.g.completeopt = "menu,menuone,noselect,noinsert"

  require("luasnip.loaders.from_vscode").lazy_load()

  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  -- local has_words_before = function()
  --   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
  -- end
  --
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")
  local compare = require("cmp.config.compare")
  local suggestion = require("supermaven-nvim.completion_preview")

  lspkind.init({
    symbol_map = {
      Supermaven = "",
    },
  })

  vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })

  local kindIcons = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "󰅱",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  }

  local source_mapping = {
    -- copilot = " pilot",
    luasnip = " ",
    supermaven = "󰚩 ",
    buffer = "󰽙",
    snippets = "",
    nvim_lsp = "󰒕",
    path = "",
    emmet = "",
    nvim_lua = " ",
    orgmode = " ",
    cmdline = " ",
    crates = " ",
    -- nvim_lsp_signature_help = " 󰏚  sign",
  }

  local function border(hl_name)
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end

  cmp.setup({
    --[[ completion = {
      autocomplete = false,
      -- completeopt = "menu,menuone,noinsert",
    }, ]]
    preselect = cmp.PreselectMode.None,
    view = {
      entries = { follow_cursor = true }, ---@diagnostic disable-line: missing-fields
    },
    performance = {
      -- all reduced, defaults: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua#L18-L25
      debounce = 30,
      throttle = 15,
      fetching_timeout = 300,
      confirm_resolve_timeout = 40,
      async_budget = 0.5,
      max_view_entries = 100,
    },
    window = {
      completion = {
        border = border("CmpBorder"),
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = border("CmpDocBorder"),
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    enabled = function()
      -- disable completion in comments
      local context = require("cmp.config.context")
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == "c" then
        return true
      else
        return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
      end
    end,
    sorting = { ---@diagnostic disable-line: missing-fields
      priority_weight = 2,
      comparators = {
        --[[ require("cmp_tabnine.compare"), ]]
        -- require("copilot_cmp.comparators").prioritize,
        -- defaults: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua#L67-L78
        -- compare functions https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
        compare.offset,
        compare.recently_used, -- higher
        compare.score,
        compare.kind, -- higher (prioritize snippets)
        compare.exact, -- lower
        compare.locality,
        compare.length,
        compare.order,
        require("cmp-under-comparator").under,
        compare.sort_text,
      },
    },
    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-e>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable,
      -- ["<C-x>"] = cmp.mapping.abort(),
      ["<C-x>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        --[[ if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif cmp.visible() then ]]
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif suggestion.has_suggestion() then
          suggestion.on_accept_suggestion()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif suggestion.has_suggestion() then
          suggestion.on_accept_suggestion()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = cmp.config.sources({
      -- { name = "copilot",                group_index = 2 },
      { name = "supermaven", group_index = 2 },
      {
        name = "nvim_lsp",
        entry_filter = function(entry, _)
          -- using cmp-buffer for this
          return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
        end,
      },
      { name = "snippets", priority = 10 },
      {
        name = "buffer",
        option = {
          -- show completions from all buffers used within the last x minutes
          get_bufnrs = function()
            local mins = 15 -- CONFIG
            local recentBufs = vim
              .iter(vim.fn.getbufinfo({ buflisted = 1 }))
              :filter(function(buf)
                return os.time() - buf.lastused < mins * 60
              end)
              :map(function(buf)
                return buf.bufnr
              end)
              :totable()
            return recentBufs
          end,
          max_indexed_line_length = 100, -- no long lines (e.g. base64-encoded things)
        },
        keyword_length = 3,
        max_item_count = 4, -- since searching all buffers results in many results
      },
      { name = "nvim_lua", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      { name = "path", group_index = 2 },
      { name = "crates", group_index = 2 },
      { name = "orgmode", group_index = 2 },
      -- { name = "nvim_lsp_signature_help" },
      { name = "cmdline", group_index = 1 },
    }, {
      { name = "buffer", keyword_length = 3 },
    }),
    formatting = {
      fields = { "abbr", "menu", "kind" }, -- order of the fields
      format = function(entry, vim_item)
        local maxLength = 40
        lspkind.cmp_format({
          with_text = true,
          maxwidth = 50,
          -- mode = "symbol",
          -- symbol_map = { Supermaven = "" },
        })
        if #vim_item.abbr > maxLength then
          vim_item.abbr = (vim_item.abbr or ""):sub(1, maxLength) .. "…"
        end
        -- distinguish emmet snippets
        local isEmmet = entry.source.name == "nvim_lsp"
          and vim_item.kind == "Snippet"
          and vim.bo[entry.context.bufnr].filetype == "css"
        if isEmmet then
          entry.source.name = "emmet"
        end

        vim_item.kind = entry.source.name == "nvim_lsp" and kindIcons[vim_item.kind] or ""
        vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
        vim_item.menu = source_mapping[entry.source.name]
        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        return vim_item
      end,
    },
    experimental = {
      ghost_text = false,
    },
  })

  -----------------------------------------------------------------------------

  -- LUA: disable annoying `--#region` suggestions
  cmp.setup.filetype("lua", {
    enabled = function()
      local line = vim.api.nvim_get_current_line()
      local doubleDashLine = line:find("%s%-%-?$") or line:find("^%-%-?$")
      return not doubleDashLine
    end,
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
    }),
    enabled = function()
      -- Set of commands where cmp will be disabled
      local disabled = {
        IncRename = true,
      }
      -- Get first word of cmdline
      local cmd = vim.fn.getcmdline():match("%S+")
      -- Return true if cmd isn't disabled
      -- else call/return cmp.close(), which returns false
      return not disabled[cmd] or cmp.close()
    end,
  })

  -- `/`, `?` cmdline setup.
  cmp.setup.cmdline({ "?", "/" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer", max_item_count = 3, keyword_length = 2 },
    },
  })
  require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })

  cmp.event:on("menu_closed", function()
    vim.b.copilot_suggestion_hidden = false
  end)
end

return M
