# SKILL-05: Click and React — Your First JavaScript

## Overview
HTML puts things on the page. CSS makes them look good. JavaScript makes them DO things.
Today you'll make buttons that respond to clicks, text that changes, and a page that
reacts to what users do.

## What You Need
- Your project files from previous skills
- A browser and text editor

## Key Idea
JavaScript is the programming language of the web. Every interactive website you've ever
used — every button, every dropdown, every game — uses JavaScript. Today you start learning it.

---

## Steps

### Step 1: Your First Script

Add a `<script>` tag at the bottom of your body, right before `</body>`:

```html
<body>
  <!-- Your HTML content -->
  
  <script>
    // JavaScript goes here!
    // These double slashes are comments — the computer ignores them
    
    // This line makes the browser show a message in its console
    console.log("JavaScript is running!");
  </script>
</body>
```

**How to see the console:**
Press `F12` on your keyboard (or right-click and choose "Inspect"), then click the
"Console" tab. You should see your message!

**Try it:** Add the script tag and check the console.

**Check:** "JavaScript is running!" should appear in the console.

---

### Step 2: Variables — Storing Information

Variables are like labeled boxes that hold information:

```javascript
// Creating variables with 'let'
let greeting = "Hello!";
let score = 0;
let isPlaying = true;

// Print them to the console
console.log(greeting);  // Shows: Hello!
console.log(score);     // Shows: 0
console.log(isPlaying); // Shows: true

// Change a variable's value
score = 10;
console.log(score);     // Now shows: 10
```

**Three types of data:**
- **Strings** — Text in quotes: `"Hello!"` or `'Hello!'`
- **Numbers** — No quotes: `42`, `3.14`, `0`
- **Booleans** — True or false: `true`, `false`

**Try it:** Create three variables in your script. Print them to the console.

---

### Step 3: Changing the Page with JavaScript

This is where it gets exciting. JavaScript can change what's on the page:

First, add an element with an `id`:
```html
<p id="message">Click the button to change this text!</p>
<button id="change-button">Change Text</button>
```

Then in your script:
```javascript
// Find the elements on the page
let messageElement = document.getElementById("message");
let buttonElement = document.getElementById("change-button");

// When the button is clicked, change the text
buttonElement.addEventListener("click", function() {
  messageElement.textContent = "You clicked it! JavaScript is amazing!";
});
```

**What's happening?**
- `document.getElementById("message")` — "Find the element with id='message'"
- `addEventListener("click", function() {...})` — "When this is clicked, do this..."
- `.textContent = "..."` — "Change the text inside this element"

**Try it:** Add the HTML and JavaScript. Click the button!

**Check:** The text should change when you click the button.

---

### Step 4: A Click Counter

Let's build something more interactive — a counter:

```html
<div class="counter">
  <h2>Click Counter</h2>
  <p>Count: <span id="count">0</span></p>
  <button id="add-button">Add One</button>
  <button id="reset-button">Reset</button>
</div>
```

```javascript
// Start count at 0
let count = 0;

// Find our elements
let countDisplay = document.getElementById("count");
let addButton = document.getElementById("add-button");
let resetButton = document.getElementById("reset-button");

// Add one when "Add One" is clicked
addButton.addEventListener("click", function() {
  count = count + 1;              // Add 1 to count
  countDisplay.textContent = count; // Update the display
});

// Reset to 0 when "Reset" is clicked
resetButton.addEventListener("click", function() {
  count = 0;                       // Set count back to 0
  countDisplay.textContent = count; // Update the display
});
```

**Try it:** Build the counter. Does the Add button work? Does Reset work?

**Check:** Clicking "Add One" should increase the number. "Reset" should set it to 0.

---

### Step 5: Changing Styles with JavaScript

JavaScript can also change how things look:

```javascript
addButton.addEventListener("click", function() {
  count = count + 1;
  countDisplay.textContent = count;
  
  // Change color based on the count
  if (count >= 10) {
    countDisplay.style.color = "#e53e3e";    // Red for 10+
    countDisplay.style.fontWeight = "bold";
  } else if (count >= 5) {
    countDisplay.style.color = "#dd6b20";    // Orange for 5-9
  } else {
    countDisplay.style.color = "#2b6cb0";    // Blue for 0-4
  }
});
```

**New concept: `if / else if / else`**
- `if (count >= 10)` — "If count is 10 or more..."
- `else if (count >= 5)` — "Otherwise, if count is 5 or more..."
- `else` — "Otherwise (for everything else)..."

**Try it:** Add the color-changing logic. Click until you see all three colors!

---

## Challenge

Add a "High Score" display that tracks the highest count reached:

```javascript
let highScore = 0;
let highScoreDisplay = document.getElementById("high-score");

addButton.addEventListener("click", function() {
  count = count + 1;
  countDisplay.textContent = count;
  
  // Check for new high score
  if (count > highScore) {
    highScore = count;
    highScoreDisplay.textContent = highScore;
  }
});
```

Don't forget to add `<p>High Score: <span id="high-score">0</span></p>` to your HTML!

---

## Key Words

| Word | What It Means |
|---|---|
| **JavaScript** | The programming language that makes web pages interactive |
| **Variable** | A named container that stores a value (like a labeled box) |
| **Function** | A reusable block of code that does something |
| **Event** | Something that happens (a click, a key press, a page load) |
| **Event Listener** | Code that waits for an event and responds to it |
| **Console** | A hidden area in the browser where you can see messages from your code |

---

## What's Next

You can make buttons work! In Skill-06, you'll learn to work with data — displaying
information, updating it, and building a mini dashboard.
