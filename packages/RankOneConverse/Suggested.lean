import Mathlib

/-!
# Rank-one converses: target signatures

The roadmap is README.md; this file is not the roadmap. It records the boundary
for stating the roadmap's headline theorems against the pinned APIs.

No headline theorem is statable on its arithmetic carriers at these pins using only a
few simple definitions:

* Residual restriction (Layer 0) lacks the attached residual newform Galois
  representation, with its squarefree local realization.
* Arithmetic rank-one localization at every coefficient place, the semilocal
  image dimension and strict-kernel vanishing (Layer 1) lack the canonical
  coefficient-compatible rational Bloch--Kato Selmer and local realization.
* Anticyclotomic reverse divisibility, finite-error augmentation control and
  augmentation obstruction (Layer 2) lack the canonical one-sided Selmer
  deformation and the attached anticyclotomic analytic function.
* Theorem B (Layer 3) additionally lacks the attached modular abelian variety
  and its arithmetic and analytic base-change comparisons.
* Locally prescribed quadratic value and derivative nonvanishing (Layer 4)
  lacks the primitive quadratic-twist newform interface with its full local
  character family. The native newform L-function alone does not supply it.
* Theorems A and A' (Layer 4) lack, respectively, the modular abelian realization
  and the elliptic L-function / geometric Tate--Shafarevich comparison.
* Theorem C (Layer 5) lacks the finite odd-prime elliptic Selmer group with its
  actual local Kummer map and the attached elliptic L-function.
* Theorem E (Layer 6) lacks the modular abelian realization, its geometric
  Tate--Shafarevich group and its actual L-function comparison.

The native newform, its L-function, abelian varieties, continuous cohomology
and the cohomological Tate--Shafarevich kernel do exist at the pins. They do not
by themselves construct these missing arithmetic comparisons. Abstract linear
maps, arbitrary analytic functions and free predicates are not substitutes.
The point-height and point-logarithm criteria have their supplier in
GrossZagierAndArithmeticHeights and are not restated here.
-/

namespace TauCetiRoadmap.RankOneConverse

end TauCetiRoadmap.RankOneConverse
