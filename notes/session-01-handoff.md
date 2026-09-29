# Session 01 handoff — Stage 1 complete

Date: 2026-09-29

## Completed in this session

Repository scaffolding and provenance only.

The new repository `jfairfaxball-348/Pascal-Extremes` already existed and was empty. It was scaffolded without overwriting prior work.

The authoritative predecessor inspection is pinned to:

`jfairfaxball-348/pascal-minus-one@966f8a03416d1e4c276a835698b5a38cb08c769c`

Recorded predecessor facts:
- no `AGENTS.md` at the inspected commit;
- Apache License 2.0;
- Lean `v4.35.0-rc2`;
- Mathlib commit `bd6c1abe5f55b6c3856172d6a23703e0888f5286`;
- useful later-stage definitions/lemmas in `PascalMinusOne/Basic.lean`, including `G`, `Admissible`, `G_ne_zero`, and `padicVal_G_eq_of_lower_bound_of_witness`.

The predecessor's literature notes and proof architecture were inspected for provenance only. No theorem from this new project is being marked proved or novel on that basis.

## Not done in this session

- No Stage-2 novelty conclusion.
- No independent pilot reproduction.
- No proof of Target A or Target B.
- No Stage-3 proof work committed.
- No Lean development.
- No Palomar work.
- No paper or arXiv work.

## Exact current mathematical status

Target A: **conjectured**.

Target B: **conjectured**.

The seven pilot observations supplied at kickoff: **reported prior observations; not yet independently reproduced here**.

## Next session objective

Complete Stage 2 and the independent pilot reproduction only. End that session with a PROCEED / REVISE / STOP decision and a new handoff. Do not proceed to the general proof in the same session unless the user explicitly changes the session boundary.

## Copy-paste prompt for Session 02

> Continue the Pascal Extremes project from the repository handoff at `jfairfaxball-348/Pascal-Extremes`. Read `AGENTS.md`, `STATUS.md`, `notes/targets.md`, and `notes/session-01-handoff.md` first. This session is limited to Stage 2 plus independent reproduction of the stated seven-case pilot. Conduct the detailed theorem-level prior-art audit specified in the original kickoff, using primary sources and equivalent formulations; record exact hypotheses, theorem/page references, dates/versions, overlaps, unresolved equivalences, and searches in `notes/prior-art-audit-2.md`. Independently rebuild the exact pilot computation under `experiments/`, with a scalable carry/borrow DP and a genuinely independent direct Legendre/binomial-gcd reference implementation on tractable cases; explicitly enforce `m|k`, `0<k<N`, valid termination, and integer-power thresholds. Preserve code, outputs, ranges, exclusions, and provenance. Finish with exactly one Stage-2 gate result: PROCEED, REVISE, or STOP, update `STATUS.md`, commit the work, and create a new session handoff with a copy-paste prompt for Stage 3 if and only if the gate is PROCEED. Do not begin the general proof in this session.
