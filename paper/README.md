# Pascal Extremes paper

`main.tex` is the Stage-7 research-paper source and `references.bib` is its BibTeX database.

A standard TeX installation can build the paper with:

```sh
latexmk -pdf main.tex
```

The Stage-7 verification build used `pdflatex`, BibTeX, then two further `pdflatex` passes. In the ChatGPT build environment the ordinary `bibtex` symlink was broken, so `/usr/bin/bibtex.original` was invoked directly; this is an environment-specific workaround, not a source requirement.

The mathematical source of truth for the draft is `notes/proof.md`, cross-checked against the final Lean theorem layer. Palomar registration `PALOMAR-2026-09-30-000033`, version 1, is recorded as verification/provenance evidence only, not as evidence of historical priority or novelty.
