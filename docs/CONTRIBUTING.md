# Contributing to SVIT Gate Pass System

Thanks for working on the SVIT Gate Pass System, a MERN app that lets hostel students create QR gate passes and lets security and admins track campus in/out movement.

This guide explains how we work so that seven people can build one product without stepping on each other. Read it once fully, then use it as a reference.

> The product requirements live in the PRD (`SVIT_Gate_Pass_System_PRD.docx`). Every issue links to a requirement ID from it (for example `QR-6`). If code and PRD disagree, raise it in the issue before changing anything.

---

## Table of contents

1. [Team and ownership](#1-team-and-ownership)
2. [Project structure](#2-project-structure)
3. [Local setup](#3-local-setup)
4. [Working with issues](#4-working-with-issues)
5. [Branching strategy](#5-branching-strategy)
6. [Commit messages](#6-commit-messages)
7. [Pull requests](#7-pull-requests)
8. [Code review](#8-code-review)
9. [Coding standards](#9-coding-standards)
10. [API conventions](#10-api-conventions)
11. [Security rules](#11-security-rules)
12. [Testing](#12-testing)
13. [Definition of Done](#13-definition-of-done)
14. [Reporting bugs](#14-reporting-bugs)
15. [Getting help](#15-getting-help)

---

## 1. Team and ownership

| Role       | Primary area                                                       |
| ---------- | ------------------------------------------------------------------ |
| Tech Lead  | Planning, reviews, CI, deployment, final merge to `main`           |
| Backend A  | Auth, RBAC, users, admin-created security accounts                 |
| Backend B  | Gate pass model, state machine, QR signing, scan APIs, cron jobs   |
| Backend C  | Profiles and uploads, dashboard APIs, reports, deployment support  |
| Frontend A | App shell, auth pages, route guards, profile forms, camera capture |
| Frontend B | Gate pass form and card, history, student dashboard and charts     |
| Frontend C | Security scanner, verification card, admin and security dashboard  |

Ownership is about who to ask first, not who is allowed to touch code. Anyone may fix a bug anywhere through a normal PR.

## 2. Project structure

One repository, two apps:

```
svit-gate-pass-sys/
├── .github/                      # templates, workflows, CODEOWNERS
├── docs/
│   ├── PRD.docx
│   ├── api.md                    # API contracts
│   └── deployment.md
├── scripts/                      # create-labels.sh, create-issues.sh
├── client/                       # React app (neeche detail)
├── server/                       # Node API (neeche detail)
├── docker-compose.yml            # local: api + web (+ mongo)
├── .gitignore
├── .editorconfig
├── CONTRIBUTING.md
├── README.md
└── LICENSE
```

Server (Node + Express + Mongoose):

```
server/
├── src/
│   ├── config/
│   │   ├── env.js                # env load + validate (fail fast)
│   │   ├── db.js                 # Mongo connection
│   │   ├── cloudinary.js         # file storage client
│   │   └── cors.js
│   ├── constants/
│   │   ├── roles.js              # student, admin, security
│   │   ├── passStatus.js         # GENERATED, OUT, OVERDUE, RETURNED, EXPIRED, CANCELLED
│   │   └── errorCodes.js         # PASS_EXPIRED, QR_INVALID ...
│   ├── models/
│   │   ├── User.model.js
│   │   ├── StudentProfile.model.js
│   │   ├── StaffProfile.model.js
│   │   ├── GatePass.model.js
│   │   ├── ScanLog.model.js
│   │   └── Setting.model.js
│   ├── routes/
│   │   ├── index.js              # mounts everything under /api/v1
│   │   ├── auth.routes.js
│   │   ├── admin.routes.js
│   │   ├── student.routes.js
│   │   ├── staff.routes.js
│   │   ├── gatepass.routes.js
│   │   ├── scan.routes.js
│   │   ├── dashboard.routes.js
│   │   └── report.routes.js
│   ├── controllers/              # request in, response out (no logic)
│   │   ├── auth.controller.js
│   │   ├── admin.controller.js
│   │   ├── student.controller.js
│   │   ├── staff.controller.js
│   │   ├── gatepass.controller.js
│   │   ├── scan.controller.js
│   │   ├── dashboard.controller.js
│   │   └── report.controller.js
│   ├── services/                 # business logic lives here
│   │   ├── auth.service.js
│   │   ├── profile.service.js
│   │   ├── gatepass.service.js
│   │   ├── passStateMachine.service.js   # only place that changes status
│   │   ├── qr.service.js                 # sign + verify QR token
│   │   ├── scan.service.js
│   │   ├── dashboard.service.js
│   │   ├── upload.service.js
│   │   └── mail.service.js
│   ├── middleware/
│   │   ├── auth.middleware.js    # verify JWT cookie
│   │   ├── rbac.middleware.js    # allowRoles('security','admin')
│   │   ├── validate.middleware.js
│   │   ├── upload.middleware.js  # multer rules
│   │   ├── rateLimit.middleware.js
│   │   ├── notFound.middleware.js
│   │   └── error.middleware.js   # central error handler
│   ├── validators/               # Zod schemas
│   │   ├── auth.validator.js
│   │   ├── profile.validator.js
│   │   └── gatepass.validator.js
│   ├── jobs/
│   │   └── passExpiry.job.js     # cron: expire + overdue
│   ├── utils/
│   │   ├── AppError.js
│   │   ├── asyncHandler.js
│   │   ├── passNumber.js         # GP-YYMM-0001
│   │   ├── dates.js              # IST day/week boundaries
│   │   └── logger.js
│   ├── app.js                    # express app (helmet, cors, routes)
│   └── server.js                 # starts DB, cron, listens
├── tests/
│   ├── unit/                     # state machine, qr.service
│   ├── integration/              # supertest: auth, pass, scan
│   └── setup.js
├── seeds/
│   ├── seedAdmin.js
│   └── seedDemo.js
├── .env.example
├── .eslintrc.cjs
├── .prettierrc
├── Dockerfile
├── package.json
└── package-lock.json
```

Request ka flow: route → middleware (auth, role, validate) → controller → service → model.

Client (React + Vite + Tailwind):

```
client/
├── public/
│   └── favicon.ico
├── src/
│   ├── app/
│   │   ├── App.jsx
│   │   ├── router.jsx            # all routes
│   │   └── providers.jsx         # QueryClient, AuthProvider, Toaster
│   ├── routes/
│   │   ├── ProtectedRoute.jsx    # login check
│   │   └── RoleRoute.jsx         # role check
│   ├── components/
│   │   ├── ui/                   # Button, Input, Modal, Table, Loader, StatusBadge
│   │   ├── layout/               # Navbar, Sidebar, PageHeader, AppLayout
│   │   └── common/               # EmptyState, ErrorState, ConfirmDialog
│   ├── features/
│   │   ├── auth/
│   │   │   ├── components/       # LoginForm, RegisterForm
│   │   │   ├── hooks/            # useAuth
│   │   │   ├── api.js
│   │   │   └── AuthContext.jsx
│   │   ├── profile/
│   │   │   ├── components/       # ProfileSteps, CameraCapture, CertificateUpload
│   │   │   ├── hooks/
│   │   │   └── api.js
│   │   ├── gatepass/
│   │   │   ├── components/       # PassForm, PassCard, QrView, PassHistory, StatusProgress
│   │   │   ├── hooks/
│   │   │   └── api.js
│   │   ├── scanner/
│   │   │   ├── components/       # QrScanner, StudentVerifyCard, ScanErrors, ManualSearch
│   │   │   ├── hooks/
│   │   │   └── api.js
│   │   ├── dashboard/
│   │   │   ├── components/       # StatCard, WeeklyChart, MonthlyChart, TimelineChart, OutNowTable
│   │   │   ├── hooks/
│   │   │   └── api.js
│   │   └── admin/
│   │       ├── components/       # SecurityList, SecurityForm, StudentList
│   │       └── api.js
│   ├── pages/
│   │   ├── public/               # LoginPage, RegisterPage, NotFoundPage
│   │   ├── student/              # StudentDashboardPage, ProfilePage, CreatePassPage, HistoryPage
│   │   ├── security/             # ScannerPage, StaffDashboardPage, SecurityProfilePage
│   │   └── admin/                # AdminDashboardPage, StudentsPage, SecurityStaffPage
│   ├── services/
│   │   └── axios.js              # base instance, 401 handling
│   ├── hooks/                    # useDebounce, useInterval, useCamera
│   ├── utils/                    # formatDate (IST), cn, validators
│   ├── constants/                # roles, passStatus, routes
│   ├── styles/
│   │   └── index.css             # Tailwind layers
│   └── main.jsx
├── tests/
├── .env.example
├── index.html
├── vite.config.js
├── tailwind.config.js
├── postcss.config.js
├── .eslintrc.cjs
├── Dockerfile                    # build + nginx
├── package.json
└── package-lock.json
```

Rules of thumb:

- Business logic goes in `services/`, not in route handlers or React components.
- Keep one feature's files together under `features/` on the client.

## 3. Local setup

**Prerequisites:** Node.js 20 LTS or newer, npm, Git, and a MongoDB Atlas connection string (or local MongoDB).

```bash
git clone <repo-url>
cd svit-gate-pass-sys

# Backend
cd server
cp .env.example .env     # fill in values, see below
npm install
npm run dev

# Frontend (new terminal)
cd client
cp .env.example .env
npm install
npm run dev
```

**Server `.env` variables** (names may grow as the project does; always update `.env.example`):

```
PORT=5000
MONGO_URI=
JWT_SECRET=
JWT_EXPIRES_IN=1d
QR_SECRET=
CLIENT_URL=http://localhost:5173
CLOUDINARY_CLOUD_NAME=
CLOUDINARY_API_KEY=
CLOUDINARY_API_SECRET=
```

**Client `.env`:**

```
VITE_API_URL=http://localhost:5000/api/v1
```

Seed demo data and the first admin account:

```bash
cd server
npm run seed
```

> Never commit `.env` files, secrets, real student data, or uploaded documents. Camera features need HTTPS or `localhost`.

## 4. Working with issues

We work **issue-first**: no code without an issue.

1. Pick an issue from the **Ready** column of the GitHub Project board that is assigned to you (or ask the Lead to assign one).
2. Read the full issue: context, scope, API contract, acceptance criteria, dependencies.
3. If anything is unclear, **comment on the issue before starting**. Do not guess.
4. Move the card to **In progress** and start your branch.

### Issue IDs

Format: `AREA-TRACK-NN`, for example `AUTH-BE-02`, `GP-FE-01`, `SCAN-BE-03`. Appendix A of the PRD has the full backlog.

### Labels

| Group    | Labels                                                                                       |
| -------- | -------------------------------------------------------------------------------------------- |
| Type     | `feature`, `bug`, `chore`, `spike`, `docs`                                                   |
| Area     | `frontend`, `backend`, `devops`                                                              |
| Priority | `P0` (must have for MVP), `P1` (should have)                                                 |
| Epic     | `E0` setup, `E1` auth, `E2` profiles, `E3` gate pass, `E4` scanner, `E5` dashboards, `E6` QA |

### Board columns

`Backlog` → `Ready` → `In progress` → `In review` → `Done`

### Sizing

| Size | Effort      |
| ---- | ----------- |
| S    | up to 1 day |
| M    | 2 days      |
| L    | 3 days      |

If an issue is bigger than L, split it and tell the Lead.

### Frontend and backend working in parallel

The **API contract** (route, request body, response, error codes) is written in the issue first. Backend builds to it, frontend mocks it. If the contract must change, update the issue and tell the other side in a comment.

## 5. Branching strategy

| Branch                          | Purpose                                                             |
| ------------------------------- | ------------------------------------------------------------------- |
| `main`                          | Stable, deployable. Only the Lead merges from `develop` at release. |
| `develop`                       | Integration branch. All feature PRs target this.                    |
| `feature/<ISSUE-ID>-short-name` | One branch per issue                                                |
| `fix/<ISSUE-ID>-short-name`     | Bug fixes                                                           |
| `hotfix/<short-name>`           | Urgent fixes for `main` (Lead only)                                 |

Examples:

```
feature/AUTH-BE-02-login-api
feature/GP-FE-01-create-pass-form
fix/SCAN-BE-02-double-exit
```

Workflow:

```bash
git checkout develop
git pull origin develop
git checkout -b feature/GP-BE-02-create-pass-api

# work, commit often
git fetch origin
git rebase origin/develop      # or merge, but keep your branch current
git push -u origin feature/GP-BE-02-create-pass-api
```

Rules:

- Never push directly to `main` or `develop`. Branch protection is on.
- Keep branches short-lived (target: merged within 3 days).
- Do not mix two issues in one branch.

## 6. Commit messages

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short summary in present tense>

[optional body: what and why]

Refs: <ISSUE-ID>
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`.

Examples:

```
feat(gatepass): add create pass API with one-active-pass rule

Refs: GP-BE-02
```

```
fix(scan): reject second exit scan for the same pass

Refs: SCAN-BE-02
```

Keep the summary under 72 characters. Make small, meaningful commits.

## 7. Pull requests

1. Push your branch and open a PR **into `develop`**.
2. Title format: `[ISSUE-ID] Short description`, for example `[GP-FE-01] Create gate pass form`.
3. Fill in the PR template completely:
   - What changed and why
   - Link to the issue (`Closes #<number>`)
   - How to test it
   - Checklist (below)
4. Move the issue card to **In review** and request a reviewer.

**PR checklist**

- [ ] Linked to an issue and the PRD requirement
- [ ] Acceptance criteria are met
- [ ] Lint and tests pass locally and in CI
- [ ] Input validation and role checks are in place (backend)
- [ ] Works on a mobile viewport (frontend)
- [ ] No secrets, `console.log` leftovers, or commented-out code
- [ ] `.env.example` and docs updated if needed

**PR size:** aim for under 400 changed lines. Smaller PRs get faster, better reviews.

**Merging:** at least **one approval** and **passing CI** are required. The author merges using **squash and merge**, after resolving all comments.

## 8. Code review

For reviewers:

- Aim to review within **one working day**.
- Check correctness against the acceptance criteria first, then security, then readability.
- Be specific and kind. Say what to change and why. Use `nit:` for optional style points.
- Approve only when you would be comfortable maintaining the code.

For authors:

- Reply to every comment, then push fixes. Do not resolve a thread you did not address.
- Disagree politely with reasons. If stuck, ask the Lead to decide.

**Extra scrutiny (Lead must review):** anything touching authentication, RBAC, QR signing and verification, scan or exit/entry logic, file uploads, or cookies.

## 9. Coding standards

### General

- JavaScript (ES modules), `async/await`, no callbacks pyramids.
- ESLint and Prettier are mandatory. Run `npm run lint` and `npm run format` before pushing. Husky runs checks on commit.
- Names: `camelCase` for variables and functions, `PascalCase` for React components and Mongoose models, `UPPER_SNAKE_CASE` for constants, `kebab-case` for folders (except component folders).
- Small functions with one job. Avoid deep nesting; return early.
- No magic numbers. Put validity windows, grace times and limits in settings or constants.
- Comments explain **why**, not what.

### Backend

- Controllers parse input and send responses. Services hold logic. Models hold schema only.
- Validate every request body, query and param with Zod (or the agreed library) in middleware.
- Use one central error handler. Throw typed errors (`AppError(status, code, message)`); never leak stack traces to clients.
- Use Mongoose indexes for fields we query often (see PRD section 7).
- Pass status changes must go through the pass state machine service only. Never set `status` directly elsewhere.
- Status updates for exit and entry must be **atomic** (for example `findOneAndUpdate` with the expected current status in the filter) so two guards cannot confirm the same action twice.
- Store times in **UTC**; the client formats them as IST.

### Frontend

- Function components and hooks only.
- Server data via TanStack Query (or the agreed data layer); local UI state via `useState`/`useReducer`.
- Keep API calls in `services/`, never inside JSX files directly.
- Every screen needs loading, empty, and error states.
- **Mobile first.** The scanner and pass pages must be usable one-handed on a mid-range Android phone.
- Reuse the UI kit (`components/`) before building a new component.
- Accessible by default: labels on inputs, button text or `aria-label`, sufficient colour contrast.

## 10. API conventions

- Base path: `/api/v1`. Nouns for resources, plural: `/gatepasses`, `/students`.
- Standard success shape:

```json
{ "success": true, "data": {} }
```

- Standard error shape:

```json
{ "success": false, "error": { "code": "PASS_EXPIRED", "message": "This QR code has expired." } }
```

- Status codes: `200` OK, `201` created, `400` validation error, `401` not logged in, `403` wrong role, `404` not found, `409` conflict (for example an active pass already exists), `429` rate limited, `500` unexpected.
- Use stable machine-readable error codes (for example `PASS_EXPIRED`, `PASS_ALREADY_USED`, `PASS_CANCELLED`, `QR_INVALID`). The frontend shows messages based on these codes.
- Paginate list endpoints with `page` and `limit`.
- Document each new or changed endpoint in the issue or in `docs/api.md`.

## 11. Security rules

This app stores student and parent personal data and controls who may leave the campus. Treat security as part of every task.

- **Never** commit secrets, tokens, or real student data. If you do by accident, tell the Lead immediately so the secret can be rotated.
- Hash passwords with bcrypt. Never log passwords, tokens, or QR token contents.
- JWT goes in an `httpOnly`, `secure`, `sameSite` cookie. Do not store tokens in `localStorage`.
- Every route has an explicit role check. Default is deny.
- **The QR code contains only a signed token, no personal data.** All details come from the server after the scan.
- Verify and confirm APIs accept only `security` and `admin` roles. Students can never call them.
- Validate uploads by type and size (photo: image only; certificate: PDF/JPG/PNG up to 5 MB). Serve private documents through short-lived signed URLs.
- Guard against NoSQL injection: validate input types and never pass raw request objects into queries.
- Rate-limit login and scan routes.
- Log every scan and rejected scan to `scanLogs`. Scan logs are append-only.
- Found a vulnerability? Do not open a public issue. Message the Tech Lead directly.

## 12. Testing

| Level       | Tool                                | What to cover                                                                       |
| ----------- | ----------------------------------- | ----------------------------------------------------------------------------------- |
| Unit        | Vitest (backend), Vitest (frontend) | Pass state machine, date validation, QR signing and verification, utility functions |
| Integration | Jest + Supertest                    | Auth, create pass, verify, exit, entry, dashboards                                  |
| End to end  | Playwright or Cypress               | Student creates pass → security scans → exit → entry → QR expires                   |

Expectations:

- New business logic comes with tests in the same PR.
- Bug fixes include a test that fails before the fix.
- Must-have cases for passes: expired QR, already used QR, cancelled pass, tampered token, second exit scan, entry before exit, wrong role.
- CI must be green before merge. Do not skip or delete tests to make CI pass.

## 13. Definition of Done

An issue is Done only when all of these are true:

- [ ] Code merged into `develop` through a reviewed PR and CI is green
- [ ] All acceptance criteria are checked
- [ ] Input validation and role checks exist (backend)
- [ ] Tests added for new business logic
- [ ] Works on mobile viewport (frontend)
- [ ] API changes documented
- [ ] Issue closed and board card moved to **Done**

## 14. Reporting bugs

Open an issue with the `bug` label and include:

1. **What happened** and **what you expected**
2. **Steps to reproduce**
3. **Role** you were using (student, security, admin)
4. **Screenshots or a recording**, and device or browser
5. **Pass number or user ID** (never passwords or tokens)
6. Severity: **Critical** (someone can leave without a valid pass, data leak, app down), **High** (core flow broken), **Medium**, **Low**

Critical bugs are fixed first. Tell the Lead right away.

## 15. Getting help

- Stuck for more than **30 minutes**? Ask. Post in the team chat or comment on the issue with what you tried.
- Unsure about requirements? Ask the Lead, who will confirm with the hostel office if needed.
- Daily 10-minute stand-up: yesterday, today, blockers.
- Sprint planning at the start and a review/retro at the end of each sprint.

---

Thank you for contributing. Clear issues, small PRs, and careful reviews are how we ship a system that students, guards, and the hostel office can trust.
