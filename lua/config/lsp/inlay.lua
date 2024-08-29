local M = {}

M.config = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        vim.keymap.set("n", "<leader>in", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        end, { buffer = bufnr })
      end
    end,
  })

  require("inlay-hint").setup({
    -- Position of virtual text. Possible values:
    -- 'eol': right after eol character (default).
    -- 'right_align': display right aligned in the window.
    -- 'inline': display at the specified column, and shift the buffer
    -- text to the right as needed.
    virt_text_pos = "inline",
    -- Can be supplied either as a string or as an integer,
    -- the latter which can be obtained using |nvim_get_hl_id_by_name()|.
    highlight_group = "LspInlayHint",
    -- Control how highlights are combined with the
    -- highlights of the text.
    -- 'combine': combine with background text color. (default)
    -- 'replace': only show the virt_text color.
    hl_mode = "combine",
    -- line_hints: array with all hints present in current line.
    -- options: table with this plugin configuration.
    -- bufnr: buffer id from where the hints come from.
    display_callback = function(line_hints, options, bufnr)
      if options.virt_text_pos == "inline" then
        local lhint = {}
        for _, hint in pairs(line_hints) do
          local text = ""
          local label = hint.label
          if type(label) == "string" then
            text = label
          else
            for _, part in ipairs(label) do
              text = text .. part.value
            end
          end
          if hint.paddingLeft then
            text = " " .. text
          end
          if hint.paddingRight then
            text = text .. " "
          end
          lhint[#lhint + 1] = { text = text, col = hint.position.character }
        end
        return lhint
      elseif options.virt_text_pos == "eol" or options.virt_text_pos == "right_align" then
        local k1 = {}
        local k2 = {}
        table.sort(line_hints, function(a, b)
          return a.position.character < b.position.character
        end)
        for _, hint in pairs(line_hints) do
          local label = hint.label
          local kind = hint.kind
          local node = kind == 1
              and vim.treesitter.get_node({
                bufnr = bufnr,
                pos = {
                  hint.position.line,
                  hint.position.character - 1,
                },
              })
            or nil
          local node_text = node and vim.treesitter.get_node_text(node, bufnr, {}) or ""
          local text = ""
          if type(label) == "string" then
            text = label
          else
            for _, part in ipairs(label) do
              text = text .. part.value
            end
          end
          if kind == 1 then
            k1[#k1 + 1] = text:gsub(":%s*", node_text .. ": ")
          else
            k2[#k2 + 1] = text:gsub(":$", "")
          end
        end
        local text = ""
        if #k2 > 0 then
          text = "<- (" .. table.concat(k2, ",") .. ")"
        end
        if #text > 0 then
          text = text .. " "
        end
        if #k1 > 0 then
          text = text .. "=> " .. table.concat(k1, ", ")
        end

        return text
      end
      return nil
    end,
  })
end

return M
