# SKILL-01: Hello World — Your First Web Page

## Overview
Today you build your very first web page. By the end, you'll have a page that displays
your own message in a web browser. You're about to become a web developer!

## What You Need
- A text editor (VS Code, Notepad, TextEdit — anything that edits plain text)
- A web browser (Chrome, Firefox, Edge, Safari)

## Key Idea
Every web page is just a text file with special tags called **HTML**. Your browser reads
these tags and turns them into the pages you see every day.

---

## Steps

### Step 1: Create Your File

Open your text editor. Create a new file. Save it as `my-page.html` in your project folder.

**Important:** The file must end in `.html` — that's how your browser knows it's a web page.

**Try it:** Save an empty file called `my-page.html` right now.

**Check:** You should see a file called `my-page.html` in your folder.

---

### Step 2: Write Your First HTML

Type this into your file exactly as shown:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My First Page</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
    <p>I made this web page!</p>
  </body>
</html>
```

**What does each part do?**
- `<!DOCTYPE html>` — Tells the browser "this is a modern web page"
- `<html>` — The container for everything on the page
- `<head>` — Information ABOUT the page (like its title)
- `<title>` — The text that shows in the browser tab
- `<body>` — Everything you can SEE on the page
- `<h1>` — A big heading (h1 = heading level 1, the biggest)
- `<p>` — A paragraph of text

**Try it:** Type the code above into your file and save it.

**Check:** Your file should have exactly 10 lines of code.

---

### Step 3: Open It in a Browser

Find your `my-page.html` file in your file explorer. Double-click it.
It should open in your web browser.

**Try it:** Double-click `my-page.html` now.

**Check:** You should see:
- A big "Hello, World!" heading
- Below that: "I made this web page!"
- The browser tab should say "My First Page"

**Congratulations!** You just built a web page!

---

### Step 4: Make It Yours

Change the text to say something about you (just your first name or a nickname — no personal info).

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My Page</title>
  </head>
  <body>
    <h1>Welcome to My Page!</h1>
    <p>I am learning to build web pages.</p>
    <p>My favorite subject is science.</p>
    <p>Today I learned HTML!</p>
  </body>
</html>
```

**Try it:** Change the text to your own message. Save the file.
Refresh your browser (press F5 or Ctrl+R).

**Check:** Your new text should appear in the browser.

---

### Step 5: Add More Elements

HTML has lots of tags. Let's try a few more:

```html
<body>
  <h1>Welcome to My Page!</h1>
  
  <h2>Things I Like</h2>
  
  <ul>
    <li>Building things</li>
    <li>Solving puzzles</li>
    <li>Learning new stuff</li>
  </ul>
  
  <h2>What I Learned Today</h2>
  <p>I learned that web pages are made of <strong>HTML tags</strong>.</p>
  <p>Tags come in pairs: an <em>opening tag</em> and a <em>closing tag</em>.</p>
</body>
```

**New tags:**
- `<h2>` — A smaller heading (level 2)
- `<ul>` — An unordered list (bullets)
- `<li>` — A list item
- `<strong>` — Makes text **bold**
- `<em>` — Makes text *italic*

**Try it:** Add a list and some bold/italic text to your page.

**Check:** You should see bullet points and styled text.

---

## Challenge

Add a "My Schedule" section to your page using a table:

```html
<h2>My Schedule</h2>
<table>
  <tr>
    <th>Period</th>
    <th>Subject</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Math</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Science</td>
  </tr>
</table>
```

**New tags:** `<table>`, `<tr>` (table row), `<th>` (table header), `<td>` (table data)

---

## Key Words

| Word | What It Means |
|---|---|
| **HTML** | HyperText Markup Language — the language web pages are written in |
| **Tag** | A special word in angle brackets like `<h1>` that tells the browser what to display |
| **Element** | A tag plus its content: `<p>This is an element</p>` |
| **Browser** | The program that displays web pages (Chrome, Firefox, etc.) |

---

## What's Next

Your page works, but it looks pretty plain. In Skill-02, we'll add **colors, fonts,
and layout** with CSS — the language that makes web pages look amazing!
