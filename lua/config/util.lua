local M = {}
--------------------------------------------------------------------------------

---runs :normal with bang
---@param cmdStr string
function M.normal(cmdStr)
  vim.cmd.normal({ cmdStr, bang = true })
end

---@nodiscard
---@param path string
function M.fileExists(path)
  return vim.uv.fs_stat(path) ~= nil
end

---@param msg string
---@param title string
---@param level? "info"|"trace"|"debug"|"warn"|"error"
function M.notify(title, msg, level)
  if not level then
    level = "info"
  end
  vim.notify(msg, vim.log.levels[level:upper()], { title = title })
end

function M.copyAndNotify(text)
  vim.fn.setreg("+", text)
  vim.notify(text, vim.log.levels.INFO, { title = "Copied" })
end

---@param hlName string name of highlight group
---@param key "fg"|"bg"|"bold"
---@nodiscard
---@return string|nil the value, or nil if hlgroup or key is not available
function M.getHlValue(hlName, key)
  local hl
  repeat
    -- follow linked highlights
    hl = vim.api.nvim_get_hl(0, { name = hlName })
    hlName = hl.link
  until not hl.link
  local value = hl[key]
  if value then
    return ("#%06x"):format(value)
  else
    local msg = ("No %s available for highlight group %q"):format(key, hlName)
    M.notify("getHighlightValue", msg, "warn")
  end
end

function M.leaveVisualMode()
  local escKey = vim.api.nvim_replace_termcodes("<Esc>", false, true, true)
  vim.api.nvim_feedkeys(escKey, "nx", false)
end

--------------------------------------------------------------------------------

---Creates autocommand triggered by Colorscheme change, that modifies a
---highlight group. Mostly useful for setting up colorscheme modifications
---specific to plugins, that should persist across colorscheme changes triggered
---by switching between dark and light mode.
---@param hlgroup string
---@param modification table
function M.colorschemeMod(hlgroup, modification)
  vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    callback = function()
      vim.api.nvim_set_hl(0, hlgroup, modification)
    end,
  })
end

---ensures unique keymaps https://www.reddit.com/r/neovim/comments/16h2lla/can_you_make_neovim_warn_you_if_your_config_maps/
---@param modes string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? { unique: boolean, desc: string, buffer: boolean|number, nowait: boolean, remap: boolean }
function M.uniqueKeymap(modes, lhs, rhs, opts)
  if not opts then
    opts = {}
  end
  if opts.unique == nil then
    opts.unique = true
  end
  vim.keymap.set(modes, lhs, rhs, opts)
end

--------------------------------------------------------------------------------

M.textobjRemaps = {
  c = "}", -- [c]urly brace
  r = "]", -- [r]ectangular bracket
  m = "W", -- [m]assive word
  q = '"', -- [q]uote
  z = "'", -- [z]ingle quote
  e = "`", -- t[e]mplate string / inline cod[e]
}
M.extraTextobjMaps = {
  func = "f",
  call = "l",
  wikilink = "R",
  condition = "o",
}

--------------------------------------------------------------------------------
return M
