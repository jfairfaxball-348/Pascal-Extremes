import Mathlib.Data.Nat.Digits.Lemmas

namespace PascalExtremes

/-- Arithmetic base-`p` digit accessor. -/
def digitAt (p N i : ℕ) : ℕ :=
  N / p ^ i % p

end PascalExtremes
