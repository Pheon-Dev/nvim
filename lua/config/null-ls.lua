local M = { module = "null-ls" }

function M.setup(options)
  local nls = require("null-ls")
  require('mason-null-ls').setup({
    ensure_installed = { 'stylua' }
  })

  require 'mason-null-ls'.setup_handlers {
    function(source_name)
      --[[ nls.builtins.diagnostics.eslint, ]]
      --[[ nls.builtins.completion.spell, ]]
      --[[ nls.builtins.formatting.prettier, ]]
      -- nls.builtins.formatting.prettierd,
      nls.register(nls.builtins.completion.spell)
      nls.register(nls.builtins.formatting.fish_indent)
      -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      -- nls.builtins.formatting.eslint_d,
      -- nls.builtins.diagnostics.shellcheck,
      nls.register(nls.builtins.formatting.shfmt)
      nls.register(nls.builtins.formatting.markdownlint)
      -- nls.builtins.diagnostics.luacheck,
      -- nls.builtins.diagnostics.selene,
      -- nls.builtins.code_actions.gitsigns,
    end,
    eslint = function(source_name, methods)
      nls.register(nls.builtins.diagnostics.eslint)
    end,
    eslint_d = function(source_name, methods)
      nls.register(nls.builtins.formatting.eslint_d)
    end,
    stylua = function(source_name, methods)
      nls.register(nls.builtins.formatting.stylua)
    end,
    prettierd = function(source_name, methods)
      nls.builtins.formatting.prettierd.with({
        filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
      })
    end,
    debounce = 150,
    save_after_format = false,
    on_attach = options.on_attach,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
  }
  nls.setup()
end

function M.has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
