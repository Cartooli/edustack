# Teacher Guide: Lesson 08 — Mini App

> **Prep time: 20 minutes.** This is a multi-day project lesson. Plan accordingly.

---

## What This Lesson Teaches

Students build a complete mini web application, combining everything from Lessons 01–07:
HTML structure, CSS styling, JavaScript interactivity, data management, and safe input
handling. This is their first "real app."

## What Students Will Build

Students choose one of four project options:
1. **Quiz App** — Multiple-choice quiz with scoring (most scaffolding provided)
2. **Task List** — Add, complete, and remove items
3. **Flashcard App** — Flip cards to study terms
4. **Calculator** — Basic math operations with display

**Expected result:** A working single-page application with user interaction, data
storage (in variables, not databases), and polished styling.

## Before Class

- [ ] Computers are on and logged in
- [ ] You've read SKILL-08 completely, including all four project options
- [ ] Print or display the four project options so students can choose
- [ ] You've tested the Quiz App template to understand the scaffolding
- [ ] Plan for 2 days if possible (Day 1: plan + start, Day 2: build + share)
- [ ] Decide: Will students present their apps?

## Timing (45-minute class — ideally 2 days)

### Day 1 (if 2 days available)

| Time | Activity |
|---|---|
| 0:00–0:05 | Introduction: "You're building your first app." Show the 4 options. |
| 0:05–0:12 | Students choose a project. Help undecided students pick Quiz App. |
| 0:12–0:18 | Paper planning: What features? What does it look like? |
| 0:18–0:45 | Build time: Students start coding, following SKILL-08 |

### Day 2 (or second half if single day)

| Time | Activity |
|---|---|
| 0:00–0:05 | Check-in: "Where are you? What's your next step?" |
| 0:05–0:32 | Build time: Continue coding and debugging |
| 0:32–0:42 | Gallery walk or presentations: Students demo their apps |
| 0:42–0:48 | Reflection: "What was hardest? What are you proudest of?" |
| 0:48–0:50 | Celebrate: "You just built an app. That's a real skill." |

## The Demo That Hooks Them

Show a completed Quiz App. Take the quiz yourself, get a few wrong on purpose,
show the score at the end. Then say: "This is one HTML file. No app store.
No download. You're going to build this — or something even cooler — today."

## Common Questions

**"Which project should I pick?"**
"If you're not sure, pick the Quiz App — it has the most starter code to help you.
If you want a challenge, try the Task List or Calculator."

**"Can I do something different?"**
"Stick with these four options for now. They're designed to practice everything
you've learned. You'll get a free-choice project in Lesson 12."

**"My app is too complicated."**
"That's totally normal! Let's scope down. What's the ONE thing your app needs to do?
Build that first. You can always add more features later."

**"How do I save data?"**
"For this project, store data in JavaScript variables and arrays. When you refresh
the page, the data resets — that's okay! Real apps use databases, but we're keeping
it simple."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| Scope too big | Student overwhelmed, nothing works | Help them cut features: "What's the minimum?" |
| Not using sanitize() | Unsanitized user input | Remind: every input goes through sanitize() |
| No plan, just coding | Disorganized code, stuck early | Pause and sketch on paper first |
| Copying code without understanding | Can't debug when it breaks | "Explain this line to me" — if they can't, they need to |

## Safety Notes for This Lesson

- Review project plans before students start coding — check for inappropriate content
- Quiz App: Questions must be school-appropriate (web dev topics, general knowledge, etc.)
- Task List: Monitor task content for inappropriate items
- All projects must use `textContent`, never `innerHTML` with user input
- If AI is enabled, students may ask for help debugging — that's great! But they
  should not copy entire solutions from AI
- Help students scope DOWN, not up — a working simple app beats a broken complex one

---

*This is the capstone of Unit 2. Students combine everything they've learned into
a real application. The sense of accomplishment is huge — they built an app that works.
Make sure they know how impressive that is.*
