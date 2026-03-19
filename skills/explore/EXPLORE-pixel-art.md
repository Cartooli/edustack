# EXPLORE: Pixel Art — Build Your Own Drawing Tool

## Overview
Want to go beyond the basics? In this explore activity, you'll build a pixel art
editor with a 16x16 grid. Click cells to paint them, pick colors, and create
pixel art right in your browser. Uses CSS Grid, JavaScript click events, and
style manipulation.

## Level
Intermediate — You should be comfortable with Skills 01-06 before trying this.

## What You'll Build
A pixel art editor with:
- A 16x16 grid of clickable cells
- A color picker to choose your paint color
- A "Clear" button to start over
- Click-and-drag painting

---

## The Code

### Complete Working Example

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Pixel Art Editor</title>
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
      .editor-card {
        background-color: white;
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        text-align: center;
        animation: fadeIn 0.5s ease;
      }

      h1 {
        color: #2b6cb0;
        margin-top: 0;
      }

      /* The pixel grid */
      .grid {
        display: grid;
        /* 16 columns, each 24px wide */
        grid-template-columns: repeat(16, 24px);
        /* 16 rows, each 24px tall */
        grid-template-rows: repeat(16, 24px);
        gap: 1px;
        background-color: #cbd5e0;
        border: 2px solid #cbd5e0;
        border-radius: 4px;
        margin: 20px auto;
        /* Make the grid fit its content */
        width: fit-content;
        /* Prevent text selection while painting */
        user-select: none;
      }

      /* Each pixel cell */
      .pixel {
        background-color: white;
        cursor: pointer;
        transition: background-color 0.05s ease;
      }

      .pixel:hover {
        opacity: 0.8;
      }

      /* Toolbar */
      .toolbar {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 16px;
        margin: 16px 0;
        flex-wrap: wrap;
      }

      .toolbar label {
        font-size: 16px;
        color: #4a5568;
        font-weight: bold;
      }

      /* Color picker input */
      .color-picker {
        width: 50px;
        height: 40px;
        border: 2px solid #e2e8f0;
        border-radius: 8px;
        cursor: pointer;
        padding: 2px;
      }

      /* Quick color swatches */
      .swatches {
        display: flex;
        gap: 6px;
      }

      .swatch {
        width: 30px;
        height: 30px;
        border-radius: 6px;
        border: 2px solid #e2e8f0;
        cursor: pointer;
        transition: transform 0.15s ease, border-color 0.15s ease;
      }

      .swatch:hover {
        transform: scale(1.15);
      }

      .swatch.active {
        border-color: #2b6cb0;
        transform: scale(1.1);
      }

      /* Buttons */
      .btn {
        padding: 10px 24px;
        font-size: 15px;
        font-family: Georgia, serif;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.2s ease, transform 0.15s ease;
      }

      .btn:hover {
        transform: translateY(-2px);
      }

      .btn-clear {
        background-color: #e2e8f0;
        color: #4a5568;
      }

      .btn-clear:hover {
        background-color: #cbd5e0;
      }

      .btn-eraser {
        background-color: #fff5f5;
        color: #e53e3e;
        border: 1px solid #fed7d7;
      }

      .btn-eraser:hover {
        background-color: #fed7d7;
      }

      .btn-eraser.active {
        background-color: #e53e3e;
        color: white;
      }

      /* Status */
      .status {
        font-size: 14px;
        color: #a0aec0;
        margin-top: 12px;
      }

      /* Animation */
      @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
      }
    </style>
  </head>
  <body>
    <div class="editor-card">
      <h1>Pixel Art Editor</h1>

      <!-- Toolbar -->
      <div class="toolbar">
        <label>Color:</label>
        <input type="color" class="color-picker" id="color-picker" value="#3182ce">

        <!-- Quick color swatches -->
        <div class="swatches" id="swatches">
          <!-- JavaScript fills these in -->
        </div>
      </div>

      <div class="toolbar">
        <button class="btn btn-eraser" id="eraser-btn">Eraser</button>
        <button class="btn btn-clear" id="clear-btn">Clear All</button>
      </div>

      <!-- The pixel grid -->
      <div class="grid" id="grid">
        <!-- JavaScript creates 256 pixel cells (16x16) -->
      </div>

      <div class="status" id="status">Click cells to paint. Click and drag to draw!</div>
    </div>

    <script>
      // ==============================================
      // PIXEL ART EDITOR — JavaScript
      // ==============================================

      // --- SETTINGS ---
      let gridSize = 16;  // 16x16 grid = 256 pixels

      // Quick color palette
      let paletteColors = [
        "#e53e3e",  // Red
        "#dd6b20",  // Orange
        "#d69e2e",  // Yellow
        "#38a169",  // Green
        "#3182ce",  // Blue
        "#805ad5",  // Purple
        "#2d3748",  // Dark gray
        "#ffffff"   // White (eraser effect)
      ];

      // --- VARIABLES ---
      let currentColor = "#3182ce";  // Start with blue
      let isMouseDown = false;       // Is the mouse button held down?
      let isErasing = false;         // Is eraser mode on?

      // --- FIND ELEMENTS ---
      let grid = document.getElementById("grid");
      let colorPicker = document.getElementById("color-picker");
      let swatchesDiv = document.getElementById("swatches");
      let eraserBtn = document.getElementById("eraser-btn");
      let clearBtn = document.getElementById("clear-btn");
      let statusEl = document.getElementById("status");

      // --- BUILD THE GRID ---
      // Create 256 pixel cells (16 rows x 16 columns)
      for (let i = 0; i < gridSize * gridSize; i++) {
        let pixel = document.createElement("div");
        pixel.className = "pixel";

        // Paint when clicking a pixel
        pixel.addEventListener("mousedown", function() {
          paintPixel(pixel);
        });

        // Paint when dragging over a pixel (mouse is held down)
        pixel.addEventListener("mouseenter", function() {
          if (isMouseDown) {
            paintPixel(pixel);
          }
        });

        grid.appendChild(pixel);
      }

      // --- BUILD THE SWATCH PALETTE ---
      for (let i = 0; i < paletteColors.length; i++) {
        let swatch = document.createElement("div");
        swatch.className = "swatch";
        swatch.style.backgroundColor = paletteColors[i];

        // When a swatch is clicked, select that color
        swatch.addEventListener("click", function() {
          currentColor = paletteColors[i];
          colorPicker.value = paletteColors[i];
          isErasing = false;
          eraserBtn.classList.remove("active");
          updateSwatchHighlight();
        });

        swatchesDiv.appendChild(swatch);
      }

      // --- PAINT A PIXEL ---
      function paintPixel(pixel) {
        if (isErasing) {
          // Eraser mode: set back to white
          pixel.style.backgroundColor = "white";
        } else {
          // Paint mode: set to current color
          pixel.style.backgroundColor = currentColor;
        }
      }

      // --- UPDATE SWATCH HIGHLIGHT ---
      function updateSwatchHighlight() {
        let allSwatches = swatchesDiv.querySelectorAll(".swatch");
        for (let i = 0; i < allSwatches.length; i++) {
          if (paletteColors[i] === currentColor && !isErasing) {
            allSwatches[i].classList.add("active");
          } else {
            allSwatches[i].classList.remove("active");
          }
        }
      }

      // --- EVENT LISTENERS ---

      // Track mouse button state for click-and-drag painting
      document.addEventListener("mousedown", function() {
        isMouseDown = true;
      });

      document.addEventListener("mouseup", function() {
        isMouseDown = false;
      });

      // Prevent default drag behavior on the grid
      grid.addEventListener("dragstart", function(event) {
        event.preventDefault();
      });

      // Color picker changes
      colorPicker.addEventListener("input", function() {
        currentColor = colorPicker.value;
        isErasing = false;
        eraserBtn.classList.remove("active");
        updateSwatchHighlight();
      });

      // Eraser button
      eraserBtn.addEventListener("click", function() {
        isErasing = !isErasing;  // Toggle eraser mode
        if (isErasing) {
          eraserBtn.classList.add("active");
          statusEl.textContent = "Eraser mode ON — click cells to erase";
        } else {
          eraserBtn.classList.remove("active");
          statusEl.textContent = "Click cells to paint. Click and drag to draw!";
        }
        updateSwatchHighlight();
      });

      // Clear button — reset all pixels to white
      clearBtn.addEventListener("click", function() {
        let allPixels = grid.querySelectorAll(".pixel");
        for (let i = 0; i < allPixels.length; i++) {
          allPixels[i].style.backgroundColor = "white";
        }
        statusEl.textContent = "Canvas cleared! Start a new masterpiece.";
      });

      // Set initial swatch highlight
      updateSwatchHighlight();
    </script>
  </body>
</html>
```

---

## How It Works

1. JavaScript creates a 16x16 grid using CSS Grid (256 cells total)
2. Each cell listens for mouse events (click and drag)
3. Clicking a cell sets its background color to the selected paint color
4. The color picker and swatch palette let you choose colors
5. Eraser mode sets cells back to white
6. Click-and-drag painting uses `mousedown`/`mouseup`/`mouseenter` events

## Things to Try

- Draw a smiley face using just 4-5 colors
- Try making a pattern (checkerboard, stripes, gradient)
- Draw a simple game character (like a pixel art hero)
- Use the eraser to refine your drawing
- Challenge: draw something recognizable using only 3 colors

## Extend It

Ideas for making this even better:
- Add a "Fill" tool that fills connected same-colored pixels
- Add grid size options (8x8, 16x16, 32x32)
- Add an "Undo" button that remembers the last change
- Show a mini preview of your art at a smaller scale

---

*This explore activity is optional. It's for students who finish the main skills early
and want to build something more complex.*
