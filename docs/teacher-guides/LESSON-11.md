# Teacher Guide: Lesson 11 — Debug With AI

> **Prep time: 15 minutes.** Bug Hunt is a competition — prepare the energy.

---

## What This Lesson Teaches

Students learn systematic debugging — how to find, understand, and fix bugs in code.
They use browser developer tools, read error messages, and optionally use AI to help
diagnose problems.

## What Students Will Build

Students complete a Bug Hunt exercise:
- A file with 5 intentional bugs (syntax errors, logic errors, styling errors)
- Students find and fix each bug
- They use the browser console to read error messages
- They practice "rubber duck debugging" (explaining code out loud)

**Expected result:** All 5 bugs found and fixed, with an understanding of HOW they
found each one.

## Before Class

- [ ] Computers are on and logged in
- [ ] You've read SKILL-11 completely and know where all 5 bugs are
- [ ] Practice reading an error message in the F12 console
- [ ] Decide: Will this be a competition (first to find all 5) or collaborative?
- [ ] Optional: Bring a rubber duck or stuffed animal for "rubber duck debugging" demo

## Timing (45-minute class)

| Time | Activity |
|---|---|
| 0:00–0:05 | Introduction: "Every programmer spends more time debugging than writing code." |
| 0:05–0:10 | Teach: How to read a console error (file name, line number, error type) |
| 0:10–0:12 | Demo: Rubber duck debugging — explain code to the duck out loud |
| 0:12–0:30 | Bug Hunt: Students find and fix 5 bugs (competition or collaborative) |
| 0:30–0:38 | Review: Go through each bug as a class. How did you find it? |
| 0:38–0:45 | Optional: Students use AI to help debug one bonus bug |
| 0:45–0:48 | Key lesson: "The error message is your friend, not your enemy." |
| 0:48–0:50 | Teaser: "Next time — your FINAL PROJECT. You pick what to build." |

## The Demo That Hooks Them

Show a page that looks broken. Open the console — there's a red error:
`Uncaught TypeError: Cannot read properties of null (reading 'textContent')`.
Walk through it: "It tells us WHAT went wrong (null), WHERE (line number), and
even gives us a clue (something is null when it shouldn't be)."

Then show: the `id` in `getElementById` was misspelled. Fix it. Page works.
"That error message just saved us an hour of guessing."

**Competition format:** If your class responds well to competition, make the Bug Hunt
a race. First student (or pair) to find all 5 bugs wins. This gets incredible
engagement.

## Common Questions

**"What does 'null' mean?"**
"It means JavaScript tried to find something and found NOTHING. Usually this means
an `id` is misspelled or an element doesn't exist yet."

**"How do I know which line the error is on?"**
"The console error message includes a file name and line number — click it and the
browser shows you the exact line."

**"What's 'rubber duck debugging'?"**
"Real programmers do this! You explain your code, line by line, to a rubber duck
(or anything). The act of explaining often reveals the bug because you have to
think about what each line ACTUALLY does."

**"The error message doesn't make sense."**
"That's normal — error messages are written for experienced programmers. Let's decode
it together: what's the error TYPE? What VARIABLE does it mention? What LINE?"

**"Can AI fix my bugs?"**
"AI can help, but YOU should try first. The skill of debugging is more valuable
than any single fix. Try the console, try rubber duck debugging, THEN ask AI."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| Ignoring the console | Student stares at code, stuck | "Open F12. What does the red text say?" |
| Changing random things | Code gets MORE broken | "Stop. Read the error. It tells you WHERE to look." |
| Fixing symptoms not causes | Bug comes back differently | "Why did this break? Fix the WHY, not just the WHAT." |
| Asking AI immediately | Doesn't learn debugging skills | "Try 3 things first, then ask AI" |

## Safety Notes for This Lesson

- The Bug Hunt file should contain ONLY coding bugs — no inappropriate content in the bugs
- If AI is enabled, students may ask AI for debugging help — this is appropriate for
  this lesson, but encourage them to try independently first
- Monitor console usage — students are comfortable with F12 now, ensure they're
  using it for debugging, not exploring other browser features
- Rubber duck debugging is silly and fun — lean into it

---

*Debugging is the most practical coding skill. Professional developers spend more time
debugging than writing new code. Students who learn to debug independently become
confident, self-sufficient coders.*
