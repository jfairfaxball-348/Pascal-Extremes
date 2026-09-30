module

public import Mathlib.Data.Nat.Digits.Lemmas

@[expose] public section


namespace PascalExtremes

/-- Arithmetic base-`p` digit accessor. -/
def digitAt (p N i : ℕ) : ℕ :=
  N / p ^ i % p

end PascalExtremes
