# CONTRIBUTING.md — Contributing to EduStack

> **Thank you for wanting to improve coding education for students.**
> Please read this entire document before contributing. Safety requirements are non-negotiable.

---

## The Golden Rule

**Every contribution must be appropriate for a 11-year-old student to see, use, and learn from
on a school computer with a teacher and parent watching.**

If you're not sure whether something meets this bar, it doesn't. Ask first.

---

## What We Need Help With

### High Priority
- **New lessons and skills** — Expanding the curriculum
- **Accessibility improvements** — Better screen reader support, keyboard navigation
- **Content filter improvements** — Better evasion detection, fewer false positives
- **Teacher guides** — Clearer instructions, better common-question answers
- **Translations** (for future versions) — WITH matching safety/filter systems

### Always Welcome
- Typo fixes
- Clearer explanations in existing skills
- Better code comments in examples
- Bug fixes in scripts

### Not Accepting (for now)
- External dependencies (npm packages, CDNs, etc.)
- Features that require internet access during lessons
- User account or login systems
- Real-time collaboration features
- Features requiring admin privileges to install

---

## Safety Requirements for All Contributions

### Content Must NOT Contain
- [ ] External URLs or hyperlinks (all content is self-contained)
- [ ] References to specific real people, celebrities, or public figures
- [ ] Brand names beyond development tools (VS Code, Chrome, etc.)
- [ ] Political, religious, or controversial content
- [ ] Violence, weapons, or conflict of any kind
- [ ] Drug, alcohol, or substance references
- [ ] Sexual or romantic content of any kind
- [ ] Profanity or crude language (including in code comments and variable names)
- [ ] Personally identifiable information (real names, emails, addresses)
- [ ] Images that haven't been approved (see Image Policy below)
- [ ] Code that makes network requests
- [ ] Code that accesses the filesystem outside the project
- [ ] Code that uses `eval()`, `innerHTML` with user input, or `document.write()`

### Code Must
- [ ] Work without internet access (after initial clone)
- [ ] Work without installation (no npm, no pip, no build step)
- [ ] Work in all major browsers (Chrome, Firefox, Edge, Safari)
- [ ] Include comments explaining every significant line
- [ ] Use descriptive variable names (not single letters except loop counters)
- [ ] Pass the automated safety check

### Image Policy
- All images must be created specifically for EduStack (no stock photos)
- Images must be reviewed and approved by a maintainer
- No photographs of real people
- No copyrighted characters or logos
- Images should be simple diagrams, screenshots of code, or abstract illustrations
- Maximum file size: 200KB (keeps clone fast on slow school networks)

---

## How to Contribute

### For Small Changes (typos, clarifications)
1. Fork the repository
2. Make your change
3. Submit a pull request with a clear description

### For New Content (lessons, skills, guides)
1. **Open an issue first** describing what you want to add
2. Wait for maintainer feedback (we may have suggestions or concerns)
3. Fork the repository
4. Follow the skill format in [ARCHITECTURE.md](ARCHITECTURE.md)
5. Run the safety check locally: `./scripts/safety-check.sh`
6. Submit a pull request
7. Be prepared for a thorough safety review

### Pull Request Checklist
- [ ] I have read CONTRIBUTING.md (this file)
- [ ] My changes contain no external URLs
- [ ] My changes contain no personally identifiable information
- [ ] My changes contain no age-inappropriate content
- [ ] I have run `./scripts/safety-check.sh` and it passes
- [ ] My commit messages are professional and descriptive
- [ ] If I added images, they are original and under 200KB

---

## Review Process

Every PR goes through:

1. **Automated safety check** — Must pass before any human review
2. **Content review** — A maintainer reads every word for appropriateness
3. **Technical review** — Code quality, browser compatibility, accessibility
4. **Education review** — Is this actually good pedagogy? Clear explanations? Appropriate difficulty?

This process takes time. Thank you for your patience. We'd rather be thorough than fast.

---

## Code Style

### HTML
```html
<!-- Use semantic HTML elements -->
<header>
  <h1>My Page Title</h1>
</header>

<main>
  <!-- Clear comments explaining what sections do -->
  <section>
    <p>Use paragraphs for text, not divs.</p>
  </section>
</main>
```

### CSS
```css
/* Use descriptive class names */
.page-header {
  /* Group related properties */
  background-color: #3498db;
  color: white;
  
  /* Comment on non-obvious values */
  padding: 20px; /* Comfortable spacing for readability */
}
```

### JavaScript
```javascript
// Use descriptive variable names
let studentScore = 0;

// Comment every function
// This function adds one point to the student's score
function addPoint() {
  studentScore = studentScore + 1;
  
  // Update the display
  document.getElementById("score-display").textContent = studentScore;
}
```

### Markdown (Skills and Guides)
- Use ATX headers (`#`, `##`, `###`)
- Use fenced code blocks with language tags
- Keep lines under 100 characters when practical
- Use blank lines between sections

---

## Commit Messages

**Good:**
```
Add CSS colors explanation to Skill-02

Added a step explaining how hex colors work with a visual example.
Includes both hex (#ff0000) and named colors (red) for clarity.
```

**Bad:**
```
update stuff
fix lol
```

---

## Questions?

Open an issue with the `question` label. We're happy to help you contribute.

---

*Thank you for helping make coding education accessible, safe, and fun for students.*
