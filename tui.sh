#!/usr/bin/env bash
# Launch the Claude Code TUI in this agent's container.  Usage: ./tui.sh [account]   (default: host)
set -euo pipefail
acct="${1:-host}"
cname="ocu-claude-${acct}"
if docker info >/dev/null 2>&1; then
  exec docker exec -it -w /work "$cname" bash -lc 'claude --allow-dangerously-skip-permissions'
else
  exec sg docker -c "docker exec -it -w /work $cname bash -lc 'claude --allow-dangerously-skip-permissions'"
fi
