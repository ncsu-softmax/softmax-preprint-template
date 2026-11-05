# SoftMax Lab Preprint Template

A single-column LaTeX template for preprints and technical reports from the **SoftMax Lab** at **NC State University**.

The template gives lab papers a consistent identity (lab icon, NC State wordmark, Wolfpack Red accents) while still working for papers written with collaborators from other institutions.

[View the sample PDF](main.pdf) · [SoftMax Lab website](https://ncsu-softmax.github.io/)

## Quick start

1. Click **Use this template** on GitHub (or copy the folder) to start a new paper.
2. Edit the front matter in `main.tex`: title, running title, authors, affiliations, emails, and code link.
3. Build:

   ```bash
   latexmk -pdf main.tex
   ```

   The template also compiles on Overleaf with the default pdfLaTeX compiler.

## Files

| File | Purpose |
| --- | --- |
| `main.tex` | Paper source with example sections, figure, table, and findings |
| `softmax_preprint.cls` | Document class: fonts, layout, header/footer, title block, abstract box |
| `references.bib` | Example bibliography (natbib, author–year) |
| `assets/logo.png` | SoftMax Lab icon (first-page banner and running header) |
| `assets/ncstate-logo.png` | NC State logo (first-page header, right side) |
| `figures/` | Put your figures here |

## Front-matter commands

| Command | Effect |
| --- | --- |
| `\title{...}` / `\runningtitle{...}` | Title on page 1 / title in the header from page 2 on |
| `\author{...}` with `\affmark{1,2}` | Authors with numbered affiliation markers (`*` for corresponding author) |
| `\affiliation{...}` / `\authornote{...}` | Institution list / note under it (e.g. corresponding author) |
| `\emails{\email{a@ncsu.edu}, ...}` | Contact row at the bottom of the abstract (omit to hide) |
| `\codelink{URL}{shown text}` | GitHub link at the bottom of the abstract (omit to hide) |
| `\logo{...}`, `\runninglogo{...}`, `\banner{...}` | First-page right logo, running-header logo, first-page lab banner |
| `\finding{...}` | Gray box for a one-sentence takeaway |

For a paper whose authors are all at NC State, use the single-institution form shown in the comments of `main.tex`.

## Customizing

- **Accent color**: `WolfpackRed` (`#CC0000`) is defined in `softmax_preprint.cls`; the abstract background is `abstractbg`.
- **Logos**: replace the files in `assets/`. For a sharper print logo, download the official NC State wordmark from the [NC State brand site](https://brand.ncsu.edu/) and point `\logo{...}` at it.

## Credits

Adapted from the [SMU SOAR Preprint Template](https://github.com/soarsmu/soar-preprint-template). Typography follows the Berkeley RAIL / Google DeepMind tech-report template (CC BY-SA 4.0). Released under the MIT License (see `LICENSE`).
