import Mathlib

/-!
# Relative Fargues–Fontaine function theory, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The strict endomorphism theorem uses
native Laurent series, normed algebraic closures and uniform completions.

The following headline theorems are not statable at the pins:
* Completed Newton product and weighted zero theorem: lacks ramified completed interval rings and classical primitive-point carrier.
* Boundary extension and unit theorem: lacks ramified interval rings with boundary norms.
* Primitive factorization and finite-degree marked untilts: lacks ramified Witt and marked-untilt carriers.
* Closed ideal/divisor classification and half-open Bézout theorem: lacks period annuli and locally finite classical-point divisors.
* Frobenius orbit products and homogeneous factorization: lacks period ring Frobenius eigenspaces and their graded algebra.
* Fundamental exact sequence with repeated de Rham jets: lacks period eigenvectors and marked ramified de Rham jets.
* General-field Dedekind charts and continuous-character class group: lacks the invariant Be chart and completed-base-change action.
* Degree-one generation and the weighted schematic curve: lacks the specific period graded algebra and its Proj.
* Interval bundle equivalence and coherent-module classification: lacks compatible period-annulus module systems.
* Finite étale annular extension and effective continuous descent: lacks ramified annular Banach algebras and continuous semilinear actions.
* Rational functions, finite covers and coefficient change: lacks the period curve and its field/base-change comparison.
* Degree and characters of Frobenius lines and positive-line Proj: lacks finite-projective modules on the actual global period ring with its Frobenius.
* Runge approximation and reconstruction of the adic curve: lacks schematic period charts with radial norm data.
* Nonprincipal positive period ideal: lacks the specific positive period subring and its tilt coefficients.
* Exotic untilt residue field: lacks the native marked perfectoid untilt and tilt-equivalence carriers.
* Weakly closed prime classification: lacks the general ramified integral period ring with its weak topology.
* Valued-homogeneity primitive-point orbit theorem: lacks the primitive-point and marked-untilt action carriers.

The p-typical algebraic Fontaine and de Rham APIs do not supply these general
ramified annular carriers. No arbitrary-ring stand-ins are used for them.
-/

namespace TauCetiRoadmap.RelativeFarguesFontainePartII

/-! ## Layer 11: Arithmetic examples and maximal completeness -/

/-- A completed algebraic closure of a Laurent-series field in positive characteristic
has a continuous endomorphism fixing the coefficient field which is not surjective.
The norm on the algebraic closure induces the Laurent-series valuation ordering. -/
theorem exists_strict_laurentClosure_endomorphism
    (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]
    (K : Type*) [NormedField K] [Algebra (LaurentSeries k) K]
    [IsAlgClosure (LaurentSeries k) K]
    (hvaluation : ∀ x y : LaurentSeries k,
      ‖algebraMap (LaurentSeries k) K x‖ ≤ ‖algebraMap (LaurentSeries k) K y‖ ↔
        (Valued.v x : WithZero (Multiplicative ℤ)) ≤ Valued.v y) :
    ∃ f : UniformSpace.Completion K →+* UniformSpace.Completion K,
      Continuous f ∧
      (∀ a : k,
        f ((algebraMap (LaurentSeries k) K (algebraMap k (LaurentSeries k) a) : K) :
          UniformSpace.Completion K) =
        ((algebraMap (LaurentSeries k) K (algebraMap k (LaurentSeries k) a) : K) :
          UniformSpace.Completion K)) ∧
      ¬ Function.Surjective f := by
  sorry


end TauCetiRoadmap.RelativeFarguesFontainePartII
