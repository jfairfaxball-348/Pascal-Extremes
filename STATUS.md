# Project status

Date: 2026-09-29

## Stage gates

- **Stage 1 — scaffold and provenance: COMPLETE.**
  - Predecessor inspection remains pinned to `jfairfaxball-348/pascal-minus-one@966f8a03416d1e4c276a835698b5a38cb08c769c`.
- **Stage 2 — detailed prior-art audit: COMPLETE. Gate: PROCEED.**
  - The exact selected-gcd family is prior art: Wu 2026 defines `g(m,n)=gcd{C(mn,mk):1<=k<n}`, exactly `G(mn;m)`.
  - McTague's Theorem Q (2015/2017) already proves the Target-A subcase `p ≡ 1 (mod m)`, where `r_p(m)=1`.
  - McTague also gives the exact exceptional instance `v_2(G(6;3))=2`; since 6 is the first admissible row, `T_2(3)=6` is not a new result.
  - No equivalent statement of the general higher maximum in Target A or the `a>=2` least-row formula in Target B was located in the documented search.
  - Chung–Yang, published 2026-09-27, is a very recent adjacent source on non-coprime lower indices and `p^t+1` shapes; its full theorem text was subscription-only during this audit and must be rechecked in Stage 4.
  - Full source/theorem/search details are in `notes/prior-art-audit-2.md`.
- **Pilot reproduction: COMPLETE as a finite experimental check.**
  - `experiments/pilot_reproduction.py` implements a scalable Kummer borrow DP with explicit `m|k`, `0<k<N`, and terminal-borrow checks.
  - It uses integer-power thresholds only.
  - A separate direct Legendre implementation agrees on every admissible row through the claimed first extremal row in all seven reconstructed cases.
  - An actual integer `binomial`/`gcd` implementation agrees on all stated tractable ranges and on the largest target row.
  - The Session-01 durable handoff preserved the three exceptional cases but not the literal four `a>=2` pilot tuples; the reconstruction and exact ranges are documented in `experiments/README.md` and `experiments/pilot-results.txt`.
- **Stage 3 — proof: NOT STARTED.**
- **Stage 4 — final uniqueness audit: NOT STARTED.**
- **Stage 5 — Lean: NOT STARTED.**
- **Stage 6 — Palomar: NOT STARTED.**
- **Stage 7 — paper: NOT STARTED.**
- **Stage 8 — arXiv: NOT STARTED.**

## Claim status

- **Target A:** **conjectured** in its full stated generality. A substantial subcase (`p≡1 mod m`) is known from McTague and must be attributed.
- **Target B (`a>=2`):** **conjectured**. The seven-case pilot gives finite experimental support only.
- **Exceptional `T_2(3)=6`:** known from McTague's explicit example plus admissibility, not a candidate contribution.
- **Novelty:** not established. Stage 2 supports only: no equivalent general Target-A statement or Target-B least-row formula was located in the documented search.

## Next action

Stage 3 may now develop the rigorous informal proof of the surviving candidate statements, explicitly separating known McTague/Wu material from any new argument. Do not begin Lean, registration, or paper work. See `notes/session-02-handoff.md`.
