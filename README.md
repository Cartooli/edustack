# 🎓 EduStack — AI-Powered Web Development for Middle School

**The free, open-source, school-safe framework that teaches students to build real web apps with AI assistance.**

> *Designed for U.S. public school classrooms. Approved for school devices. Built with safety first.*

---

## What Is EduStack?

EduStack is a structured learning environment where **middle school students (grades 6–8)** learn web development through hands-on building — guided by AI, supervised by teachers, and protected by multiple layers of safety.

Think of it as: **GitHub for students × W3Schools for middle schoolers × VS Code for beginners** — with AI tutoring built in.

**Students learn by doing.** Not just reading. Not just quizzes. They build real things — a personal portfolio, a class weather dashboard, a school event page — while an AI assistant explains every step in language they understand.

### Why EduStack?

| Problem | EduStack's Answer |
|---|---|
| Coding tutorials are boring | Students build real projects from day one |
| AI tools aren't school-safe | 7-layer safety system blocks inappropriate content |
| Teachers don't know code | Teacher guides explain everything *before* each lesson |
| Existing platforms cost money | 100% free, MIT licensed, forever |
| Online environments are risky | Runs locally — no accounts, no cloud, no tracking |

---

## 🔒 Safety First — Always

EduStack was built from the ground up for the most cautious school environments. Every feature was designed to pass review by principals, superintendents, school boards, and parents.

### The 7-Layer Safety System

1. **Input Sanitization** — All student input is cleaned, validated, and length-limited before processing
2. **Content Filtering** — Multi-pass profanity, violence, and inappropriate content detection
3. **XSS Protection** — All outputs are HTML-escaped and sandboxed; no raw HTML injection possible
4. **Prompt Guardrails** — AI prompts are pre-structured so students cannot override safety instructions
5. **Output Screening** — AI responses are screened *after* generation before display
6. **Locale Enforcement** — System is configured for U.S. educational use; prompts and content are English-only for v1
7. **Audit Logging** — Every AI interaction is logged locally for teacher review (never transmitted)

### What Makes This Safer Than [Other Platform]?

- **No user accounts.** No emails. No passwords. No personal data collected. Ever.
- **No internet required** for core lessons (after initial clone)
- **No cloud storage.** Everything stays on the school device.
- **No chat rooms.** No social features. No messaging between students.
- **No external links.** All content is self-contained in the repo.
- **No ads.** No tracking. No analytics. No cookies.
- **Teacher override.** Teachers can disable AI features entirely and use static content only.

**Full safety documentation:** [docs/SAFETY.md](docs/SAFETY.md)

---

## 🚀 Quick Start for Teachers

