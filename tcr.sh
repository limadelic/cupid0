#!/bin/bash

# TCR (test && commit || revert) script
# Usage: tcr <verb>:<description>
# Example: tcr add:user authentication

if [ -z "$1" ]; then
    echo "❌ Error: Commit message required in format verb:description"
    echo "Example: tcr add:user authentication"
    exit 1
fi

if [[ ! "$1" =~ ^[a-z]+:.+ ]]; then
    echo "❌ Error: Message must be in format verb:description"
    echo "Example: tcr add:user authentication"
    exit 1
fi

# Run the tests
if mix test; then
    # If tests pass, commit and push all changes
    git add .
    git commit -m "$1"
    git push
    echo "✅ Tests passed - committed and pushed: $1"
else
    # If tests fail, revert all changes
    git reset --hard
    echo "❌ Tests failed - changes reverted"
fi
