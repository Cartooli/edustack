# Teacher Guide: Lesson 09 — Meet Your AI Tutor

> **Prep time: 15 minutes.** This is an AI literacy lesson. Read carefully even if AI is disabled.

---

## What This Lesson Teaches

Students learn what AI is, how it works at a high level, and how to interact with
the EduBot AI tutor safely and effectively. This is an AI literacy lesson first,
and a coding lesson second.

## What Students Will Build

A guided conversation with the AI tutor (or teacher-simulated AI) where they:
- Ask coding questions and evaluate the responses
- Learn to spot when AI might be wrong
- Practice writing clear, specific questions
- Understand what the AI can and cannot do

**Expected result:** Students can use the AI tutor effectively and critically.

## Before Class

- [ ] Decide: Is AI enabled for your classroom? Check `config/teacher-settings.json`
- [ ] If AI is disabled, prepare to play the AI role using SKILL-09's suggested responses
- [ ] If AI is enabled, test it yourself: run a few queries through the safety pipeline
- [ ] Computers are on and logged in
- [ ] You've read SKILL-09 completely, especially the "What AI Gets Wrong" section

## Timing (45-minute class)

| Time | Activity |
|---|---|
| 0:00–0:08 | Discussion: "What do you think AI is? What can it do?" |
| 0:08–0:15 | Explain: How the EduBot works (simple version — it reads your question, thinks about code, gives an answer) |
| 0:15–0:18 | Key rule: "AI makes mistakes. ALWAYS test the code it suggests." |
| 0:18–0:35 | Students work through SKILL-09 guided activities |
| 0:35–0:42 | Share: "What did the AI get right? What did it get wrong?" |
| 0:42–0:48 | Discussion: When to use AI vs. when to figure it out yourself |
| 0:48–0:50 | Teaser: "Next time we learn to write better questions for AI." |

## If AI Is Disabled

This lesson works WITHOUT AI enabled. You or a teaching assistant plays the AI role:
1. Students write questions on paper or type them
2. You respond using the suggested answers in SKILL-09
3. Intentionally give one slightly wrong answer to teach critical thinking
4. This actually works BETTER for the "AI makes mistakes" lesson

## The Demo That Hooks Them

Show two interactions with the AI:
1. A good question: "How do I center a div with CSS?" → AI gives a great answer with flexbox code
2. A vague question: "fix my code" → AI gives a generic, unhelpful answer

Say: "The AI is like a tutor who knows a LOT about code — but only answers what you
ask. If you ask a clear question, you get a clear answer. If you ask a vague question,
you get a vague answer."

## Common Questions

**"Is the AI always right?"**
"No! AI can make mistakes, give outdated advice, or misunderstand your question.
ALWAYS test code in your browser before trusting it. That's rule number one."

**"Can the AI do my homework?"**
"It could write code, but then YOU wouldn't learn anything. The goal is for YOU to
understand the code. Use AI to explain things, not to do things for you."

**"Can I ask the AI anything?"**
"The AI only knows about web development — HTML, CSS, and JavaScript. If you ask
about other topics, it'll redirect you back to coding. That's by design."

**"How does the AI know stuff?"**
"It was trained on millions of examples of code and explanations. Think of it like
a student who read every coding textbook ever written — it knows a lot, but it
doesn't always understand YOUR specific situation."

## Common Mistakes

| Mistake | What You'll See | Fix |
|---|---|---|
| Trusting AI blindly | Code that doesn't work | "Always test in the browser. Did you try it?" |
| Asking vague questions | Unhelpful answers | "Be specific: what are you trying to do? What happened?" |
| Copying without reading | Can't explain their own code | "Read it line by line. What does each line do?" |
| Asking off-topic questions | AI redirects to coding | Explain: "The AI is a coding tutor, not a general assistant" |

## Safety Notes for This Lesson

- **Monitor AI interactions closely** during this lesson — it's students' first time
- If AI is enabled, watch for students trying to "trick" the AI (prompt injection).
  The content filter should catch these, but be aware.
- Remind students: never share personal information with the AI
- If a student gets an inappropriate or incorrect AI response, use it as a teaching
  moment about AI limitations
- Keep the focus on LEARNING about AI, not just using it

---

*This lesson teaches students to be critical, thoughtful AI users — not just passive
consumers. The skill of evaluating AI output is arguably more important than any
coding skill in this curriculum.*
