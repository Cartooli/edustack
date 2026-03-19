# Teacher Guide: Lesson 02 — Style It Up

> **Prep time: 10 minutes.** Read this before class. You'll be ready.

---

## What This Lesson Teaches

Students learn CSS — the language that controls how web pages look. They add colors,
fonts, spacing, and layout to their HTML page from Lesson 01.

## What Students Will Build

A styled version of their "About Me" page with:
- A colored background
- Custom fonts and text sizes
- Styled headings, paragraphs, and lists
- A centered layout with spacing

**Expected result:** A polished, colorful version of their Lesson 01 page.

## Before Class

- [ ] Computers are on and logged in
- [ ] Students have their `my-page.html` file from Lesson 01 accessible
- [ ] You've opened `examples/css-fun/index.html` to see the finished product
- [ ] Optional: Open a page with CSS and one without to demo the difference

## Timing (45-minute class)

| Time | Activity |
|---|---|
| 0:00–0:05 | Demo: Delete the `<style>` block from a page, show ugly. Restore it. |
| 0:05–0:10 | Explain: "CSS is the paint. HTML is the building." |
| 0:10–0:35 | Students work through SKILL-02 (Steps 1–5) |
| 0:35–0:42 | Share: Students compare their styled pages |
| 0:42–0:48 | Key words review: selector, property, value |
| 0:48–0:50 | Teaser: "Next time we add movement." |

## The Demo That Hooks Them

Open a nicely styled page in the browser. Then open the developer tools and delete
the entire `<style>` block. Watch the page collapse into ugly, unstyled text.
Then press Ctrl+Z (or undo) to restore it. Say: "CSS is the difference between
a blank wall and a mural. Today you learn to paint."

## Common Questions

**"Why isn't my color changing?"**
"Check three things: (1) Did you save the file? (2) Is your CSS inside the `<style>`
tags in the `<head>`? (3) Did you end the line with a semicolon?"

**"What colors can I use?"**
"You can use color names like `red`, `blue`, `tomato`, or `steelblue`. You can also
use hex codes like `#3182ce`. Try different ones and see what you like!"

**"Why does everything look the same?"**
"Check your selector — the part before the `{`. It needs to match a tag or class name
in your HTML. If you wrote `.card` but your HTML has `<div class='box'>`, they won't
match."

**"Can I use any font?"**
"For now, stick with fonts that come built into every computer: Georgia, Arial,
Verdana, or Courier New. These always work without needing the internet."

**"What's the difference between margin and padding?"**
"Padding is the space INSIDE the box (like cushioning inside a package). Margin is
the space OUTSIDE the box (like the gap between packages on a shelf)."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| Missing semicolons | Only the first style works | Add `;` at the end of every property line |
| CSS outside `<style>` tags | Styles don't apply | Move CSS inside `<style>` in the `<head>` |
| Wrong selector name | Nothing changes | Match the selector to an HTML tag or class |
| Typo in property name | That property is ignored | Check spelling: `background-color` not `backgrond-color` |

## Safety Notes for This Lesson

- No external fonts or images — everything must work offline
- Remind students: keep content appropriate, first names only
- Walk the room and check pages for inappropriate text or colors used to spell words
- If AI is enabled, students can ask about CSS syntax, but should write their own styles

---

*After this lesson, students understand that CSS controls appearance. They can change
colors, fonts, and spacing. Their pages look like something they're proud of.*
