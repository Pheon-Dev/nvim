return {
  'Pheon-Dev/mind.nvim',
  -- branch = 'v2.2',
  event = "BufReadPre",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require'mind'.setup()
  end
}
