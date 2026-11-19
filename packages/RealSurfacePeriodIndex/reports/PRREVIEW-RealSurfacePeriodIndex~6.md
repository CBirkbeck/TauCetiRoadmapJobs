# Review of RealSurfacePeriodIndex (pull request #2462 at 9a4f307)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the two lines added to "Scope and ownership" since f569636, and a first reading of the title and description as they now stand: the new scope paragraph is true and supported at its locators (B19 Theorem 0.1 and §0.6, BW20 Example 2.5, the pointer in QuadraticFormInvariantsPartII on main), and it repairs the two scope points of the previous review; the description's dependency paragraph now agrees with the head. There is one small correction (the description does not say that three results are asked of roadmaps on main that do not state them yet) and one format note carried over, neither blocking. The points left for the human reviewers are unchanged.

## C01 — The description does not mention the three results asked of suppliers on main

A reader of the description's dependency paragraph concludes that, once the two open pull requests of the merge order have merged, everything the roadmap consumes is stated by its suppliers: "Roadmaps on main are cited by name. The open pull requests in the merge order below must merge first." The only follow-up it names is the pointer in QuadraticFormInvariantsPartII. The README, in "Exact supplier contracts" (lines 2757, 2763 and 2773), asks three roadmaps on main for statements they do not make at present: ComplexComparisonPartII §C6.3 for the étale–equivariant comparison over ℝ (that roadmap's §C6.3 is the complex Artin comparison), MotivesAndAlgebraicCycles §7.8 for the torsion-free cokernel of cl : Pic(X) → H²_G(X(ℂ), ℤ(1)) as a named result (its §7.8, README line 1463, uses it inside the divisor theorem), and AlgebraicTopologyPartII §16.2 for the existence of invariant control data (its §16.2, line 1675, takes them as a hypothesis, and its §16.1c gives compatible control data with no invariance).

One sentence in the dependency paragraph would do, for example: "Three statements are asked of roadmaps on main and need a revision of each: the étale–equivariant comparison over ℝ (ComplexComparisonPartII §C6.3), the torsion-free cokernel of the real cycle class map on Pic as a named result (MotivesAndAlgebraicCycles §7.8), and the existence of invariant control data (AlgebraicTopologyPartII §16.2); the README states each under the supplier contracts."

## N01 — "QuadraticFormInvariantsPartII §6.0, Corollary 2.5" still reads as that roadmap's numbering

Unchanged from the previous review: in §0.3 (line 108), §0.5 (line 165), §7.5 (line 1904) and the supplier contract (line 2791), "Corollary 2.5" is a number of the lecture notes that §6.0 cites, not of §6.0. "the statement §6.0 takes from Kuhlmann's Corollary 2.5" would let a reader find it.

## Previous findings

The previous report (of f569636) had no finding; its small corrections and format notes are accounted for here.