### What You Need
- A computer with [Git](https://git-scm.com/) installed (most school IT departments can do this)
- A text editor ([VS Code](https://code.visualstudio.com/) recommended — free)
- 15 minutes to set up before your first class

### Setup (One Time)
```bash
# Clone EduStack to the school computer
git clone https://github.com/Cartooli/edustack.git

# Enter the directory
cd edustack

# Run the setup script (installs nothing — just validates the environment)
./setup.sh
```

That's it. No `npm install`. No API keys. No accounts. No admin privileges needed.

### Your First Class (30 minutes)

1. **Read the teacher guide first** (5 min): [docs/teacher-guides/LESSON-01.md](docs/teacher-guides/LESSON-01.md)
2. **Open the student skill**: Have students open `skills/learn/SKILL-01-hello-world.md`
3. **Students follow the steps**: Each skill is a guided, step-by-step activity
4. **Review together**: Students share what they built on their screens

### Getting Updates
```bash
# Pull the latest lessons and safety patches
cd edustack
git pull origin main
```

EduStack follows [semantic versioning](https://semver.org/). Safety patches are released immediately. New lessons are released on a predictable schedule.

---

## 📚 The Curriculum

EduStack is organized into **Units**, each containing **Lessons**, each containing **Skills** (hands-on activities).

### Unit 1: Web Foundations (Weeks 1–4)
| Lesson | What Students Build | Skills |
|---|---|---|
| 1. Hello World | Their first web page | HTML basics, file structure |
| 2. Style It Up | Add colors and layout | CSS fundamentals |
| 3. Make It Move | Simple animations | CSS transitions |
| 4. My First Site | Personal "About Me" page | Combining HTML + CSS |

### Unit 2: Making Things Interactive (Weeks 5–8)
| Lesson | What Students Build | Skills |
|---|---|---|
| 5. Click & React | Buttons that do things | JavaScript basics |
| 6. Data Display | Class weather dashboard | Working with data |
| 7. Forms & Input | Feedback form | Input handling, validation |
| 8. Mini App | Calculator or quiz app | Putting it all together |

### Unit 3: AI-Assisted Building (Weeks 9–12)
| Lesson | What Students Build | Skills |
|---|---|---|
| 9. Meet Your AI Tutor | Guided AI conversation | Safe AI interaction |
| 10. AI Helps You Code | AI-assisted web page | Prompt writing |
| 11. Debug With AI | Finding and fixing bugs | Problem-solving |
| 12. Final Project | Student's choice | Full project cycle |

---

## 🧠 How the AI Integration Works

EduStack can optionally integrate with Claude (via Claude Code or the API) to provide students with an AI coding tutor. **This is entirely optional** — all lessons work without AI.

When AI is enabled:

- Students interact through **pre-structured prompts** (not open chat)
- Every prompt includes safety instructions the student cannot see or modify
- AI responses are **filtered before display** through the content safety pipeline
- Teachers can review all AI interactions via local logs
- AI is limited to **web development topics only** — it will not discuss anything off-topic
- **No personal information** is ever sent to the AI — prompts are stripped of any PII patterns

**AI is a tutor, not a chatbot.** Students ask it to explain code, help debug, or suggest improvements to their project. It cannot browse the web, access files outside the project, or remember previous conversations.

---

## 🏗️ Repository Structure

```
edustack/
├── README.md                    ← You are here
├── CLAUDE.md                    ← Instructions for AI assistants working on this repo
├── LICENSE                      ← MIT License
├── setup.sh                     ← Safe setup script (validates, installs nothing)
├── .gitignore                   ← Keeps sensitive files out of the repo
├── .github/
│   └── workflows/
│       └── safety-check.yml     ← Automated safety scanning on every commit
├── docs/
│   ├── SAFETY.md                ← Complete safety documentation
│   ├── TEACHER-GUIDE.md         ← Overview for educators
│   ├── CONTRIBUTING.md          ← How to contribute (with safety requirements)
│   ├── REPO-SECURITY.md         ← How we keep the repo itself safe
│   ├── ARCHITECTURE.md          ← Technical design decisions
│   ├── UPDATE-GUIDE.md          ← How to get updates safely
│   ├── teacher-guides/          ← Per-lesson teacher prep docs
│   └── lessons/                 ← Detailed lesson plans
├── skills/
│   ├── learn/                   ← Student learning activities (SKILL-01 through SKILL-12)
│   ├── create/                  ← Project templates students can build from
│   ├── review/                  ← Self-review checklists for students
│   ├── safety/                  ← Safety system configuration
│   └── explore/                 ← Optional enrichment activities
├── templates/                   ← Starter HTML/CSS/JS files for each lesson
├── examples/                    ← Completed example projects for reference
└── scripts/
    ├── content-filter.sh        ← Content safety filter
    ├── input-sanitizer.sh       ← Input sanitization
    └── audit-log.sh             ← Local interaction logging
```

---

## 🤝 Contributing

We welcome contributions! But safety comes first. Please read [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md) before submitting.

**Every contribution must:**
- Pass the automated safety check (runs on every PR)
- Include no external URLs or links
- Include no images that haven't been reviewed
- Include no content that references violence, substances, or age-inappropriate topics
- Be reviewed by at least one maintainer with an education background

---

## 📋 For School Administrators

**EduStack is designed to meet your requirements:**

- ✅ **COPPA compliant** — Collects zero personal data from students
- ✅ **FERPA compatible** — No student records are created or transmitted
- ✅ **CIPA friendly** — All content is pre-screened; no internet access required during use
- ✅ **ADA accessible** — All content works with screen readers and keyboard navigation
- ✅ **Free** — MIT license, no cost, no subscriptions, no hidden fees
- ✅ **Open source** — Every line of code is publicly auditable
- ✅ **No vendor lock-in** — Fork it, modify it, own it

**Questions?** Open an issue on this repository or contact your school's IT department.

---

## License

MIT. Free forever. Go teach something.

---

*EduStack is not affiliated with any school district, state education department, or government agency. It is an independent open-source project designed to support public education.*
