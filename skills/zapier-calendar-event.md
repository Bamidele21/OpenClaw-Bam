# Create Google Calendar Event (Zapier Skill)

Saved as `create_calendar_event` on Zapier MCP.

**Calendar:** bambamogunseye@gmail.com (primary)  
**Calendar ID:** `bambamogunseye@gmail.com`  
**Timezone:** America/Chicago  

## Trigger

When Bam asks to create an event / set up a calendar event / schedule something.

## Flow

1. Gather fields: title (required), start/end datetime (required), description, location, video call toggle, attendees, event type, visibility, free/busy, recurrence, color, reminders, guest permissions
2. Parse natural language dates to ISO 8601 in America/Chicago
3. Call `execute_zapier_write_action` with `selected_api='GoogleCalendarCLIAPI'`, `action='detailed_event'`
4. Locked params: `calendarid: "bambamogunseye@gmail.com"`
5. Dynamic params from user input

## Constraints

- Don't re-resolve calendar ID
- Default reminders on unless user specifies otherwise
- America/Chicago for date parsing