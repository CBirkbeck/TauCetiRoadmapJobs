# Review of IlluminationAndCoveringByHomothets (pull request #3190 at 94e67a2)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason that is not mathematical: I found no false statement, and all eleven theorems, their routes and their Checks survived recomputation (Levi's six-lemma route included). The one finding is that three proof routes (1.2, 4.1, 4.2) track the proofs of the Aiger–Har-Peled–Žužić preprint step by step in that paper's notation; they need to be rewritten in the roadmap's own form, and shorter routes are offered below. There are two small corrections and one format note, none blocking. Three questions are left for the human reviewers (the weight of an unrefereed preprint among the sources, its licence, and the Lean development that accompanies it).

## R01 (P2) — The routes of 1.2, 4.1 and 4.2 follow the proofs of Aiger, Har-Peled and Žužić clause by clause, in that paper's notation

The roadmap is published under the project's licence, and a proof plan that is a source's proof with the words exchanged is the source's expression, even when the source is credited and the statement is generalised. No sentence is copied (I found no shared run longer than about six words); what is shared is the sequence of clauses and every auxiliary name.

How I know, passage beside passage:

- 1.2, step (3 ⇒ 2), README lines 157–163, against AHŽ26 lines 310–319: translate by the interior point, the function `y ↦ min_i μ(y − w i)`, continuous and `< 1` on the compact set, the ratio `max(·, 1/2)`, translate back with `w i + (1 − t) p`.
- 1.2, step (4 ⇒ 3), README lines 148–156, against AHŽ26 lines 323–330: the same convex-combination identity for `y + s' u`, the increasing sets `W n`, frontier points then interior points with a ball, compactness, one `W N`, `w = −(1/N) u`.
- 4.1, the key identity and (⇐), README lines 464–471, against AHŽ26 lines 473–482: the same case split `z = π p`, the same point `z' = z + (ε/(1 − ε))(z − π p)`, the same `y'` and `q = (1 − ε) y' + ε p`, then `q − x = s w`, `s ≠ 0`, the two signs.
- 4.2, the Helly step, README lines 510–515, against AHŽ26 lines 415 and 440–447: `a_r`, `A`, `u_r, w_r ∈ K`, `ṽ = x₁ − ∑ a_r u_r`, the telescoped sum with the slack weight `lam − A`. (The identity itself is forced; the names and the order are not.)

The (⇐) route of 2.2 uses the same construction as AHŽ26 lines 336–338 (ratio `2/3`, threshold `1/2`) but is written in the roadmap's own coordinates; I do not count it.

The smallest change is to write these four passages in the roadmap's own form. Routes that are shorter and are not the source's:

- (3 ⇒ 2) without a gauge. For `0 < t < 1` put `V t = p + t • (interior K − p)`, open. These increase with `t` (interior K is convex) and their union is `interior K` (for `y ∈ interior K`, `p + t⁻¹ • (y − p) ∈ interior K` for `t` near `1`). So the open sets `w i +ᵥ V t` cover the compact `K`; finitely many do, and by monotonicity one `t` serves all `i`. Then `K ⊆ ⋃ i, (w i + (1 − t) • p) +ᵥ t • K`. This also removes the Tau Ceti gauge lemma from the needs of 1.2.
- (4 ⇒ 3), for `U ≠ ∅`. The sets `V(u, s) = {y | y + s • u ∈ interior K}`, `u ∈ U`, `s > 0`, are open and cover `K` (a frontier point by hypothesis, an interior point with any `u` and small `s`). Take a finite subcover and the least `s₀` occurring in it; since `y ∈ K ∩ V(u, s)` and `s₀ ≤ s` give `y ∈ V(u, s₀)` (Mathlib `Convex.combo_closure_interior_mem_interior`), `K ⊆ ⋃ u ∈ U, (−s₀ • u) +ᵥ interior K`.
- 4.1, the inclusion `interior (π '' K) ⊆ π '' interior K`. The set `A = π '' interior K` is open (open map), convex and nonempty, and `π '' K ⊆ closure A` because `K ⊆ closure (interior K)` and `π` is continuous. Hence `interior (π '' K) ⊆ interior (closure A) = A`, by Mathlib `Convex.interior_closure_eq_interior_of_nonempty_interior` (`Mathlib/Analysis/Convex/Topology.lean`, line 285).
- 4.2. Keep the identity, in the roadmap's own notation and form, for instance as the single inclusion `x_j ∈ (x₁ − c) + A • K` for all `j`, with `c` the sum of the scaled lower end points, followed by `A • K ⊆ lam • K − (lam − A) • k₀`.

