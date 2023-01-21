return {
  {
    "ray-x/go.nvim",
    --[[ event = "VeryLazy", ]]
    dependencies = {
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup()
    end,
  },
  "nsf/gocode",
  {
    "olexsmir/gopher.nvim",
    --[[ event = "VeryLazy", ]]
    config = function()
      require("gopher").setup({
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "~/go/bin/gotests", -- also you can set custom command path
          impl = "impl",
          iferr = "iferr",
        },
      })
    end,
  },
  {
    "crusj/structrue-go.nvim",
    --[[ event = "VeryLazy", ]]
    branch = "main",
    config = function()
      require("structrue-go").setup({
        show_others_method = true, -- bool show methods of struct whose not in current file
        show_filename = true, -- bool
        number = "no", -- show number: no | nu | rnu
        fold_open_icon = " ",
        fold_close_icon = " ",
        cursor_symbol_hl = "guibg=#21222c guifg=#c8d3f5", -- symbol hl under cursor,
        indent = "┠", -- Hierarchical indent icon, nil or empty will be a tab
        position = "botright", -- window position,default botright,also can set float
        symbol = { -- symbol style
          filename = {
            hl = "guifg=#bd93f9", -- highlight symbol
            icon = " ", -- symbol icon
          },
          package = {
            hl = "guifg=#bd93f9",
            icon = " ",
          },
          import = {
            hl = "guifg=#bd93f9",
            icon = " ◈ ",
          },
          const = {
            hl = "guifg=#E44755",
            icon = " π ",
          },
          variable = {
            hl = "guifg=#50fa7b",
            icon = " ◈ ",
          },
          func = {
            hl = "guifg=#ff9c33",
            icon = "  ",
          },
          interface = {
            hl = "guifg=#8be9fd",
            icon = "❙ ",
          },
          type = {
            hl = "guifg=#8be9fd",
            icon = "▱ ",
          },
          struct = {
            hl = "guifg=#8be9fd",
            icon = "❏ ",
          },
          field = {
            hl = "guifg=#ff9c33",
            icon = " ▪ ",
          },
          method_current = {
            hl = "guifg=#ff9c33",
            icon = " ƒ ",
          },
          method_others = {
            hl = "guifg=#ff9c33",
            icon = "  ",
          },
        },
        keymap = {
          toggle = "<leader>go", -- toggle structure-go window
          show_others_method_toggle = "H", -- show or hidden the methods of struct whose not in current file
          symbol_jump = "l", -- jump to then symbol file under cursor
          --[[ center_symbol = "p", -- Center the highlighted symbol ]]
          fold_toggle = "h",
          refresh = "R", -- refresh symbols
          preview_open = "J", -- preview  symbol context open
          preview_close = "K", -- preview  symbol context close
        },
        fold = { -- fold symbols
          import = true,
          const = false,
          variable = false,
          type = false,
          interface = false,
          func = false,
        },
      })
    end,
  },
}