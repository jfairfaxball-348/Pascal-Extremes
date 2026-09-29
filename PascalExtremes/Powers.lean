import Mathlib.Data.Nat.Log

namespace PascalExtremes

/-- The least positive exponent whose `p`-power is strictly larger than `m`.
For prime `p` and positive `m`, this is `Nat.log p m + 1`. -/
def rP (p m : ℕ) : ℕ :=
  Nat.log p m + 1

theorem one_le_rP (p m : ℕ) : 1 ≤ rP p m := by
  simp [rP]

theorem lt_pow_rP {p m : ℕ} (hp : 1 < p) :
    m < p ^ rP p m := by
  simpa [rP, Nat.succ_eq_add_one] using Nat.lt_pow_succ_log_self hp m

theorem rP_le_of_lt_pow {p m s : ℕ} (hp : 1 < p) (hm : m ≠ 0)
    (h : m < p ^ s) :
    rP p m ≤ s := by
  have hlog : Nat.log p m < s :=
    (Nat.log_lt_iff_lt_pow hp hm).2 h
  simpa [rP, Nat.succ_le_iff] using hlog

/-- `rP p m` realizes the minimum definition used in the project notes. -/
theorem rP_isLeast {p m : ℕ} (hp : 1 < p) (hm : m ≠ 0) :
    IsLeast {r : ℕ | 1 ≤ r ∧ m < p ^ r} (rP p m) := by
  refine ⟨⟨one_le_rP p m, lt_pow_rP hp⟩, ?_⟩
  intro s hs
  exact rP_le_of_lt_pow hp hm hs.2

theorem pow_pred_rP_le {p m : ℕ} (hm : m ≠ 0) :
    p ^ (rP p m - 1) ≤ m := by
  simpa [rP] using Nat.pow_log_le_self p hm

theorem rP_pow_add_one {p a : ℕ} (hp : 1 < p) (ha : 1 ≤ a) :
    rP p (p ^ a + 1) = a + 1 := by
  have hpPow : p ^ a < p ^ (a + 1) :=
    Nat.pow_lt_pow_right hp (Nat.lt_succ_self a)
  have hgap : p ^ a + 1 < p ^ (a + 1) := by
    have hpowpos : 0 < p ^ a := pow_pos (Nat.zero_lt_of_lt hp) a
    rw [pow_succ]
    have hp2 : 2 ≤ p := hp
    nlinarith
  have hlog :
      Nat.log p (p ^ a + 1) = a :=
    Nat.log_eq_of_pow_le_of_lt_pow (Nat.le_add_right _ _) hgap
  simp [rP, hlog]

end PascalExtremes
