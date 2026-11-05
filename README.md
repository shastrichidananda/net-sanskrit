# NET Sanskrit — UGC NET Paper 2

A mobile-friendly UGC NET Sanskrit (Subject Code 25) mock-test portal.

## Current features

- Student registration, email verification, and login through Supabase Auth.
- Unit-wise question banks and 100-question mock tests.
- 30-minute and 60-minute test durations.
- Timed tests with an automatic submission attempt when time expires.
- Answer saving, question navigation, bookmarks, and question-seen tracking.
- Results, answer review, test history, unit-wise performance, and revision lists.
- Responsive student dashboard for desktop and mobile.

## Architecture

- Frontend: index.html (HTML, CSS, and browser JavaScript).
- Backend: Supabase Auth, Postgres tables, Row Level Security, and RPC functions.
- Supabase browser configuration: supabase-config.js (project URL and publishable key only).
- Hosting: Cloudflare Workers/Pages connected to this GitHub repository.

## Important data-safety notes

- Student accounts, question banks, bookmarks, attempts, answers, and results are stored in Supabase, not in the static website files.
- Frontend updates to this repository do not delete or migrate Supabase records.
- Never put a Supabase service-role key in frontend code or commit it to GitHub.
- Keep Row Level Security enabled and ensure exam RPC functions verify the signed-in student's ownership of each attempt.
- Back up the Supabase database before making schema changes or bulk question imports.

## Deploy

The site is hosted through Cloudflare and connected to this repository. Commits to the configured deployment branch (main) should trigger the connected deployment. Check the Cloudflare deployment status after a commit before assuming the live site has updated.

## Development notes

The project is a static frontend and does not require a local build step unless the hosting configuration is changed. Update the Supabase SQL/RPC definitions separately when a feature requires database changes; frontend-only commits do not alter database functions.
