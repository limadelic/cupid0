#!/bin/bash

# TCR (test && commit || revert) script
# Usage: ./tcr.sh ["commit message"]

generate_msg() {
    # Get the most significant change
    local files=$(git diff --name-only)
    local test_changes=$(echo "$files" | grep "_test\.exs$")
    local lib_changes=$(echo "$files" | grep "/lib/.*\.ex$")
    
    if [ ! -z "$test_changes" ] && [ ! -z "$lib_changes" ]; then
        echo "green: test and implementation"
    elif [ ! -z "$test_changes" ]; then
        echo "red: new test"
    elif [ ! -z "$lib_changes" ]; then
        echo "green: implementation"
    else
        echo "green: changes pass"
    fi
}

# Show what we're about to do
MSG=${1:-$(generate_msg)}
echo "Message will be: ${MSG}"

cd cupid0

# Run the tests
if mix test; then
    # If tests pass, commit all changes
    cd ..
    git add .
    git commit -m "${MSG}"
    echo "✅ Tests passed - committed: ${MSG}"
else
    # If tests fail, revert all changes
    cd ..
    git reset --hard
    echo "❌ Tests failed - changes reverted"
fi
