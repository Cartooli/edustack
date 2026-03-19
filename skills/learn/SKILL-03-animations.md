# SKILL-03: Make It Move — CSS Animations

## Overview
Your page looks great standing still. Now let's add movement! You'll learn CSS
transitions and animations to make elements respond to mouse clicks and page loads.

## What You Need
- Your styled page from Skill-02
- A browser and text editor

## Key Idea
CSS can change properties over time instead of all at once. A button can smoothly
change color when you hover. A heading can fade in when the page loads. These small
movements make websites feel alive and professional.

---

## Steps

### Step 1: Your First Transition

Add this to any element's CSS:

```css
.container {
  /* Your existing styles... */
  transition: all 0.3s ease;
}

.container:hover {
  transform: scale(1.02);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}
```

**What's happening?**
- `transition: all 0.3s ease` — "When ANY property changes, take 0.3 seconds to change it smoothly"
- `:hover` — "When the mouse is over this element"
- `transform: scale(1.02)` — "Make it 2% bigger"
- The shadow gets stronger, making it look like it lifts off the page

**Try it:** Add a hover transition to your container. Save and refresh.

**Check:** When you move your mouse over the container, it should smoothly grow slightly.

---

### Step 2: Button Animation

Let's create a button that feels satisfying to click:

```html
<button class="cool-button">Click Me!</button>
```

```css
.cool-button {
  background-color: #3182ce;
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.2s ease;
}

.cool-button:hover {
  background-color: #2b6cb0;
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.cool-button:active {
  transform: translateY(0);
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}
```

**New concepts:**
- `:active` — Styles applied while the button is being clicked (pressed down)
- `translateY(-2px)` — Moves the button up 2 pixels (hover lifts it)
- `translateY(0)` — Snaps back down (click pushes it)

**Try it:** Add the button to your page and the CSS. It should feel like a real button.

---

### Step 3: Fade-In Animation

Make your heading fade in when the page loads:

```css
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

h1 {
  /* Your existing h1 styles... */
  animation: fadeIn 0.6s ease;
}
```

**What's happening?**
- `@keyframes fadeIn` — Defines a new animation called "fadeIn"
- `from` — Where the animation starts (invisible, slightly above)
- `to` — Where the animation ends (fully visible, in place)
- `animation: fadeIn 0.6s ease` — "Play the fadeIn animation over 0.6 seconds"

**Try it:** Add the keyframes and apply the animation to your h1. Refresh the page.

**Check:** Your heading should smoothly fade in from above when the page loads.

---

### Step 4: Staggered List Animation

Make list items appear one at a time:

```css
@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateX(-20px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

li {
  /* Your existing li styles... */
  animation: slideIn 0.4s ease;
  animation-fill-mode: both;
}

li:nth-child(1) { animation-delay: 0.1s; }
li:nth-child(2) { animation-delay: 0.2s; }
li:nth-child(3) { animation-delay: 0.3s; }
li:nth-child(4) { animation-delay: 0.4s; }
```

**What's new?**
- `animation-delay` — "Wait this long before starting"
- `nth-child(2)` — "The second item in the list"
- `animation-fill-mode: both` — "Stay invisible before the animation starts"

Each item slides in from the left, one after another!

**Try it:** Apply the staggered animation to your list items.

**Check:** Refresh the page. List items should slide in one at a time.

---

## Challenge

Create a "pulse" animation for your button that gently glows:

```css
@keyframes pulse {
  0% { box-shadow: 0 0 0 0 rgba(49, 130, 206, 0.4); }
  70% { box-shadow: 0 0 0 10px rgba(49, 130, 206, 0); }
  100% { box-shadow: 0 0 0 0 rgba(49, 130, 206, 0); }
}

.cool-button {
  animation: pulse 2s infinite;
}
```

This creates a ripple effect that repeats forever, drawing attention to the button.

---

## Key Words

| Word | What It Means |
|---|---|
| **Transition** | A smooth change between two states (like hover) |
| **Animation** | A defined sequence of style changes that plays automatically |
| **@keyframes** | Defines the steps of an animation |
| **Transform** | Changes position, size, or rotation without affecting layout |
| **Opacity** | How see-through an element is (0 = invisible, 1 = fully visible) |

---

## What's Next

You've got a page that looks great and moves! In Skill-04, you'll combine everything
into a full personal website project — your first complete site from scratch.
