local M = {}

M.name = "catppuccin"

M.lazy = false

M.priority = 1000

M.config = function()
  local theme = require("core.colors")

  require("catppuccin").setup({
    -- flavour = "mocha", -- latte, frappe, macchiato, mocha
    -- -- background = {     -- :h background
    -- --   light = "latte",
    -- --   dark = "mocha",
    -- -- },
    -- transparent_background = false, -- disables setting the background color.
    -- show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
    -- term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
    -- dim_inactive = {
    --   enabled = false,              -- dims the background color of inactive window
    --   shade = "dark",
    --   percentage = 0.15,            -- percentage of the shade to apply to the inactive window
    -- },
    -- no_italic = false,              -- Force no italic
    -- no_bold = false,                -- Force no bold
    -- no_underline = false,           -- Force no underline
    -- styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
    --   comments = { "italic" },      -- Change the style of comments
    --   conditionals = { "italic" },
    --   loops = {},
    --   functions = {},
    --   keywords = {},
    --   strings = {},
    --   variables = {},
    --   numbers = {},
    --   booleans = {},
    --   properties = {},
    --   types = {},
    --   operators = {},
    -- },
    -- color_overrides = {},
    -- custom_highlights = function(colors)
    --   return {
    --     -- Comment = { fg = colors.flamingo },
    --     -- TabLineSel = { bg = colors.pink },
    --     -- CmpBorder = { fg = colors.surface2 },
    --     -- Pmenu = { bg = colors.none },
    --   }
    -- end,
    -- integrations = {
    --   cmp = true,
    --   gitsigns = true,
    --   nvimtree = true,
    --   treesitter = true,
    --   notify = true,
    --   mini = true,
    --   dashboard = true,
    --   harpoon = true,
    --   noice = true,
    --   ufo = true,
    --   treesitter_context = false,
    --   which_key = true,
    --   -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    -- },
  })

  -- setup must be called before loading
  vim.cmd.colorscheme("catppuccin")

  -- vim.cmd("colorscheme catppuccin-mocha")
  -- vim.cmd("colorscheme catppuccin-macchiato")
  -- vim.cmd("colorscheme catppuccin-latte")
  -- vim.cmd("colorscheme catppuccin-frappe")

  -- local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)

  -- Float Term
  vim.api.nvim_set_hl(0, "FloatermBorder", { fg = theme.color2, bg = theme.color0 })

  vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = theme.color1 })
  vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = theme.color3 })

  vim.api.nvim_set_hl(0, "Visual", { bg = theme.color61 })
  vim.api.nvim_set_hl(0, "Search", { fg = theme.color1, bg = theme.color89 })
  -- vim.api.nvim_set_hl(0, "IncSearch", { fg = theme.color89, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "VirtColumn", { fg = theme.color1 })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = theme.color1 })
  -- vim.api.nvim_set_hl(0, "CursorLineNR", { fg = theme.color101 })
  vim.api.nvim_set_hl(0, "Title", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "CursorLineNR", { link = "Title" })
  -- vim.api.nvim_set_hl(0, "Title", { fg = theme.color101, bg = theme.color0 })

  -- CMP
  -- vim.api.nvim_set_hl(0, "PmenuThumb", { fg = theme.color59, bg = theme.color59 })
  vim.api.nvim_set_hl(0, "CmpPmenu", { bg = theme.color0 })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = theme.color1 })
  vim.api.nvim_set_hl(0, "CmpBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = theme.color2, bg = theme.color0 })

  -- Popup
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = theme.color2, bg = theme.color0 })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = theme.color0 })

  -- Match
  vim.api.nvim_set_hl(0, "MatchParen", { fg = theme.color99 })
  vim.api.nvim_set_hl(0, "MatchWord", { fg = theme.color100 })
  vim.api.nvim_set_hl(0, "MatchParenCur", { fg = theme.color100 })
  vim.api.nvim_set_hl(0, "MatchWordCur", { fg = theme.color100 })

  -- Indent
  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = theme.color24 })

  -- Mason
  vim.api.nvim_set_hl(0, "MasonNormal", { bg = theme.color0 })

  -- Lazy
  vim.api.nvim_set_hl(0, "LazyNormal", { bg = theme.color0 })
  -- vim.api.nvim_set_hl(0, "LazyButtonActive", { bg = theme.color0, fg = theme.color89 })
  -- vim.api.nvim_set_hl(0, "LazyProgressDone", { bg = theme.color0, fg = theme.color89 })
  -- vim.api.nvim_set_hl(0, "LazyProgressTodo", { bg = theme.color0, fg = theme.color89 })
end

return M
