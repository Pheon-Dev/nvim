local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = "BufReadPost",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "BufReadPost",
      },
      {
        "RRethy/nvim-treesitter-endwise",
        event = "BufReadPost",
      },
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

      require("nvim-treesitter.configs").setup({
        sync_install = false,
        ensure_installed = {
          "bash",
          "go",
          "html",
          "javascript",
          "kdl",
          "json",
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
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["al"] = "@class.outer",
              ["il"] = { query = "@class.inner", desc = "Select inner part of a class region" }, -- You can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap) which plugins like which-key display
              -- ["ab"] = "@block.outer",
              -- ["ib"] = "@block.inner",
              ["ad"] = "@conditional.outer",
              ["id"] = "@conditional.inner",
              ["ao"] = "@loop.outer",
              ["io"] = "@loop.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["am"] = "@call.outer",
              ["im"] = "@call.inner",
              ["a/"] = "@comment.outer",
              ["in"] = "@number.inner",
              ["ag"] = "@assignment.outer",
              ["ig"] = "@assignment.inner",
              ["i,"] = "@assignment.lhs",
              ["i."] = "@assignment.rhs",
              --["ic"] = "@comment.outer",
              --["afr"] = "@frame.outer",
              --["ifr"] = "@frame.inner",
              --["aat"] = "@attribute.outer",
              --["iat"] = "@attribute.inner",
              --["asc"] = "@scopename.inner",
              --["isc"] = "@scopename.inner",
              ["as"] = { query = "@scope", query_group = "locals" },
              ["is"] = "@statement.outer",
              ["ar"] = { query = "@start", query_group = "aerial" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = treesitter_selection_mode,
            -- selection_modes = { ["@function.outer"] = "V" },
            -- if you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false
          },
          swap = {
            enable = true,
            swap_next = {
              [")f"] = "@function.outer",
              [")c"] = "@comment.outer",
              [")a"] = "@parameter.inner",
              [")b"] = "@block.outer",
              [")l"] = "@class.outer",
              [")s"] = "@statement.outer",
            },
            swap_previous = {
              ["(f"] = "@function.outer",
              ["(c"] = "@comment.outer",
              ["(a"] = "@parameter.inner",
              ["(b"] = "@block.outer",
              ["(l"] = "@class.outer",
              ["(s"] = "@statement.outer",
            },
          },
          move = {
            -- enable = true,
            -- set_jumps = true, -- whether to set jumps in the jumplist
            -- goto_next_start = {
            --   ["]f"] = "@function.outer",
            --   ["]m"] = "@call.outer",
            --   ["]d"] = "@conditional.outer",
            --   ["]o"] = "@loop.outer",
            --   ["]s"] = "@statement.outer",
            --   ["]a"] = "@parameter.outer",
            --   ["]c"] = "@comment.outer",
            --   ["]b"] = "@block.outer",
            --   ["]n"] = "@number.inner",
            --   ["]l"] = { query = "@class.outer", desc = "next class start" },
            --   ["]]f"] = "@function.inner",
            --   ["]]m"] = "@call.inner",
            --   ["]]d"] = "@conditional.inner",
            --   ["]]o"] = "@loop.inner",
            --   ["]]a"] = "@parameter.inner",
            --   ["]]b"] = "@block.inner",
            --   ["]]l"] = { query = "@class.inner", desc = "next class start" },
            -- },
            -- goto_next_end = {
            --   ["]F"] = "@function.outer",
            --   ["]M"] = "@call.outer",
            --   ["]D"] = "@conditional.outer",
            --   ["]O"] = "@loop.outer",
            --   ["]S"] = "@statement.outer",
            --   ["]A"] = "@parameter.outer",
            --   ["]C"] = "@comment.outer",
            --   ["]B"] = "@block.outer",
            --   ["]L"] = "@class.outer",
            --   ["]N"] = "@number.inner",
            --   ["]]F"] = "@function.inner",
            --   ["]]M"] = "@call.inner",
            --   ["]]D"] = "@conditional.inner",
            --   ["]]O"] = "@loop.inner",
            --   ["]]A"] = "@parameter.inner",
            --   ["]]B"] = "@block.inner",
            --   ["]]L"] = "@class.inner",
            -- },
            -- goto_previous_start = {
            --   ["[f"] = "@function.outer",
            --   ["[m"] = "@call.outer",
            --   ["[d"] = "@conditional.outer",
            --   ["[o"] = "@loop.outer",
            --   ["[s"] = "@statement.outer",
            --   ["[a"] = "@parameter.outer",
            --   ["[c"] = "@comment.outer",
            --   ["[b"] = "@block.outer",
            --   ["[l"] = "@class.outer",
            --   ["[n"] = "@number.inner",
            --   ["[[f"] = "@function.inner",
            --   ["[[m"] = "@call.inner",
            --   ["[[d"] = "@conditional.inner",
            --   ["[[o"] = "@loop.inner",
            --   ["[[a"] = "@parameter.inner",
            --   ["[[b"] = "@block.inner",
            --   ["[[l"] = "@class.inner",
            -- },
            -- goto_previous_end = {
            --   ["[F"] = "@function.outer",
            --   ["[M"] = "@call.outer",
            --   ["[D"] = "@conditional.outer",
            --   ["[O"] = "@loop.outer",
            --   ["[S"] = "@statement.outer",
            --   ["[A"] = "@parameter.outer",
            --   ["[C"] = "@comment.outer",
            --   ["[B"] = "@block.outer",
            --   ["[L"] = "@class.outer",
            --   ["[N"] = "@number.inner",
            --   ["[[F"] = "@function.inner",
            --   ["[[M"] = "@call.inner",
            --   ["[[D"] = "@conditional.inner",
            --   ["[[O"] = "@loop.inner",
            --   ["[[A"] = "@parameter.inner",
            --   ["[[B"] = "@block.inner",
            --   ["[[L"] = "@class.inner",
            -- },
          },
          lsp_interop = {
            enable = true,
            floating_preview_opts = { border = "rounded" },
            peek_definition_code = {
              ["<C-t>"] = "@function.outer",
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
        },

        endwise = {
          enable = true,
        },
        -- context_commentstring = { enable = true },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
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
  -- {
  --   "ckolkey/ts-node-action",
  --   dependencies = { "nvim-treesitter" },
  --   event = "BufReadPost",
  --   config = true,
  -- },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
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
          "toggleterm",
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
