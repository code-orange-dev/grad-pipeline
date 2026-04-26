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
