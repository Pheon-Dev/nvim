local M = {}

M.init = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 600
end

M.config = function()
  local wk = require("which-key")

  local oc, crates = pcall(require, "crates")
  if not oc then
    return
  end

  local ok, rt = pcall(require, "rust-tools")
  if not ok then
    return
  end

  wk.setup({
    ---@type false | "classic" | "modern" | "helix"
    preset = "classic",
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    ---@param mapping wk.Mapping
    filter = function(mapping)
      -- example to exclude mappings without a description
      -- return mapping.desc and mapping.desc ~= ""
      return true
    end,
    --- You can add any mappings here, or use `require('which-key').add()` later
    ---@type wk.Spec
    spec = {},
    -- show a warning when issues were detected with your mappings
    notify = true,
    -- Enable/disable WhichKey for certain mapping modes
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    ---@type wk.Win
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    ---@type (string|wk.Sorter)[]
    --- Mappings are sorted using configured sorters and natural sort of the keys
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "local", "order", "group", "alphanum", "mod" },
    ---@type number|fun(node: wk.Node):boolean?
    expand = 0, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
    ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
      },
      desc = {
        { "<Plug>%((.*)%)", "%1" },
        { "^%+", "" },
        { "<[cC]md>", "" },
        { "<[cC][rR]>", "" },
        { "<[sS]ilent>", "" },
        { "^lua%s+", "" },
        { "^call%s+", "" },
        { "^:%s*", "" },
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "…",
      --- See `lua/which-key/icons.lua` for more details
      --- Set to `false` to disable keymap icons
      ---@type wk.IconRule[]|false
      rules = {},
      -- use the highlights from mini.icons
      -- When `false`, it will use `WhichKeyIcon` instead
      colors = true,
      -- used by key format
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "⌫",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    -- Which-key automatically sets up triggers for your mappings.
    -- But you can disable this and setup the triggers yourself.
    -- Be aware, that triggers are not needed for visual and operator pending mode.
    disable = {
      -- disable WhichKey for certain buf types and file types.
      ft = {},
      bt = {},
      -- disable a trigger for a certain context by returning true
      ---@type fun(ctx: { keys: string, mode: string, plugin?: string }):boolean?
    },
    debug = false, -- enable wk.log in the current directory
  })

  wk.add({
    -- { "<leader>f", group = "file" }, -- group
    -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    -- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
    -- { "<leader>f1", hidden = true }, -- hide this keymap
    {
      -- Nested mappings are allowed and can be added in any order
      -- Most attributes can be inherited or overridden on any level
      -- There's no limit to the depth of nesting
      mode = { "n", "v" }, -- NORMAL and VISUAL mode
      { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
      -- { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    },
    { "<leader>b", "<cmd>Antelope buffers<cr>", desc = "Buffers", icon = "󱂬  " },
    { "<leader>h", "<cmd>Oil<cr>", desc = "Oil", icon = "  " },
    { "<leader>M", "<cmd>Mason<cr>", desc = "Mason", icon = " " },
    { "<leader>nn", "<cmd>Noice<cr>", desc = "Noice Notifications", icon = " " },
    { "<leader>nm", "<cmd>messages<cr>", desc = "Messages", icon = " " },
    { "<leader>q", "<cmd>bd<cr>", desc = "Close Buffer", icon = " " },
    { "<leader>Ra", rt.code_action_group.code_action_group, desc = "Code Action Group", icon = "" },
    { "<leader>Ro", ":RustOpenCargo<cr>", desc = "Open Cargo", icon = "" },
    { "<leader>Rct", crates.toggle, desc = "Toggle Crates", icon = "" },
    { "<leader>Rcr", crates.reload, desc = "Reload Crates", icon = "" },
    { "<leader>Rcv", crates.show_versions_popup, desc = "Show Versions Popup", icon = "" },
    { "<leader>Rcf", crates.show_features_popup, desc = "Show Features Popup", icon = "" },
    { "<leader>Rcd", crates.show_dependencies_popup, desc = "Show Dependenices Popup", icon = "" },
    { "<leader>Rcuu", crates.update_crate, desc = "Update Crate", icon = "" },
    { "<leader>Rcua", crates.update_all_crates, desc = "Update All Crates", icon = "" },
    { "<leader>Rcgu", crates.upgrade_crate, desc = "Upgrade Crate", icon = "" },
    { "<leader>Rcga", crates.upgrade_all_crates, desc = "Upgrade All Crates", icon = "" },
    { "<leader>Rcoc", crates.open_crate_io, desc = "Open Crates IO", icon = "" },
    { "<leader>Rcoh", crates.open_homepage, desc = "Open Home Page", icon = "" },
    { "<leader>Rcod", crates.open_documentation, desc = "Open Documentation", icon = "" },
    { "<leader>Rcor", crates.open_repository, desc = "Open Repository", icon = "" },
    { "<leader>Rh", rt.hover_actions.hover_actions, desc = "Hover Actions", icon = "" },
    { "<leader>Rie", ":RustEnableInlayHints<cr>", desc = "Enable Inlay Hints", icon = "" },
    { "<leader>Rid", ":RustDisableInlayHints<cr>", desc = "Disable Inlay Hints", icon = "" },
    { "<leader>Ris", ":RustSetInlayHints<cr>", desc = "Set Inlay Hints", icon = "" },
    { "<leader>Riu", ":RustUnsetInlayHints<cr>", desc = "Unset Inlay Hints", icon = "" },
    { "<leader>Rj", ":RustJoinLines<cr>", desc = "Join Lines", icon = "" },
    { "<leader>Rm", ":RustExpandMacro<cr>", desc = "Expand Macro", icon = "" },
    { "<leader>Rp", ":RustParentModule<cr>", desc = "Parent Module", icon = "" },
    { "<leader>Rr", ":RustRunnables<cr>", desc = "Runnables", icon = "" },
    { "<leader>to", ":TSToolsOrganizeImports<cr>", desc = "Organize Imports", icon = "" },
    { "<leader>ts", ":TSToolsSortImports<cr>", desc = "Sort Imports", icon = "" },
    { "<leader>tr", ":TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports", icon = "" },
    { "<leader>tx", ":TSToolsRemoveUnused<cr>", desc = "Remove Unused Statements", icon = "" },
    { "<leader>ta", ":TSToolsAddMissingImports<cr>", desc = "Add Missing Imports", icon = "" },
    { "<leader>tf", ":TSToolsFixAll<cr>", desc = "Fix All", icon = "" },
    { "<leader>ti", ":TSToolsGoToSourceDefinition<cr>", desc = "Go To Source Definition", icon = "" },
    { "<leader>tc", ":TSC<cr>", desc = "TSC", icon = "" },
    { "<leader>td", ":TodoQuickFix<cr>", desc = "TODO QuickFix", icon = "" },
    {
      "<leader>x",
      "<cmd>lua require('diaglist').open_all_diagnostics()<cr>",
      desc = "Quickfix All Diagnostics",
      icon = "",
    },
    { "<leader>y", ":YankBank<cr>", desc = "YankBank", icon = "" },
    {
      "<leader>x",
      "<cmd>lua require('diaglist').open_all_diagnostics()<cr>",
      desc = "Quickfix All Diagnostics",
      icon = " ",
    },
  })

  -- local dap, dapui = require("dap"), require("dapui")

  local mappings = {}
end

return M
