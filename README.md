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
