#!/usr/bin/env bash
# Creates sprint milestones and all MVP backlog issues.
# Usage:  DRY_RUN=1 bash scripts/create-issues.sh   (print only)
#         bash scripts/create-issues.sh             (create for real; run ONCE)
# Needs: GitHub CLI logged in (gh auth login), run from inside the cloned repo,
#        and labels created first (scripts/create-labels.sh).
set -e
run() { if [ -n "$DRY_RUN" ]; then echo "DRY: $*" | head -c 160; echo; else "$@"; fi; }
echo "Creating milestones..."
run gh api repos/{owner}/{repo}/milestones -f title='Sprint 0 - Setup' >/dev/null 2>&1 || echo "  (milestone exists or skipped: Sprint 0 - Setup)"
run gh api repos/{owner}/{repo}/milestones -f title='Sprint 1 - Auth and Profiles' >/dev/null 2>&1 || echo "  (milestone exists or skipped: Sprint 1 - Auth and Profiles)"
run gh api repos/{owner}/{repo}/milestones -f title='Sprint 2 - Gate Pass and QR' >/dev/null 2>&1 || echo "  (milestone exists or skipped: Sprint 2 - Gate Pass and QR)"
run gh api repos/{owner}/{repo}/milestones -f title='Sprint 3 - Scanner Flow' >/dev/null 2>&1 || echo "  (milestone exists or skipped: Sprint 3 - Scanner Flow)"
run gh api repos/{owner}/{repo}/milestones -f title='Sprint 4 - Dashboards, QA and UAT' >/dev/null 2>&1 || echo "  (milestone exists or skipped: Sprint 4 - Dashboards, QA and UAT)"
echo "Creating issues..."
run gh issue create --title '[SETUP-01] Init repo with /client and /server, ESLint, Prettier, Husky, README' --label chore,P0,E0-setup,devops --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-01
**PRD requirement:** Contributing guide
**Track:** Tech Lead / DevOps
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Repo has /client and /server folders
- [ ] ESLint, Prettier and Husky run on commit
- [ ] README explains local setup
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
None
'
sleep 1
run gh issue create --title '[SETUP-02] Express boilerplate: config, error handler, logger, helmet, CORS' --label chore,P0,E0-setup,backend --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-02
**PRD requirement:** NFR Security
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Server starts with npm run dev
- [ ] Central error handler returns the standard error shape
- [ ] helmet and CORS allow-list configured from env
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-01
'
sleep 1
run gh issue create --title '[SETUP-03] MongoDB Atlas, Mongoose connection, env handling' --label chore,P0,E0-setup,backend --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-03
**PRD requirement:** Data model
**Track:** Backend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Connects using MONGO_URI
- [ ] App fails fast with a clear message if env is missing
- [ ] .env.example is complete
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-02
'
sleep 1
run gh issue create --title '[SETUP-04] React + Vite + Tailwind + Router + Axios instance + layout shell' --label chore,P0,E0-setup,frontend --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-04
**PRD requirement:** NFR Usability
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Routing works with a public layout and an app layout
- [ ] Axios instance uses VITE_API_URL and sends cookies
- [ ] Mobile-first base styles
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-01
'
sleep 1
run gh issue create --title '[SETUP-05] UI kit: button, input, modal, toast, table, status badge, loader' --label chore,P0,E0-setup,frontend --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-05
**PRD requirement:** NFR Usability
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Components documented with props
- [ ] StatusBadge supports all pass statuses
- [ ] Usable on a 360px wide screen
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-04
'
sleep 1
run gh issue create --title '[SETUP-06] GitHub: branch rules, PR template, issue templates, CI for lint and tests' --label chore,P0,E0-setup,devops --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-06
**PRD requirement:** Contributing guide
**Track:** Tech Lead / DevOps
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] main and develop are protected
- [ ] CI is required to pass before merge
- [ ] Templates and CODEOWNERS are in place
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-01
'
sleep 1
run gh issue create --title '[SETUP-07] File upload service: Multer, Cloudinary or S3, type and size validation' --label chore,P0,E0-setup,backend --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-07
**PRD requirement:** STU-2, STU-3, STF-1
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Rejects wrong file types and files over the size limit
- [ ] Files are stored privately
- [ ] Returns a storage URL or key
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-02
'
sleep 1
run gh issue create --title '[SETUP-08] Spike: browser camera capture and QR scan proof of concept' --label spike,P0,E0-setup,frontend --milestone 'Sprint 0 - Setup' --body '**Issue ID:** SETUP-08
**PRD requirement:** STU-2, QR-3
**Track:** Frontend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 0 - Setup

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Camera capture works on Android Chrome and iOS Safari over HTTPS
- [ ] QR scan works on a mid-range phone
- [ ] Short written recommendation of the library
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-04
'
sleep 1
run gh issue create --title '[AUTH-BE-01] User model and student registration API with validation' --label feature,P0,E1-auth,backend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-BE-01
**PRD requirement:** AUTH-1, AUTH-5
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Username and email are unique (409 on duplicate)
- [ ] Password hashed with bcrypt
- [ ] Validation errors return 400 with field details
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-03
'
sleep 1
run gh issue create --title '[AUTH-BE-02] Login, logout, me APIs with JWT httpOnly cookie' --label feature,P0,E1-auth,backend,security-review --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-BE-02
**PRD requirement:** AUTH-2, AUTH-3, AUTH-5
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Login accepts username or email
- [ ] Cookie is httpOnly, secure and sameSite
- [ ] Inactive users cannot log in
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-01
'
sleep 1
run gh issue create --title '[AUTH-BE-03] RBAC middleware and protected route helpers' --label feature,P0,E1-auth,backend,security-review --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-BE-03
**PRD requirement:** AUTH-6
**Track:** Backend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Routes can require one or more roles
- [ ] 401 when not logged in, 403 for wrong role
- [ ] Unit tests for each role
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-02
'
sleep 1
run gh issue create --title '[AUTH-BE-04] Admin seed script and create/list/deactivate security accounts API' --label feature,P0,E1-auth,backend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-BE-04
**PRD requirement:** AUTH-4, STF-3
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] npm run seed creates the first admin from env values
- [ ] Admin can create, list and deactivate security accounts
- [ ] Security accounts cannot be self-registered
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-03
'
sleep 1
run gh issue create --title '[AUTH-BE-05] Rate limiting and brute-force protection on auth routes' --label feature,P0,E1-auth,backend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-BE-05
**PRD requirement:** NFR Security
**Track:** Backend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Limits applied to register and login
- [ ] 429 returned with the standard error shape
- [ ] Limits are configurable
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-02
'
sleep 1
run gh issue create --title '[AUTH-BE-06] Forgot and reset password by email' --label feature,P1,E1-auth,backend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-BE-06
**PRD requirement:** AUTH-7
**Track:** Backend
**Priority:** P1
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Reset token is single-use and expires
- [ ] Response does not reveal whether an email exists
- [ ] Email sent through a configurable provider
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-02
'
sleep 1
run gh issue create --title '[AUTH-FE-01] Student registration page with validation' --label feature,P0,E1-auth,frontend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-FE-01
**PRD requirement:** AUTH-1
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Fields: full name, username, email, password, confirm password
- [ ] Inline validation and server error display
- [ ] Redirects to profile completion after success
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-05, AUTH-BE-01
'
sleep 1
run gh issue create --title '[AUTH-FE-02] Login page with role-based redirect' --label feature,P0,E1-auth,frontend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-FE-02
**PRD requirement:** AUTH-2, AUTH-3
**Track:** Frontend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Student goes to student dashboard; admin and security go to staff dashboard
- [ ] Clear error on wrong credentials
- [ ] Works on mobile
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-05, AUTH-BE-02
'
sleep 1
run gh issue create --title '[AUTH-FE-03] Auth context, protected routes, 401 handling, logout' --label feature,P0,E1-auth,frontend,security-review --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** AUTH-FE-03
**PRD requirement:** AUTH-6
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Unauthenticated users are redirected to login
- [ ] Wrong-role access shows a 403 page
- [ ] Session restored on refresh via /auth/me
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-FE-02
'
sleep 1
run gh issue create --title '[PROF-BE-01] StudentProfile model with GET and PUT profile APIs and completion flag' --label feature,P0,E2-profiles,backend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** PROF-BE-01
**PRD requirement:** STU-1, STU-5, STU-6
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Profile fields from the PRD stored and validated
- [ ] isComplete is computed on the server
- [ ] Student can only access own profile
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-03
'
sleep 1
run gh issue create --title '[PROF-BE-02] Live photo and hostel certificate upload endpoints' --label feature,P0,E2-profiles,backend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** PROF-BE-02
**PRD requirement:** STU-2, STU-3
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Photo endpoint accepts image only and stores photoCapturedAt
- [ ] Certificate accepts PDF/JPG/PNG up to 5 MB
- [ ] Files served by short-lived signed URLs
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-07, PROF-BE-01
'
sleep 1
run gh issue create --title '[PROF-BE-03] StaffProfile model and APIs for Admin and Security (incl. ID card photo)' --label feature,P0,E2-profiles,backend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** PROF-BE-03
**PRD requirement:** STF-1, STF-2
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Security profile has name, phone, email, security ID number, ID card photo
- [ ] Admin profile has designation
- [ ] Each user edits only their own profile
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-04, SETUP-07
'
sleep 1
run gh issue create --title '[PROF-BE-04] Admin list and search students; verify or reject profile' --label feature,P1,E2-profiles,backend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** PROF-BE-04
**PRD requirement:** STF-4, AUTH-8
**Track:** Backend
**Priority:** P1
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Paginated list with search by name, username, room
- [ ] Verify or reject with remarks
- [ ] Gate pass creation can check verification when enabled
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
PROF-BE-01
'
sleep 1
run gh issue create --title '[PROF-FE-01] Student profile multi-step form with completion indicator' --label feature,P0,E2-profiles,frontend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** PROF-FE-01
**PRD requirement:** STU-1, STU-5, STU-6
**Track:** Frontend
**Priority:** P0
**Estimate:** L (3 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Steps: personal, contact and parent, address, documents
- [ ] Progress indicator shows completion percentage
- [ ] Edits save and reload correctly
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-FE-03, PROF-BE-01
'
sleep 1
run gh issue create --title '[PROF-FE-02] Live camera capture component with retake and permission errors' --label feature,P0,E2-profiles,frontend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** PROF-FE-02
**PRD requirement:** STU-2
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Camera only, no gallery picker
- [ ] Retake and preview supported
- [ ] Friendly message when permission is denied
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-08
'
sleep 1
run gh issue create --title '[PROF-FE-03] Hostel certificate upload with preview and size/type errors' --label feature,P0,E2-profiles,frontend --milestone 'Sprint 1 - Auth and Profiles' --body '**Issue ID:** PROF-FE-03
**PRD requirement:** STU-3
**Track:** Frontend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 1 - Auth and Profiles

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Preview for images and PDFs
- [ ] Errors for wrong type and over 5 MB
- [ ] Upload progress shown
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
PROF-BE-02
'
sleep 1
run gh issue create --title '[PROF-FE-04] Security profile page and Admin screens for security staff and students' --label feature,P0,E2-profiles,frontend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** PROF-FE-04
**PRD requirement:** STF-1, STF-3, STF-4
**Track:** Frontend
**Priority:** P0
**Estimate:** L (3 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Security user can edit own profile and ID card photo
- [ ] Admin can create and deactivate security accounts
- [ ] Admin can search students and open a profile
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
PROF-BE-03, AUTH-BE-04
'
sleep 1
run gh issue create --title '[GP-BE-01] GatePass model, pass number generator, status enum and transition rules' --label feature,P0,E3-gatepass,backend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-BE-01
**PRD requirement:** GP-4, Status lifecycle
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Pass number format GP-YYMM-0001, unique
- [ ] Transitions allowed only as in the PRD lifecycle
- [ ] Status changes happen only through the state machine service
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-03
'
sleep 1
run gh issue create --title '[GP-BE-02] Create pass API: validation, profile-complete check, one-active-pass rule' --label feature,P0,E3-gatepass,backend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-BE-02
**PRD requirement:** GP-1, GP-2, GP-3, STU-5
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Rejects past out time and in time before out time
- [ ] 409 if the student already has an active pass
- [ ] 403 if the profile is incomplete
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-01, PROF-BE-01
'
sleep 1
run gh issue create --title '[GP-BE-03] QR token signing service with validity window and nonce' --label feature,P0,E3-gatepass,backend,security-review --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-BE-03
**PRD requirement:** QR-1, QR-2
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Token holds pass ID, nonce and expiry only, no personal data
- [ ] Tampered tokens are rejected
- [ ] Validity window comes from settings
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-01
'
sleep 1
run gh issue create --title '[GP-BE-04] List, detail and cancel pass APIs' --label feature,P0,E3-gatepass,backend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-BE-04
**PRD requirement:** GP-5, GP-6
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Student sees only own passes
- [ ] Filters by status and date range with pagination
- [ ] Cancel allowed only in GENERATED state
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-02
'
sleep 1
run gh issue create --title '[GP-BE-05] Cron job: auto-expire unscanned passes and flag overdue' --label feature,P0,E3-gatepass,backend --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** GP-BE-05
**PRD requirement:** QR-2, QR-7
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] GENERATED passes past the QR window become EXPIRED
- [ ] OUT passes past in-time plus grace become OVERDUE
- [ ] Job is idempotent and logs its runs
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-01
'
sleep 1
run gh issue create --title '[GP-FE-01] Create gate pass form with prefilled fields and validation' --label feature,P0,E3-gatepass,frontend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-FE-01
**PRD requirement:** GP-1, GP-2
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Name, room and phone prefilled from profile
- [ ] Date, day and timestamp shown automatically
- [ ] Validation matches the server rules
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-02, SETUP-05
'
sleep 1
run gh issue create --title '[GP-FE-02] Digital pass card with photo, details and QR' --label feature,P0,E3-gatepass,frontend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-FE-02
**PRD requirement:** GP-4, QR-1
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Shows photo, pass number, details, QR and status
- [ ] Readable and scannable on a phone screen
- [ ] Expired and cancelled passes visibly disabled
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-03, GP-FE-01
'
sleep 1
run gh issue create --title '[GP-FE-03] Pass history list with filters and cancel action' --label feature,P0,E3-gatepass,frontend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-FE-03
**PRD requirement:** GP-5, GP-6
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Filters by status and date range
- [ ] Cancel with confirmation
- [ ] Empty and loading states
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-04
'
sleep 1
run gh issue create --title '[GP-FE-04] Reusable status progress bar (Generated, Out, Returned)' --label feature,P0,E3-gatepass,frontend --milestone 'Sprint 2 - Gate Pass and QR' --body '**Issue ID:** GP-FE-04
**PRD requirement:** QR-5
**Track:** Frontend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 2 - Gate Pass and QR

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Shows current stage and special states (Expired, Cancelled, Overdue)
- [ ] Used on student, security and admin views
- [ ] Accessible labels
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-05
'
sleep 1
run gh issue create --title '[GP-FE-05] Download pass as PDF or image' --label feature,P1,E3-gatepass,frontend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** GP-FE-05
**PRD requirement:** GP-7
**Track:** Frontend
**Priority:** P1
**Estimate:** M (2 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Download includes QR, details and photo
- [ ] File name includes the pass number
- [ ] Works on mobile browsers
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-FE-02
'
sleep 1
run gh issue create --title '[SCAN-BE-01] Verify API: check signature, window, status; return student card' --label feature,P0,E4-scanner,backend,security-review --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** SCAN-BE-01
**PRD requirement:** QR-3, QR-8
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Returns photo, name, room, destination, reason, times and allowed action (exit or entry)
- [ ] Distinct error codes: PASS_EXPIRED, PASS_ALREADY_USED, PASS_CANCELLED, QR_INVALID
- [ ] Only security and admin roles allowed
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-03
'
sleep 1
run gh issue create --title '[SCAN-BE-02] Confirm exit API with atomic status update' --label feature,P0,E4-scanner,backend,security-review --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** SCAN-BE-02
**PRD requirement:** QR-4
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] GENERATED to OUT with actualOutAt and guard saved
- [ ] Second call is rejected, even under concurrent requests
- [ ] Test for the double-scan case
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-BE-01
'
sleep 1
run gh issue create --title '[SCAN-BE-03] Confirm entry API; expire QR; compute late flag' --label feature,P0,E4-scanner,backend,security-review --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** SCAN-BE-03
**PRD requirement:** QR-6, QR-7
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] OUT or OVERDUE to RETURNED with actualInAt and guard saved
- [ ] QR is invalid afterward
- [ ] isLate computed from planned in-time plus grace
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-BE-02
'
sleep 1
run gh issue create --title '[SCAN-BE-04] ScanLog model and logging on every action, including rejections' --label feature,P0,E4-scanner,backend --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** SCAN-BE-04
**PRD requirement:** QR-9
**Track:** Backend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Every verify, exit, entry and rejection is logged
- [ ] Logs are append-only
- [ ] Log holds actor, action, result and reason
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-BE-01
'
sleep 1
run gh issue create --title '[SCAN-BE-05] Manual search by pass number or username' --label feature,P1,E4-scanner,backend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** SCAN-BE-05
**PRD requirement:** QR-10
**Track:** Backend
**Priority:** P1
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Search by pass number or student username
- [ ] Returns the same card as verify
- [ ] Role-restricted
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-BE-01
'
sleep 1
run gh issue create --title '[SCAN-FE-01] Camera QR scanner page, mobile-first' --label feature,P0,E4-scanner,frontend,security-review --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** SCAN-FE-01
**PRD requirement:** QR-3
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Opens the rear camera and scans without extra taps
- [ ] Scan result calls the verify API
- [ ] Handles permission denied and no camera
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-08, SCAN-BE-01
'
sleep 1
run gh issue create --title '[SCAN-FE-02] Student verification card with Done and Student In buttons' --label feature,P0,E4-scanner,frontend,security-review --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** SCAN-FE-02
**PRD requirement:** QR-3, QR-4, QR-6
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Large photo and key details for visual check
- [ ] Only the valid action button is shown (Done or Student In)
- [ ] Success state updates the progress bar
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-FE-01, SCAN-BE-02, SCAN-BE-03
'
sleep 1
run gh issue create --title '[SCAN-FE-03] Error states (expired, used, cancelled, invalid) and manual search UI' --label feature,P0,E4-scanner,frontend --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** SCAN-FE-03
**PRD requirement:** QR-8, QR-10
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] A clear screen for each error code
- [ ] Manual search form works as a fallback
- [ ] Guard can return to scanning in one tap
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-FE-02
'
sleep 1
run gh issue create --title '[DASH-BE-01] Student stats API: totals, weekly and monthly series, timeline data' --label feature,P0,E5-dashboards,backend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-BE-01
**PRD requirement:** SDASH-1, SDASH-3, SDASH-4
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Totals for all time, week and month, plus late returns
- [ ] Daily series for the week and the month
- [ ] Timeline entries have actual out and in times
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-04
'
sleep 1
run gh issue create --title '[DASH-BE-02] Admin/Security summary API: strength, present, out, today/week/month/year' --label feature,P0,E5-dashboards,backend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-BE-02
**PRD requirement:** ADASH-1, ADASH-2
**Track:** Backend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Total strength from settings or student count
- [ ] Present equals strength minus currently out
- [ ] Period counts use IST day and week boundaries
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
GP-BE-04
'
sleep 1
run gh issue create --title '[DASH-BE-03] Currently-out and overdue list API' --label feature,P0,E5-dashboards,backend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-BE-03
**PRD requirement:** ADASH-3
**Track:** Backend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Lists OUT and OVERDUE students with photo, room, destination and times
- [ ] Sorted with overdue first
- [ ] Response under 2 seconds
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-BE-02
'
sleep 1
run gh issue create --title '[DASH-BE-04] CSV export API with date filters' --label feature,P1,E5-dashboards,backend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-BE-04
**PRD requirement:** ADASH-6
**Track:** Backend
**Priority:** P1
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Filters by date range and status
- [ ] Admin only
- [ ] Streams the file for large ranges
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
DASH-BE-02
'
sleep 1
run gh issue create --title '[DASH-FE-01] Student dashboard: summary cards and weekly/monthly charts' --label feature,P0,E5-dashboards,frontend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-FE-01
**PRD requirement:** SDASH-1, SDASH-2, SDASH-3, SDASH-5
**Track:** Frontend
**Priority:** P0
**Estimate:** L (3 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Cards for total, week, month and late returns
- [ ] Current pass tracker with progress bar
- [ ] Weekly and monthly charts render on mobile
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
DASH-BE-01, GP-FE-04
'
sleep 1
run gh issue create --title '[DASH-FE-02] Student timeline (Gantt-style) chart' --label feature,P0,E5-dashboards,frontend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-FE-02
**PRD requirement:** SDASH-4
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Each outing is a bar from actual out time to in time
- [ ] Tooltip shows destination and duration
- [ ] Handles an empty history
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
DASH-BE-01
'
sleep 1
run gh issue create --title '[DASH-FE-03] Admin/Security dashboard: headline cards and period counts' --label feature,P0,E5-dashboards,frontend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-FE-03
**PRD requirement:** ADASH-1, ADASH-2, ADASH-4, ADASH-5
**Track:** Frontend
**Priority:** P0
**Estimate:** L (3 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Strength, present and outside cards
- [ ] Today, week, month and year counts and trend chart
- [ ] Security view has a prominent Scan QR button
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
DASH-BE-02
'
sleep 1
run gh issue create --title '[DASH-FE-04] Live out-of-campus table with auto refresh and overdue highlight' --label feature,P0,E5-dashboards,frontend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** DASH-FE-04
**PRD requirement:** ADASH-3
**Track:** Frontend
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Refreshes every 30 seconds
- [ ] Overdue rows highlighted
- [ ] Search by name or room
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
DASH-BE-03
'
sleep 1
run gh issue create --title '[QA-01] Unit and integration tests for pass state machine and scan APIs' --label chore,P0,E6-qa,backend --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** QA-01
**PRD requirement:** Testing section
**Track:** Backend
**Priority:** P0
**Estimate:** L (3 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Covers expired, used, cancelled, tampered, double exit, entry before exit and wrong role
- [ ] Runs in CI
- [ ] Coverage report generated
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-BE-03
'
sleep 1
run gh issue create --title '[QA-02] End-to-end test of the full flow (Playwright or Cypress)' --label chore,P0,E6-qa,frontend,backend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** QA-02
**PRD requirement:** End-to-end workflow
**Track:** Frontend + Backend
**Priority:** P0
**Estimate:** L (3 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Student creates pass, security exits, security enters, QR expires
- [ ] Runs in CI against a seeded database
- [ ] Failure screenshots saved
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SCAN-FE-02, GP-FE-02
'
sleep 1
run gh issue create --title '[QA-03] Security checklist review (OWASP top 10, uploads, RBAC, cookies)' --label chore,P0,E6-qa,devops,security-review --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** QA-03
**PRD requirement:** NFR Security
**Track:** Tech Lead / DevOps
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Checklist completed and findings logged as issues
- [ ] Critical and high findings fixed before UAT
- [ ] Dependencies audited
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
None
'
sleep 1
run gh issue create --title '[QA-04] Seed script with demo students, passes and staff' --label chore,P0,E6-qa,backend --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** QA-04
**PRD requirement:** Demo and UAT
**Track:** Backend
**Priority:** P0
**Estimate:** S (up to 1 day)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] Creates demo students, a security user and an admin
- [ ] Includes passes in every status
- [ ] Safe to re-run
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
AUTH-BE-04
'
sleep 1
run gh issue create --title '[QA-05] Staging deployment and environment configuration' --label chore,P0,E6-qa,devops --milestone 'Sprint 3 - Scanner Flow' --body '**Issue ID:** QA-05
**PRD requirement:** Tech approach
**Track:** Tech Lead / DevOps
**Priority:** P0
**Estimate:** M (2 days)
**Sprint:** Sprint 3 - Scanner Flow

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] API, web and database deployed over HTTPS
- [ ] Secrets stored in the host, not in the repo
- [ ] Smoke test documented
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
SETUP-06
'
sleep 1
run gh issue create --title '[QA-06] UAT with hostel office and security; bug-fix sprint' --label chore,P0,E6-qa,frontend,backend --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** QA-06
**PRD requirement:** Success metrics
**Track:** Frontend + Backend
**Priority:** P0
**Estimate:** L (3 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] UAT script covers the full flow
- [ ] Feedback logged as issues
- [ ] Sign-off by Hostel Rector and security head
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
QA-02, QA-05
'
sleep 1
run gh issue create --title '[QA-07] User guides for student, security and admin' --label docs,P1,E6-qa,devops --milestone 'Sprint 4 - Dashboards, QA and UAT' --body '**Issue ID:** QA-07
**PRD requirement:** Docs
**Track:** Tech Lead / DevOps
**Priority:** P1
**Estimate:** M (2 days)
**Sprint:** Sprint 4 - Dashboards, QA and UAT

## Context
See the PRD requirement(s) above. Add any extra detail here before starting.

## Scope
What the title says. Anything else needs a new issue.

## API contract / UI reference
_To be added by the owner before work starts (route, request, response, error codes, or design link)._

## Acceptance criteria
- [ ] One short guide per role with screenshots
- [ ] Gate procedure for security
- [ ] Hosted in /docs
- [ ] Tests added for new logic
- [ ] Meets the Definition of Done in CONTRIBUTING.md

## Dependencies
QA-06
'
sleep 1
echo "Done: 58 issues."
