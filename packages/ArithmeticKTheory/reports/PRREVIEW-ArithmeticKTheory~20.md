# Review of ArithmeticKTheory (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 67 changed lines since `aecb53a`. The folder's text is the one the previous review read, so its three small corrections and one format note stand unrepaired; none blocks. The new Layer 9 (Gabber's bound for the torsion in the homology of a based complex) was read again against Soulé's arXiv version 1 at Lemma 1 (p. 5) and Proposition 3 (p. 6); its statement, proof route and both Checks were recomputed, and the layer record, the supplier order and the elaboration of the unchanged `Suggested.lean` were checked. There is no finding; there are three small corrections and one format note, and nothing is left for a human to decide.

## C01 — Hadamard's inequality, which 9.1 takes from SuccessiveMinima §0.1, is already proved in the pinned Tau Ceti

Not repaired since the previous review. The *Needs:* line of 9.1 (line 4544), the Dependencies of Layer 9 (line 4556) and the subsection "From TauCetiRoadmap.SuccessiveMinima" (line 5135) take Hadamard's inequality from `orthonormal_coordinate_hadamard`, which on `main` is a `sorry` in `TauCetiRoadmap/SuccessiveMinima/Suggested.lean` (line 187). The pinned Tau Ceti proves the same inequality for any finite index type as `OrthonormalBasis.norm_det_le_prod_norm` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`, line 77). An implementer who follows the citation reaches an unproved statement, and the roadmap gains a roadmap supplier it does not need.

Naming `OrthonormalBasis.norm_det_le_prod_norm` in the *Needs:* line, in the Dependencies and under "From Tau Ceti" would fix this; the SuccessiveMinima subsection can then be dropped, or kept as a pointer to the statement's owner.

## C02 — The opening overview still calls Layer 8 "the last layer"

Not repaired. Line 56 reads "The last layer's examples include K₂ of two rings of integers". With Layer 9 added, the last layer's examples are `ℤ/b` and the index-5 quotient of `ℤ²`; the K₂ computations are in Layer 8. "Layer 8's examples include …" would be correct.

## C03 — The description does not say that this roadmap gains a layer and a supplier

Not repaired. The description says the pull request "adds no new mathematics to the plan" and that "50 existing roadmaps receive 217 sections", and names ArithmeticKTheory only in the merge-order block. A reader of this roadmap is not told that it gains a ninth layer and a new supplier. One sentence would do: "ArithmeticKTheory gains Layer 9, Gabber's bound for the torsion in the homology of a based complex of free abelian groups (Soulé 1999, Proposition 3), with Hadamard's inequality from SuccessiveMinima §0.1" (from Tau Ceti, if C01 is applied).

## N01 — The *Needs:* line of 9.1 names no carrier for the complex or its homology

Not repaired. The statement is about `H_k(C_•)`, but line 4543 lists only determinants, linear independence, torsion and the index–determinant theorem. Naming the carrier (Mathlib `ChainComplex` with `HomologicalComplex.homology` in `ModuleCat ℤ`, or the kernel of one ℤ-linear map modulo the range of another) would tell an implementer which form the statement takes.

## Verified sound

| Statement | Instance | Values computed (left side / right side) | Result |
| --- | --- | --- | --- |
| 9.1 Gabber's lemma | `ℤ →(×b) ℤ`, degrees 1, 0 | `#H₀ = b` / `b^a = b¹ = b` | holds, sharp (Check 1) |
| 9.1 | `ℤ² → ℤ²`, boundaries `(2,1)`, `(−1,2)` | `#H₀ = 2·2 − (−1)·1 = 5` / `(√5)² = 5`; largest coordinate gives `2² = 4 < 5` | holds, sharp; sup norm fails (Check 2) |
| 9.1, degenerate | `C_(k+1) = 0`, or `d = 0` | torsion order 1 / `a = 0`, `b⁰ = 1`; or `b^a ≥ 1` | holds |
| 9.1, `b ≥ 1` needed | `ℤ →0 ℤ`, `b = 1/2`, `a = 1` | torsion order 1 / `1/2` | fails without `b ≥ 1`; hypothesis is stated |
| 9.1, cycles saturated | `ℤ →(2,0) ℤ² →(0,1) ℤ`, `k = 1` | `H₁ = ℤ/2` = torsion of `coker d₂` / `b = 2`, `a = min(2,1) = 1`, bound 2 | holds, sharp |
| 9.1, `a` the minimum | `ℤ³ → ℤ²`, boundaries `(2,0),(0,2),(2,2)` | torsion order 4 / `b = √8`, `a = 2`, bound 8; chosen pair gives `2·2 = 4` | holds |
| 9.1 against the source | `soule-perfect-forms` lines 220–257 | source: `b(k) = max(sup‖∂σ‖, 1)`, `a(k)` = smaller basis size / README: any `b ≥ 1` bounding the norms | same theorem; larger `b` only weakens |
| 9.1 route (lattice index) | `L` = chosen boundaries `B′` plus unit vectors | `[C_k : L] = \|det\| ≤ ∏‖d e_i‖·1`; `B_sat ∩ L = B′` by independence | `B_sat/B′ ↪ C_k/L`, `B_sat/B′ ↠` torsion; agrees with `soule-perfect-forms` lines 175–182 |
| Hadamard supplier | SuccessiveMinima 0.1.1 / Tau Ceti | `‖det_b v‖ ≤ ∏‖v_i‖`, `Fin n`, `sorry` / same, finite `ι`, proved | C01 |
| Overview | line 69 "nine layers"; line 56 "last layer" | 9 layer headings / K₂ examples are Layer 8's | count right; C02 |
| Layer record | merge base `aecb53a` / head | Layers 1–8, eight titles / the same eight, plus Layer 9 | kept |
| `Suggested.lean` | unchanged by the pull request | 4 `sorry` warnings (lines 67, 73, 98, 115), no error | no headline added or removed |

