#!/usr/bin/env bash
# Usage: ./scripts/create-labels.sh   (requires GitHub CLI: gh auth login)
set -e
mk() { gh label create "$1" --color "$2" --description "$3" --force; }

# Type
mk feature  0E8A16 "New functionality"
mk bug      D73A4A "Something is broken"
mk chore    CFD3D7 "Maintenance, tooling"
mk spike    FBCA04 "Time-boxed research"
mk docs     0075CA "Documentation"

# Area
mk frontend 1D76DB "React client"
mk backend  5319E7 "Node/Express API"
mk devops   B60205 "CI, deploy, infra"

# Priority
mk P0 B60205 "Must have for MVP"
mk P1 F9A825 "Should have"

# Epics
mk E0-setup      BFD4F2 "Project setup and DevOps"
mk E1-auth       BFD4F2 "Authentication and roles"
mk E2-profiles   BFD4F2 "Student and staff profiles"
mk E3-gatepass   BFD4F2 "Gate pass and QR generation"
mk E4-scanner    BFD4F2 "Security scanner"
mk E5-dashboards BFD4F2 "Dashboards"
mk E6-qa         BFD4F2 "Quality and release"

# Flags
mk blocked          000000 "Waiting on something"
mk "needs-decision" FEF2C0 "Needs Lead or hostel-office decision"
mk "security-review" B60205 "Lead must review"
echo "Labels created."
