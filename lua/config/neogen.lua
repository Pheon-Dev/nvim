require('neogen').setup {
  snippet_engine = "luasnip",
  enabled = true, --if you want to disable Neogen
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  languages = {
    lua = {
      template = {
        annotation_convention = "emmylua"
      }
    },
    typescriptreact = {
      template = {
        annotation_convention = "tsdoc"
      }
    },
    typescript = {
      template = {
        annotation_convention = "tsdoc"
      }
    },
    javascript = {
      template = {
        annotation_convention = "jsdoc"
      }
    },
    javascriptreact = {
      template = {
        annotation_convention = "jsdoc"
      }
    },
  },
  -- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
}

--[[  will generate annotation for the function you're inside ]]
--[[ :Neogen ]]
--[[  or you can force a certain type of annotation. ]]
--[[  It'll find the next upper node that matches the type ]]
--[[  E.g if you're on a method of a class and do `:Neogen class`, it'll find the class declaration and generate the annotation. ]]
--[[ :Neogen func|class|type|... ]]
--[[ require('neogen').generate({ ]]
--[[     type = "func" -- the annotation type to generate. Currently supported: func, class, type, file ]]
--[[ }) ]]
