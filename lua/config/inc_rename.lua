require("inc_rename").setup {
  input_buffer_type = "dressing",
}

--[[ vim.keymap.set("n", "<leader>rn", ":IncRename ") ]]
--[[ vim.keymap.set("n", "<leader>rn", function() ]]
--[[   return ":IncRename " .. vim.fn.expand("<cword>") ]]
--[[ end, { expr = true }) ]]
