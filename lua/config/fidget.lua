local ok, _ = pcall(require, 'fidget')
if not ok then
  vim.notify("Fidget Load Error!", "error")
end
_.setup {}
