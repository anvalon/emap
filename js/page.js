/* -----------------------------------------------------------------
 * FILE: page.js
 * PROJECT: Esperanto Morphological Analyzer
 * * DESCRIPTION:
 * Front-end controller for the morphological analysis page.
 * It manages UI interactions, specifically handling keyboard
 * shortcuts for the search textarea to improve user experience.
 * * RESPONSIBILITIES:
 * - Initialize UI event listeners.
 * - Handle "Enter" key to trigger form submission.
 * - Allow "Shift + Enter" for manual line breaks.
 * ----------------------------------------------------------------- */

/**
 * Class: Page
 * -----------------
 * Coordinates the interaction between the user and the analysis form.
 */
class Page {

  constructor() {
    /* Initialize event listeners when the class is instantiated */
    this._initEvents();
    
    /* Set focus on the textarea for immediate use */
    const textarea = document.querySelector('textarea[name="input"]');
    if (textarea) textarea.focus();
  }

  /* --------------------------------------
   * Event handlers
   * -------------------------------------- */

  /**
   * Handles the keydown event on the search textarea.
   * Logic:
   * - Enter: Submit the analysis.
   * - Shift + Enter: Allow new line in the textarea.
   * * @param {KeyboardEvent} e - The keyboard event object.
   */
  handleTextareaKeyDown(e) {
    // Check if the pressed key is Enter
    if (e.key === 'Enter') {
      
      // If SHIFT is NOT pressed, we trigger the analysis
      if (!e.shiftKey) {
        e.preventDefault(); // Prevent the default newline behavior
        
        const form = e.target.closest('form');
        if (form) {
          // Submit the form to trigger the PHP/Prolog analysis
          form.submit();
        }
      }
      // If SHIFT is pressed, we do nothing (the browser will add a newline)
    }
  }

  /* --------------------------------------
   * Initialization logic
   * -------------------------------------- */

  /**
   * Attach all DOM event listeners required by the page.
   * Following the modular structure: UI -> Controller.
   */
  _initEvents() {
    // Select the textarea using the name attribute defined in index.php
    const textarea = document.querySelector('textarea[name="input"]');
    
    if (textarea) {
      textarea.addEventListener('keydown', (e) => {
        this.handleTextareaKeyDown(e);
      });
    }
  }
}

/* --- Page Initialization --- */
// Instantiate the controller when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', () => {
  window.app = new Page();
});