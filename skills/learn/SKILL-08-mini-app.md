# SKILL-08: Mini App — Build a Complete Application

## Overview
This is your biggest project yet. You'll plan, design, build, and test a complete
mini application. You pick what to build. You own the entire process.

## What You Need
- All skills from 01–07
- A browser and text editor
- An idea (or pick from the list below)

## Key Idea
Professional developers don't just write code — they plan, build, test, and iterate.
This skill walks you through the full process.

---

## Steps

### Step 1: Pick Your Project

Choose one (or propose your own to your teacher):

**Option A: Quiz App**
- Display questions one at a time
- Track score
- Show results at the end

**Option B: Calculator**
- Basic math operations (+, -, ×, ÷)
- Display with buttons
- Clear and equals functions

**Option C: To-Do List**
- Add tasks
- Mark tasks complete
- Delete tasks
- Count remaining tasks

**Option D: Flashcard Study Tool**
- Display a question
- Click to reveal the answer
- Track how many you've reviewed
- Shuffle the cards

**Try it:** Pick one. Write down which one and why.

---

### Step 2: Plan Before You Code

Answer these three questions on paper:

1. **What does the user see?** (Draw a rough sketch)
2. **What can the user do?** (List every button, input, action)
3. **What data does the app need?** (What variables and arrays?)

Example plan for a Quiz App:
```
USER SEES:
- Question text
- 4 answer buttons
- Score display
- Progress (Question 3 of 10)

USER CAN:
- Click an answer
- See if they were right
- Move to next question
- See final score

DATA NEEDED:
- Array of question objects (question, answers, correct answer)
- Current question number
- Score counter
```

**Try it:** Write your plan. Show it to your teacher or a classmate.

**Check:** Your plan should answer all three questions clearly.

---

### Step 3: Build the HTML First

Start with structure. Don't worry about looks yet.

Here's an example for the Quiz App:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Quiz App</title>
    <style>/* We'll add styles in Step 4 */</style>
  </head>
  <body>
    <div class="app">
      <h1>Quiz Time!</h1>
      
      <div id="quiz-area">
        <div class="progress">
          Question <span id="current-num">1</span> of <span id="total-num">5</span>
        </div>
        
        <p id="question" class="question-text">Loading question...</p>
        
        <div id="answers" class="answer-grid">
          <!-- Buttons will be created by JavaScript -->
        </div>
        
        <p id="feedback" class="feedback"></p>
      </div>
      
      <div id="results-area" style="display: none;">
        <h2>Quiz Complete!</h2>
        <p>Your score: <span id="final-score">0</span> out of <span id="final-total">5</span></p>
        <button id="restart-button">Try Again</button>
      </div>
      
      <div class="score-bar">
        Score: <span id="score">0</span>
      </div>
    </div>
    
    <script>
      // Step 5: JavaScript goes here
    </script>
  </body>
</html>
```

**Try it:** Build the HTML for your chosen project. Open it in the browser.

---

### Step 4: Style It

Make it look like a real app (adapt these for your project):

```css
body {
  margin: 0;
  padding: 20px;
  background-color: #f0f4f8;
  font-family: Georgia, serif;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding-top: 40px;
}

.app {
  max-width: 600px;
  width: 100%;
  background: white;
  border-radius: 16px;
  padding: 30px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

h1 {
  text-align: center;
  color: #2b6cb0;
  margin-bottom: 5px;
}

.progress {
  text-align: center;
  color: #718096;
  margin-bottom: 20px;
}

.question-text {
  font-size: 20px;
  text-align: center;
  padding: 20px;
  background: #ebf8ff;
  border-radius: 10px;
  min-height: 60px;
}

.answer-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 10px;
  margin: 20px 0;
}

.answer-button {
  padding: 14px;
  font-size: 16px;
  border: 2px solid #e2e8f0;
  border-radius: 8px;
  background: white;
  cursor: pointer;
  transition: all 0.2s ease;
}

.answer-button:hover {
  border-color: #3182ce;
  background-color: #ebf8ff;
  transform: translateY(-2px);
}

.answer-correct {
  background-color: #c6f6d5;
  border-color: #38a169;
}

.answer-wrong {
  background-color: #fed7d7;
  border-color: #e53e3e;
}

.feedback {
  text-align: center;
  font-weight: bold;
  min-height: 24px;
}

