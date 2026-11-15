# Review of ArcTopologyAndDescent (pull request #1755 at dfd2dd1)

**Verdict:** needs changes

## R01 (P3) — Qualify the summary’s blanket generality claim

**Location:** PR description, `roadmap-summary` block, “Approach and generality”: “Nothing is restricted to noetherian rings, invertible torsion or principal ideals: valuation tests have unrestricted rank”.
**Claim:** This conflates arbitrary-rank v-tests with rank-at-most-one arc-tests and removes restrictions that individual applications retain.
**Witness:** `TauCetiRoadmap/ArcTopologyAndDescent/README.md:409`: for rank-two V, V→V_p×V/p is arc but not v. Its identity valuation test cannot lift injectively and locally through either branch. `TauCetiRoadmap/ArcTopologyAndDescent/Suggested.lean:59` explicitly imposes `Ring.KrullDimLE 1`.
**Repair:** Replace that sentence with: “The excision theory has no noetherian hypothesis; torsion descent allows noninvertible torsion, and complete-arc descent treats every finitely generated ideal. v-cover tests allow arbitrary rank, whereas arc-cover tests have rank at most one, including nondiscrete valuations. Finite coefficients of infinite Tor dimension are retained; the Künneth applications retain residue-invertibility hypotheses.”

## R02 (P3) — Name the actual differential and perfect-complex functors

**Location:** PR description, `roadmap-summary` block, “What this roadmap builds”: “Applications give arc-descent for étale objects, differential forms, perfect complexes”; the following prose repeats “differential and perfect-complex arc-descent”.
**Claim:** The description omits h-sheafification and characteristic zero for differentials, and perfection and characteristic p for perfect complexes; these determine which functors descend.
**Witness:** `TauCetiRoadmap/ArcTopologyAndDescent/README.md:966` defines finitary characteristic-zero h-form cohomology; line 1009 states X↦Perf(X^perf) for qcqs F_p-schemes. BM21 lines 1802–1811 and 1843–1845 support precisely these modified functors.
**Repair:** In the summary list, replace “differential forms, perfect complexes” with “finitary h-differential and h-de Rham cohomology over characteristic-zero fields, perfect complexes on perfections of qcqs F_p-schemes (p prime)”. In the following prose, replace “differential and perfect-complex arc-descent” with “arc-descent of those h-cohomology functors and arc-hyperdescent of X↦Perf(X^perf)”.

## R03 (P3) — State the base-field hypothesis of affinoid vanishing

