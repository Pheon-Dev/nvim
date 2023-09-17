local enable = require("config").enable

local rust = require("config.languages.rust")
local go = require("config.languages.go")
local lua = require("config.languages.lua")
local typescript = require("config.languages.typescript")

local default_event = require("config.event").default

local M = {
  {
    "folke/neodev.nvim",
    enabled = enable.neodev,
    event = default_event,
    opts = lua.neodev_opts,
  },
  {
    "pmizio/typescript-tools.nvim",
    enabled = enable.typescript,
    event = default_event,
    dependencies = typescript.dependencies,
    config = typescript.config,
  },
  {
    "saecki/crates.nvim",
    enabled = enable.crates,
    event = rust.crates_event,
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = rust.crates_config,
  },
  {
    "rust-lang/rust.vim",
    enabled = enable.rust_vim,
    event = rust.rust_vim_event,
    config = rust.rust_vim_config,
  },
  {
    "simrat39/rust-tools.nvim",
    enabled = enable.rust_tools,
    event = rust.rust_tools_event,
    dependencies = rust.rust_tools_dependencies,
    config = rust.rust_tools_config,
  },
  {
    "ray-x/go.nvim",
    enabled = enable.go,
    dependencies = go.dependencies,
    config = go.config,
    -- event = cmd_enter_event,
    -- ft = go.ft,
    -- build = go.build,
  },
}

return M
