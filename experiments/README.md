# Experiments

Exact reproducible computations live here. They are evidence/debugging aids only and do not establish a general proof or novelty.

## Stage-2 pilot reproduction

Run from the repository root:

```bash
python3 experiments/pilot_reproduction.py
```

The committed output is `experiments/pilot-results.txt`.

### Provenance of the seven cases

The durable Session-01 handoff explicitly preserves the three exceptional `a=1` rows:

- `(p,a,m,N)=(2,1,3,6)`;
- `(3,1,4,12)`;
- `(5,1,6,30)`.

It says there were seven kickoff pilot observations but does **not** persist the literal four remaining tuples. For reproducibility, this session reconstructs those four from the small Target-B specializations used in the pilot:

- `(2,2,5,65)`;
- `(2,3,9,513)`;
- `(3,2,10,730)`;
- `(5,2,26,15626)`.

The output labels this provenance gap rather than pretending the missing literal list was recovered from the repository.

### Fast implementation: Kummer borrow DP

`vp_g_dp(N,m,p)` performs a least-cost digit DP over the base-`p` digits of `N`. A state stores

- `k mod m`;
- the current subtraction borrow bit;
- whether a nonzero digit of `k` has appeared;
- whether the processed digits differ from those of `N`.

The transition tries every base-`p` digit of `k` and charges one for each borrow. The terminal filter requires

- residue `0`, enforcing `m | k`;
- borrow `0`, so subtraction terminates without an outstanding borrow;
- a nonzero digit, enforcing `k>0`;
- `k != N`.

Because no digits beyond the most significant digit of `N` are introduced and the terminal borrow is zero, `k<=N`; together with `k!=N` this enforces `k<N`.

The state space is `O(m)` times a constant set of flags per processed base-`p` digit, with `p` digit transitions, so it scales with digit length rather than enumerating every admissible `k`.

### Independent references

The script contains two references deliberately independent of the DP transition logic:

1. `vp_g_direct_legendre` loops directly over exactly `k=m,2m,...,N-m` and evaluates each binomial valuation by Legendre's factorial formula. For every one of the seven cases, this checks **every admissible row** `N=mq` from `q=2` through the claimed first extremal row.
2. `vp_g_actual_binomial_gcd` constructs actual integer `math.comb(N,k)` values and their `math.gcd`, then takes the p-adic valuation of that integer gcd. It checks every admissible row through `N<=1000`; for the large `(5,2,26)` case it additionally checks the target row `N=15626` itself.

All arithmetic is exact Python integer arithmetic.

### Integer-power threshold

`integer_threshold_r(p,m)` computes

`min { r>=1 : m < p**r }`

by repeated multiplication. No floating-point logarithms are used.

### Recorded ranges

The committed output records, case by case, the full DP/Legendre `q` range and the direct integer-gcd range. In particular, for `(p,a,m)=(5,2,26)`, DP and Legendre agree for all `q=2..601` (600 admissible rows), and the actual-binomial gcd reference checks `q=2..38` plus the target `q=601`.
