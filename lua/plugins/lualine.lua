return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "Pheon-Dev/pigeon" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local ok, lualine = pcall(require, "lualine")
    local pg, pigeon = pcall(require, "pigeon")
    local on, noice = pcall(require, "noice")

    if not ok then
      vim.notify("Lualine didn't load properly!", "error")
    end

    if not on then
      vim.notify("Noice didn't load properly!", "error")
    end

    if not pg then
      vim.notify("Pigeon didn't load properly!", "error")
    end

    local colors = {
      bg = "#21222c",
      bg1 = "#282a36",
      bg2 = "#44475a",
      bg3 = "#565f89",
      grey = "#a9a1e1",
      fg = "#bd93f9",
      yellow = "#f1fa8c",
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
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { statusline = { "alpha" }, winbar = { "alpha" } },
        component_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      statusline = {},
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local function wins_left(component)
      table.insert(config.winbar.lualine_c, component)
      table.insert(config.inactive_winbar.lualine_c, component)
    end

    local function wins_right(component)
      table.insert(config.winbar.lualine_x, component)
      table.insert(config.inactive_winbar.lualine_x, component)
    end

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    local theme = require("core.colors")
    local my_colors = {
      n = theme.color37, -- "#7aa2f7",
      i = theme.color89, -- "#bd93f9",
      c = theme.color50, -- "#10e070",
      v = theme.color43, -- "#c66bfe",
      V = theme.color43, -- "#966bfe",
      R = theme.color99, -- "#f62bfe"
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

    --[[ WINBAR ]]
    wins_left({
      function()
        return mode[vim.fn.mode()]
      end,
      -- "mode",
      color = function()
        return { fg = mode_color[vim.fn.mode()] }
      end,
      -- padding = { right = 1, left = 3 },
    })

    wins_left({
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
      -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = "", -- Text to show when the file is modified.
        readonly = "", -- Text to show when the file is non-modifiable or readonly.
        unnamed = "ﲃ", -- Text to show for unnamed buffers.
        newfile = "", -- Text to show for newly created file before first write
      },
    })

    wins_left({
      function()
        return "%="
      end,
    })

    wins_right({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
      padding = { right = 1, left = 2 },
    })

    wins_right({
      "diff",
      symbols = { added = " ", modified = "柳", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
      padding = { right = 2, left = 1 },
    })

    wins_right({
      function()
        return "  "
      end,
      color = { fg = theme.color20 },
    })

    -- Statusline
    ins_left({
      function()
        local enabled = require("pigeon.config").options.hostname.enabled
        local hostname = require("pigeon.hostname").hostname()

        return enabled and hostname or ""
      end,
      color = { fg = theme.color20 },
    })
    ins_left({
      "filetype",
      color = function()
        return { fg = mode_color[vim.fn.mode()] }
      end,
      icon_only = false,
      icon = { align = "left" },
      padding = { right = 1, left = 3 },
    })

    ins_left({
      function()
        return "%="
      end,
    })

    -- ins_right({
    --   function()
    --     local enabled = require("pigeon.config").options.cpu.enabled
    --     local cpu = require("pigeon.cpu")
    --
    --
    --     return enabled and cpu.cpu_load() or ""
    --   end,
    --   color = { fg = theme.color20 },
    -- })

    ins_right({
      function()
        local enabled = require("pigeon.config").options.datetime.enabled
        local datetime = require("pigeon.datetime")
        local time_enabled = require("pigeon.config").options.datetime.time.enabled

        local time = time_enabled and datetime.current_time() or ""

        return enabled and time or ""
      end,
      color = { fg = theme.color20 },
    })

    ins_right({
      function()
        local enabled = require("pigeon.config").options.datetime.enabled
        local datetime = require("pigeon.datetime")
        local date_enabled = require("pigeon.config").options.datetime.date.enabled

        local date = date_enabled and datetime.current_date() or ""

        return enabled and date or ""
      end,
      color = { fg = theme.color73 },
    })

    ins_right({
      function()
        local enabled = require("pigeon.config").options.datetime.enabled
        local datetime = require("pigeon.datetime")
        local day_enabled = require("pigeon.config").options.datetime.day.enabled

        local day = day_enabled and datetime.current_day() or ""

        return enabled and day or ""
      end,
      color = { fg = theme.color74 },
    })

    ins_right({
      function()
        local enabled = require("pigeon.config").options.battery.enabled
        local battery = require("pigeon.battery")

        local capacity = battery.battery_capacity()
        local charge = battery.battery_charge()
        local status = battery.battery_status()

        if enabled then
          return status .. capacity .. charge
        else
          return ""
        end
      end,
      color = { fg = colors.orange3 },
    })

    ins_right({
      function()
        local enabled = require("pigeon.config").options.internet.enabled
        local internet = require("pigeon.internet")

        local wifi = internet.wifi_status()
        local signal = internet.bit_rate()
        local essid = internet.wifi_essid()

        if enabled then
          return essid .. " " .. wifi .. " " .. signal
        else
          return ""
        end
      end,
      color = { fg = theme.color89 },
    })

    ins_right({
      function()
        local enabled = require("pigeon.config").options.ram.enabled
        local ram = require("pigeon.ram")
        local perc_enabled = require("pigeon.config").options.ram.show_percentage

        local total_ram = ram.total_ram()
        local used_ram = ram.used_ram()
        local perc_ram = ram.perc_ram()
        local icon = ram.ram_icon

        local result = icon .. " " .. used_ram .. "/" .. total_ram .. " "
        local perc_result = icon .. " " .. used_ram .. "/" .. total_ram .. " " .. "(" .. perc_ram .. ")"

        if enabled then
          return perc_enabled and perc_result or result
        else
          return ""
        end
      end,
      color = { fg = theme.color26 },
    })


    if on then
      ins_left({
        noice.api.statusline.mode.get,
        cond = noice.api.statusline.mode.has,
        color = { fg = colors.orange1 },
        padding = { right = 1, left = 1 },
      })
    end

    ins_right({
      require("lazy.status").updates,
      cond = require("lazy.status").has_updates,
      color = { fg = "#ff9e64" },
    })

    ins_right({
      function()
        return "﯑ %3{codeium#GetStatusString()}"
      end,
      color = { fg = colors.grey },
    })

    ins_right({
      "branch",
      icon = { "", align = "left" },
      color = { fg = colors.yellow },
      padding = { right = 1, left = 1 },
    })

    lualine.setup(config)
  end,
}
