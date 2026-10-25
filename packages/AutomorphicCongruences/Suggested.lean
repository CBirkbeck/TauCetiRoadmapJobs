/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Codex
-/
import Mathlib

/-!
# AutomorphicCongruences: target signatures

The roadmap is README.md; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, those headline theorems of the roadmap that are
statable there. None of them is statable at the pins, so the file states nothing. Each headline
and the carrier it lacks:

* Skinner–Urban's two-variable and cyclotomic divisibilities (README §1.10 and §1.11) need
  Σ-primitive ordinary Selmer groups of a Hida family over the ℤ_p²-extension of an imaginary
  quadratic field, their Pontryagin duals as modules over a completed group algebra with
  coefficients in a Hida branch, characteristic (divisorial) ideals over such rings, and the
  three-variable Skinner–Urban p-adic L-function. The pins have continuous cohomology
  `TauCeti.ContCohomology.H1` and Mordell–Weil 2-Selmer groups, but no Selmer group over an
  Iwasawa tower, no characteristic ideal of an Iwasawa module and no p-adic L-function.
* The Castella–Liu–Wan divisibility and its p-inverted form (README §2.7 and §2.8) need, in
  addition, the localization of the anticyclotomic-by-cyclotomic Iwasawa algebra at its
  cyclotomic subring and the Castella–Liu–Wan p-adic L-function.
* Fouquet–Wan's divisibility, crystalline-point and ordinary theorems and Wan's Rankin–Selberg
  divisibility (README §3.6 and §§3.12–3.14) need Greenberg Selmer groups over the
  ℤ_p²-extension of an imaginary quadratic field and the Greenberg and Rankin–Selberg p-adic
  L-functions.
* Fouquet–Wan's universal-family and pointwise main conjectures (README §5.3 and §5.5) need
  universal deformation rings of residual Galois representations, Selmer complexes over them,
  Knudsen–Mumford determinant lines and Nakamura's zeta morphism on completed homology.
* Wan's parallel Hilbert-family divisibility (README §6.10) needs nearly ordinary Hilbert Hida
  families, their Selmer groups over the ℤ_p-extensions of a CM field and Wan's p-adic
  L-function.
* Burungale–Castella–Skinner's two-variable product divisibility and their rational and integral
  cyclotomic theorems (README §7.6, §8.9 and §8.10) need the Pontryagin dual of the p-primary
  ordinary Selmer group of an elliptic curve over the cyclotomic ℤ_p-extension as a module over
  `ℤ_p⟦Gal(ℚ_∞/ℚ)⟧`, its characteristic ideal, and the Mazur–Swinnerton-Dyer p-adic L-function.
-/

namespace TauCetiRoadmap.AutomorphicCongruences

end TauCetiRoadmap.AutomorphicCongruences
