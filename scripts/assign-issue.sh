#!/bin/bash
# Assign an issue to a grad

ISSUE_ID=$1
GRAD_GITHUB=$2

if [ -z "$ISSUE_ID" ] || [ -z "$GRAD_GITHUB" ]; then
    echo "Usage: ./assign-issue.sh <issue-id> <grad-github-username>"
    exit 1
fi

echo "Assigning $ISSUE_ID to @$GRAD_GITHUB..."

# Update issues database
jq --arg id "$ISSUE_ID" --arg grad "$GRAD_GITHUB" \
   '.issues |= map(if .id == $id then .assigned_to = $grad else . end)' \
   issues/open-issues.json > issues/open-issues.json.tmp
mv issues/open-issues.json.tmp issues/open-issues.json

echo "✅ Issue assigned"
echo "Next steps:"
echo "1. Create issue in code-orange-dev/grad-issues"
echo "2. Notify grad on Discord"
echo "3. Add to tracking dashboard"
