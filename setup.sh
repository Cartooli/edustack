#!/bin/bash
# =============================================================================
# EduStack Setup
# Validates the environment and prepares EduStack for use.
# INSTALLS NOTHING. Only checks that required tools are available.
# Safe to run on school computers without admin privileges.
# =============================================================================

set -euo pipefail

echo ""
echo "  ============================================="
echo "  EduStack Setup"
echo "  ============================================="
echo ""

ISSUES=0

# --- Check: Git ---
echo -n "  Checking Git... "
if command -v git &>/dev/null; then
    GIT_VERSION=$(git --version 2>/dev/null | head -1)
    echo "OK ($GIT_VERSION)"
else
    echo "NOT FOUND"
    echo "  → Install Git: https://git-scm.com/"
    ISSUES=$((ISSUES + 1))
fi

# --- Check: Text editor ---
echo -n "  Checking for a text editor... "
EDITOR_FOUND=false
for editor in code nano vim vi notepad++; do
    if command -v "$editor" &>/dev/null; then
        echo "OK ($editor found)"
        EDITOR_FOUND=true
        break
    fi
done
if [ "$EDITOR_FOUND" = false ]; then
    echo "NONE DETECTED"
    echo "  → Recommended: VS Code (https://code.visualstudio.com/)"
    echo "  → Any text editor works (Notepad, TextEdit, etc.)"
fi

# --- Check: Browser ---
echo -n "  Checking for a web browser... "
BROWSER_FOUND=false
for browser in google-chrome chromium firefox microsoft-edge safari; do
    if command -v "$browser" &>/dev/null; then
        echo "OK ($browser found)"
        BROWSER_FOUND=true
        break
    fi
done
if [ "$BROWSER_FOUND" = false ]; then
    echo "NOT DETECTED (but probably installed)"
    echo "  → Any modern browser works: Chrome, Firefox, Edge, Safari"
fi

# --- Make scripts executable ---
echo -n "  Making scripts executable... "
chmod +x scripts/*.sh 2>/dev/null || true
echo "OK"

# --- Create config directory ---
echo -n "  Creating config directory... "
mkdir -p config
echo "OK"

# --- Create default teacher settings if not present ---
if [ ! -f "config/teacher-settings.json" ]; then
    echo -n "  Creating default teacher settings... "
    cat > config/teacher-settings.json << 'EOF'
{
  "ai_enabled": false,
  "content_filter_strictness": "high",
  "audit_logging": true,
  "log_retention_days": 30,
  "student_code_sharing": false,
  "notes": "Edit this file to customize EduStack for your classroom."
}
EOF
    echo "OK"
else
    echo "  Teacher settings already exist (not overwritten)"
fi

# --- Create logs directory ---
echo -n "  Creating logs directory... "
mkdir -p logs
if [ ! -f "logs/.gitignore" ]; then
    echo "*" > logs/.gitignore
    echo "!.gitignore" >> logs/.gitignore
fi
echo "OK"

# --- Create student work directory ---
echo -n "  Creating student work directory... "
mkdir -p student-work
if [ ! -f "student-work/.gitignore" ]; then
    echo "*" > student-work/.gitignore
    echo "!.gitignore" >> student-work/.gitignore
fi
echo "OK"

# --- Summary ---
echo ""
if [ $ISSUES -eq 0 ]; then
    echo "  ============================================="
    echo "  Setup complete! EduStack is ready."
    echo "  ============================================="
    echo ""
    echo "  Next steps:"
    echo "  1. Read docs/TEACHER-GUIDE.md (10 min)"
    echo "  2. Open skills/learn/SKILL-01-hello-world.md"
    echo "  3. Try the first few steps yourself"
    echo ""
    echo "  Happy teaching!"
else
    echo "  ============================================="
    echo "  Setup found $ISSUES issue(s)."
    echo "  Fix them and run ./setup.sh again."
    echo "  ============================================="
fi

echo ""
exit $ISSUES
