#!/usr/bin/env python3
"""Independent Stage-2 reproduction of the Pascal Extremes seven-case pilot.

The scalable implementation minimizes Kummer borrows with a digit DP.
The independent reference computes p-adic valuations via Legendre's formula,
and, on a tractable range, computes the actual gcd of integer binomial
coefficients.

All index loops are exactly over k = m, 2m, ..., N-m, so they enforce
m | k and 0 < k < N.  The DP accepts only terminal states with borrow = 0.
No floating-point logarithms are used.
"""

from __future__ import annotations

from dataclasses import dataclass
from functools import reduce
from math import comb, gcd
from pathlib import Path
import hashlib
import platform


INF = 10**18


@dataclass(frozen=True)
class PilotCase:
    p: int
    a: int
    m: int
    expected_N: int
    provenance: str


CASES = (
    PilotCase(2, 1, 3, 6, "session-01 handoff: exceptional a=1 row"),
    PilotCase(3, 1, 4, 12, "session-01 handoff: exceptional a=1 row"),
    PilotCase(5, 1, 6, 30, "session-01 handoff: exceptional a=1 row"),
    PilotCase(2, 2, 5, 65, "Target B specialization"),
    PilotCase(2, 3, 9, 513, "Target B specialization"),
    PilotCase(3, 2, 10, 730, "Target B specialization"),
    PilotCase(5, 2, 26, 15626, "Target B specialization"),
)


def is_prime(n: int) -> bool:
    if n < 2:
        return False
    d = 2
    while d * d <= n:
        if n % d == 0:
            return n == d
        d += 1
    return True


def integer_threshold_r(p: int, m: int) -> int:
    """Return min r>=1 with m < p**r, using integer powers only."""
    assert is_prime(p)
    assert m >= 2
    r = 1
    power = p
    while power <= m:
        power *= p
        r += 1
    assert p ** (r - 1) <= m < p**r
    return r


def base_p_digits(n: int, p: int) -> list[int]:
    assert n >= 0 and p >= 2
    if n == 0:
        return [0]
    out: list[int] = []
    while n:
        out.append(n % p)
        n //= p
    return out


def vp_g_dp(N: int, m: int, p: int) -> int:
    """Compute v_p(G(N;m)) as the minimum Kummer borrow count.

    State = (k mod m, borrow, seen_nonzero_digit, differs_from_N_prefix).
    Digits are processed from least significant to most significant.

    The final filter enforces:
      * residue == 0: m | k;
      * borrow == 0: subtraction N-k terminates validly;
      * seen_nonzero: k > 0;
      * differs: k != N.

    Because k uses no digits beyond N's most significant digit and terminal
    borrow is zero, k <= N; together with differs this gives k < N.
    """
    assert N > m >= 2
    assert N % m == 0
    assert is_prime(p)

    digits = base_p_digits(N, p)
    # Values are minimal accumulated borrow counts.
    states: dict[tuple[int, int, bool, bool], int] = {(0, 0, False, False): 0}
    place_mod = 1 % m

    for n_digit in digits:
        nxt: dict[tuple[int, int, bool, bool], int] = {}
        for (residue, borrow, seen_nonzero, differs), cost in states.items():
            for k_digit in range(p):
                new_borrow = 1 if k_digit + borrow > n_digit else 0
                new_residue = (residue + k_digit * place_mod) % m
                key = (
                    new_residue,
                    new_borrow,
                    seen_nonzero or (k_digit != 0),
                    differs or (k_digit != n_digit),
                )
                new_cost = cost + new_borrow
                if new_cost < nxt.get(key, INF):
                    nxt[key] = new_cost
        states = nxt
        place_mod = (place_mod * p) % m

    answer = states.get((0, 0, True, True), INF)
    if answer == INF:
        raise AssertionError(f"no admissible k for N={N}, m={m}")
    return answer


def vp_factorial_legendre(n: int, p: int) -> int:
    """Legendre: v_p(n!) = floor(n/p)+floor(n/p^2)+..."""
    total = 0
    while n:
        n //= p
        total += n
    return total


def vp_binom_legendre(N: int, k: int, p: int) -> int:
    assert 0 <= k <= N
    return (
        vp_factorial_legendre(N, p)
        - vp_factorial_legendre(k, p)
        - vp_factorial_legendre(N - k, p)
    )


def vp_g_direct_legendre(N: int, m: int, p: int) -> int:
    """Independent direct reference over k=m,2m,...,N-m."""
    assert N > m >= 2 and N % m == 0
    vals = [vp_binom_legendre(N, k, p) for k in range(m, N, m)]
    assert vals, "N>m and m|N should provide at least one interior multiple"
    return min(vals)


def vp_integer(x: int, p: int) -> int:
    assert x > 0
    v = 0
    while x % p == 0:
        x //= p
        v += 1
    return v


def vp_g_actual_binomial_gcd(N: int, m: int, p: int) -> int:
    """Reference using actual integer binomial coefficients and gcd."""
    assert N > m >= 2 and N % m == 0
    g = 0
    count = 0
    for k in range(m, N, m):
        # This loop itself enforces m|k and 0<k<N.
        g = gcd(g, comb(N, k))
        count += 1
        if g == 1:
            break
    assert count >= 1 and g >= 1
    return vp_integer(g, p)


def check_case(case: PilotCase) -> dict[str, object]:
    p, a, m, expected_N = case.p, case.a, case.m, case.expected_N
    assert m == p**a + 1
    assert expected_N % m == 0
    if a >= 2:
        assert expected_N == p ** (3 * a) + 1

    r = integer_threshold_r(p, m)
    expected_q = expected_N // m

    first_q = None
    first_v = None
    pre_max: int | None = None
    pre_arg: int | None = None
    legendre_rows = 0
    for q in range(2, expected_q + 1):
        N = m * q
        v_dp = vp_g_dp(N, m, p)
        v_ref = vp_g_direct_legendre(N, m, p)
        assert v_dp == v_ref, (case, q, v_dp, v_ref)
        legendre_rows += 1
        if q < expected_q and (pre_max is None or v_dp > pre_max):
            pre_max = v_dp
            pre_arg = N
        if v_dp == r and first_q is None:
            first_q, first_v = q, v_dp

    assert first_q == expected_q, (case, first_q, expected_q)
    assert first_v == r

    # Genuinely independent actual-gcd checks.  For rows through 1000 we
    # check every admissible row; for a larger target we additionally check
    # the target row itself.
    actual_q_max = min(expected_q, 1000 // m)
    actual_rows = 0
    for q in range(2, actual_q_max + 1):
        N = m * q
        v_dp = vp_g_dp(N, m, p)
        v_gcd = vp_g_actual_binomial_gcd(N, m, p)
        assert v_dp == v_gcd, (case, q, v_dp, v_gcd)
        actual_rows += 1

    target_extra = expected_q > actual_q_max
    if target_extra:
        v_dp = vp_g_dp(expected_N, m, p)
        v_gcd = vp_g_actual_binomial_gcd(expected_N, m, p)
        assert v_dp == v_gcd, (case, expected_q, v_dp, v_gcd)
        actual_rows += 1

    return {
        "p": p,
        "a": a,
        "m": m,
        "r": r,
        "expected_N": expected_N,
        "expected_q": expected_q,
        "first_N": m * first_q,
        "first_q": first_q,
        "target_v": first_v,
        "pre_max": pre_max,
        "pre_arg": pre_arg,
        "legendre_q_range": f"2..{expected_q}",
        "legendre_rows": legendre_rows,
        "actual_q_range": f"2..{actual_q_max}" if actual_q_max >= 2 else "none",
        "actual_target_extra": target_extra,
        "actual_rows": actual_rows,
    }


def main() -> None:
    script_hash = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    print("Pascal Extremes — Stage-2 seven-case pilot reproduction")
    print(f"Python: {platform.python_version()}")
    print(f"script_sha256: {script_hash}")
    print("arithmetic: exact Python integers; no floating-point logarithms")
    print("DP constraints: m|k; 0<k<N; terminal borrow=0")
    print("direct reference: Legendre valuations over every k=m,2m,...,N-m")
    print("actual-gcd reference: math.comb + math.gcd on stated tractable ranges")
    print()

    for case in CASES:
        result = check_case(case)
        pre_desc = (
            "no earlier admissible row"
            if result["pre_max"] is None
            else f"pre-target max={result['pre_max']} at N={result['pre_arg']}"
        )
        print(
            "case "
            f"p={result['p']} a={result['a']} m={result['m']} r={result['r']}: "
            f"first extremal N={result['first_N']} (q={result['first_q']}), "
            f"v_p(G)={result['target_v']}; {pre_desc}"
        )
        print(
            f"  DP = direct Legendre for q={result['legendre_q_range']} "
            f"({result['legendre_rows']} admissible rows)."
        )
        extra = "; plus target row" if result["actual_target_extra"] else ""
        print(
            f"  DP = actual binomial-gcd for q={result['actual_q_range']}"
            f"{extra} ({result['actual_rows']} checked rows)."
        )

    print()
    print("RESULT: all seven reconstructed pilot cases reproduced exactly.")
    print("NOTE: the durable Session-01 handoff records the three a=1 rows but")
    print("does not enumerate the four a>=2 pilot tuples; those four are the")
    print("Target-B specializations (2,2), (2,3), (3,2), (5,2) used here.")


if __name__ == "__main__":
    main()
