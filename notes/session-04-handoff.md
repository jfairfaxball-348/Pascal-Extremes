# Session 04 handoff — Stage 4 complete; cleared for Lean

Date: 2026-09-29

## Scope completed

This session stayed within Stage 4. No Lean, Palomar registration, paper writing, or arXiv work was started.

The exact Stage-3 statements were audited in Wu's \(g(m,n)\) notation and in the project's row notation. Primary-source rechecks were completed for Wu and McTague, adjacent sources were rechecked, exact construction/minimality searches were rerun, and a renewed attempt was made to obtain the full Chung–Yang 2026 article.

The detailed record is in `notes/prior-art-audit-4.md`.

## Confirmed prior-art boundaries

- Wu 2026 defines exactly the same selected GCD family \(g(m,n)=G(mn;m)\).
- McTague Theorem Q already gives the full Target-A subcase \(p\equiv1\pmod m\).
- McTague explicitly records \(v_2(G(6;3))=2\), so \(T_2(3)=6\) is known.
- Kummer carry/borrow theory and the minimum-valuation rule for a GCD are prior art.
- Chung–Yang–Zhou 2025 and Chiu–Yuan–Zhou 2023 are close but use exact-gcd/non-coprime/central-band selection rules rather than the project's fixed-multiple set.

## Exact negative-search result

No equivalent result was located for either of the following exact informally proved statements:

\[
\max_{\substack{N>m\\m\mid N}}v_p(G(N;m))=r_p(m)
\quad(p\nmid m),
\]
outside the already attributed McTague subcase, or
\[
T_p(p^a+1)=p^{3a}+1
\quad(a\ge2).
\]

The same negative result held after translating Target B to the least-multiplier statement
\[
\min\{n\ge2:v_p(g(p^a+1,n))=a+1\}
=
p^{2a}-p^a+1
=
\Phi_6(p^a),
\]
including strict non-attainment at all smaller multipliers.

This is not a uniqueness claim.

## Residual novelty caveat

Chan-Liang Chung and Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, *Mediterranean Journal of Mathematics* 23, article 209 (2026), was published on 27 September 2026.

The Springer abstract and metadata were inspected. The advertised selected set is different from the project's fixed-multiple set, and the abstract does not state Target A or B. However, the full theorem text remains inaccessible through the available sources.

This session attempted:
- the publisher PDF and DOI PDF routes;
- SharedIt;
- exact-title + PDF and theorem-number searches;
- preprint / accepted-manuscript / author-manuscript / repository searches;
- Fuzhou University and Soochow University affiliation searches;
- ResearchGate and ORCID searches;
- formula searches around \(p^t+1\), exact \(p\)-adic valuations, and \(B_{>1}\).

No inspectable full text or theorem-level mirror was located.

This is **not treated as a blocker**. Chung–Yang 2026 must instead remain an explicit caveat in later novelty discussion: cite it as adjacent work and state that non-overlap with its inaccessible full theorem text could not be verified because of its recency and the lack of open source material. Do not turn the negative search into a historical uniqueness claim.

## Stage-4 gate

**PROCEED — Target A and Target B are cleared for Stage 5 Lean formalisation.**

## Next action

Run **Stage 5 only**: formalise the exact Stage-3 statements and proof architecture in Lean. Do not begin Palomar registration, paper writing, or arXiv work.

## Copy-paste prompt for Session 05

Continue the Pascal Extremes project from the repository handoff at jfairfaxball-348/Pascal-Extremes.

Read AGENTS.md, STATUS.md, notes/targets.md, notes/proof.md, notes/prior-art-audit-4.md, and notes/session-04-handoff.md first. Also inspect the existing Lean project configuration and the reusable predecessor material identified in AGENTS.md before changing code.

This session is Stage 5 only: formalise in Lean the exact informally proved statements from Stage 3 that were cleared by the Stage-4 gate. Do not begin Palomar registration, paper writing, or arXiv work.

Formalise the underlying selected-binomial GCD setup, the p-adic valuation statements, and all supporting carry/borrow or equivalent arithmetic lemmas needed for:

1. Target A: for every prime p and every m>=2 with p∤m,
   max_{N>m, m|N} v_p(G(N;m)) = r_p(m),
   with existence proved constructively before defining or using T_p(m).

2. The existence/well-definedness of T_p(m) for every Target-A pair.

3. Target B: for every prime p and every a>=2,
   T_p(p^a+1) = p^(3a)+1,
   including both attainment at p^(3a)+1 and strict non-attainment at every smaller admissible row.

Preserve the Stage-3 proof architecture unless Lean forces a cleaner equivalent formulation. In particular, retain a transparent formal counterpart of the leading-base-p-digit upper-bound witness for Target A, the constructive equality row N=a*p^L+c for r>=2 with the r=1 case separated, the Kummer residue/carry argument for Target-B attainment, and the leading-split plus fallback witness for strict lower-row non-attainment.

Reuse compatible infrastructure from the predecessor repository jfairfaxball-348/pascal-minus-one only where it genuinely fits, with provenance recorded. AGENTS.md identifies G, Admissible, G_ne_zero, and padicVal_G_eq_of_lower_bound_of_witness as potentially reusable ideas/lemmas. Do not copy the predecessor wholesale. Keep the current repository's pinned Lean/mathlib toolchain unless a change is strictly necessary and documented.

The formalisation must compile from a clean checkout with no sorry, admit, axioms added for the theorem, or untracked local dependencies. Add focused tests/examples where useful, run the full Lean build, and record the exact build command and result.

If the most natural direct formalisation of Kummer carries is impractical in the available mathlib, prove an equivalent valuation statement rigorously rather than weakening the theorem. Keep any failed Lean approaches or library gaps in notes so the handoff explains why the final architecture was chosen.

Do not make a novelty claim in Lean comments or documentation. Preserve the known-prior-art boundaries: Wu's exact g(m,n) family, McTague's p≡1 mod m subcase, Kummer's theorem, and the known (2,3,6) case. Preserve the Stage-4 caveat that Chung–Yang 2026 is adjacent work whose full theorem text was not openly inspectable, so novelty relative to it was not verified.

Update STATUS.md, add a Stage-5 formalisation note/handoff, commit the Lean work, and finish with exactly one Stage-5 gate stating whether the formalisation is complete and the project is ready to proceed to Palomar registration.
