module

public import PascalExtremes.Basic
public import PascalExtremes.Digits
public import Mathlib.NumberTheory.Padics.PadicVal.Basic

@[expose] public section


namespace PascalExtremes

/-!
Kummer/carry bridge, adapted from
`jfairfaxball-348/pascal-minus-one@966f8a0`
(`PascalMinusOne/Kummer.lean`, Apache-2.0). The central valuation theorem is
Mathlib's `padicValNat_choose`.
-/

/-- A carry across the `p^i` boundary in `k + (n-k)`. -/
def CarryAt (p n k i : ℕ) : Prop :=
  p ^ i ≤ k % p ^ i + (n - k) % p ^ i

instance carryAtDecidable (p n k i : ℕ) : Decidable (CarryAt p n k i) := by
  unfold CarryAt
  infer_instance

/-- Number of carries across boundaries `1 ≤ i < b`. -/
def carryCount (p n k b : ℕ) : ℕ :=
  ((Finset.Ico 1 b).filter fun i ↦ CarryAt p n k i).card

/-- Thin wrapper around Mathlib's Kummer theorem `padicValNat_choose`. -/
theorem padicVal_choose_eq_carryCount {p n k b : ℕ} [Fact p.Prime]
    (hkn : k ≤ n) (hnb : Nat.log p n < b) :
    padicValNat p (n.choose k) = carryCount p n k b := by
  simpa [carryCount, CarryAt] using
    (padicValNat_choose (p := p) (n := n) (k := k) (b := b) hkn hnb)

/-- Absence of a carry across `p^i` is exactly prefix comparison modulo
`p^i`. -/
lemma not_carryAt_iff_mod_pow_le {p n k i : ℕ} (hp : 0 < p) (hkn : k ≤ n) :
    ¬ CarryAt p n k i ↔ k % p ^ i ≤ n % p ^ i := by
  unfold CarryAt
  have hpow : 0 < p ^ i := pow_pos hp i
  have hnmod :
      n % p ^ i =
        (k % p ^ i + (n - k) % p ^ i) % p ^ i := by
    calc
      n % p ^ i = (k + (n - k)) % p ^ i := by
        rw [Nat.add_sub_of_le hkn]
      _ = (k % p ^ i + (n - k) % p ^ i) % p ^ i :=
        Nat.add_mod _ _ _
  constructor
  · intro hnocarry
    have hsum :
        k % p ^ i + (n - k) % p ^ i < p ^ i :=
      Nat.lt_of_not_ge hnocarry
    have hnmod' :
        n % p ^ i = k % p ^ i + (n - k) % p ^ i := by
      calc
        n % p ^ i =
            (k % p ^ i + (n - k) % p ^ i) % p ^ i := hnmod
        _ = k % p ^ i + (n - k) % p ^ i := Nat.mod_eq_of_lt hsum
    rw [hnmod']
    exact Nat.le_add_right _ _
  · intro hkmod hcarry
    have hklt : k % p ^ i < p ^ i := Nat.mod_lt _ hpow
    have hrlt : (n - k) % p ^ i < p ^ i := Nat.mod_lt _ hpow
    have hsum_lt_double :
        k % p ^ i + (n - k) % p ^ i < p ^ i + p ^ i :=
      Nat.add_lt_add hklt hrlt
    have hsum_lt_pow_add_k :
        k % p ^ i + (n - k) % p ^ i < p ^ i + k % p ^ i := by
      simpa [Nat.add_comm] using Nat.add_lt_add_left hrlt (k % p ^ i)
    have hsub_lt_pow :
        (k % p ^ i + (n - k) % p ^ i) - p ^ i < p ^ i :=
      Nat.sub_lt_left_of_lt_add hcarry hsum_lt_double
    have hsub_lt_k :
        (k % p ^ i + (n - k) % p ^ i) - p ^ i < k % p ^ i :=
      Nat.sub_lt_left_of_lt_add hcarry hsum_lt_pow_add_k
    have hsum_mod :
        (k % p ^ i + (n - k) % p ^ i) % p ^ i =
          (k % p ^ i + (n - k) % p ^ i) - p ^ i := by
      rw [Nat.mod_eq_sub_mod hcarry, Nat.mod_eq_of_lt hsub_lt_pow]
    have hnmod' :
        n % p ^ i =
          (k % p ^ i + (n - k) % p ^ i) - p ^ i :=
      hnmod.trans hsum_mod
    rw [hnmod'] at hkmod
    exact (Nat.not_le_of_gt hsub_lt_k) hkmod

/-- Residue/borrow form of Kummer's carry predicate. -/
lemma carryAt_iff_mod_pow_lt {p n k i : ℕ} (hp : 0 < p) (hkn : k ≤ n) :
    CarryAt p n k i ↔ n % p ^ i < k % p ^ i := by
  rw [← not_iff_not]
  simpa [not_lt] using
    (not_carryAt_iff_mod_pow_le (p := p) (n := n) (k := k) (i := i) hp hkn)

end PascalExtremes
