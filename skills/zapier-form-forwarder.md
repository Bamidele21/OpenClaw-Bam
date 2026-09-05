# Daily Form Submission Forwarder (Cron Job)

**Cron job name:** daily_form_check  
**Schedule:** Daily at 6:00 PM CT  
**Delivery:** Telegram to Bam (chat ID 8956875716)

## Custom Code Action Created

**Name:** `find_unread_by_subject`  
**Tool:** `googlemailv2cliapi__find_unread_by_subject`  
**Execute via:** ZapierAction[Gmail:code_action_googlemailv2cliapi__find_unread_by_subject](subject: "...")  
**What it does:** Searches Gmail for up to 20 unread emails with a matching subject. Returns only message_id, subject, and received_at — no body content.

## Flow

1. **Find emails** — custom code action searches for unread emails with subject "New Form Submission from your Website"
2. **If found** — forward each to `katyboxingclub@gmail.com` with attachments
3. **If none** — send "no emails today" to Bam on Telegram

## Constraints

- NEVER read or display email body content
- Only check subjects