- Source locators checked against the text: 2 (`soule-perfect-forms` line 175, Lemma 1, p. 5; line 240, Proposition 3, p. 6, with the attribution to Gabber). Of the seeded sample none falls in the changed or affected text; those fifteen targets were not re-read.
- Library declarations opened at the pins: Mathlib `AddSubgroup.index_eq_natAbs_det` (`LinearAlgebra/FreeModule/Finite/CardQuotient.lean:98`), `AddCommGroup.torsion` (additive form of `CommGroup.torsion`, `GroupTheory/Torsion.lean:371`); Tau Ceti `OrthonormalBasis.norm_det_le_prod_norm` (`Analysis/InnerProductSpace/Gram/Hadamard.lean:77`).
- Cross-roadmap citations resolved: SuccessiveMinima §0.1, 0.1.1 on `main` (README line 195, `Suggested.lean` line 187), a folder this pull request does not change; SuccessiveMinima does not cite ArithmeticKTheory. The consumer BernoulliBoundsForClassGroupEigenspaces §9.2 (README line 288 at this head) cites this §9.1 with the same hypotheses.
- Dependency check: `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside `TauCetiRoadmap/`.
- Automatic checks: all passed. Elaboration of `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean`: `declaration uses sorry` only.
- Previous findings: none (the previous review had no finding). Its C01, C02, C03 and N01 are unrepaired and restated above.
- Overlap check: read ArithmeticKTheoryPartII, KTheoryFiniteLocalFields, CyclotomicClassGroupsAndStickelberger, K2SymbolsBrauerPartII (scope sections; the list of closest roadmaps by results is empty); nothing shared with the change. A search of `main` and the open heads for Gabber's torsion bound finds no other owner; BernoulliBoundsForClassGroupEigenspaces cites this §9.1. Owner: ArithmeticKTheory §9.1. The other open pull requests that change this folder merge cleanly with it or conflict only in other folders.
- Source independence: changed passages only; 6 passages compared (the statement of 9.1, its route, its Checks, the scope sentence, the supplier subsection, the reference entry) with 1 source (`soule-perfect-forms`), none shared beyond forced phrasing (longest run 6 words); largest share the K-book, 81 of about 300 lines carrying a page locator; the arrangement was not compared with its contents beyond noting that the added layer has no counterpart there (the route by a lattice index differs from the source's by arithmetic degrees).
- Research link: §9.1 is the lemma Soulé (1999) combines with Voronoi's complex of perfect forms to bound the torsion of `H_k(SL_N(ℤ))` and of `K_m(ℤ)`, toward the Vandiver conjecture on which Layer 7's conditional tables depend; rests on `soule-perfect-forms` §§2.2–2.3 and the README overview.

## Not verifiable

- The published version in the Journal für die reine und angewandte Mathematik was not read; the README cites the arXiv version 1 by its own numbering, which is what was checked.

## Source issues

- **Misprint** in soule-perfect-forms at §2.2, the display before (15), p. 6: the source says the boundary of `c` is a sum over `c′` with coefficients indexed by σ, σ′; it should be the boundary of σ as a sum over σ′ in the basis of degree k; affects nothing.

## For the human reviewers

- none
