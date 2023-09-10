local M = {}

M.root_patterns = { ".git", "/lua" }

function _G.dump(...)
  vim.print(...)
end

function M.reload_all()
  for name, _ in pairs(package.loaded) do
    if
        name:match("^lazy")
        or name:match("^mapping")
        or name:match("^plugrc")
        or name:match("^ui")
        or name:match("^editor")
        or name:match("^plugins")
        or name:match("^syntax")
        or name:match("^terminal")
        or name:match("^utils")
    then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

function M.reload_one(module)
  for name, _ in pairs(package.loaded) do
    if name:match("^" .. module) then
      package.loaded[name] = nil
      require(name)
      return
    end
  end
end

--{ "git", "rg", { "fd", "fdfind" }, "lazygit" }
M.check_if_cmd_exist = function(cmds)
  local result = {}
  for _, cmd in ipairs(cmds) do
    local name = type(cmd) == "string" and cmd or vim.inspect(cmd)
    local commands = type(cmd) == "string" and { cmd } or cmd
    ---@cast commands string[]
    local found = false
    for _, c in ipairs(commands) do
      if vim.fn.executable(c) == 1 then
        name = c
        found = true
      end
      result[name] = { found }
    end
  end
  return result
end

---@param editor_variable? {global: boolean}
---@param values? {[1]:any, [2]:any}
---@param option string
function M.toggle(option, editor_variable, values)
  if values then
    if not editor_variable then
      if vim.deep_equal(vim.opt_local[option]:get(), values[1]) then
        vim.opt_local[option] = values[2]
      else
        vim.opt_local[option] = values[1]
      end
      vim.notify(
        "set editor option " .. option .. " to " .. tostring(vim.opt_local[option]:get()),
        vim.log.levels.INFO,
        { title = "toggle editor option" }
      )
    else
      if not editor_variable.global then
        local bufnr = vim.api.nvim_get_current_buf()
        if vim.b[bufnr][option] == values[1] then
          vim.b[bufnr][option] = values[2]
        else
          --if option is unset or nil
          vim.b[bufnr][option] = values[1]
        end
        --:h debug.getinfo() or lua_getinfo() to get information about a function
        vim.notify("set option " .. option .. " to " .. tostring(vim.b[bufnr][option]), vim.log.levels.INFO, {
          title = "toggle local option",
        })
      else
        if vim.g[option] == values[1] then
          vim.g[option] = values[2]
        else
          --if option is unset or nil
          vim.g[option] = values[1]
        end
        vim.notify("set global option " .. option .. " to " .. tostring(vim.g[option]), vim.log.levels.INFO, {
          title = "toggle global option",
        })
      end
    end
  else
    if not editor_variable then
      vim.opt_local[option] = not vim.opt_local[option]:get()
      vim.notify(
        "set editor option " .. option .. " to " .. tostring(vim.opt_local[option]:get()),
        vim.log.levels.INFO,
        {
          title = "toggle editor option",
        }
      )
    else
      if not editor_variable.global then
        local bufnr = vim.api.nvim_get_current_buf()
        vim.b[bufnr][option] = not vim.b[bufnr][option] and true or false
        vim.notify("set option " .. option .. " to " .. tostring(vim.b[bufnr][option]), vim.log.levels.INFO, {
          title = "toggle local option",
        })
      else
        vim.g[option] = not vim.g[option]
        vim.notify("set global option " .. option .. " to " .. tostring(vim.g[option]), vim.log.levels.INFO, {
          title = "toggle global option",
        })
      end
    end
  end
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("Lazy", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

---@param modules string[]
--modules like "autocmds" | "options" | "keymaps"
M.lazy_load = function(modules)
  -- when no file is opened at startup
  if vim.fn.argc(-1) == 0 then
    -- autocmds and keymaps can wait to load
    -- always load lazyvim, then user file
    M.on_very_lazy(function()
      for i = 1, #modules do
        require(modules[i])
      end
    end)
  else
    -- load them now so they affect the opened buffers
    for i = 1, #modules do
      require(modules[i])
    end
  end
end

---@param plugin string
function M.has(plugin)
  if package.loaded["lazy"] then
    return require("lazy.core.config").plugins[plugin] ~= nil
  else
    local plugin_name = vim.split(plugin, ".", { plain = true, trimempty = true })
    return package.loaded[plugin_name[1]] ~= nil
  end
end

---@param description? string
---@param opt table
local function mdesc(opt, description)
  return vim.tbl_extend("force", opt, { desc = description })
end

---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts? table
---@param desc? string
M.map = function(mode, lhs, rhs, opts, desc)
  opts = opts and opts or {}
  opts = mdesc(opts, desc)
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
function M.get_root()
  ---@type string?
  local path = vim.api.nvim_buf_get_name(0)
  path = path ~= "" and vim.loop.fs_realpath(path) or nil
  ---@type string[]
  local roots = {}
  if path then
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      local workspace = client.config.workspace_folders
      local paths = workspace
          and vim.tbl_map(function(ws)
            return vim.uri_to_fname(ws.uri)
          end, workspace)
          or client.config.root_dir and { client.config.root_dir }
          or {}
      for _, p in ipairs(paths) do
        local r = vim.loop.fs_realpath(p)
        if path:find(r, 1, true) then
          roots[#roots + 1] = r
        end
      end
    end
  end
  table.sort(roots, function(a, b)
    return #a > #b
  end)
  ---@type string?
  local root = roots[1]
  if not root then
    path = path and vim.fs.dirname(path) or vim.loop.cwd()
    ---@type string?
    root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
    root = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  ---@cast root string
  return root
end

function M.telescope(builtin, opts)
  return function()
    require("telescope.builtin")[builtin](vim.tbl_deep_extend("force", { cwd = M.get_root() }, opts or {}))
  end
end

function M.float_term(cmd, opts)
  opts = vim.tbl_deep_extend("force", {
    terminal = true,
    close_on_exit = true,
    enter = true,
    float = {
      size = { width = 0.9, height = 0.9 },
      margin = { top = 0, right = 0, bottom = 0, left = 0 },
    },
  }, opts or {})
  require("lazy.util").open_cmd(cmd, opts)
end

return M
