# Review of IntegralHeckeAndGaloisDeterminants (pull request #1689 at cb05366)

**Verdict:** accepted

## Previous findings

The accepted review of `b6df7e6` had no outstanding findings. Its four inherited repair records remain satisfied:

- R01 — repaired: `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:569` consumes rational cohomology and induction from ReductiveGroups §1.1; the supplier on main still states both interfaces.
- R02 — repaired: `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/Suggested.lean:20` identifies descent and rational trace comparison as instances of retained headlines; neither duplicate declaration occurs.
- R03 — repaired: `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:508` cites the pinned Fitting bound, continuous cohomology and Japanese/Nagata predicates under Tau Ceti; §0.20 supplies only the complete-local extensions.
- R04 — repaired: `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:4583` consumes `TauCeti.koszulComplex.span_le_annihilator_cohomology`; the target retains depth sensitivity and degree-zero identification.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 Cayley–Hamilton definition and zero-law equivalence | Degree one: identity on ℤ; evaluation at zero on ℤ[x] | Identity: χ(r)=r−r=0, CH=0. Evaluation: χ(x)=x≠0, CH=(x)≠0. | Both directions agree | Wording only |
| §1.1 zero-law equivalence at degree zero | Constant determinant 1 on ℤ; zero algebra | On ℤ: χ(r)=1, CH=(1)≠0. On the zero algebra: χ=0, CH=0. | Boundary agrees | None |
| §1.1 base-change preservation | ℤ→S=𝔽₂[ε]/(ε²), determinant on M₂; U=I+εE₁₂ | Before: CH(det)=0. After: χ(U)=U²−2U+I=ε²E₁₂²=0; CH(det_S)=0. | Includes nonflat, nonreduced base change | None |
| §1.1 reference Check: Cayley–Hamilton need not mean faithful | Upper-triangular 2×2 matrices over ℤ | For [[a,b],[0,c]], χ=M²−(a+c)M+acI=0; CH=0, ker(det)=ℤE₁₂≠0. | Wrong faithful-only definition excluded | None |

Untouched statement rows stand as in the previous review of `b6df7e6`.

- Sources: 3 locators reopened—Chenevier §1.17, p.17 (lines 710–718), Example 1.20(ii), p.18 (lines 725–730), Lemma 1.21, p.18 (lines 731–735); the changed seeded target is §1.1.
- Libraries: 5 declarations opened at the pins—`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:222`; `TauCeti/RingTheory/KoszulComplex/Cohomology.lean:70`, `FittingIdeal/Determinant.lean:143`, `Japanese.lean:125`, `Nagata.lean:65`.
- Suppliers: ReductiveGroups §1.1 resolved on main at `TauCetiRoadmap/ReductiveGroups/README.md:1378` and :1439; 0 supplier additions, deletions or renumberings in the incremental diff.
- PR text: title, summary block and prose agree with the added folder, 60 added headings, 57 declarations, 20 admitted headline theorems, 4 Tau Ceti imports, both library pins and named suppliers; 0 outside-folder changes against `origin/main`.
- Gate: every counter is 0, `OK`; the worker also records `build=0`. Dependency output: `depcheck: 245 roadmaps, 2208 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Elaboration: direct `lake env lean` succeeds with exactly 20 `sorry` warnings; targeted module build succeeds. Its cached module-system advisory concerns untouched imports and introduces no incremental finding.
- Lean: 0 changed declarations; the previous 57-signature and 20 one-tactic checks stand. The wording change preserves the characteristic-law quotient used by the Lean docstring and reconstruction route.

Overlap check: read LanglandsParameterStacks, DeformationAndDerivedPatchingAlgebra, PotentialAutomorphyInfrastructure, TorsionCohomologyInfrastructure, LocalGaloisDeformationRings, DerivedModuleAlgebra, SmoothRepresentationsOfLocalGroups and PadicMeasuresIwasawaAlgebras; determinant laws, Cayley–Hamilton algebras, reconstruction and derived Hecke images remain owned here; general polynomial-law/Roby/Koszul foundations by DerivedModuleAlgebra and the pins, Satake and finite-wild excursions by SmoothRepresentationsOfLocalGroups, determinant lines by PadicMeasuresIwasawaAlgebras. No competing owner of the changed definition found.

Source independence: changed passages only—1 paragraph compared with 1 source (Chenevier lines 710–718); no copied exposition or reused material. Chenevier has the largest share, 67 of 240 external citation links. No layer was added, removed or reordered; arrangement was not reopened.

## Not verifiable

- No changed-passage locator remains unverified; the previous review's limitations for Jantzen, Fargues–Scholze VIII.3.4 and the references behind DKSW Lemmas 4.11–4.12 stand.

## Source issues

- none

## For the human reviewers

- none
