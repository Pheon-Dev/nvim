local M = {}

M.config = function()
  require('arrow').setup({
    show_icons = true,
    always_show_path = false,
    mappings = {
      edit = "e",
      delete_mode = "d",
      clear_all_items = "C",
      toggle = "s",
      open_vertical = "v",
      open_horizontal = "-",
      quit = "q",
    },
    leader_key = ";",
    after_9_keys = "zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- Please, don't pin more than 9 XD,
    --[[ save_key = function()
      return vim.loop.cwd()                                       -- we use the cwd as the context from the bookmarks.  You can change it for anything you want.
    end, ]]
    full_path_list = { "update_stuff" } -- filenames on this list will ALWAYS show the file path too.
  })
end

return M
