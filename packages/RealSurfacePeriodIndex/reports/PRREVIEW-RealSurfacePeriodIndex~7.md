# Review of RealSurfacePeriodIndex (pull request #2462 at 9a4f307)

**Verdict:** accepted

**Summary.** Accepted. The folder is unchanged since the previous review of this head, so this round reads the title and description as they now stand against the head: every sentence of the prose and of the opening summary block agrees with the README and `Suggested.lean`, and the dependency paragraph now names the three statements asked of roadmaps on main, which was the previous review's one small correction. No finding and no small correction; one format note is carried over, not blocking. The points left for the human reviewers are unchanged.

## N01 — "QuadraticFormInvariantsPartII §6.0, Corollary 2.5" still reads as that roadmap's numbering

Unchanged: in §0.3 (line 108), §0.5 (line 165) and §7.5 (line 1904), "Corollary 2.5" is a number of the lecture notes that §6.0 cites, not of §6.0. "the statement §6.0 takes from Kuhlmann's Corollary 2.5" would let a reader find it.

## Previous findings

The previous report (of this same head) had no finding; its small correction and format note are accounted for here.

- C01 (description silent on the three results asked of suppliers on main) — repaired: "Three further statements are asked of roadmaps on main that do not make them yet; the README states each as a contract under its supplier, and each needs a revision of that roadmap".
- N01 — not repaired: written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: "the bound ind \| 2·per for function fields of surfaces over any real closed field" (§2.10, `index_dvd_two_mul_orderOf_of_isRealClosed`) | Over ℝ(x,y): Albert's class (x,x)+(y,xy); (−1,−1); the trivial class | per 2, ind 4: 4 ∣ 4, and 4 ∤ 2 so the factor 2 is needed; per 2, ind 2: 2 ∣ 4; per 1, ind 1: 1 ∣ 2 | description, README overview and Lean signature (`[IsRealClosed R]`, trdeg 2, finitely generated) agree | none |
| Description: "at most 4 in transcendence degree 2 and equals 4 for function fields of real surfaces", "the u ≤ 4 and isotropy results drop finite generation" | K = ℂ(x,y); K an algebraic closure of ℝ(x,y); ⟨1,1,1,1,1⟩ over ℝ(x,y) | ⟨1,x,y,xy⟩ anisotropic of dimension 4, K nonreal, so u = 4; algebraically closed K has u = 1 < 4, so sharpness needs finite generation; rank 5 odd, 2·dim W = 5 impossible, form excluded | upper bound has no `Algebra.EssFiniteType`, sharpness has it (file lines 128–148); description agrees | none |
| Description: the three statements asked of roadmaps on main | ComplexComparisonPartII §C6.3; MotivesAndAlgebraicCycles §7.8; AlgebraicTopologyPartII §16.2 | §C6.3 (line 4898): X of finite type over ℂ only; §7.8 (line 1463): "torsion-free divisor cokernel" used, not named; §16.2 (line 1675): invariant control data "Suppose given" | each sentence of the description is true of main, and matches the README contracts (lines 2757, 2763, 2773) | none |
| Description: "QuadraticFormInvariantsPartII calls this roadmap's Layer 0 'Layer PI.0'" and "(§§5.1, 5.6) … (§6.0)" | that roadmap on main | lines 118 and 2030 name Layer PI.0 with the level and the quadric-level computations; headings 5.1 (line 1542), 5.6 (1622), 6.0 (1698) exist | true; README scope paragraph (line 2692) says the same | none |

The rows for the untouched statements stand as in the previous review, of 9a4f307.

- Description read against the head: title, the opening summary block and every sentence of the prose. "eight headline theorems": 8 theorems and 1 definition in the file; the carriers named as missing match the module docstring (lines 38–53); "one misprint" in Colliot-Thélène's account is source correction E24 (line 2669), and E1–E23 contain errors, gaps and misprints of B19; "characteristic zero" matches `[CharZero k]`; the folder holds the three files named.
- Cross-roadmap citations resolved for the description: QuadraticFormInvariantsPartII §§5.1, 5.6, 6.0 and EnriquesSurfaces §§1.1, 1.3, 1.4 (lines 123, 181, 205) on main; HeightsRationalPointsAndObstructions §§2.16b and 2.19a (with `smoothBrauer_residueExact`, `finiteFlatBrauerCorestriction`) and PurityForFlatCohomology §8.4 at their open heads, the two pull requests the merge order names.
- Declared gaps: three, the same slugs in the contracts; each still unprovided by its supplier, precise and minimal (table row 3).
- Elaboration of `Suggested.lean`: `sorry` the only warning (8 warnings, 0 errors); the file is unchanged, so the signature comparison and the one-tactic probe of the previous review stand.
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line; no change outside the roadmap folder.
- Automatic checks: run again at this head, all passed.
- Library declarations and source locators: none newly opened; nothing in the folder changed.

Overlap check: read QuadraticFormInvariantsPartII, QuadraticFormInvariants and AlgebraicTopologyPartII (main); the open lists (LogicAndDefinabilityInNumberTheoryPartII, HeightsRationalPointsAndObstructions, SchemeAndStackFoundations) stand as searched in the previous reviews; C_i fields, Tsen–Lang and real closures of ordered fields: QuadraticFormInvariantsPartII, cited; the level of a field: assigned here by main, declared not planned here, stated by no roadmap read; no other open pull request changes this roadmap and none drops an id it cites.

Source independence: changed passages only; the folder did not change, so 0 passages compared with 0 sources in this round; largest share B19, 132 of 258 locators; no layer added, removed or reordered, so the comparison of contents with B19 stands as in the previous reviews: independent. Thirteen sources cited by locator were not read.

Research link: The headline targets are the theorems of Benoist 2019 (period-index for function fields of real surfaces), with de Jong's theorem, Pfister's conjecture u ≤ 4 in transcendence degree 2 and Lang's conjecture for quadrics; Layers 3–8 feed the integral Hodge questions of Benoist–Wittenberg 2020. Rests on B19 §§0.1–0.5 and the README's "Downstream consumers".

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85: paywalled, cited by locator.
- The description's sentence on the number of review rounds before the port describes the job board, not the folder; not checked.
- The seeded sample falls outside the changed passages (there are none); its targets stand as checked in the earlier full review.

## Source issues

- none

## For the human reviewers

- Arrangement: the roadmap is built on one article (B19, about half of the locators); Layers 3, 5, 4, 8, 9 have the scope of its §§3, 4, 5, 7, 8, in an order the Dependencies lines force. Whether that is independent enough is yours to judge.
- Scope: de Jong's theorem is planned in characteristic zero only (§2.9, `[CharZero k]` in `Suggested.lean`, README line 2692); B19 Theorem 0.1 states it for every algebraically closed field. No roadmap searched plans the positive-characteristic case.
- Not tested: thirteen sources are cited by locator without their text (BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85); the wording was not compared with them.
- Ownership: QuadraticFormInvariantsPartII on main (README lines 116–118) assigns the level of a field and the quadric-level computations to this roadmap's "Layer PI.0"; this roadmap says it plans neither (line 2692), so they have no owner until that roadmap is revised.
- The roadmap asserts that B19's Proposition 4.4 is false as printed and gives an example (§5.5 Checks); an earlier review recomputed it, but the claim concerns a published theorem and deserves a specialist's eye.
