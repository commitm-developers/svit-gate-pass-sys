# SVIT Gate Pass System

Digital gate pass with QR for hostel students. MERN stack. See `docs/` for the PRD and `CONTRIBUTING.md` for how we work.

## Quick start

Requirements: Node.js 20+, a MongoDB Atlas (or local) connection string.

```bash
git clone <repo-url>
cd svit-gate-pass-sys
npm install                 # root tools: husky, prettier, lint-staged
npm run install:all         # server and client dependencies

cp server/.env.example server/.env    # fill in values
cp client/.env.example client/.env

npm run dev:server          # http://localhost:5000
npm run dev:client          # http://localhost:5173
```

## Useful commands (run from the repo root)

| Command          | What it does                   |
| ---------------- | ------------------------------ |
| `npm run lint`   | ESLint on server and client    |
| `npm test`       | Vitest on server and client    |
| `npm run build`  | Production build of the client |
| `npm run format` | Prettier on the whole repo     |

## Working on an issue

1. Pick an issue assigned to you on the project board.
2. `git checkout develop && git pull`, then `git checkout -b feature/<ISSUE-ID>-short-name`.
3. Commit using Conventional Commits, open a PR into `develop`, request a review.

Full rules: [CONTRIBUTING.md](CONTRIBUTING.md).
