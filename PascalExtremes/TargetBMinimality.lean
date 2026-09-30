import PascalExtremes.TargetB
import PascalExtremes.Scaling
import Mathlib

namespace PascalExtremes

private theorem base_pure_power_choose_le_two
    {p a : ℕ} (hp : p.Prime) (ha : 2 ≤ a) :
    padicValNat p (((p ^ a + 1) * p).choose (p ^ a + 1)) ≤ 2 := by
  letI : Fact p.Prime := ⟨hp⟩
  have hkn : p ^ a + 1 ≤ (p ^ a + 1) * p := by
    have hmpos : 0 < p ^ a + 1 := by positivity
    nlinarith [hp.two_le]
  have hNform :
      (p ^ a + 1) * p = p ^ (a + 1) + p := by
    rw [pow_succ]
    ring
  have hNpos : 0 < (p ^ a + 1) * p := by positivity
  have hNlt : (p ^ a + 1) * p < p ^ (a + 2) := by
    rw [hNform]
    have hpLt : p < p ^ (a + 1) := by
      calc
        p = p ^ 1 := (pow_one p).symm
        _ < p ^ (a + 1) :=
          Nat.pow_lt_pow_right hp.one_lt (by omega)
    calc
      p ^ (a + 1) + p < p ^ (a + 1) + p ^ (a + 1) :=
        Nat.add_lt_add_left hpLt _
      _ = 2 * p ^ (a + 1) := by omega
      _ ≤ p * p ^ (a + 1) :=
        Nat.mul_le_mul_right _ hp.two_le
      _ = p ^ (a + 2) := by
        rw [show a + 2 = (a + 1) + 1 by omega, pow_succ, Nat.mul_comm]
  have hlog :
      Nat.log p ((p ^ a + 1) * p) < a + 2 :=
    (Nat.log_lt_iff_lt_pow hp.one_lt (Nat.ne_of_gt hNpos)).2 hNlt
  rw [padicVal_choose_eq_carryCount hkn hlog, carryCount]
  let C := (Finset.Ico 1 (a + 2)).filter
    fun i ↦ CarryAt p ((p ^ a + 1) * p) (p ^ a + 1) i
  have hsub : C ⊆ ({1, a + 1} : Finset ℕ) := by
    intro i hi
    have hi' := Finset.mem_filter.mp hi
    have hiRange := Finset.mem_Ico.mp hi'.1
    have hcarry := hi'.2
    by_cases hi1 : i = 1
    · simp [hi1]
    by_cases hia : i = a + 1
    · simp [hia]
    have hi2 : 2 ≤ i := by omega
    have hiaLe : i ≤ a := by omega
    have hdivA : p ^ i ∣ p ^ a :=
      Nat.pow_dvd_pow p hiaLe
    have hpowigt1 : 1 < p ^ i := by
      calc
        1 < p := hp.one_lt
        _ ≤ p ^ i := by
          calc
            p = p ^ 1 := (pow_one p).symm
            _ ≤ p ^ i := Nat.pow_le_pow_right hp.pos (by omega)
    have hkmod : (p ^ a + 1) % p ^ i = 1 := by
      rw [Nat.add_mod, Nat.mod_eq_zero_of_dvd hdivA, zero_add]
      simp [Nat.mod_eq_of_lt hpowigt1]
    have hdivTop : p ^ i ∣ p ^ (a + 1) :=
      Nat.pow_dvd_pow p (by omega)
    have hpLtPow : p < p ^ i := by
      calc
        p = p ^ 1 := (pow_one p).symm
        _ < p ^ i := Nat.pow_lt_pow_right hp.one_lt (by omega)
    have hnmod : ((p ^ a + 1) * p) % p ^ i = p := by
      rw [hNform, Nat.add_mod, Nat.mod_eq_zero_of_dvd hdivTop, zero_add]
      simp [Nat.mod_eq_of_lt hpLtPow]
    have hno :
        ¬ CarryAt p ((p ^ a + 1) * p) (p ^ a + 1) i :=
      (not_carryAt_iff_mod_pow_le hp.pos hkn).2 (by
        rw [hkmod, hnmod]
        exact hp.one_le)
    exact False.elim (hno hcarry)
  have hcard := Finset.card_le_card hsub
  change C.card ≤ 2
  exact hcard.trans (by simp)