.score-bar {
  text-align: center;
  padding: 10px;
  background: #2b6cb0;
  color: white;
  border-radius: 8px;
  margin-top: 15px;
}
```

**Try it:** Style your app. Make it look polished.

---

### Step 5: Add the JavaScript

Here's the Quiz App logic (adapt for your project):

```javascript
// QUIZ DATA
let questions = [
  {
    question: "What does HTML stand for?",
    answers: ["Hyper Text Markup Language", "High Tech Modern Language",
              "Home Tool Markup Language", "Hyper Transfer Mode Link"],
    correct: 0
  },
  {
    question: "Which tag makes text bold?",
    answers: ["<b> or <strong>", "<bold>", "<thick>", "<em>"],
    correct: 0
  },
  {
    question: "What does CSS control?",
    answers: ["Page behavior", "Page appearance", "Page speed", "Page security"],
    correct: 1
  },
  {
    question: "Which symbol starts a CSS class selector?",
    answers: ["#", "@", ".", "&"],
    correct: 2
  },
  {
    question: "What does JavaScript add to a web page?",
    answers: ["Colors", "Fonts", "Interactivity", "Images"],
    correct: 2
  }
];

// STATE
let currentQuestion = 0;
let score = 0;

// ELEMENTS
let questionEl = document.getElementById("question");
let answersEl = document.getElementById("answers");
let feedbackEl = document.getElementById("feedback");
let scoreEl = document.getElementById("score");
let currentNumEl = document.getElementById("current-num");
let totalNumEl = document.getElementById("total-num");
let quizArea = document.getElementById("quiz-area");
let resultsArea = document.getElementById("results-area");
let finalScoreEl = document.getElementById("final-score");
let finalTotalEl = document.getElementById("final-total");
let restartButton = document.getElementById("restart-button");

totalNumEl.textContent = questions.length;

// SHOW A QUESTION
function showQuestion() {
  let q = questions[currentQuestion];
  questionEl.textContent = q.question;
  currentNumEl.textContent = currentQuestion + 1;
  feedbackEl.textContent = "";
  
  // Clear old answers
  answersEl.innerHTML = "";
  
  // Create answer buttons
  for (let i = 0; i < q.answers.length; i++) {
    let button = document.createElement("button");
    button.className = "answer-button";
    button.textContent = q.answers[i];
    button.addEventListener("click", function() {
      checkAnswer(i);
    });
    answersEl.appendChild(button);
  }
}

// CHECK THE ANSWER
function checkAnswer(selected) {
  let q = questions[currentQuestion];
  let buttons = answersEl.querySelectorAll(".answer-button");
  
  // Disable all buttons
  for (let i = 0; i < buttons.length; i++) {
    buttons[i].style.pointerEvents = "none";
  }
  
  // Highlight correct/wrong
  buttons[q.correct].classList.add("answer-correct");
  
  if (selected === q.correct) {
    score = score + 1;
    scoreEl.textContent = score;
    feedbackEl.textContent = "Correct!";
    feedbackEl.style.color = "#38a169";
  } else {
    buttons[selected].classList.add("answer-wrong");
    feedbackEl.textContent = "Not quite! The answer was: " + q.answers[q.correct];
    feedbackEl.style.color = "#e53e3e";
  }
  
  // Move to next question after a pause
  setTimeout(function() {
    currentQuestion = currentQuestion + 1;
    if (currentQuestion < questions.length) {
      showQuestion();
    } else {
      showResults();
    }
  }, 1500);
}

// SHOW RESULTS
function showResults() {
  quizArea.style.display = "none";
  resultsArea.style.display = "block";
  finalScoreEl.textContent = score;
  finalTotalEl.textContent = questions.length;
}

// RESTART
restartButton.addEventListener("click", function() {
  currentQuestion = 0;
  score = 0;
  scoreEl.textContent = 0;
  quizArea.style.display = "block";
  resultsArea.style.display = "none";
  showQuestion();
});

// START
showQuestion();
```

**Try it:** Build the JavaScript for your chosen project.

**Check:** Test every feature. Click every button. Try to break it.

---

### Step 6: Test and Polish

Before you call it done, test these things:

- [ ] Every button works
- [ ] Edge cases work (first item, last item, empty states)
- [ ] It looks good at different window sizes
- [ ] No errors in the browser console (F12)
- [ ] Input validation works (if applicable)
- [ ] It's fun to use!

---

## Challenge

Add one feature from this list to your app:
- A timer (how fast can you complete the quiz?)
- Sound effects (using simple audio)
- A high score tracker
- Categories or difficulty levels
- Animated transitions between states

---

## Key Words

| Word | What It Means |
|---|---|
| **Application** | A program that does a specific job for the user |
| **State** | The current data of your app (score, current question, etc.) |
| **Event handler** | A function that runs when something happens (click, submit) |
| **Edge case** | An unusual or extreme situation your code should handle |
| **Iterate** | Improve your work by testing, finding problems, and fixing them |

---

## What's Next

You just built a real application! In Skill-09, you'll learn how to use AI
as a coding assistant — asking it good questions and learning from its answers.
