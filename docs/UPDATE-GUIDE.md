# UPDATE-GUIDE.md — Keeping EduStack Current

> **For school IT departments and teachers managing EduStack installations.**

---

## How Updates Work

EduStack uses Git for updates. There are no auto-updates, no background processes,
and no surprise changes. You pull updates when you're ready.

### Types of Updates

| Type | Frequency | Priority | Tag Format |
|---|---|---|---|
| Safety patches | As needed | Pull immediately | `security-X.Y.Z` |
| Content fixes | Weekly | Pull at your convenience | `fix-X.Y.Z` |
| New lessons | Monthly | Pull when ready to teach them | `vX.Y.0` |
| Major changes | Quarterly | Review before pulling | `vX.0.0` |

---

## Pulling Updates

### Simple Method (for teachers)
```bash
cd edustack
git pull origin main
```

### Safe Method (for IT departments)
```bash
cd edustack

# See what changed before updating
git fetch origin
git log origin/main --oneline -10

# Review the changes
git diff main..origin/main

# Update only if satisfied
git merge origin/main
```

### For Forks
```bash
# One-time setup
git remote add upstream https://github.com/your-org/edustack.git

# Update process
git fetch upstream
git diff main..upstream/main          # Review changes
git merge upstream/main               # Apply changes
git push origin main                  # Push to your fork
```

---

## Notifications

### Watch for Security Patches
On the GitHub repository:
1. Click "Watch" (top right)
2. Select "Custom"
3. Check "Releases"

You'll be emailed when any new release is published, including security patches.

### RSS Feed
The releases page has an RSS feed:
`https://github.com/your-org/edustack/releases.atom`

---

## Rollback

If an update causes problems:
```bash
# See recent commits
git log --oneline -10

# Roll back to a specific version
git checkout v1.2.0

# Or roll back the last update
git reset --hard HEAD~1
```

---

## Version Policy

EduStack follows [Semantic Versioning](https://semver.org/):
- **MAJOR** (v2.0.0): Breaking changes — review carefully before updating
- **MINOR** (v1.1.0): New lessons or features — update at your convenience
- **PATCH** (v1.0.1): Bug fixes and safety patches — update promptly

Safety patches increment the PATCH version and are tagged `security-*`.

---

*Questions about updates? Open an issue with the `infrastructure` label.*
