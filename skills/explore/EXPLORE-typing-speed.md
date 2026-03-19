# EXPLORE: Typing Speed Test — How Fast Can You Type?

## Overview
Want to go beyond the basics? In this explore activity, you'll build a typing speed
test that measures how fast you can type. It uses JavaScript timing, string comparison,
and event listeners — all skills from the main curriculum.

## Level
Intermediate — You should be comfortable with Skills 01-06 before trying this.

## What You'll Build
A typing test that:
- Shows a sentence to type
- Starts a timer when you press the first key
- Checks your typing in real time
- Calculates your words per minute (WPM) when you finish
- Shows correct and incorrect characters as you type

---

## The Code

### Complete Working Example

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Typing Speed Test</title>
    <style>
      /* Page setup */
      body {
        margin: 0;
        padding: 20px;
        background-color: #edf2f7;
        font-family: Georgia, serif;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }

      /* Main card */
      .test-card {
        background-color: white;
        padding: 40px;
        border-radius: 16px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        width: 100%;
        text-align: center;
      }

      h1 {
        color: #2b6cb0;
        margin-top: 0;
      }

      /* The sentence to type */
      .sentence-display {
        font-size: 22px;
        line-height: 1.8;
        padding: 20px;
        background-color: #f7fafc;
        border-radius: 10px;
        margin: 20px 0;
        text-align: left;
        min-height: 60px;
      }

      /* Individual characters in the sentence */
      .char {
        /* Each character gets its own span for coloring */
      }

      .char.correct {
        color: #38a169;
      }

      .char.incorrect {
        color: #e53e3e;
        text-decoration: underline;
      }

      .char.current {
        background-color: #bee3f8;
        border-radius: 2px;
      }

      /* The input area */
      .type-input {
        width: 100%;
        padding: 14px;
        font-size: 18px;
        font-family: Georgia, serif;
        border: 2px solid #e2e8f0;
        border-radius: 10px;
        box-sizing: border-box;
        margin: 16px 0;
        transition: border-color 0.2s ease;
      }

      .type-input:focus {
        outline: none;
        border-color: #3182ce;
      }

      /* Stats display */
      .stats {
        display: flex;
        justify-content: center;
        gap: 30px;
        margin: 20px 0;
      }

      .stat {
        text-align: center;
      }

      .stat-value {
        font-size: 36px;
        font-weight: bold;
        color: #2b6cb0;
      }

      .stat-label {
        font-size: 14px;
        color: #a0aec0;
      }

      /* Status message */
      .status {
        font-size: 16px;
        color: #718096;
        margin: 10px 0;
      }

      /* Buttons */
      .restart-btn {
        padding: 12px 28px;
        font-size: 16px;
        font-family: Georgia, serif;
        background-color: #3182ce;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.2s ease, transform 0.15s ease;
        margin-top: 10px;
      }

      .restart-btn:hover {
        background-color: #2b6cb0;
        transform: translateY(-2px);
      }

      /* Animation */
      @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
      }

      .test-card {
        animation: fadeIn 0.5s ease;
      }
    </style>
  </head>
  <body>
    <div class="test-card">
      <h1>Typing Speed Test</h1>

      <div class="status" id="status">Type the sentence below as fast as you can!</div>

      <!-- The sentence to type (characters will be individually wrapped) -->
      <div class="sentence-display" id="sentence-display"></div>

      <!-- Where the user types -->
      <input
        type="text"
        class="type-input"
        id="type-input"
        placeholder="Start typing here..."
        autocomplete="off"
        autocorrect="off"
        autocapitalize="off"
        spellcheck="false"
      >

      <!-- Stats -->
      <div class="stats">
        <div class="stat">
          <div class="stat-value" id="wpm-display">0</div>
          <div class="stat-label">WPM</div>
        </div>
        <div class="stat">
          <div class="stat-value" id="time-display">0</div>
          <div class="stat-label">Seconds</div>
        </div>
      </div>

      <button class="restart-btn" id="restart-btn">New Sentence</button>
    </div>

    <script>
      // ==============================================
      // TYPING SPEED TEST — JavaScript
      // ==============================================

      // --- SENTENCES TO TYPE ---
      // A collection of sentences for the test.
      // Each one is about web development to keep learning going!
      let sentences = [
        "The best way to learn coding is to build real projects.",
        "Every website starts with a simple HTML file.",
        "CSS makes your web pages look amazing and professional.",
        "JavaScript adds interactivity to your web pages.",
        "Practice makes progress when learning to code.",
        "A good developer writes code that is easy to read.",
        "Start simple and add features one at a time.",
        "Debugging is the art of finding and fixing mistakes."
      ];

      // --- VARIABLES ---
      let currentSentence = "";  // The sentence to type
      let startTime = null;      // When the user started typing
      let timerRunning = false;  // Is the timer going?
      let finished = false;      // Has the user finished?

      // --- FIND ELEMENTS ---
      let sentenceDisplay = document.getElementById("sentence-display");
      let typeInput = document.getElementById("type-input");
      let wpmDisplay = document.getElementById("wpm-display");
      let timeDisplay = document.getElementById("time-display");
      let statusEl = document.getElementById("status");
      let restartBtn = document.getElementById("restart-btn");

      // --- PICK A RANDOM SENTENCE ---
      function getRandomSentence() {
        let index = Math.floor(Math.random() * sentences.length);
        return sentences[index];
      }

      // --- DISPLAY THE SENTENCE WITH CHARACTER SPANS ---
      function displaySentence(sentence) {
        // Clear the display
        sentenceDisplay.textContent = "";

        // Wrap each character in a span so we can color them
        for (let i = 0; i < sentence.length; i++) {
          let charSpan = document.createElement("span");
          charSpan.className = "char";
          charSpan.textContent = sentence[i];
          sentenceDisplay.appendChild(charSpan);
        }

        // Highlight the first character
        let chars = sentenceDisplay.querySelectorAll(".char");
        if (chars.length > 0) {
          chars[0].classList.add("current");
        }
      }

      // --- START A NEW TEST ---
      function startNewTest() {
        // Pick a random sentence
        currentSentence = getRandomSentence();
        displaySentence(currentSentence);

        // Reset everything
        typeInput.value = "";
        typeInput.disabled = false;
        typeInput.focus();
        startTime = null;
        timerRunning = false;
        finished = false;
        wpmDisplay.textContent = "0";
        timeDisplay.textContent = "0";
        statusEl.textContent = "Type the sentence below as fast as you can!";
      }

      // --- CHECK TYPING ---
      function checkTyping() {
        let typed = typeInput.value;
        let chars = sentenceDisplay.querySelectorAll(".char");

        // Start the timer on the first keypress
        if (!timerRunning && typed.length > 0) {
          startTime = new Date();
          timerRunning = true;
        }

        // Compare each typed character to the sentence
        for (let i = 0; i < chars.length; i++) {
          // Remove all classes first
          chars[i].className = "char";

          if (i < typed.length) {
            // Character has been typed
            if (typed[i] === currentSentence[i]) {
              chars[i].classList.add("correct");
            } else {
              chars[i].classList.add("incorrect");
            }
          } else if (i === typed.length) {
            // This is the next character to type
            chars[i].classList.add("current");
          }
        }

        // Update the timer display
        if (timerRunning && !finished) {
          let elapsed = (new Date() - startTime) / 1000;
          timeDisplay.textContent = Math.round(elapsed);
        }

        // Check if the user finished the sentence
        if (typed.length === currentSentence.length) {
          finished = true;
          timerRunning = false;

          // Calculate time and WPM
          let totalSeconds = (new Date() - startTime) / 1000;
          let totalMinutes = totalSeconds / 60;
          // WPM = (number of characters / 5) / minutes
          // Dividing by 5 converts characters to "words"
          let wordsTyped = currentSentence.length / 5;
          let wpm = Math.round(wordsTyped / totalMinutes);

          // Check accuracy
          let correctChars = 0;
          for (let i = 0; i < typed.length; i++) {
            if (typed[i] === currentSentence[i]) {
              correctChars = correctChars + 1;
            }
          }
          let accuracy = Math.round((correctChars / currentSentence.length) * 100);

          // Display results
          wpmDisplay.textContent = wpm;
          timeDisplay.textContent = totalSeconds.toFixed(1);
          statusEl.textContent = "Done! " + wpm + " WPM with " + accuracy + "% accuracy!";
          typeInput.disabled = true;
        }
      }

      // --- EVENT LISTENERS ---

      // Check typing on every keystroke
      typeInput.addEventListener("input", checkTyping);

      // Restart button
      restartBtn.addEventListener("click", startNewTest);

      // --- START ---
      startNewTest();
    </script>
  </body>
</html>
```

---

## How It Works

1. A random sentence is displayed, with each character wrapped in its own `<span>`
2. When you start typing, the timer begins automatically
3. Each character you type is compared to the original — green for correct, red for wrong
4. When you finish the sentence, your Words Per Minute (WPM) is calculated
5. WPM formula: (total characters / 5) / minutes elapsed

## Things to Try

- Try to beat 30 WPM — that's a good typing speed for a beginner
- Watch the colors as you type — can you get all green?
- Try again with a different sentence — click "New Sentence"
- What's your best accuracy percentage?

## Extend It

Ideas for making this even better:
- Add more sentences to the array
- Track your best WPM across multiple rounds
- Add a countdown timer mode (how much can you type in 60 seconds?)
- Show a typing accuracy chart at the end

---

*This explore activity is optional. It's for students who finish the main skills early
and want to build something more complex.*
