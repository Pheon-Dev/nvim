local M = {}

M.build = function()
  require("nvim-treesitter.install").update({ with_sync = true })
end

M.dependencies = {
  "nvim-treesitter/nvim-treesitter-textobjects",
}

M.config = function()
  local textobjects = require("config.text-objects.treesitter_text_objects").treesitter_textobjects

  require("nvim-treesitter.configs").setup({
    sync_install = false,
    ensure_installed = {
      "bash",
      "go",
      "html",
      "prisma",
      -- "http",
      -- "javascript",
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

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = { "c", "rust" },
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      --[[ disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end, ]]

      additional_vim_regex_highlighting = false,
    },
    -- matchup = {
    --   enable = true, -- mandatory, false will disable the whole extension
    -- },
    -- autotag = { enable = true },
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
      prev_selection = ",", -- (Optional) keymap to select the previous selection
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-container-outer",
        ["i;"] = "textsubjects-container-inner",
      },
    },
    refactor = {},
    endwise = {
      enable = false,
    },
  })
end

return M
