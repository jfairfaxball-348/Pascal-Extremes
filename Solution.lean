module

public import PascalExtremes

@[expose] public section

/-!
# Pascal Extremes — Palomar proved surface

The definitions and theorem statements are repeated exactly from
`Challenge.lean`. Proofs bridge transparently to the completed project
theorems; no mathematics is reproved here.
-/

namespace PascalExtremesPalomar

def admissibleIndices (N m : ℕ) : Finset ℕ :=
  (Finset.range N).filter fun k ↦ 0 < k ∧ m ∣ k

def G (N m : ℕ) : ℕ :=
  (admissibleIndices N m).gcd fun k ↦ N.choose k

def AdmissibleRow (m N : ℕ) : Prop :=
  m < N ∧ m ∣ N

def rP (p m : ℕ) : ℕ :=
  Nat.log p m + 1

theorem targetA_attainment
    {p m : ℕ} (hp : p.Prime) (hm2 : 2 ≤ m) (hpm : ¬ p ∣ m) :
    ∃ N, AdmissibleRow m N ∧
      padicValNat p (G N m) = rP p m := by
  simpa only [AdmissibleRow, G, admissibleIndices, rP,
    PascalExtremes.AdmissibleRow, PascalExtremes.G,
    PascalExtremes.admissibleIndices, PascalExtremes.rP] using
    (PascalExtremes.targetA_attainment hp hm2 hpm)

theorem targetA
    {p m : ℕ} (hp : p.Prime) (hm2 : 2 ≤ m) (hpm : ¬ p ∣ m) :
    IsGreatest
      {v : ℕ | ∃ N, AdmissibleRow m N ∧
        padicValNat p (G N m) = v}
      (rP p m) := by
  simpa only [AdmissibleRow, G, admissibleIndices, rP,
    PascalExtremes.AdmissibleRow, PascalExtremes.G,
    PascalExtremes.admissibleIndices, PascalExtremes.rP] using
    (PascalExtremes.targetA hp hm2 hpm)

def extremalRows (p m : ℕ) : Set ℕ :=
  {N | AdmissibleRow m N ∧
    padicValNat p (G N m) = rP p m}

noncomputable def T (p m : ℕ) : ℕ :=
  sInf (extremalRows p m)

theorem targetB
    {p a : ℕ} (hp : p.Prime) (ha : 2 ≤ a) :
    T p (p ^ a + 1) = p ^ (3 * a) + 1 := by
  simpa only [T, extremalRows, AdmissibleRow, G, admissibleIndices, rP,
    PascalExtremes.T, PascalExtremes.extremalRows,
    PascalExtremes.AdmissibleRow, PascalExtremes.G,
    PascalExtremes.admissibleIndices, PascalExtremes.rP] using
    (PascalExtremes.targetB hp ha)

end PascalExtremesPalomar
