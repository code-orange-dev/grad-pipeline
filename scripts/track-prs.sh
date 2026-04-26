#!/bin/bash
# Track status of all grad PRs

export GITHUB_TOKEN="${GITHUB_TOKEN:-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}"

echo "=== Code Orange PR Tracker ==="
echo "Date: $(date -u)"
echo ""

# Read issues and check PR status
jq -r '.issues[] | select(.pr_url != null) | "\(.id)|\(.pr_url)"' issues/open-issues.json | \
while IFS='|' read -r id pr_url; do
    echo "--- $id ---"
    
    # Extract repo and PR number from URL
    repo=$(echo "$pr_url" | sed 's|https://github.com/||' | sed 's|/pull/.*||')
    pr_num=$(echo "$pr_url" | sed 's|.*/pull/||')
    
    # Get PR status
    status=$(gh pr view "$pr_num" --repo "$repo" --json state -q '.state' 2>/dev/null || echo "unknown")
    
    echo "  PR: $pr_url"
    echo "  Status: $status"
    
    if [ "$status" = "MERGED" ]; then
        echo "  🎉 MERGED! Update grad stats."
    elif [ "$status" = "CLOSED" ]; then
        echo "  ⚠️ Closed. Check why."
    else
        echo "  🔄 Open. Awaiting review."
    fi
    echo ""
done

echo "=== Tracking Complete ==="
