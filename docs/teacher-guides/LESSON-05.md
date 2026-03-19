# Teacher Guide: Lesson 05 — Click and React (JavaScript Basics)

> **Prep time: 15 minutes.** This is the hardest transition in the curriculum. Read carefully.

---

## What This Lesson Teaches

Students write their first JavaScript. They learn that JavaScript makes pages
interactive — buttons click, text changes, and the page responds to user actions.
This is a major shift from HTML/CSS (describing appearance) to programming (giving instructions).

## What Students Will Build

An interactive page with:
- A button that changes text when clicked
- An element that responds to user actions
- Variables that store and display values
- At least one `addEventListener` call

**Expected result:** A page where clicking a button makes something visibly happen.

## Before Class

- [ ] Computers are on and logged in
- [ ] You can open the browser console: F12 (or Cmd+Option+I on Mac), then Console tab
- [ ] Practice typing `alert("hello")` in the console yourself so you can demo it
- [ ] You've read through SKILL-05 completely
- [ ] Consider printing the "Key Words" section as a reference card

## Timing (45-minute class)

| Time | Activity |
|---|---|
| 0:00–0:05 | Demo: Open the console, type `alert("hello")`. Minds blown. |
| 0:05–0:12 | Show students how to open F12 console on their machines |
| 0:12–0:15 | Explain: "HTML = structure, CSS = style, JavaScript = behavior" |
| 0:15–0:38 | Students work through SKILL-05 (Steps 1–4) |
| 0:38–0:45 | Share: Students demo their interactive elements |
| 0:45–0:48 | Key words review |
| 0:48–0:50 | Teaser: "Next time we work with real data." |

## The Demo That Hooks Them

Open any page in the browser. Press F12 to open developer tools. Click the Console tab.
Type `alert("hello")` and press Enter. A popup appears! Then type
`document.body.style.backgroundColor = "red"` — the page turns red! Say:
"JavaScript can change ANYTHING on ANY page. Today you learn how."

**Important:** Show students how to open the console FIRST, before they start SKILL-05.
Spend 5 minutes on this. If they can't find the console, they'll be stuck.

## Common Questions

**"What's the difference between JavaScript and Java?"**
"Nothing — they're completely different languages with a confusing name. It's like
how 'car' and 'carpet' share letters but have nothing to do with each other."

**"Why doesn't my button do anything?"**
"Check these in order: (1) Is your `<script>` tag at the bottom, before `</body>`?
(2) Does `getElementById` match the exact `id` in your HTML? Capitalization matters!
(3) Did you save the file?"

**"What does 'undefined' mean in the console?"**
"It just means the command ran but didn't return a value. It's not an error! Think of
it as JavaScript saying 'Done, nothing to report.'"

**"Can I use JavaScript to make a game?"**
"Eventually, yes! We're starting with the basics today, but by the end of the course,
you'll have the skills to build simple games."

**"Why do we put the script at the bottom?"**
"The browser reads top-to-bottom. If the script runs before the HTML exists, JavaScript
can't find the elements. Putting the script at the bottom means the HTML is already there."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| `getElementById` case wrong | "Cannot read properties of null" | Match exact capitalization: `getElementById` not `getElementByID` |
| Script tag in `<head>` | Elements not found | Move `<script>` to bottom, before `</body>` |
| Missing quotes around strings | Red error in console | Strings need quotes: `"hello"` not `hello` |
| Using `=` instead of `===` | Unexpected behavior | `=` assigns, `===` compares |

## Safety Notes for This Lesson

- Students will discover the browser console — monitor for inappropriate alert messages
- Remind students: JavaScript is powerful, use it responsibly
- No `eval()`, no `innerHTML` with user-typed text, no `alert()` in loops
- If AI is enabled, it can help explain error messages, but students should type their own code
- Some students may try to write scripts that change other students' screens — not possible
  with local files, but address it if asked

---

*This lesson is the hardest transition. Some students will struggle. That's normal.
The jump from "describing things" (HTML/CSS) to "giving instructions" (JavaScript)
is a genuine cognitive shift. Be patient. Celebrate small wins.*
