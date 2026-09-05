# Skill-Log.md

A running log of skills created and wired into OpenClaw.

---

## 4geeks_track_progress — 2026-09-05

**What it does:**  
Pulls Bam's learning progress from 4Geeks Academy — total tasks, breakdown by status (PENDING/DONE/APPROVED/REJECTED) and type (PROJECT/EXERCISE/LESSON), lists pending projects, and gives an overall completion overview.

**API endpoint(s) hit:**
- `GET https://breathecode.herokuapp.com/v1/assignment/user/me/task` — fetch all assignments with status, type, cohort, and dates
- `GET https://breathecode.herokuapp.com/v1/admissions/user/me` — fetch user profile and cohort enrolment

**Auth:** `Authorization: Token` (from `.env`) + `Academy: 4` header

**Saved as:** Zapier MCP skill (`4geeks_track_progress`) + local reference at `skills/zapier-4geeks-progress.md`

---

## 4geeks_authenticate — 2026-09-05

**What it does:**  
Verifies that Bam's 4Geeks Academy API token is still valid and the session is active. Returns user identity (name, email, GitHub profile) or alerts if the token has expired.

**API endpoint(s) hit:**
- `GET https://breathecode.herokuapp.com/v1/admissions/user/me` — fetches user profile; a valid response confirms the token works

**Auth:** `Authorization: Token` (from `.env`) + `Academy: 4` header

**Saved as:** Zapier MCP skill (`4geeks_authenticate`)

---

## get_my_projects — 2026-09-05

**What it does:**  
Retrieves all projects assigned to Bam on 4Geeks Academy and groups them by status — pending (not submitted), submitted (done/delivered awaiting review), and graded (approved/rejected with feedback). Includes cohort names, revision status, and delivery/review timestamps.

**API endpoint(s) hit:**
- `GET https://breathecode.herokuapp.com/v1/assignment/user/me/task?task_type=PROJECT` — fetch only project-type tasks with full status metadata

**Auth:** `Authorization: Token` (from `.env`) + `Academy: 4` header

**Saved as:** Zapier MCP skill (`get_my_projects`)

---

## get_pending_work — 2026-09-05

**What it does:**  
Lists only the 4Geeks Academy projects that still need Bam's attention — those with PENDING or REJECTED status that haven't been submitted yet. Focused specifically on work-to-do, grouped by cohort.

**API endpoint(s) hit:**
- `GET https://breathecode.herokuapp.com/v1/assignment/user/me/task?task_type=PROJECT` — fetch project tasks, filtered to pending/rejected status

**Auth:** `Authorization: Token` (from `.env`) + `Academy: 4` header

**Saved as:** Zapier MCP skill (`get_pending_work`)

---

## get_task_detail — 2026-09-05

**What it does:**  
Fetches the full description, score, feedback, and metadata for a specific 4Geeks Academy task by its numeric task ID. Shows title, description, status, revision status, cohort, GitHub/live URLs, and all timestamps.

**API endpoint(s) hit:**
- `GET https://breathecode.herokuapp.com/v1/assignment/task/{task_id}` — fetch assignment record (status, dates, cohort, revision)
- `GET https://breathecode.herokuapp.com/v1/registry/asset/{asset_slug}` — fetch registry asset for full description, difficulty, delivery instructions

**Auth:** `Authorization: Token` (from `.env`) + `Academy: 4` header

**Saved as:** Zapier MCP skill (`get_task_detail`)

---

## get_activity_summary — 2026-09-05

**What it does:**  
Gives a short summary of Bam's recent activity on 4Geeks Academy — tasks completed in the last 7 days, overall completion rate, projects overview (done vs pending), and pending work count. Built from the task data since the activity endpoint is restricted.

**API endpoint(s) hit:**
- `GET https://breathecode.herokuapp.com/v1/assignment/user/me/task` — fetch all tasks to compute recent activity and summary stats

**Auth:** `Authorization: Token` (from `.env`) + `Academy: 4` header

**Saved as:** Zapier MCP skill (`get_activity_summary`)"}]