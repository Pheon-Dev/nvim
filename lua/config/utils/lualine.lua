local enable = require("config").enable

local M = {}
M.config = function()
  local lualine = require("lualine")
  local noice = require("noice")

  -- local latte = require("catppuccin.palettes").get_palette "latte"
  -- local frappe = require("catppuccin.palettes").get_palette "frappe"
  -- local macchiato = require("catppuccin.palettes").get_palette "macchiato"
  local mocha = require("catppuccin.palettes").get_palette("mocha")

  local colors = mocha

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand("%:p:h")
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  -- Config
  local config = {
    options = {
      icons_enabled = true,
      disabled_filetypes = {
        statusline = {
          "dashboard",
          "NvimTree",
          "floaterm",
        },
      },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
      },
      theme = {
        normal = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    statusline = {},
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    extensions = {},
  }

  local function sec_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  local function sec_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  local theme = require("core.colors")
  local my_colors = {
    n = theme.color37,
    i = theme.color16,
    c = theme.color89,
    v = theme.color27,
    V = theme.color27,
    R = theme.color99,
  }

  local mode = {
    n = "",
    i = "",
    ic = "",
    v = "",
    V = "",
    s = "",
    S = "",
    r = "",
    R = "",
    Rv = "",
    rm = "",
    c = "",
    cv = "",
    ce = "",
    t = "",
    no = "",
    gui = "",
    [""] = "",
    [""] = "",
    ["r?"] = "",
    ["!"] = "",
  }

  local mode_color = {
    n = my_colors.n,
    i = my_colors.i,
    v = my_colors.v,
    [""] = colors.magenta,
    V = my_colors.V,
    c = my_colors.c,
    no = my_colors.n,
    s = colors.violet,
    S = colors.violet,
    [""] = colors.violet,
    ic = colors.blue,
    R = my_colors.R,
    Rv = my_colors.R,
    cv = colors.green,
    ce = colors.green,
    r = colors.magenta,
    rm = colors.magenta,
    ["r?"] = colors.magenta,
    ["!"] = colors.green,
    t = colors.green,
    gui = "bold",
  }

  sec_left({
    -- "mode",
    function()
      return mode[vim.fn.mode()]
    end,
    -- "mode",
    color = function()
      return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
    end,
    -- padding = { right = 1, left = 3 },
  })

  -- filename
  sec_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.grey },
    file_status = true, -- Displays file status (readonly status, modified status)
    newfile_status = false, -- Display new file status (new file means no write after created)
    path = 1, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path
    -- 3: Absolute path, with tilde as the home directory

    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    symbols = {
      -- for other components. (terrible name, any suggestions?)
      readonly = "", -- Text to show when the file is non-modifiable or readonly.
      modified = "", -- Text to show when the file is modified.
      unnamed = "ﲃ", -- Text to show for unnamed buffers.
      newfile = "", -- Text to show for newly created file before first write
    },
  })

  -- git diffs
  sec_left({
    "diff",
    symbols = { added = " ", modified = " ", removed = " ", renamed = " ", ignored = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
    padding = { right = 1, left = 1 },
  })

  -- search count
  sec_left({
    "searchcount",
    color = { fg = colors.green },
  })

  -- sep
  sec_left({
    function()
      return "%="
    end,
  })

  -- macros etc
  sec_left({
    noice.api.statusline.mode.get,
    cond = noice.api.statusline.mode.has,
    color = { fg = "#ff9e64" },
    padding = { right = 1, left = 1 },
  })

  -- lazy updates
  sec_right({
    require("lazy.status").updates,
    cond = require("lazy.status").has_updates,
    color = { fg = "#ff9e64" },
  })

  -- diagnosticcs
  sec_right({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = " ",
      warn = " ",
      info = " ",
      hint = "󰠠 ",
      question = " ",
    },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
    padding = { right = 1, left = 1 },
  })

  -- -- tabs
  -- sec_right({
  --   function()
  --     local tabpages = require("buffalo").tabpages()
  --     return " 󰓩 " .. tabpages
  --   end,
  --   color = { fg = colors.grey },
  -- })

  -- buffers
  sec_right({
    function()
      local buffers = require("antelope.buffers").buffers()
      return " " .. buffers -- 󱂬
    end,
    color = "Keyword",
  })

  -- volume
  -- sec_right({
  --   function()
  --     local enabled = require("pigeon.config").options.volume.enabled
  --     local volume = require("pigeon.volume").volume()
  --
  --     if enabled then
  --       return volume
  --     else
  --       return ""
  --     end
  --   end,
  --   color = "Keyword",
  -- })

  if enable.codeium then
    sec_right({
      function()
        return "﯑ " .. "%3{codeium#GetStatusString()} "
      end,
      color = { fg = colors.grey },
    })
  end

  -- branch
  sec_right({
    "branch",
    icon = { "", align = "left" },
    -- color = { fg = colors.yellow, ng = colors.bg },
    color = "Comment",
    padding = { right = 1, left = 0 },
  })

  lualine.setup(config)
end
return M
