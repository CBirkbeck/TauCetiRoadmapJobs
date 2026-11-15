# Review of ArcTopologyAndDescent (pull request #1755 at dfd2dd1)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the summary now reads “Excision has no noetherian hypothesis … v-tests allow arbitrary rank; arc-tests have rank at most one, including nondiscrete valuations … The Künneth applications retain residue-invertibility hypotheses.”
- R02 — repaired: summary and prose now name “finitary h-differential and h-de Rham cohomology over characteristic-zero fields, and arc-hyperdescent of X↦Perf(X^perf) on qcqs F_p-schemes for prime p”.
- R03 — repaired: both mentions now say “d-dimensional K-affinoid algebras” with K “complete, algebraically closed, nonarchimedean and nontrivially valued”; bounds d+1 (arbitrary torsion) and d (residue-invertible prime-power torsion).

## Verified sound

:robot: Independent AI incremental re-review: 0 changed folder lines since dfd2dd1; this round read the pull request's title and description against the head.

| Statement | Instances tried | Left-side value | Right-side value | Result / change |
| --- | --- | --- | --- | --- |
| Description: “arc-tests have rank at most one” (`IsSchemeArcCover`) | f=id on Spec k; f: ∅→Spec k; V=k (Krull dimension 0≤1) | id: W=V, e=id, b=a lifts: true | ∅: no map from Spec W (W a domain, nonempty spectrum) to ∅: false | Predicate separates the two; matches text; none |
| Description: v-tests of arbitrary rank versus arc-tests (§2.3, README line 486) | Rank-two V, primes 0⊊p⊊m, B=V_p×V/p | Rank ≤1 tests: each interval [0,p], [p,m] lifts: arc-cover | Identity test of V: V/p kills p≠0, V_p inverts an element of m: no injective local lift | Text states both ranks correctly; none |
| Description: “For finitary v-sheaves …, arc-descent is equivalent to Milnor excision” (§4.6) | F(R)=R on Spec k←Spec k[ε]/ε²; Milnor datum with I=0 | F(k[ε]/ε²) has dimension 2 over k | Equalizer of k⇉k⊗_(k[ε]/ε²)k=k has dimension 1: F is no v-sheaf, outside the class | The “v-sheaves” qualifier is needed and present; I=0 square is trivially cartesian; none |
| Description: vanishing above d for residue-invertible prime-power torsion (`affinoid_artin_grothendieck_prime_to_residue`) | K=ℂ₃; ℓ=2 and ℓ=3; A=K, d=0, q=1 | ‖2‖=1: hypothesis holds; H¹(Spec K,ℤ/2)=0 since K is algebraically closed | ‖3‖=1/3≠1: ℓ=3 excluded from the bound d | Matches “residue-invertible”; none |
| Description: vanishing above d+1 for arbitrary torsion (`affinoid_artin_grothendieck`) | A=K=ℂ₃, F=ℤ/3, d=0, q=2; A=0 | q=2>d+1=1; H²(Spec ℂ₃,ℤ/3)=0 | A=0: empty spectrum, every group 0 | BM21 line 2340 states (1) with no characteristic condition, as the text does; none |
| Description: “five real-bodied definitions and five headline theorems” | Count in `Suggested.lean` | 5 `def` (lines 58, 93, 97, 112, 117), bodies not `sorry` | 5 `theorem`, 5 `sorry` warnings at lines 67, 79, 101, 123, 134 | Agrees; none |

Rows for the untouched statements stand as in the previous review, of `dfd2dd1`.

- Pull request text: title and 5 prose paragraphs plus the 3 summary paragraphs read against `TauCetiRoadmap/ArcTopologyAndDescent/README.md` lines 3, 7, 399, 486, 762, 854, 952, 966, 999, 1009, 1110, 1420, 1450–1463, 1479, 1554, 1644; 0 sentences contradicted. The pull request adds the roadmap (3 files, 1,816 insertions, 10 declarations, nothing removed or renumbered), as the text says.
- Change check: 0 folder lines changed since `dfd2dd1`; 0 paths outside the folder against `origin/main`; no seeded target falls in a changed passage.
- Sources: 1 locator reopened for the description's bounds, BM21 Theorem 7.3, p. 56 (BM21 lines 2340–2345): hypotheses and both bounds agree.
- Signatures: the 10 supplied elaborated types compared with the file; 0 lost binders; both affinoid theorems keep `IsAlgClosed K`, `CompleteSpace K` and `NontriviallyNormedField K`. Imports: `Mathlib` and `TauCeti.RingTheory.Huber.TopologicallyFiniteType.Basic`, as the description says.
- Gate: every scanner 0 and `OK`, with the worker's targeted build `lake build TauCetiRoadmap.ArcTopologyAndDescent.Suggested` passing; standalone elaboration: 5 `sorry` warnings, nothing else.
- Dependency check output: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Overlaps data: 0 other open heads changing this folder, 0 cited ids dropped, 0 ids only an open revision defines, 0 second copy. A search of the open heads and main for arc-covers, arc-sheaves, arc_t and Milnor excision returned 9 other roadmaps; none states this roadmap's targets.

Overlap check: read PrismaticCohomology (§2.0 owns the scheme v- and arc-cover predicates, torsion arc-descent and arc_p; cited here at README lines 85 and 399), SchemeAndStackFoundationsPartII, DiamondsAndVStacksPartII and EtaleDualityAndPerverseSheavesPartII (consumers citing this roadmap's §§1.5–1.7 and 11.2), PrismaticCohomologyPartIII (cites BM21 Corollary 6.17 for its own comparison), DiamondsAndVStacks, PerfectoidSpaces and EnhancedDerivedSheaves on main (suppliers of spectral, perfectoid and enhancement inputs); nothing shared beyond these cited interfaces, each with its one owner as listed.

Source independence: changed passages only — 0 folder passages changed; 3 summary paragraphs of the description compared with 1 source (BM21 lines 93–108, 1802–1845, 2340–2345), none shared; largest share BM21, unchanged; no layer added, removed or reordered, so the contents comparison stands as in the earlier reviews.

## Not verifiable

- HUB96 remains settled as uncertified; cited by printed locators only.

## Source issues

- none

## For the human reviewers

- HUB96 is cited by printed locators; its full text remains paywalled (`TauCetiRoadmap/ArcTopologyAndDescent/README.md:129`).
