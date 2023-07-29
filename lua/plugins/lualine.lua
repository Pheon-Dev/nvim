return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = {
    "Pheon-Dev/pigeon",
    "Exafunction/codeium.vim",
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ok, lualine = pcall(require, "lualine")
    local on, noice = pcall(require, "noice")

    if not ok or not on then
      vim.notify("Plugins didn't load properly!", "error")
    end

    local colors = {
      bg = "#21222c",
      bg1 = "#282a36",
      bg2 = "#44475a",
      bg3 = "#565f89",
      grey = "#a9a1e1",
      fg = "#bd93f9",
      yellow = "#ffff0f",
      yellow1 = "#f0ff8c",
      cyan = "#008080",
      darkblue = "#081633",
      green = "#82cf00",
      green1 = "#A9FF68",
      orange2 = "#c03000",
      orange1 = "#ff7222",
      orange3 = "#ff9e64",
      orange = "#FF8800",
      violet = "#a9a1e1",
      magenta = "#c678dd",
      blue = "#51afef",
      red = "#ec5f67",
      purple = "#6272a4",
    }

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
        icons_enabled = false,
        disabled_filetypes = { tabline = { "alpha" }, statusline = { "alpha" } },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },

        ignore_focus = {}, -- If current filetype is in this list it'll
        -- always be drawn as inactive statusline
        -- and the last window will be drawn as active statusline.
        -- for example if you don't want statusline of
        -- your file tree / sidebar window to have active
        -- statusline you can add their filetypes here.

        always_divide_middle = true, -- When set to true, left sections i.e. 'a','b' and 'c'
        -- can't take over the entire statusline even
        -- if neither of 'x', 'y' or 'z' are present.

        globalstatus = true, -- enable global statusline (have a single statusline
        -- at bottom of neovim instead of one for  every window).
        -- This feature is only available in neovim 0.7 and higher.

        refresh = {          -- sets how often lualine should refresh it's contents (in ms)
          statusline = 1000, -- The refresh option sets minimum time that lualine tries
          tabline = 1000,    -- to maintain between refresh. It's not guarantied if situation
          -- winbar = 1000      -- arises that lualine needs to refresh itself before this time
          -- it'll do it.

          -- Also you can force lualine's refresh by calling refresh function
          -- like require('lualine').refresh()
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
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_tabline = {},
      extensions = {}
    }

    local function sec_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function sec_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    local function tab_left(component)
      table.insert(config.tabline.lualine_c, component)
    end

    local function tab_right(component)
      table.insert(config.tabline.lualine_x, component)
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

    -- Tabline
    local tab_color = "Keyword"

    -- mode
    tab_left({
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

    -- -- datetime
    -- tab_left({
    --   function()
    --     local enabled = require("pigeon.config").options.datetime.time.enabled
    --     return enabled and require("pigeon.datetime").current_time() or ""
    --   end,
    --   color = tab_color
    -- })
    --
    tab_left({
      function()
        local enabled = require("pigeon.config").options.datetime.day.enabled
        return enabled and require("pigeon.datetime").current_day() or ""
      end,
      color = tab_color
    })

    -- sep
    tab_left({
      function()
        return "%="
      end,
    })

    -- buffers
    tab_left({
      'buffers',
      show_filename_only = false,     -- Shows shortened relative path when set to false.
      hide_filename_extension = true, -- Hide filename extension when set to true.
      show_modified_status = true,    -- Shows indicator when the buffer is modified.
      mode = 1,                       -- 0: Shows buffer name
      buffers_color = {
        active = "Keyword",           -- Color for active buffer.
        inactive = "Comment",         -- Color for inactive buffer.
      },
      symbols = {
        modified = '',       -- Text to show when the buffer is modified
        alternate_file = '', -- Text to show to identify the alternate file
        directory = '',      -- Text to show when the buffer is a directory
      },
    })

    -- sep
    tab_left({
      function()
        return "["
      end,
      color = "Comment"
    })

    -- tabs
    tab_left({
      'tabs',
      max_length = vim.o.columns / 3, -- Maximum width of tabs component.
      mode = 0,                       -- 0: Shows tab_nr
      use_mode_colors = false,
      tabs_color = {
        -- Same values as the general color option can be used here.
        active = "Keyword",   -- Color for active tab.
        inactive = "Comment", -- Color for inactive tab.
      },
      fmt = function(name, context)
        local buflist = vim.fn.tabpagebuflist(context.tabnr)
        local winnr = vim.fn.tabpagewinnr(context.tabnr)
        local bufnr = buflist[winnr]
        local mod = vim.fn.getbufvar(bufnr, '&mod')

        return name .. (mod == 1 and ' +' or '')
      end
    })

    -- sep
    tab_left({
      function()
        return "]"
      end,
      color = "Comment"
    })

    -- lazy updates
    tab_right({
      require("lazy.status").updates,
      cond = require("lazy.status").has_updates,
      -- color = { fg = "#ff9e64" },
      color = tab_color
    })

    -- wifi
    tab_right({
      function()
        local enabled = require("pigeon.config").options.internet.enabled
        return enabled and require("pigeon.internet").wifi() or ""
      end,
      color = tab_color
      -- color = { fg = theme.color89 },
    })

    -- ram
    tab_right({
      function()
        local enabled = require("pigeon.config").options.ram.enabled
        return enabled and require("pigeon.ram").ram() or ""
      end,
      color = tab_color
      -- color = { fg = theme.color26 },
    })

    -- battery
    tab_right({
      function()
        local enabled = require("pigeon.config").options.battery.enabled
        return enabled and require("pigeon.battery").battery() or ""
      end,
      -- color = { fg = colors.orange3 },
      color = tab_color
    })

    -- Statusline
    sec_left({
      function()
        local enabled = require("pigeon.config").options.datetime.time.enabled
        return enabled and require("pigeon.datetime").current_time() or ""
      end,
      color = function()
        return "Title"
      end,
    })
    -- -- filetype
    -- sec_left({
    --   "filetype",
    --   color = function()
    --     return { bg = mode_color[vim.fn.mode()], fg = colors.bg }
    --   end,
    --   -- padding = { right = 1, left = 3 },
    -- })
    --
    -- filename
    sec_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.grey },
      file_status = true,     -- Displays file status (readonly status, modified status)
      newfile_status = false, -- Display new file status (new file means no write after created)
      path = 1,               -- 0: Just the filename
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

    -- search count
    sec_left({
      "searchcount",
      color = { fg = colors.green1 },
    })

    -- sep
    sec_left({
      function()
        return "%="
      end,
    })

    -- macros etc
    if on then
      sec_left({
        noice.api.statusline.mode.get,
        cond = noice.api.statusline.mode.has,
        color = { fg = colors.orange1 },
        padding = { right = 1, left = 1 },
      })
    end

    -- diagnosticcs
    sec_right({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = {
        error = " ",
        warn = " ",
        info = " ",
        question = " ",
        hint = " ",
      },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
      padding = { right = 1, left = 1 },
    })

    -- git diffs
    sec_right({
      "diff",
      symbols = { added = " ", modified = "柳", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
      padding = { right = 1, left = 1 },
    })

    sec_right({
      function()
        return "﯑ %3{codeium#GetStatusString()}"
      end,
      color = { fg = colors.grey },
    })
    sec_right({
      "filesize",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.bg3 },
    })

    sec_right({
      "location",
      color = { fg = colors.bg3 },
    })
    sec_right({
      function()
        return ""
      end,
      color = "Comment"
      -- color = { fg = colors.yellow, bg = colors.bg },
    })

    -- branch
    sec_right({
      "branch",
      -- icon = { "", align = "left" },
      -- color = { fg = colors.yellow, ng = colors.bg },
      color = "Comment",
      padding = { right = 1, left = 0 },
    })

    lualine.setup(config)
  end,
}
