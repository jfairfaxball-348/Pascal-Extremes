# Session 02 handoff — Stage 2 complete

Date: 2026-09-29

## Completed in this session

Stage 2 theorem-level prior-art audit and independent seven-case pilot reproduction only. No general proof was begun.

### Prior art

The central audit finding is that the selected family is not new notation-wise or subject-wise:

\[
G(N;m)=g(m,N/m)
\]

for Chai Wah Wu's 2026 exact-family definition `g(m,n)=gcd{C(mn,mk):1<=k<n}`.

Carl McTague's Theorem Q already proves the full Target-A subcase `p≡1 (mod m)` (where the target maximum is 1), and his paper explicitly gives `v_2(G(6;3))=2`, which also settles the exceptional first row `T_2(3)=6`.

The documented search located no equivalent theorem for the general higher maximum of Target A and no equivalent theorem for Target B's least row `p^(3a)+1`, `a>=2`.

A paper by Chan-Liang Chung and Tse-Chung Yang, *The Greatest Common Divisor of Binomial Coefficients with Non-coprime Indices*, was published only two days before this audit (27 September 2026). Its accessible abstract studies a different lower-index set but includes `p^t+1` shapes and p-adic valuations. The full theorem text was subscription-only and no open author/preprint copy was found, so Stage 4 must revisit it.

See `notes/prior-art-audit-2.md` for exact hypotheses, theorem/page references, dates/versions, searches, and overlap classifications.

### Pilot reproduction

`experiments/pilot_reproduction.py` independently checks the reconstructed seven-case pilot:

- `(2,1,3,6)`;
- `(3,1,4,12)`;
- `(5,1,6,30)`;
- `(2,2,5,65)`;
- `(2,3,9,513)`;
- `(3,2,10,730)`;
- `(5,2,26,15626)`.

The first three are explicitly preserved by the Session-01 handoff. The handoff says there were seven cases but does not enumerate the other four; this provenance limitation is recorded rather than hidden. The four used here are the small Target-B specializations `(p,a)=(2,2),(2,3),(3,2),(5,2)`.

The scalable implementation is a Kummer borrow DP. It explicitly enforces `m|k`, `0<k<N`, and terminal borrow `0`. Threshold `r_p(m)` is computed by integer powers only. A separate direct Legendre implementation agrees on every admissible row up to each claimed first extremal row, and an actual integer binomial-gcd reference agrees on the stated tractable ranges, including the largest target row.

See `experiments/README.md` and `experiments/pilot-results.txt`.

## Current mathematical status

Target A remains **conjectured in full generality**, with the McTague congruence subcase known.

Target B for `a>=2` remains **conjectured**, with finite experimental support only.

No novelty or uniqueness conclusion has been established.

## Stage-2 gate

**PROCEED.**

## Copy-paste prompt for Session 03

> Continue the Pascal Extremes project from the repository handoff at `jfairfaxball-348/Pascal-Extremes`. Read `AGENTS.md`, `STATUS.md`, `notes/targets.md`, `notes/prior-art-audit-2.md`, `experiments/README.md`, `experiments/pilot-results.txt`, and `notes/session-02-handoff.md` first. This session is Stage 3 only: develop a complete rigorous informal proof of the surviving candidate statements, without starting Lean, Palomar, paper writing, or the final Stage-4 novelty audit. Treat Wu's exact `g(m,n)` family, McTague's Theorem Q, Kummer's theorem, and the known exceptional `(p,m,N)=(2,3,6)` case as prior art with attribution rather than new results. Prove Target A in its full remaining generality or record precisely where it fails; prove existence before using `T_p(m)`; then prove Target B for every prime `p` and `a>=2`, including both attainment at `p^(3a)+1` and strict non-attainment at every smaller admissible row. Keep failed approaches and endpoint/exception checks in `notes/proof.md`. Experiments may be used only for debugging, not as proof. Update `STATUS.md` with exact proof status and create a new handoff for Stage 4 only if there is an exact proved statement ready for final theorem-level uniqueness auditing.
