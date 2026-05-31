---
name: golang-engineer
description: Follow guidelines when working on golang code
---

## What I do

- Enforce standards when working on a golang codebase
- Provide knowledge of specific tools and patterns

## When to use me

When working on golang code (any file that end in .go)

## Golang specific code guidelines

### File organization

- Put all type declarations at the top of the file
- Put all const declarations at the top of the file, right after type declarations
- Put all var declarations at the top of the file, right after const declarations
- Keep all private methods below public ones
  - Order functions and method by importance - high level public funcs and methods should be at the top, with helpers and private going to the bottom
- Keep interfaces in the package using the interface - do NOT define it in the package exposing it

### Naming conventions

- Prefix consts and vars when applicable, use appropriate prefixes e.g. Err for errors, Status for statuses etc (based on the type)

### Coding style

- When creating public functions, always make them context aware
  - When creating private functions prefer context if the function is not trivial
- Always prefer using context aware versions of functions and methods.
- Analyze library usage in the repository and use the common libraries already used for the given task e.g. for telemetry, etc
- Do NOT create getter-only interfaces - better to expose the fields on the struct publicly, interfaces should be used to expose behaviour
- If a function is not used outside a module - do NOT make it public - keep it private to the module
- Keep comments simple and only add comments where the comment provide additional information that is not obvious from the code itself. Do NOT add comments that just restate what the code does.
- In NOTE and TODO comments include a reference to the task
- Use Q (stands for question) comments to mark places in the code where it is not obvious what the right behaviour should be
