local M = {}

M.dependencies = {
  "MunifTanjim/nui.nvim",
}

M.cmd = {
  "NeoAI",
  "NeoAIOpen",
  "NeoAIClose",
  "NeoAIToggle",
  "NeoAIContext",
  "NeoAIContextOpen",
  "NeoAIContextClose",
  "NeoAIInject",
  "NeoAIInjectCode",
  "NeoAIInjectContext",
  "NeoAIInjectContextCode",
}

M.keys = {
  { "<leader>as", desc = "summarize text" },
  { "<leader>ag", desc = "generate git message" },
}

M.config = function()
  require("neoai").setup({
    -- Options go here
  })
end

return M
