#!/usr/bin/env bash
# Setup script for Zapier Google Docs MCP integration
# Usage: bash scripts/setup.sh YOUR_ZAPIER_TOKEN

set -euo pipefail

TOKEN="${1:-}"

if [ -z "$TOKEN" ]; then
  echo "Usage: $0 YOUR_ZAPIER_TOKEN"
  echo "Get your token from https://mcp.zapier.com"
  exit 1
fi

echo "Registering Zapier MCP server with OpenClaw..."

openclaw mcp add zapier \
  --url "https://mcp.zapier.com/api/v1/connect" \
  --transport "streamable-http" \
  --header "Authorization=Bearer ${TOKEN}" \
  --include "*Document*","*Text*","*Image*","Find*","Get*","Create*","Append*","Replace*","Upload*","Update*","Format*","Insert*","Search*","List*","Read*"

echo "Verifying connection..."
openclaw mcp doctor zapier --probe

echo "Done!"
