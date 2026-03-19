# SKILL-09: Meet Your AI Tutor — Using AI to Learn Coding

## Overview
You've been building web pages for weeks. Now you're going to learn how to use an AI
assistant to help you learn faster. This skill teaches you what AI can do, what it can't do,
and how to ask it good questions.

## What You Need
- Your project files from previous skills
- AI tutor enabled by your teacher (if it's not on, this skill still teaches the concepts)

## Key Idea
AI is a **tool**, like a calculator or a dictionary. It's really good at some things
(explaining code, finding bugs, suggesting ideas) and not good at other things
(being creative, understanding exactly what you want, being 100% right). The best coders
know how to use AI as a helper — not a replacement for their own thinking.

---

## Steps

### Step 1: What AI Can Help With

Here are things your AI tutor is great at:

**Explaining code:** "What does this CSS property do?"
```
You: What does border-radius do?
AI: border-radius rounds the corners of an element. If you set
    border-radius: 8px, each corner becomes a smooth curve instead
    of a sharp right angle. Bigger numbers = rounder corners.
    Try border-radius: 50% on a square element to make a circle!
```

**Finding bugs:** "Why doesn't my code work?"
```
You: My background color isn't showing up. Here's my CSS:
     body { backgroud-color: blue; }
AI: I see the issue! "backgroud-color" has a typo — it should be
    "background-color" (you're missing the 'n'). CSS doesn't show
    errors — it just ignores properties it doesn't recognize.
```

**Suggesting next steps:** "What should I try next?"
```
You: I finished making my list look nice. What should I try next?
AI: Great work! Here are some ideas:
    1. Add a hover effect so items highlight when you mouse over them
    2. Try making the list horizontal instead of vertical
    3. Add icons before each list item using CSS ::before
    Which one sounds fun? I can walk you through it!
```

**Check:** Read through these examples. Do they make sense?

---

### Step 2: What AI Cannot Do

Your AI tutor has limits. Here's what it **cannot** do:

- **Browse the internet** — It can't look things up online
- **See your screen** — You need to paste your code into the chat
- **Remember past conversations** — Each conversation starts fresh
- **Be 100% right** — Sometimes AI makes mistakes. Always test the code yourself!
- **Read your mind** — The more specific your question, the better the answer

**And here's what it will NOT do (on purpose):**

- Help with anything except web development (HTML, CSS, JavaScript)
- Chat about personal topics
- Do your work for you (it guides, it doesn't write your whole project)

**Check:** Can you think of a question the AI tutor would NOT answer?

---

### Step 3: How to Ask Good Questions

The quality of the answer depends on the quality of your question.

**Bad question:** "It doesn't work."
**Better question:** "My CSS color isn't showing. Here's my code: `color: re;`"
**Best question:** "I'm trying to make my h1 heading red. I wrote `color: re;` but
nothing changed. The rest of my CSS is working. What am I doing wrong?"

**The formula for a great question:**
1. **What are you trying to do?** ("I'm trying to make my heading red")
2. **What did you try?** ("I wrote `color: re;`")
3. **What happened?** ("Nothing changed")
4. **What did you expect?** ("I expected the heading to turn red")

This is actually how professional developers ask questions too! It's called a
"good bug report" and it's a real skill.

**Try it (even without AI):** Write a practice question using the formula above,
based on a real problem you had in a previous skill.

---

### Step 4: Practice With the AI Tutor

If your teacher has enabled the AI tutor, try these practice interactions:

**Practice 1: Ask for an explanation**
Ask the AI: "What's the difference between padding and margin in CSS?"

Did the explanation make sense? Could you explain it to a friend?

**Practice 2: Ask for debugging help**
Show the AI this broken code and ask for help:
```html
<html>
  <head>
    <style>
      h1 {
        color: blue
        font-size: 24px;
      }
    </style>
  </head>
  <body>
    <h1>My Page<h1>
  </body>
</html>
```
(There are 2 bugs. Can you find them before the AI does?)

**Practice 3: Ask for a suggestion**
Ask the AI: "I have a page with a heading and a list. What's one thing I could add
to make it more interesting?"

**Check:** Did the AI help? Did it stay on topic? Did you learn something?

---

### Step 5: AI Literacy — Being a Smart User

Using AI well is a skill. Here are the rules of being a smart AI user:

**Rule 1: Always test the code yourself.**
Don't just copy and paste. Read the code. Understand what it does. Then try it.
If it doesn't work, that's fine — you'll learn from debugging it.

**Rule 2: AI is a starting point, not a final answer.**
Think of AI suggestions as a first draft. You make it better.

**Rule 3: If you don't understand the answer, ask again.**
Say "Can you explain that in simpler terms?" or "Can you show me an example?"
There's no shame in asking for a clearer explanation.

**Rule 4: Give credit.**
If AI helped you with a technique, it's good practice to note it in a code comment:
```html
<!-- AI helped me figure out how to center this container -->
<div class="centered">
```

**Rule 5: Your ideas matter more than AI's.**
AI can help you build things, but it can't decide what to build. The creative vision
is yours. You're the designer. You're the developer. AI is the assistant.

---

## Challenge

Write three questions you'd ask the AI tutor about a project you'd like to build.
Use the "good question formula" from Step 3 for each one.

Then (if AI is enabled) actually ask them and see if the answers are helpful!

---

## Key Words

| Word | What It Means |
|---|---|
| **AI** | Artificial Intelligence — a computer program that can understand and generate text |
| **Prompt** | The question or instruction you give to an AI |
| **Debugging** | Finding and fixing errors in code |
| **AI Literacy** | Knowing how to use AI tools effectively and responsibly |
| **Bug report** | A clear description of a problem: what you tried, what happened, what you expected |

---

## What's Next

Now that you know how to talk to your AI tutor, in Skill-10 you'll learn how to use
AI to help you write code — not by copying its answers, but by learning from its explanations!
