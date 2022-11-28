require("link-visitor").setup({
  open_cmd = nil, --[[ cmd to open url defaults: win or wsl: cmd.exe /c start mac: open linux: xdg-open ]]
  silent = true, -- disable all prints, `false` by default
})
