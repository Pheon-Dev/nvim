---@type lspconfig.options
local servers = {
  gopls = {
    cmd = { 'gopls' },
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        hints = {
          rassignVariableTypes = true,
          compositeLiteralFields = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true
        }
      },
    },
    init_options = {
      usePlaceholders = true,
    }
  },
  clangd = {},
  -- lua_ls = {
  --   settings = {
  --     lua = {
  --       completion = {
  --         callSnippet = "Replace",
  --       },
  --     }
  --   }
  -- },
  -- codelldb = {},
  -- bashls = {},
  -- cssls = {},
  tsserver = {
    -- settings = {
    --   javascript = {
    --     inlayHints = {
    --       includeInlayEnumMemberValueHints = true,
    --       includeInlayFunctionLikeReturnTypeHints = true,
    --       includeInlayFunctionParameterTypeHints = true,
    --       includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
    --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --       includeInlayPropertyDeclarationTypeHints = true,
    --       includeInlayVariableTypeHints = true,
    --     },
    --   },
    --   typescript = {
    --     inlayHints = {
    --       includeInlayEnumMemberValueHints = true,
    --       includeInlayFunctionLikeReturnTypeHints = true,
    --       includeInlayFunctionParameterTypeHints = true,
    --       includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
    --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --       includeInlayPropertyDeclarationTypeHints = true,
    --       includeInlayVariableTypeHints = true,
    --     },
    --   },
    -- },
  },
  html = {},
  -- jsonls = {},
  -- pyright = {},
  -- yamlls = {},
  -- remark_ls = {},
  rust_analyzer = { -- rustup component add rust-analyzer
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = {
          globals = { "vim" },
        },
        hint = {
          enable = false,
        },
      },
    },
  },
}

return servers
