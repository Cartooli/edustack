# Teacher Guide: Lesson 06 — Data Display

> **Prep time: 15 minutes.** Read this before class. Whiteboard work helps.

---

## What This Lesson Teaches

Students learn to work with data in JavaScript — arrays (lists of items) and objects
(items with properties). They build a page that displays data dynamically instead
of hardcoding every element in HTML.

## What Students Will Build

A data-driven display page with:
- An array of items displayed as a list or cards
- Objects with multiple properties (name, value, description)
- A loop that generates HTML from data
- Dynamic content that updates from JavaScript, not hardcoded HTML

**Expected result:** A page that reads data from a JavaScript array and builds
the display automatically.

## Before Class

- [ ] Computers are on and logged in
- [ ] Whiteboard or projector available for explaining arrays and objects
- [ ] You've read through SKILL-06 completely
- [ ] Draw an example array on the board: `["Math", "Science", "Art"]`
- [ ] Draw an example object: `{subject: "Math", grade: "A", favorite: true}`

## Timing (45-minute class)

| Time | Activity |
|---|---|
| 0:00–0:08 | Whiteboard: Arrays are lists. Objects are things with details. |
| 0:08–0:12 | Demo: Show an array in the console, access items by index |
| 0:12–0:35 | Students work through SKILL-06 (Steps 1–4) |
| 0:35–0:42 | Share: Students show their data displays |
| 0:42–0:48 | Key words review: array, object, loop, index |
| 0:48–0:50 | Teaser: "Next time we let users TYPE data into our pages." |

## The Demo That Hooks Them

Open the browser console. Type:
```
let subjects = ["Math", "Science", "Art", "Music"];
subjects[0]
subjects.length
```
Show that arrays are just numbered lists. Then show:
```
let student = {nickname: "Coder42", skill: "CSS", level: 3};
student.nickname
student.level
```
Say: "Instead of writing every item in HTML by hand, JavaScript can build the page
FOR you from data. That's how real websites work."

## Common Questions

**"Why do arrays start at 0?"**
"Great question! Computers count from 0, not 1. The first item is at position 0,
the second at position 1. It's weird at first, but you'll get used to it."

**"What's the difference between an array and an object?"**
"An array is a numbered list: item 0, item 1, item 2. An object is a labeled collection:
name is 'Alex', age is 12, hobby is 'coding'. Use arrays for lists, objects for things
with details."

**"Why does my loop show 'undefined'?"**
"Your loop variable might be going past the end of the array. If you have 3 items,
they're at positions 0, 1, 2 — not 1, 2, 3. Check your loop condition."

**"Can I use real grades?"**
"Use fictional data only — no real grades, real names, or real scores. Make up fun
data like favorite pizza toppings or fictional character stats."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| Off-by-one in loop | Missing first or last item, or `undefined` | Arrays start at 0, end at `length - 1` |
| Forgetting brackets | Syntax error | Arrays: `[]`, Objects: `{}` |
| No comma between items | Syntax error | Every item needs a comma after it (except the last) |
| Using real student data | Privacy issue | Use fictional data only — no real names or grades |

## Safety Notes for This Lesson

- **Fictional data only** — no real grades, real names, or real personal information
- Suggested data themes: favorite books, fictional characters, made-up sports stats,
  imaginary restaurant menus, invented planet facts
- Monitor data content — students may try to include inappropriate items in their arrays
- If AI is enabled, it can help explain loop syntax, but data content must be student-created

---

*After this lesson, students understand that websites are powered by data, not just
hardcoded HTML. This is a big conceptual leap — data drives the page, not the other
way around.*
