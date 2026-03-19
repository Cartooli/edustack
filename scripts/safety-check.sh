#!/bin/bash
# =============================================================================
# EduStack Safety Check
# Scans the repository for unsafe content before commits/merges.
# Run locally: ./scripts/safety-check.sh
# Run in CI: .github/workflows/safety-check.yml
#
# Exit codes: 0 = all clear, 1 = issues found
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="${SCRIPT_DIR}/.."
ISSUES=0

echo "============================================="
echo "  EduStack Safety Check"
echo "============================================="
echo ""

# --- Helper ---
fail() {
    echo "  FAIL: $1"
    ISSUES=$((ISSUES + 1))
}

pass() {
    echo "  PASS: $1"
}

warn() {
    echo "  WARN: $1"
}

# --- Check 1: Secret Patterns ---
echo "[1/8] Checking for secrets and API keys..."

SECRET_PATTERNS=(
    'sk-[a-zA-Z0-9]{20,}'           # Anthropic/OpenAI API keys
    'AKIA[0-9A-Z]{16}'              # AWS access keys
    'AIza[0-9A-Za-z_-]{35}'         # Google API keys
    'ghp_[0-9a-zA-Z]{36}'           # GitHub personal tokens
    'password\s*=\s*["\x27][^"\x27]+'  # Hardcoded passwords
    'secret\s*=\s*["\x27][^"\x27]+'    # Hardcoded secrets
    'token\s*=\s*["\x27][^"\x27]+'     # Hardcoded tokens
    'PRIVATE KEY'                     # Private keys
)

for pattern in "${SECRET_PATTERNS[@]}"; do
    # Search content files only (skip .git, binary files, this script)
    MATCHES=$(grep -rlE "$pattern" "$REPO_DIR" \
        --include="*.md" --include="*.html" --include="*.css" --include="*.js" \
        --include="*.json" --include="*.txt" --include="*.sh" --include="*.yml" \
        --exclude-dir=".git" --exclude="safety-check.sh" 2>/dev/null || true)
    
    if [ -n "$MATCHES" ]; then
        fail "Possible secret found matching pattern: ${pattern:0:20}..."
        echo "       Files: $MATCHES"
    fi
done

if [ $ISSUES -eq 0 ]; then
    pass "No secrets detected"
fi
SECRETS_ISSUES=$ISSUES

# --- Check 2: External URLs ---
echo ""
echo "[2/8] Checking for external URLs in content files..."

URL_MATCHES=$(grep -rlE 'https?://|www\.' "$REPO_DIR" \
    --include="*.html" --include="*.css" --include="*.js" \
    --exclude-dir=".git" --exclude-dir="scripts" --exclude-dir=".github" \
    --exclude-dir="docs" --exclude="README.md" 2>/dev/null || true)

if [ -n "$URL_MATCHES" ]; then
    fail "External URLs found in content files (must be self-contained):"
    echo "       $URL_MATCHES"
else
    pass "No external URLs in content files"
fi

# Note: URLs in docs/ and README.md are allowed (for GitHub links, references)

# --- Check 3: Content Filter on student-facing files ---
echo ""
echo "[3/8] Running content filter on student-facing content..."

# Only scan files students interact with directly:
# - skills/learn/, skills/explore/, skills/create/, skills/review/
# - templates/, examples/
# NOT docs/ (contains security documentation that legitimately references threats)
# NOT skills/safety/ (contains blocklist definitions)
# NOT CLAUDE.md, README.md (contain safety rule descriptions)

CONTENT_FILTER="${SCRIPT_DIR}/content-filter.sh"
if [ -x "$CONTENT_FILTER" ]; then
    CONTENT_FILES=$(find "$REPO_DIR/skills/learn" "$REPO_DIR/skills/explore" \
        "$REPO_DIR/skills/create" "$REPO_DIR/skills/review" \
        "$REPO_DIR/templates" "$REPO_DIR/examples" \
        \( -name "*.md" -o -name "*.html" \) 2>/dev/null || true)
    
    FILTERED=0
    while IFS= read -r file; do
        [ -z "$file" ] && continue
        RESULT=$(cat "$file" | "$CONTENT_FILTER" 2>/dev/null || true)
        if [[ "$RESULT" == BLOCKED* ]]; then
            fail "Content issue in $file: $RESULT"
            FILTERED=$((FILTERED + 1))
        elif [[ "$RESULT" == FLAGGED* ]]; then
            warn "Flagged content in $file: $RESULT (review manually)"
        fi
    done <<< "$CONTENT_FILES"
    
    if [ $FILTERED -eq 0 ]; then
        pass "All student-facing content clean"
    fi
else
    warn "Content filter not found or not executable"
fi

# --- Check 4: PII Patterns ---
echo ""
echo "[4/8] Checking for personally identifiable information..."

