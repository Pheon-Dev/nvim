return {
  'Pheon-Dev/mind.nvim',
  -- branch = 'v2.2',
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require'mind'.setup()
  end
}
