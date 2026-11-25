# Review of CoverTimeBoundsByEffectiveResistance (pull request #3122 at fe91f9d)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason, and it is about ownership, not truth: on connected networks the three-point identity 1.1 (a) is the theorem that the open roadmap SpectralSparsification already plans as its 2.1, with the same route, so it has two owners. Every statement, route and Check was recomputed exactly and no mathematical error was found; all source locators agree with the texts. There are no small corrections and two format notes. Two questions are left for the human reviewers (the weight of textbook exercises among the sources, and the roadmap's relation to HittingAndCoverTimes).

## R01 (P2) — On connected networks, 1.1 (a) is the identity SpectralSparsification 2.1 already plans, proved by the same route, so the theorem has two owners

An implementer of both roadmaps would prove the same lemma twice, and neither README tells them so. SpectralSparsification (pull request #2964, a new roadmap) states in its 2.1 (`TauCetiRoadmap/SpectralSparsification/README.md`, lines 169–194; `Suggested.lean`, line 126, `dotProduct_inv_groundedLaplacian_mulVec`) that on a connected network, for every grounding `z`, `bᵀ (L_z)⁻¹ b = R(x ↔ y)` with `b = δ_x − δ_y`. Taking the pair `a`, `x` and writing `G = (L_z)⁻¹`, this is `G(a, a) − G(a, x) − G(x, a) + G(x, x) = R(a ↔ x)`, which is the display of step 6 of the route of 1.1 (a) here (`README.md`, lines 118–123). Steps 3 and 4 here (lines 103–113: invertibility through the uniqueness of the Dirichlet problem, `L_z G = 1`, column sums, `Σ_y c(a, y)(u a − u y) = 1`, then `effResistance_eq_div`) are steps 1 and 2 there. What 1.1 (a) adds is the symmetry of `G`, the three definitional readings `R(a ↔ z) = G(a, a)`, `R(x ↔ z) = G(x, x)`, `voltage a z x = G(x, a)`, and the degenerate and disconnected cases of steps 1 and 2. The pull request's description names SpectralSparsification as "a neighbour that is not a dependency"; the README's scope section does not mention it at all.

The smallest change keeps the statement of 1.1 (a) and its steps 1 and 2, and replaces steps 3 to 6 by a citation: for connected `N` and distinct `a`, `x`, `z`, SpectralSparsification 2.1 at the grounding `z` and the pair `a`, `x` gives `G(a, a) − G(a, x) − G(x, a) + G(x, x) = R(a ↔ x)`; `G` is symmetric (`Matrix.IsSymm.inv`), and the three entries are `R(a ↔ z)`, `R(x ↔ z)` and `voltage a z x` by definition. SpectralSparsification 2.1 then enters the `*Needs:*` line of 1.1, the Dependencies of Layer 1, the supplier contracts and the scope section, and `existsUnique_isHarmonicAt` and `effResistance_eq_div` leave the needs of 1.1. If you would rather have this roadmap own the identity, the scope section must say so and SpectralSparsification 2.1 must cite 1.1 (a) instead; as it stands neither cites the other.

## N01 — The locator sentence of 1.1 (a) is hard to parse

In 1.1 (a), lines 77–79, "for connected networks: LP, Exercise 2.62 (a), (b), (d), p. 65, for simple networks, and Exercise 2.68" reads as two competing restrictions. LP state 2.62 for finite, connected, simple networks and 2.68 for every finite network; saying that once for each exercise would remove the ambiguity.

## N02 — The page numbers of LP hold in one version of the online edition only

The References give "the corrected and updated edition on the first author's site" without its date. Pages 65, 69 and 73 are those of the version of 19 August 2026; in the 2016 online version on the same site Exercise 2.62 is on p. 64, 2.108 on p. 71 and 2.132 on p. 74. ElectricalNetworksAndRandomWalks gives the version date in its References; the same clause here would pin the pages.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 (a) `voltage_eq_effResistance` | all 136658 triples on graphs with ≤ 5 vertices, with and without a loop 3/2, disconnected included; `a = z`, `x = z`, `x = a` | path 0–1–2: voltage `(2, 1, 0)`, `(2 + 1 − 1)/2 = 1`; edge plus isolated vertex: every voltage and resistance `0` | holds | R01 (ownership only) |
| 1.1 (b) `meanHittingTime_walk_eq_sum_effResistance` | 19498 pairs against the first-step linear system; `a = z`; disconnected control | path: `E_0 τ_2 = 4`, `E_1 τ_2 = 3` both sides; swapped variant gives `1 = E_2 τ_1`; disconnected: `1` against `0` | holds; connectivity needed | none |
| 1.2 `inv_add_inv_le_effResistance` | 4448 edges, loops included; algebra of the route | `K₄`: `1/2 = 1/4 + 1/4`; path: `5/6 ≤ 1`; star: `R = 1`; numerator `s² − 4p = (α − β)²` | holds, equality on `K₂`, `K₄` | none |
| 2.1 (a) `meanCoverTime_le_sum_effResistance` | 3022 spanning trees, every start, exact cover times; `n = 1` | path: `4, 5 ≤ 8`; triangle: `3 ≤ 8`; 4-cycle: `6 ≤ 18`; one vertex: `0 ≤ 0` | holds | none |
| 2.1 (b) `meanCoverTime_le_totalWeight_mul` | connected graphs on ≤ 4 vertices (with and without a loop) and on 5 vertices with ≤ 6 edges; conductance `1/4`; loop `5` | loop 5: `6 ≤ 7`, above `2m(n − 1) = 2`; conductance `1/4`: `1 > 1/2`; no edge: `∞ > 0` | holds; each hypothesis needed | none |
| 2.2 `meanCoverTime_le_three_mul_sq` | 19 connected regular graphs ≤ 5 vertices; `K₄`, `K₇`, cube, 5- and 8-cycle; four negative controls | `11/2`, `147/10`, `1996/95`, `10`, `28`; `p, q` cycle: `104.01 > 48`; lollipop: `1533 > 1452`; loops 12: `13 > 12` | holds; each hypothesis needed | none |
| Route of 2.2 | the count | `(n − 1) − (nd/2 − n + 1)·2/(d + 1) = (3n − d − 3)/(d + 1)`; cube `108` | correct | none |
| Layer 2 Examples (Matthews by `R_max`, loops) | 4-cycle; looped path | `R_max = 1`, `4 ≤ 6 ≤ 8·11/6`; looped path: `c_G = 7`, cover `17/2`, between `8` and `14` | correct | none |
| Copied definitions | compared body by body with ElectricalNetworksAndRandomWalks on main and HittingAndCoverTimes at its open head | 14 declarations (structure, 12 definitions, instance) identical | agree | none |

- Source locators checked against the text: 8 of 8 (LP Exercises 2.62, 2.68 p. 65, 2.108 p. 69, 2.132 (a), (d) p. 73; LPW Theorem 11.5 and (11.12) p. 154, Theorem 11.6 p. 155), with the attributions to Tetali, Aleliunas et al. and Coppersmith–Feige–Shearer.
- Library declarations opened at the pins: 19 (16 Mathlib, 3 Tau Ceti), all present with the stated hypotheses, including `Measure.markovChainLaw_restrict_map_stoppedValue_shift_iterate_eq_smul` in `TauCeti/Probability/MarkovChain/StrongMarkov.lean`, line 115.
- Cross-roadmap citations resolved: ElectricalNetworksAndRandomWalks 1.1, 1.2, 2.1, 2.2, 2.3, 2.5, 3.2, 3.3 on main; HittingAndCoverTimes 1.1, 1.4, 4.1, 4.2, 4.3 at its open head; GeometricTopology 4.4.5 on main. All exist with the cited names and hypotheses.
- Elaboration of `Suggested.lean`: six `sorry` warnings, nothing else; no `set_option`, no sorried data. `#check` of the 19 declarations compared with the README: generality agrees; the binders the definitions drop (`MeasurableSingletonClass`, `Fintype` in `graph`) are dropped in the owners' files too.
- One-tactic probe (`rfl`, `simp` with the definitions unfolded, `exact?`): none of the six theorems closes. No padding.
- Dependency check: `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing in the pull request lies outside the folder.
- Automatic checks: all passed. Pinned Mathlib and Tau Ceti contain no effective resistance, cover time or commute time.
- Headline theorems (Tetali with the three-point identity, the spanning tree bound with its `c_G (n − 1)` form, the edge bound, the `3n²` bound): all stated in `Suggested.lean`.

Overlap check: read HittingAndCoverTimes, SpectralSparsification, ElectricalNetworksAndRandomWalks and Layer 3 of LaplacianSpectraAndSpanningTrees; the three-point identity on connected networks is shared with SpectralSparsification 2.1 (owner to be settled, R01); mean hitting and cover times, the hitting time identity and Matthews' bounds are owned by HittingAndCoverTimes and cited; Kirchhoff's formula is owned by LaplacianSpectraAndSpanningTrees and excluded here.

Source independence: 10 passages compared with 2 sources, none shared (the route of 1.2 uses a Dirichlet test function where LPW glue vertices; the route of 2.1 uses leaf induction and stopping times where LPW use a depth-first search); largest share LP, 5 of 8 locators; contents compared with LP: independent (the cited exercises are scattered through LP §2.11, and Layer 2 follows the dependency of 2.2 on 2.1 and 1.2).

Research link: The headline bounds are Tetali (1991), Aleliunas–Karp–Lipton–Lovász–Rackoff (1979) and Coppersmith–Feige–Shearer (1996), as attributed in LP (comments on Exercises 2.108, 2.132) and LPW (notes to Chapter 11), which I read; they are the resistance method behind the later `2n²` bound of Feige (1997).

## Not verifiable

- The original papers of Tetali, of Aleliunas, Karp, Lipton, Lovász and Rackoff, and of Coppersmith, Feige and Shearer were not read; the README gives them no locator and attributes them as LP and LPW do, which was checked.
- Ownership against open pull requests was checked through the roadmap search over all open heads, not by reading every roadmap.

## Source issues

- none

## For the human reviewers

- **Scope.** Five of the README's eight source locators are exercises of Lyons–Peres (2.62, 2.68, 2.108, 2.132); the three others are two theorems of Levin–Peres §11.4. The results are attributed to refereed papers of 1979, 1991 and 1996, which the README does not cite directly.
- **Scope.** The roadmap has two layers and six theorems, and supplies exactly the items that HittingAndCoverTimes (open, same author) lists as not treated; whether it stands alone or belongs with that roadmap is yours to decide.
