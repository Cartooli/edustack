# Teacher Guide: Lesson 03 — Make It Move

> **Prep time: 10 minutes.** Read this before class. You'll be ready.

---

## What This Lesson Teaches

Students learn CSS transitions and animations — making elements respond to mouse
interactions and page loads. They add smooth hover effects and entrance animations
to their styled pages.

## What Students Will Build

An enhanced version of their styled page with:
- Hover effects on buttons, cards, or list items
- Smooth color transitions
- A fade-in animation on page load
- At least one custom keyframe animation

**Expected result:** A page that feels alive and interactive, even without JavaScript.

## Before Class

- [ ] Computers are on and logged in
- [ ] Students have their styled `my-page.html` from Lesson 02
- [ ] You've tested the animations in SKILL-03 in the classroom browser
- [ ] You know how to open browser developer tools (F12 on most browsers)

## Timing (45-minute class)

| Time | Activity |
|---|---|
| 0:00–0:05 | Demo: Show a page with animations vs. the same page without |
| 0:05–0:10 | Explain: "Transitions happen between states. Animations play on their own." |
| 0:10–0:35 | Students work through SKILL-03 (Steps 1–4) |
| 0:35–0:42 | Gallery walk: Students visit each other's screens to see animations |
| 0:42–0:48 | Key words review: transition, animation, keyframes, hover |
| 0:48–0:50 | Teaser: "Next time you build a complete site from scratch." |

## The Demo That Hooks Them

Open two versions of the same page: one with animations, one without. Click around
both. The animated page feels smooth, polished, and professional. The static one
feels old and clunky. Say: "Same content, same colors — the only difference is
a few lines of CSS. Let's learn those lines."

## Common Questions

**"Why is my hover effect jerky?"**
"You probably put the `transition` property only on the `:hover` rule. Move it to the
base rule (without `:hover`). The transition needs to know how to go back, too."

**"Can I make things spin?"**
"Yes! Use `transform: rotate(360deg)` in a `@keyframes` animation. Try it!"

**"How fast should animations be?"**
"Most hover transitions should be 0.2 to 0.3 seconds — fast enough to feel snappy
but slow enough to notice. Page load animations can be 0.5 to 1 second."

**"Why doesn't my animation play again?"**
"CSS animations play once by default when the page loads. To replay, you'd need
JavaScript (coming in Lesson 05). For now, refresh the page to see it again."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| Transition on `:hover` only | Jerky — snaps back instantly | Put `transition` on the base selector |
| Animation name misspelled | No animation plays | Match `animation:` name to `@keyframes` name exactly |
| Missing `@keyframes` block | Nothing happens | Define the keyframes with `from` and `to` |
| Too-fast animation | Can't see it | Increase duration: try `0.5s` or `1s` |

## Safety Notes for This Lesson

- **Seizure warning:** Remind students that rapidly flashing animations can cause
  seizures in people with photosensitive epilepsy. No flashing effects faster
  than 3 times per second. If a student creates a rapid flash, have them slow it down.
- Animations should enhance, not distract — encourage subtle, smooth effects
- Keep content appropriate as always — first names only, no personal details
- If AI is enabled, it can help explain timing functions, but students should experiment

---

*After this lesson, students know how to add motion to their pages. They understand
the difference between transitions (state changes) and animations (automatic playback).
Their pages feel professional and polished.*
