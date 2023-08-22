local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      local function starts_with(str, start)
        return str:sub(1, #start) == start
      end

      local function treesitter_selection_mode(info)
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        --print(info['method'])		-- visual, operator-pending
        if starts_with(info["query_string"], "@function.") then
          return "V"
        end
        return "v"
      end

      local textobjects = require("plugins.text-objects").textobjects

      require("nvim-treesitter.configs").setup({
        sync_install = false,
        ensure_installed = {
          "bash",
          "go",
          "html",
          "prisma",
          "http",
          "javascript",
          "kdl",
          "json",
          "rasi",
          "yuck",
          "lua",
          "markdown",
          "markdown_inline",
          "norg",
          "org",
          "python",
          "query",
          "regex",
          "rust",
          "tsx",
          "typescript",
          "vim",
          "hjson",
          "yaml",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        -- matchup = {
        --   enable = true, -- mandatory, false will disable the whole extension
        -- },
        autotag = { enable = true },
        rainbow = {
          enable = true,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        },
        autopairs = { enable = true },
        indent = { enable = true },
        textobjects = textobjects,
        textsubjects = {
          enable = false,
          prev_selection = ',', -- (Optional) keymap to select the previous selection
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
        refactor = {},
        endwise = {
          enable = false,
        },
        context_commentstring = { enable = true },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "astro",
        "glimmer",
        "handlebars",
        "hbs",
      }
      local skip_tags = {
        "area",
        "base",
        "br",
        "col",
        "command",
        "embed",
        "hr",
        "img",
        "slot",
        "input",
        "keygen",
        "link",
        "meta",
        "param",
        "source",
        "track",
        "wbr",
        "menuitem",
      }

      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
          filetypes = filetypes,
          skip_tags = skip_tags,
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require 'treesitter-context'.setup {
        enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end
  },
  {
    "RRethy/vim-illuminate",
    enabled = true,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- default configuration
      require("illuminate").configure({
        -- providers: provider used to get references in the buffer, ordered by priority
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        -- delay: delay in milliseconds
        delay = 100,
        -- filetype_overrides: filetype specific overrides.
        -- The keys are strings to represent the filetype while the values are tables that
        -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
        filetype_overrides = {},
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = {
          "dirvish",
          "fugitive",
          "harpoon",
          "flaaterm",
          "NvimTree",
        },
        -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        -- See `:help mode()` for possible values
        modes_denylist = {},
        -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
        -- See `:help mode()` for possible values
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
        -- large_file_cutoff: number of lines at which to use large_file_config
        -- The `under_cursor` option is disabled when this cutoff is hit
        large_file_cutoff = nil,
        -- large_file_config: config to use for large files (based on large_file_cutoff).
        -- Supports the same keys passed to .configure
        -- If nil, vim-illuminate will be disabled for large files.
        large_file_overrides = nil,
        -- min_count_to_highlight: minimum number of matches required to perform highlighting
        min_count_to_highlight = 1,
      })
    end,
    keys = {
      {
        "]]",
        function()
          require("illuminate").goto_next_reference(false)
        end,
        desc = "Next Reference",
      },
      {
        "[[",
        function()
          require("illuminate").goto_prev_reference(false)
        end,
        desc = "Prev Reference",
      },
    },
  },
}

return { M }
