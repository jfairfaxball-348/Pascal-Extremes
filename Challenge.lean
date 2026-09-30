module

public import Mathlib

@[expose] public section

/-!
# Pascal Extremes — Palomar statement surface

This is the small Mathlib-only statement surface for the exact Stage-5 theorem
layer. It records Target A's constructive attainment theorem before the least
extremal row is defined, the exact Target-A maximum theorem, and Target B's exact
least-row theorem for every prime `p` and `a >= 2`.

These declarations state verification targets and do not assert historical
novelty or priority.
-/

namespace PascalExtremesPalomar

/-- Positive multiples of `m` strictly below `N`. -/
def admissibleIndices (N m : ℕ) : Finset ℕ :=
  (Finset.range N).filter fun k ↦ 0 < k ∧ m ∣ k

/-- Restricted GCD of the selected binomial coefficients. -/
def G (N m : ℕ) : ℕ :=
  (admissibleIndices N m).gcd fun k ↦ N.choose k

/-- An admissible row for modulus `m`: a proper larger multiple of `m`. -/
def AdmissibleRow (m N : ℕ) : Prop :=
  m < N ∧ m ∣ N

/-- The least positive exponent whose `p`-power is strictly larger than `m`
for the prime/positive cases used below. -/
def rP (p m : ℕ) : ℕ :=
  Nat.log p m + 1

/-- Constructive Target-A attainment. This is stated before `T` is defined. -/
theorem targetA_attainment
    {p m : ℕ} (hp : p.Prime) (hm2 : 2 ≤ m) (hpm : ¬ p ∣ m) :
    ∃ N, AdmissibleRow m N ∧
      padicValNat p (G N m) = rP p m := by
  sorry

/-- Target A: `rP p m` is exactly the maximum selected-GCD `p`-adic
valuation over admissible rows. -/
theorem targetA
    {p m : ℕ} (hp : p.Prime) (hm2 : 2 ≤ m) (hpm : ¬ p ∣ m) :
    IsGreatest
      {v : ℕ | ∃ N, AdmissibleRow m N ∧
        padicValNat p (G N m) = v}
      (rP p m) := by
  sorry

/-- Rows attaining the Target-A maximum. -/
def extremalRows (p m : ℕ) : Set ℕ :=
  {N | AdmissibleRow m N ∧
    padicValNat p (G N m) = rP p m}

/-- Least extremal row, defined only after constructive attainment has been
stated above. -/
noncomputable def T (p m : ℕ) : ℕ :=
  sInf (extremalRows p m)

/-- Target B: for every prime `p` and every `a >= 2`, the first Target-A
extremal row for `m = p^a+1` is exactly `p^(3a)+1`. -/
theorem targetB
    {p a : ℕ} (hp : p.Prime) (ha : 2 ≤ a) :
    T p (p ^ a + 1) = p ^ (3 * a) + 1 := by
  sorry

end PascalExtremesPalomar
