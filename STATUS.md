# Project status

Date: 2026-09-30

## Stage gates

- **Stage 1 — scaffold and provenance: COMPLETE.**
  - Predecessor inspection remains pinned to jfairfaxball-348/pascal-minus-one@966f8a03416d1e4c276a835698b5a38cb08c769c.
- **Stage 2 — detailed prior-art audit: COMPLETE. Gate: PROCEED.**
  - The exact selected-gcd family is prior art: Wu 2026 defines g(m,n)=gcd{C(mn,mk):1<=k<n}, exactly G(mn;m).
  - McTague's Theorem Q (2015/2017) already proves the Target-A subcase p ≡ 1 (mod m), where r_p(m)=1.
  - McTague also gives the exact exceptional instance v_2(G(6;3))=2; since 6 is the first admissible row, T_2(3)=6 is not a new result.
  - No equivalent statement of the general higher maximum in Target A or the a>=2 least-row formula in Target B was located in the documented search.
  - Chung–Yang, published 2026-09-27, is a very recent adjacent source on non-coprime lower indices and p^t+1 shapes; its full theorem text was subscription-only during Stage 2 and was designated for mandatory Stage-4 recheck.
  - Full source/theorem/search details are in notes/prior-art-audit-2.md.
- **Pilot reproduction: COMPLETE as a finite experimental check.**
  - experiments/pilot_reproduction.py implements a scalable Kummer borrow DP with explicit m|k, 0<k<N, and terminal-borrow checks.
  - It uses integer-power thresholds only.
  - A separate direct Legendre implementation agrees on every admissible row through the claimed first extremal row in all seven reconstructed cases.
  - An actual integer binomial/gcd implementation agrees on all stated tractable ranges and on the largest target row.
  - Experiments remain outside the proof trust boundary.
- **Stage 3 — rigorous informal proof: COMPLETE.**
  - Target A is proved in full stated generality for every prime p and m>=2 with p∤m.
  - The proof first gives a universal upper bound by splitting the row multiplier at its leading base-p digit.
  - Sharpness is proved constructively. For r=r_p(m)>=2, write m=a p^(r-1)+c with 1<=a<=p-1 and 1<=c<p^(r-1); after repeating p^(r-1) modulo m at a sufficiently large exponent L, the admissible row N=a p^L+c forces at least r carries in every selected split. The r=1 case is handled by N=mp.
  - Equality rows therefore exist before T_p(m) is defined, so T_p(m) is well-defined by well-ordering.
  - Target B is proved for every prime p and every a>=2:
    \[
    T_p(p^a+1)=p^{3a}+1.
    \]
  - Attainment at p^(3a)+1 is proved by an exact Kummer residue count.
  - Strict non-attainment at every smaller admissible row is proved using an explicit leading-digit witness, with a fixed fallback multiplier p^(a-1) for the unique worst leading-digit pattern.
  - Full proof, failed approaches, endpoint checks, and the a=1 exclusion are in notes/proof.md.
- **Stage 4 — final theorem-level uniqueness / novelty audit: COMPLETE. Gate: PROCEED.**
  - Wu v2 and McTague v5 were rechecked directly against the exact Stage-3 statements.
  - Target A's p≡1 mod m subcase and the (2,3,6) exception remain exact known overlaps.
  - No equivalent theorem was located for the remaining general Target-A maximum/equality construction or for Target B, including the least multiplier p^(2a)-p^a+1=Phi_6(p^a) and strict lower-multiplier non-attainment.
  - A renewed full-text search for Chung–Yang 2026 checked Springer/DOI PDF routes, SharedIt, author/preprint/repository searches, affiliations, ResearchGate/ORCID, theorem-number snippets, and equivalent formulas. Only the publisher abstract/metadata was inspectable.
  - Chung–Yang 2026 is retained as an explicit residual novelty caveat: its advertised non-coprime-index selection rule is different, but non-overlap with inaccessible internal theorem text could not be verified because of recency and lack of open source material.
  - This caveat must be disclosed in any later novelty discussion, but it is not a blocker to formalisation.
  - The authoritative Stage-4 decision and full search log are in notes/prior-art-audit-4.md.
- **Stage 5 — Lean: COMPLETE. Gate: PROCEED.**
  - Target A is formalised as `targetA`, with the universal upper bound, constructive attainment, and exact maximum statement.
  - Extremal-row existence is proved before the least row `T` is used; `T_mem_extremalRows` and `T_isLeast` formalise well-definedness/minimality for every Target-A pair.
  - Target B is formalised as `targetB`: for every prime `p` and `a>=2`, `T p (p^a+1)=p^(3a)+1`.
  - The target-row proof includes the exact Stage-3 equality witness with multiplier `p^(2a-1)`; strict lower-row non-attainment retains the leading split and fixed fallback `p^(a-1)`.
  - Focused examples include `T 2 5 = 65`.
  - GitHub Actions builds from a fresh checkout with `lake build` and rejects `sorry`/`admit` in the project Lean sources. The final Stage-5 branch CI is required green before merge.
  - Formalisation details and provenance are in `notes/formalisation-5.md`.
- **Stage 6 — Palomar: IN PROGRESS.**
  - Initial submission at commit `3f234e061d44fcd2ececab1280788e7a39c90822` passed Palomar mechanical verification on 2026-09-30.
  - Automated review identified one blocking repository-status issue: the public README still described Targets A and B as conjectural and Stages 3–8 as unstarted.
  - The README has now been corrected to distinguish completed proof/formalisation from pending registration and publication.
  - Registration has **not** yet occurred; a corrected commit must be submitted as a new Palomar submission with the existing Palomar ID left blank unless the result is already public.
- **Stage 7 — paper: NOT STARTED.**
- **Stage 8 — arXiv: NOT STARTED.**

## Claim status

- **Target A:** **formalised** in full stated generality. The p≡1 mod m subcase remains known prior art from McTague and must be attributed.
- **Existence of T_p(m):** **formalised** for every Target-A pair (p,m), with attainment proved before the least extremal row is used.
- **Target B (a>=2):** **formalised**:
  \[
  T_p(p^a+1)=p^{3a}+1.
  \]
- **Exceptional T_2(3)=6:** known from McTague's explicit example plus admissibility, not a candidate contribution.
- **Novelty / uniqueness:** **not established.** The Stage-4 documented search located no equivalent result for the surviving exact statements, but this is only a negative search. Chung–Yang 2026 remains an explicit residual caveat because its full theorem text was not openly inspectable.

## Proof trust boundary

The Lean theorem layer now formalises the Stage-3 argument using Mathlib's Kummer/p-adic infrastructure and elementary arithmetic. The Stage-2 experiments remain outside both the mathematical and formal proof trust boundary; no finite computation is used as a proof step. No theorem-specific axiom, `sorry`, or `admit` is introduced.

## Next action

Submit the corrected Stage-6 commit to Palomar as a **new submission**, leaving the existing Palomar ID blank unless this result is already in the public registry. Preserve the exact theorem statements and all prior-art/novelty caveats. Do not begin the research paper or arXiv work until registration succeeds.
