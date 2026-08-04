# 🍊 Code Orange Grad Contribution Pipeline

Operating schema for managing Code Orange graduate contributions to Bitcoin OSS.

> **Status: legacy prototype, not a live roster.** The committed records in `grads/grads.json` and `issues/open-issues.json` are unverified examples retained to document the schema. Do not use them to assign a contributor or report current outcomes. The public [PR Tracking Dashboard](https://github.com/code-orange-dev/PR-tracking-dashboard) is the source for current linked PR results.

## Live Operating Record

Before a graduate is treated as active, create or update one roster entry with these fields:

| Field | Required use |
| --- | --- |
| `cohort_id` | Identifies the cohort or entry path that produced the lead. |
| `mentor` | Named person responsible for the next check-in; use `unassigned` only before activation. |
| `last_proof` | A dated upstream link (issue, review, PR, test artifact, or public demo), not a self-reported status. |
| `next_action` / `next_action_due` | One scoped, dated move toward an upstream contribution. |
| `status` | `prospect`, `onboarding`, `active`, `blocked`, `alumni`, or `archived`; update it in the weekly scorecard. |

The pipeline operator owns the roster. The PR Verifier owns linked PR state on the dashboard. Update the operational record weekly; the dashboard remains the monthly public output snapshot.

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

> The scripts are prototype helpers. Confirm the graduate, mentor, cohort, and first proof link in the roster before using them for a live onboarding.
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

## Legacy Example Issues

See `issues/open-issues.json` for the legacy schema only. Verify the upstream issue and its state before assigning it.

## Legacy Example Roster

See `grads/grads.json` for the roster schema only. Replace its example record with a verified entry before treating it as operational data.

## Integration

This pipeline integrates with:
- GitHub (PRs, issues)
- Discord (notifications)
- [PR Tracking Dashboard](https://github.com/code-orange-dev/PR-tracking-dashboard)

---
🍊 Code Orange Dev School - Training Bitcoin OSS contributors from Southeast Asia
