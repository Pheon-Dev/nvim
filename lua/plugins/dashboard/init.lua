return {
  {
    'glepnir/dashboard-nvim',
    enabled = true,
    event = 'VimEnter',
    config = function()
      local config = require("plugins.dashboard.dashboard")

      local has_dashboard, dashboard = pcall(require, "dashboard")

      if not has_dashboard then return end
      dashboard.setup({
        -- theme = 'hyper',            --  theme is doom and hyper default is hyper
        disable_move = false,       --  default is false disable move keymap for hyper
        shortcut_type = "letter",   --  shorcut type 'letter' or 'number'
        change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
        config = {
          header = config.header,
          shortcut = config.shortcut,
          footer = config.footer,
          project = config.project,
          mru = config.mru,
        },                   --  config used for theme
        hide = {
          statusline = true, -- hide statusline default is true
          tabline = true,    -- hide the tabline
          winbar = true,     -- hide winbar
        },
        -- preview = {
        --   command     -- preview command
        --   file_path   -- preview file path
        --   file_height -- preview file height
        --   file_width  -- preview file width
        -- },
      })
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }
}
