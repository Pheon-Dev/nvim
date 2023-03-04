return {
	"ahmedkhalf/project.nvim",
	config = function()
		local ok, project = pcall(require, "project_nvim")
		if not ok then
			return
		end
		project.setup({ detection_methods = { "pattern", "lsp" }, silent_chdir = false })
	end,
}
