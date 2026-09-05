# 4Geeks Student API — Track Progress (Zapier Skill)

**Skill name on Zapier:** `4geeks_track_progress`  
**Base URL:** `https://breathecode.herokuapp.com`  
**Auth:** `Authorization: Token` + `Academy: 4` headers  
**Token:** From `.env` (`4GEEKS_ACCESS_TOKEN`)

## Endpoints

### 👤 My Profile
```
GET /v1/admissions/user/me
→ User info, GitHub profile, cohorts enrolled, academy info
```

### 📋 My Tasks
```
GET /v1/assignment/user/me/task
→ All tasks with status, type, cohort, dates
Useful query params: task_status, task_type, cohort, limit, offset
```

### 🔍 Task Detail
```
GET /v1/assignment/task/{task_id}
→ Full task detail with description, score, feedback
```

### 📊 My Activity
```
GET /v1/activity/me
→ Learning activity (time, exercises) — optional cohort, date_start, date_end
```

### 👥 Cohort Activity
```
GET /v1/activity/cohort/{cohort_id}
→ Aggregated cohort progress

### 📚 Registry / Learning Content
```
GET /v1/registry/asset?asset_type=PROJECT&technologies=python&limit=10
→ Browse available projects/exercises/lessons
```

## Runtime instructions

When Bam asks about his 4Geeks progress:

1. **Run**: `curl -s "https://breathecode.herokuapp.com/v1/assignment/user/me/task" -H "Authorization: Token ${4GEEKS_ACCESS_TOKEN}" -H "Academy: 4" -H "Accept: application/json"`
2. Parse the JSON and summarise:
   - Count tasks by status (PENDING, DONE, APPROVED, REJECTED)
   - Count tasks by type (PROJECT, EXERCISE, LESSON)
   - List pending projects specifically
   - List overall completion stats

3. Format the response nicely for Bam.

## Constraints
- Token is in the `.env` file as `4GEEKS_ACCESS_TOKEN`
- Always include both `Authorization: Token` and `Academy: 4` headers
- Do not hardcode the token in the skill definition — read from env