# EXPLORE: Color Picker — Build Your Own Design Tool

## Overview
Want to go beyond the basics? In this explore activity, you'll build a fully working
color picker tool using HTML, CSS, and JavaScript. You can use it to pick colors for
your own projects!

## Level
Advanced — You should be comfortable with Skills 01-05 before trying this.

## What You'll Build
A tool with three sliders (Red, Green, Blue) that lets you mix any color.
The background changes in real time as you move the sliders.
The hex code displays so you can copy it into your CSS.

---

## The Code

### HTML

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Color Picker</title>
    <style>
      body {
        font-family: Georgia, serif;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        transition: background-color 0.3s ease;
      }
      
      .picker-card {
        background-color: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        text-align: center;
        min-width: 300px;
      }
      
      h1 {
        margin-top: 0;
        color: #2d3748;
      }
      
      .slider-group {
        margin: 15px 0;
        text-align: left;
      }
      
      .slider-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #4a5568;
      }
      
      input[type="range"] {
        width: 100%;
        height: 8px;
        border-radius: 4px;
        outline: none;
      }
      
      .color-display {
        font-size: 28px;
        font-weight: bold;
        padding: 15px;
        margin: 20px 0;
        border-radius: 8px;
        border: 2px solid #e2e8f0;
        cursor: pointer;
        transition: all 0.2s ease;
      }
      
      .color-display:hover {
        transform: scale(1.02);
      }
      
      .hint {
        color: #a0aec0;
        font-size: 14px;
      }
    </style>
  </head>
  <body>
    <div class="picker-card">
      <h1>Color Picker</h1>
      
      <div class="slider-group">
        <label>Red: <span id="red-value">128</span></label>
        <input type="range" id="red" min="0" max="255" value="128">
      </div>
      
      <div class="slider-group">
        <label>Green: <span id="green-value">128</span></label>
        <input type="range" id="green" min="0" max="255" value="128">
      </div>
      
      <div class="slider-group">
        <label>Blue: <span id="blue-value">128</span></label>
        <input type="range" id="blue" min="0" max="255" value="128">
      </div>
      
      <div class="color-display" id="hex-display">#808080</div>
      <p class="hint">Click the hex code to copy it!</p>
    </div>
    
    <script>
      // Find all our elements
      let redSlider = document.getElementById("red");
      let greenSlider = document.getElementById("green");
      let blueSlider = document.getElementById("blue");
      let redValue = document.getElementById("red-value");
      let greenValue = document.getElementById("green-value");
      let blueValue = document.getElementById("blue-value");
      let hexDisplay = document.getElementById("hex-display");
      
      // Convert a number (0-255) to a two-digit hex string
      function toHex(number) {
        let hex = Number(number).toString(16);  // Convert to hex
        if (hex.length === 1) {
          hex = "0" + hex;  // Add leading zero if needed
        }
        return hex;
      }
      
      // Update the color display
      function updateColor() {
        let r = redSlider.value;
        let g = greenSlider.value;
        let b = blueSlider.value;
        
        // Update the number displays
        redValue.textContent = r;
        greenValue.textContent = g;
        blueValue.textContent = b;
        
        // Build the hex color code
        let hexColor = "#" + toHex(r) + toHex(g) + toHex(b);
        
        // Update the display
        hexDisplay.textContent = hexColor;
        hexDisplay.style.backgroundColor = hexColor;
        
        // Make text readable (light text on dark colors, dark on light)
        let brightness = (Number(r) + Number(g) + Number(b)) / 3;
        if (brightness < 128) {
          hexDisplay.style.color = "white";
        } else {
          hexDisplay.style.color = "#2d3748";
        }
        
        // Update page background
        document.body.style.backgroundColor = hexColor;
      }
      
      // Listen for slider changes
      redSlider.addEventListener("input", updateColor);
      greenSlider.addEventListener("input", updateColor);
      blueSlider.addEventListener("input", updateColor);
      
      // Copy hex code when clicked
      hexDisplay.addEventListener("click", function() {
        // Create a temporary text area to copy from
        let temp = document.createElement("textarea");
        temp.value = hexDisplay.textContent;
        document.body.appendChild(temp);
        temp.select();
        document.execCommand("copy");
        document.body.removeChild(temp);
        
        // Show feedback
        let original = hexDisplay.textContent;
        hexDisplay.textContent = "Copied!";
        setTimeout(function() {
          hexDisplay.textContent = original;
        }, 1000);
      });
      
      // Set initial color
      updateColor();
    </script>
  </body>
</html>
```

---

## How It Works

1. Three sliders control Red, Green, and Blue values (0-255 each)
2. Every time a slider moves, the `updateColor` function runs
3. It converts the RGB values to a hex code (like `#3182ce`)
4. It updates the display and the page background
5. Clicking the hex code copies it to your clipboard

## Things to Try

- Make all three sliders go to 255 — what color do you get? (White!)
- Make all three go to 0 — what happens? (Black!)
- Red=255, Green=0, Blue=0 — pure red
- Can you find your school's colors?
- Try making a pastel palette (all values between 180-230)

## Extend It

Ideas for making this even better:
- Add a "Random Color" button
- Save favorite colors to a list
- Show the RGB values alongside the hex code
- Add a color name display (like "Tomato" or "Steel Blue")

---

*This explore activity is optional. It's for students who finish the main skills early
and want to build something more complex.*
