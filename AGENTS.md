# Pascal Extremes — research workflow

This repository is an original mathematics project on restricted binomial gcds. Maintain the following stage order and do not silently skip gates:

1. scaffold and provenance;
2. detailed prior-art / novelty audit;
3. informal mathematical proof;
4. final theorem-level uniqueness / novelty audit;
5. Lean formalisation;
6. Palomar registration;
7. research paper;
8. arXiv preparation/submission.

## Research standards

Use explicit status language: **conjectured**, **experimentally checked in a stated range**, **proved informally**, **formalised**, **registered**, **submitted**. Never infer novelty from experiments, a proof, Lean, Palomar, or absence of an exact phrase in a search.

A negative literature search supports only wording such as “no equivalent result located in the documented search”; it does not prove historical uniqueness. If a theorem is known or routine, attribute it and distinguish it from the candidate contribution.

Experiments use exact integer arithmetic and stay outside the proof/formal trust boundary. Efficient algorithms must be checked against an independent direct implementation on tractable ranges. Exclude k=0 and k=N explicitly.

Do not begin substantial Lean development before Stage 4 has cleared the exact proved statement. Do not begin the full paper before Palomar registration. Do not claim Palomar acceptance, arXiv submission, an identifier, affiliation, coauthor, endorsement, or human declaration without evidence.

## Provenance

The predecessor repository is `jfairfaxball-348/pascal-minus-one`. The kickoff inspection is pinned to commit:

`966f8a03416d1e4c276a835698b5a38cb08c769c`

At that commit:
- no `AGENTS.md` was present;
- the licence is Apache-2.0;
- Lean is `v4.35.0-rc2`;
- Mathlib is pinned to `bd6c1abe5f55b6c3856172d6a23703e0888f5286`;
- reusable later-stage infrastructure includes `G`, `Admissible`, `G_ne_zero`, and `padicVal_G_eq_of_lower_bound_of_witness`.

Reuse compatible ideas/lemmas with attribution; do not copy the predecessor wholesale.

## Continuation

Read `STATUS.md` first. It records completed gates, exact theorem status, current blockers, and the next action. Treat the current repository, not chat recollection, as the durable handoff.
