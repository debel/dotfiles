---
name: go-mock
description: create mocks from golang interfaces
---

## What I do

Whenever a mock structure is needed in golang, instead of writing it
annotate the file by adding a go comment instruction to the top of the file (must be first line!) like this one:
```go
//go:generate mockgen -source=$GOFILE -destination=$GOFILE_mock.go -package={current-package}
```

this allows you to automatically (and correctly) create mocks of all interfaces in the annotated file

replace `{current-package}` with the current package of where the interface that needs to be mocked is.

then use the bash tool to auto-generate the mocks by executing

```bash
go generate ./...
```

then continue by reading and using the newly created mock and then continue with the next tasks
