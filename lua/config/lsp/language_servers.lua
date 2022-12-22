local lsp = require("lspconfig")
local coq = require("coq")
local capability = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require("lspconfig.util")

local navic = require("nvim-navic")

capability.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --[[ local bufopts = { noremap = true, silent = true, buffer = bufnr } ]]
  --[[ vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) ]]
  --[[ vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) ]]
  --[[ vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) ]]
  --[[ vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) ]]
  --[[ vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) ]]
  --[[ vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts) ]]
  --[[ vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts) ]]
  --[[ vim.keymap.set('n', '<space>wl', function() ]]
  --[[   print(vim.inspect(vim.lsp.buf.list_workspace_folders())) ]]
  --[[ end, bufopts) ]]
  --[[ vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts) ]]
  --[[ vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts) ]]
  --[[ vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts) ]]
  --[[ vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) ]]
  --[[ vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) ]]
  --[[ end ]]
  --[[ local on_attach = function(client, bufnr) ]]
  --[[ require("lsp_signature").on_attach() ]]
  -- Noice overriden
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

navic.setup({
  icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "練",
    Interface = "練",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = "◩ ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  },
  highlight = false,
  separator = " » ",
  depth_limit = 0,
  depth_limit_indicator = "..",
})

lsp.gopls.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  capabilities = capability,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  single_file_support = true,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}))

lsp["sumneko_lua"].setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  capabilities = capability,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}))

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local lsp_flags = {
  debounce_text_changes = 150,
}

lsp["remark_ls"].setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = lsp_flags,
}))

lsp["pyright"].setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = lsp_flags,
}))

lsp["rust_analyzer"].setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {},
  },
}))

require("typescript").setup(coq.lsp_ensure_capabilities({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = true, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    capabilities = capability,
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = util.root_pattern(".git"),
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}))
