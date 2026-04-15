# SLR Manuscript PDF Build Guide

This repository contains the LaTeX sources for the manuscript.

## Main manuscript files

The current primary manuscript build target is:
- `main-ijim-di.tex`

Other available manuscript entry points include:
- `main-ijipm.tex`
- `Complete_Manuscript.tex`

## Quick start

### 1. Install the local LaTeX toolchain
Run:

```bash
./scripts/setup-tex.sh
```

This script:
- installs **TinyTeX** under `~/Library/TinyTeX` if it is not already installed
- installs the required TeX Live collections
- adds TinyTeX to your `~/.zshrc`

If you do not want to open a new shell after installation, run:

```bash
export PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$PATH"
```

## Build the PDF

To build the main manuscript PDF, run:

```bash
./scripts/build-pdf.sh main-ijim-di.tex
```

If you omit the filename, the script builds `main-ijim-di.tex` by default:

```bash
./scripts/build-pdf.sh
```

## Output

After a successful build, the generated PDF will be:

- `main-ijim-di.pdf`

## Build another manuscript variant

Examples:

```bash
./scripts/build-pdf.sh main-ijipm.tex
./scripts/build-pdf.sh Complete_Manuscript.tex
```

## Manual build command

If you prefer not to use the helper script, you can build manually with:

```bash
latexmk -pdf -interaction=nonstopmode -file-line-error main-ijim-di.tex
```

## Clean build artifacts

To remove generated files for a target:

```bash
latexmk -c main-ijim-di.tex
```

To remove more aggressively, including the PDF:

```bash
latexmk -C main-ijim-di.tex
```

## Notes

- The repository ignores most LaTeX-generated temporary files via `.gitignore`.
- The manuscript currently compiles successfully, although LaTeX may still report non-blocking warnings from the manuscript sources.
- If `latexmk` is not found, make sure TinyTeX is on your `PATH`.

## Troubleshooting

### `latexmk: command not found`
Run:

```bash
export PATH="$HOME/Library/TinyTeX/bin/universal-darwin:$PATH"
```

Then try the build again.

### PDF does not update
Force a rebuild with:

```bash
latexmk -pdf -g -interaction=nonstopmode -file-line-error main-ijim-di.tex
```

### Missing package errors
Re-run the setup script:

```bash
./scripts/setup-tex.sh
```
