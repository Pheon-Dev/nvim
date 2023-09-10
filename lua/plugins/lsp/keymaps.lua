local M = {}

function M.on_attach(client, buffer)
  local self = M.new(client, buffer)

  self:map("<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  self:map("<leader>cl", "LspInfo", { desc = "Lsp Info" })
  self:map("K", vim.lsp.buf.hover, { desc = "Hover" })
  self:map("]d", M.diagnostic_goto(true), { desc = "Next Diagnostic" })
  self:map("[d", M.diagnostic_goto(false), { desc = "Prev Diagnostic" })
  -- self:map("]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
  -- self:map("[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
  -- self:map("]w", M.diagnostic_goto(true, "WARNING"), { desc = "Next Warning" })
  -- self:map("[w", M.diagnostic_goto(false, "WARNING"), { desc = "Prev Warning" })

  vim.api.nvim_buf_set_option(buffer, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(buffer, "tagfunc", "v:lua.vim.lsp.tagfunc")

  self:map("<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" })
end

function M.new(client, buffer)
  return setmetatable({ client = client, buffer = buffer }, { __index = M })
end

function M:has(cap)
  return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
  opts = opts or {}
  if opts.has and not self:has(opts.has) then
    return
  end
  vim.keymap.set(
    opts.mode or "n",
    lhs,
    type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
    ---@diagnostic disable-next-line: no-unknown
    { silent = true, buffer = self.buffer, expr = opts.expr, desc = opts.desc }
  )
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M

-- local autocmd = vim.api.nvim_create_autocmd -- create autocmd
-- local utils = require("util")
-- local map = utils.map
-- local augroup = utils.augroup
--
-- -- map the following keys after the language server attaches to a buffer
-- -- See `:help vim.lsp.*` for doc mentation on any of the below functions
-- -- :lua =vim.lsp.get_active_clients()[1].server_capabilities to get capabilities of lsp attached to buffer
-- utils.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr }
--
--   if client.server_capabilities.hoverProvider then
--     map("n", "K", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga hover_doc]])
--       else
--         vim.lsp.buf.hover()
--       end
--     end, opts, "get hover info")
--   end
--   if client.server_capabilities.semanticTokensProvider then
--     map("n", "<localleader>us", function()
--       utils.toggle("enable_semantic_tokens", { global = true }, nil)
--       if vim.g["enable_semantic_tokens"] then
--         vim.lsp.semantic_tokens.start(bufnr, client.id)
--       else
--         vim.lsp.semantic_tokens.stop(bufnr, client.id)
--       end
--     end, opts, "toggle semantic token highlighting")
--   end
--   if client.server_capabilities.signatureHelpProvider then
--     map("n", "<localleader>k", vim.lsp.buf.signature_help, opts, "get fn signature help")
--   end
--   if client.server_capabilities.declarationProvider then
--     map("n", "<localleader>gD", vim.lsp.buf.declaration, opts, "goto declaration")
--   end
--   if client.server_capabilities.completionProvider then
--     vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
--   end
--   if client.server_capabilities.definitionProvider then
--     vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
--     map("n", "<localleader>gd", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga goto_definition]])
--       else
--         vim.lsp.buf.definition()
--       end
--     end, opts, "goto definition")
--
--     if utils.has("lspsaga.nvim") then
--       map("n", "<localleader>pd", function()
--         vim.cmd([[Lspsaga peek_definition]])
--       end, opts, "peek definition")
--     end
--   end
--   if client.server_capabilities.typeDefinitionProvider then
--     map("n", "<localleader>gt", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga goto_type_definition]])
--       else
--         vim.lsp.buf.type_definition()
--       end
--     end, opts, "goto type definition")
--
--     if utils.has("lspsaga.nvim") then
--       map("n", "<localleader>pt", function()
--         vim.cmd([[Lspsaga peek_type_definition]])
--       end, opts, "peek type definition")
--     end
--   end
--   if client.server_capabilities.implementationProvider then
--     map("n", "<localleader>gi", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga finder imp+def]])
--       else
--         vim.lsp.buf.implementation()
--       end
--     end, opts, "goto type implementation")
--   end
--   if client.server_capabilities.referencesProvider then
--     map("n", "<localleader>gr", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga finder ref]])
--       else
--         vim.lsp.buf.references({})
--       end
--     end, opts, "goto type references")
--   end
--   if client.server_capabilities.documentHighlightProvider then
--     vim.api.nvim_set_hl(0, "LspReferenceRead", {
--       link = "DiffText",
--     })
--     vim.api.nvim_set_hl(0, "LspReferenceText", {
--       link = "IncSearch",
--     })
--     vim.api.nvim_set_hl(0, "LspRefDiffTexterenceWrite", {
--       link = "WildMenu",
--     })
--     local doc_highlight = augroup("lsp_document_highlight")
--     local enable_highlight = function()
--       autocmd({ "CursorHold", "CursorHoldI" }, {
--         group = doc_highlight,
--         buffer = bufnr,
--         callback = vim.lsp.buf.document_highlight,
--       })
--       autocmd("CursorMoved", {
--         group = doc_highlight,
--         buffer = bufnr,
--         callback = vim.lsp.buf.clear_references,
--       })
--     end
--     local disable_highlight = function()
--       vim.lsp.buf.clear_references()
--       vim.api.nvim_clear_autocmds({
--         buffer = bufnr,
--         group = doc_highlight,
--       })
--     end
--     map("n", "<localleader>uh", function()
--       utils.toggle("highlight", {}, { enable_highlight, disable_highlight })
--       vim.b[vim.fn.bufnr()]["highlight"]()
--     end, opts, "toggle document highlight")
--   end
--   if client.server_capabilities.documentSymbolProvider then
--     map("n", "<localleader>ds", vim.lsp.buf.document_symbol, opts, "document symbols")
--   end
--   if client.server_capabilities.codeActionProvider then
--     map({ "n", "v" }, "<localleader>ca", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga code_action]])
--       else
--         vim.lsp.buf.code_action()
--       end
--     end, opts, "code action")
--   end
--   if client.server_capabilities.documentFormattingProvider then
--     map("n", "<localleader>uf", function()
--       utils.toggle("autoformat", { global = true })
--       autocmd("BufWritePre", {
--         group = augroup("LspFormat"),
--         callback = function()
--           if vim.g["autoformat"] then
--             vim.lsp.buf.format({ async = true })
--           end
--         end,
--       })
--     end, opts, "toggle autoformat")
--
--     map("n", "<localleader>f", function()
--       vim.lsp.buf.format({ async = true })
--     end, opts, "range format buffer")
--   end
--   if client.server_capabilities.documentRangeFormattingProvider then
--     map("v", "<localleader>f", function()
--       vim.lsp.buf.format({ async = true })
--     end, opts, "range format buffer")
--   end
--   if client.server_capabilities.renameProvider then
--     map("n", "<localleader>rn", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga rename]])
--       else
--         vim.lsp.buf.rename()
--       end
--     end, opts, "rename symbol")
--
--     if utils.has("lspsaga.nvim") then
--       map("n", "<localleader>rnw", function()
--         vim.cmd([[Lspsaga project_replace]])
--       end, opts, "rename across workspace")
--     end
--   end
--   if client.server_capabilities.callHierarchyProvider then
--     map("n", "<localleader>ci", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga incoming_calls]])
--       else
--         vim.lsp.buf.incoming_calls()
--       end
--     end, opts, "incoming calls")
--     map("n", "<localleader>co", function()
--       if utils.has("lspsaga.nvim") then
--         vim.cmd([[Lspsaga outgoing_calls]])
--       else
--         vim.lsp.buf.outgoing_calls()
--       end
--     end, opts, "outgoing calls")
--   end
--   if client.server_capabilities.workspaceSymbolProvider then
--     map("n", "<localleader>ws", vim.lsp.buf.workspace_symbol, opts, "list workspace symbols")
--   end
--
--   map("n", "[d", function()
--     if utils.has("lspsaga.nvim") then
--       vim.cmd([[Lspsaga diagnostic_jump_prev]])
--     else
--       vim.diagnostic.goto_prev()
--     end
--   end, opts, "goto previous diagnostics")
--   map("n", "]d", function()
--     if utils.has("lspsaga.nvim") then
--       vim.cmd([[Lspsaga diagnostic_jump_next]])
--     else
--       vim.diagnostic.goto_next()
--     end
--   end, opts, "goto next diagnostics")
--
--   if utils.has("lspsaga.nvim") then
--     map("n", "<localleader>wd", function()
--       vim.cmd([[Lspsaga show_workspace_diagnostics]]) --can use ++normal to show in loclist
--     end, opts, "workspace diagnostics")
--     map("n", "<localleader>bd", function()
--       vim.cmd([[Lspsaga show_buf_diagnostics]])
--     end, opts, "workspace diagnostics")
--     map("n", "<localleader>wo", function()
--       vim.cmd([[Lspsaga outline]])
--     end, opts, "workspace outline")
--   end
--   map("n", "<localleader>sl", vim.diagnostic.setloclist, opts, "set loclist")
--   map("n", "<localleader>of", vim.diagnostic.open_float, opts, "open float")
--
--   map("n", "<localleader>wf", function()
--     vim.print(vim.lsp.buf.list_workspace_folders())
--   end, opts, "list workspace folders")
--   map("n", "<localleader>rd", function()
--     print("Language server " .. (vim.lsp.buf.server_ready() and "is ready" or "is not ready"))
--   end, opts, "check if lsp is ready")
-- end)
