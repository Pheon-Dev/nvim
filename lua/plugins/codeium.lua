-- Remove the `use` here if you're using folke/lazy.nvim.
return {
	{
		"james1236/backseat.nvim",
		event = "VeryLazy",
		config = function()
			require("backseat").setup({
				-- Alternatively, set the env var $OPENAI_API_KEY by putting "export OPENAI_API_KEY=sk-xxxxx" in your ~/.bashrc
				-- openai_api_key = "sk-xxxxxxxxxxxxxx", -- Get yours from platform.openai.com/account/api-keys
				openai_model_id = "gpt-3.5-turbo", --gpt-4 (If you do not have access to a model, it says "The model does not exist")

				split_threshold = 100,
				additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
				highlight = {
					icon = "", -- ''
					group = "Comment",
				},
			})
		end,
	},
	{
		"Exafunction/codeium.vim",
		event = "VeryLazy",
		config = function()
			-- vim.g.codeium_disable_bindings = 1
		end,
	},
}
