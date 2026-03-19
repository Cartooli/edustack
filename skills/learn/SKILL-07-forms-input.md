# SKILL-07: Forms and Input — Handling User Data Safely

## Overview
Most web apps need input from users — search boxes, feedback forms, sign-up pages.
Today you learn to build forms AND how to handle user input safely. This is one of
the most important skills in web development.

## What You Need
- Comfort with Skills 01–06
- A browser and text editor

## Key Idea
**Never trust user input.** This is the number one rule of web development.
Users might type something unexpected, paste weird characters, or (intentionally or not)
enter something that could break your page. Good developers always validate and clean
input before using it.

---

## Steps

### Step 1: Your First Form

```html
<div class="form-container">
  <h2>Feedback Form</h2>
  
  <label for="name-input">Your Nickname:</label>
  <input type="text" id="name-input" maxlength="30" placeholder="e.g., CodeNinja">
  
  <label for="message-input">Your Message:</label>
  <textarea id="message-input" maxlength="200" rows="4" 
    placeholder="What did you think of this lesson?"></textarea>
  
  <button id="submit-button">Submit</button>
  <div id="output"></div>
</div>
```

**Safety already built in:**
- `maxlength="30"` — Browser won't allow more than 30 characters
- `maxlength="200"` — Limits message length
- `placeholder` — Shows example text (disappears when typing)

**Try it:** Add this form to a page. It won't do anything yet — that's Step 2.

---

### Step 2: Read Input with JavaScript

```javascript
let nameInput = document.getElementById("name-input");
let messageInput = document.getElementById("message-input");
let submitButton = document.getElementById("submit-button");
let output = document.getElementById("output");

submitButton.addEventListener("click", function() {
  let name = nameInput.value;
  let message = messageInput.value;
  
  // For now, just display what they typed
  output.textContent = name + " says: " + message;
});
```

**Important:** We used `textContent`, NOT `innerHTML`. This is critical for safety.
`textContent` treats everything as plain text — even if someone types HTML tags,
they'll show as text, not execute as code.

**Try it:** Type something and click Submit. Your text should appear below.

---

### Step 3: Validate Input (the IMPORTANT part)

What if someone submits an empty form? Or types just spaces? Let's add validation:

```javascript
submitButton.addEventListener("click", function() {
  let name = nameInput.value.trim();    // .trim() removes spaces from edges
  let message = messageInput.value.trim();
  
  // Validation: check for problems BEFORE using the input
  
  // Is the name empty?
  if (name.length === 0) {
    output.textContent = "Please enter a nickname!";
    output.style.color = "#e53e3e";  // Red for errors
    return;  // Stop here — don't continue
  }
  
  // Is the name too short?
  if (name.length < 2) {
    output.textContent = "Nickname must be at least 2 characters.";
    output.style.color = "#e53e3e";
    return;
  }
  
  // Is the message empty?
  if (message.length === 0) {
    output.textContent = "Please write a message!";
    output.style.color = "#e53e3e";
    return;
  }
  
  // If we get here, everything is valid!
  output.textContent = name + " says: " + message;
  output.style.color = "#2f855a";  // Green for success
  
  // Clear the form
  nameInput.value = "";
  messageInput.value = "";
});
```

**The `return` keyword** stops the function right there. If the name is empty,
we show an error and stop — we never get to the part that displays the message.

**Try it:** Test your validation:
1. Click Submit with empty fields — should show an error
2. Type just "A" as a name — should say it's too short
3. Fill both fields properly — should work

---

### Step 4: Sanitize Input (defense in depth)

Even after validation, we clean the input. This is called **sanitization**:

```javascript
// Sanitize function — removes anything that could be dangerous
function sanitize(text) {
  // Replace HTML-special characters with safe versions
  let clean = text;
  clean = clean.replace(/&/g, "&amp;");
  clean = clean.replace(/</g, "&lt;");
  clean = clean.replace(/>/g, "&gt;");
  clean = clean.replace(/"/g, "&quot;");
  clean = clean.replace(/'/g, "&#x27;");
  return clean;
}

// Use it before displaying
submitButton.addEventListener("click", function() {
  let name = sanitize(nameInput.value.trim());
  let message = sanitize(messageInput.value.trim());
  
  // ... validation checks ...
  
  output.textContent = name + " says: " + message;
});
```

**Why do both `textContent` AND `sanitize()`?**
Because defense in depth! If you accidentally use `innerHTML` somewhere
(or a future developer does), the sanitized text is STILL safe.
Two layers are better than one.

**Try it:** Type `<b>bold</b>` as your name. Without sanitization, it might
render as **bold**. With sanitization, it shows the literal text `<b>bold</b>`.

---

### Step 5: Build a Feedback Display

Let's make a complete feedback system that shows submitted messages as cards:

```html
<div id="feedback-list"></div>
```

```javascript
let feedbackList = document.getElementById("feedback-list");
let feedbackItems = [];  // Array to store feedback

submitButton.addEventListener("click", function() {
  let name = sanitize(nameInput.value.trim());
  let message = sanitize(messageInput.value.trim());
  
  // Validation...
  if (name.length < 2 || message.length === 0) {
    output.textContent = "Please fill out both fields!";
    output.style.color = "#e53e3e";
    return;
  }
  
  // Add to our array
  feedbackItems.push({
    name: name,
    message: message,
    time: new Date().toLocaleTimeString()
  });
  
  // Rebuild the display
  let html = "";
  for (let i = 0; i < feedbackItems.length; i++) {
    let item = feedbackItems[i];
    // Using textContent equivalent via DOM creation would be safest,
    // but since we sanitized, this is safe too:
    html = html + '<div class="feedback-card">';
    html = html + '<strong>' + item.name + '</strong>';
    html = html + ' <span class="time">' + item.time + '</span>';
    html = html + '<p>' + item.message + '</p>';
    html = html + '</div>';
  }
  feedbackList.innerHTML = html;
  
  // Clear form and show success
  nameInput.value = "";
  messageInput.value = "";
  output.textContent = "Feedback submitted!";
  output.style.color = "#2f855a";
});
```

**Try it:** Submit several pieces of feedback. They should stack as cards.

---

## Challenge

Add a character counter that shows how many characters are left:

```javascript
messageInput.addEventListener("input", function() {
  let remaining = 200 - messageInput.value.length;
  let counter = document.getElementById("char-counter");
  counter.textContent = remaining + " characters remaining";
  
  if (remaining < 20) {
    counter.style.color = "#e53e3e";  // Red when almost full
  } else {
    counter.style.color = "#718096";  // Gray normally
  }
});
```

Add `<p id="char-counter">200 characters remaining</p>` to your HTML.

---

## Key Words

| Word | What It Means |
|---|---|
| **Form** | A section of a page that collects user input |
| **Validation** | Checking that input meets requirements before using it |
| **Sanitization** | Cleaning input to remove anything potentially dangerous |
| **XSS** | Cross-Site Scripting — an attack where someone injects code into a page |
| **Defense in depth** | Using multiple layers of protection, not just one |

---

## What's Next

In Skill-08, you'll combine everything into a complete Mini App — a calculator,
quiz, or tool that uses HTML, CSS, JavaScript, forms, data, and validation.
