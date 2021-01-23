#!/bin/bash 
# Simple utility script to automate git add-commit-push 

# Todo: add functionality to commit specific files 
git add . 

echo "Commit message:" 

read commit_message 

git commit -m $commit_message 

echo "Commit Branch:" 

read branch 

git push origin $branch 