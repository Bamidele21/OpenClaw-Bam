# Forward Gmail Email (Zapier Skill)

Saved as `forward_email` on Zapier MCP.

**Account:** bambamogunseye@gmail.com  
**Connection ID:** 02d5d274-b99f-817d-ab68-db5dcbf5056d

## Flow

1. Ask which email to forward (get search criteria: sender, subject, date, keywords)
2. Call `execute_zapier_read_action` with `selected_api='GoogleMailV2CLIAPI'`, `action='message'`, `params: { query: "search_query" }`
3. If multiple matches, let user pick
4. Ask for recipient(s) — at minimum `to`, optionally `cc`, `bcc`
5. Optionally ask: note text, include attachments (default yes), body_type (plain/html), sender alias/name, reply-to
6. Call `execute_zapier_write_action` with `selected_api='GoogleMailV2CLIAPI'`, `action='forward_email'`
7. Confirm

## Key params for forward_email

- `message_id` (required) — from Find Email step
- `to`, `cc`, `bcc` — comma-separated email lists
- `additional_message` — optional note above forwarded email
- `include_attachments` — boolean, default true
- `body_type` — "plain" or "html"
- `label_ids` — optional Gmail labels

## Constraints

- Don't re-resolve connection ID
- message_id must come from Find Email step, never guessed