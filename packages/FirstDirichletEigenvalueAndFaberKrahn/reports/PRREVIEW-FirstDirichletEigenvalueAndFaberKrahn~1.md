# Review of FirstDirichletEigenvalueAndFaberKrahn (pull request #3220 at 863ab8a)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the README says the `−Δ` energy form is coercive on every bounded set, which fails in dimension 0, a case the statement of 1.3 admits and the roadmap treats elsewhere; a three-word qualifier repairs it. Every stated theorem, Check and worked value was recomputed and holds, both sources support the statements at their locators, and `Suggested.lean` elaborates with `sorry` as its only warning. There are no small corrections and one format note; two points are left for the human reviewers.

## R01 (P2) — Coercivity of the `−Δ` energy form fails on a bounded set in dimension 0, so "coercivity holds on every bounded `Ω`" is false for an index type that 1.3 admits

A reader of 1.3 is told that the hypothesis `hcoercive` can always be met on a bounded set, and the Summary repeats it ("a coercive energy form, as on every bounded set", line 9); the first Check of 1.3 (lines 129–130) then reads as "`λ₁(Ω) > 0` on every nonempty bounded `Ω`". The statement of 1.3 is for `EuclideanSpace ℝ ι` with any finite `ι`, and the roadmap handles dimension 0 explicitly in 3.1, 3.3 and 3.4, so the empty index type is in range.

Take `ι = ∅` and `Ω` the one-point space, which is nonempty, open and bounded, of volume `1`. Then `H¹₀(Ω)` is the constants with norm `|u|`, every gradient is `0`, and the energy form is identically `0`; coercivity would need `C · 1 ≤ 0` with `C > 0`. So no coercivity datum exists. Consistently, the constant `1` is a test function with Rayleigh quotient `0/1`, so `λ₁(Ω) = 0`, not a positive number. The theorem 1.3 itself is unaffected (it is vacuous there). The pinned Tau Ceti derives coercivity on bounded sets only on `EuclideanSpace ℝ (Fin (n + 1))` (`TauCeti/Analysis/PDE/Spectrum/Basic.lean`, the `Euclidean` section from line 598, `le_of_isDirichletEigenvalue_of_subset_ball` at line 616).

The smallest change: write "coercivity holds on every bounded `Ω` in positive dimension" in 1.3 (line 114), "as on every bounded set of positive dimension" in the Summary, and "On a nonempty bounded `Ω` of positive dimension" in the first Check of 1.3. The one-point case would make a natural negative-control Check next to the whole-space one: `λ₁ = 0` and no coercivity datum.

## N01 — The module docstring does not say that every headline is stated

The docstring of `Suggested.lean` would be complete with one clause saying that all headline theorems are statable at the pins and stated, so a reader need not infer it.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 definitions | `Ω = ∅`; dimension 0 point; `x(1−x)` on `(0,1)` | `λ₁(∅) = ∞` (empty infimum); point: `0/1 = 0`; `(1/3)/(1/30) = 10 ≥ π² ≈ 9.87` | holds |
| 1.2 Lipschitz trial functions | `Ω = ∅`; tent on `[1/10, 9/10]`; tent `min(x, 1−x)` | both sides `∞` (`tsupport u ⊆ ∅` forces `u = 0`); `(4/5)/(16/375) = 75/4`; `1/(1/12) = 12`, support `[0,1]` not admissible | holds |
| 1.3 agreement with the library eigenvalue | `Ω = ∅`; whole space; `ι = ∅`; interval `(a, b)` | `∞` against a real number; `λ₁ = 0`, no coercive datum; point: energy `≡ 0`, no datum, `λ₁ = 0`; `(π/(b−a))²` both sides | statement holds; commentary fails at `ι = ∅` (R01) |
| 2.1 similarities | `(0,1) → (0,2)`, `t = 2`; `Ω = ∅`; `t = 0`; dimension 0; `E → E`, `t = 2` | `(π/2)²·4 = π²`; `∞·4 = ∞`; `∞·0 = 0 ≠ ∞`; `0·t² = 0`; `4λ₁(E) = λ₁(E) < ∞` gives `0` | holds |
| 2.2 disjoint unions | empty index; `(0,1) ∪ (2,4)`; overlapping `(0,1)`, `(1/2,3/2)`; a piece with `φ_i = 0`, `Ω_i = ∅` | `∞ = ∞`; `min(π², π²/4) = π²/4`; `4π²/9 < π²`; `∞·0 = 0` | holds |
| 2.3 products | `Ω₁ = ∅`; `F` of dimension 0; `x(1−x)·y²(1−y)` | `∞ = ∞ + λ₁(Ω₂)`; `λ₁(Ω₁) + 0`; `(2/15)/(1/105) = 14`, `10 + 14 = 24` | holds |
| 3.1 Faber–Krahn | `Ω = ∅`; dimension 0; `vol Ω = ∞`; `(0,1) ∪ (2,4)`; `r = 0`, `Ω = (0,1)`; unit square | `∞ ≤ ∞`; ball equals `Ω`; no `r` exists; `π²/4 ≥ π²/9`; `∞ > π²` (hypothesis needed); disc of area 1: `≈ 18.2 ≤ 2π² ≈ 19.7` | holds |
| 3.2 Cheeger constant and inequality | `Ω = ∅`; dimension 0; `E`; `(0, L)` | `∞ ≤ ∞`; `h = 0/1 = 0 ≤ 0`; `h ≤ n/R → 0`, `λ₁ = 0`; `h = 2/L`, `1/L² ≤ π²/L²` | holds |
| 3.3 bound and balls | `n = 0`; `vol Ω = ∞`; `vol Ω = 0`, `n ≥ 1`; ball radius `R`; `R = 0` in dimension 0; unit square | `0·x⁰ = 0`; `n·0 = 0`; `n·∞ = ∞ = h`; `n(ω/(ωRⁿ))^(1/n) = n/R = P/vol`; `h(∅) = ∞ ≠ 0/0 = 0`; `π ≤ 2π²` | holds |
| 3.4 Hersch–Protter | `Ω = ∅`; `Ω = E`; dimension 0; slab width `2R`; `(0,2)²`, `R = 1`; punctured disc; slab width 1, `R = 1/4` | forces `R ≥ 0`, right side `∞`; hypothesis fails; fails; equality `(π/(2R))²`; `π²/2 > π²/4`; `6/ρ² = 200/27 ≈ 7.41 < π²`, cut-off energy `2π/log(1/ε)`; `π² < 4π²` | holds |
| 3.4 route | `G = log sin(ct)`; summation by parts; completion of the square | `G″ = −c²csc² = −c² − G′²`; `−Σ∫(η(x+τe)−η(x))(d(x+τe)−d(x))`; `∫‖∇φ‖² − c²∫φ²` | holds |
| Rearrangement convention (3.1 route) | pinned definition | `t < f*(x) ⇔ μ(ball 0 ‖x‖) < μ{t < f}`: support of `h*` in `B̄(0, s)`, `s < r` | agrees |

