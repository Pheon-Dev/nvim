local enable = require("config").enable

local rest = require("config.languages.rest")
local markdown = require("config.languages.markdown")
local rust = require("config.languages.rust")
local go = require("config.languages.go")
local typescript = require("config.languages.typescript")
local tsc = require("config.languages.tsc")

local default_event = require("config.event").default

local M = {
  {
    "pmizio/typescript-tools.nvim",
    enabled = enable.typescript,
    event = default_event,
    dependencies = typescript.dependencies,
    config = typescript.config,
  },
  {
    "dmmulroy/tsc.nvim",
    enabled = enable.typescript,
    event = default_event,
    -- dependencies = tsc.dependencies,
    config = tsc.config,
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
  {
    "OXY2DEV/markview.nvim",
    enabled = enable.markdown,
    event = default_event,
    -- lazy = markdown.lazy,
    dependencies = markdown.dependencies,
  },
  {
    "OXY2DEV/helpview.nvim",
    -- lazy = false, -- Recommended
    event = default_event,
    enable = enable.helpview,
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
  },
  {
    "mistweaverco/kulala.nvim",
    opts = rest.opts,
    -- enabled = enable.rest,
    enabled = false,
    event = default_event,
  },
}

return M
