local enable = require("config").enable

local default_event = require("config.event").default

local M = {
  {
    "folke/neodev.nvim",
    enabled = enable.neodev,
    event = default_event,
    opts = require("config.neodev").opts,
  },
  {
    "pmizio/typescript-tools.nvim",
    enabled = enable.typescript,
    event = default_event,
    dependencies = require("config.typescript").dependencies,
    config = require("config.typescript").config,
  },
  {
    "saecki/crates.nvim",
    enabled = enable.crates,
    event = require("config.rust").crates_event,
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = require("config.rust").crates_config,
  },
  {
    "rust-lang/rust.vim",
    enabled = enable.rust_vim,
    event = require("config.rust").rust_vim_event,
    config = require("config.rust").rust_vim_config,
  },
  {
    "simrat39/rust-tools.nvim",
    enabled = enable.rust_tools,
    event = require("config.rust").rust_tools_event,
    dependencies = require("config.rust").rust_tools_dependencies,
    config = require("config.rust").rust_tools_config,
  },
  {
    "ray-x/go.nvim",
    enabled = enable.go,
    dependencies = require("config.go").dependencies,
    config = require("config.go").config,
    -- event = cmd_enter_event,
    -- ft = require("config.go").ft,
    -- build = require("config.go").build,
  },
}

return M