- Source locators checked against the text: 10 (Brasco2018 lines 30–41, 55–72, 78, 88–97, 160–172, 256, 279–281, 825–830; KawohlFridman2003 lines 34–35, 62–65, 81–86, 94–100, 153–155).
- Library declarations opened at the pin: 14 Mathlib and 22 Tau Ceti, all present with the hypotheses the contracts state; `firstDirichletEigenvalue` is `‖dirichletSolutionOperator‖⁻¹` (`TauCeti/Analysis/PDE/Spectrum/Basic.lean` line 291) and `isGreatest_firstDirichletEigenvalue` (line 472) needs coercivity, symmetry and nonemptiness only.
- Cross-roadmap citations resolved on main: Isoperimetry §5.2 and Convention 8, PDE §4.4, RiemannianGeometry R5c, VariationalMethods, KernelsAndSpectralMethods: 6, all as cited.
- Automatic checks: all passed. Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `sorry` the only warning (10 theorems); `#check @name` types of all 13 declarations compared with the README, no binder lost, nothing changed.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the three definitions unfolded): none of the 10 theorems closes; no padding.
- Headline theorems (Faber–Krahn, Cheeger with the isoperimetric bound and the ball value, Hersch–Protter): all stated in `Suggested.lean`; none unstatable.
- Pull request text: title and description agree with the head (new roadmap, 10 theorems, 3 definitions, one roadmap supplier).

Overlap check: read Isoperimetry, PDE (main and its open revision), GeometricMeasureTheory, GaussianIsoperimetryAndClusters, MeanWidthAndCauchyFormulas, MarkovDiffusionOperators; nothing shared. PDE §4.4 owns the library eigenvalue on bounded sets and this roadmap owns the `[0, ∞]`-valued infimum on arbitrary open sets, joined by 1.3; Isoperimetry owns the estimate of §5.2, which 3.1 cites. No other roadmap, on main or open, states Faber–Krahn, a Euclidean Cheeger constant or Hersch–Protter.

Source independence: 10 passages compared with 2 sources, none shared; largest share Brasco2018, 6 of 10 locators; contents compared with Brasco2018: independent (its sections are introduction, preliminaries, a Hardy inequality, the proof of its Theorem 1.2, a perimeter bound, general frequencies; the layers are definition, structural laws, lower bounds).

Research link: 3.4 is the `p = 2` case of the Hersch–Protter estimate that Brasco (2018) extends to the `p`-Laplacian; 3.1–3.3 are the Faber–Krahn and Cheeger bounds that Kawohl–Fridman (2003) use to study `λ_p → h` as `p → 1`. Rests on both sources as read.

## Not verifiable

- Hersch (1960), Protter (1981) and Cheeger (1970): not opened; the README attributes through Brasco and Kawohl–Fridman and gives them no locator.
- The source of Isoperimetry §5.2 (Bianchi–Gardner–Gronchi–Kiderlen, Theorem 5.8): not re-read; only the section's statement on main was compared with the contract here.

## Source issues

- **Misprint** in Brasco2018 at §1.1, p. 2, the sentence after (1.1): the source says the equality (1.1) is sharp; it should be that the inequality (1.1) is sharp; affects nothing.

## For the human reviewers

- **Scope.** The route of 3.4 (a vector field from the distance function) is the author's own, not taken from a refereed source; Brasco2018 proves the statement by a polyhedral reduction. The five steps were recomputed in this review.
- **Licence.** Brasco2018 is cited as the arXiv preprint v1; whether its numbering matches a published version was not checked. KawohlFridman2003 was read from the DML-CZ archive.
