return {
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml", "BufReadPre" },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      local function show_documentation()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ "vim", "help" }, filetype) then
          vim.cmd("h " .. vim.fn.expand("<cword>"))
        elseif vim.tbl_contains({ "man" }, filetype) then
          vim.cmd("Man " .. vim.fn.expand("<cword>"))
        elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
          require("crates").show_popup()
        else
          vim.lsp.buf.hover()
        end
      end

      vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })
      require("crates").setup({
        smart_insert = true,
        insert_closing_quote = true,
        avoid_prerelease = true,
        autoload = true,
        autoupdate = true,
        -- autoupdate_throttle = 250,
        loading_indicator = true,
        date_format = "%Y-%m-%d",
        thousands_separator = ".",
        notification_title = "Crates",
        -- curl_args = { "-sL", "--retry", "1" },
        disable_invalid_feature_diagnostic = false,
        text = {
          loading = "   Loading",
          version = "   %s",
          prerelease = "   %s",
          yanked = "   %s",
          nomatch = "   No match",
          upgrade = "   %s",
          error = "   Error fetching crate",
        },
        highlight = {
          loading = "CratesNvimLoading",
          version = "CratesNvimVersion",
          prerelease = "CratesNvimPreRelease",
          yanked = "CratesNvimYanked",
          nomatch = "CratesNvimNoMatch",
          upgrade = "CratesNvimUpgrade",
          error = "CratesNvimError",
        },
        popup = {
          autofocus = false,
          -- hide_on_select = false,
          copy_register = '"',
          style = "minimal",
          border = "none",
          show_version_date = false,
          show_dependency_version = true,
          max_height = 30,
          min_width = 20,
          padding = 1,
          text = {
            title = " %s",
            pill_left = "",
            pill_right = "",
            description = "%s",
            created_label = " created        ",
            created = "%s",
            updated_label = " updated        ",
            updated = "%s",
            downloads_label = " downloads      ",
            downloads = "%s",
            homepage_label = " homepage       ",
            homepage = "%s",
            repository_label = " repository     ",
            repository = "%s",
            documentation_label = " documentation  ",
            documentation = "%s",
            crates_io_label = " crates.io      ",
            crates_io = "%s",
            categories_label = " categories     ",
            keywords_label = " keywords       ",
            version = "  %s",
            prerelease = " %s",
            yanked = " %s",
            version_date = "  %s",
            feature = "  %s",
            enabled = " %s",
            transitive = " %s",
            normal_dependencies_title = " Dependencies",
            build_dependencies_title = " Build dependencies",
            dev_dependencies_title = " Dev dependencies",
            dependency = "  %s",
            optional = " %s",
            dependency_version = "  %s",
            loading = "  ",
          },
          highlight = {
            title = "CratesNvimPopupTitle",
            pill_text = "CratesNvimPopupPillText",
            pill_border = "CratesNvimPopupPillBorder",
            description = "CratesNvimPopupDescription",
            created_label = "CratesNvimPopupLabel",
            created = "CratesNvimPopupValue",
            updated_label = "CratesNvimPopupLabel",
            updated = "CratesNvimPopupValue",
            downloads_label = "CratesNvimPopupLabel",
            downloads = "CratesNvimPopupValue",
            homepage_label = "CratesNvimPopupLabel",
            homepage = "CratesNvimPopupUrl",
            repository_label = "CratesNvimPopupLabel",
            repository = "CratesNvimPopupUrl",
            documentation_label = "CratesNvimPopupLabel",
            documentation = "CratesNvimPopupUrl",
            crates_io_label = "CratesNvimPopupLabel",
            crates_io = "CratesNvimPopupUrl",
            categories_label = "CratesNvimPopupLabel",
            keywords_label = "CratesNvimPopupLabel",
            version = "CratesNvimPopupVersion",
            prerelease = "CratesNvimPopupPreRelease",
            yanked = "CratesNvimPopupYanked",
            version_date = "CratesNvimPopupVersionDate",
            feature = "CratesNvimPopupFeature",
            enabled = "CratesNvimPopupEnabled",
            transitive = "CratesNvimPopupTransitive",
            normal_dependencies_title = "CratesNvimPopupNormalDependenciesTitle",
            build_dependencies_title = "CratesNvimPopupBuildDependenciesTitle",
            dev_dependencies_title = "CratesNvimPopupDevDependenciesTitle",
            dependency = "CratesNvimPopupDependency",
            optional = "CratesNvimPopupOptional",
            dependency_version = "CratesNvimPopupDependencyVersion",
            loading = "CratesNvimPopupLoading",
          },
          keys = {
            hide = { "q", "<esc>" },
            open_url = { "<cr>" },
            select = { "<cr>" },
            select_alt = { "s" },
            toggle_feature = { "<cr>" },
            copy_value = { "yy" },
            goto_item = { "gd", "K", "<C-LeftMouse>" },
            jump_forward = { "<c-i>" },
            jump_back = { "<c-o>", "<C-RightMouse>" },
          },
        },
        src = {
          insert_closing_quote = true,
          text = {
            prerelease = "  pre-release ",
            yanked = "  yanked ",
          },
          coq = {
            enabled = false,
            name = "Crates",
          },
        },
        null_ls = {
          enabled = false,
          name = "Crates",
        },
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    event = { "BufRead *.rs", "BufReadPre" },
    config = function()
      local rt = require("rust-tools")

      local capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local on_attach = require("util").on_attach(function(client, buffer)
        require("plugins.lsp.format").on_attach(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      local opts = {
        tools = {
          -- rust-tools options

          -- how to execute terminal commands
          -- options right now: termopen / quickfix
          executor = require("rust-tools.executors").termopen,

          -- callback to execute once rust-analyzer is done initializing the workspace
          -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
          on_initialized = nil,

          -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
          reload_workspace_from_cargo_toml = true,

          -- These apply to the default RustSetInlayHints command
          inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "  ← ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "  ⇒ ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "RustToolsInlayHints",
          },

          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },

            -- Maximal width of the hover window. Nil means no max.
            max_width = nil,

            -- Maximal height of the hover window. Nil means no max.
            max_height = nil,

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false,
          },

          -- settings for showing the crate graph based on graphviz and the dot
          -- command
          crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,

            -- List of backends found on: https://graphviz.org/docs/outputs/
            -- Is used for input validation and autocompletion
            -- Last updated: 2021-08-26
            enabled_graphviz_backends = {
              "bmp",
              "cgimage",
              "canon",
              "dot",
              "gv",
              "xdot",
              "xdot1.2",
              "xdot1.4",
              "eps",
              "exr",
              "fig",
              "gd",
              "gd2",
              "gif",
              "gtk",
              "ico",
              "cmap",
              "ismap",
              "imap",
              "cmapx",
              "imap_np",
              "cmapx_np",
              "jpg",
              "jpeg",
              "jpe",
              "jp2",
              "json",
              "json0",
              "dot_json",
              "xdot_json",
              "pdf",
              "pic",
              "pct",
              "pict",
              "plain",
              "plain-ext",
              "png",
              "pov",
              "ps",
              "ps2",
              "psd",
              "sgi",
              "svg",
              "svgz",
              "tga",
              "tiff",
              "tif",
              "tk",
              "vml",
              "vmlz",
              "wbmp",
              "webp",
              "xlib",
              "x11",
            },
          },
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {
          -- standalone file support
          -- setting it to false may improve startup time
          standalone = false,
          capabilities = capabilities,
          on_attach = on_attach,
        }, -- rust-analyzer options

        -- debugging stuff
        dap = {
          adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
          },
        },
      }

      rt.setup(opts)

      -- inlay_hints
      -- Commands:
      -- RustEnableInlayHints
      -- RustDisableInlayHints
      -- RustSetInlayHints
      -- RustUnsetInlayHints

      -- Set inlay hints for the current buffer

      rt.hover_actions.hover_actions()
      rt.inlay_hints.set()
      -- rt.inlay_hints.unset()
      rt.inlay_hints.enable()
      -- rt.inlay_hints.disable()
    end,
  },
}
