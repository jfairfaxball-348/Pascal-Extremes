# Session 08 handoff — final arXiv preparation and submission boundary

Date: 2026-09-30

## Stage-8 result

Stage 8 reached the furthest submission step available in this session.

- The arXiv source package is complete and submission-ready.
- The exact package has been rebuilt from a clean directory under TeX Live 2025 with PDFLaTeX/BibTeX and separately with the packaged `main.bbl`.
- The final 13-page PDF was rendered and inspected again. The regenerated-`.bib` build and packaged-`.bbl` build are pixel-identical page by page; the final committed-package rerun is also pixel-identical to the inspected PDF.
- The paper, `notes/proof.md`, the final Lean theorem layer, and the Palomar statement surface were checked again. No mathematical discrepancy was found, and no theorem scope or proof text was changed in Stage 8.
- No arXiv submission was created from this session because no authenticated arXiv submission action/browser is available here. The remaining arXiv steps require the author's authenticated account and, at minimum, the submitter's license choice/certification and final confirmation.
- Therefore there is **no arXiv submission identifier, arXiv submission date, endorsement status, moderation status, or selected license to record**.

This is a submission-ready handoff, not a claim that the article has been submitted.

## Current arXiv requirements checked

Official arXiv documentation was rechecked on 2026-09-30:

- Submission overview: https://info.arxiv.org/help/submit/index.html
- TeX/LaTeX submission rules: https://info.arxiv.org/help/submit_tex.html
- Metadata rules: https://info.arxiv.org/help/prep.html
- License information: https://info.arxiv.org/help/license/index.html
- Category taxonomy: https://arxiv.org/category_taxonomy

Relevant current requirements:

- arXiv Submission 1.5 accepts TeX/LaTeX/PDFLaTeX source packages and requires the submitter to inspect the processed PDF before final submission.
- PDFLaTeX is supported and auto-detected.
- TeX Live 2025 is the current default TeX Live environment.
- arXiv now processes `.bib` files directly. If a matching `.bbl` is supplied, arXiv uses the `.bbl` preferentially.
- Source archives may be `.tar.gz` or `.zip` and should not contain generated PDFs, logs, auxiliary files, editor files, backups, hidden cruft, or unrelated material.
- Metadata requires title, authors, and abstract. Comments are optional but recommended; report numbers and publication DOI/journal references must not be invented.
- `math.NT` remains the Number Theory category and is the intended primary category here. No secondary category is being proposed.
- The submitter must choose the arXiv license and certify the right to grant it. The choice is irrevocable, so no license was selected or guessed in this session.
- arXiv accepts submissions only from registered authors and may require endorsement for a new user or new category. Account/endorsement status was not accessible from this session.

## Final arXiv upload directory

The exact upload directory is:

`arxiv/stage-08/`

It contains exactly:

1. `main.tex`
2. `references.bib`
3. `main.bbl`

No generated PDF is part of the upload source package.

Including both `references.bib` and `main.bbl` is deliberate: the `.bib` preserves the bibliography source while the matching `main.bbl` fixes the bibliography rendered by arXiv, which current arXiv documentation says is preferred when present.

Per-file SHA-256 values from the final clean preflight are:

- `main.tex`: `4d26301dbc45787378993efa27416502cb435fbd14bdfb7230b7b6ce133ce6ef`
- `references.bib`: `8b96a45ac84502e9872d22a1fa470120ee3811230476d28938c3d1281ab7bd50`
- `main.bbl`: `fc6f5b4ee38f13dc20a7ecfe33530a05a070698b78c00a1327965a3e42d80d02`

The final generated upload archive from the preflight artifact is `arxiv-stage-08.tar.gz`, SHA-256:

`ff846b9255748863457f0e65236160f50175177c93d713ba8127282452025f8e`

The archive contains only the three files above.

## Final build / CI record

Final source-package commit before status/handoff updates:

`058a9ee63155c974c2708b463bdfacbc144e4823`

Final package preflight:

- GitHub Actions run: `36758243541`
- result: **success**
- TeX environment: TeX Live 2025
- processor tested: `pdflatex`
- bibliography path 1: clean `pdflatex -> bibtex -> pdflatex -> pdflatex`
- bibliography path 2: clean build from the packaged matching `main.bbl`
- both builds: 13 pages
- no undefined citations/references
- no overfull/underfull box warnings
- committed `main.bbl` matched a fresh BibTeX generation byte-for-byte
- final upload artifact ID: `11118006904`

The ordinary Lean CI run for the same package commit was also green:

- Lean workflow run: `36758243603`
- result: **success**

The two PDF build routes differ in PDF metadata timestamps but render pixel-identically on all 13 pages. The final package rerun also renders pixel-identically to the inspected preflight PDF.

The PDF inspection confirmed:

- title and author render correctly;
- abstract renders correctly;
- theorem numbering and displayed equations are intact;
- references resolve;
- all fonts are embedded;
- page layout has no clipping or overlap;
- the PDF contains the live Palomar link for version 1.

Bibliography metadata was rechecked against the Stage-7 audit trail and the currently accessible authoritative records used there (including the current McTague/Wu records and publisher/index records for the journal articles and classical sources). No contradictory metadata or correction requiring a source change was found. The Chung–Yang 2026 bibliographic record remains the publisher metadata recorded in the documented audit; the inability to inspect its full theorem text remains a novelty-scope caveat, not a bibliographic ambiguity.

