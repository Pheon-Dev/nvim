local M = {}

M.opts = {
  show_icons = true,
  always_show_path = false,
  hide_handbook = false, -- set to true to hide the shortcuts on menu.
  save_path = function()
    return vim.fn.stdpath("cache") .. "/arrow"
  end,
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
  index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
  save_key = function()
    return vim.loop.cwd() -- we use the cwd as the context from the bookmarks.  You can change it for anything you want.
  end,
  full_path_list = { "update_stuff" }, -- filenames on this list will ALWAYS show the file path too.
}
M.config = function()
  require("arrow").setup(M.opts)
end

return M
