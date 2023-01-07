return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--[[ require("tokyonight").setup() ]]
			vim.g.style = "storm" -- night, day, night, moon
			vim.o.background = "dark"
			--[[ vim.g.tokyonight_transparent = true ]]

			local theme = require("config.colors")

			require("tokyonight.colors").default = {
				none = "NONE",
				bg_dark = theme.color0,
				bg = theme.color0,
				bg_highlight = theme.color1,
				terminal_black = theme.color0,
				fg = theme.color22,
				fg_dark = theme.color23,
				fg_gutter = theme.color2,
				dark3 = theme.color2,
				comment = theme.color3,
				dark5 = theme.color3,
				blue0 = theme.color29,
				blue = theme.color5,
				cyan = theme.color30,
				blue1 = theme.color32,
				blue2 = theme.color33,
				blue5 = theme.color34,
				blue6 = theme.color35,
				blue7 = theme.color36,
				magenta = theme.color39,
				magenta2 = theme.color40,
				purple = theme.color43,
				orange = theme.color10,
				yellow = theme.color45,
				green = theme.color7,
				green1 = theme.color37,
				green2 = theme.color47,
				teal = theme.color51,
				red = theme.color16,
				red1 = theme.color52,
				git = {
					add = theme.color54,
					change = theme.color55,
					delete = theme.color56,
				},
				gitSigns = {
					add = theme.color54,
					change = theme.color55,
					delete = theme.color56,
				},
			}

			vim.cmd("colorscheme tokyonight")

			vim.api.nvim_set_hl(0, "Visual", { bg = theme.color2 })
			--[[ vim.api.nvim_set_hl(0, "Cursor", { bg = theme.color74 }) ]]
			vim.api.nvim_set_hl(0, "IncSearch", { fg = theme.color0, bg = theme.color25 })

			--[[ Dashboard ]]
			vim.api.nvim_set_hl(0, "DashboardHeader", { fg = theme.color3 })
			vim.api.nvim_set_hl(0, "DashboardCenter", { fg = theme.color83 })
			--[[ vim.api.nvim_set_hl(0, "DashboardFooter", { fg = theme.color83 }) ]]
			--[[ vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = theme.color83 }) ]]
			--[[ vim.api.nvim_set_hl(0, "WinBar", { fg = theme.color83, bg = theme.color0 }) ]]
			--[[ vim.api.nvim_set_hl(0, "WinBarNC", { fg = theme.color83, bg = theme.color0 }) ]]

			--[[ Lir ]]
			vim.api.nvim_set_hl(0, "LirFloatNormal", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "LirFloatCursorLine", { bg = theme.color2 })
			vim.api.nvim_set_hl(0, "LirFloatBorder", { fg = theme.color1, bg = theme.color1 })

			--[[ Harpoon ]]
			vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = theme.color1, bg = theme.color1 })
			vim.api.nvim_set_hl(0, "Harpoon", { fg = theme.color3, bg = theme.color0 })
			--[[ vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = theme.color4, bg = theme.color8 }) ]]

			--[[ CMP ]]
			--[[ vim.api.nvim_set_hl(0, "PmenuThumb", { fg = theme.color59, bg = theme.color59 }) ]]
			vim.api.nvim_set_hl(0, "Blame", { fg = theme.color3, bg = theme.color1 })
			vim.api.nvim_set_hl(0, "CmpPmenu", { bg = theme.color0 })
			vim.api.nvim_set_hl(0, "PmenuSel", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "CmpBorder", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = theme.color2, bg = theme.color0 })

			--[[ Noice ]]
			vim.api.nvim_set_hl(0, "NoiceConfirm", { bg = theme.color2 })
			vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = theme.color2, bg = theme.color2 })

			vim.api.nvim_set_hl(0, "NoicePopup", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = theme.color93, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = theme.color93, bg = theme.color93 })

			vim.api.nvim_set_hl(0, "NoiceCmdline", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = theme.color93, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = theme.color93, bg = theme.color93 })

			--[[ Matchup ]]
			--[[ vim.api.nvim_set_hl(0, "MatchParen", { fg = theme.color89 }) ]]
			--[[ vim.api.nvim_set_hl(0, "MatchWord", { fg = theme.color89 }) ]]
			--[[ vim.api.nvim_set_hl(0, "MatchParenCur", { fg = theme.color89 }) ]]
			--[[ vim.api.nvim_set_hl(0, "MatchWordCur", { fg = theme.color89 }) ]]

			--[[ Notify ]]
			vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = theme.color93, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = theme.color93, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = theme.color93, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = theme.color93, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = theme.color93, bg = theme.color93 })

			vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = theme.color87, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = theme.color88, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = theme.color89, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = theme.color90, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = theme.color91, bg = theme.color93 })

			vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = theme.color87, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = theme.color88, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = theme.color89, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = theme.color90, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = theme.color91, bg = theme.color93 })

			vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "NotifyTRACEBody", { bg = theme.color93 })

			--[[ Blankline ]]
			vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = theme.color1 })
			vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = theme.color2 })

			--[[ Yanky ]]
			vim.api.nvim_set_hl(0, "YankyYanked", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "YankyPut", { bg = theme.color4 })

			--[[ Popup ]]
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = theme.color1, bg = theme.color1 })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = theme.color1 })

			--[[ Fold ]]
			vim.api.nvim_set_hl(0, "Folded", { bg = theme.color93 })

			--[[ Reach ]]
			vim.api.nvim_set_hl(0, "ReachBorder", { fg = theme.color2, bg = theme.color0 })
			vim.api.nvim_set_hl(0, "ReachMarkLocation", { fg = theme.color4 })
			vim.api.nvim_set_hl(0, "ReachHandleMarkLocal", { fg = theme.color7, bg = theme.color0 })

			vim.api.nvim_set_hl(0, "ReachMark", { fg = theme.color23, bg = theme.color0 })

			--[[ vim.api.nvim_set_hl(0, "ReachCurrent", { bg = theme.color42 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachMatchExact", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vij.api.nvim_set_hl(0, "ReachPriority", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachDirectory", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachModifiedIndicator", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachHandleBuffer", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachHandleDelete", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachHandleSplit", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachTail", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachHandleMarkGlobal", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachHandleTabpage", { fg = theme.color1, bg = theme.color1 }) ]]
			--[[ vim.api.nvim_set_hl(0, "ReachGrayOut", { fg = theme.color1, bg = theme.color1 }) ]]

			--[[ ReachBorder             -> 'Comment' ]]
			--[[ ReachDirectory          -> 'Directory' ]]
			--[[ ReachModifiedIndicator  -> 'String' ]]
			--[[ ReachHandleBuffer       -> 'String' ]]
			--[[ ReachHandleDelete       -> 'Error' ]]
			--[[ ReachHandleSplit        -> 'Directory' ]]
			--[[ ReachTail               -> 'Normal' ]]
			--[[ ReachHandleMarkLocal    -> 'Type' ]]
			--[[ ReachHandleMarkGlobal   -> 'Number' ]]
			--[[ ReachMark               -> 'Normal' ]]
			--[[ ReachMarkLocation       -> 'Comment' ]]
			--[[ ReachHandleTabpage      -> 'TabLineSel' ]]
			--[[ ReachGrayOut            -> 'Comment' ]]
			--[[ ReachMatchExact         -> 'String' ]]
			--[[ ReachPriority           -> 'Special' ]]
			--[[ ReachCurrent            -> 'Title' ]]

			--[[ Virt-Column ]]
			vim.api.nvim_set_hl(0, "ColorColumn", { bg = theme.color1 })

			--[[ Glances ]]
			vim.api.nvim_set_hl(0, "GlancePreviewNormal", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "GlancePreviewMatch", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "GlancePreviewCursorLine", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "GlancePreviewSignColumn", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "GlancePreviewEndOfBuffer", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "GlancePreviewLineNr", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "GlancePreviewBorderBottom", { bg = theme.color0 })
			vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { fg = theme.color27, bg = theme.color93 })
			vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "GlanceListNormal", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "GlanceListFilename", { fg = theme.color89 })
			vim.api.nvim_set_hl(0, "GlanceListFilepath", { fg = theme.color5 })
			vim.api.nvim_set_hl(0, "GlanceListCount", { fg = theme.color7 })
			vim.api.nvim_set_hl(0, "GlanceListMatch", { fg = theme.color25 })
			vim.api.nvim_set_hl(0, "GlanceListCursorLine", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "GlanceListEndOfBuffer", { bg = theme.color93 })
			vim.api.nvim_set_hl(0, "GlanceListBorderBottom", { bg = theme.color0 })
			vim.api.nvim_set_hl(0, "GlanceFoldIcon", { fg = theme.color69 })
			--[[ vim.api.nvim_set_hl(0, "GlanceIndent", { bg = theme.color93 }) ]]
			vim.api.nvim_set_hl(0, "GlanceBorderTop", { bg = theme.color0 })

			--[[ Navigator ]]
			--[[ vim.api.nvim_set_hl(0, "GuihuaTextViewDark ", { fg = theme.color98, bg = theme.color95 }) ]]
			--[[ vim.api.nvim_set_hl(0, "GuihuaListDark ", { fg = theme.color98, bg = theme.color61 }) ]]
			--[[ vim.api.nvim_set_hl(0, "GuihuaListHl ", { fg = theme.color98, bg = theme.color97 }) ]]

			--[[ bqf ]]
			--[[ vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { fg = theme.color27, bg = theme.color93 }) ]]
			vim.api.nvim_set_hl(0, "BqfPreviewFloat", { bg = theme.color1 })
			vim.api.nvim_set_hl(0, "BqfPreviewBorder", { fg = theme.color1, bg = theme.color1 })
			--[[ vim.api.nvim_set_hl(0, "BqfPreviewCursor", { fg = theme.color27, bg = theme.color93 }) ]]
			--[[ vim.api.nvim_set_hl(0, "BqfPreviewRange", { fg = theme.color27, bg = theme.color93 }) ]]
			--[[ vim.api.nvim_set_hl(0, "BqfPreviewCountLabel", { fg = theme.color27, bg = theme.color93 }) ]]
			--[[ vim.api.nvim_set_hl(0, "BqfSign", { fg = theme.color27, bg = theme.color93 }) ]]

			-- Give window borders a "portal" feel
			vim.api.nvim_set_hl(0, "PortalBorder", { fg = "#fab387" })
			vim.api.nvim_set_hl(0, "PortalBorderNone", { fg = "#89b4fa" })

			-- Telescope
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
				fg = normal_hl.foreground,
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
		end,
	},
}
