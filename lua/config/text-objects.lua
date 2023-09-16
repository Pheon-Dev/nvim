local M = {}

M.various_opts = {
  useDefaultKeymaps = true,
}

M.various_config = function()
  require("various-textobjs").setup({
    lookForwardSmall = 5,
    lookForwardBig = 15,
    useDefaultKeymaps = true,
    -- disabledKeymaps = { "ai", "ii", "aI", "iI" },
    disabledKeymaps = {
      "L",  -- vu
      "r",  -- ri
      "R",  -- rp
      "in", -- ir
      "il",
      -- "ai",
      -- "ii",
      -- "aI",
      -- "iI",
      "an", -- deprecated
    },
  })
end

M.comment_keys = {
  { "ic", mode = { "o", "x" }, desc = "Select comment block" },
  { "ac", mode = { "o", "x" }, desc = "Select comment block" },
}

M.comment_dependencies = { "kana/vim-textobj-user" }

M.treesitter_textobjects = {
  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      -- ["al"] = "@class.outer",
      -- ["il"] = { query = "@class.inner", desc = "Select inner part of a class region" }, -- You can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap) which plugins like which-key display
      -- ["ab"] = "@block.outer",
      -- ["ib"] = "@block.inner",
      ["al"] = "@conditional.outer",
      ["il"] = "@conditional.inner",
      ["ao"] = "@loop.outer",
      ["io"] = "@loop.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["am"] = "@call.outer",
      ["im"] = "@call.inner",
      ["ir"] = "@number.inner",
      ["ag"] = "@assignment.outer",
      ["ig"] = "@assignment.inner",
      ["i,"] = "@assignment.lhs",
      ["i."] = "@assignment.rhs",
      -- ["ic"] = "@comment.outer",
      -- ["ac"] = "@comment.outer",
      --["afr"] = "@frame.outer",
      --["ifr"] = "@frame.inner",
      --["aat"] = "@attribute.outer",
      --["iat"] = "@attribute.inner",
      --["asc"] = "@scopename.inner",
      --["isc"] = "@scopename.inner",
      ["as"] = { query = "@scope", query_group = "locals" },
      ["is"] = "@statement.outer",
      -- ["ar"] = { query = "@start", query_group = "aerial" },
    },
    -- You can choose the select mode (default is charwise 'v')
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'V', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = treesitter_selection_mode,
    -- selection_modes = { ["@function.outer"] = "V" },
    -- if you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding or succeeding whitespace. succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    --
    -- can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * selection_mode: eg 'v'
    -- and should return true of false
    include_surrounding_whitespace = false
  },
  swap = {
    enable = true,
    swap_next = {
      [")f"] = "@function.outer",
      [")c"] = "@comment.outer",
      [")a"] = "@parameter.inner",
      [")b"] = "@block.outer",
      [")l"] = "@class.outer",
      [")s"] = "@statement.outer",
    },
    swap_previous = {
      ["(f"] = "@function.outer",
      ["(c"] = "@comment.outer",
      ["(a"] = "@parameter.inner",
      ["(b"] = "@block.outer",
      ["(l"] = "@class.outer",
      ["(s"] = "@statement.outer",
    },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]f"] = "@function.outer",
      ["]m"] = "@call.outer",
      ["]l"] = "@conditional.outer",
      ["]o"] = "@loop.outer",
      ["]s"] = "@statement.outer",
      ["]a"] = "@parameter.outer",
      ["]c"] = "@comment.outer",
      ["]b"] = "@block.outer",
      ["]r"] = "@number.inner",
      -- ["]l"] = { query = "@class.outer", desc = "next class start" },
      ["]]f"] = "@function.inner",
      ["]]m"] = "@call.inner",
      ["]]l"] = "@conditional.inner",
      ["]]o"] = "@loop.inner",
      ["]]a"] = "@parameter.inner",
      ["]]b"] = "@block.inner",
      -- ["]]l"] = { query = "@class.inner", desc = "next class start" },
    },
    goto_next_end = {
      ["]F"] = "@function.outer",
      ["]M"] = "@call.outer",
      ["]L"] = "@conditional.outer",
      ["]O"] = "@loop.outer",
      ["]S"] = "@statement.outer",
      ["]A"] = "@parameter.outer",
      ["]C"] = "@comment.outer",
      ["]B"] = "@block.outer",
      -- ["]L"] = "@class.outer",
      ["]R"] = "@number.inner",
      ["]]F"] = "@function.inner",
      ["]]M"] = "@call.inner",
      ["]]L"] = "@conditional.inner",
      ["]]O"] = "@loop.inner",
      ["]]A"] = "@parameter.inner",
      ["]]B"] = "@block.inner",
      -- ["]]L"] = "@class.inner",
    },
    goto_previous_start = {
      ["[f"] = "@function.outer",
      ["[m"] = "@call.outer",
      ["[l"] = "@conditional.outer",
      ["[o"] = "@loop.outer",
      ["[s"] = "@statement.outer",
      ["[a"] = "@parameter.outer",
      ["[c"] = "@comment.outer",
      ["[b"] = "@block.outer",
      -- ["[l"] = "@class.outer",
      ["[r"] = "@number.inner",
      ["[[f"] = "@function.inner",
      ["[[m"] = "@call.inner",
      ["[[l"] = "@conditional.inner",
      ["[[o"] = "@loop.inner",
      ["[[a"] = "@parameter.inner",
      ["[[b"] = "@block.inner",
      -- ["[[l"] = "@class.inner",
    },
    goto_previous_end = {
      ["[F"] = "@function.outer",
      ["[M"] = "@call.outer",
      ["[L"] = "@conditional.outer",
      ["[O"] = "@loop.outer",
      ["[S"] = "@statement.outer",
      ["[A"] = "@parameter.outer",
      ["[C"] = "@comment.outer",
      ["[B"] = "@block.outer",
      -- ["[L"] = "@class.outer",
      ["[R"] = "@number.inner",
      ["[[F"] = "@function.inner",
      ["[[M"] = "@call.inner",
      ["[[L"] = "@conditional.inner",
      ["[[O"] = "@loop.inner",
      ["[[A"] = "@parameter.inner",
      ["[[B"] = "@block.inner",
      -- ["[[L"] = "@class.inner",
    },
  },
  lsp_interop = {
    enable = true,
    floating_preview_opts = { border = "rounded" },
    peek_definition_code = {
      ["<C-t>"] = "@function.outer",
      ["<leader>df"] = "@function.outer",
      ["<leader>dF"] = "@class.outer",
    },
  },
}

return M
