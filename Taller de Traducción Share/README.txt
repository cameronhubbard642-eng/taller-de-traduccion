Taller de Traducción — Spanish Translation & Grammar Practice
=============================================================

A structured Spanish practice app for academic readers, featuring
translation exercises from Borges and Neruda, a 70-lesson grammar
curriculum aligned with "Spanish for Reading" (Franco & Sandberg),
and vocabulary drills with 2,200+ entries.


HOW TO USE
----------

Option 1: Web (GitHub Pages)
  Visit: [YOUR_GITHUB_PAGES_URL]
  Works in any modern browser. Progress saves to localStorage.

Option 2: macOS Desktop App
  Open "Taller de Traducción (Universal).app" included in this folder.

  IMPORTANT — Gatekeeper bypass (required for unsigned apps):
  The app is not signed with an Apple Developer certificate.
  To open it the first time:
    1. Right-click (or Control-click) the app
    2. Select "Open" from the context menu
    3. Click "Open" in the dialog that appears
  After this, the app will open normally with a double-click.

  Alternatively, from Terminal:
    xattr -cr "Taller de Traducción (Universal).app"

  The app is a lightweight Swift/WebKit wrapper (~200KB binary).
  It runs the same HTML file as the web version. Progress saves
  to the WebKit localStorage within the app sandbox.

Option 3: Offline HTML
  Open taller-de-traduccion.html directly in any browser.
  All content is self-contained in the single HTML file.
  Progress saves to your browser's localStorage.


FEATURES
--------

Translation Tab
  - 298 Borges exercises across 5 stories (Tlön, Menard, Ruinas
    Circulares, Biblioteca de Babel, Funes el Memorioso)
  - 70 Neruda exercises across selected poems
  - Part-of-speech color coding with hover glosses
  - AI-assisted translation evaluation (requires API key)

Grammar Tab
  - 70 lessons across 15 chapters, aligned with Franco & Sandberg's
    "Spanish for Reading"
  - Three-phase exercise system: Repetition → Cloze → Production
  - Paradigm tables, cross-linguistic comparisons, historical notes
  - Review mode with spaced reinforcement from prerequisite lessons
  - Progress tracking: new → started → mastered

Vocabulary Tab
  - 750 nouns, 500 verbs, 250 adjectives/adverbs
  - 100 idioms, comprehensive conjunctions/pronouns/particles
  - 250 Borges-specific and 250 Neruda-specific literary terms
  - Flashcard review with difficulty filtering


PROGRESS IMPORT/EXPORT
----------------------

All progress data is stored in your browser's localStorage under
keys prefixed with "taller_". To back up or transfer progress:

Export (in browser console, F12 → Console):
  const data = {};
  for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i);
    if (key.startsWith("taller_")) data[key] = localStorage.getItem(key);
  }
  console.log(JSON.stringify(data));
  // Copy the output

Import (in browser console):
  const data = JSON.parse('PASTE_YOUR_EXPORTED_JSON_HERE');
  Object.entries(data).forEach(([k, v]) => localStorage.setItem(k, v));
  location.reload();

Note: The macOS app and browser versions use separate localStorage
stores. To transfer between them, export from one and import in the
other using the WebKit inspector (Develop → Show Web Inspector in
the macOS app's menu bar, after enabling the Develop menu in
Safari preferences).


GITHUB PAGES SETUP
------------------

To host this app on GitHub Pages:

1. Create a new GitHub repository (e.g., "taller-de-traduccion")
2. Copy the contents of gh-pages-deploy/ to the repo root:
     cd gh-pages-deploy
     git init
     git add .
     git commit -m "Initial deploy"
     git remote add origin git@github.com:YOUR_USERNAME/taller-de-traduccion.git
     git push -u origin main
3. In the repo Settings → Pages, set Source to "Deploy from a branch"
   and select "main" / "/ (root)"
4. The app will be live at:
   https://YOUR_USERNAME.github.io/taller-de-traduccion/

To update after changes, use the included update.sh script with
the --push flag.


STRUCTURED REPETITION SYSTEM
-----------------------------

The app's grammar exercises use a structured three-phase repetition
system designed to move learners from recognition to production:

Phase 1 — Repetition (Recognition)
  Given a Spanish form, identify its meaning from four options.
  This builds passive recognition of paradigm entries.

Phase 2 — Cloze (Guided Production)
  Given an English meaning, select the correct Spanish form from
  four options. This reverses the direction, testing recall with
  scaffolding.

Phase 3 — Production (Free Recall)
  Given an English meaning, type the correct Spanish form with no
  options. This tests unassisted production.

A lesson is marked "mastered" when the learner has answered at
least one exercise correctly in each of the three phases. The
Review tab provides mixed exercises drawing from the current
lesson and its prerequisites for spaced reinforcement.
