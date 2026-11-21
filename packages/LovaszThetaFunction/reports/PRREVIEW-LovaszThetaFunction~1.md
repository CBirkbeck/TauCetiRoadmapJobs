# Review of LovaszThetaFunction (pull request #2940 at 6863bb8)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on its degenerate cases (empty vertex type, one vertex, `k = 0`, `d = 0`, edgeless and complete graphs) and on the pentagon, the convention was checked against Knuth's text, and every Knuth locator in the README was read at its place; nothing false was found, and the one error in the source (Knuth's F6) is already repaired in the route of 1.4. There are one small correction (Layer 5 has no source locator) and three format notes, none blocking. For the humans: all locators are into a single expository source, and Lovász's and Shannon's papers were not read by the author or by this review.

## C01 — The three targets of Layer 5 carry no source locator

A reader who wants to compare 5.1–5.3 with the literature has nowhere to go: 5.1 says "attributed in prose", 5.2 and 5.3 say "Lovász's theorem", and the References entry (README lines 590–593) says that no locator into Lovász's or Shannon's paper is given. The statements themselves are sound and the routes are complete from 2.1, 3.1, 3.2, 4.1 and Mathlib's Fekete lemma, so nothing stated depends on this; it is the only layer whose targets cannot be traced to a printed statement.

