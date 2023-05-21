return {
	"ahmedkhalf/project.nvim", -- auto cd into project root
	config = function()
		local ok, project = pcall(require, "project_nvim")
		if not ok then
			return
		end
		project.setup({
			detection_methods = { "pattern", "lsp" },
			silent_chdir = false,
		})
		local p = require("project_nvim.project")
		local history = require("project_nvim.utils.history")
		-- ensure current dir is added to the session
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local root, _ = p.get_project_root()
				table.insert(history.session_projects, root)
			end,
		})
	end,
}
