#!/bin/bash 
# Simple utility script to automate git add-commit-push 

# Add untracked changes to be tracked for commit
# TODO: add functionality to commit specific files
function addChanges(){ 
    git add .
}

# Add tracked changes to be committed 
function commitChanges(){
    echo "Commit message:" 
    
    read commit_message 
    
    git commit -m "${commit_message}" 
}

# Push committed changes 
# TODO: add functionality to have a default commit branch 
function pushChanges(){
    echo "Commit Branch:" 

    read branch 

    git push origin "${branch}" 
} 

# Driver to execute the full add-commit-push cycle 
function deploy(){
    addChanges 
    commitChanges
    pushChanges
}

deploy