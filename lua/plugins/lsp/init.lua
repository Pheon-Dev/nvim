return {
	{
		"lvimuser/lsp-inlayhints.nvim",
		-- event = "VeryLazy",
		event = "BufReadPre",
	},
	{ "jose-elias-alvarez/typescript.nvim", event = "BufReadPre" },
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"ms-jpq/coq_nvim",
			"SmiteshP/nvim-navic",
			"mason.nvim",
			{ "williamboman/mason-lspconfig.nvim", config = { automatic_installation = true } },
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", config = true },
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
			-- vim.diagnostic.config({
			-- 	underline = true,
			-- 	update_in_insert = false,
			-- 	virtual_text = { spacing = 4, prefix = "●" },
			-- 	severity_sort = true,
			-- })
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = true,
			})

			-- lspconfig
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			local capability = vim.lsp.protocol.make_client_capabilities()
			capability.offsetEncoding = { "utf-16" }
			require("lspconfig").clangd.setup({ capabilities = capability })

			---@type lspconfig.options
			local servers = plugin.servers or require("plugins.lsp.servers")
			local coq = require("coq")
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

				vim.lsp.handlers["textDocument/publishDiagnostics"] =
					vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
						underline = true,
						virtual_text = {
							spacing = 5,
							severity_limit = "Warning",
						},
						update_in_insert = true,
					})

				opts.handlers = handlers
				opts.capabilities = capabilities
				require("lspconfig")[server].setup(coq.lsp_ensure_capabilities(opts))
			end
			local util = require("lspconfig.util")
			local on_attach = require("util").on_attach(function(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
			end)
			local lsp_flags = {
				debounce_text_changes = 150,
			}

			require("typescript").setup(coq.lsp_ensure_capabilities({
				disable_commands = false, -- prevent the plugin from creating Vim commands
				debug = true, -- enable debug logging for commands
				go_to_source_definition = {
					fallback = true, -- fall back to standard LSP definition on failure
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
			}))
		end,
	},
	{
		-- url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		"Pheon-Dev/lsp_lines.nvim",
		event = "BufReadPre",
		config = function()
			require("lsp_lines").register_lsp_virtual_lines()
			-- vim.keymap.set("n", "<Leader>xl", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
		end,
	},
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
	{
		"tami5/lspsaga.nvim",
		config = function()
			local saga = require("lspsaga")
			saga.setup({
				debug = false,
				use_saga_diagnostic_sign = true,
				-- diagnostic sign
				error_sign = "",
				warn_sign = "",
				hint_sign = "",
				infor_sign = "",
				diagnostic_header_icon = "   ",
				-- code action title icon
				code_action_icon = " ",
				code_action_prompt = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
				finder_definition_icon = "  ",
				finder_reference_icon = "  ",
				max_preview_lines = 10,
				finder_action_keys = {
					open = "o",
					vsplit = "s",
					split = "i",
					quit = "q",
					scroll_down = "<C-f>",
					scroll_up = "<C-b>",
				},
				code_action_keys = { quit = "q", exec = "<CR>" },
				rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
				definition_preview_icon = "  ",
				border_style = "single",
				rename_prompt_prefix = "➤",
				rename_output_qflist = {
					enable = false,
					auto_open_qflist = false,
				},
				server_filetype_map = {},
				diagnostic_prefix_format = "%d. ",
				diagnostic_message_format = "%m %c",
				highlight_prefix = false,
			})
		end,
	},
}
