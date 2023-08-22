local M = {
  "m4xshen/hardtime.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local config = {
      max_time = 1000,
      max_count = 5,
      disable_mouse = true,
      hint = false,
      notification = false,
      allow_different_key = false,
      enabled = true,
      resetting_keys = {
        ["1"] = { "n", "x" },
        ["2"] = { "n", "x" },
        ["3"] = { "n", "x" },
        ["4"] = { "n", "x" },
        ["5"] = { "n", "x" },
        ["6"] = { "n", "x" },
        ["7"] = { "n", "x" },
        ["8"] = { "n", "x" },
        ["9"] = { "n", "x" },
        ["c"] = { "n" },
        ["C"] = { "n" },
        ["d"] = { "n" },
        ["x"] = { "n" },
        ["X"] = { "n" },
        ["y"] = { "n" },
        ["Y"] = { "n" },
        ["p"] = { "n" },
        ["P"] = { "n" },
      },
      restricted_keys = {
        ["h"] = { "n", "x" },
        ["j"] = { "n", "x" },
        ["k"] = { "n", "x" },
        ["l"] = { "n", "x" },
        ["-"] = { "n", "x" },
        ["+"] = { "n", "x" },
        ["gj"] = { "n", "x" },
        ["gk"] = { "n", "x" },
        ["<CR>"] = { "n", "x" },
        ["<C-M>"] = { "n", "x" },
        ["<C-N>"] = { "n", "x" },
        ["<C-P>"] = { "n", "x" },
      },
      disabled_keys = {
        ["<Up>"] = { "", "i" },
        ["<Down>"] = { "", "i" },
        ["<Left>"] = { "", "i" },
        ["<Right>"] = { "", "i" },
      },
      disabled_filetypes = {
        "qf",
        "netrw",
        "lazy",
        "mason",
        "NvimTree",
        "help",
        "harpoon",
        "floaterm",
      },
      hints = {
        ["[kj]%^"] = {
          message = function(key)
            return "Use "
                .. (key == "k^" and "<C-k>" or key == "j^" and "<C-j>")
                .. " instead of "
                .. key
          end,
          length = 2,
        },
        ["%$a"] = {
          message = function()
            return "Use A instead of $a"
          end,
          length = 2,
        },
        ["%^i"] = {
          message = function()
            return "Use I instead of ^i"
          end,
          length = 2,
        },
        ["%D[k-]o"] = {
          message = function(keys)
            return "Use O instead of " .. keys:sub(2)
          end,
          length = 3,
        },
        ["%D[j+]O"] = {
          message = function(keys)
            return "Use o instead of " .. keys:sub(2)
          end,
          length = 3,
        },
        ["[^fFtT]li"] = {
          message = function()
            return "Use a instead of li"
          end,
          length = 3,
        },
        ["2([dcy=<>])%1"] = {
          message = function(key)
            return "Use " .. key:sub(3) .. "j instead of " .. key
          end,
          length = 3,
        },

        -- hints for f/F/t/T
        ["[^dcy=]f.h"] = {
          message = function(keys)
            return "Use t" .. keys:sub(3, 3) .. " instead of " .. keys:sub(2)
          end,
          length = 4,
        },
        ["[^dcy=]F.l"] = {
          message = function(keys)
            return "Use T" .. keys:sub(3, 3) .. " instead of " .. keys:sub(2)
          end,
          length = 4,
        },
        ["[^dcy=]T.h"] = {
          message = function(keys)
            return "Use F" .. keys:sub(3, 3) .. " instead of " .. keys:sub(2)
          end,
          length = 4,
        },
        ["[^dcy=]t.l"] = {
          message = function(keys)
            return "Use f" .. keys:sub(3, 3) .. " instead of " .. keys:sub(2)
          end,
          length = 4,
        },

        -- hints for delete + insert
        ["d[bBwWeE%^%$]i"] = {
          message = function(keys)
            return "Use " .. "c" .. keys:sub(2, 2) .. " instead of " .. keys
          end,
          length = 3,
        },
        ["dg[eE]i"] = {
          message = function(keys)
            return "Use " .. "c" .. keys:sub(2, 3) .. " instead of " .. keys
          end,
          length = 4,
        },
        ["d[tTfF].i"] = {
          message = function(keys)
            return "Use " .. "c" .. keys:sub(2, 3) .. " instead of " .. keys
          end,
          length = 4,
        },
        ["d[ia][\"'`{}%[%]()<>bBwWspt]i"] = {
          message = function(keys)
            return "Use " .. "c" .. keys:sub(2, 3) .. " instead of " .. keys
          end,
          length = 4,
        },

        -- hints for unnecessary visual mode
        ["Vgg[dcy=<>]"] = {
          message = function(keys)
            return "Use " .. keys:sub(4, 4) .. "gg instead of " .. keys
          end,
          length = 4,
        },
        ['Vgg".[dy]'] = {
          message = function(keys)
            return "Use " .. keys:sub(4, 6) .. "gg instead of " .. keys
          end,
          length = 6,
        },
        ["VG[dcy=<>]"] = {
          message = function(keys)
            return "Use " .. keys:sub(3, 3) .. "G instead of " .. keys
          end,
          length = 3,
        },
        ['VG".[dy]'] = {
          message = function(keys)
            return "Use " .. keys:sub(3, 5) .. "G instead of " .. keys
          end,
          length = 5,
        },
        ["V%d[kj][dcy=<>]"] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 4)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 4,
        },
        ['V%d[kj]".[dy]'] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 6)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 6,
        },
        ["V%d%d[kj][dcy=<>]"] = {
          message = function(keys)
            return "Use "
                .. keys:sub(5, 5)
                .. keys:sub(2, 4)
                .. " instead of "
                .. keys
          end,
          length = 5,
        },
        ['V%d%d[kj]".[dy]'] = {
          message = function(keys)
            return "Use "
                .. keys:sub(5, 7)
                .. keys:sub(2, 4)
                .. " instead of "
                .. keys
          end,
          length = 7,
        },
        ["[vV][bBwWeE%^%$][dcy=<>]"] = {
          message = function(keys)
            return "Use "
                .. keys:sub(3, 3)
                .. keys:sub(2, 2)
                .. " instead of "
                .. keys
          end,
          length = 3,
        },
        ['[vV][bBwWeE%^%$]".[dy]'] = {
          message = function(keys)
            return "Use "
                .. keys:sub(3, 5)
                .. keys:sub(2, 2)
                .. " instead of "
                .. keys
          end,
          length = 5,
        },
        ["[vV]g[eE][dcy=<>]"] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 4)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 4,
        },
        ['[vV]g[eE]".[dy]'] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 6)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 6,
        },
        ["[vV][tTfF].[dcy=<>]"] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 4)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 4,
        },
        ['[vV][tTfF].".[dy]'] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 6)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 6,
        },
        ["[vV][ia][\"'`{}%[%]()<>bBwWspt][dcy=<>]"] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 4)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 4,
        },
        ['[vV][ia]["\'`{}%[%]()<>bBwWspt]".[dy]'] = {
          message = function(keys)
            return "Use "
                .. keys:sub(4, 6)
                .. keys:sub(2, 3)
                .. " instead of "
                .. keys
          end,
          length = 6,
        },
      },
    }
    require("hardtime").setup(config)
  end
}


function M.set_defaults(user_config)
  for option, value in pairs(user_config) do
    if type(value) == "table" and #value == 0 then
      for k, v in pairs(value) do
        if next(v) == nil then
          M.config[option][k] = nil
        else
          M.config[option][k] = v
        end
      end
    else
      M.config[option] = value
    end
  end
end

return { M }