The smallest change: give the theorem numbers and pages in Lovász, "On the Shannon capacity of a graph", IEEE Trans. Inform. Theory 25 (1979), 1–7 (reference [12] of Knuth's notes) for `Θ ≤ ϑ` and `Θ(C₅) = √5`, once the text has been read; or cite an open source that states them. I could not read that paper legally, so I do not supply the numbers.

## N01 — The References entry narrates what was not read

"neither was opened, and no locator into them is given" (README lines 592–593) describes the drafting, not the mathematics. Would read better as "cited for attribution only", or be replaced by the locators of C01.

## N02 — `shannonCapacity` (and `strongProd`, `strongPow`) do not carry `[Fintype V]`

The elaborated type of `shannonCapacity` is `{V : Type u_1} → SimpleGraph V → ℝ`: the section's finiteness binder is not in it. Every theorem about it has `[Fintype V]`, so no statement is affected, but on an infinite vertex type the value is a junk supremum; a clause in the Junk values paragraph of the Conventions, or the binder in the signature, would say so. For the two product definitions the generality is harmless and arguably intended.

## N03 — The eigenvalues in the pentagon Check of 1.1 are not listed in the order of `k`

In the Check of 1.1 (README lines 108–109) the values of `1/5 + ((√5 − 1)/5) cos(4πk/5)` for `k = 0, …, 4` are `√5/5, 0, (5 − √5)/10, (5 − √5)/10, 0`; the text lists the same multiset as `√5/5, 0, 0, (5 − √5)/10, (5 − √5)/10`. The Check of 1.3 lists by `k`; the same here would spare a reader a recomputation.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `lovaszTheta`, `isGreatest_lovaszTheta` | empty `V`; edgeless `n`; `Kₙ`; `C₅`; wrong variant on `K₃` | empty: set ∅, `sSup = 0`; edgeless: `J/n` gives `n`; `Kₙ`: 1; `C₅` matrix: trace 1, eigenvalues `√5/5, 0, 0, (5−√5)/10` twice, sum `√5`; wrong variant 3 ≠ 1 | holds | none (N03) |
| 1.2 `isLeast_orthonormalRepresentation` | empty `V`; `N = 0`; two isolated vertices with `u₂ ⊥ c`; `C₅` | empty: every `t` in set, hence `[Nonempty V]`; `N = 0`: `‖c‖ = 0 ≠ 1`; `1 ≤ t·0` false so no junk `t = 1 < 2`; `C₅`: `t = √5` | holds | none |
| 1.3 `isLeast_eigenvalue` | edgeless; `Kₙ`; `C₅` | only `A = J`, `λ_max = n`; `A = I` gives 1; `C₅`: `5[k=0] − (5−√5)cos(2πk/5)` = `√5, (5−3√5)/2, √5, √5, (5−3√5)/2` | holds; index 0 is largest by `eigenvalues₀_antitone` | none |
| 1.4 route | step 2 `λ ≥ tr A/n = 1`; step 3 closedness of `D + 𝓕`; Knuth F6 on Lorentz cone and plane `x = z` | `(0,1,0)` lies in `(C∩C′)*` (`x+z ≥ 0`) but `s ≥ √(s²+1)` has no solution, so not in `C* + C′*`: F6 false in general; README's closedness argument valid | holds | none |
| 2.1 sandwich | empty `V`, `k = 0`; `C₅`; edgeless 3 with `χ(G)` | `0 ≤ 0 ≤ 0`; `2 < √5 < 3`; `ϑ = 3 > 1 = χ(G)` so complement is the right side; Cauchy–Schwarz `‖∑ sₐ‖² ≤ k ∑‖sₐ‖² = k` | holds | none |
| 2.2 `n ≤ ϑ(G)ϑ(Ḡ)` | empty `V`; `P₃`; `C₅` | `0 ≤ 0·0`; `2·2 = 4 > 3`; `√5·√5 = 5` | holds | none |
| 3.1 `strongProd`, `strongPow` | `K₂⊠K₂`; regular degrees; `k = 0`; `C₅⊠C₅` | `K₄` (box product gives `C₄`); `(r+1)(s+1)−1 = 8`; `Fin 0 → V` one vertex even for empty `V`; `{(i,2i)}` independent: `j, 2j` not both in `{0,±1}` | holds | none |
| 3.2 multiplicativity | empty factor; `k = 0` with `V` empty; `K₂ ⊠ K̄₂`; `C₅⊠C₅` | `0 = 0·ϑ`; `ϑ(point) = 1 = 0⁰`; `2 = 1·2`; `5 = √5·√5` | holds | none |
| 4.1 odd cycles | `n = 1, 3, 4, 5, 7` | `n=1`: lhs 1, rhs `−1/0 = 0` (excluded by `3 ≤ n`); 3: 1.0000; 4: 1.657 vs `ϑ = 2` (excluded by `Odd`); 5: 2.23607 = `√5`; 7: 3.31767; route: `n + 2x = −2x cos(π/n) = n c/(1+c)` | holds | none |
| 4.2 vertex-transitive | empty `V`; `P₃` (not transitive); `C₅`; `C₇`; Petersen | `0·0 = 0`; `4 ≠ 3`; 5; `7c/(1+c) · (1+c)/c = 7`; `4 · 10/4 = 10`; route: `⟨s/‖s‖, wᵢ⟩² = n(ϑ/n)²/ϑ = ϑ/n` | holds | none |
| 4.3 ratio bound | `d = 0`; `C₅`; Petersen; star `K₁,₃` with `d = 3` | `0 ≤ 0`; `5(1+√5)/(5+√5) = √5` attained; `10·2/5 = 4 = α`; star: `14.196 > 6.928`, regularity needed; route: `n + xd = xλₙ` with `x = −n/(d−λₙ)` | holds | none |
| 5.1 `shannonCapacity`, limit | empty `V`; `k = 0` term; edgeless; `Kₙ` | terms `0^(1/k) = 0` for `k ≥ 1`, limit and sup 0; `k = 0` term is `1^0 = 1`, excluded from the sup by the shift `k+1`; `n`; 1 | holds | none (N02) |
| 5.2 `α ≤ Θ ≤ ϑ` | empty `V`; `C₅`; graphs on ≤ 5 vertices | `0 ≤ 0 ≤ 0`; `2 ≤ Θ ≤ √5`; all but `C₅` perfect, so `α = χ(Ḡ)` | holds | none (C01) |
| 5.3 `Θ(C₅) = √5` | `k = 2`, `k = 3` | `5^(1/2) = 2.23607`; `10^(1/3) = 2.15443 < √5` | holds | none (C01) |
| Convention (Conventions, 1.1) | Knuth's labellings, (4.9), caution p. 2 | Knuth1994 lines 176–177: nonadjacent orthogonal; line 288: `α(G) ≤ ϑ(G)`; lines 71–73 with refs at 2087–2090: [7], [12] followed, [13] = CBMS 1986 | agrees with README | none |

- Source locators checked against the text: 23 of 23 Knuth locators in the README (Knuth1994 lines 66–73, 191–195, 213–214, 256, 288, 301–305, 332–346, 363–376, 381–414, 448–510, 518–573, 579–591, 602–603, and §§20–25 within lines 850–1204), all at the stated pages.
- Library declarations located at the pin: 21, six of them read in full (for example `SimpleGraph.indepNum` at `Combinatorics/SimpleGraph/Clique.lean:1044`, `ProperCone.hyperplane_separation'` at `Analysis/Convex/Cone/InnerDual.lean:96`, `Subadditive.tendsto_lim` at `Analysis/Subadditive.lean:155`, `Matrix.IsHermitian.eigenvalues₀_antitone` at `Analysis/Matrix/Spectrum.lean:63`, `Matrix.PosSemidef.kronecker` at `Analysis/Matrix/Order.lean:188`, Tau Ceti `Matrix.posSemidef_iff_eq_conjTranspose_mul_self` at `Analysis/Matrix/GramFactorization.lean:52`); all exist with the stated content. No strong product, Shannon capacity or theta function in Mathlib or Tau Ceti at the pins.
- Cross-roadmap citations resolved at the open heads: 6 (SpectralGraphBounds 1.1 and 3.2, PerfectAndChordalGraphs 4.2, TopologicalCombinatorics 3.1, ConvexAnalysisAndDuality 5.4, QuantumOptimization Layer 2). The two copied definitions agree character for character with SpectralGraphBounds' `Suggested.lean`; its 1.1 states the Rayleigh bound and the sign facts that 4.3 uses.
- Dependency check: `depcheck: 20 roadmaps, 249 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier is SpectralGraphBounds, an open pull request adding a new folder, named in the description.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 14 `sorry` warnings and nothing else. Signatures compared with the README by elaborated type: 20 of 20 agree; three definitions lack `[Fintype V]` (N02).
- One-tactic probe (`first | rfl | simp | infer_instance`) on a probe copy of the file: closes none of the 14 theorems. Headline theorems: all stated in `Suggested.lean`; none unstatable; no padding found.
- Pull-request text: title and description agree with the head (14 theorems, 6 definitions, supplier SpectralGraphBounds named, new roadmap).
- Changes outside the folder: none.

Overlap check: read SpectralGraphBounds, PerfectAndChordalGraphs (scope sections) and searched GraphColouring, StronglyRegularAndMooreGraphs, EquiangularLinesAndTwoGraphs by object; nothing shared. SpectralGraphBounds and PerfectAndChordalGraphs both exclude the theta function and the Shannon capacity; the sorted adjacency eigenvalues are owned by SpectralGraphBounds 1.1 and copied here only to make 4.3 statable; no roadmap on main or open states the strong product.

Source independence: 28 passages compared (the 23 locators and 5 further routes and docstrings) with 1 source, none shared; largest share Knuth1994, 23 of 23 locators; contents compared with Knuth1994: independent (Layer 1 draws on §§5–12, Layer 2 on §4 and §23, Layer 3 on §20, Layer 4 on §§22, 25, 24 in that order, Layer 5 on nothing in it; the weighted function and `TH(G)`, which organise the source, are excluded).

Research link: The headline targets are the results of Lovász's 1979 paper on the Shannon capacity (Knuth's reference [12]) in the form of Grötschel–Lovász–Schrijver's book ([7]), as presented in Knuth, The sandwich theorem (1994); rests on Knuth1994 lines 64–74 and 2070–2090 and on the README's References.

## Not verifiable

- Lovász, "On the Shannon capacity of a graph" (1979): paywalled at the publisher, no legal copy found through the sources service; the README gives no locator into it, so the attribution of 5.2 and 5.3 was not checked against its text.
- Shannon, "The zero error capacity of a channel" (1956): not sought; the README cites it for attribution only, with no locator.
- Overbars in Knuth's display (∗) and caution on p. 2 are lost in the text extraction; the reading used here is the one forced by (4.9) and the sentence after it (Knuth1994 lines 288–289).

## Source issues

- **Error** in Knuth1994 at §8, F6, printed page 12: the source says the dual of an intersection of two closed cones equals the sum of their duals; it should be the closure of that sum (Lorentz cone and the plane `x = z` in ℝ³ fail); affects the proof.
- **Misprint** in Knuth1994 at §4, printed page 7: the source says adjacency in the cycle is `u ≡ v ± 1` modulo 1; it should be modulo `n`; affects nothing.
- **Misprint** in Knuth1994 at §22, printed page 25: the source says equation (22.9) is a finite Fourier transform; it should be (22.8), the system just displayed; affects nothing.

## For the human reviewers

- Scope: every locator of the README (23 of 23) is into one expository source, Knuth's notes (Electron. J. Combin. 1 (1994), #A1); the primary papers of Lovász (1979) and Shannon (1956) are named without locators and were read neither by the author nor here.
- Not tested: the attribution of Layer 5 to Lovász's paper, which could not be read legally; its mathematics was checked independently of the paper.
