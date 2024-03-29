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

  local source_mapping = {
    -- copilot = " pilot",
    luasnip = "   snip",
    nvim_lsp = " 󰯓  lsp",
    buffer = " 󰓩  buf",
    nvim_lua = "   lua",
    orgmode = "   org",
    cmdline = "  cmd",
    crates = "   cr8",
    -- nvim_lsp_signature_help = " 󰏚  sign",
    path = " 󰙅  path",
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
    preselect = cmp.PreselectMode.None,
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
    sorting = {
      priority_weight = 2,
      comparators = {
        --[[ require("cmp_tabnine.compare"), ]]
        -- require("copilot_cmp.comparators").prioritize,
        compare.offset,
        compare.exact,
        compare.score,
        require("cmp-under-comparator").under,
        compare.recently_used,
        compare.kind,
        compare.locality,
        compare.sort_text,
        compare.length,
        compare.order,
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
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = cmp.config.sources({
      -- { name = "copilot",                group_index = 2 },
      { name = "nvim_lsp", group_index = 2 },
      { name = "buffer", group_index = 2 },
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
      format = function(entry, vim_item)
        lspkind.cmp_format({ with_text = true, maxwidth = 50 })
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
    -- completion = { completeopt = "menu,menuone,noinsert" },
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
      { name = "buffer" },
    },
  })
  require("luasnip").config.set_config({ history = true, updateevents = "TextChanged,TextChangedI" })

  cmp.event:on("menu_closed", function()
    vim.b.copilot_suggestion_hidden = false
  end)
end

return M
