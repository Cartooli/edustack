# ARCHITECTURE.md — EduStack Technical Design

> **For contributors, school IT departments, and anyone who wants to understand
> how EduStack works under the hood.**

---

## Design Principles

### 1. Safety Is Architecture, Not a Feature
Safety isn't bolted on — it's the load-bearing wall. Every component assumes hostile input.
Every output is treated as potentially unsafe until proven otherwise. The system is designed
so that if any single safety layer fails, the remaining layers still protect students.

### 2. Zero Dependencies at Runtime
After `git clone`, EduStack works. No `npm install`. No API keys for core content.
No build step. No Docker. No databases. Students open HTML files in a browser. That's it.

This matters because:
- School IT can audit the entire system (it's just files)
- No supply chain attacks from npm packages
- No broken builds from dependency updates
- Works offline after the initial clone
- No admin privileges needed on student machines

### 3. Progressive Enhancement
The system works at three levels:
- **Level 1 (Static):** Just HTML/CSS/JS files. No AI. No server. Open in any browser.
- **Level 2 (Local tools):** Shell scripts for content filtering and validation.
- **Level 3 (AI-assisted):** Optional Claude Code integration for tutoring.

Each level adds capability without breaking the level below it.

### 4. Everything Is Markdown
Following gstack's principle: the skills, lessons, teacher guides, and AI instructions
are all Markdown files. This means:
- Readable by humans without any tools
- Readable by AI assistants natively
- Versionable with Git
- Editable with any text editor
- Diffable for safety reviews

---

## System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    STUDENT LAYER                         │
│                                                         │
│   Browser  ──►  HTML/CSS/JS files  ──►  Visual output   │
│   (read)        (from /templates)       (in browser)    │
│                                                         │
├─────────────────────────────────────────────────────────┤
│                  AI TUTOR LAYER (optional)               │
│                                                         │
│   Student    ──►  Input       ──►  Prompt      ──►  AI  │
│   Input           Sanitizer        Builder          API  │
│   (text)          (Layer 1)        (Layer 4)             │
│                                                         │
│   Display   ◄──  Output      ◄──  AI                    │
│   (safe)          Screener         Response              │
│                   (Layer 5)                              │
│                                                         │
├─────────────────────────────────────────────────────────┤
│                  SAFETY LAYER (always active)            │
│                                                         │
│   Content Filter (Layer 2)     XSS Protection (Layer 3) │
│   Locale Check (Layer 6)       Audit Logger (Layer 7)   │
│                                                         │
├─────────────────────────────────────────────────────────┤
│                  TEACHER LAYER                           │
│                                                         │
│   config/teacher-settings.json    logs/ (local only)    │
│   docs/teacher-guides/            Skill progression     │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

---

## Skill File Format

Inspired by gstack's SKILL.md pattern, each EduStack skill follows a strict format:

```markdown
# SKILL-[NUMBER]: [Title]

## Overview
[1-2 sentences: what the student will learn and build]

## What You Need
[Prerequisites — always just "a browser and a text editor"]

## Teacher Notes
[Hidden section — rendered only in teacher guide versions]

## Steps

### Step 1: [Action verb] [Thing]
[2-3 sentences of explanation]

**Try it:** [Specific instruction the student follows]

```html
<!-- Code example with generous comments -->
```

**Check:** [How to verify it worked]

### Step 2: ...
[Continue pattern]

## Challenge
[Optional extension for students who finish early]

## Key Words
[Glossary of terms introduced in this skill]

## What's Next
[Teaser for the next skill — keeps momentum]
```

### Why This Format Works
- **Consistent structure** means students learn the format once
- **Code examples in every step** — show, don't tell
- **"Try it" / "Check"** creates a tight feedback loop
- **Challenge section** differentiates for advanced students
- **Key Words** builds vocabulary incrementally

---

## Content Filter Architecture

The content filter is a shell script (no dependencies) that:

1. **Loads the blocklist** from `skills/safety/blocklist.txt`
2. **Normalizes input** (lowercase, strip accents, collapse spaces)
3. **Checks against patterns** (exact match, then fuzzy match)
4. **Returns a verdict:** `CLEAN`, `FLAGGED`, or `BLOCKED`

```
Input ──► Normalize ──► Exact Match ──► Fuzzy Match ──► Verdict
                           │                │
                           ▼                ▼
                       blocklist.txt    evasion-patterns.txt
```

### Evasion Detection
Common techniques students might try and how we handle them:

| Technique | Example | Detection |
|---|---|---|
| Letter substitution | `h@ck` | Normalize: `hack` → match |
| Inserted spaces | `h a c k` | Collapse spaces → match |
| Repeated chars | `haaack` | Deduplicate → match |
| Unicode lookalikes | `hⓐck` | Unicode normalize → match |
| Reversed text | `kcah` | Reverse and check → match |
| Mixed case | `hAcK` | Lowercase → match |

This is not perfect. No filter is. But combined with the other 6 layers,
it's robust enough for a classroom environment.

---

## Prompt Architecture

When AI features are enabled, student questions go through a prompt builder:

```
┌─────────────────────────────────────────────────────┐
│ SYSTEM PROMPT (from CLAUDE.md — student cannot see) │
│                                                     │
│ You are EduBot, a web development tutor for         │
│ middle school students. You ONLY discuss HTML,      │
│ CSS, and JavaScript...                              │
│ [full safety rules from CLAUDE.md]                  │
├─────────────────────────────────────────────────────┤
│ CONTEXT (from current skill file)                   │
│                                                     │
│ The student is working on SKILL-05: JavaScript      │
│ basics. They are in Step 3: Variables.              │
│ [relevant code from their current file]             │
├─────────────────────────────────────────────────────┤
│ STUDENT INPUT (sanitized)                           │
│                                                     │
│ {sanitized text from Layer 1}                       │
├─────────────────────────────────────────────────────┤
│ INSTRUCTION                                         │
│                                                     │
│ Help the student with their web development         │
│ question. Use simple language. Show code examples.  │
│ If the question is not about web development,       │
│ redirect to their current skill.                    │
└─────────────────────────────────────────────────────┘
```

The student only controls the "STUDENT INPUT" section. Everything else is locked.

---

## Repository Safety

### What .gitignore Protects
```
# Never commit these
.env
logs/
*.log
config/teacher-settings.json
student-work/
node_modules/
.DS_Store
```

### Automated Safety Checks (CI/CD)
The `.github/workflows/safety-check.yml` runs on every push and PR:

1. **Secret scanning** — Checks for API keys, tokens, passwords
2. **URL scanning** — Checks for external URLs in content files
3. **Content scanning** — Runs the content filter on all .md and .html files
4. **PII scanning** — Checks for email addresses, phone numbers, etc.
5. **Dependency check** — Verifies no new dependencies were added
6. **Image review flag** — Any new images are flagged for manual review

### Fork and Clone Updates
Schools that fork the repo can get updates via:
```bash
# Add the upstream remote (one time)
git remote add upstream https://github.com/Cartooli/edustack.git

# Pull updates
git fetch upstream
git merge upstream/main
```

Safety patches are tagged with `security-` prefix for easy identification.
Schools can set up notifications for security-tagged releases.

---

## What We Intentionally Do NOT Include

| Omission | Why |
|---|---|
| User accounts | No student data to protect if there's no student data |
| Cloud storage | Nothing to breach if nothing is stored remotely |
| Real-time collaboration | No vectors for student-to-student inappropriate content |
| External links | No risk of linking to compromised or inappropriate sites |
| Package manager | No supply chain vulnerability surface |
| Build tools | No complexity for school IT to troubleshoot |
| Analytics | No tracking means no privacy concerns |
| Comments/chat | No social features = no cyberbullying vector |

Each omission is a deliberate safety decision. Features may be added in future versions
only when adequate safety measures exist for each.

---

*Architecture review cycle: Quarterly or when any safety-relevant change is proposed.*
