return {
  "folke/which-key.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- vim.o.timeout = true
    -- vim.o.timeoutlen = 300
    local ok, rt = pcall(require, "rust-tools")
    if not ok then return end
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = false, suggestions = 20 },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      operators = {
        gc = "Comments",
      },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For eample: ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+",      -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
      },
      window = {
        border = "single",        -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },                                             -- min and max height of the columns
        width = { min = 20, max = 50 },                                             -- min and max width of the columns
        spacing = 3,                                                                -- spacing between columns
        align = "left",                                                             -- align columns left, center or right
      },
      ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true,                                                             -- show help message on the command line when the popup is visible
      show_keys = true,                                                             -- show the currently pressed key and its label as a message in the command line
      triggers = "auto",                                                            -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by deafult for Telescope
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt", "lazy", "alpha" },
      },
    })

    local oc, crates = pcall(require, "crates")
    if not oc then return end

    local dap, dapui = require("dap"), require("dapui")

    local mappings = {
      -- ["'"] = { ":Alpha<cr>", "Dashboard" },
      a = { ":ASToggle<cr>", "Auto Save Toggle" },
      b = { ":Antelope buffers<cr>", "Buffers" },
      c = {
        name = "Crates",
        t = { crates.toggle, "Toggle" },
        r = { crates.reload, "Reload" },
        v = { crates.show_versions_popup, "Show Versions Popup" },
        f = { crates.show_features_popup, "Show Features Popup" },
        d = { crates.show_dependencies_popup, "Show Dependencies Popup" },
        u = {
          name = "Update",
          u = { crates.update_crate, "Update Crate" },
          a = { crates.update_all_crates, "Update All Crates" },
        },
        g = {
          name = "Upgrade",
          g = { crates.upgrade_crate, "Upgrade Crate" },
          a = { crates.upgrade_all_crates, "Upgrade All Crates" },
        },
        o = {
          name = "Open",
          c = { crates.open_crates_io, "Crates IO" },
          h = { crates.open_homepage, "Home Page" },
          d = { crates.open_documentation, "Documentation" },
          r = { crates.open_repository, "Repository" },
        },
      },
      d = {
        name = "DAP",
        b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
        c = { dap.continue, "Launch debug and resume execution" },
        i = { dap.step_into, "Step Into Code" },
        o = { dap.step_over, "Step Over Code" },
        r = { dap.repl.open, "Step Over Code" },
        d = { dapui.toggle, "Toggle UI" },
      },
      h = { ":lua require('harpoon.mark').add_file()<cr>", "Harpoon Mark File" },
      j = { ":NvimTreeToggle<cr>", "Nvim-Tree" },
      k = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" },
      m = { ":Antelope marks<cr>", "Marks" },
      n = { ":Telescope notify initial_mode=normal<cr>", "Notifications" },
      o = {
        name = "Others",
        c = {
          ":Telescope command_history previewer=false initial_mode=normal<cr>",
          "Command History",
        },
        m = { ":Mason<cr>", "Mason" },
        t = { ":Telescope help_tags previewer=false initial_mode=insert<cr>", "Help Tags" },
        h = { ":Telescope harpoon marks initial_mode=normal previewer=false<cr>", "Harpoon" },
        x = { ":lua require('harpoon.mark').clear_all()<cr>", "Clear All Marks" },
      },
      -- p = {
      --   name = "Pigeon",
      --   p = { ":PigeonToggle<cr>", "Toggle All Pigeon Modules" },
      --   d = { ":PigeonToggleDateTime<cr>", "Toggle Date and Time Module" },
      --   b = { ":PigeonToggleBattery<cr>", "Toggle Battery Module" },
      --   i = { ":PigeonToggleInternet<cr>", "Toggle Internet Module" },
      --   y = { ":PigeonToggleDay<cr>", "Toggle Day Submodule" },
      --   e = { ":PigeonToggleDate<cr>", "Toggle Date Submodule" },
      --   r = { ":PigeonToggleRam<cr>", "Toggle RAM Submodule" },
      --   t = { ":PigeonToggleTime<cr>", "Toggle Time Submodule" },
      -- },
      q = { ":bd<cr>", "Close Buffer" },
      r = {
        name = "Rust",
        a = { rt.code_action_group.code_action_group, "Code Action Group" },
        c = { ":RustOpenCargo<cr>", "Open Cargo" },
        h = { rt.hover_actions.hover_actions, "Hover Actions" },
        i = {
          name = "Inlayhints",
          e = { ":RustEnableInlayHints<cr>", "Enable" },
          d = { ":RustDisableInlayHints<cr>", "Disable" },
          s = { ":RustSetInlayHints<cr>", "Set" },
          u = { ":RustUnsetInlayHints<cr>", "Unset" },
        },
        j = { ":RustJoinLines<cr>", "Join Lines" },
        m = { ":RustExpandMacro<cr>", "Expand Macro" },
        p = { ":RustParentModule<cr>", "Parent Module" },
        r = { ":RustRunnables<cr>", "Runnables" },
      },
      t = {
        name = "TODO | Trouble | Tabs | TST",
        q = { ":TodoQuickFix<cr>", "TODO QuickFix" },
        l = { ":TodoTelescope<cr>", "TODO Telescope" },
        r = { ":TodoTrouble<cr>", "TODO Trouble" },
        t = {
          name = "Typescript",
          o = { ":TSToolsOrganizeImports<cr>", "Organize Imports" },
          s = { ":TSToolsSortImports<cr>", "Sort Imports" },
          r = { ":TSToolsRemoveUnusedImports<cr>", "Remove Unused Imports" },
          x = { ":TSToolsRemoveUnused<cr>", "Remove Unused Statements" },
          a = { ":TSToolsAddMissingImports<cr>", "Add Missing Imports" },
          f = { ":TSToolsFixAll<cr>", "Fix All" },
          d = { ":TSToolsGoToSourceDefinition<cr>", "Go To Source Definition" },
        }
      },
      x = { "<cmd>lua require('diaglist').open_all_diagnostics()<cr>", "Quickfix All Diagnostics" },
      y = { ":Telescope yank_history previewer=false initial_mode=normal<cr>", "Yank History" },
      z = { ":Lazy<cr>", "Lazy" },
    }

    local opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    }
    wk.register(mappings, opts)
  end,
}
