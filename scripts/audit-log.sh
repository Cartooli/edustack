#!/bin/bash
# =============================================================================
# EduStack Audit Logger
# Logs AI interactions locally for teacher review.
# Privacy-preserving: inputs are hashed, not stored in plain text.
#
# Usage: ./audit-log.sh <action> <status> [details]
#   action: QUERY, RESPONSE, FILTER, ERROR
#   status: CLEAN, FLAGGED, BLOCKED, ERROR
#   details: optional context (will be hashed if it could contain student input)
#
# Logs stored in: ./logs/audit-YYYY-MM-DD.log
# Auto-purge: Files older than configured retention period
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="${SCRIPT_DIR}/.."
LOG_DIR="${REPO_DIR}/logs"
CONFIG_FILE="${REPO_DIR}/config/teacher-settings.json"

# --- Configuration ---
RETENTION_DAYS=30
LOG_ENABLED=true

# Read config if available
if [ -f "$CONFIG_FILE" ]; then
    if command -v python3 &>/dev/null; then
        RETENTION_DAYS=$(python3 -c "
import json
try:
    with open('$CONFIG_FILE') as f:
        config = json.load(f)
    print(config.get('log_retention_days', 30))
except:
    print(30)
" 2>/dev/null || echo "30")
        
        LOG_ENABLED=$(python3 -c "
import json
try:
    with open('$CONFIG_FILE') as f:
        config = json.load(f)
    print('true' if config.get('audit_logging', True) else 'false')
except:
    print('true')
" 2>/dev/null || echo "true")
    fi
fi

# --- Check if logging is enabled ---
if [ "$LOG_ENABLED" != "true" ]; then
    exit 0
fi

# --- Create log directory ---
mkdir -p "$LOG_DIR"

# --- Write .gitignore for logs directory ---
if [ ! -f "${LOG_DIR}/.gitignore" ]; then
    echo "*" > "${LOG_DIR}/.gitignore"
    echo "!.gitignore" >> "${LOG_DIR}/.gitignore"
fi

# --- Arguments ---
ACTION="${1:-UNKNOWN}"
STATUS="${2:-UNKNOWN}"
DETAILS="${3:-}"

# --- Generate session ID (per-terminal, not per-student) ---
SESSION_ID=$(echo "$$-${PPID:-0}" | sha256sum | cut -c1-8)

# --- Hash details if provided (never store plain text student input) ---
DETAILS_HASH=""
if [ -n "$DETAILS" ]; then
    DETAILS_HASH=$(echo "$DETAILS" | sha256sum | cut -c1-16)
fi

# --- Timestamp ---
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
DATE=$(date -u +"%Y-%m-%d")

# --- Log file ---
LOG_FILE="${LOG_DIR}/audit-${DATE}.log"

# --- Write log entry ---
echo "${TIMESTAMP}|${SESSION_ID}|${ACTION}|${STATUS}|${DETAILS_HASH}" >> "$LOG_FILE"

# --- Auto-purge old logs ---
find "$LOG_DIR" -name "audit-*.log" -mtime +"$RETENTION_DAYS" -delete 2>/dev/null || true

exit 0
