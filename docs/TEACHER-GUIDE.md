# TEACHER-GUIDE.md — EduStack for Educators

> **Read this before your first class. It takes about 10 minutes.**

---

## You Don't Need to Know How to Code

Seriously. EduStack is designed so that you learn each lesson 15 minutes before you teach it.
Each teacher guide tells you:

1. **What the lesson teaches** (plain English, no jargon)
2. **What students will build** (with a screenshot of the finished product)
3. **Common questions students will ask** (with suggested answers)
4. **Common mistakes** (and how to help students fix them)
5. **How long it takes** (with a built-in buffer)

You are not the expert. You are the guide. The skill files do the heavy lifting.
Your job is to keep students engaged, help them when they're stuck, and celebrate their wins.

---

## Classroom Setup Checklist

Before your first class:

- [ ] Computer(s) with a web browser (Chrome, Firefox, Edge, or Safari)
- [ ] A text editor installed (VS Code recommended — it's free)
- [ ] EduStack cloned to each computer (or a shared network drive)
- [ ] You've read the teacher guide for Lesson 1
- [ ] You've opened the example file for Lesson 1 in a browser to see what students will build
- [ ] (Optional) You've tried the first 3 steps of Skill-01 yourself

**If AI features will be used (optional):**
- [ ] Claude Code or API access configured by IT department
- [ ] You've reviewed [docs/SAFETY.md](SAFETY.md) and are comfortable with the safety system
- [ ] `config/teacher-settings.json` has `"ai_enabled": true`

---

## How a Typical Class Runs (45–50 minutes)

| Time | Activity | Your Role |
|---|---|---|
| 0:00–0:05 | Warm-up: review last lesson's key words | Ask a few students to explain terms |
| 0:05–0:10 | Introduction: today's skill | Read the "Overview" section aloud |
| 0:10–0:35 | Hands-on: students work through the skill | Walk around. Help stuck students. |
| 0:35–0:42 | Share: 2–3 students show their work | Celebrate effort, not perfection |
| 0:42–0:48 | Wrap-up: key words review | Write new terms on the board |
| 0:48–0:50 | Teaser: what's next | Read the "What's Next" section |

### Tips for Walking the Room
- **Look for blank screens** — Student is stuck. Sit down and read the skill with them.
- **Look for lots of text** — Student is ahead. Point them to the Challenge section.
- **Look for frustration** — "It's not working" is normal. Help them read the error, not fix it for them.
- **Look for pride** — Student got something working. Ask them to explain it to you.

---

## The AI Tutor (If Enabled)

### What It Does
- Answers student questions about HTML, CSS, and JavaScript
- Explains code in simple language
- Helps debug errors
- Suggests next steps

### What It Cannot Do
- Discuss anything outside web development
- Access the internet or external sites
- Remember previous conversations
- See other students' work
- Collect any personal information

### Your Role With AI
- **You are still the teacher.** The AI is a tool, not a replacement.
- **Monitor AI interactions** via the audit log when needed
- **Override AI if needed** — You can disable it mid-class if something goes wrong
- **Teach AI literacy** — Help students understand that AI is a tool that makes mistakes

### Talking Points for Parents About AI
If parents ask about the AI component:

1. "The AI can only discuss web development — coding topics. Nothing else."
2. "No student data is collected. No names, no accounts, no personal information."
3. "Every AI interaction is logged locally for my review. Nothing is sent to third parties."
4. "I can turn off AI at any time. The curriculum works fully without it."
5. "The AI is filtered seven different ways before a student sees anything."
6. "You're welcome to read the safety documentation — it's public and open source."

---

## Lesson-by-Lesson Teacher Guides

Detailed teacher guides are in `docs/teacher-guides/`:

| File | Lesson | Prep Time |
|---|---|---|
| [LESSON-01.md](teacher-guides/LESSON-01.md) | Hello World | 10 min |
| [LESSON-02.md](teacher-guides/LESSON-02.md) | Style It Up | 10 min |
| [LESSON-03.md](teacher-guides/LESSON-03.md) | Make It Move | 10 min |
| [LESSON-04.md](teacher-guides/LESSON-04.md) | My First Site | 15 min |
| [LESSON-05.md](teacher-guides/LESSON-05.md) | Click & React | 15 min |
| [LESSON-06.md](teacher-guides/LESSON-06.md) | Data Display | 15 min |
| [LESSON-07.md](teacher-guides/LESSON-07.md) | Forms & Input | 15 min |
| [LESSON-08.md](teacher-guides/LESSON-08.md) | Mini App | 20 min |
| [LESSON-09.md](teacher-guides/LESSON-09.md) | Meet Your AI Tutor | 15 min |
| [LESSON-10.md](teacher-guides/LESSON-10.md) | AI Helps You Code | 15 min |
| [LESSON-11.md](teacher-guides/LESSON-11.md) | Debug With AI | 15 min |
| [LESSON-12.md](teacher-guides/LESSON-12.md) | Final Project | 20 min |

---

## Grading Suggestions

EduStack doesn't have a grading system built in (intentionally — grading approaches vary).
Here are some frameworks teachers have used:

### Completion-Based (Simplest)
- Finished the skill steps: Full credit
- Attempted but didn't finish: Partial credit
- Did the Challenge section: Bonus

### Portfolio-Based (Recommended)
- Students save their work from each lesson
- End-of-unit review of their portfolio
- Grade on growth, not perfection

### What NOT to Grade
- Speed (some students take longer — that's fine)
- Code "quality" (they're beginners — working code is great code)
- AI usage (using the AI tutor is learning, not cheating)

---

## Troubleshooting

| Problem | Solution |
|---|---|
| "The page is blank" | Check if the file was saved. Check for a typo in the filename. |
| "The colors don't show" | Check for a missing semicolon in CSS. Most common beginner error. |
| "Nothing happens when I click" | Check the browser console (F12) for JavaScript errors. |
| "The AI isn't responding" | Check if AI features are enabled in teacher-settings.json. |
| "A student saw something inappropriate" | See "Incident Response" in [SAFETY.md](SAFETY.md). |
| "I can't git pull" | Ask IT to check network access to GitHub. |

---

## Getting Help

- **Technical issues:** Open an issue on the EduStack GitHub repository
- **Pedagogical questions:** Check the teacher guides or open a discussion
- **Safety concerns:** Follow the incident response process in [SAFETY.md](SAFETY.md)

---

*You're already doing something amazing by bringing coding into your classroom.
EduStack is here to make that easier. You've got this.*
