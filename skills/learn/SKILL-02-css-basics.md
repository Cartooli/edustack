# SKILL-02: Style It Up — Making Pages Look Amazing with CSS

## Overview
Your web page works — but it looks like it's from 1995. Today you learn CSS, the language
that controls colors, fonts, spacing, and layout. By the end, your page will look like
something you'd actually want to show people.

## What You Need
- Your `my-page.html` file from Skill-01
- A text editor and browser

## Key Idea
HTML controls **what's on the page**. CSS controls **how it looks**. Think of HTML as the
building's structure (walls, floors, rooms) and CSS as the decoration (paint, furniture, lighting).

---

## Steps

### Step 1: Add a Style Section

Inside the `<head>` of your HTML file, add a `<style>` section:

```html
<head>
  <title>My Page</title>
  <style>
    /* CSS goes here! */
    /* Comments in CSS use these slash-star markers */
  </style>
</head>
```

**Try it:** Add the `<style>` tags to your `<head>` section. Save and refresh.

**Check:** Nothing should change yet — we haven't added any styles.

---

### Step 2: Change the Background Color

Inside your `<style>` tags, add:

```css
body {
  background-color: #f0f4f8;
  color: #2d3748;
  font-family: Georgia, serif;
}
```

**What does this mean?**
- `body { }` — "Apply these styles to the body element"
- `background-color: #f0f4f8` — A light blue-gray background
- `color: #2d3748` — Dark gray text (easier on the eyes than pure black)
- `font-family: Georgia` — A readable serif font

**Hex colors explained:**
`#f0f4f8` is a color code. The `#` means "this is a color." The 6 characters after it
are pairs of numbers: `f0` (red), `f4` (green), `f8` (blue). Higher numbers = more of that color.

**Try it:** Add the body styles. Save and refresh.

**Check:** Your page background should be a soft blue-gray.

---

### Step 3: Style Your Heading

```css
h1 {
  color: #2b6cb0;
  text-align: center;
  padding: 20px;
  border-bottom: 3px solid #bee3f8;
}
```

**New properties:**
- `text-align: center` — Centers the text
- `padding: 20px` — Adds 20 pixels of space inside the element
- `border-bottom` — Adds a line under the heading

**Try it:** Add the h1 styles. Save and refresh.

**Check:** Your heading should be blue, centered, with a light line underneath.

---

### Step 4: Make a Container

Right now your content goes edge to edge. Let's add a container to keep it centered and readable:

In your HTML, wrap your body content:
```html
<body>
  <div class="container">
    <!-- All your existing content goes here -->
  </div>
</body>
```

In your CSS:
```css
.container {
  max-width: 700px;
  margin: 0 auto;
  padding: 30px;
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}
```

**What's new here?**
- `.container` — The dot means "any element with class='container'"
- `max-width: 700px` — Content won't be wider than 700 pixels
- `margin: 0 auto` — Centers the container on the page
- `border-radius: 8px` — Rounds the corners
- `box-shadow` — Adds a subtle shadow (makes it look like a card)

**Try it:** Add the container div and CSS. Save and refresh.

**Check:** Your content should be in a white card, centered on the colored background.

---

### Step 5: Style Your List

```css
ul {
  list-style: none;
  padding: 0;
}

li {
  padding: 8px 16px;
  margin: 4px 0;
  background-color: #ebf8ff;
  border-radius: 4px;
  border-left: 4px solid #3182ce;
}
```

**Try it:** Add the list styles. Save and refresh.

**Check:** Your list items should be styled cards with a blue left border.

---

### Step 6: Try Different Color Schemes

Here are some color combinations that look great together. Try swapping them in:

**Ocean (cool and calm):**
```css
body { background-color: #e6f2ff; }
h1 { color: #1a5276; }
li { background-color: #d4e6f1; border-left-color: #2980b9; }
```

**Forest (natural and earthy):**
```css
body { background-color: #e8f5e9; }
h1 { color: #2e7d32; }
li { background-color: #c8e6c9; border-left-color: #43a047; }
```

**Sunset (warm and friendly):**
```css
body { background-color: #fff3e0; }
h1 { color: #e65100; }
li { background-color: #ffe0b2; border-left-color: #fb8c00; }
```

**Try it:** Pick a color scheme and apply it. Or mix and match to create your own!

---

## Challenge

Add hover effects to your list items so they change when you move your mouse over them:

```css
li:hover {
  background-color: #bee3f8;
  transform: translateX(4px);
  transition: all 0.2s ease;
}
```

Add `transition: all 0.2s ease;` to your regular `li` rule too — this makes
the change smooth instead of instant.

---

## Key Words

| Word | What It Means |
|---|---|
| **CSS** | Cascading Style Sheets — the language that controls how web pages look |
| **Property** | Something you can change, like `color` or `background-color` |
| **Value** | What you set a property to, like `blue` or `#2b6cb0` |
| **Selector** | What you're styling, like `h1` or `.container` |
| **Class** | A reusable name you give to elements, like `class="container"` |
| **Hex color** | A color code starting with `#` like `#ff0000` (red) |

---

## What's Next

Your page looks great standing still. In Skill-03, we'll make things **move** with
CSS animations and transitions!
