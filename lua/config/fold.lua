local M = {}

M.dependencies = { "kevinhwang91/promise-async" }

M.keys = {
  {
    "zl",
    mode = { "n" },
    "za",
    desc = "Open all folds",
  },
  {
    "zj",
    mode = { "n" },
    function() require("ufo").openAllFolds() end,
    desc = "Open all folds",
  },
  {
    "zk",
    mode = { "n" },
    function() require("ufo").closeAllFolds() end,
    desc = "Close all folds",
  },
  {
    "zh",
    mode = { "n" },
    function() require("ufo").openFoldsExceptKinds() end,
    desc = "Open folds except kinds",
  },
  {
    "zg",
    mode = { "n" },
    function() require("ufo").closeFoldsWith() end,
    desc = "Close folds with",
  },
  {
    "zi",
    mode = { "n" },
    function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end,
    desc = "Hover",
  }
}

M.config = function()
  local ufo = require("ufo")
  local ftMap = {
    vim = "indent",
    python = { "indent" },
    typescript = { "indent" },
    rust = { "indent" },
    go = { "indent" },
    lua = { "indent" },
    git = "",
  }

  local handler = function(virtText, lnum, endLnum, width, truncate, ctx)
    local newVirtText = {}
    local suffix = ("  %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end

    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
  end

  local function custom_selector(bufnr)
    local function handleFallbackException(err, providerName)
      if type(err) == "string" and err:match("UfoFallbackException") then
        return require("ufo").getFolds(bufnr, providerName)
      else
        return require("promise").reject(err)
      end
    end

    return require("ufo")
        .getFolds(bufnr, "lsp")
        -- :catch(function(err)
        --   return handleFallbackException(err, "treesitter")
        -- end)
        :catch(function(err)
          return handleFallbackException(err, "indent")
        end)
  end

  ufo.setup({
    fold_virt_text_handler = handler,
    open_fold_hl_timeout = 150,
    close_fold_kinds = { "imports", "comment" },
    preview = {
      win_config = {
        border = "rounded",
        --[[ border = { "", "─", "", "", "", "─", "", "" }, ]]
        -- winhighlight = "Normal:PmenuSel",
        winblend = 0,
        --[[ maxheight = 20 ]]
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
      },
    },
    provider_selector = function(bufnr, filetype, buftype)
      return ftMap[filetype] or custom_selector
    end,
    enable_get_fold_virt_text = true,
  })

  -- buffer scope handler
  -- will override global handler if it is existed
  local bufnr = vim.api.nvim_get_current_buf()
  ufo.setFoldVirtTextHandler(bufnr, handler)
end

return M
