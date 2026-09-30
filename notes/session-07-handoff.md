# Session 07 handoff — Stage 7 paper complete

Date: 2026-09-30

## Session result

Stage 7 is complete. The research paper has been drafted as a standalone mathematics paper, audited against the Stage-3 proof and final Lean theorem layer, built to PDF, and visually inspected.

**Stage-7 gate: PROCEED — the paper is complete enough to begin Stage 8 arXiv preparation.**

Stage 8 has not been started in this session.

## Paper files

Created or finalized:

- `paper/main.tex` — complete article source.
- `paper/references.bib` — BibTeX database.
- `paper/README.md` — portable build instructions.

Working title:

> *Sharp p-adic Extrema and Least Extremal Rows for Restricted Binomial GCDs*

Author line: John Fairfax-Ball. No affiliation, acknowledgements, or publication metadata were invented.

The generated PDF was built and inspected during the session; it is a build artifact rather than a committed source file.

## Build and inspection

The successful verification build was:

```sh
cd /mnt/data/pascal-extremes-paper
pdflatex -interaction=nonstopmode -halt-on-error main.tex
/usr/bin/bibtex.original main
pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

The direct `bibtex.original` path is an environment-specific workaround for a broken `bibtex` symlink in the ChatGPT build environment. The source itself is conventional and `paper/README.md` gives the normal command `latexmk -pdf main.tex`.

Final result:

- PDF pages: 13.
- No LaTeX warnings that matter.
- No undefined citations or references.
- No overfull or underfull box warnings.
- PDF preflight: openable, unencrypted, text-based.
- Render inspection at 180 dpi found no clipped text, malformed equations, broken glyphs, or bad bibliography layout.

## Exact theorem wording used

The paper defines
\[
G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}
\]
for `m >= 2` and admissible rows `N > m` with `m | N`, and
\[
r_p(m)=\min\{r\ge1:m<p^r\}.
\]

### Target A

For every prime `p` and every `m >= 2` with `p ∤ m`,
\[
\max_{\substack{N>m\\m\mid N}} v_p(G(N;m))=r_p(m).
\]

The paper separately proves the universal upper bound and constructive attainment. For `r_p(m)=1` it uses the row `N=mp`. For `r=r_p(m)>=2`, it writes
\[
m=A p^{r-1}+c,\qquad 1\le A\le p-1,\quad 1\le c<p^{r-1},
\]
chooses `L ≡ r-1 (mod ord_m(p))` with `L >= 2r-2` and `L>r-1`, and uses
\[
N=A p^L+c.
\]

Only after this attainment proof does the paper define
\[
T_p(m)=\min\{N>m:m\mid N, v_p(G(N;m))=r_p(m)\}.
\]

### Target B

For every prime `p` and every integer `a >= 2`,
\[
T_p(p^a+1)=p^{3a}+1.
\]

The paper proves both exact halves used by the Lean development:

1. Target-row attainment:
\[
v_p(G(p^{3a}+1;p^a+1))=a+1.
\]
The equality witness uses selected multiplier `d=p^(2a-1)`.

2. Strict lower-row non-attainment:
for every admissible `N<p^(3a)+1`,
\[
v_p(G(N;p^a+1))\le a.
\]
The proof contains the complete leading-digit split, the exceptional pattern, and the fixed fallback multiplier `p^(a-1)`.

The equivalent least multiplier is stated as
\[
p^{2a}-p^a+1=\Phi_6(p^a).
\]

The example `T_2(5)=65` is included.

## Theorem-by-theorem audit

The final manuscript was checked against `notes/proof.md` and:

- `PascalExtremes/TargetA.lean`
- `PascalExtremes/TargetAAttainment.lean`
- `PascalExtremes/TargetB.lean`
- `PascalExtremes/TargetBMinimality.lean`
- `Challenge.lean`
- `Solution.lean`

The hypotheses and conclusions agree with the formal theorem layer:

- `targetA_upper`: every admissible row has valuation at most `rP p m`.
- `targetA_attainment`: an admissible equality row exists constructively.
- `targetA`: exact maximum as an `IsGreatest` statement.
- `targetB_attainment`: the proposed row has valuation `a+1`.
- `targetB_lower_nonattainment`: every smaller admissible row has valuation at most `a`.
- `targetB`: `T p (p^a+1)=p^(3a)+1` for every prime `p` and `a>=2`.

The paper's integer-power definition of `r_p(m)` is the mathematical form corresponding to Lean's `rP p m = Nat.log p m + 1` under the stated prime/positive hypotheses.

## Prior art and bibliography status

The paper explicitly distinguishes known background from the proved statements.

It attributes:

- Wu's exact family `g(m,n)=G(mn;m)`.
- McTague's Theorem Q, including the known `p ≡ 1 (mod m)` subcase.
- McTague's explicit `(p,m,N)=(2,3,6)` valuation-2 example and the resulting known `T_2(3)=6`.
- Kummer's carry/borrow theorem and classical background.
- Adjacent restricted-binomial-GCD work by Hong; Chiu–Yuan–Zhou; Chung–Yang–Zhou; and Chung–Yang.

The Stage-4 Chung–Yang 2026 caveat is preserved: its publisher abstract/metadata were inspectable during the audit, but the full theorem text was not openly inspectable, so theorem-level non-overlap with inaccessible material is not claimed.

The manuscript says only that no equivalent statement was located in the documented literature search, subject to that caveat. It does not claim that the results are historically new, first, novel, previously unknown, or unique.

Bibliographic metadata was checked against the Stage-4 primary-source record and authoritative source metadata. For Granville 1997, conflicting authoritative indexes give different terminal page numbers, so the bibliography deliberately records the volume/title/publisher/year without asserting the disputed final page.

## Formal verification and Palomar wording

The paper includes a short formal-verification section naming the Lean theorem layer. It records the public registration exactly as:

- Palomar ID: **PALOMAR-2026-09-30-000033**
- version: **1**
- public entry: https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-30-000033&version=1

The paper explicitly states that Palomar registration is verification/provenance evidence and is not evidence of historical priority, novelty, or uniqueness.

## Remaining editorial issues

No substantive mathematical or provenance issue remains for Stage 7.

Stage 8 should perform the arXiv-specific final pass: source-package cleanliness, arXiv metadata/category choices, author contact/affiliation fields if the author wishes to provide them, final title/abstract proofreading, and submission. The Chung–Yang caveat must remain unchanged unless genuinely new source access permits a theorem-level recheck.

## Gate

**PROCEED.**
