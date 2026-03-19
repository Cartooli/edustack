# SKILL-04: My First Site — Putting It All Together

## Overview
Time for your first real project! You'll combine everything from Skills 01–03 to build
a complete personal website with multiple sections, styled with CSS, and enhanced with
animations. This is YOUR site — make it something you're proud of.

## What You Need
- Everything you've learned in Skills 01–03
- A browser and text editor
- Your creativity!

## Key Idea
Real websites aren't built in one step. They're planned, structured, styled, and polished.
Today you go through the full process — just like a professional web developer.

---

## Steps

### Step 1: Plan Your Sections

Before writing any code, decide what sections your site will have.
Grab a piece of paper (yes, paper!) and sketch a rough layout.

**Every site needs:**
- A header (title and maybe a tagline)
- At least 2 content sections
- A footer

**Ideas for sections:**
- About Me (first name/nickname only — no personal details!)
- My Interests or Hobbies
- Things I'm Learning
- My Favorite [Books / Games / Music Genres / Sports]
- A Fun Fact section
- My Goals for This Year

**Try it:** Write down 3–4 sections you want on your site.

**Check:** You should have a rough plan before touching any code.

---

### Step 2: Build the HTML Structure

Start with a clean file. Build the skeleton first, then fill it in:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My Personal Site</title>
    <style>
      /* Styles will go here in Step 3 */
    </style>
  </head>
  <body>
    <div class="page">
      
      <!-- HEADER -->
      <header class="site-header">
        <h1>Welcome!</h1>
        <p class="tagline">A site by [Your Nickname]</p>
      </header>
      
      <!-- SECTION 1 -->
      <section class="card">
        <h2>About Me</h2>
        <p>I'm a student learning to build websites. 
           I like solving problems and creating things.</p>
      </section>
      
      <!-- SECTION 2 -->
      <section class="card">
        <h2>My Interests</h2>
        <ul>
          <li>Coding and web development</li>
          <li>Science experiments</li>
          <li>Drawing and design</li>
        </ul>
      </section>
      
      <!-- SECTION 3: Add your own! -->
      <section class="card">
        <h2>What I'm Learning</h2>
        <p>Right now I'm learning <strong>HTML</strong>, <strong>CSS</strong>, 
           and <strong>JavaScript</strong>. Next I want to learn how to make 
           interactive apps!</p>
      </section>
      
      <!-- FOOTER -->
      <footer class="site-footer">
        <p>Built with HTML and CSS — EduStack 2026</p>
      </footer>
      
    </div>
  </body>
</html>
```

**Try it:** Build your HTML structure with your planned sections.

**Check:** Open in the browser. It should show all your content (unstyled).

---

### Step 3: Add Your Styles

Now make it beautiful. Here's a complete stylesheet to start with — customize the colors!

```css
/* Page setup */
body {
  margin: 0;
  padding: 20px;
  background-color: #edf2f7;
  font-family: Georgia, serif;
  line-height: 1.7;
  color: #2d3748;
}

.page {
  max-width: 750px;
  margin: 0 auto;
}

/* Header */
.site-header {
  text-align: center;
  padding: 40px 30px;
  background: linear-gradient(135deg, #2b6cb0, #4299e1);
  color: white;
  border-radius: 12px;
  margin-bottom: 20px;
  animation: fadeIn 0.8s ease;
}

.site-header h1 {
  margin: 0;
  font-size: 36px;
}

.tagline {
  margin: 8px 0 0;
  font-size: 18px;
  opacity: 0.9;
}

/* Content cards */
.card {
  background-color: white;
  padding: 25px 30px;
  border-radius: 10px;
  margin-bottom: 16px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  animation: slideUp 0.5s ease both;
}

.card:nth-child(2) { animation-delay: 0.1s; }
.card:nth-child(3) { animation-delay: 0.2s; }
.card:nth-child(4) { animation-delay: 0.3s; }

.card:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
}

.card h2 {
  color: #2b6cb0;
  margin-top: 0;
  border-bottom: 2px solid #ebf8ff;
  padding-bottom: 8px;
}

/* List styling */
ul {
  list-style: none;
  padding: 0;
}

li {
  padding: 10px 16px;
  margin: 6px 0;
  background-color: #ebf8ff;
  border-radius: 6px;
  border-left: 4px solid #3182ce;
  transition: all 0.2s ease;
}

li:hover {
  background-color: #bee3f8;
  transform: translateX(4px);
}

/* Footer */
.site-footer {
  text-align: center;
  padding: 20px;
  color: #a0aec0;
  font-size: 14px;
}

/* Animations */
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-15px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes slideUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
```

**Try it:** Add these styles. Then customize: change colors, fonts, spacing.

**Check:** Your site should look polished and professional.

---

### Step 4: Make It Yours

This is the most important step. Change things! Try things! Break things and fix them!

**Ideas:**
- Change the gradient colors in the header
- Add more sections
- Try a different font
- Change the card hover effect
- Add a fun emoji to your heading (type it directly: 🎨 🚀 💡)
- Create a "skills progress" section with colored bars

**The goal:** When you're done, this should look like YOUR site, not the template.

---

## Challenge

Add a "dark mode" toggle using only CSS (no JavaScript needed yet!):

```html
<!-- Add at the top of your page div -->
<input type="checkbox" id="dark-toggle" class="dark-toggle">
<label for="dark-toggle" class="dark-label">Toggle Dark Mode</label>
```

```css
.dark-toggle {
  display: none; /* Hide the actual checkbox */
}

.dark-label {
  cursor: pointer;
  padding: 8px 16px;
  background-color: #2d3748;
  color: white;
  border-radius: 20px;
  font-size: 14px;
  position: fixed;
  top: 10px;
  right: 10px;
}

/* When the hidden checkbox is checked, change everything that comes after it */
.dark-toggle:checked ~ .page {
  /* Apply dark mode styles */
}

.dark-toggle:checked ~ .page .card {
  background-color: #2d3748;
  color: #e2e8f0;
}

.dark-toggle:checked ~ .page .card h2 {
  color: #63b3ed;
}
```

This uses the CSS `:checked` pseudo-class and the `~` sibling selector — fancy!

---

## Key Words

| Word | What It Means |
|---|---|
| **Header** | The top section of a page, usually with a title |
| **Section** | A thematic grouping of content |
| **Footer** | The bottom section of a page |
| **Gradient** | A smooth blend between two or more colors |
| **Layout** | How elements are arranged on the page |

---

## What's Next

Your first complete website is done! In Skill-05, you add **JavaScript** — the language
that makes things actually DO stuff when you click, type, or interact.
