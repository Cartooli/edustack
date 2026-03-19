# REPO-SECURITY.md — Keeping the Repository Safe

> **How we ensure nothing sensitive, harmful, or inappropriate ever makes it into the codebase.**

---

## Threat Model

EduStack is a public GitHub repository used in school environments. We defend against:

1. **Accidental secrets** — API keys, passwords, tokens committed by mistake
2. **Inappropriate content** — Text or images unsuitable for students
3. **Malicious contributions** — PRs that introduce harmful code or content
4. **Supply chain attacks** — Compromised dependencies
5. **Social engineering** — PRs that look safe but hide unsafe content

---

## Automated Protections

### GitHub Actions Safety Check (`.github/workflows/safety-check.yml`)

Runs on every push and PR. Blocks merge if any check fails.

**Checks performed:**

| Check | What It Catches |
|---|---|
| Secret patterns | API keys, tokens, passwords, private keys |
| URL scanning | External URLs in .md, .html, .css, .js files |
| Content filter | Profanity, violence, inappropriate terms |
| PII patterns | Email addresses, phone numbers, SSNs |
| File type check | Blocks binaries, executables, archives |
| Dependency check | Alerts on any new package.json or requirements.txt |
| Image check | Flags new/modified images for manual review |
| Script safety | Checks shell scripts for dangerous commands |

### .gitignore

Prevents common sensitive files from being committed:

```gitignore
# Secrets and config
.env
.env.*
*.key
*.pem
config/teacher-settings.json

# Logs (contain interaction data)
logs/
*.log

# Student work (may contain personal info)
student-work/

# OS and editor artifacts
.DS_Store
Thumbs.db
*.swp
*~

# Dependencies (should never exist but just in case)
node_modules/
__pycache__/
```

### Pre-commit Hook (Optional)

Schools can install a local pre-commit hook that runs the same checks before any commit:

```bash
# Install (from repo root)
cp scripts/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

---

## Manual Review Requirements

Even with automation, every PR requires:

1. **A human reads every line** — Automated checks catch patterns, humans catch intent
2. **Image review** — Every new image is opened and reviewed visually
3. **Context review** — Is this content age-appropriate in context, not just in isolation?
4. **Variable name review** — Even variable names must be appropriate

---

## What To Do If Something Slips Through

### If you find sensitive data in the repo:

1. **Do NOT open a public issue** — This makes the data more visible
2. Contact the maintainers privately
3. The sensitive data will be removed from the current commit AND from git history
4. Affected credentials will be rotated immediately

### If you find inappropriate content:

1. Open an issue with the `safety` label
2. Include the file path and line number
3. The content will be removed within 24 hours

---

## Fork Management

Schools that fork EduStack should:

1. **Enable branch protection** on their fork's `main` branch
2. **Enable GitHub's secret scanning** (free for public repos)
3. **Set up the pre-commit hook** on machines that push to the fork
4. **Review upstream updates** before merging (don't auto-merge)
5. **Keep their fork public** — Transparency is a safety feature

### Staying Updated Safely

```bash
# Fetch upstream changes
git fetch upstream

# Review what changed BEFORE merging
git log upstream/main --oneline -20
git diff main..upstream/main -- "*.md" "*.html" "*.css" "*.js"

# Merge only after review
git merge upstream/main
```

Safety patches are tagged with `security-` prefix:
```bash
# See only security patches
git tag -l "security-*"
```

---

## Dependency Policy

**EduStack has zero runtime dependencies.** This is a feature, not a limitation.

If a future version requires a dependency:
1. It must be justified in a public issue with discussion
2. It must be audited for security
3. It must be vendored (committed directly, not installed at runtime)
4. It must work offline
5. It must be reviewed by at least two maintainers

---

*Security is everyone's responsibility. If you see something, say something.*