# Email addresses in content files
EMAIL_MATCHES=$(grep -rlE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' "$REPO_DIR" \
    --include="*.md" --include="*.html" --include="*.css" --include="*.js" \
    --exclude-dir=".git" --exclude-dir="scripts" --exclude="CONTRIBUTING.md" \
    --exclude="REPO-SECURITY.md" --exclude="SAFETY.md" 2>/dev/null || true)

if [ -n "$EMAIL_MATCHES" ]; then
    fail "Email addresses found in content files:"
    echo "       $EMAIL_MATCHES"
else
    pass "No email addresses in content files"
fi

# Phone numbers
PHONE_MATCHES=$(grep -rlE '\b[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}\b' "$REPO_DIR" \
    --include="*.md" --include="*.html" --include="*.css" --include="*.js" \
    --exclude-dir=".git" 2>/dev/null || true)

if [ -n "$PHONE_MATCHES" ]; then
    fail "Phone number patterns found:"
    echo "       $PHONE_MATCHES"
else
    pass "No phone numbers detected"
fi

# --- Check 5: No Dependencies ---
echo ""
echo "[5/8] Checking for unexpected dependencies..."

if [ -f "$REPO_DIR/package.json" ]; then
    # package.json exists — check it has no runtime dependencies
    if grep -q '"dependencies"' "$REPO_DIR/package.json" 2>/dev/null; then
        fail "package.json has runtime dependencies (must have zero)"
    else
        pass "package.json has no runtime dependencies"
    fi
fi

if [ -f "$REPO_DIR/requirements.txt" ]; then
    fail "requirements.txt found (EduStack should have no Python dependencies)"
fi

if [ -d "$REPO_DIR/node_modules" ]; then
    fail "node_modules directory found (should be gitignored)"
fi

pass "No unexpected dependency files"

# --- Check 6: Image Review ---
echo ""
echo "[6/8] Checking for new/unreviewed images..."

IMAGE_FILES=$(find "$REPO_DIR" \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \
    -o -name "*.gif" -o -name "*.svg" -o -name "*.webp" -o -name "*.ico" \) \
    -not -path "*/.git/*" 2>/dev/null || true)

if [ -n "$IMAGE_FILES" ]; then
    IMAGE_COUNT=$(echo "$IMAGE_FILES" | wc -l)
    warn "${IMAGE_COUNT} image(s) found — ensure all have been reviewed for appropriateness"
    echo "$IMAGE_FILES" | while read -r img; do
        SIZE=$(wc -c < "$img" 2>/dev/null || echo "0")
        if [ "$SIZE" -gt 204800 ]; then
            fail "Image over 200KB: $img (${SIZE} bytes)"
        fi
    done
else
    pass "No images to review"
fi

# --- Check 7: Dangerous shell commands ---
echo ""
echo "[7/8] Checking scripts for dangerous commands..."

DANGEROUS_PATTERNS=(
    'rm -rf /'
    'rm -rf ~'
    'mkfs'
    'dd if='
    ':(){:|:&};:'  # Fork bomb
    'chmod 777'
    'curl.*|.*sh'   # Pipe curl to shell
    'wget.*|.*sh'
    'eval.*\$'
)

SCRIPT_FILES=$(find "$REPO_DIR/scripts" -name "*.sh" -not -name "safety-check.sh" 2>/dev/null || true)
DANGER_FOUND=0

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
    [ -z "$SCRIPT_FILES" ] && continue
    MATCHES=$(grep -rl "$pattern" $SCRIPT_FILES 2>/dev/null || true)
    if [ -n "$MATCHES" ]; then
        fail "Dangerous pattern '$pattern' found in: $MATCHES"
        DANGER_FOUND=1
    fi
done

if [ $DANGER_FOUND -eq 0 ]; then
    pass "No dangerous commands in scripts"
fi

# --- Check 8: File types ---
echo ""
echo "[8/8] Checking for prohibited file types..."

BANNED_TYPES=$(find "$REPO_DIR" \( -name "*.exe" -o -name "*.dll" -o -name "*.so" \
    -o -name "*.dylib" -o -name "*.bin" -o -name "*.zip" -o -name "*.tar" \
    -o -name "*.gz" -o -name "*.7z" -o -name "*.rar" -o -name "*.dmg" \
    -o -name "*.msi" -o -name "*.deb" -o -name "*.rpm" -o -name "*.apk" \) \
    -not -path "*/.git/*" 2>/dev/null || true)

if [ -n "$BANNED_TYPES" ]; then
    fail "Prohibited file types found:"
    echo "       $BANNED_TYPES"
else
    pass "No prohibited file types"
fi

# --- Summary ---
echo ""
echo "============================================="
if [ $ISSUES -eq 0 ]; then
    echo "  ALL CHECKS PASSED"
    echo "============================================="
    exit 0
else
    echo "  ${ISSUES} ISSUE(S) FOUND"
    echo "  Fix all issues before committing."
    echo "============================================="
    exit 1
fi
