# Definitions and theorem candidates

For integers `m >= 2` and `N > m` with `m | N`, define

[
G(N;m)=\gcd\{\binom Nk:0<k<N,\ m\mid k\}.
]

For prime `p`, let `v_p` be the p-adic valuation.

To avoid floating-point logarithms, define

[
r_p(m)=\min\{r\ge 1:m<p^r\}.
]

When `p ∤ m`, this equals `ceil(log_p m)`.

## Target A — sharp maximum

For prime `p`, `m>=2`, and `p∤m`:

[
\max_{N>m,,m\mid N} v_p(G(N;m))=r_p(m).
]

At scaffold time this is **conjectured** pending independent audit and proof.

## Least extremal row

Once Target A is established, define

[
T_p(m)=\min\{N>m:m\mid N, v_p(G(N;m))=r_p(m)\}.
]

Existence must be proved before using this minimum.

## Target B — preferred main theorem

For every prime `p` and every integer `a>=2`:

[
T_p(p^a+1)=p^{3a}+1.
]

Equivalently, for `m=p^a+1`:
- `v_p(G(p^(3a)+1;m))=a+1`;
- every admissible `m<N<p^(3a)+1` has `v_p(G(N;m))<=a`.

At scaffold time this is **conjectured**.

The identity
[
p^{3a}+1=(p^a+1)(p^{2a}-p^a+1)
]
identifies the proposed multiplier with `Phi_6(p^a)`; this elementary identity is not a novelty claim.

## Exceptional a=1

The kickoff observations reported first extremal rows 6, 12, 30 for p=2,3,5. This regime is to be proved separately rather than folded into Target B.
