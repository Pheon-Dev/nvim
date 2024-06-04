local M = {}

M.opts = {}

M.config = function()
  -- Use all the below defaults, but set a custom keybind
  -- require("rabbit").setup("any keybind")

  local theme = require("core.colors")

  -- Defaults
  require("rabbit").setup({
    colors = {
      title = { -- Title text
        -- fg = theme.color99, -- Grabs from :hi Normal
        bold = true,
      },
      index = { -- Index numbers
        -- fg = theme.color100, -- Grabs from :hi Comment
        italic = true,
      },
      -- dir = "#000000", -- Folders; Grabs from :hi NonText

      -- file = "#000000", -- File name; Grabs from :hi Normal

      term = { -- Addons, eg :term or :Oil
        -- fg = "#000000", -- Grabs from :hi Constant
        italic = true,
      },
      noname = { -- No buffer name set
        -- fg = "#000000", -- Grabs from :hi Function
        italic = true,
      },
    },

    window = {
      -- If `box_style` is specified, it will overwrite anything set in `box`
      box_style = "round", -- One of "round", "square", "thick", "double"
      box = {
        top_left = "╭", -- Top left corner of box
        top_right = "╮", -- Top right corner of box
        bottom_left = "╰", -- Bottom left corner of box
        bottom_right = "╯", -- Bottom right corner of box
        vertical = "│", -- Vertical wall
        horizontal = "─", -- Horizontal ceiling
        emphasis = "═", -- Emphasis around title, like `──══ Rabbit ══──`
      },

      width = 64, -- Width, in columns
      height = 24, -- Height, in rows

      -- Where the plugin name should be displayed.
      -- * "bottom" means in the bottom left corner, but not displayed in full screen
      -- * "title" means next to rabbit, eg `──══ Rabbit History ══──`
      -- * "hide" means to not display it at all
      plugin_name_position = "bottom",

      title = "Rabbit", -- Title text, eg: `──══ Rabbit ══──` or `──══ NotHarpoon ══──`

      emphasis_width = 8, -- Eg: `──────══ Rabbit ══──────` or `──══════ Rabbit ══════──`

      --[[ float = true, -- Plain `true` means use bottom right corner
      float = {
        top = 10000, -- Top offset in lines
        left = 10000, -- Left offset in columns
      }, ]]
      float = {
        "bottom", -- "top" or "bottom;" MUST BE FIRST
        "right", -- "left" or "right;" MUST BE LAST
      },

      -- When using split screen, it will try to use the width and height provided earlier.
      -- Eg, when splitting left or right: height = 100%; width = `width`
      -- Eg, when splitting above or below: height = `height`; width = 100%
      -- NOTE: `float` must be explicitly set to false in order to split
      -- NOTE: If both `float` and `split` are false, a new buffer will open, "fullscreen"
      -- split = true, -- Plain `true` means use the right side
      split = "right", -- One of "left", "right", "above", "below"

      overflow = ":::", -- String to display when folders overflow
      path_len = 12, -- How many characters to display in folder name before cutting off
    },

    default_keys = {
      close = { -- Default bindings to close Rabbit
        "<Esc>",
        "q",
        "<leader>",
      },

      select = { -- Default bindings to select a buffer
        "<CR>",
      },

      open = { -- Default bindings to open Rabbit
        "<leader>r",
      },

      file_add = { -- Default bindings to add current buffer to persistent history
        "a", -- This would act like Prime's Harpoon, but it isn't implemented yet
      },

      file_del = { -- Default bindings to remove current buffer from persistent history
        "d", -- This would act like Prime's Harpoon, but it isn't implemented yet
      },
    },

    plugin_opts = { -- Plugin specific options you'd like to set
      history = {
        color = "#d7827e", -- Border color
        switch = "r", -- Keybind to switch to the history window from within Rabbit
        keys = {}, -- See the API for more details
        opts = {}, -- See the API for more details
      },
      reopen = {
        color = "#907aa9", -- Border color
        switch = "o", -- Keybind to switch to the reopen window from within Rabbit
        keys = {}, -- See the API for more details
        opts = {}, -- See the API for more details
      },
    },

    enable = { -- Builtin plugins to enable immediately
      "history", -- The plugin shown when opening Rabbit
      "reopen",
      "oxide",
    },
  })
end

return M