**Location:** PR description, `roadmap-summary` block, “What this roadmap builds”: “Artin–Grothendieck vanishing on affinoid algebras: bound d for residue-invertible torsion, d+1 for all torsion in mixed characteristic”; the prose below also leaves the field unspecified.
**Claim:** These dimension bounds are stated at this head over a complete algebraically closed nontrivially valued nonarchimedean field, not over arbitrary affinoid base fields.
**Witness:** `TauCetiRoadmap/ArcTopologyAndDescent/README.md:1452` imposes these field hypotheses. For A=K=ℚ₃, d=0 and constant ℤ/2, |2|=1 but H¹=ℚ₃×/(ℚ₃×)² has four classes, represented by 1, 2, 3, 6.
**Repair:** Qualify both mentions with: “for a d-dimensional K-affinoid algebra, where K is complete, algebraically closed, nonarchimedean and nontrivially valued”. Keep the stated coefficient-dependent bounds.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/ArcTopologyAndDescent/README.md:71–75` retains the finite étale carrier, base-change and pseudofunctor contracts checked in the previous accepted report; line 57 retains the big étale topology contract. No folder changes occurred.

## Verified sound

:robot: Independent AI incremental review: 0 changed folder lines since dfd2dd1; findings concern the PR description only.

| Statement | Instances tried | Left-side value | Right-side value | Result / change |
| --- | --- | --- | --- | --- |
| R01: arc versus arbitrary-rank lifting (§2.3; `IsSchemeArcCover`) | Rank-two V, 0⊊p⊊m; B=V_p×V/p | Arc-cover=true | Identity V-test: quotient kills p; localization makes an element of m invertible; no injective local lift | PR must distinguish v-tests from arc-tests |
| R01: coefficient restrictions (§§10.5–10.6) | K=ℂ₃; ℓ=3 and ℓ=2 | ‖3‖=1/3; ‖2‖=1 | Required norm=1: false for 3, true for 2 | Retain residue-invertibility in Künneth applications |
| R02: differential functor (§§7.4–7.6) | A=ℚ[ε]/ε²→ℚ; i=1 | Naive Ω¹_A/ℚ=ℚ·dε≠0 | Ω¹_ℚ/ℚ=0; h-form cohomology of both spectra=0 | h-sheafification cannot be omitted |
| R02: perfect-complex functor (§7.7) | A=𝔽₂[ε]/ε²→𝔽₂ | End_Perf(A)(A)=A, four elements | End_Perf(𝔽₂)(𝔽₂)=𝔽₂, two elements; A^perf=𝔽₂ | Ordinary Perf fails faithfulness; perfected values agree |
| R03: prime-to-residue bound (`affinoid_artin_grothendieck_prime_to_residue`) | K=A=ℚ₃, ℓ=2, d=0, q=1 | H¹=ℚ₃×/(ℚ₃×)²≅(ℤ/2)², four elements | Claimed vanishing would give one element | Exclude this non-algebraically-closed base |
| R03: all-torsion bound (`affinoid_artin_grothendieck`) | K=A=ℂ₃, F=ℤ/3, d=0, q=2 | H²(Spec ℂ₃,ℤ/3)=0 | q>d+1: 2>1; required group=0 | Stated field hypotheses give the advertised instance |

Untouched-statement rows stand as in the previous review of dfd2dd1; they are not reproduced.

- Change check: 0 folder lines changed; 0 outside-folder paths; clean head dfd2dd1. Against the base this adds 3 files, 1,816 lines, 10 Lean declarations; none removed or renumbered.
- Sources: 4 BM21 locations reopened for PR claims—Definition 1.2/Example 1.3, p. 3 (lines 93–108); Theorem 5.14, pp. 43–44 (1802–1834); Theorem 5.16, p. 44 (1843–1845); Theorem 7.3, p. 56 (2340–2345). No seeded target falls in a changed folder passage.
- Previous repair: 9 pinned declarations reopened at `TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`, `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean:44,66,197`, `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean:51,78,84,96,103`; also Mathlib `AlgebraicGeometry/Sites/Etale.lean:40`. No repair regression.
- Signatures: supplied elaborations of all 10 unchanged declarations compared with the file; 0 lost binders. The two affinoid theorems retain `IsAlgClosed K`; arc lifting retains its explicit rank bound.
- Gate: every scanner returned 0 and `OK`; targeted `lake build TauCetiRoadmap.ArcTopologyAndDescent.Suggested` passed; standalone elaboration passed, each with exactly 5 `sorry` warnings.
- Dependency check output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Overlaps data: 0 competing heads changing this folder, 0 dropped cited ids, 0 citations requiring an open revision; no ownership changes in this diff.

Overlap check: read scopes of PrismaticCohomology (scheme cover predicates and torsion descent), ClassicalAdicEtaleCohomology (analytic comparisons), DiamondsAndVStacks (spectral and ordinary topos inputs), PerfectoidSpaces (perfectoid carriers), EnhancedDerivedSheaves (enhancements), SchemeAndStackFoundationsPartII, DiamondsAndVStacksPartII and EtaleDualityAndPerverseSheavesPartII (consumers of this roadmap’s complete-arc descent, scheme v-comparisons and h-site respectively); ownership stays with the named suppliers and ArcTopologyAndDescent as specified, with no new overlap.

Source independence: changed passages only—3 PR-summary passages compared with 1 source, BM21; no copied expression identified. BM21 supplies all 4 reopened locators; there are 0 changed roadmap passages and 0 changed roadmap locators; no layers changed, and the settled arrangement comparison was not repeated.

## Not verifiable

- HUB96 remains settled as uncertified; no new verification requested.
- Prior limitations on RYD10’s category definitions and the earlier board-design verification of PerfectoidSpacesPartII are outside this zero-line re-review.

## Source issues

- none

## For the human reviewers

- HUB96 is cited by printed locators; its full text remains paywalled (`TauCetiRoadmap/ArcTopologyAndDescent/README.md:129`).
