#!/bin/bash
# Track status of all grad PRs (simple version without jq)

export GITHUB_TOKEN="${GITHUB_TOKEN:-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}"
export PATH="/data/.openclaw/workspace/code-orange-sweeper:$PATH"

echo "=== Code Orange PR Tracker ==="
echo "Date: $(date -u)"
echo ""

# Define PRs to track
declare -a PRS=(
  "LND-10271|lightningnetwork/lnd|10769"
  "LND-9952|lightningnetwork/lnd|10770"
  "BDK-1936|bitcoindevkit/bdk|2191"
  "RUST-BTC-1802|rust-bitcoin/rust-bitcoin|6083"
)

for pr_info in "${PRS[@]}"; do
    IFS='|' read -r id repo pr_num <<< "$pr_info"
    
    echo "--- $id ---"
    echo "  Repo: $repo"
    echo "  PR: #$pr_num"
    
    # Get PR status using gh CLI
    status=$(gh pr view "$pr_num" --repo "$repo" --json state -q '.state' 2>/dev/null || echo "unknown")
    title=$(gh pr view "$pr_num" --repo "$repo" --json title -q '.title' 2>/dev/null || echo "unknown")
    
    echo "  Title: $title"
    echo "  Status: $status"
    
    if [ "$status" = "MERGED" ]; then
        echo "  🎉 MERGED!"
    elif [ "$status" = "CLOSED" ]; then
        echo "  ⚠️ Closed"
    else
        echo "  🔄 Open"
    fi
    echo ""
done

echo "=== Tracking Complete ==="
echo ""
echo "Total PRs tracked: ${#PRS[@]}"
