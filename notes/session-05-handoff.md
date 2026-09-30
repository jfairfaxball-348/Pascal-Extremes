# Session 05 handoff — Stage 5 Lean complete; cleared for Palomar

Date: 2026-09-30

## Scope completed

This session stayed within Stage 5. No Palomar registration, paper writing, or arXiv work was started.

The exact Stage-3 statements cleared by the Stage-4 audit are now formalised in Lean 4 under the repository-pinned toolchain. The formalisation follows the informal proof architecture rather than replacing it with finite computation.

Detailed architecture, provenance, and theorem mapping are in `notes/formalisation-5.md`.

## Formalised results

### Target A

For every prime `p` and `m >= 2` with `p ∤ m`:

- `targetA_upper_witness` formalises the leading-base-`p`-digit selected coefficient giving the universal upper bound.
- `targetA_upper` proves every admissible row has valuation at most `rP p m`.
- `targetA_attainment` constructs an equality row, separating `r=1` from the Stage-3 `A*p^L+c` construction for `r>=2`.
- `targetA` proves the exact maximum statement as an `IsGreatest`.

The extremal-row set is then defined, and only after constructive nonemptiness:

- `extremalRows_nonempty`
- `T_mem_extremalRows`
- `T_isLeast`

establish the existence and leastness properties needed for `T`.

### Target B

For every prime `p` and `a >= 2`:

- `targetB_attainment_witness` uses the exact Stage-3 equality multiplier `p^(2*a-1)`.
- `targetB_attainment` proves valuation `a+1` at `p^(3*a)+1`.
- `targetB_lower_multiplier_witness` formalises the leading split for every smaller multiplier, with the pure-power reduction and the fixed fallback multiplier `p^(a-1)` in the exceptional leading pattern.
- `targetB_lower_nonattainment` proves strict non-attainment at every smaller admissible row.
- `targetB` proves
  [
  T_p(p^a+1)=p^{3a}+1.
  ]

Focused examples include the concrete instance `T 2 5 = 65`.

## Reuse and provenance

The development reuses/adapts only compatible Apache-2.0 ideas from
`jfairfaxball-348/pascal-minus-one@966f8a03416d1e4c276a835698b5a38cb08c769c`.
Provenance is recorded in source comments and `notes/formalisation-5.md`; the predecessor was not copied wholesale.

The known-prior-art boundaries remain unchanged:

- Wu's exact selected-GCD family;
- McTague's `p ≡ 1 (mod m)` Target-A subcase;
- Kummer carry/borrow theory;
- McTague's known `(p,m,N)=(2,3,6)` instance.

The Stage-4 Chung–Yang 2026 caveat also remains unchanged: its full theorem text was not openly inspectable, so novelty relative to that recent adjacent work was not verified.

## Verification

The repository CI performs, from a fresh checkout:

```sh
lake exe cache get
lake build
test "$(grep -R -E '\b(sorry|admit)\b' --include='*.lean' PascalExtremes PascalExtremes.lean | wc -l)" -eq 0
```

Only `.lake/packages` is cached; the project's own build output is not restored. No finite experiment is used as a formal proof step.

## Stage-5 gate

**PROCEED — the exact Stage-3 Target A / T / Target B theorem layer is Lean-formalised and ready for Stage 6 Palomar registration.**

Formalisation and registration do not establish novelty or historical priority.

## Next action

Run **Stage 6 only: Palomar registration**. Do not begin the paper or arXiv work.

Before creating the Palomar-facing package, re-check the current official Palomar submission contract rather than assuming the predecessor's September 25 pins are still current. The predecessor repository contains a useful packaging example, but its registry ID and contract pins belong to that separate project and must not be copied as this project's registration facts.

## Copy-paste prompt for Session 06

Continue the Pascal Extremes project from the repository handoff at `jfairfaxball-348/Pascal-Extremes`.

Read `AGENTS.md`, `STATUS.md`, `notes/targets.md`, `notes/proof.md`, `notes/prior-art-audit-4.md`, `notes/formalisation-5.md`, and `notes/session-05-handoff.md` first. Inspect the completed Lean theorem layer, especially `PascalExtremes/TargetAAttainment.lean`, `PascalExtremes/TargetB.lean`, and `PascalExtremes/TargetBMinimality.lean`.

This session is Stage 6 only: package and register the completed formalisation with Palomar. Do not begin research-paper drafting or arXiv preparation/submission.

First verify the current official Palomar submission / Comparator contract and pin the exact versions or commits actually used. Do not assume that the predecessor project's September 25 Palomar pins are still current. You may inspect `jfairfaxball-348/pascal-minus-one@966f8a03416d1e4c276a835698b5a38cb08c769c` as a packaging example, especially its `Challenge.lean`, `Solution.lean`, `comparator.json`, `formalization.yaml`, Palomar workflows, and packaging audit, but do not copy its registry ID or project-specific claims.

Create the smallest faithful Mathlib-only Palomar Challenge surface for the exact Stage-5 theorem layer. Preserve the mathematical content: Target A's exact maximum theorem with constructive existence preceding `T`, and Target B's exact least-row theorem for every prime `p` and `a>=2`. Choose a Comparator theorem/definition surface that protects all project-specific definitions occurring in the advertised statements; if Palomar packaging is clearer with more than one theorem name, register the exact theorem pair rather than weakening or combining them artificially. The Solution should bridge transparently to the already-proved project theorems instead of reproving the mathematics.

Run the local/predictive Palomar preflight required by the current contract, keep the repository Lean build green, and record all exact commands, pinned contract versions, workflow runs, comparator results, and any Palomar-owned retryable diagnostics. Do not claim registration unless a real registry response supplies an identifier/version. If registration succeeds, record the exact Palomar ID, version, and entry link in a Stage-6 packaging note and `STATUS.md`. If it does not succeed, record the precise blocker without fabricating an identifier.

In `formalization.yaml` and any registration metadata, preserve the Stage-4 wording discipline: formalisation/registration are verification and provenance facts, not evidence of novelty. Attribute Wu's exact family, McTague's `p≡1 mod m` subcase and `(2,3,6)` example, Kummer's theorem, and preserve the explicit Chung–Yang 2026 residual caveat because its full theorem text was not openly inspectable.

Update `STATUS.md`, add a Stage-6 packaging/registration note and a new session handoff, commit the work, and finish with exactly one Stage-6 gate: either PROCEED to the paper stage if a real Palomar registration is complete, or BLOCKED with the exact unresolved registration issue.
