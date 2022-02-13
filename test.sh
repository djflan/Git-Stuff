#!/bin/sh
echo 
exec pwsh -ExecutionPolicy RemoteSigned -File '.\.git\hooks\pre-commit.ps1' $1
exit
