# SKILL-11: Debug With AI — Finding and Fixing Bugs

## Overview
Every developer spends time debugging — finding and fixing errors. It's not a sign of
failure; it's a core part of the job. Today you'll learn a systematic approach to
debugging, and how AI can speed up the process.

## What You Need
- AI tutor enabled (recommended but optional)
- A browser with developer tools (F12)

## Key Idea
Bugs are not random. Every bug has a cause. Debugging is detective work:
gather clues, form a theory, test it, fix it. AI is like having a partner detective
who can spot patterns you might miss.

---

## Steps

### Step 1: The Debugging Process

When something doesn't work, follow these steps IN ORDER:

**1. What did you expect to happen?**
Write it down. "I expected the button to change the heading color to red."

**2. What actually happened?**
Write it down. "Nothing happened when I clicked the button."

**3. Check the console (F12 → Console tab)**
- Red text = an error. Read the message. It often tells you the line number.
- No errors? The bug is in your logic, not your syntax.

**4. Narrow it down**
- Does the HTML show correctly? (If not, HTML bug)
- Does the styling work? (If not, CSS bug)
- Does the JavaScript run at all? Add `console.log("script running")` at the top.

**5. Fix ONE thing at a time**
Don't change five things at once. Change one, test, change another, test.

**Try it:** Open an old project. Read through this process. Can you identify
where you'd start if something broke?

---

### Step 2: Practice With Intentional Bugs

Here's a page with 5 bugs. Find and fix them all:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Bug Hunt</title>
    <style>
      body {
        font-family: Georgia, serif
        background-color: #f0f4f8;
        padding: 20px;
      }
      
      .card {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        max-width: 600px;
        margin: 0 auto;
      }
      
      .count-display {
        font-size: 48px;
        text-allign: center;
        color: #2b6cb0;
      }
    </style>
  </head>
  <body>
    <div class="card">
      <h1>Click Counter</h2>
      <p class="count-display" id="count">0</p>
      <button id="add-btn">Add One</button>
    </div>
    
    <script>
      let count = 0;
      let display = document.getElementById("count");
      let button = document.getElementByID("add-btn");
      
      button.addEventListener("click", function() {
        count = count + 1;
        display.textContent = count;
      });
    </script>
  </body>
</html>
```

**The 5 bugs (try to find them before reading this):**

1. CSS: Missing semicolon after `font-family: Georgia, serif`
2. CSS: `text-allign` should be `text-align`
3. HTML: `<h1>` is closed with `</h2>` — mismatched tags
4. JS: `getElementByID` should be `getElementById` (capital D, lowercase d)
5. The mismatched tag won't cause a JavaScript error but will mess up the layout

**Try it:** Copy this code, find the bugs, fix them one at a time.

---

### Step 3: Using AI to Debug

When you're stuck, AI can help. Here's how to ask effectively:

**The debugging prompt formula:**
> "I'm trying to [GOAL]. When I [ACTION], [WHAT HAPPENS INSTEAD].
> Here's my code: [CODE]. The console shows: [ERROR MESSAGE]."

**Example:**
> "I'm trying to make a counter that goes up when I click a button.
> When I click the button, nothing happens. Here's my JavaScript:
> ```
> let button = document.getElementByID('add-btn');
> ```
> The console shows: 'document.getElementByID is not a function'"

The AI will quickly spot that `getElementByID` should be `getElementById`.

**What to include:**
- The specific error message (copy it exactly)
- The relevant code (not your entire file — just the part that's broken)
- What you already tried

**What NOT to ask:**
- "Fix my code" (too vague — the AI won't know what's broken)
- "Why doesn't this work?" without code (the AI can't read your screen)

**Try it:** If you're stuck on a bug, write a debugging prompt using the formula.

---

### Step 4: Common Bug Categories

Most bugs fall into a few categories. Learn to recognize them:

**Typos (the most common!)**
- `backgroud-color` instead of `background-color`
- Missing semicolons, colons, or brackets
- Wrong capitalization in JavaScript

**Wrong selector**
- `#myId` vs `.myClass` — `#` is for IDs, `.` is for classes
- Element doesn't have the ID you think it does

**Timing issues**
- JavaScript runs before the HTML loads
- Fix: Put `<script>` at the BOTTOM of `<body>`, not in `<head>`

**Logic errors**
- Code runs without errors but does the wrong thing
- Example: `if (score = 10)` (assignment) vs `if (score === 10)` (comparison)

**Scope issues**
- Variable created inside a function can't be accessed outside it
- Variable created outside can be accessed inside

**Try it:** Review your past projects. Can you categorize any bugs you encountered?

---

### Step 5: The Rubber Duck Method

Professional developers use a technique called "rubber duck debugging":
Explain your code out loud, line by line, to a rubber duck (or anything).
The act of explaining often reveals the bug.

You don't need a rubber duck. You can explain to:
- Your AI tutor
- A classmate
- An empty chair
- Your pet at home

The magic isn't in who's listening — it's in the explaining.

**Try it:** Take your most complex piece of code and explain every line out loud.

---

## Challenge

Create a "Bug Hunt" page for your classmates! Write a web page with 5 intentional bugs
(different types) and challenge someone else to find them all. Include an answer key
in an HTML comment at the bottom.

---

## Key Words

| Word | What It Means |
|---|---|
| **Bug** | An error in code that causes unexpected behavior |
| **Debugging** | The process of finding and fixing bugs |
| **Console** | The browser's log where errors and messages appear (F12) |
| **Syntax error** | A typo or structural mistake that prevents code from running |
| **Logic error** | Code that runs but does the wrong thing |
| **Rubber duck debugging** | Explaining code out loud to find bugs |

---

## What's Next

Skill-12 is the FINAL PROJECT. You'll plan, build, and present a complete web application
of your choice. Everything you've learned comes together!
