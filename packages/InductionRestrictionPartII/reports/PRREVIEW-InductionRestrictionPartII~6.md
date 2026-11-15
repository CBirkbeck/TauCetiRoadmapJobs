# Review of InductionRestrictionPartII (pull request #1154 at a3cedf1)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `a3cedf1`; this round reads the pull request's title and description against the head. No finding of this report.

## Deferred findings

- D01 — stands

## Previous findings

- none: the previous report, of `a3cedf1`, listed no finding.

## Verified sound

The folder did not change, so no statement changed. Rows are for the statements the description's prose names, on instances not used in the earlier reviews.

| Statement | Instances | Computed left side / object | Computed right side / prediction | Result | Change |
| --- | --- | --- | --- | --- | --- |
| RS.6.8 `antidiagonal_multiplier` (description: “inclusion-induced map … a bijection” for odd-order base) | G=C₃; G=C₅² | M(C₃)=0; M(C₅²)=Λ²=C₅ | F(C₃)=S₃, M=0; F(C₅²)=C₅²⋊C₂, inversion acts on Λ² by (−1)²=1, coinvariants C₅ | bijective in both | — |
| RS.6.8, negative control for “odd” | G=C₂² | M(G)=C₂ | inversion trivial, F(G)=C₂³, M=C₂³ of order 8 | not onto; `hodd` excludes it | — |
| RS.6.8 `abelian_multiplier_exteriorSquare` (description: “every abelian group”) | A=ℤ²; A=ℚ; A=C₂×C₄ | Λ²: ℤ; 0; C₂ | H₂: ℤ (torus); 0 (directed union of ℤ); C₂⊗C₄=C₂ | agrees, infinite groups included | — |
| RS.4.10 `two_adic_survival` (summary: “a two-adic threshold decide[s] survival”) | A=ℤ/2 additive, b=1; q=3, 5 | 2h=1: no solution; 4h=2·1=0: solvable | B₀=0, B₁=B, threshold 1; v₂(q−1)=1, 2; need ≥2 | agrees | — |
| RS.4.18 `parity_degree_generatingSeries` (summary: “translated weight polynomials count the surviving degrees”) | N=1, N₀=0, C={0}; N=1, N₀=1, C={0} | even m≥0: 1 at even n; even m≥1: 1 at n=2,4,… | 1/(1−X²); X·X/(1−X²)=X²+X⁴+… (translate {1}, weight X) | agrees | — |
| RS.4.5 fixed-fiber count (summary: “empty or … torsion cardinality”) | A=ℤ/4, r=1 (q=3), b=1 and b=2 | 2h=−1: 0 solutions; 2h=−2=2: h=1,3, 2 solutions | 1∉2A+A[1]: 0; 2∈2A: \|A[2]\|=2 | agrees | — |
| Description's counts | `Suggested.lean` at head | 3 abbreviations, 6 definitions, 8 sorried theorems; layer comments RS.0, RS.4, RS.6 | “17 Lean declarations, including eight headline theorems … under RS.0, RS.4 and RS.6”; five layers RS.0, RS.1, RS.3, RS.4, RS.6 | agrees | — |

The rows for the untouched statements stand as in the previous review, of `a3cedf1`.

- Pull request text against the head, sentence by sentence: title; new roadmap, five layers, README, metadata, 17 declarations, eight headlines; pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d` (equal to `lake-manifest.json`); exactness by a low-degree resolution argument and power law by a bar-complex boundary, neither with finiteness (RS.0.1, RS.1.1); integer and negative degrees (RS.4.5); parity identities for arbitrary binary linear maps (RS.4.15, RS.4.17); nonabelian multipliers as hypotheses and abelian Table 2 entries from the formula (RS.6.10); supplier IG.3.4–IG.3.5 and IG.5.6; consumers Part V and Part VIII §5.21 with RS.4.2–RS.4.5 and RS.4.18 (`## Downstream consumers`). No sentence contradicted, no removal, renumbering or supplier change left unstated.
- Library declarations opened at the pins: 1 (`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:184`, `groupHomology.natCard_nsmul_eq_zero`, as the description names it).
- Cross-roadmap citations resolved: IG.3.4, IG.3.5, IG.5.6 are headings at the InverseGaloisAndArithmeticFundamentalGroups head; ArithmeticStatisticsPartVIII §5.21 and ArithmeticStatisticsPartV §3.27 exist at their heads, and Part V cites RS.1, RS.3, RS.6.4–RS.6.6 here; RepresentationTheory/InductionRestriction, AlgebraicTopology, ProfiniteArithmetic and AlgebraicCodingTheory (the last two completed) are on main. Overlap tool: no dropped id, no second copy, no other pull request changing this folder.
- Source locators: 0 rechecked; no passage changed, and the 15 sampled targets stand as checked in the earlier reviews.
- Gate rerun on this head: every scanner zero, OK. Dependency check: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD or CYCLE line. Files changed outside the folder: 0.
- Lean: direct elaboration succeeds with eight `sorry` warnings only (lines 47, 53, 82, 90, 104, 168, 186, 196); `import Mathlib` plus two Tau Ceti modules; no `set_option`; the 17 elaborated signatures show no lost binder; the file is byte-identical to the one probed before, so the one-tactic probes stand.

Overlap check: read InverseGaloisAndArithmeticFundamentalGroups, ArithmeticStatisticsPartVIII, ArithmeticStatisticsPartV and FiniteGroupExtensionSplitting; IG owns covers, commuting-pair classes and the marked action; the involution-fiber reduction and parity series shared with Part VIII are owned here and named as consumed by Part VIII §5.21 (the import on Part VIII's side is D01); nothing else shared.

Source independence: changed passages only; 0 passages changed, so 0 compared; largest share wood2019, 30 of 42 primary source blocks; no layer added, removed or reordered, so the arrangement stands as compared earlier: independent.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Scope.** `TauCetiRoadmap/InductionRestrictionPartII/README.md` References cite withdrawn evw2012 for RS.1.4 and RS.6.1; published wood2021 and lwzb2024 are cited alongside it.
- **Licence.** `TauCetiRoadmap/InductionRestrictionPartII/README.md` References cite loeh2019, unpublished lecture notes hosted on the author's institutional site; no passage, table or figure of it is reproduced.
