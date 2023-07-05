local M = {}

function M.lsp_config(plugin)
  local capabilities =
      require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_attach = require("util").on_attach(function(client, buffer)
    require("plugins.lsp.format").on_attach(client, buffer)
    require("plugins.lsp.keymaps").on_attach(client, buffer)
  end)
  local lsp_flags = {
    debounce_text_changes = 150,
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  ---@type lspconfig.options
  local servers = plugin.servers or require("plugins.lsp.servers")
  -- local coq = require("coq")
  for server, opts in pairs(servers) do
    local hl_name = "FloatBorder"
    local border = {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }

    -- LSP settings (for overriding per client)
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    opts.handlers = handlers
    opts.capabilities = capabilities
    opts.on_attach = on_attach
    opts.flags = lsp_flags
    require("lspconfig")[server].setup(opts)
  end
  -- setup formatting and keymaps
  require("util").on_attach(function(client, buffer)
    require("plugins.lsp.format").on_attach(client, buffer)
    require("plugins.lsp.keymaps").on_attach(client, buffer)
  end)

  local nvim_lsp = require('lspconfig')
  local util = require("lspconfig.util")

  -- GoLang
  nvim_lsp['gopls'].setup {
    cmd = { 'gopls' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
    }
  }
  capabilities.offsetEncoding = { "utf-16" }
  require("lspconfig").clangd.setup({ capabilities = capabilities })

  -- require("typescript").setup({
  --   disable_commands = false,     -- prevent the plugin from creating Vim commands
  --   debug = true,                 -- enable debug logging for commands
  --   go_to_source_definition = {
  --     fallback = true,            -- fall back to standard LSP definition on failure
  --   },
  --   server = {
  --     -- pass options to lspconfig's setup method
  --     capabilities = capabilities,
  --     on_attach = on_attach,
  --     flags = lsp_flags,
  --     root_dir = util.root_pattern(".git"),
  --     cmd = { "typescript-language-server", "--stdio" },
  --     filetypes = {
  --       "javascript",
  --       "javascriptreact",
  --       "javascript.jsx",
  --       "typescript",
  --       "typescriptreact",
  --       "typescript.tsx",
  --     },
  --     settings = {
  --       typescript = {
  --         inlayHints = {
  --           includeInlayParameterNameHints = "all",
  --           includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --           includeInlayFunctionParameterTypeHints = true,
  --           includeInlayVariableTypeHints = true,
  --           includeInlayPropertyDeclarationTypeHints = true,
  --           includeInlayFunctionLikeReturnTypeHints = true,
  --           includeInlayEnumMemberValueHints = true,
  --         },
  --       },
  --       javascript = {
  --         inlayHints = {
  --           includeInlayParameterNameHints = "all",
  --           includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --           includeInlayFunctionParameterTypeHints = true,
  --           includeInlayVariableTypeHints = true,
  --           includeInlayPropertyDeclarationTypeHints = true,
  --           includeInlayFunctionLikeReturnTypeHints = true,
  --           includeInlayEnumMemberValueHints = true,
  --         },
  --       },
  --     },
  --   },
  -- })
end

return M
