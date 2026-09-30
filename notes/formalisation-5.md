# Stage 5 Lean formalisation

Date: 2026-09-30

## Scope

This note records the Lean 4 formalisation of the exact Stage-3 theorem statements cleared by the Stage-4 audit. It does not make a novelty claim and does not change the prior-art conclusions in `notes/prior-art-audit-4.md`.

The toolchain remains the repository-pinned Lean `v4.35.0-rc2` and Mathlib `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.

## Public theorem layer

The principal public declarations are:

- `targetA_upper_witness`: formal leading-base-`p`-digit witness giving the universal Target-A upper bound.
- `targetA_upper`: every admissible row has restricted-GCD valuation at most `rP p m`.
- `targetA_attainment`: constructive existence of an admissible row attaining `rP p m`.
- `targetA`: exact maximum formulation of Target A.
- `extremalRows_nonempty`, `T_mem_extremalRows`, `T_isLeast`: existence and well-ordering facts establishing `T` only after attainment has been proved.
- `targetB_attainment_witness`: the exact Stage-3 equality witness with multiplier `p^(2*a-1)`.
- `targetB_attainment`: valuation `a+1` at row `p^(3*a)+1`.
- `targetB_lower_multiplier_witness`: for every smaller multiplier, an explicit selected coefficient of valuation at most `a`, using the Stage-3 leading split and fallback case.
- `targetB_lower_nonattainment`: every smaller admissible row has restricted-GCD valuation at most `a`.
- `targetB`: for every prime `p` and `a >= 2`,
  `T p (p^a + 1) = p^(3*a) + 1`.

## Proof architecture

Target A follows the informal proof rather than replacing it with a finite search. The upper-bound proof splits the row multiplier at its leading base-`p` digit and constructs a selected coefficient with a bounded Kummer carry count. Sharpness is constructive: the `r=1` case is separated, while `r>=2` uses the Stage-3 equality-row construction after arranging the required power congruence. This proves extremal-row existence before the least extremal row `T` is used.

Target B also follows the Stage-3 architecture. At the proposed row, every selected coefficient is forced to carry at levels `2a,...,3a`; the explicit multiplier `p^(2a-1)` has no lower carries and therefore gives equality. For smaller multipliers, the formal proof uses the leading split in base `p`; the pure-power branch is reduced by a power-scaling lemma, the ordinary branch uses a common-suffix carry bound, and the unique worst leading pattern switches to the fixed fallback multiplier `p^(a-1)`.

## Provenance

Compatible low-level infrastructure was adapted from the Apache-2.0 predecessor `jfairfaxball-348/pascal-minus-one@966f8a03416d1e4c276a835698b5a38cb08c769c` rather than copied wholesale. Source comments identify the reused/adapted material; in particular `Scaling.lean` records the provenance of its single scaling lemma.

Kummer's theorem, Mathlib's `padicValNat` theory, and ordinary digit/arithmetic lemmas are library/prior-art infrastructure. Wu's exact selected-GCD family, McTague's `p ≡ 1 (mod m)` subcase, and McTague's `(p,m,N)=(2,3,6)` example remain prior art exactly as recorded in the Stage-4 audit.

## Trust boundary and checks

No finite experiment is used as a Lean proof step. No theorem-specific axiom, `sorry`, or `admit` is introduced. The CI workflow builds the project from a fresh checkout and then rejects any `sorry` or `admit` token in the project Lean sources.

Focused examples include `rP 2 5 = 3`, `q0 2 2 = 13`, and the concrete Target-B instance `T 2 5 = 65`.

The Stage-4 Chung–Yang 2026 caveat is unchanged: its full theorem text was not openly inspectable, so novelty relative to that very recent adjacent work was not verified. Formalisation is verification, not evidence of novelty or historical priority.
