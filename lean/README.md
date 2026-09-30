# Lean formalisation

Stage 5 is implemented in the root Lean project using the repository-pinned Lean 4 / Mathlib toolchain.

Main modules:

- `PascalExtremes/Basic.lean`: selected-binomial GCD, admissibility, valuation-of-GCD bridge, and `rP`.
- `PascalExtremes/Kummer.lean`, `Digits.lean`, `Powers.lean`, `CarryBounds.lean`: carry/digit infrastructure.
- `PascalExtremes/TargetA.lean`: leading-base-`p`-digit upper witness and universal bound.
- `PascalExtremes/TargetAAttainment.lean`: constructive equality rows, exact maximum theorem `targetA`, nonempty extremal rows, and least-row object `T` with membership/minimality theorems.
- `PascalExtremes/TargetB.lean`: target-row arithmetic, all-selected lower bound, explicit equality witness `p^(2a-1)`, and target-row attainment.
- `PascalExtremes/TargetBMinimality.lean`: pure-power branch, leading-split witness, exceptional fallback `p^(a-1)`, strict lower-row non-attainment, and final theorem `targetB`.
- `PascalExtremes/Scaling.lean`: a small adapted power-scaling lemma, with predecessor provenance in the source.
- `PascalExtremes/Examples.lean`: focused executable examples, including `T 2 5 = 65`.

The project root `PascalExtremes.lean` imports every formalisation module.

Verification from a fresh checkout:

```sh
lake exe cache get
lake build
test "$(grep -R -E '\b(sorry|admit)\b' --include='*.lean' PascalExtremes PascalExtremes.lean | wc -l)" -eq 0
```

GitHub Actions checks the same build and explicit proof-gap scan. Only `.lake/packages` is cached; the repository's own `.lake/build` is not cached, so the project build occurs from a fresh checkout.

See `notes/formalisation-5.md` for the theorem map, proof architecture, provenance, and trust-boundary notes.
