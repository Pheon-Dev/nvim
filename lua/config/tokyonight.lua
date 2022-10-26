vim.g.tokyonight_style = "storm"
--[[ vim.g.tokyonight_transparent = true ]]
vim.o.background = 'dark'

--[[ colorscheme tokyonight ]]
--[[ colorscheme tokyonight-night ]]
--[[ colorscheme tokyonight-storm ]]
--[[ colorscheme tokyonight-day ]]
--[[ colorscheme tokyonight-moon ]]
require("tokyonight").setup({
  on_highlights = function(hl, c)
    local prompt = "#2e2e2e"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})