## C01 — The second Check of 2.3 says the uniqueness predicate holds "at every `x`", which is true only for `x ∈ K`

In the `ℓ²` example (line 320) a reader who takes `x` to range over the space is told something false: for `x = 2 e₁ ∉ K` both `⟪e₁, ·⟫` (maximum over `K` equal to `1 ≤ 2`) and `⟪e₁ + e₂/10, ·⟫` (maximum `√(1 + 1/400) ≤ 2`) are at most their value at `x` on `K`, and they are not proportional. The argument given, and the hypothesis of 2.3, concern `x ∈ frontier K = K` only. Write "at every `x ∈ K`".

## C02 — The criterion of 1.1 for smooth bodies is a step inside the proof of Glazyrin's Lemma 2.1, not the lemma

The README (line 92) says that for smooth bodies and boundary points the criterion "is Glazyrin, Lemma 2.1, p. 5". The lemma states that a finite set of directions and its nonnegative cone illuminate the same boundary points of a smooth body (Gla19 lines 230–232); the criterion "`x` is illuminated by `u` exactly when `u · n_x > 0`" is asserted in its proof (Gla19 lines 236–241). A reader who opens the lemma does not find the statement. Write "the proof of Lemma 2.1".

## N01 — "A recent preprint" in Scope and ownership (line 643) dates the text; "A 2026 preprint" does not.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.0 definitions | `m = 0`; half-plane; `u = 0`; `t = 1` | `K ⊆ ∅` iff `K = ∅`; homothety centred on the edge fixes the half-plane; region of `0` is `interior K` | as stated | none |
| 1.1 criterion | `K = [0,1]`, `x = 2`, `u = ∓1`; unit disc, `x = (2,0)`, `u = (−1, 0.1)`; L-shape; `K = {0}` | `x=2,u=−1`: lit, `f = a > 0`, `f u = −a`; `u=1`: unlit, `f u = a > 0`; disc: `|f₂| ≤ √3 f₁`, `f u < 0`; L-shape forces `f = 0` | iff holds off `K` too; both Checks true | none |
| 1.2 TFAE | zero space with `m = 0, 1`; segment; parabola; square with `2/3` | zero space: (4) true, (1) false at `m = 0`, all true at `m = 1`; `[0,.6] ∪ [.4,1]`; image `y − (1−t)c₂ ≥ (x − (1−t)c₁)²/t`; `[0,2/3] ∪ [1/3,1]` | as stated; route steps recomputed | R01 (wording only) |
| 1.3 extreme points | empty interior; zero space; half-plane | both sides false (frontier `= K ≠ ∅`, regions empty); zero space: left true, right false | as stated; face argument closes with 1.1 twice | none |
| 2.1 attained, `≥ d+1` | `d = 0`; `[a,b]`; segment in `ℝ²`; `U` spanning with `d` elements | `1`; `2`; `2 < 3`; coordinate sum is `1` on `U`, maximiser unlit | as stated | none |
| 2.2 parallelepipeds | `ι = ∅`; `m = 0`; boxes `[a, a+t]`; ratio `2/3` | `{x₀}` covered iff `1 ≤ m`; indicator points differ by `1 > t`; `(1/2,1] ⊆ [1/3,1]`, `[0,1/2] ⊆ [0,2/3]` | as stated | none |
| 2.3 smooth bodies | `d = 0`; `[a,b]`; square; `ℓ²` ellipsoid; `x ∉ K` | `1`; `2`; `4 > 3`; maximiser `A²y/‖Ay‖`, `finrank = 0`, not covered by one; two non-proportional functionals at `2e₁` | theorem as stated; Check wording | C01 |
| 3.1 Levi | L5 dot products; `s(f i)`; sector lemma arcs; `a = b` in L6; cases A, B, C | all six consecutive dot products `1` (angle `π/3`); `3eᵢ − (1,1,1)`; `F₁ = [0,π/3]`, `F₂ = [2π/3,π]`; `A = B` forces `A = 0` | route sound; values `4` and `3` | none |
| 4.1 directions `±w` | `w = 0`; `d = 1`; segment `{0}×[−1,1]`; identity `(1−ε)z' + επp = z` | both sides false; `π''K = univ`, one end each; `0 ∈ (−1,1)` but unlit | as stated | R01 (wording only) |
| 4.2 short curves | `a > b`; `lam = 0`; triangle path; square side; segment; telescoped weights | vacuous; constant curve; gauges `1/4+1/4+1/4`, `u = (1/16,1/16)`; `u₁ > 0` and `u₁ < 0`; weights sum `A + (lam − A) = lam` | as stated | R01 (wording only) |
| 5.1 upper semicontinuity | `m = 0`; segment against thin rectangles; `‖e‖`, `t + s` | hypothesis false; `2` against `4`; `‖e‖ < (1+t)δ < 2δ`, `t + 4δ/r ≤ t + (1−t)/2 < 1` | as stated | none |
| 5.2 near the cube | `d = 0, 1, 2`; `‖y‖ < ε/2`; equality in Cauchy–Schwarz | `1 = 2⁰`, `2 = 2¹`, `3 < 4`; then `x` interior; `y` a positive multiple of `a` | as stated | none |
| Layer 2 Examples | octahedron; prism; square pyramid; cube with one or two corners cut | `u₁ < −(‖u₂‖+‖u₃‖)` excludes pairs: `6`; `6`; `5`; `(1,−2,−2)` lights `(0,3,3)` and `(2,3,3)`: `7`, `6` | as stated | none |