## Final title

**Sharp $p$-adic Extrema and Least Extremal Rows for Restricted Binomial GCDs**

Author:

**John Fairfax-Ball**

No affiliation, ORCID, acknowledgement, grant information, journal status, author contact information, or DOI has been invented or added.

## Final abstract

For integers $m\ge 2$ and rows $N>m$ divisible by $m$, consider the restricted binomial greatest common divisor
\[
  G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}.
\]
Fix a prime $p$ with $p\nmid m$, and let $r_p(m)$ be the least positive integer $r$ such that $m<p^r$. We prove that the largest possible value of $v_p(G(N;m))$, as $N$ ranges over all admissible rows, is exactly $r_p(m)$, and we give a constructive equality row. Attainment is established before the least extremal row $T_p(m)$ is defined. For the special family $m=p^a+1$ with $a\ge2$, we determine that least row exactly:
\[
  T_p(p^a+1)=p^{3a}+1.
\]
The proof combines Kummer's carry theorem with an explicit leading-digit witness for the universal upper bound, a multiplicative-order construction for equality, and a separate strict-minimality argument below $p^{3a}+1$ with a fallback witness for the unique worst leading-digit pattern. The selected-GCD family itself is known in the literature; the relation to earlier results and the limits of the documented literature search are stated explicitly.

For arXiv metadata, keep the same wording. arXiv metadata fields accept ASCII plus supported TeX/MathJax; avoid introducing Unicode punctuation by copying from a PDF viewer.

Optional factual comments field, if desired:

`13 pages, no figures.`

## Category

Primary category:

`math.NT` — Number Theory

Secondary categories:

None selected.

## License

**NOT SELECTED.**

The author/submitter must choose the license in arXiv and certify the right to grant it. No license choice is recorded here.

## Final theorem-level consistency check

The mathematical content remains frozen.

### Target A

The paper, `notes/proof.md`, Lean theorem layer, and Palomar statement surface all agree on:

For every prime $p$ and every $m\ge2$ with $p\nmid m$,
\[
\max_{N>m,\ m\mid N} v_p(G(N;m))=r_p(m),
\]
where $r_p(m)$ is the least positive $r$ such that $m<p^r$.

Constructive attainment is proved before the least extremal row is defined.

The Lean implementation uses a concrete Euler-totient-period choice for the exponent in the equality-row construction; this is a sufficient instance of the multiplicative-order condition used in the paper and does not change the statement.

### Target B

The paper, proof notes, Lean theorem layer, and Palomar statement surface all agree on:

For every prime $p$ and every $a\ge2$,
\[
T_p(p^a+1)=p^{3a}+1.
\]

The formal layer includes exact target-row attainment and strict non-attainment at every smaller admissible row, matching the paper.

No discrepancy requiring a submission stop was found.

## Literature / priority language that must remain unchanged

The Stage-4 and Stage-7 caveats remain authoritative:

- Wu's `g(m,n)` is exactly the selected-binomial-GCD family `G(mn;m)` and is prior art.
- McTague's Theorem Q contains the $p\equiv1\pmod m$ subcase of Target A.
- McTague's explicit $(p,m,N)=(2,3,6)$ example gives the known $T_2(3)=6$ case.
- Kummer's theorem and the carry/borrow machinery are classical.
- The full theorem text of Chung–Yang 2026 was not openly inspectable during the documented audit. The paper therefore does not claim verified non-overlap with inaccessible material from that source.
- The permitted negative-search formulation remains: **“No equivalent statement was located in the documented literature search, subject to the caveats discussed below.”**
- The results must not be described as “new”, “first”, “novel”, “previously unknown”, or historically unique.

## Palomar

Public formal package:

- Palomar ID: **PALOMAR-2026-09-30-000033**
- version: **1**
- public entry: https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-30-000033&version=1

This is verification/provenance evidence only. It is not evidence of historical priority, novelty, uniqueness, or first discovery.

## arXiv submission status

**NOT SUBMITTED FROM THIS SESSION.**

No arXiv identifier exists from this session.

No license has been selected.

No endorsement or moderation status is known.

The remaining direct user steps are:

1. Sign in to the author's arXiv account and choose **START NEW SUBMISSION**.
2. Upload the prepared `arxiv-stage-08.tar.gz` bundle (or the three exact files from `arxiv/stage-08/`).
3. Run **Check Files** and verify that arXiv detects PDFLaTeX and `main.tex` as the top-level file. Do not accept deletion of `main.bbl`; it is intentional.
4. Confirm successful arXiv compilation and inspect the arXiv-generated PDF.
5. Enter the title, author, abstract, optional `13 pages, no figures` comment, and primary category `math.NT`; do not invent a secondary category, report number, journal reference, or DOI.
6. If arXiv reports an endorsement requirement, complete that requirement through the account workflow.
7. Choose the license and make the required author/right-to-submit certification after reviewing the arXiv terms.
8. Perform the final **Submit Article** confirmation.
9. Only after arXiv returns a submission identifier/status should the repository be updated with that identifier/status and the license actually chosen.

Until step 8 succeeds, do not record an arXiv submission date or identifier.
