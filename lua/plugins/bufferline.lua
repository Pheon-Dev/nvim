return {
  "akinsho/nvim-bufferline.lua",
  event = "BufReadPre",
  -- event = "BufAdd",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal",
        -- -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        -- -- @deprecated, please specify numbers as a function to customize the styling
        -- -- number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
        -- close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        -- right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        -- left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        -- middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        -- -- NOTE: this plugin is designed with this icon in mind,
        -- -- and so changing this is NOT recommended, this is intended
        -- -- as an escape hatch for people who cannot bear it for whatever reason
        indicator = {
          -- icon = "﯑ ",
          -- icon = "|",
          style = "none", -- none, icon, underline
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        -- --- name_formatter can be used to change the buffer's label in the bufferline.
        -- --- Please note some names can/will break the
        -- --- bufferline so use this at your discretion knowing that it has
        -- --- some limitations that will *NOT* be fixed.
        -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        --   -- remove extension from markdown files for example
        --   if buf.name:match('%.md') then
        --     return vim.fn.fnamemodify(buf.name, ':t:r')
        --   end
        -- end,
        -- max_name_length = 18,
        -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        -- tab_size = 18,
        diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        diagnostics_indicator = function(count)
          return "(" .. count .. ")"
        end,
        -- -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number, buf_numbers)
        --   -- filter out filetypes you don't want to see
        --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --     return true
        --   end
        --   -- filter out by buffer name
        --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --     return true
        --   end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --     return true
        --   end
        --   -- filter out by it's index number in list (don't show first buffer)
        --   if buf_numbers[1] ~= buf_number then
        --     return true
        --   end
        -- end,
        -- offsets = { { filetype = "NvimTree", text = "Nvim-Tree" } },
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- -- can also be a table containing 2 custom separators
        -- -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = "id",
        -- -- | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        -- --   -- add custom logic
        -- --   return buffer_a.modified > buffer_b.modified
        -- -- end
      },
      highlights = {
        fill = {
          fg = "#44475a",
          bg = "#21222c",
        },
        background = {
          fg = "#44475a",
          bg = "#21222c",
        },
        tab_separator = {
          fg = "#21222c",
          bg = "#21222c",
        },
        tab_separator_selected = {
          fg = "#21222c",
          bg = "#21222c",
        },
        tab = {
          fg = "#44475a",
          bg = "#21222c",
        },
        tab_selected = {
          fg = "#a9b1d6",
          bg = "#21222c",
        },
        tab_close = {
          fg = "#44475a",
          bg = "#21222c",
        },
        close_button = {
          fg = "#3f3f3f",
          bg = "#21222c",
        },
        close_button_visible = {
          fg = "#3f3f3f",
          bg = "#21222c",
        },
        close_button_selected = {
          fg = "#44475a",
          bg = "#21222c",
        },
        buffer_visible = {
          fg = "#545c7e",
          bg = "#21222c",
        },
        buffer_selected = {
          fg = "#82aaff",
          bg = "#21222c",
          bold = true,
          italic = true,
        },
        numbers = {
          fg = "#44475a",
          bg = "#21222c",
        },
        numbers_visible = {
          fg = "#44475a",
          bg = "#21222c",
        },
        numbers_selected = {
          fg = "#82aaff",
          bg = "#21222c",
          bold = true,
          italic = true,
        },
        diagnostic = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
        },
        diagnostic_visible = {
          --[[ fg = "#eb9af7", ]]
          bg = "#21222c",
        },
        diagnostic_selected = {
          --[[ fg = "#eb9af7", ]]
          bg = "#21222c",
          bold = true,
          italic = true,
        },
        hint = {
          --[[ fg = "#44475a", ]]
          sp = "#21222c",
          bg = "#21222c",
        },
        hint_visible = {
          --[[ fg = "#62ff00", ]]
          bg = "#21222c",
        },
        hint_selected = {
          --[[ fg = "#62ff00", ]]
          bg = "#21222c",
          sp = "#21222c",
          bold = true,
          italic = true,
        },
        hint_diagnostic = {
          --[[ fg = "#44475a", ]]
          sp = "#21222c",
          bg = "#21222c",
        },
        hint_diagnostic_visible = {
          --[[ fg = "#c66bfe", ]]
          bg = "#21222c",
        },
        hint_diagnostic_selected = {
          --[[ fg = "#c66bfe", ]]
          bg = "#21222c",
          sp = "#21222c",
          bold = true,
          italic = true,
        },
        info = {
          --[[ fg = "#44475a", ]]
          sp = "#21222c",
          bg = "#21222c",
        },
        info_visible = {
          --[[ fg = "#62ff00", ]]
          bg = "#21222c",
        },
        info_selected = {
          --[[ fg = "#62ff00", ]]
          bg = "#21222c",
          sp = "#21222c",
          bold = true,
          italic = true,
        },
        info_diagnostic = {
          --[[ fg = "#44475a", ]]
          sp = "#21222c",
          bg = "#21222c",
        },
        info_diagnostic_visible = {
          --[[ fg = "#62ff00", ]]
          bg = "#21222c",
        },
        info_diagnostic_selected = {
          --[[ fg = "#62ff00", ]]
          bg = "#21222c",
          sp = "#21222c",
          bold = true,
          italic = true,
        },
        warning = {
          --[[ fg = "#44475a", ]]
          sp = "#21222c",
          bg = "#21222c",
        },
        warning_visible = {
          --[[ fg = "#e0af68", ]]
          bg = "#21222c",
        },
        warning_selected = {
          --[[ fg = "#e0af68", ]]
          bg = "#21222c",
          sp = "#21222c",
          bold = true,
          italic = true,
        },
        warning_diagnostic = {
          --[[ fg = "#44475a", ]]
          sp = "#21222c",
          bg = "#21222c",
        },
        warning_diagnostic_visible = {
          --[[ fg = "#e0af68", ]]
          bg = "#21222c",
        },
        warning_diagnostic_selected = {
          --[[ fg = "#e0af68", ]]
          bg = "#21222c",
          sp = "",
          bold = true,
          italic = true,
        },
        error = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          sp = "#21222c",
        },
        error_visible = {
          --[[ fg = "#f7768e", ]]
          bg = "#21222c",
        },
        error_selected = {
          --[[ fg = "#f7768e", ]]
          bg = "#21222c",
          sp = "#21222c",
          bold = true,
          italic = true,
        },
        error_diagnostic = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          sp = "#21222c",
        },
        error_diagnostic_visible = {
          --[[ fg = "#f7768e", ]]
          bg = "#21222c",
        },
        error_diagnostic_selected = {
          --[[ fg = "#f7768e", ]]
          bg = "#21222c",
          sp = "#21222c",
          bold = true,
          italic = true,
        },
        modified = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
        },
        modified_visible = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
        },
        modified_selected = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
        },
        duplicate_selected = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          italic = true,
        },
        duplicate_visible = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          italic = true,
        },
        duplicate = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          italic = true,
        },
        separator_selected = {
          fg = "#21222c",
          bg = "#21222c",
        },
        separator_visible = {
          fg = "#21222c",
          bg = "#21222c",
        },
        separator = {
          fg = "#21222c",
          bg = "#21222c",
        },
        indicator_visible = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
        },
        indicator_selected = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
        },
        pick_selected = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          bold = true,
          italic = true,
        },
        pick_visible = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          bold = true,
          italic = true,
        },
        pick = {
          --[[ fg = "#44475a", ]]
          bg = "#21222c",
          bold = true,
          italic = true,
        },
        offset_separator = {
          --[[ fg = "#21222c", ]]
          bg = "#21222c",
        },
      },
    })
  end,
}
