module

public import PascalExtremes.TargetBMinimality
public import Mathlib.Tactic

public section


namespace PascalExtremes

example : rP 2 5 = 3 := by
  norm_num [rP]

example : q0 2 2 = 13 := by
  norm_num [q0]

example : T 2 5 = 65 := by
  have h := targetB (p := 2) (a := 2) Nat.prime_two (by omega)
  norm_num at h ⊢
  exact h

end PascalExtremes
