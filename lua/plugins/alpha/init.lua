return {
	"goolord/alpha-nvim",
	event = { "VimEnter" },
	config = function()
		local has_alpha, alpha = pcall(require, "alpha")
		if not has_alpha then
			return
		end
		alpha.setup(require("plugins.alpha.config").config)
	end,
}
