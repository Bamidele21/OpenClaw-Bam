---
name: "zapier-google-docs"
description: "Read, search, create, edit Google Docs via Zapier MCP tools registered into OpenClaw."
---

# Zapier Google Docs

Use Zapier's MCP server to read, search, create, and edit Google Docs from
within OpenClaw. This registers `mcp.zapier.com` as an OpenClaw MCP server,
which exposes Google Docs tools (and any other Zapier-connected apps) as native
OpenClaw tools.

## Prerequisites

- A Zapier account
- A connection token from [mcp.zapier.com](https://mcp.zapier.com)
  (Create a server → "Other" → generate a token)

## Setup

### 1. Register Zapier MCP in OpenClaw

Run this to add the server:

```bash
openclaw mcp add zapier \
  --url https://mcp.zapier.com/api/v1/connect \
  --transport streamable-http \
  --header "Authorization=Bearer YOUR_ZAPIER_TOKEN" \
  --include "*Document*","*Text*","*Image*","Find*","Get*","Create*","Append*","Replace*","Upload*","Update*","Format*","Insert*","Search*","List*","Read*"
```

Replace `YOUR_ZAPIER_TOKEN` with the connection token from mcp.zapier.com.

### 2. Verify it works

```bash
openclaw mcp doctor zapier --probe
```

You should see a list of available tools including things like `Get Document Content`, `Create Document From Text`, `Append Text to Document`, etc.

### 3. Enable auto-discovery (optional)

If you want all Zapier tools available without a filter:

```bash
openclaw mcp configure zapier --include ""
```

## Available Google Docs Tools

Once registered, these tools become available as native OpenClaw tools prefixed
with `zapier__`:

### Read / Search
- `zapier__find_a_document` — Search for a document by name
- `zapier__get_document_content` — Retrieve full content and metadata of a doc by ID
- `zapier__get_document_tabs_content` — Same as above but includes tab info
- `zapier__find_text_in_document` — Find text and get its start/end positions

### Create
- `zapier__create_document_from_text` — Create a new doc from text (supports limited HTML)
- `zapier__create_document_from_template` — Create a doc from a template with variable replacement
- `zapier__upload_document` — Upload an existing file and convert to Google Doc format
- `zapier__find_or_create_document` — Find by name or create if it doesn't exist

### Edit / Format
- `zapier__append_text_to_document` — Append text to an existing doc
- `zapier__insert_text` — Insert text at a specific position
- `zapier__find_and_replace_text` — Find and replace with case sensitivity support
- `zapier__format_text` — Apply bold, italic, colors, links, font size/family
- `zapier__insert_image` — Insert an image at a specific position
- `zapier__replace_image` — Replace an existing image with a new one
- `zapier__update_document_properties` — Change background color, margins, page settings

### Triggers (for monitoring)
- `zapier__new_document` — Triggered when a new doc is added
- `zapier__new_document_in_folder` — Triggered when a doc is added to a specific folder
- `zapier__updated_document` — Triggered when a specific doc is updated

## Usage Examples

### Read an entire document
```
Use zapier__get_document_content with the document ID
```

### Create a document from text content
```
Use zapier__create_document_from_text with:
  Document Name: "My Notes"
  Document Content: "# Heading\n\nSome body text"
```

### Find a document by name
```
Use zapier__find_a_document with:
  Document Name: "Quarterly Report"
```

### Append text to an existing document
```
Use zapier__append_text_to_document with:
  Document Name: "Meeting Notes"
  Text to Append: "Additional notes here"
```

### Migrate workspace files to Google Docs
1. Read the local file (skin `read` tool)
2. Create a doc from the content with `Create Document From Text`

## Tips

- **Document ID** comes from the URL of a Google Doc
  (`https://docs.google.com/document/d/THIS_IS_THE_ID/edit`)
- You can also find a doc by name using `zapier__find_a_document`
- For templates, add `{{placeholder}}` variables in your template doc and pass
  them via `Create Document From Template`
- The tools are dynamically discovered — if a tool doesn't appear, run
  `openclaw mcp probe zapier --json` to see what's actually advertised

## Troubleshooting

| Problem | Likely cause |
|---|---|
| `openclaw mcp doctor` fails | Token is wrong, expired, or server was deleted on mcp.zapier.com |
| Tool calls return auth errors | The Zapier app connection for Google Docs needs re-authenticating in Zapier |
| No tools appear | Run `openclaw mcp probe zapier` — if tools are empty, you need to add actions on mcp.zapier.com |
| "No such tool" | Tool names are dynamically discovered; filter may be too restrictive. Try broader `--include` or remove it |