- C01 (description's dependency paragraph out of date) — repaired: "QuadraticFormInvariantsPartII (on main) supplies C_i fields and the Tsen–Lang theorem (§§5.1, 5.6) and real closures of ordered fields (§6.0). EnriquesSurfaces §§1.1, 1.3 and 1.4 … is on main."
- C02 (main assigns the level to this roadmap) — repaired here: "QuadraticFormInvariantsPartII cites Layer 0 of this roadmap as Layer PI.0. The level of a field … is not planned in this roadmap." (line 2692). The pointer on main is unchanged (human reviewers, below).
- C03 (scope silent on positive characteristic) — repaired: "De Jong's theorem is planned in characteristic zero (§2.9) … its case of positive characteristic … is not planned here." (line 2692).
- N01 — not repaired: written again above as N01.
- N02 (real closedness of the Puiseux field is statable) — an offer, not taken up; nothing further.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Scope sentence on de Jong, against §2.9 and `index_eq_orderOf_of_isAlgClosed` | k = ℂ, K = ℂ(x,y), class (x,y); trdeg 1; k of characteristic p | (x,y): per 2, ind 2; trdeg 1: Br = 0, 1 = 1 (excluded by trdeg = 2); characteristic p excluded by `[CharZero k]`, B19 Theorem 0.1 covers it | scope sentence agrees with README §2.9, the Lean binder and B19 lines 24–25, 198–200 (p. 68; reference 44 is Lieblich, line 1912) | none |
| Scope sentence on the level, against BW20 Example 2.5 | conic x²+y²+z² = 0 over ℝ; anisotropic quadric of dimension n | conic: −1 = (x/z)² + (y/z)², level ≤ 2; BW20: −1 a sum of 7 squares in ℝ(X) iff n ≤ 6 (lines 1314–1317) | the example does use levels of such function fields; no target on the level in this README (only "ramified level") | none |
| "QuadraticFormInvariantsPartII cites Layer 0 of this roadmap as Layer PI.0" | that roadmap on main | its README lines 116–118 and 2029–2030 name "`RealSurfacePeriodIndex` Layer PI.0"; this README's only Layer of real-function-field theory is Layer 0 | true | none |
| C01: the three contracts against the suppliers on main | ComplexComparisonPartII §C6.3; MotivesAndAlgebraicCycles §7.8; AlgebraicTopologyPartII §§16.1c, 16.2 | complex Artin comparison only; cokernel used, not named (line 1463); control data compatible with f exist (16.1c), invariance a hypothesis (line 1675) | the three asks are still open and still minimal | description sentence |

The rows for the untouched statements stand as in the previous review, of f569636.

- Source locators checked against the text: 3 in the changed passage (B19 Theorem 0.1, lines 24–25; B19 §0.6, p. 68, lines 198–200; BW20 Example 2.5, lines 1314–1317); all agree.
- Cross-roadmap citations resolved for the changed passage and the description: QuadraticFormInvariantsPartII §§5.1, 5.6, 6.0 and its Layer PI.0 pointer (main); EnriquesSurfaces on main; HeightsRationalPointsAndObstructions §§2.16b, 2.19a and PurityForFlatCohomology §8.4 at their open heads; the three supplier sections of C01 on main.
- Declared gaps: three, the same slugs in the contracts; each still unprovided by its supplier and precise.
- Elaboration of `Suggested.lean`: `sorry` the only warning (8 warnings, 0 errors); the file is unchanged since f569636, so the signature comparison and the one-tactic probe of the previous review stand.
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no change outside the roadmap folder.
- Automatic checks: all passed.
- Description read against the head: title, the opening summary block and every sentence of the prose; the count "eight headline theorems" (8 theorems and 1 definition in the file), the list of headlines not statable (docstring lines 38–53), "one misprint" in CT05 (source correction E24) and the dependency paragraph agree with the head.

Overlap check: read QuadraticFormInvariantsPartII, QuadraticFormInvariants and AlgebraicTopologyPartII (main); the open lists (LogicAndDefinabilityInNumberTheoryPartII, HeightsRationalPointsAndObstructions, SchemeAndStackFoundations) stand as searched in the previous review; C_i fields, Tsen–Lang and real closures of ordered fields: QuadraticFormInvariantsPartII, cited; the level of a field: assigned here by main, declared not planned here by the new scope paragraph, and stated by no roadmap on main or open; nothing else shared by the change.

Source independence: changed passages only; 3 passages compared with 2 sources (B19 at Theorem 0.1 and §0.6; BW20 at Example 2.5), none shared beyond a definition of a dozen words; largest share B19, 132 of 258 locators (the previous review's count of 131 of 256 and the two locators the change adds, one of them B19); no layer added, removed or reordered, so the comparison of contents with B19 stands as in the previous review: independent. Thirteen sources cited by locator were not read.

Research link: The headline targets are the theorems of Benoist 2019 (period-index for function fields of real surfaces), with de Jong's theorem, Pfister's conjecture u ≤ 4 in transcendence degree 2 and Lang's conjecture for quadrics; Layers 3–8 feed the integral Hodge questions of Benoist–Wittenberg 2020. Rests on B19 §§0.1–0.5 and the README's "Downstream consumers".

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85: paywalled, cited by locator; none is cited in the changed passage.
- The description's sentence on the number of review rounds before the port describes the job board, not the folder; not checked.
- The seeded sample falls outside the changed passage; its targets stand as checked in the previous review.

## Source issues

- none

## For the human reviewers

- Arrangement: the roadmap is built on one article (B19, about half of the locators); Layers 3, 5, 4, 8, 9 have the scope of its §§3, 4, 5, 7, 8, in an order the Dependencies lines force. Whether that is independent enough is yours to judge.
- Scope: de Jong's theorem is planned in characteristic zero only (§2.9, `[CharZero k]` in `Suggested.lean`, and now the scope paragraph, README line 2692); B19 Theorem 0.1 states it for every algebraically closed field. No roadmap searched plans the positive-characteristic case.
- Not tested: thirteen sources are cited by locator without their text (BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85); the wording was not compared with them.
- Ownership: QuadraticFormInvariantsPartII on main (README lines 116–118) assigns the level of a field and the quadric-level computations to this roadmap's "Layer PI.0"; this roadmap now says it plans neither (line 2692), so they have no owner until that roadmap is revised.
- The roadmap asserts that B19's Proposition 4.4 is false as printed and gives an example (§5.5 Checks); the previous review recomputed it, but the claim concerns a published theorem and deserves a specialist's eye.
