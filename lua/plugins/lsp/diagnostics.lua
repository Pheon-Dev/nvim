for name, icon in pairs(require("core.settings").icons.diagnostics) do
	name = "DiagnosticSign" .. name
	vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

local icons = {
	[vim.diagnostic.severity.ERROR] = "",
	[vim.diagnostic.severity.WARN] = "",
	[vim.diagnostic.severity.INFO] = "",
	[vim.diagnostic.severity.HINT] = "󰌶",
}

vim.diagnostic.config({
	-- underline = false,
	update_in_insert = false,
	virtual_lines = false,
	severity_sort = true,
	-- No virtual text (distracting!), show popup window on hover.
	-- virtual_text = { spacing = 4, prefix = "●" },
	-- virtual_text = false,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
		prefix = vim.fn.has("nvim-0.10") > 0 and function(diagnostic) ---@param diagnostic Diagnostic
			return (icons[diagnostic.severity] or "") .. " "
		end,
	},
	underline = {
		-- Do not underline text when severity is low (INFO or HINT).
		-- severity = { min = vim.diagnostic.severity.WARN },
	},
	float = {
		source = "always",
		focusable = true,
		focus = false,
		border = "rounded",

		-- Customize how diagnostic message will be shown: show error code.
		format = function(diagnostic)
			-- See null-ls.nvim#632, neovim#17222 for how to pick up `code`
			local user_data
			user_data = diagnostic.user_data or {}
			user_data = user_data.lsp or user_data.null_ls or user_data
			local code = (
								-- TODO: symbol is specific to pylint (will be removed)
diagnostic.symbol
				or diagnostic.code
				or user_data.symbol
				or user_data.code
			)
			if code then
				return string.format("%s (%s)", diagnostic.message, code)
			else
				return diagnostic.message
			end
		end,
	},
})

_G.LspDiagnosticsShowPopup = function()
	return vim.diagnostic.open_float({ bufnr = 0, scope = "cursor" })
end

-- Show diagnostics in a pop-up window on hover
_G.LspDiagnosticsPopupHandler = function()
	local current_cursor = vim.api.nvim_win_get_cursor(0)
	local last_popup_cursor = vim.w.lsp_diagnostics_last_cursor or { nil, nil }

	-- Show the popup diagnostics window,
	-- but only once for the current cursor location (unless moved afterwards).
	if not (current_cursor[1] == last_popup_cursor[1] and current_cursor[2] == last_popup_cursor[2]) then
		vim.w.lsp_diagnostics_last_cursor = current_cursor
		local _, winnr = _G.LspDiagnosticsShowPopup()
		if winnr ~= nil then
			-- opacity/alpha for diagnostics
			vim.api.nvim_win_set_option(winnr, "winblend", 0)
		end
	end
end
vim.cmd([[
        augroup LSPDiagnosticsOnHover
          autocmd!
          autocmd CursorHold *   lua _G.LspDiagnosticsPopupHandler()
        augroup END
        ]])
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = false,
})

-- Redefine signs (:help diagnostic-signs) and highlights (:help diagnostic-highlights)
do
	vim.fn.sign_define(
		"DiagnosticSignError",
		{ text = icons[vim.diagnostic.severity.ERROR], texthl = "DiagnosticSignError" }
	)
	vim.fn.sign_define(
		"DiagnosticSignWarn",
		{ text = icons[vim.diagnostic.severity.WARN], texthl = "DiagnosticSignWarn" }
	)
	vim.fn.sign_define(
		"DiagnosticSignInfo",
		{ text = icons[vim.diagnostic.severity.INFO], texthl = "DiagnosticSignInfo" }
	)
	vim.fn.sign_define(
		"DiagnosticSignHint",
		{ text = icons[vim.diagnostic.severity.HINT], texthl = "DiagnosticSignHint" }
	)
end
-- require("utils.rc_utils").RegisterHighlights(function()
-- 	vim.cmd([[
--       hi DiagnosticSignError    guifg=#e6645f ctermfg=167
--       hi DiagnosticSignWarn     guifg=#b1b14d ctermfg=143
--       hi DiagnosticSignHint     guifg=#3e6e9e ctermfg=75
--
--       hi DiagnosticVirtualTextError   guifg=#a6242f  gui=italic,underdashed,underline
--       hi DiagnosticVirtualTextWarn    guifg=#777744  gui=italic,underdashed,underline
--       hi DiagnosticVirtualTextHint    guifg=#555555  gui=italic,underdashed,underline
--     ]])
-- end)
--
-- -- Turning on and off diagnostics
-- -- Disable default commands, assuming the plugin is always lazy-loaded
-- vim.g.toggle_lsp_diagnostics_loaded_install = 1
-- require("toggle_lsp_diagnostics").init(vim.diagnostic.config())
--
-- do
-- 	vim.cmd([[
--       command! DiagnosticsDisableBuffer       :lua vim.diagnostic.disable(0)
--       command! DiagnosticsEnableBuffer        :lua vim.diagnostic.enable(0)
--       command! DiagnosticsDisableAll          :lua vim.diagnostic.disable()
--       command! DiagnosticsEnableAll           :lua vim.diagnostic.enable()
--       command! DiagnosticsVirtualTextToggle   :lua require('toggle_lsp_diagnostics').toggle_diagnostic('virtual_text')
--       command! DiagnosticsUnderlineToggle     :lua require('toggle_lsp_diagnostics').toggle_diagnostic('underline')
--     ]])
-- end
