#!/bin/bash
# Code Orange Grad Contribution Pipeline Setup

echo "=== Code Orange Grad Contribution Pipeline ==="

mkdir -p code-orange-grad-pipeline
cd code-orange-grad-pipeline

# Create directory structure
mkdir -p {issues,grads,prs,scripts,templates}

echo "1. Creating issue templates..."

# Issue template for grads
cat > templates/grad-issue-template.md << 'EOF'
# 🍊 Code Orange Grad Issue

**Issue:** #[NUMBER]  
**Repo:** [REPO]  
**Upstream:** [UPSTREAM_URL]  
**Difficulty:** [BEGINNER|INTERMEDIATE|ADVANCED]  
**Language:** [LANGUAGE]  
**Skills:** [SKILLS]

## Description
[BRIEF_DESCRIPTION]

## Tasks
- [ ] Fork the repo to your GitHub account
- [ ] Clone locally: `git clone https://github.com/YOUR_USERNAME/[REPO].git`
- [ ] Create branch: `git checkout -b fix/[ISSUE_NUMBER]-[DESCRIPTION]`
- [ ] Implement the fix/feature
- [ ] Add tests
- [ ] Run tests: `make test` or equivalent
- [ ] Commit with good message
- [ ] Push: `git push origin fix/[ISSUE_NUMBER]-[DESCRIPTION]`
- [ ] Submit PR to upstream
- [ ] Update tracking dashboard

## Resources
- [Contributing Guide](CONTRIBUTING_URL)
- [Code Style Guide](STYLE_GUIDE_URL)
- [Related Issues](RELATED_ISSUES)

## Mentor
@keypleb

