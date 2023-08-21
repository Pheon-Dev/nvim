return {
  {
    "Pocco81/auto-save.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      require("auto-save").setup({
        enabled = true,        -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
        execution_message = {
          message = function() -- message to print on save
            return (" ✔  Saved:   " .. vim.fn.strftime("%H:%M:%S"))
          end,
          dim = 0.18,                                      -- dim the color of `message`
          cleaning_interval = 1250,                        -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
        trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events "TextChanged" "InsertLeave"
        -- function that determines whether to save the current buffer or not
        -- return true: if buffer is ok to be saved
        -- return false: if it's not ok to be saved

        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")

          if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true                -- met condition(s), can save
          end
          return false                 -- can't save
        end,
        write_all_buffers = false,     -- write all buffers when the current one meets `condition`
        debounce_delay = 3000,         -- saves the file at most every `debounce_delay` 135 milliseconds
        callbacks = {                  -- functions to be executed at different intervals
          enabling = nil,              -- ran when enabling auto-save
          disabling = nil,             -- ran when disabling auto-save
          before_asserting_save = nil, -- ran before checking `condition`
          before_saving = nil,         -- ran before doing the actual save
          after_saving = nil,          -- ran after doing the actual save
        },
      })
    end,
  },
  {
    "elentok/format-on-save.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      local format_on_save = require("format-on-save")
      local formatters = require("format-on-save.formatters")

      format_on_save.setup({
        exclude_path_patterns = {
          "/node_modules/",
          ".local/share/nvim/lazy",
          "/target",
          ".config/rofi",
          ".config/hypr",
        },
        formatter_by_ft = {
          css = formatters.lsp,
          html = formatters.lsp,
          java = formatters.lsp,
          javascript = formatters.lsp,
          json = formatters.lsp,
          lua = formatters.lsp,
          markdown = formatters.prettierd,
          openscad = formatters.lsp,
          -- python = formatters.black,
          rust = formatters.lsp,
          scad = formatters.lsp,
          scss = formatters.lsp,
          sh = formatters.shfmt,
          terraform = formatters.lsp,
          typescript = formatters.prettierd,
          typescriptreact = formatters.prettierd,
          yaml = formatters.lsp,

          -- Add your own shell formatters:
          myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

          -- Add lazy formatter that will only run when formatting:
          my_custom_formatter = function()
            if vim.api.nvim_buf_get_name(0):match("/README.md$") then
              return formatters.prettierd
            else
              return formatters.lsp()
            end
          end,

          -- Add custom formatter
          filetype1 = formatters.remove_trailing_whitespace,
          filetype2 = formatters.custom({
            format = function(lines)
              return vim.tbl_map(function(line)
                return line:gsub("true", "false")
              end, lines)
            end
          }),

          -- Concatenate formatters
          python = {
            formatters.remove_trailing_whitespace,
            formatters.shell({ cmd = "tidy-imports" }),
            formatters.black,
            formatters.ruff,
          },

          -- Use a tempfile instead of stdin
          go = {
            formatters.shell({
              cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
              tempfile = function()
                return vim.fn.expand("%") .. '.formatter-temp'
              end
            }),
            formatters.shell({ cmd = { "gofmt" } }),
          },

          -- Add conditional formatter that only runs if a certain file exists
          -- in one of the parent directories.
          -- javascript = {
          --   formatters.if_file_exists({
          --     pattern = ".eslintrc.*",
          --     formatter = formatters.eslint_d_fix)
          --   }),
          --   formatters.if_file_exists({
          --     pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
          --     formatter = formatters.prettierd,
          --   }),
          --   -- By default it stops at the git repo root (or "/" if git repo not found)
          --   -- but it can be customized with the `stop_path` option:
          --   formatters.if_file_exists({
          --     pattern = ".prettierrc",
          --     formatter = formatters.prettierd,
          --     stop_path = function()
          --       return "/my/custom/stop/path"
          --     end
          --   }),
          -- },
        },

        -- Optional: fallback formatter to use when no formatters match the current filetype
        fallback_formatter = {
          formatters.remove_trailing_whitespace,
          formatters.prettierd,
        },

        -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
        -- To prevent that set `run_with_sh` to `false`.
        run_with_sh = false,
      })
    end,
  }
}
