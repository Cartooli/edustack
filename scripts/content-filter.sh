#!/bin/bash
# =============================================================================
# EduStack Content Filter
# Screens text for inappropriate content using local word lists.
# No internet required. No external dependencies.
#
# Usage: echo "text to check" | ./content-filter.sh
# Returns: CLEAN, FLAGGED, or BLOCKED with category
#
# Exit codes: 0 = CLEAN, 1 = FLAGGED, 2 = BLOCKED
# =============================================================================

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BLOCKLIST_DIR="${SCRIPT_DIR}/../skills/safety"
BLOCKLIST_FILE="${BLOCKLIST_DIR}/blocklist.txt"
EVASION_FILE="${BLOCKLIST_DIR}/evasion-patterns.txt"

# --- Input ---
INPUT=""
if [ -t 0 ]; then
    # Argument mode
    INPUT="${1:-}"
else
    # Pipe mode
    INPUT=$(cat)
fi

if [ -z "$INPUT" ]; then
    echo "CLEAN"
    exit 0
fi

# --- Normalize Input ---
normalize() {
    local text="$1"
    
    # Lowercase
    text=$(echo "$text" | tr '[:upper:]' '[:lower:]')
    
    # Common letter substitutions (leet speak)
    text=$(echo "$text" | sed \
        -e 's/@/a/g' \
        -e 's/4/a/g' \
        -e 's/3/e/g' \
        -e 's/1/i/g' \
        -e 's/!/i/g' \
        -e 's/0/o/g' \
        -e 's/5/s/g' \
        -e 's/\$/s/g' \
        -e 's/7/t/g' \
        -e 's/+/t/g' \
        -e 's/8/b/g' \
        -e 's/9/g/g' \
    )
    
    # Remove inserted spaces between single characters (catches "b a d w o r d")
    # Only collapse when 3+ single chars appear in a row
    text=$(echo "$text" | sed -E 's/\b([a-z]) ([a-z]) ([a-z])/\1\2\3/g')
    # Run twice to catch longer sequences
    text=$(echo "$text" | sed -E 's/\b([a-z]) ([a-z]) ([a-z])/\1\2\3/g')
    
    # Remove repeated characters beyond 2 (baaad → baad)
    text=$(echo "$text" | sed -E 's/(.)\1{2,}/\1\1/g')
    
    # Collapse all remaining whitespace
    text=$(echo "$text" | tr -s ' ')
    
    # Trim
    text=$(echo "$text" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    echo "$text"
}

# --- Check against blocklist ---
check_blocklist() {
    local normalized="$1"
    
    if [ ! -f "$BLOCKLIST_FILE" ]; then
        echo "WARNING: Blocklist file not found at $BLOCKLIST_FILE" >&2
        echo "CLEAN"
        return 0
    fi
    
    while IFS='|' read -r category pattern || [ -n "$pattern" ]; do
        # Skip comments and empty lines
        [[ "$pattern" =~ ^#.*$ ]] && continue
        [[ -z "$pattern" ]] && continue
        
        # Trim whitespace
        category=$(echo "$category" | tr -d '[:space:]')
        pattern=$(echo "$pattern" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        
        # Check if pattern matches (word boundary matching)
        if echo "$normalized" | grep -qiw "$pattern" 2>/dev/null; then
            echo "BLOCKED|${category}|${pattern}"
            return 2
        fi
    done < "$BLOCKLIST_FILE"
    
    echo "CLEAN"
    return 0
}

# --- Check for PII patterns ---
check_pii() {
    local text="$1"
    
    # Email pattern
    if echo "$text" | grep -qE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'; then
        echo "FLAGGED|pii|email_address"
        return 1
    fi
    
    # Phone pattern (US)
    if echo "$text" | grep -qE '\b[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}\b'; then
        echo "FLAGGED|pii|phone_number"
        return 1
    fi
    
    # SSN pattern
    if echo "$text" | grep -qE '\b[0-9]{3}-[0-9]{2}-[0-9]{4}\b'; then
        echo "BLOCKED|pii|ssn_pattern"
        return 2
    fi
    
    # IP address pattern
    if echo "$text" | grep -qE '\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b'; then
        echo "FLAGGED|pii|ip_address"
        return 1
    fi
    
    # URL pattern
    if echo "$text" | grep -qE 'https?://|www\.' ; then
        echo "FLAGGED|pii|url"
        return 1
    fi
    
    echo "CLEAN"
    return 0
}

# --- Check for prompt injection attempts ---
check_injection() {
    local text="$1"
    local lower=$(echo "$text" | tr '[:upper:]' '[:lower:]')
    
    # Common prompt injection patterns
    local -a patterns=(
        "ignore your instructions"
        "ignore previous instructions"
        "ignore all instructions"
        "disregard your instructions"
        "forget your instructions"
        "you are now"
        "act as if"
        "pretend you are"
        "pretend to be"
        "new persona"
        "override"
        "system prompt"
        "jailbreak"
        "do anything now"
        "developer mode"
        "bypass"
        "reveal your instructions"
        "what are your rules"
        "show me your prompt"
        "repeat your instructions"
    )
    
    for pattern in "${patterns[@]}"; do
        if echo "$lower" | grep -qF "$pattern"; then
            echo "BLOCKED|injection|${pattern}"
            return 2
        fi
    done
    
    echo "CLEAN"
    return 0
}

# --- Main ---
NORMALIZED=$(normalize "$INPUT")

# Check injection first (most critical)
RESULT=$(check_injection "$NORMALIZED")
CODE=$?
if [ $CODE -ne 0 ]; then
    echo "$RESULT"
    exit $CODE
fi

# Check PII
RESULT=$(check_pii "$INPUT")  # Use original input for PII (patterns are case-sensitive)
CODE=$?
if [ $CODE -ne 0 ]; then
    echo "$RESULT"
    exit $CODE
fi

# Check blocklist
RESULT=$(check_blocklist "$NORMALIZED")
CODE=$?
if [ $CODE -ne 0 ]; then
    echo "$RESULT"
    exit $CODE
fi

echo "CLEAN"
exit 0
