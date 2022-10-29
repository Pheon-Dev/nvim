vim.g.completeopt = "menu,menuone,noselect,noinsert"
local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local compare = require("cmp.config.compare")

local source_mapping = {
  buffer = " buffer",
  nvim_lsp = " lsp",
  nvim_lua = " lua",
  vsnip = "✀ snip",
  path = " path",
  luasnip = " snip",
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
  window = {
    completion = {
      border = border("CmpBorder"),
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = border("CmpDocBorder"),
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        --[[ elseif luasnip.expand_or_locally_jumpable() then ]]
        --[[   luasnip.expand_or_jump() ]]
        --[[ elseif vim.fn["vsnip#available"]() == 1 then ]]
        --[[   feedkey("<Plug>(vsnip-expand-or-jump)", "") ]]
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
        --[[ elseif vim.fn["vsnip#jumpable"](-1) == 1 then ]]
        --[[   feedkey("<Plug>(vsnip-jump-prev)", "") ]]
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    --[[ { name = "nvim_lsp_signature_help" }, ]]
    { name = "luasnip" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
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
    ghost_text = true,
  },
})

cmp.setup.cmdline("lua", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    --[[ { name = "nvim_lsp_signature_help" }, ]]
    { name = "buffer" },
    { name = "luasnip" },
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
  },
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    --[[ { name = "nvim_lsp_signature_help" }, ]]
    { name = "buffer" },
    { name = "luasnip" },
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
  },
})

cmp.setup.cmdline("?", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    --[[ { name = "nvim_lsp_signature_help" }, ]]
    { name = "buffer" },
    { name = "luasnip" },
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
  },
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    --[[ { name = "nvim_lsp_signature_help" }, ]]
    { name = "buffer" },
    { name = "luasnip" },
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    --[[ { name = "nvim_lsp_signature_help" }, ]]
    { name = "path" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  }),
})