- Source locators checked against the text: 14 (AHŽ26: p. 1 twice, p. 3, Proposition 2.14, Lemma 2.15(ii), Lemma 3.4, Lemma 4.1(i); Gla19: p. 4, p. 5, Lemma 2.1; BK16: p. 1, Example 4.6, Theorem 4.7; MRS13: p. 3). All at the stated pages; one misdescribed (C02).
- Library declarations opened at the pins: 41 (39 Mathlib, 2 Tau Ceti), all present with the hypotheses the README states; for example `Convex.helly_theorem_compact'` (`Mathlib/Analysis/Convex/Radon.lean`, line 192), `parallelepiped_basis_eq` (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean`, line 57), `gauge_le_iff_mem_smul_closure` (`TauCeti/Analysis/Convex/Gauge.lean`, line 47).
- Cross-roadmap citations resolved on main: 6 (ConvexAnalysisAndDuality 1.1, 1.2, 2.1, 3.7; BanachSpaceTheory 7.2; Isoperimetry). None is a supplier.
- Duplication by object: no illumination or homothet-covering material in the pinned Mathlib, the pinned Tau Ceti, the roadmaps on main or the open roadmap pull requests.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `TauCetiRoadmap/IlluminationAndCoveringByHomothets/Suggested.lean`: 11 `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`, no sorry'd data. Elaborated signatures compared with the README statements: all agree, no binder lost.
- One-tactic probe on a scratch copy (`rfl`, `simp` with the five definitions unfolded, `infer_instance`, `aesop`): none of the 11 theorems closes. All headline theorems of the README are stated.
- The automatic checks all passed on this head.

Overlap check: read MeanWidthAndCauchyFormulas, SuccessiveMinima (the third list is empty); nothing shared.

Source independence: 11 passages compared with 4 sources, 4 follow AHŽ26 clause by clause (R01), none shares a sentence; largest share AHŽ26, 7 of 14 locators; contents compared with AHŽ26: independent (1.2 and 2.2 ↔ §2, 4.2 ↔ §3, 4.1 ↔ §4, in a different order; Layers 3 and 5 and 1.1, 1.3, 2.1, 2.3 have no counterpart, nor have its §5–6).

Research link: The Levi–Hadwiger covering conjecture and Boltyanski's illumination problem (Levi 1955, Boltyanski 1960; survey of Bezdek and Khan 2018; Glazyrin 2022; Prymak 2023 for `ℝ³`). Layer 4 generalises two lemmas of the Aiger–Har-Peled–Žužić 2026 preprint. Rests on the README's references and the four texts read.

## Not verifiable

- Levi 1955 and Boltyanski–Martini–Soltan 1997: not read (no open copy sought); the README cites both bibliographically, through the sources read, with no locator of its own.
- The Lean development that accompanies AHŽ26 as an ancillary file: not opened, so the statement that no name or definition is taken from it was not tested.
- The exact enumerations quoted in the Checks of 2.2 and 3.1 for the listed polygons and polytopes: recomputed by hand for the cube, octahedron, prism, pyramid and truncated cubes only; the remaining values agree with the theorems.

## Source issues

- none

## For the human reviewers

- **Scope.** Half of the locators (7 of 14) go to AHŽ26, an arXiv preprint dated 25 November 2026, unrefereed, whose authors state its proof was found by an AI system; Layer 4 generalises its Lemmas 3.4 and 4.1. Layers 1–3 and 5 are classical.
- **Licence.** The licence under which AHŽ26 is posted was not established; R01 concerns four passages that track its proofs.
- **Licence.** The Lean development accompanying AHŽ26 was not opened; `Suggested.lean` was not compared with it. The description says nothing is taken from it.
