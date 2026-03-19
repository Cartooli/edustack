#!/bin/bash
# =============================================================================
# EduStack Input Sanitizer
# Cleans and validates student input before processing.
# No internet required. No external dependencies.
#
# Usage: echo "student input" | ./input-sanitizer.sh
# Returns: Sanitized text on stdout
#
# Exit codes: 0 = success, 1 = input rejected (too long, empty after sanitization)
# =============================================================================

set -euo pipefail

# --- Configuration ---
MAX_LENGTH=500          # Maximum input length in characters
MIN_LENGTH=1            # Minimum input length after sanitization

# --- Input ---
INPUT=""
if [ -t 0 ]; then
    INPUT="${1:-}"
else
    INPUT=$(cat)
fi

# --- Length check (before any processing) ---
if [ ${#INPUT} -gt $MAX_LENGTH ]; then
    echo "ERROR: Input too long (max ${MAX_LENGTH} characters)" >&2
    exit 1
fi

# --- Sanitize ---
sanitize() {
    local text="$1"
    
    # Remove null bytes
    text=$(echo "$text" | tr -d '\0')
    
    # Remove control characters (except newline and tab)
    text=$(echo "$text" | tr -d '\001-\010\013\014\016-\037')
    
    # HTML entity encoding for dangerous characters
    text=$(echo "$text" | sed \
        -e 's/&/\&amp;/g' \
        -e 's/</\&lt;/g' \
        -e 's/>/\&gt;/g' \
        -e 's/"/\&quot;/g' \
        -e "s/'/\&#x27;/g" \
        -e 's/`/\&#x60;/g' \
    )
    
    # Remove common script injection patterns (after HTML encoding)
    text=$(echo "$text" | sed \
        -e 's/javascript://gi' \
        -e 's/vbscript://gi' \
        -e 's/data:text\/html//gi' \
        -e 's/on[a-z]*=//gi' \
    )
    
    # Collapse multiple spaces to single
    text=$(echo "$text" | tr -s ' ')
    
    # Collapse multiple newlines to max 2
    text=$(echo "$text" | sed '/^$/N;/^\n$/d')
    
    # Trim leading/trailing whitespace
    text=$(echo "$text" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    echo "$text"
}

SANITIZED=$(sanitize "$INPUT")

# --- Post-sanitization check ---
if [ ${#SANITIZED} -lt $MIN_LENGTH ]; then
    echo "ERROR: Input empty after sanitization" >&2
    exit 1
fi

echo "$SANITIZED"
exit 0
