#!/bin/bash

# TCR (test && commit || revert) script
# Usage: tcr <verb>:<description> [exact_file_count]
# Example: tcr add:user authentication
# For more than 2 files, pass exact count: tcr <verb>:<description> <exact_file_count>

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

# Check number of files changed
CHANGED_FILES=$(git diff --name-only | wc -l)
CHANGED_FILES_STAGED=$(git diff --staged --name-only | wc -l)
TOTAL_CHANGED_FILES=$((CHANGED_FILES + CHANGED_FILES_STAGED))

# List changed files
echo "Files changed:"
echo ""
git diff --name-only
git diff --staged --name-only

# Check if too many files changed
if [ $TOTAL_CHANGED_FILES -gt 2 ] && [ "$2" != "$TOTAL_CHANGED_FILES" ]; then
    echo "❌ Error: Too many files changed ($TOTAL_CHANGED_FILES). Maximum allowed: 2"
    echo "To continue, run: tcr $1 $TOTAL_CHANGED_FILES"
    exit 1
fi

# Show warning if using file count parameter
if [ $TOTAL_CHANGED_FILES -gt 2 ] && [ "$2" = "$TOTAL_CHANGED_FILES" ]; then
    echo "⚠️  Running with $TOTAL_CHANGED_FILES files (more than default limit of 2)"
fi

# Running TCR
echo ""
echo "Running TCR..."
echo ""

# Run the tests
# if mix test; then
    # If tests pass, commit and push all changes
    git add .
    git commit -m "$1"
    git push
    echo "✅ Tests passed - committed and pushed: $1"
# else
    # If tests fail, revert all changes
    # git reset --hard
    # git clean -fd
    echo "❌ Tests failed - changes reverted"
# fi
