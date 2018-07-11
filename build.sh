#!/bin/bash

# notice how we avoid spaces in $now to avoid quotation hell in go build
$now = Get-Date -UFormat "%Y-%m-%d_%T"
$sha1 = (git rev-parse HEAD).Trim()

env GOOS=windows GOARCH=amd64 go build -ldflags "-X version.COMMIT=$sha1" -o ./wsl-git.exe