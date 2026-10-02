# Pascal Extremes

Research project on sharp prime-power divisibility and least extremal rows for restricted binomial gcds.

For integers `m >= 2` and `N > m` with `m | N`, define

[
G(N;m)=\gcd\left\{\binom Nk:0<k<N,\ m\mid k\right\}.
]

For a prime `p`, the project studies the maximum possible value of `v_p(G(N;m))` and the least admissible row attaining it.

## Current status

- **Stage 1 — repository scaffold/provenance: COMPLETE.**
- **Stage 2 — detailed prior-art audit and independent pilot reproduction: COMPLETE. Gate: PROCEED.**
- **Stage 3 — rigorous informal proof: COMPLETE.** Target A is proved in its stated generality, and Target B is proved for every prime `p` and every `a >= 2`.
- **Stage 4 — final theorem-level novelty audit: COMPLETE. Gate: PROCEED.** Known overlaps are recorded and attributed; no global novelty or priority claim is made.
- **Stage 5 — Lean formalisation: COMPLETE. Gate: PROCEED.** The selected Target A and Target B statements, including extremal-row existence/minimality, are formalised and build without `sorry`/`admit`.
- **Stage 6 — Palomar registration: COMPLETE. Gate: PROCEED.** Registered as **PALOMAR-2026-09-30-000033**, version **1**.
- **Stage 7 — paper: COMPLETE. Gate: PROCEED.** The final manuscript is 13 pages and is maintained under `paper/`.
- **Stage 8 — arXiv submission/public posting: COMPLETE.** The paper is public as **arXiv:2610.01328 [math.NT]**, version **v1**, submitted on **2026-10-01**, under **CC BY 4.0**: https://arxiv.org/abs/2610.01328

Formal verification, Palomar registration, and arXiv publication are distinct provenance records. Experiments are not used as proof evidence. Novelty/priority is not asserted: the documented Stage-4 search found no equivalent result for the surviving exact statements, while the recent Chung–Yang 2026 paper remains an explicit residual caveat because its full theorem text was not openly inspectable during the audit.

See `STATUS.md`, `notes/targets.md`, `notes/proof.md`, `notes/prior-art-audit-4.md`, `notes/formalisation-5.md`, `notes/palomar-packaging-6.md`, `notes/session-08-handoff.md`, and `paper/README.md`.

## Provenance

The predecessor project is [jfairfaxball-348/pascal-minus-one](https://github.com/jfairfaxball-348/pascal-minus-one). The Stage-1 inspection is pinned to predecessor commit `966f8a03416d1e4c276a835698b5a38cb08c769c`.

## Session discipline

Major stages are intentionally split across sessions. Each session ends with a durable repository handoff and a copy-paste kickoff prompt for the next session.

## Licence

Apache License 2.0.
