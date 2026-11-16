# FIX-RT-ConstructiveFieldTheoryPhi4~2

Two red-team reviews of 5642a3a:
- `RT-ConstructiveFieldTheoryPhi4~2a` (verdict accepted) raises no finding. It only re-verifies the four round-1 repairs.
- `RT-ConstructiveFieldTheoryPhi4~2b` (verdict needs_changes) raises four P3 findings.

I checked each of the four against the sources and the pinned Mathlib, and all four are right. All the changes are in README prose and in two docstrings of `Suggested.lean`. No Lean statement, binder or name changed. Neither review's "For the human reviewers" or "Source issues" section lists a finding, and nothing was changed because of them.

## RT-ConstructiveFieldTheoryPhi4~2b/F01 (P3) — applied

Verified. §5.2 states the chessboard estimate only for `μ^{per}_{L,J,ρ}`: real spins and functions `f_v(φ_v)`. The old 5.3 route applied it to Peled–Spinka's pair system, whose spin space is ℝ × ℝ (`peled-spinka-2017` lines 1602–1632, p. 33).

New 5.3 route: the sums s = φ + τ have the law `μ^{per}_{L,J,κ}`, where κ ∝ `e^{−dJs²}(ρ̃ ∗ η₀)` is admissible. Then `P(E_{t,ε}) = ⟨Π_v f_{t_v}(s_v)⟩`, with `f_a` a Radon–Nikodym density in [0, 1]. The `chessboard` estimate, as stated, then gives `Z(t) ≤ Z(0)`. The *Needs* line, the Layer 5 Dependencies and "From Mathlib" name `MeasureTheory.Measure.conv`, `MeasureTheory.Measure.rnDeriv_le_one_of_le` and `MeasureTheory.continuous_of_dominated`.

Differences from the reviewer's text:
- The conditional probability is written as a Radon–Nikodym derivative, which needs no disintegration.
- The d = 0 case is stated: Z is constant.
- The continuity step is spelled out.

## RT-ConstructiveFieldTheoryPhi4~2b/F02 (P3) — applied

Verified. Sokal's Section 2.3 and Lemma 2.2 (`sokal-1982` lines 620–640 and 710–721) take subsequential continuum limits of φ⁴ lattice measures on the distribution space. Neither has a Gaussian single-site measure or a block normalisation. Fröhlich p. 13 (`frohlich-1982` lines 266–269) gives the two-point function of the free lattice field.

Changes:
- §7.4 citation: the statement in this form is the roadmap's. Fröhlich is cited for the free lattice field; Sokal for the rescaling, scoped to φ⁴ lattice measures and subsequential limits.
- `gff_reachable` docstring: "(Fröhlich, … for the free lattice field; README §7.4)".
- Same citation elsewhere: §7.3 and the `exists_reachableField` docstring now read "compare Sokal, Lemma 2.2", scoped in the same way.

## RT-ConstructiveFieldTheoryPhi4~2b/F03 (P3) — applied

Verified at Mathlib 1b1ccf4, Mathlib/Analysis/SpecialFunctions/Stirling.lean:
- `Stirling.stirlingSeq` (56), `stirlingSeq_one` (64, value `e/√2`), `stirlingSeq'_antitone` (154), `tendsto_stirlingSeq_sqrt_pi` (211) and `le_factorial_stirling` (248).
- All of them elaborate under `#check`.

Changes:
- The 2.3 route names them, with the two-sided bound `√(2πn)(n/e)ⁿ ≤ n! ≤ e√n(n/e)ⁿ` for n ≥ 1.
- The same names were added to the 2.3 *Needs* line, the Layer 2 Dependencies and a new "From Mathlib" bullet.
- I added `stirlingSeq_one` to the reviewer's list: the upper constant `e/√2` comes from it.

## RT-ConstructiveFieldTheoryPhi4~2b/F04 (P3) — applied

Verified. `griffithsSimonClass : Set (ProbabilityMeasure ℝ)`, while `ReachabilityScheme (d) (𝒞 : Set (Measure ℝ))` (elaborated types).

