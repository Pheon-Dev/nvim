local M = {}

function M.lsp_config(plugin)
  local capabilities =
      require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local function onAttach(on_attach)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local buffer = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        on_attach(client, buffer)
      end,
    })
  end

  local on_attach = onAttach(function(client, buffer)
    require("config.lsp.keymaps").on_attach(client, buffer)
  end)
  -- vim.api.nvim_create_autocmd('LspAttach', {
  --   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  --   callback = function(ev)
  --     -- Enable completion triggered by <c-x><c-o>
  --     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  --
  --     -- Buffer local mappings.
  --     -- See `:help vim.lsp.*` for documentation on any of the below functions
  --     local opts = { buffer = ev.buf }
  --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  --     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  --     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  --     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  --     vim.keymap.set('n', '<space>wl', function()
  --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --     end, opts)
  --     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  --     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  --     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  --     vim.keymap.set('n', '<space>f', function()
  --       vim.lsp.buf.format { async = true }
  --     end, opts)
  --   end,
  -- })
  --   local lsp_flags = {
  --     debounce_text_changes = 150,
  --   }
  --   capabilities.textDocument.foldingRange = {
  --     dynamicRegistration = false,
  --     lineFoldingOnly = true,
  --   }

  ---@type lspconfig.options
  local servers = plugin.servers or require("config.lsp.servers")
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
end

return M
