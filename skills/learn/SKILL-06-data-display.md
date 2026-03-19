# SKILL-06: Data Display — Building a Dashboard

## Overview
Real apps show data: scores, weather, schedules, stats. Today you'll learn to
display data using JavaScript objects and arrays, and build a mini dashboard
that updates dynamically.

## What You Need
- Comfort with Skills 01–05
- A browser and text editor

## Key Idea
Data in JavaScript is organized into **arrays** (lists of items) and **objects**
(collections of related information). Learning to work with data is what separates
a web page from a web application.

---

## Steps

### Step 1: Arrays — Lists of Things

An array holds multiple values in order:

```javascript
// An array of subjects
let subjects = ["Math", "Science", "English", "Art", "Web Dev"];

// Access items by their position (starts at 0, not 1!)
console.log(subjects[0]);  // "Math"
console.log(subjects[4]);  // "Web Dev"

// How many items?
console.log(subjects.length);  // 5

// Add an item
subjects.push("Music");
console.log(subjects.length);  // Now 6
```

**Key concept:** Positions start at 0, not 1. This is true in almost every
programming language.

**Try it:** Create an array of your favorite things. Print the first and last items.

---

### Step 2: Objects — Groups of Information

An object holds related data together:

```javascript
// An object representing a class
let mathClass = {
  name: "Math",
  teacher: "Room 204",
  period: 1,
  grade: "A-",
  favorite: true
};

// Access properties with a dot
console.log(mathClass.name);     // "Math"
console.log(mathClass.period);   // 1
console.log(mathClass.favorite); // true
```

**Try it:** Create an object for one of your classes (use room numbers, not teacher names).

---

### Step 3: Display Data on the Page

Let's turn data into visible HTML:

```html
<div id="schedule-container"></div>
```

```javascript
// Array of class objects
let schedule = [
  { name: "Math", room: "204", period: 1 },
  { name: "Science", room: "112", period: 2 },
  { name: "English", room: "308", period: 3 },
  { name: "Web Dev", room: "Lab A", period: 4 }
];

let container = document.getElementById("schedule-container");

// Loop through each class and create HTML
let html = "<h2>My Schedule</h2>";

for (let i = 0; i < schedule.length; i++) {
  let classInfo = schedule[i];
  html = html + '<div class="schedule-item">';
  html = html + '<strong>Period ' + classInfo.period + ':</strong> ';
  html = html + classInfo.name + ' (Room ' + classInfo.room + ')';
  html = html + '</div>';
}

container.innerHTML = html;
```

**Important safety note:** We're using `innerHTML` here because the data comes from
our own code, not from user input. NEVER use `innerHTML` with text a user typed —
that's a security risk.

**Try it:** Create your own schedule data and display it.

---

### Step 4: Build a Stats Dashboard

Now let's build something that looks like a real dashboard:

```html
<div class="dashboard">
  <h1>My Learning Dashboard</h1>
  <div class="stats-row" id="stats-row"></div>
  <div class="progress-section" id="progress-section"></div>
</div>
```

```javascript
// Stats data
let stats = [
  { label: "Skills Completed", value: 6, icon: "✅" },
  { label: "Lines of Code", value: 247, icon: "💻" },
  { label: "Days Coding", value: 12, icon: "📅" },
  { label: "Projects Built", value: 3, icon: "🏗️" }
];

// Build stat cards
let statsRow = document.getElementById("stats-row");
let statsHTML = "";

for (let i = 0; i < stats.length; i++) {
  let stat = stats[i];
  statsHTML = statsHTML + '<div class="stat-card">';
  statsHTML = statsHTML + '<div class="stat-icon">' + stat.icon + '</div>';
  statsHTML = statsHTML + '<div class="stat-value">' + stat.value + '</div>';
  statsHTML = statsHTML + '<div class="stat-label">' + stat.label + '</div>';
  statsHTML = statsHTML + '</div>';
}

statsRow.innerHTML = statsHTML;

// Progress bars
let skills = [
  { name: "HTML", progress: 90 },
  { name: "CSS", progress: 75 },
  { name: "JavaScript", progress: 40 },
  { name: "AI Literacy", progress: 10 }
];

let progressSection = document.getElementById("progress-section");
let progressHTML = "<h2>Skill Progress</h2>";

for (let i = 0; i < skills.length; i++) {
  let skill = skills[i];
  progressHTML = progressHTML + '<div class="progress-item">';
  progressHTML = progressHTML + '<div class="progress-label">';
  progressHTML = progressHTML + skill.name + ' — ' + skill.progress + '%';
  progressHTML = progressHTML + '</div>';
  progressHTML = progressHTML + '<div class="progress-bar">';
  progressHTML = progressHTML + '<div class="progress-fill" style="width: ' + skill.progress + '%"></div>';
  progressHTML = progressHTML + '</div>';
  progressHTML = progressHTML + '</div>';
}

progressSection.innerHTML = progressHTML;
```

And the CSS to make it look great:

```css
.dashboard {
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
  font-family: Georgia, serif;
}

.stats-row {
  display: flex;
  gap: 12px;
  margin-bottom: 30px;
}

.stat-card {
  flex: 1;
  background: white;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
  box-shadow: 0 2px 8px rgba(0,0,0,0.08);
  transition: transform 0.2s ease;
}

.stat-card:hover { transform: translateY(-3px); }
.stat-icon { font-size: 28px; margin-bottom: 8px; }
.stat-value { font-size: 32px; font-weight: bold; color: #2b6cb0; }
.stat-label { font-size: 13px; color: #718096; margin-top: 4px; }

.progress-item { margin-bottom: 16px; }
.progress-label { margin-bottom: 4px; font-weight: bold; color: #4a5568; }

.progress-bar {
  background-color: #e2e8f0;
  border-radius: 8px;
  height: 20px;
  overflow: hidden;
}

.progress-fill {
  background: linear-gradient(90deg, #3182ce, #63b3ed);
  height: 100%;
  border-radius: 8px;
  transition: width 0.5s ease;
}
```

**Try it:** Build the dashboard with your own data.

**Check:** You should see stat cards and animated progress bars.

---

## Challenge

Add a "Update Stats" button that simulates progress by increasing values:

```javascript
let updateButton = document.getElementById("update-button");
updateButton.addEventListener("click", function() {
  // Increase a random stat
  let randomIndex = Math.floor(Math.random() * stats.length);
  stats[randomIndex].value = stats[randomIndex].value + 1;
  
  // Rebuild the display (reuse the code from above)
  // ... rebuild statsHTML and set statsRow.innerHTML
});
```

---

## Key Words

| Word | What It Means |
|---|---|
| **Array** | An ordered list of values: `["a", "b", "c"]` |
| **Object** | A collection of named values: `{ name: "Math", grade: "A" }` |
| **Loop** | Code that repeats for each item in an array |
| **Dashboard** | A page that displays data visually |
| **Index** | The position of an item in an array (starts at 0) |

---

## What's Next

In Skill-07, you'll learn about forms and user input — how to safely collect
information from users and respond to it.
