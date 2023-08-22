local M = {}

function M.lsp_config(plugin)
  local lspconfig = require("lspconfig")
  local capabilities =
      require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- local ih = require("inlay-hints")

  local on_attach = require("util").on_attach(function(client, buffer)
    require("plugins.lsp.keymaps").on_attach(client, buffer)
    -- ih.on_attach(client, buffer)
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
    require("plugins.lsp.keymaps").on_attach(client, buffer)
  end)
end

return M
