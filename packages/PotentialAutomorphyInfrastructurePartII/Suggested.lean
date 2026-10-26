import Mathlib

/-!
# Potential automorphy infrastructure, part II — polarized automorphy lifting and finiteness of deformation rings: target signatures

No headline theorem of this roadmap is statable at the pinned Mathlib and Tau Ceti commits, so
this file declares nothing. Mathlib supplies absolute Galois groups
(`Field.absoluteGaloisGroup`), CM fields (`NumberField.IsCMField`), the cyclotomic character and
Krull dimension. It has no automorphic representations of `GL_n(𝔸_F)`, no Galois representations
attached to them, no `𝒢_n`-valued polarized representations and no Galois deformation rings. Every
headline below needs at least one of these carriers.

## Headline theorems and what each lacks

* Minimal automorphy lifting with adequate residual image (§5.1; Thorne 2012, Theorem 7.1;
  BLGGT14, Theorem 2.3.1). Lacks:
  * regular algebraic conjugate self-dual cuspidal representations and their `l`-adic Galois
    representations (AutomorphicGaloisRepresentationsPartII AG2.0–AG2.6);
  * `𝒢_n`-valued polarized representations and adequate subgroups (ArithmeticGaloisRepresentations
    §§7.4, 7.9);
  * the components of local lifting rings (LocalGaloisDeformationRings).
* Automorphy lifting at `p = 2` with strong residual oddness (§5.3; Thorne 2017, Theorem 5.1).
  Lacks the same carriers, and polarized deformation problems at `p = 2`.
* Ordinary automorphy lifting (§5.5; Geraghty, Theorem 5.3.2; BLGGT14, Theorem 2.4.1). Lacks:
  * `ι`-ordinary automorphic representations (PotentialAutomorphyInfrastructure §3.44);
  * ordinary Galois representations of weight `λ`.
* Finiteness of polarized deformation rings for fixed components and in the ordinary case
  (§§5.6–5.7). Lacks polarized global deformation rings (GlobalGaloisDeformations §§8.1–8.4).
* Potential ordinary automorphy of symplectic residual representations (§6.2; BLGGT14,
  Theorem 3.1.2). Lacks Galois representations of automorphic representations, and the lisse sheaves
  of the Dwork family.
* Potentially diagonalizable automorphy lifting (§6.5; BLGGT14, Theorem 4.2.1). Lacks potentially
  diagonalizable representations, which are defined through components of local lifting rings.
* Residually reducible automorphy lifting and finiteness, with strong and with weak primitivity
  (§§8.1–8.2, 8.17–8.18; Allen–Newton–Thorne, Theorems 6.1–6.2; Thorne 2015, Theorem 7.1). Lacks:
  * pseudodeformation rings of `𝒢_n`-valued Schur residual representations;
  * ordinary Hecke algebras of definite unitary groups.
* Vanishing of adjoint Bloch–Kato Selmer groups of unitary type (§9.7; Newton–Thorne 2023,
  Theorem A). Lacks Bloch–Kato Selmer groups of Galois representations attached to automorphic
  representations.
* The almost minimal integral `R = T` theorem for rigid residual representations (§10.2;
  Liu–Tian–Xiao–Zhang–Zhu, Theorem 3.6.3). Lacks:
  * the étale cohomology of unitary Shimura varieties with integral local systems;
  * universal deformation rings of polarized problems.
* Modularity lifting from polynomially generic local domains (§10.5; Le–Le Hung–Levin–Morra,
  Theorem 9.2.1). Lacks tame inertial types, potentially crystalline representations of fixed type,
  and automorphic representations with prescribed `K`-type.
-/

namespace TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

end TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII
