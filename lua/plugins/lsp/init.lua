return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "BufReadPre",
  },
  { "jose-elias-alvarez/typescript.nvim", event = "BufReadPre" },
  {
    "neovim/nvim-lspconfig",
    -- event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "mason.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
          })
        end,
      },
    },
    ---@type lspconfig.options
    servers = nil,
    config = function(plugin)
      -- diagnostics
      require("plugins.lsp.diagnostics")

      -- lspconfig
      local capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
        require("lspconfig")[server].setup(opts)
      end
      -- setup formatting and keymaps
      require("util").on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      local nvim_lsp = require('lspconfig')
      local util = require("lspconfig.util")
      local on_attach = require("util").on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)
      local lsp_flags = {
        debounce_text_changes = 150,
      }

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

      require("typescript").setup({
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = true,             -- enable debug logging for commands
        go_to_source_definition = {
          fallback = true,        -- fall back to standard LSP definition on failure
        },
        server = {
          -- pass options to lspconfig's setup method
          capabilities = capabilities,
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
      })
    end,
  },
  -- {
  -- 	-- url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  -- 	"Pheon-Dev/lsp_lines.nvim",
  -- 	event = "BufReadPre",
  -- 	config = function()
  -- 		require("lsp_lines").register_lsp_virtual_lines()
  -- 		-- vim.keymap.set("n", "<Leader>xl", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
  -- 	end,
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.diagnostics.eslint_d,
          -- null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
          require("typescript.extensions.null-ls.code-actions"),
        },
      })
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = "MasonUpdate",
    -- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    -- ensure_installed = {
    -- 	"stylua",
    -- 	"shellcheck",
    -- 	"shfmt",
    -- 	"flake8",
    -- },
    config = function(plugin)
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✔",
            package_pending = "➜",
            package_uninstalled = "",
          },
        },
      })
      -- local mr = require("mason-registry")
      -- for _, tool in ipairs(plugin.ensure_installed) do
      --   local p = mr.get_package(tool)
      --   if not p:is_installed() then
      --     p:install()
      --   end
      -- end
    end,
  },
  "onsails/lspkind-nvim",
  "folke/lsp-colors.nvim",
}