## Questions?
Ask in [Discord](https://discord.gg/xd6dmPF9bA) #dev-help channel

---
🍊 Code Orange Dev School
EOF

# Grad onboarding template
cat > templates/grad-onboarding.md << 'EOF'
# 🍊 Welcome to Code Orange OSS Contributions!

## Your First Contribution

### Step 1: Setup
1. Create GitHub account
2. Fork the target repo to your account
3. Join [Code Orange Discord](https://discord.gg/xd6dmPF9bA)
4. Introduce yourself in #introductions

### Step 2: Pick an Issue
1. Check the [Issue Board](https://github.com/code-orange-dev/grad-issues)
2. Pick issue matching your skills
3. Comment "🍊 Taking this" on the issue
4. Wait for assignment

### Step 3: Work on It
1. Clone your fork
2. Create branch
3. Implement fix
4. Test thoroughly
5. Commit & push

### Step 4: Submit PR
1. Create PR to upstream (not your fork)
2. Use PR template
3. Reference Code Orange
4. Request review from mentor

### Step 5: Iterate
1. Respond to feedback
2. Make changes
3. Get approval
4. Merge! 🎉

## Support

- **Technical help:** Discord #dev-help
- **Mentor:** @keypleb
- **Weekly sync:** Bitcoin House Bali, Sundays 2pm

## Recognition

- PR merged → Code Orange certificate
- 3 PRs merged → "Contributor" badge
- 10 PRs merged → "Core Contributor" status
- Featured on [PR Tracking Dashboard](https://github.com/code-orange-dev/PR-tracking-dashboard)

---
Ready to start? Pick your first issue! 🚀
EOF

echo "2. Creating grad tracking system..."

# Grad database
cat > grads/grads.json << 'EOF'
{
  "grads": [
    {
      "github": "example-grad",
      "name": "Example Grad",
      "country": "Indonesia",
      "skills": ["Go", "Bitcoin"],
      "joined": "2026-04-26",
      "prs_submitted": 0,
      "prs_merged": 0,
      "issues_completed": [],
      "status": "active"
    }
  ]
}
EOF

# Issue database
cat > issues/open-issues.json << 'EOF'
{
  "issues": [
    {
      "id": "LND-10271",
      "repo": "lnd",
      "upstream_issue": 10271,
      "title": "Add change_addr to SendCoins",
      "difficulty": "beginner",
      "language": "Go",
      "skills": ["Go", "Protobuf", "CLI"],
      "status": "in-progress",
      "assigned_to": "code-orange-dev",
      "pr_url": "https://github.com/lightningnetwork/lnd/pull/10769"
    },
    {
      "id": "LND-9952",
      "repo": "lnd",
      "upstream_issue": 9952,
      "title": "MPP record support for QueryRoutes",
      "difficulty": "intermediate",
      "language": "Go",
      "skills": ["Go", "Protobuf", "Lightning"],
      "status": "in-progress",
      "assigned_to": "code-orange-dev",
      "pr_url": "https://github.com/lightningnetwork/lnd/pull/10770"
    },
    {
      "id": "BDK-1936",
      "repo": "bdk",
      "upstream_issue": 1936,
      "title": "Move TxTemplate to bdk_testenv",
      "difficulty": "beginner",
      "language": "Rust",
      "skills": ["Rust", "Testing"],
      "status": "in-progress",
      "assigned_to": "code-orange-dev",
      "pr_url": "https://github.com/bitcoindevkit/bdk/pull/2191"
    },
    {
      "id": "RUST-BTC-1802",
      "repo": "rust-bitcoin",
      "upstream_issue": 1802,
      "title": "TryFrom<&str> for FromStr types",
      "difficulty": "beginner",
      "language": "Rust",
      "skills": ["Rust", "Traits"],
      "status": "in-progress",
      "assigned_to": "code-orange-dev",
      "pr_url": "https://github.com/rust-bitcoin/rust-bitcoin/pull/6083"
    }
  ]
}
EOF

echo "3. Creating automation scripts..."

# Script to assign issue to grad
cat > scripts/assign-issue.sh << 'SCRIPT_EOF'
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
SCRIPT_EOF

chmod +x scripts/assign-issue.sh

# Script to track PR status
cat > scripts/track-prs.sh << 'SCRIPT_EOF'
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
SCRIPT_EOF

chmod +x scripts/track-prs.sh

# Script to onboard new grad
cat > scripts/onboard-grad.sh << 'SCRIPT_EOF'
#!/bin/bash
# Onboard a new grad

GRAD_GITHUB=$1
GRAD_NAME=$2
GRAD_COUNTRY=$3

if [ -z "$GRAD_GITHUB" ] || [ -z "$GRAD_NAME" ]; then
    echo "Usage: ./onboard-grad.sh <github-username> <full-name> [country]"
    exit 1
fi

echo "🍊 Onboarding $GRAD_NAME (@$GRAD_GITHUB)..."

# Add to grads database
jq --arg gh "$GRAD_GITHUB" --arg name "$GRAD_NAME" --arg country "${GRAD_COUNTRY:-Unknown}" \
   '.grads += [{"github": $gh, "name": $name, "country": $country, "skills": [], "joined": "'$(date -I)'", "prs_submitted": 0, "prs_merged": 0, "issues_completed": [], "status": "active"}]' \
   grads/grads.json > grads/grads.json.tmp
mv grads/grads.json.tmp grads/grads.json

echo "✅ Grad added to database"
echo ""
echo "Next steps:"
echo "1. Send onboarding template: templates/grad-onboarding.md"
echo "2. Add to Discord #grads channel"
echo "3. Schedule intro call"
echo "4. Assign first issue"
SCRIPT_EOF

chmod +x scripts/onboard-grad.sh

echo "4. Creating PR template..."

cat > templates/pr-template.md << 'EOF'
## Summary

[Brief description of changes]

## Changes

- [ ] Change 1
- [ ] Change 2
- [ ] Change 3

## Testing

- [ ] Unit tests added
- [ ] Integration tests pass
- [ ] Manual testing completed

## Related Issues

Fixes [upstream#issue-number]

## Checklist

- [ ] Code follows project style
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] CHANGELOG updated (if applicable)

---
🍊 [Code Orange Dev School](https://github.com/code-orange-dev) contribution
- Grad: @GRAD_GITHUB
- Mentor: @keypleb
- Cohort: [COHORT_NAME]
EOF

echo "5. Creating README..."

cat > README.md << 'EOF'
# 🍊 Code Orange Grad Contribution Pipeline

Automated system for managing Code Orange grad contributions to Bitcoin OSS.

## Directory Structure

```
code-orange-grad-pipeline/
├── grads/           # Grad database
├── issues/          # Issue tracking
├── prs/             # PR tracking
├── scripts/         # Automation scripts
├── templates/       # Issue/PR templates
└── README.md        # This file
```

## Quick Start

### Onboard a New Grad
```bash
./scripts/onboard-grad.sh github-username "Full Name" "Country"
```

### Assign an Issue
```bash
./scripts/assign-issue.sh ISSUE-ID grad-github-username
```

### Track PR Status
```bash
./scripts/track-prs.sh
```

## Workflows

### 1. New Grad Onboarding
1. Run `onboard-grad.sh`
2. Send `templates/grad-onboarding.md`
3. Add to Discord
4. Pick first issue

### 2. Issue Assignment
1. Grad picks issue from board
2. Run `assign-issue.sh`
3. Create tracking issue
4. Monitor progress

### 3. PR Submission
1. Grad submits PR using `templates/pr-template.md`
2. Mentor reviews
3. Address feedback
4. Merge!

### 4. Recognition
- PR merged → Certificate
- 3 PRs → Contributor badge
- 10 PRs → Core Contributor

## Active Issues

See `issues/open-issues.json` for current assignments.

## Grads

See `grads/grads.json` for grad database.

## Integration

This pipeline integrates with:
- GitHub (PRs, issues)
- Discord (notifications)
- [PR Tracking Dashboard](https://github.com/code-orange-dev/PR-tracking-dashboard)

---
🍊 Code Orange Dev School - Training Bitcoin OSS contributors from Southeast Asia
EOF

echo ""
echo "=== Pipeline Setup Complete ==="
echo ""
ls -la
echo ""
echo "Next steps:"
echo "1. Review README.md"
echo "2. Add real grad data to grads/grads.json"
echo "3. Run ./scripts/track-prs.sh to check current PRs"
echo "4. Create GitHub repo: code-orange-dev/grad-pipeline"
echo "5. Push this directory to that repo"
