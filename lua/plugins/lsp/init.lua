return {
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", config = true },
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = { automatic_installation = true } },
      "hrsh7th/cmp-nvim-lsp",
    },
    ---@type lspconfig.options
    servers = nil,
    config = function(plugin)
      -- setup formatting and keymaps
      require("util").on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("config.settings").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })

      -- lspconfig
      local capabilities =
      require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      ---@type lspconfig.options
      local servers = plugin.servers or require("plugins.lsp.servers")
      local coq = require("coq")
      for server, opts in pairs(servers) do
        opts.capabilities = capabilities
        require("lspconfig")[server].setup(coq.lsp_ensure_capabilities(opts))
      end
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    config = function()
      local null_ls = require("null-ls")

      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "eslint_d", "gitsigns", "renark" },
      })

      require("mason-null-ls").setup_handlers({
        function(source_name, methods)
          --[[ null_ls.register(null_ls.builtins.completion.spell) ]]
          require("mason-null-ls.automatic_setup")(source_name, methods)
        end,
        stylua = null_ls.register(null_ls.builtins.formatting.stylua),
        --[[ gitsigns = null_ls.register(null_ls.builtins.code_actions.gitsigns), ]]
        --[[ prettierd = null_ls.register(null_ls.builtins.formatting.prettierd), ]]
        --[[ eslint_d = null_ls.register(null_ls.builtins.diagnostics.eslint_d), ]]
        --[[ flake8 = null_ls.register(null_ls.builtins.diagnostics.flake8), ]]
      })

      null_ls.setup()
    end,
  },

  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
    config = function(plugin)
      require("mason").setup()
      local mr = require("mason-registry")
      for _, tool in ipairs(plugin.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
  "onsails/lspkind-nvim",
  "folke/lsp-colors.nvim",
  "tami5/lspsaga.nvim",
  "jayp0521/mason-null-ls.nvim",
}
