#!/bin/sh
echo 
exec pwsh -ExecutionPolicy RemoteSigned -File '.\.git\hooks\prepare-commit-msg.ps1' $1 $2 $3
exit
