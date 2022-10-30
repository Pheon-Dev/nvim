require('refactoring').setup({
  prompt_func_return_type = {
    go = false,
    java = false,

    cpp = false,
    c = false,
    h = false,
    hpp = false,
    cxx = false,
  },
  prompt_func_param_type = {
    go = false,
    java = false,

    cpp = false,
    c = false,
    h = false,
    hpp = false,
    cxx = false,
  },
  printf_statements = {},
  -- overriding printf statement for cpp
  -- print_var_statements = {},
  print_var_statements = {
    -- add a custom print var statement for cpp
    cpp = {
      'printf("a custom statement %%s %s", %s)'
    }
  }
})