/-- Pure-power multiplier branch of the strict lower-row argument. -/
theorem targetB_pure_power_witness_le
    {p a t : ℕ} (hp : p.Prime) (ha : 2 ≤ a) (ht : 1 ≤ t) :
    padicValNat p
      (((p ^ a + 1) * p ^ t).choose
        ((p ^ a + 1) * p ^ (t - 1))) ≤ a := by
  have htEq : t = (t - 1) + 1 := by omega
  have hbase : p ^ a + 1 ≤ (p ^ a + 1) * p := by
    have hmpos : 0 < p ^ a + 1 := by positivity
    nlinarith [hp.two_le]
  have hscale :=
    padicVal_choose_pow_mul (p := p) (c := t - 1)
      (n := (p ^ a + 1) * p) (k := p ^ a + 1) hp hbase
  have hN :
      p ^ (t - 1) * ((p ^ a + 1) * p) =
        (p ^ a + 1) * p ^ t := by
    rw [htEq, pow_succ]
    ring
  have hk :
      p ^ (t - 1) * (p ^ a + 1) =
        (p ^ a + 1) * p ^ (t - 1) := by ring
  rw [hN, hk] at hscale
  rw [hscale]
  exact (base_pure_power_choose_le_two hp ha).trans ha


/-- The fixed fallback witness `d = p^(a-1)` used in the exceptional
leading-split range. The hypotheses are exactly the arithmetic consequences
needed from that range. -/
private theorem targetB_fallback_choose_le
    {p a t q h : ℕ} (hp : p.Prime) (ha : 2 ≤ a)
    (ht0 : a ≤ t) (ht1 : t ≤ 2 * a - 2)
    (hhpos : 0 < h) (hhsmall : h < p ^ (a - 1))
    (hqh : q + h = p ^ (t + 1))
    (hmh : (p ^ a + 1) * h < p ^ (t + 1)) :
    padicValNat p
      (((p ^ a + 1) * q).choose
        ((p ^ a + 1) * p ^ (a - 1))) ≤ a := by
  letI : Fact p.Prime := ⟨hp⟩
  let Q := p ^ a
  let A := p ^ (a - 1)
  let U := p ^ (t + 1)
  let R := U - (Q + 1) * h
  let L := t + a + 1
  let N := (Q + 1) * q
  let k := (Q + 1) * A
  have hApos : 0 < A := by
    dsimp [A]
    exact pow_pos hp.pos _
  have hQpos : 0 < Q := by
    dsimp [Q]
    exact pow_pos hp.pos _
  have hmpos : 0 < Q + 1 := by omega
  have hQA : Q = A * p := by
    dsimp [Q, A]
    rw [show a = (a - 1) + 1 by omega, pow_succ]
  have htwoA : 2 * A ≤ Q := by
    rw [hQA]
    simpa [Nat.mul_comm] using Nat.mul_le_mul_left A hp.two_le
  have hAltQ : A < Q := by
    dsimp [A, Q]
    exact Nat.pow_lt_pow_right hp.one_lt (by omega)
  have hAlePt : A ≤ p ^ t := by
    dsimp [A]
    exact Nat.pow_le_pow_right hp.pos (by omega)
  have hUform : U = p ^ t * p := by
    dsimp [U]
    rw [pow_succ]
  have htwoPtU : 2 * p ^ t ≤ U := by
    rw [hUform]
    simpa [Nat.mul_comm] using Nat.mul_le_mul_left (p ^ t) hp.two_le
  have hhPt : h < p ^ t := hhsmall.trans_le hAlePt
  have hptq : p ^ t < q := by
    have hqh' : q + h = U := by simpa [U] using hqh
    omega
  have hAq : A < q := hAlePt.trans_lt hptq
  have hkn : k ≤ N := by
    dsimp [k, N]
    exact Nat.mul_le_mul_left (Q + 1) hAq.le
  have hmh' : (Q + 1) * h < U := by
    simpa [Q, U] using hmh
  have hRsum : (Q + 1) * h + R = U := by
    dsimp [R]
    exact Nat.add_sub_of_le hmh'.le
  have hRsum' : R + (Q + 1) * h = U := by
    simpa [Nat.add_comm] using hRsum
  have hRpos : 0 < R := by
    dsimp [R]
    exact Nat.sub_pos_of_lt hmh'
  have hRltU : R < U := by
    dsimp [R]
    exact Nat.sub_lt (pow_pos hp.pos _) (Nat.mul_pos hmpos hhpos)
  have hQUL : Q * U = p ^ L := by
    dsimp [Q, U, L]
    rw [← pow_add]
    congr 1
    omega
  have hNform : N = p ^ L + R := by
    have hEq :
        N + (Q + 1) * h = (p ^ L + R) + (Q + 1) * h := by
      calc
        N + (Q + 1) * h = (Q + 1) * (q + h) := by
          dsimp [N]
          ring
        _ = (Q + 1) * U := by rw [show q + h = U by simpa [U] using hqh]
        _ = Q * U + U := by ring
        _ = p ^ L + U := by rw [hQUL]
        _ = p ^ L + ((Q + 1) * h + R) := by rw [hRsum]
        _ = (p ^ L + R) + (Q + 1) * h := by ring
    exact Nat.add_right_cancel hEq
  have hUlePL : U ≤ p ^ L := by
    dsimp [U, L]
    exact Nat.pow_le_pow_right hp.pos (by omega)
  have hRltPL : R < p ^ L := hRltU.trans_le hUlePL
  have hNpos : 0 < N := by
    rw [hNform]
    positivity
  have hNlt : N < p ^ (L + 1) := by
    rw [hNform]
    calc
      p ^ L + R < p ^ L + p ^ L := Nat.add_lt_add_left hRltPL _
      _ = 2 * p ^ L := by omega
      _ ≤ p * p ^ L := Nat.mul_le_mul_right _ hp.two_le
      _ = p ^ (L + 1) := by rw [pow_succ, Nat.mul_comm]
  have hQAhigh : Q * A = p ^ (2 * a - 1) := by
    dsimp [Q, A]
    rw [← pow_add]
    congr 1
    omega
  have hkform : k = A + p ^ (2 * a - 1) := by
    dsimp [k]
    rw [Nat.add_mul, one_mul, hQAhigh]
    omega
  have hlog : Nat.log p N < L + 1 :=
    (Nat.log_lt_iff_lt_pow hp.one_lt (Nat.ne_of_gt hNpos)).2 hNlt
  change padicValNat p (N.choose k) ≤ a
  rw [padicVal_choose_eq_carryCount hkn hlog, carryCount]
  let C := (Finset.Ico 1 (L + 1)).filter fun i ↦ CarryAt p N k i
  have hsub : C ⊆ Finset.Icc (2 * a) L := by
    intro i hi
    have hi' := Finset.mem_filter.mp hi
    have hiRange := Finset.mem_Ico.mp hi'.1
    have hcarry := hi'.2
    apply Finset.mem_Icc.mpr
    refine ⟨?_, by omega⟩
    by_contra hlow
    have hiLt : i < 2 * a := by omega
    have hprefix : k % p ^ i ≤ N % p ^ i := by
      by_cases hia : i ≤ a - 1
      · have hdivA : p ^ i ∣ A := by
          dsimp [A]
          exact Nat.pow_dvd_pow p hia
        have hdivK : p ^ i ∣ k := by
          dsimp [k]
          exact dvd_mul_of_dvd_right hdivA (Q + 1)
        rw [Nat.mod_eq_zero_of_dvd hdivK]
        exact Nat.zero_le _
      · have hai : a ≤ i := by omega
        have hiHigh : i ≤ 2 * a - 1 := by omega
        have hdivHigh : p ^ i ∣ p ^ (2 * a - 1) :=
          Nat.pow_dvd_pow p hiHigh
        have hAltPow : A < p ^ i := by
          dsimp [A]
          exact Nat.pow_lt_pow_right hp.one_lt (by omega)
        have hkmod : k % p ^ i = A := by
          rw [hkform, Nat.add_mod,
            Nat.mod_eq_of_lt hAltPow,
            Nat.mod_eq_zero_of_dvd hdivHigh]
          simp [Nat.mod_eq_of_lt hAltPow]
        have hdivTop : p ^ i ∣ p ^ L :=
          Nat.pow_dvd_pow p (by omega)
        have hnmod : N % p ^ i = R % p ^ i := by
          rw [hNform, Nat.add_mod, Nat.mod_eq_zero_of_dvd hdivTop, zero_add]
          simp
        have hRmodGt : A < R % p ^ i := by
          by_cases hit : i ≤ t + 1
          · let J := p ^ (i - a)
            have hJpos : 0 < J := by
              dsimp [J]
              exact pow_pos hp.pos _
            have hPowI : p ^ i = Q * J := by
              dsimp [Q, J]
              rw [← pow_add]
              congr 1
              omega
            have hhPowI : h < p ^ i := by
              exact hhsmall.trans (by
                dsimp [A]
                exact Nat.pow_lt_pow_right hp.one_lt (by omega))
            have hQhmod : (Q * h) % p ^ i = Q * (h % J) := by
              rw [hPowI, Nat.mul_mod_mul_left]
            have hMform : (Q + 1) * h = h + Q * h := by ring
            have hmodJlt : h % J < J := Nat.mod_lt _ hJpos
            have hhsumLtQ : h + A < Q := by omega
            have hQstep : Q * (h % J) + Q ≤ Q * J := by
              rw [← Nat.mul_add]
              exact Nat.mul_le_mul_left Q (Nat.succ_le_iff.mpr hmodJlt)
            have hcandPlus :
                h + Q * (h % J) + A < p ^ i := by
              rw [hPowI]
              calc
                h + Q * (h % J) + A =
                    Q * (h % J) + (h + A) := by ring
                _ < Q * (h % J) + Q := Nat.add_lt_add_left hhsumLtQ _
                _ ≤ Q * J := hQstep
            have hcandLt : h + Q * (h % J) < p ^ i := by
              omega
            have hmMod :
                ((Q + 1) * h) % p ^ i = h + Q * (h % J) := by
              rw [hMform, Nat.add_mod, Nat.mod_eq_of_lt hhPowI, hQhmod]
              exact Nat.mod_eq_of_lt hcandLt
            have hmModPos : 0 < ((Q + 1) * h) % p ^ i := by
              rw [hmMod]
              omega
            have hdivU : p ^ i ∣ U := by
              dsimp [U]
              exact Nat.pow_dvd_pow p hit
            have hmodsum :
                (R % p ^ i + ((Q + 1) * h) % p ^ i) % p ^ i = 0 := by
              rw [← Nat.add_mod, hRsum', Nat.mod_eq_zero_of_dvd hdivU]
            by_contra hnot
            have hRle : R % p ^ i ≤ A := Nat.le_of_not_gt hnot
            have hsumLt :
                R % p ^ i + ((Q + 1) * h) % p ^ i < p ^ i := by
              rw [hmMod]
              exact lt_of_le_of_lt
                (Nat.add_le_add_right hRle _)
                (by
                  simpa [Nat.add_comm, Nat.add_left_comm, Nat.add_assoc]
                    using hcandPlus)
            have hzero :
                R % p ^ i + ((Q + 1) * h) % p ^ i = 0 := by
              simpa [Nat.mod_eq_of_lt hsumLt] using hmodsum
            omega
          · have hti : t + 1 < i := by omega
            have hUltPow : U < p ^ i := by
              dsimp [U]
              exact Nat.pow_lt_pow_right hp.one_lt hti
            have hRltPow : R < p ^ i := hRltU.trans hUltPow
            have hRmod : R % p ^ i = R := Nat.mod_eq_of_lt hRltPow
            let s := t + 1 - a
            have hs0 : 1 ≤ s := by
              dsimp [s]
              omega
            have hs1 : s ≤ a - 1 := by
              dsimp [s]
              omega
            have hUQ : U = Q * p ^ s := by
              dsimp [U, Q, s]
              rw [← pow_add]
              congr 1
              omega
            have hpsLeA : p ^ s ≤ A := by
              dsimp [A]
              exact Nat.pow_le_pow_right hp.pos hs1
            have hpsPos : 0 < p ^ s := pow_pos hp.pos _
            have hpsLtM : p ^ s < Q + 1 :=
              hpsLeA.trans_lt hAltQ.trans_lt (Nat.lt_succ_self Q)
            have hUplus : U + p ^ s = (Q + 1) * p ^ s := by
              rw [hUQ]
              ring
            have hresPlus : (Q + 1 - p ^ s) + p ^ s = Q + 1 :=
              Nat.sub_add_cancel hpsLtM.le
            have hUzero : U + p ^ s ≡ 0 [MOD Q + 1] := by
              rw [hUplus]
              exact (dvd_mul_right (Q + 1) (p ^ s)).modEq_zero_nat
            have hresZero : (Q + 1 - p ^ s) + p ^ s ≡ 0 [MOD Q + 1] := by
              rw [hresPlus]
              exact (dvd_refl (Q + 1)).modEq_zero_nat
            have hUres : U ≡ Q + 1 - p ^ s [MOD Q + 1] :=
              Nat.ModEq.add_right_cancel' (p ^ s) (hUzero.trans hresZero.symm)
            have hRcongU : R ≡ U [MOD Q + 1] := by
              rw [← hRsum']
              simp
            have hRres : R ≡ Q + 1 - p ^ s [MOD Q + 1] :=
              hRcongU.trans hUres
            have hresLt : Q + 1 - p ^ s < Q + 1 :=
              Nat.sub_lt hmpos hpsPos
            have hRmodM : R % (Q + 1) = Q + 1 - p ^ s := by
              unfold Nat.ModEq at hRres
              simpa [Nat.mod_eq_of_lt hresLt] using hRres
            have hresLeR : Q + 1 - p ^ s ≤ R := by
              rw [← hRmodM]
              exact Nat.mod_le _ _
            have hAres : A + 1 ≤ Q + 1 - p ^ s := by
              omega
            rw [hRmod]
            omega
        rw [hkmod, hnmod]
        exact hRmodGt.le
    have hno : ¬ CarryAt p N k i :=
      (not_carryAt_iff_mod_pow_le hp.pos hkn).2 hprefix
    exact hno hcarry
  have hcard := Finset.card_le_card hsub
  change C.card ≤ a
  calc
    C.card ≤ (Finset.Icc (2 * a) L).card := hcard
    _ ≤ a := by
      simp
      dsimp [L]
      omega

end PascalExtremes
