# Teacher Guide: Lesson 07 — Forms and Input

> **Prep time: 15 minutes.** This is THE security lesson. The demo is critical.

---

## What This Lesson Teaches

Students learn to accept user input through HTML forms and handle it safely with
JavaScript. This is the most important safety lesson in the curriculum — students
learn WHY input must be sanitized, not just how.

## What Students Will Build

A form-based page with:
- Text input fields with labels
- A submit button that processes input with JavaScript
- A `sanitize()` function that escapes HTML
- Display of sanitized user input using `textContent` (never `innerHTML`)

**Expected result:** A working form that safely accepts and displays user input.

## Before Class

- [ ] Computers are on and logged in
- [ ] You've practiced the XSS demo (see below) — this is the most important demo
- [ ] You've read SKILL-07 completely, especially the sanitize function
- [ ] Projector available for the demo (students need to SEE the danger)
- [ ] Optionally: Open `docs/SAFETY.md` Layer 3 section for reference

## Timing (45-minute class)

| Time | Activity |
|---|---|
| 0:00–0:08 | THE DEMO: Show what happens without sanitization (see below) |
| 0:08–0:12 | Explain: "This is why every website in the world sanitizes input." |
| 0:12–0:35 | Students work through SKILL-07 (Steps 1–5) |
| 0:35–0:42 | Activity: Students try to "break" their own forms (safely) |
| 0:42–0:48 | Discussion: "What other inputs could be dangerous?" |
| 0:48–0:50 | Wrap-up: "You now know something most adults don't about web safety." |

## The Demo That Hooks Them

**This demo is the most memorable moment in the entire curriculum.**

1. Open a simple HTML file with a form that uses `innerHTML` to display input:
```html
<input id="name" type="text">
<button onclick="document.getElementById('output').innerHTML = document.getElementById('name').value">Submit</button>
<div id="output"></div>
```
2. Type a normal name. It works fine.
3. Then type: `<h1>HACKED</h1>`
4. The page renders a giant "HACKED" heading. Students gasp.
5. Now show the SAFE version using `textContent`:
```html
<button onclick="document.getElementById('output').textContent = document.getElementById('name').value">Submit</button>
```
6. Type `<h1>HACKED</h1>` again. This time it shows the literal text, not rendered HTML.

Say: "The difference between a safe website and a hackable one is ONE WORD:
`textContent` instead of `innerHTML`. Today you learn to build the safe version."

**Students remember this demo forever.**

## Common Questions

**"Could someone actually hack a website like that?"**
"Yes — it's called Cross-Site Scripting or XSS. It's one of the most common web
vulnerabilities. Real companies have been hacked this way. You're learning to
prevent it."

**"Why can't I just use innerHTML?"**
"Because if a user types HTML tags, `innerHTML` will run them as code. That means
anyone could inject content — or worse, scripts — into your page. `textContent`
treats everything as plain text, which is safe."

**"What does 'sanitize' mean?"**
"It means cleaning input to make it safe. Like washing your hands before cooking —
you remove anything that could cause harm. In code, we replace dangerous characters
with safe versions."

**"What if I want the user to format text?"**
"Great question for advanced work! There are safe ways to allow limited formatting,
but for now, always treat user input as plain text. Safety first."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| Using `innerHTML` for user input | XSS vulnerability | Always use `textContent` for displaying user input |
| Forgetting to sanitize | Raw input displayed | Run input through the `sanitize()` function first |
| No `maxlength` on input | Users can paste huge text | Add `maxlength="200"` to input elements |
| Form refreshes the page | Page goes blank on submit | Use `event.preventDefault()` or `type="button"` |

## Safety Notes for This Lesson

- This lesson TEACHES security — lean into it, don't shy away
- Let students try the unsafe version first so they understand WHY sanitization matters
- Monitor what students type into forms — redirect inappropriate input
- The `sanitize()` function in SKILL-07 should be used in every project going forward
- If AI is enabled, it can explain XSS and sanitization, but students must write
  their own sanitize function to understand it

---

*This is the most important safety lesson. Students learn WHY security matters by
seeing a vulnerability with their own eyes. After this lesson, they'll never forget
to sanitize input.*
