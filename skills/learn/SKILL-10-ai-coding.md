# SKILL-10: AI Helps You Code — Learning to Prompt Well

## Overview
Now that you know how to talk to your AI tutor (Skill-09), let's use it to actually
help you build things. The key skill: writing clear prompts that get useful answers.

## What You Need
- AI tutor enabled by your teacher
- A project you're working on (or start a new one)

## Key Idea
The quality of AI help depends entirely on how you ask. A vague question gets a vague answer.
A specific question with context gets a specific, useful answer. This is called **prompt engineering**
and it's a real skill that professionals use every day.

---

## Steps

### Step 1: The Anatomy of a Great Prompt

Every great prompt has four parts:

1. **Context** — What are you working on?
2. **Goal** — What are you trying to do?
3. **Problem** — What's going wrong (or what's missing)?
4. **Constraint** — Any limitations? (keep it simple, use only CSS, etc.)

**Example — Bad prompt:**
> "How do I make a sidebar?"

**Example — Great prompt:**
> "I'm building a personal website with a header and three content sections (Skill-04 style).
> I want to add a sidebar on the left that shows a table of contents linking to each section.
> I've tried using float: left but it breaks my layout. I want it to work without JavaScript —
> just HTML and CSS."

The second prompt gives the AI everything it needs to help you specifically.

**Try it:** Think of something you want to build or fix. Write a prompt using all four parts.

---

### Step 2: Ask, Don't Copy

When the AI gives you code, DON'T just copy-paste it. Instead:

1. **Read it first** — Understand what each line does
2. **Ask questions** — "Why did you use flexbox instead of grid here?"
3. **Type it yourself** — Typing builds muscle memory
4. **Change something** — Modify a value, add a feature, make it your own
5. **Explain it** — Can you tell someone else what this code does?

If you can't explain it, you haven't learned it. Ask the AI to explain further.

**Try it:** Ask the AI to show you a CSS technique you haven't learned.
Read the code. Ask "why?" about at least one decision. Then modify it.

---

### Step 3: Use AI for Specific Tasks

Here are productive ways to use your AI tutor:

**Learning a new concept:**
> "Explain CSS flexbox like I'm in 7th grade. Show me a simple example
> with three boxes in a row, then three boxes in a column."

**Getting unstuck:**
> "My button hover effect isn't working. Here's my CSS:
> `.button { color: blue; }  .button.hover { color: red; }`
> What am I doing wrong?"

**Exploring possibilities:**
> "I have a list of items displayed vertically. What are three different
> ways I could make this look more interesting using only CSS?"

**Understanding errors:**
> "When I open my page, the console shows: 'Uncaught TypeError: Cannot read
> properties of null (reading addEventListener)'. What does this mean and
> how do I fix it?"

**Try it:** Use the AI for one of these task types on your current project.

---

### Step 4: The Iteration Loop

Professional developers don't get things right the first time. They iterate:

```
Ask AI for help → Read the suggestion → Try it →
Does it work?
  YES → Modify and improve it → Move on
  NO → Tell AI what happened → Get a better suggestion → Try again
```

**Example iteration:**
1. You: "How do I center a div vertically?"
2. AI: Shows `display: flex; align-items: center;`
3. You try it — it works horizontally but the page isn't tall enough
4. You: "It's centered but the page is too short. The div is only as tall as its content."
5. AI: "Add `min-height: 100vh` to the parent to make it fill the screen."
6. You try it — now it works!

**Try it:** Start a small project and use the iteration loop at least 3 times.

---

### Step 5: What AI Gets Wrong

AI is not perfect. Here are common mistakes to watch for:

- **Outdated code** — AI might suggest old techniques. If something doesn't work, ask for alternatives.
- **Over-complicated answers** — Sometimes the AI gives a complex solution when a simple one exists. Ask: "Is there a simpler way?"
- **Missing context** — AI doesn't know your full project. If the suggestion breaks something else, tell it what broke.
- **Confident but wrong** — AI can sound very sure about incorrect things. Always test the code yourself.

**Rule of thumb:** If you follow an AI suggestion and something breaks, the fix is usually
to give the AI MORE context about your specific situation.

---

## Challenge

Build something new using the AI tutor as your pair programmer:

1. Decide what you want to build (keep it small — one page, one feature)
2. Ask the AI for help planning it
3. Build it step by step, asking the AI when you get stuck
4. Document which prompts worked well and which didn't

---

## Key Words

| Word | What It Means |
|---|---|
| **Prompt** | The question or instruction you give to an AI |
| **Prompt engineering** | The skill of writing effective prompts |
| **Iteration** | Improving through repeated cycles of trying and adjusting |
| **Context** | Background information that helps AI give better answers |
| **Pair programming** | Two people (or one person + AI) working on code together |

---

## What's Next

In Skill-11, you'll use AI specifically for debugging — finding and fixing bugs
in code that doesn't work right.
