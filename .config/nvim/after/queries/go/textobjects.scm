;; extends

(type_spec) @debel.type

(const_spec name: (identifier) @debel.decl)
(var_spec name: (identifier) @debel.decl)
(short_var_declaration
  left: (expression_list
    (_) @debel.decl
  )
)

(range_clause
  left: (expression_list (_) @debel.decl)
)

(method_elem) @debel.field
(field_declaration) @debel.field
(keyed_element) @debel.field

(call_expression
  function: (selector_expression
    operand: (_)
      field: (field_identifier) @debel.call)
)

(call_expression
  function: (identifier) @debel.call
) @debel.loop

(call_expression
  arguments: (argument_list (_) @debel.arg)
)

(return_statement "return" .) @debel.return
(return_statement (expression_list (_) @debel.return))

(function_declaration
  result: (type_identifier) @debel.rettype
)

(function_declaration
  result: (qualified_type) @debel.rettype
)

(function_declaration
  result: (pointer_type) @debel.rettype
)

(function_declaration
  result: (parameter_list (_) @debel.rettype)
)

(method_declaration name: (_) @debel.func)
(function_declaration name: (_) @debel.func)
(func_literal) @debel.func

(if_statement) @debel.if
(expression_case) @debel.if

(parameter_declaration) @debel.param
(variadic_parameter_declaration) @debel.param

(defer_statement) @debel.defer
(go_statement) @debel.go


