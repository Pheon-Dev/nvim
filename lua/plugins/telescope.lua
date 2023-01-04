return {
  -- fuzzy finder
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = function()
    local actions = require("telescope.actions")
    --[[ local fb_actions = require("telescope").extensions.file_browser.actions ]]

    require("telescope").setup({
      defaults = {
        hidden = true,
        find_command = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "   ",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "vertical",
        layout_config = {
          horizontal = { mirror = false },
          vertical = { mirror = false },
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" }, -- "smart"
        winblend = 0,
        border = {}, --[[ borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, ]]
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        extensions = {
          --[[ file_browser = { ]]
          --[[   theme = "ivy", ]]
          --[[   hijack_netrw = true, ]]
          --[[   mappings = { ]]
          --[[     ["i"] = { ]]
          --[[       ["<C-h>"] = fb_actions.goto_home_dir, ]]
          --[[     }, ]]
          --[[     ["n"] = { ]]
          --[[     }, ]]
          --[[   }, ]]
          --[[ }, ]]
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default + actions.center,
            ["<C-l>"] = actions.select_default + actions.center,
          },
          n = {
            ["h"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["l"] = actions.select_default + actions.center,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-e>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        buffers = {
          theme = "dropdown",
          initial_mode = "normal",
          previewer = false,
        },
        lsp_references = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_definitions = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_declarations = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_implementations = {
          theme = "ivy",
          initial_mode = "normal",
        },
      },
    })

    --[[ require("telescope").load_extension("noice") ]]
    --[[ require("telescope").load_extension("file_browser") ]]
    --[[ require("telescope").load_extension("notify") ]]
    --[[ require("telescope").load_extension("harpoon") ]]

    local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)

    local purple0 = "#777777"
    local purple1 = "#292e42"
    local purple2 = "#282a36"
    local bg = "#21222c"
    local red1 = "#ff5555"
    local green1 = "#50fa7b"
    local blue2 = "#bd93f9"

    ----------------------------------------------------------------------
    --                              Prompt                              --
    ----------------------------------------------------------------------
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", {
      fg = purple2,
      bg = purple2,
    })

    vim.api.nvim_set_hl(0, "TelescopePromptNormal", {
      fg = blue2,
      bg = purple2,
    })

    vim.api.nvim_set_hl(0, "TelescopePromptTitle", {
      fg = bg,
      bg = blue2,
    })

    vim.api.nvim_set_hl(0, "TelescopePromptCounter", {
      fg = blue2,
      bg = purple2,
    })

    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {
      fg = blue2,
      bg = purple2,
    })

    ----------------------------------------------------------------------
    --                              Result                              --
    ----------------------------------------------------------------------
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {
      fg = purple2,
      bg = purple2,
    })

    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {
      fg = normal_hl.foreground,
      bg = purple2,
    })

    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {
      --[[ fg = normal_hl.foreground, ]]
      fg = bg,
      bg = green1,
    })

    vim.api.nvim_set_hl(0, "TelescopeSelection", {
      fg = vim.api.nvim_get_hl_by_name("TelescopeSelection", true).foreground,
      bg = purple1,
    })

    vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {
      fg = purple0,
      bg = purple1,
    })

    ----------------------------------------------------------------------
    --                             Preview                              --
    ----------------------------------------------------------------------

    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {
      fg = purple1,
      bg = purple1,
    })

    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {
      fg = normal_hl.foreground,
      bg = purple1,
    })

    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {
      fg = bg,
      bg = red1,
    })

    vim.api.nvim_set_hl(0, "TelescopePreviewLine", {
      fg = normal_hl.foreground,
      bg = purple2,
    })

    vim.api.nvim_set_hl(0, "TelescopePreviewMatch", {
      fg = normal_hl.foreground,
      bg = purple1,
    })

    --[[ TelescopeSelection ]]
    --[[ TelescopeSelectionCaret ]]
    --[[ TelescopeMultiSelection ]]
    --[[ TelescopeMultiIcon ]]
    --[[]]
    --[[ -- "Normal" in the floating windows created by telescope. ]]
    --[[ TelescopeNormal ]]
    --[[ TelescopePreviewNormal ]]
    --[[ TelescopePromptNormal ]]
    --[[ TelescopeResultsNormal ]]
    --[[]]
    --[[ -- Border highlight groups. ]]
    --[[ --   Use TelescopeBorder to override the default. ]]
    --[[ --   Otherwise set them specifically ]]
    --[[ TelescopeBorder ]]
    --[[ TelescopePromptBorder ]]
    --[[ TelescopeResultsBorder ]]
    --[[ TelescopePreviewBorder ]]
    --[[]]
    --[[ -- Title highlight groups. ]]
    --[[ --   Use TelescopeTitle to override the default. ]]
    --[[ --   Otherwise set them specifically ]]
    --[[ TelescopeTitle ]]
    --[[ TelescopePromptTitle ]]
    --[[ TelescopeResultsTitle ]]
    --[[ TelescopePreviewTitle ]]
    --[[]]
    --[[ TelescopePromptCounter ]]
    --[[]]
    --[[ -- Used for highlighting characters that you match. ]]
    --[[ TelescopeMatching ]]
    --[[]]
    --[[ -- Used for the prompt prefix ]]
    --[[ TelescopePromptPrefix ]]
    --[[]]
    --[[ -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer) ]]
    --[[ TelescopePreviewLine ]]
    --[[ TelescopePreviewMatch ]]
    --[[]]
    --[[ TelescopePreviewPipe ]]
    --[[ TelescopePreviewCharDev ]]
    --[[ TelescopePreviewDirectory ]]
    --[[ TelescopePreviewBlock ]]
    --[[ TelescopePreviewLink ]]
    --[[ TelescopePreviewSocket ]]
    --[[ TelescopePreviewRead ]]
    --[[ TelescopePreviewWrite ]]
    --[[ TelescopePreviewExecute ]]
    --[[ TelescopePreviewHyphen ]]
    --[[ TelescopePreviewSticky ]]
    --[[ TelescopePreviewSize ]]
    --[[ TelescopePreviewUser ]]
    --[[ TelescopePreviewGroup ]]
    --[[ TelescopePreviewDate ]]
    --[[ TelescopePreviewMessage ]]
    --[[ TelescopePreviewMessageFillchar ]]
    --[[]]
    --[[ -- Used for Picker specific Results highlighting ]]
    --[[ TelescopeResultsClass ]]
    --[[ TelescopeResultsConstant ]]
    --[[ TelescopeResultsField ]]
    --[[ TelescopeResultsFunction ]]
    --[[ TelescopeResultsMethod ]]
    --[[ TelescopeResultsOperator ]]
    --[[ TelescopeResultsStruct ]]
    --[[ TelescopeResultsVariable ]]
    --[[]]
    --[[ TelescopeResultsLineNr ]]
    --[[ TelescopeResultsIdentifier ]]
    --[[ TelescopeResultsNumber ]]
    --[[ TelescopeResultsComment ]]
    --[[ TelescopeResultsSpecialComment ]]
    --[[]]
    --[[ -- Used for git status Results highlighting ]]
    --[[ TelescopeResultsDiffChange ]]
    --[[ TelescopeResultsDiffAdd ]]
    --[[ TelescopeResultsDiffDelete ]]
    --[[ TelescopeResultsDiffUntracked ]]

    local theme = {
      color29 = "#565656",
      color85 = "#808080",
      color92 = "#777777",
      color63 = "#1e2030",
      color57 = "#1f2335",
      color0 = "#21222c",
      color64 = "#222436",
      color58 = "#24283b",
      color1 = "#282a36",
      color59 = "#292e42",
      color65 = "#2f334d",
      color61 = "#3b4261",
      color60 = "#414868",
      color66 = "#444a73",
      color2 = "#44475a",
      color24 = "#545c7e",
      color36 = "#394b70",
      color28 = "#565f89",
      color68 = "#828bb8",
      color69 = "#7a88cf",
      color26 = "#737aa2",
      color3 = "#6272a4",
      color62 = "#3d59a1",
      color70 = "#3e68d7",
      color67 = "#c8d3f5",
      color22 = "#c0caf5",
      color23 = "#a9b1d6",
      color21 = "#f8f8f2",
      color83 = "#8aa2f7",
      color71 = "#82aaff",
      color72 = "#86e1fc",
      color73 = "#65bcff",
      color79 = "#41a6b5",
      color90 = "#51afef",
      color55 = "#536c9e",
      color38 = "#1098f8",
      color19 = "#8be9fd",
      color47 = "#41a6b5",
      color84 = "#10f0f0",
      color18 = "#26d7fd",
      color6 = "#8be9fd",
      color32 = "#2ac3de",
      color30 = "#7dcfff",
      color31 = "#6790eb",
      color33 = "#0db9d7",
      color34 = "#89ddff",
      color35 = "#b4f9f8",
      color37 = "#7aa2f7",
      color20 = "#b1f0fd",
      color54 = "#266d6a",
      color51 = "#1abc9c",
      color12 = "#96faaf",
      color7 = "#50fa7b",
      color13 = "#0dfa49",
      color17 = "#59b690",
      color48 = "#62ff00",
      color49 = "#73daca",
      color50 = "#9ece6a",
      color80 = "#4fd6be",
      color78 = "#c3e88d",
      color89 = "#A9FF68",
      color25 = "#c678dd",
      color5 = "#bd93f9",
      color8 = "#ffa6d9",
      color4 = "#ff33a8",
      color15 = "#ff79c6",
      color14 = "#8c42ab",
      color27 = "#ff8fff",
      color39 = "#bb9af7",
      color40 = "#ff007c",
      color74 = "#fca7ea",
      color75 = "#c099ff",
      color91 = "#D484FF",
      color86 = "#a9a1e1",
      color41 = "#c66bfe",
      color42 = "#9d7cd8",
      color43 = "#c34bfe",
      color44 = "#ff9e64",
      color9 = "#ffd4a6",
      color10 = "#ffb86c",
      color11 = "#ff9c33",
      color77 = "#ffc777",
      color88 = "#F79000",
      color45 = "#f1fa8c",
      color46 = "#e0af68",
      color76 = "#ff966c",
      color52 = "#db4b4b",
      color16 = "#ff5555",
      color81 = "#ff757f",
      color82 = "#c53b53",
      color87 = "#ec5f67",
      color53 = "#f7768e",
      color56 = "#b2555b",
    }
  end,
}
