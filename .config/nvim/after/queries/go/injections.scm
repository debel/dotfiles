; extends

; SQL
(call_expression
    function: (selector_expression
        field: (field_identifier) @funcName (#match? @funcName "^QueryRowContext|QueryContext|ExecContext$")
    )
    arguments: (argument_list
        [
          (raw_string_literal (raw_string_literal_content) @injection.content)
          (interpreted_string_literal (interpreted_string_literal_content) @injection.content)
        ]
    )
    (#set! injection.include-children)
    (#set! injection.language "sql")
)

(short_var_declaration
  left: (expression_list
    (identifier) @debel.varname (#match? @debel.varname "query|Query"))
  right: (expression_list
    [
      (raw_string_literal (raw_string_literal_content) @injection.content)
      (interpreted_string_literal (interpreted_string_literal_content) @injection.content)
    ]
  )
  (#set! injection.include-children)
  (#set! injection.language "sql")
)

(short_var_declaration
  left: (expression_list
    (identifier) @debel.varname (#match? @debel.varname "query|Query"))
  right: (expression_list (call_expression (argument_list
    [
      (raw_string_literal (raw_string_literal_content) @injection.content)
      (interpreted_string_literal (interpreted_string_literal_content) @injection.content)
    ]
  )))
  (#set! injection.include-children)
  (#set! injection.language "sql")
)

; JSON
(short_var_declaration
  left: (expression_list
    (identifier) @debel.varname (#match? @debel.varname "json|Json|JSON"))
  right: (expression_list
    [
      (raw_string_literal (raw_string_literal_content) @injection.content)
      (interpreted_string_literal (interpreted_string_literal_content) @injection.content)
    ]
  )
  (#set! injection.include-children)
  (#set! injection.language "json")
)
