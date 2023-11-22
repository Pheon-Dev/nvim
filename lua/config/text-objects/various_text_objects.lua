local M = {}

M.opts = {
  useDefaultKeymaps = true,
}

M.config = function()
  require("various-textobjs").setup({
    lookForwardSmall = 5,
    lookForwardBig = 15,
    useDefaultKeymaps = true,
    -- disabledKeymaps = { "ai", "ii", "aI", "iI" },
    disabledKeymaps = {
      "L",  -- vu
      "r",  -- ri
      "R",  -- rp
      "in", -- ir
      "il",
      -- "ai",
      -- "ii",
      -- "aI",
      -- "iI",
      "an", -- deprecated
    },
  })
  -- TEXT OBJECTS
  local keymap = vim.keymap.set

  --indentation
  -- keymap({ "o", "x" }, "ii", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
  -- keymap({ "o", "x" }, "ai", "<cmd>lua require('various-textobjs').indentation(false, true)<CR>")
  keymap({ "o", "x" }, "iI", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
  keymap({ "o", "x" }, "aI", "<cmd>lua require('various-textobjs').indentation(false, false)<CR>")
  keymap({ "o", "x" }, "ri", "<cmd>lua require('various-textobjs').restOfIndentation()<CR>")
  -- paragraphs
  keymap({ "o", "x" }, "rp", "<cmd>lua require('various-textobjs').restOfParagraph()<CR>")
  -- subwords
  keymap({ "o", "x" }, "iS", "<cmd>lua require('various-textobjs').subword(true)<CR>")
  keymap({ "o", "x" }, "aS", "<cmd>lua require('various-textobjs').subword(false)<CR>")
  -- near closing brackets
  keymap({ "o", "x" }, "%", "<cmd>lua require('various-textobjs').toNextClosingBracket()<CR>")
  -- entire buffer
  keymap({ "o", "x" }, "ae", "<cmd>lua require('various-textobjs').entireBuffer()<CR>")
  -- near end of line
  keymap({ "o", "x" }, "n", "<cmd>lua require('various-textobjs').nearEoL()<CR>")
  -- line characterwise
  keymap({ "o", "x" }, "ih", "<cmd>lua require('various-textobjs').lineCharacterwise(true)<CR>")
  keymap({ "o", "x" }, "ah", "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>")
  -- column
  keymap({ "o", "x" }, "ij", "<cmd>lua require('various-textobjs').column()<CR>")
  -- value
  keymap({ "o", "x" }, "iv", "<cmd>lua require('various-textobjs').value(true)<CR>")
  keymap({ "o", "x" }, "av", "<cmd>lua require('various-textobjs').value(false)<CR>")
  -- key
  keymap({ "o", "x" }, "ik", "<cmd>lua require('various-textobjs').key(true)<CR>")
  keymap({ "o", "x" }, "ak", "<cmd>lua require('various-textobjs').key(false)<CR>")
  -- url
  keymap({ "o", "x" }, "vu", "<cmd>lua require('various-textobjs').url()<CR>")
  -- diagnostic
  keymap({ "o", "x" }, "!", "<cmd>lua require('various-textobjs').diagnostic()<CR>")
  -- fold
  keymap({ "o", "x" }, "iz", "<cmd>lua require('various-textobjs').closedFold(true)<CR>")
  keymap({ "o", "x" }, "az", "<cmd>lua require('various-textobjs').closedFold(false)<CR>")
  -- chain member
  keymap({ "o", "x" }, "im", "<cmd>lua require('various-textobjs').chainMember(true)<CR>")
  keymap({ "o", "x" }, "am", "<cmd>lua require('various-textobjs').chainMember(false)<CR>")
  -- window
  keymap({ "o", "x" }, "gw", "<cmd>lua require('various-textobjs').visibleInWindow()<CR>")
  keymap({ "o", "x" }, "gW", "<cmd>lua require('various-textobjs').restOfWindow()<CR>")
  --[[ vim.keymap.set("n", "dsi", function()
    -- select inner indentation
    require("various-textobjs").indentation(true, true)

    -- plugin only switches to visual mode when textobj found
    local notOnIndentedLine = vim.fn.mode():find("V") == nil
    if notOnIndentedLine then return end

    -- dedent indentation
    vim.cmd.normal { "<", bang = true }

    -- delete surrounding lines
    local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1] + 1
    local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
    vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
    vim.cmd(tostring(startBorderLn) .. " delete")
  end, { desc = "Delete surrounding indentation" }) ]]
end

return M