Changes:
- §7.2 gains a sentence: 𝒞 is a set of `MeasureTheory.Measure ℝ`; the Griffiths–Simon class enters as its image under the coercion, and this image is what "𝒞 the Griffiths–Simon class" means in 8.2.
- 8.2 now reads "…class of 2.2, read as a set of measures as in 7.2".
- No Lean change. Changing the class's type would lose the weak-convergence topology that `ProbabilityMeasure` carries.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Law of s = φ + τ is `μ^{per}_{L,J,κ}` | L = 1, d = 1 | `W = e^{−J(s₀−s₁)²} = e^{2Js₀s₁}e^{−Js₀²}e^{−Js₁²}`; torus coupling 2J at L = 1; factor `e^{−dJs²} = e^{−Js²}` | agrees |
| κ admissible | any c, \|τ\| ≤ M | `(c−dJ)(φ+τ)² ≤ 2\|c−dJ\|(φ²+M²)`, so `∫e^{cs²}dκ ≤ C∫e^{(2\|c−dJ\|+dJ)φ²}dρ < ∞` | holds |
| Chessboard step and limit | J = 0; L = 1, d = 1 Ising, J = 1, u = h₀ − h₁ = 1; d = 0 | J = 0: `P(E_{t,ε}) = (2ε/\|U\|)^{\|T\|}`, an equality, and Z ≡ 1. Ising: `2e^{−u²}+e^{−(2+u)²}+e^{−(2−u)²}` is 1.104 at u = 1, against 2.037 at u = 0. d = 0: Z constant | consistent with `gaussian_domination` |
| Z(c·1) = Z(0) | constant shift | W depends only on `s_x − s_{x+e_j}` | holds |
| Stirling two-sided bound | n = 1, 2, 5 | 0.922 ≤ 1 ≤ 1; 1.919 ≤ 2 ≤ 2.081; 118.0 ≤ 120 ≤ 128.0 | holds |
| `C(N,k)2^{−N} ≤ C N^{−1/2}e^{−NI(m)}`, \|m\| ≤ ½ | constant `2e/(π√3) = 0.999`; N = 4, k = 2 and k = 3 | 0.375 ≤ 0.4996; `I(½) = 0.1308`, so 0.25 ≤ 0.2961 | holds |
| Image of the GS class in `Measure ℝ` (F04) | `isingMeasure`; δ₀; `gaussianReal 0 1` | ρ_I = block with N = 1, K = 0, q = (1), and `∫e^{\|φ\|^α}dρ_I = e`; δ₀ = block with N = 0; `∫e^{\|φ\|^α}dN(0,1) = ∞` | the first two are in the image, the third is not |
| Citations (F02) | Sokal lines 620–640, 710–721; Fröhlich lines 266–269 | φ⁴ lattice measures and a subsequence; free lattice two-point function with the finite-difference Laplacian | scoped as stated |

## Checks run

- **Elaboration.** `lake env lean` on `packages/ConstructiveFieldTheoryPhi4/Suggested.lean` exits 0 with 29 `declaration uses 'sorry'` warnings and no errors. No `TauCeti.*` build was needed.
- **Signatures.** I elaborated one scratch copy with `#check @name` for all 60 declarations and for the nine newly cited Mathlib names: 0 errors. Only two docstrings changed, so every elaborated type is unchanged and agrees with the README.
- **Dependency check** (the brief's command):

      depcheck: 242 roadmaps, 2264 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere. The two leads of the worker's list (`fieldLaw` and `HasLimitLaw`) are declarations of `Suggested.lean`.

## Gate failures

- **tex=3** (README §5.3, Gaussian domination): the proof route had three bare TeX-style superscripts outside code spans, "t ∈ U^{T_L}", "t ∈ ℝ^{T_L}" and "U^{T_L}". Each is now a code span (`` `t ∈ U^{T_L}` ``, `` `t ∈ ℝ^{T_L}` ``, `` `U^{T_L}` ``), and the mathematics is unchanged. I masked every code span in the README and searched the rest of the text: no `\`, `$`, `^{` or `_{` is left outside code spans.

## Notes for the maintainer

- No Lean name, layer, section id or supplier changed, so no other roadmap is affected.
- `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged: Sokal is still cited for 7.3 and 7.4, and no supplier gap is needed.
- Ownership: no new construction was introduced. The 5.3 reduction uses only 5.2 and pinned Mathlib.
- Nothing suspicious was found in the reviews.
