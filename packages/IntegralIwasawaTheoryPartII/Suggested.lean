import Mathlib

/-!
# IntegralIwasawaTheoryPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs whenever their
carriers are available. None of the following headlines is statable at these pins:

* The Gross–Stark leading-term theorem of Dasgupta–Kakde–Ventullo for every prime `p`
  (README §5.6), and its rank-zero case (§5.5), lack the Deligne–Ribet `p`-adic
  `L`-function `L_p(χω, s)` of a totally odd character of a totally real field and the
  Iwasawa logarithm on finite extensions of `ℚ_p` normalized by `log_p(p) = 0`, through
  which Gross's regulator is defined. The complex side exists at the pins: Tau Ceti's
  `TauCeti.LFunctions.heckeLFunctionC` is the presented meromorphic continuation of the
  Hecke `L`-series of a ray class character of any number field (zero when no
  continuation exists). Its functional equation, the nonvanishing `L(χ, 0) ≠ 0` and the
  identification of a Galois character with a ray class character are the LFunctions and
  ClassFieldTheory targets the README consumes, and none of them supplies `L_p(χω, s)`.
* The all-prime lower bound `ord_{s=0} L_p(χω, s) ≥ r` (§0.8) lacks `L_p(χω, s)` and the
  integral Sczech–Eisenstein cocycle with its measures.
* The exact-order criterion `ord_{s=0} L_p(χω, s) = r ↔ R_p(χ) ≠ 0` and its rank-one case
  (§§5.7–5.8) lack `L_p(χω, s)` and the Iwasawa logarithm.
* The cohomological formula for the regulator, `L_alg(χ) = R_p(χ)` (§1.9), lacks the
  Iwasawa logarithm and the decomposition and inertia subgroups of the absolute Galois
  group of a number field at its completions; Tau Ceti's continuous `H¹` and absolute
  local Artin map exist at the pins but do not supply these.
* The identifications of the localized Hecke image with the three Artin algebras
  (§§3.8–3.10) lack Λ-adic ordinary Hilbert modular forms and their Hecke algebras.

The elementary determinant, power-series and quotient-algebra formulas used in these
constructions are targets and Checks in README.md. They do not replace any of these
headline theorems here.
-/

namespace TauCetiRoadmap.IntegralIwasawaTheoryPartII

end TauCetiRoadmap.IntegralIwasawaTheoryPartII
