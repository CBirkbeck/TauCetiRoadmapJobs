# Review of ArithmeticKTheory (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 24 lines changed since `e7914b5`: accepted, with no finding. The three small corrections of the previous review are repaired: §9.1 now takes Hadamard's inequality from the pinned Tau Ceti (`OrthonormalBasis.norm_det_le_prod_norm`, which is proved there and has the form the route of §9.1 uses), the overview names Layer 8 for the K₂ examples, and the description names ArithmeticKTheory §9.1 among the sections the pull request adds. One format note is carried over; nothing is left for a human to decide.

## N01 — The *Needs:* line of 9.1 names no carrier for the complex or its homology

Carried over, not repaired. The statement of 9.1 is about `H_k(C_•)`, but its *Needs:* line (line 4543) lists only determinants, linear independence, torsion, the index–determinant theorem and Hadamard's inequality. Naming the carrier (Mathlib `ChainComplex` with `HomologicalComplex.homology` in `ModuleCat ℤ`, or the kernel of one ℤ-linear map modulo the range of another) would tell an implementer which form the statement takes.

## Previous findings

The previous review had no finding (no R-numbered remark). Its other remarks:

- C01 — repaired: "Tau Ceti `OrthonormalBasis.norm_det_le_prod_norm` (Hadamard's inequality)" in the *Needs:* line of 9.1 (line 4544), in the Dependencies of Layer 9 (line 4556) and under "From Tau Ceti" (line 4814); the SuccessiveMinima subsection is gone and nothing else cites that roadmap.
- C02 — repaired: line 56 reads "Layer 8's examples include K₂ of two rings of integers".
- C03 — repaired: the description lists "ArithmeticKTheory §9.1" among the sections "this pull request adds to suppliers it already had"; with C01 applied the roadmap gains no supplier, so nothing further is unstated.
- N01 — not repaired: written again above.

## Verified sound

| Statement | Instance | Values computed (left side / right side) | Result |
| --- | --- | --- | --- |
| Hadamard supplier of 9.1 (changed) | Tau Ceti `Analysis/InnerProductSpace/Gram/Hadamard.lean:77` | `‖b.toBasis.det v‖ ≤ ∏ i, ‖v i‖`, any `Fintype ι`, `RCLike 𝕜`, proved, public / README: norm of the determinant at most the product of the norms | same statement; dependent families allowed |
| 9.1 route with that supplier | `ℤ² → ℤ²`, boundaries `(2,1)`, `(−1,2)`, standard basis of `ℝ²` | `\|det\| = 2·2 − (−1)·1 = 5` / `√5·√5 = 5` | holds, equality; `#H₀ = 5 ≤ b^a = 5` |
| 9.1 route, completion by unit vectors | `ℤ →(2,0) ℤ²`, completed by `(0,1)` | `\|det\| = 2` / `2·1 = 2`; torsion of the cokernel `ℤ/2` | holds; unit vectors contribute factor 1 |
| 9.1 against the source (seeded sample) | `soule-perfect-forms` lines 175–182, 220–257 | source: `b(k) = max(sup‖∂σ‖, 1)`, `a(k)` = smaller basis size, bound `b(k)^a(k)`, attributed to Gabber / README: any `b ≥ 1` bounding the norms, `a` the smaller rank | supported at Lemma 1, p. 5 and Proposition 3, p. 6 |
| 3.2 *Needs:* (changed citation) | GeometricTopology on `main` | §1.1 "Smooth collars" (line 788), §1.3 "Gluing along the boundary and handle attachment" (line 851) / README: "smooth collar and gluing" | both sections exist and state what is cited |
| Overview, line 56 (changed) | Layer 8 and Layer 9 Examples | K₂(ℤ[i]) and K₂ of the integers of ℚ(√5) are in Layer 8 / Layer 9's examples are `ℤ/b` and the index-5 quotient | sentence now true |

The rows of the previous review for untouched statements stand as in the previous review, of `e7914b5`.

- Source locators checked against the text: 2 (`soule-perfect-forms` line 175, Lemma 1, p. 5; line 240, Proposition 3, p. 6), the one seeded target that the changed text cites (9.1). The other fourteen seeded targets lie in untouched text and were not re-read.
- Library declarations opened at the pins: Tau Ceti `OrthonormalBasis.norm_det_le_prod_norm` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:77`; the file path given in the README is right).
- Cross-roadmap citations resolved: GeometricTopology §§1.1 and 1.3 on `main` (a supplier the roadmap already had, earlier in the merge order). SuccessiveMinima is no longer cited anywhere in the README. The consumer BernoulliBoundsForClassGroupEigenspaces (README lines 258, 293 at this head) cites this §9.1, unchanged.
- Dependency check: `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Every file the pull request changes against its base lies in this folder or in one of the folders the pull request owns; none outside `TauCetiRoadmap/`.
- Elaboration of `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` (unchanged since the previous review): `declaration uses sorry` at lines 67, 73, 98, 115, nothing else. No headline added or removed; the layer record is kept (Layers 1–8 of the merge base, plus Layer 9).
- Overlap check: read ArithmeticKTheoryPartII, KTheoryFiniteLocalFields, CyclotomicClassGroupsAndStickelberger, K2SymbolsBrauerPartII (as in the previous review; the list of closest roadmaps by results is empty); nothing shared with the change. The one other open pull request that changes this folder merges cleanly with it; no cited id is dropped by an open pull request.
- Source independence: changed passages only; 3 passages compared (the *Needs:* line and Dependencies of Layer 9, the new "From Tau Ceti" paragraph) with 1 source (`soule-perfect-forms`), none shared; largest share the K-book, 81 of about 300 lines carrying a page locator, as in the previous review; the arrangement was not compared again, since the change adds, removes and reorders no layer.
- Research link: §9.1 is the lemma Soulé (1999) combines with Voronoi's complex of perfect forms to bound the torsion of `H_k(SL_N(ℤ))` and of `K_m(ℤ)`, toward the Vandiver conjecture on which Layer 7's conditional tables depend; rests on `soule-perfect-forms` §§2.2–2.3 and the README overview.

## Not verifiable

- The published version of Soulé's paper in the Journal für die reine und angewandte Mathematik was not read; the README cites the arXiv version 1 by its own numbering, which is what was checked.
- The description of the pull request was read in the copy supplied for this review, which is cut short; the sentences beyond the cut were not read against this head.

## Source issues

- **Misprint** in soule-perfect-forms at §2.2, the display before (15), p. 6: the source says the boundary of `c` is a sum over `c′` with coefficients indexed by σ, σ′; it should be the boundary of σ as a sum over σ′ in the basis of degree k; affects nothing.

## For the human reviewers

- none
