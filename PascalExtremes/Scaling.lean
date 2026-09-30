module

public import PascalExtremes.Basic
public import Mathlib.Data.Nat.Digits.Lemmas
public import Mathlib.NumberTheory.Padics.PadicVal.Basic

public section


namespace PascalExtremes

/-!
A single scaling lemma adapted from
`jfairfaxball-348/pascal-minus-one@966f8a0`
(`PascalMinusOne/Scaling.lean`, Apache-2.0).
-/

private theorem digitSum_pow_mul
    {p c n : ℕ} (hp : p.Prime) :
    (Nat.digits p (p ^ c * n)).sum = (Nat.digits p n).sum := by
  by_cases hn : n = 0
  · subst n
    simp
  · rw [Nat.digits_base_pow_mul hp.one_lt (Nat.pos_of_ne_zero hn), List.sum_append]
    simp

/-- Multiplying both entries of a binomial coefficient by the same power of
`p` preserves its `p`-adic valuation. -/
theorem padicVal_choose_pow_mul
    {p c n k : ℕ} (hp : p.Prime) (hkn : k ≤ n) :
    padicValNat p ((p ^ c * n).choose (p ^ c * k)) =
      padicValNat p (n.choose k) := by
  letI : Fact p.Prime := ⟨hp⟩
  have hscaled : p ^ c * k ≤ p ^ c * n := Nat.mul_le_mul_left _ hkn
  have hs :=
    sub_one_mul_padicValNat_choose_eq_sub_sum_digits (p := p) hscaled
  have hu :=
    sub_one_mul_padicValNat_choose_eq_sub_sum_digits (p := p) hkn
  rw [← Nat.mul_sub_left_distrib,
    digitSum_pow_mul hp, digitSum_pow_mul hp, digitSum_pow_mul hp] at hs
  apply Nat.mul_left_cancel (Nat.sub_pos_of_lt hp.one_lt)
  exact hs.trans hu.symm

end PascalExtremes
