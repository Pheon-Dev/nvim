return {
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      require("todo-comments").setup({
        signs = true,      -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = " ",                              -- icon used for the sign, and in search results
            color = "error",                            -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
          fg = "NONE",         -- The gui style to use for the fg highlight group.
          bg = "BOLD",         -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          multiline = true,                -- enable multine todo comments
          multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
          before = "",                     -- "fg" or "bg" or empty
          keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg",                    -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
          comments_only = true,            -- uses treesitter to match keywords in comments only
          max_line_len = 400,              -- ignore lines longer than this
          exclude = {},                    -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" },
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    config = function()
      require("Comment").setup({
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = "gcc",
          ---Block-comment toggle keymap
          block = "gbc",
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = "gc",
          ---Block-comment keymap
          block = "gb",
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = "gcO",
          ---Add comment on the line below
          below = "gco",
          ---Add comment at the end of line
          eol = "gcA",
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        ---Function to call after (un)comment
        post_hook = nil,
        ---Function to call before (un)comment
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        -- pre_hook = function(ctx)
        -- 	local U = require("Comment.utils")
        --
        -- 	local location = nil
        -- 	if ctx.ctype == U.ctype.block then
        -- 		location = require("ts_context_commentstring.utils").get_cursor_location()
        -- 	elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        -- 		location = require("ts_context_commentstring.utils").get_visual_start_location()
        -- 	end
        --
        -- 	return require("ts_context_commentstring.internal").calculate_commentstring({
        -- 		key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
        -- 		location = location,
        -- 	})
        -- end,
      })
    end,
  },
}
