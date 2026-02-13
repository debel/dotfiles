---
name: go-migrate
description: create migrations for sql database changes
---

## What I do

Whenever there is a need to make a change to the DB schema - try to do it through a migration.

First, search for .sql files containing already existing migrations.
If these do NOT exist - ask (using `question` tool) on how to proceed

Otherwise, use `bash` tool to execute `migrate create` for new migrations.
This will create an appropriate set of up/down files - put changes to the DB there.

Then use `bash` to run `migrate up` - this should apply the migrations to the local DB
If `migrate up` fails - alert me - do NOT retry - the local DB might not be setup correctly 

Afterwards continue with the outstanding tasks - using the new schema and the new migrations
