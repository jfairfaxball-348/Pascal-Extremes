import PascalExtremes.Kummer
import Mathlib.Data.Nat.Log
import Mathlib.Tactic

namespace PascalExtremes

/-- One actual carry gives positive `p`-adic valuation. -/
theorem one_le_padicVal_choose_of_carry
    {p n k i : ℕ} (hp : p.Prime) (hkn : k ≤ n) (hi : 1 ≤ i)
    (hcarry : CarryAt p n k i) :
    1 ≤ padicValNat p (n.choose k) := by
  letI : Fact p.Prime := ⟨hp⟩
  let b := max (Nat.log p n + 1) (i + 1)
  have hnb : Nat.log p n < b := by
    dsimp [b]
    exact lt_of_lt_of_le (Nat.lt_succ_self _) (le_max_left _ _)
  rw [padicVal_choose_eq_carryCount hkn hnb, carryCount]
  apply Finset.card_pos.mpr
  refine ⟨i, ?_⟩
  simp only [Finset.mem_filter, Finset.mem_Ico]
  refine ⟨⟨hi, ?_⟩, hcarry⟩
  dsimp [b]
  exact lt_of_lt_of_le (Nat.lt_succ_self _) (le_max_right _ _)

/-- If the row and selected index have the same lower `t` base-`p`
digits, and the remaining upper part of the row is below `p^(r+1)`,
then Kummer gives at most `r` carries. This is the formal counterpart of
the shifted leading-digit estimate used repeatedly in Stage 3. -/
theorem padicVal_choose_le_of_common_suffix
    {p n k u t s x r : ℕ} (hp : p.Prime)
    (hnpos : 0 < n) (hkn : k ≤ n)
    (hu : u < p ^ t)
    (hn : n = u + p ^ t * s)
    (hk : k = u + p ^ t * x)
    (hxs : x ≤ s)
    (hs : s < p ^ (r + 1)) :
    padicValNat p (n.choose k) ≤ r := by
  letI : Fact p.Prime := ⟨hp⟩
  have hpt : 0 < p ^ t := pow_pos hp.pos t
  have hsp : s + 1 ≤ p ^ (r + 1) := Nat.succ_le_iff.mpr hs
  have hnBound : n < p ^ (t + r + 1) := by
    rw [hn]
    calc
      u + p ^ t * s < p ^ t + p ^ t * s :=
        Nat.add_lt_add_right hu _
      _ = p ^ t * (s + 1) := by
        rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
      _ ≤ p ^ t * p ^ (r + 1) :=
        Nat.mul_le_mul_left _ hsp
      _ = p ^ (t + r + 1) := by
        rw [← pow_add]
        congr 1
  have hlog : Nat.log p n < t + r + 1 :=
    (Nat.log_lt_iff_lt_pow hp.one_lt (Nat.ne_of_gt hnpos)).2 hnBound
  rw [padicVal_choose_eq_carryCount hkn hlog, carryCount]
  let F := (Finset.Ico 1 (t + r + 1)).filter fun i ↦ CarryAt p n k i
  have hsub : F ⊆ Finset.Ico (t + 1) (t + r + 1) := by
    intro i hi
    have hi' := Finset.mem_filter.mp hi
    have hiRange := hi'.1
    have hiCarry := hi'.2
    simp only [Finset.mem_Ico] at hiRange ⊢
    refine ⟨?_, hiRange.2⟩
    by_contra hnot
    have hit : i ≤ t := by omega
    have hdvd : p ^ i ∣ p ^ t := Nat.pow_dvd_pow p hit
    have hnmod : n % p ^ i = u % p ^ i := by
      rw [hn, Nat.add_mod, Nat.mod_eq_zero_of_dvd
        (dvd_mul_of_dvd_left hdvd s), add_zero, Nat.mod_mod]
    have hkmod : k % p ^ i = u % p ^ i := by
      rw [hk, Nat.add_mod, Nat.mod_eq_zero_of_dvd
        (dvd_mul_of_dvd_left hdvd x), add_zero, Nat.mod_mod]
    have hno : ¬ CarryAt p n k i :=
      (not_carryAt_iff_mod_pow_le hp.pos hkn).2 (by simp [hnmod, hkmod])
    exact hno hiCarry
  have hcard := Finset.card_le_card hsub
  change F.card ≤ r
  calc
    F.card ≤ (Finset.Ico (t + 1) (t + r + 1)).card := hcard
    _ = r := by
      simp

end PascalExtremes
