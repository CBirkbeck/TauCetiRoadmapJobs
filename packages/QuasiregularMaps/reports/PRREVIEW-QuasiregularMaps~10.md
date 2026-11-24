# Review of QuasiregularMaps (pull request #3034 at 7c7b748)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 315 changed lines since `de93025`. I checked every changed passage and the passages it affects: the `Suggested.lean` file (elaborated, signatures compared with the README, degenerate cases computed), the rewritten locators into Martio–Rickman–Väisälä, Heikkilä–Pankka and Prywes at their printed pages, the 18 SobolevMapsBetweenManifolds declarations and the TeichmullerGeometry and RiemannianGeometry citations on `main`, and the README against its version on `main`. There is no finding, and every remark of the previous review is either repaired or no longer applies now that the manifold prototypes and the cross-roadmap import are gone. One small correction and no format notes, none blocking; nothing is left for a human to decide.

## C01 — The new Conventions bullet on smooth metrics restricts the local-isometry statement of §7.6 to smooth metrics, which that statement does not need

A reader of the bullet "Smooth metrics" (lines 114–117) takes the second statement of §7.6 to hold only for smooth metrics: "The statements of §7.6 about flat manifolds, local Riemannian isometries and descended metrics are for smooth metrics". That statement is that a local Riemannian isometry `ℝⁿ → N` makes `N` `1`-quasiregularly elliptic for each orientation (lines 1480–1485). It holds for continuous metrics:
- `TauCeti.IsLocalRiemannianIsometry` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean`, line 70, at the pin) asks only for a `RiemannianBundle` on each side.
- §2.7 (lines 509–511) already proves, for continuous metrics, that such maps are `1`-quasiregular when orientation preserving.
- The route of the bullet uses only §2.7 and §7.2.

Only flatness and the descended metric (`Bundle.ContMDiffRiemannianMetric.quotient`) need a smooth metric. Either fix would do:
- drop "local Riemannian isometries" from the list in that bullet;
- add that the local-isometry statement of §7.6 is made for continuous metrics.

## Verified sound

Unless a row says otherwise, `n` is the dimension and "std" is the standard orientation.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Summary: for closed `N`, the same for any two continuous metrics (line 45) | compact `N`, metrics `g`, `g'`; `ℝ²` with `dx² + e^{2x}dy²` | compact: `|w|'/|w| ∈ [α, β]` on the unit-sphere bundle, `α > 0`, factor `(β/α)ⁿ`; `ℝ²`: `q'_O(id) = e^{|x|}`, unbounded | Pass; "closed" is needed | None |
| Conventions: chartwise null sets = null sets of positive continuous densities (lines 109–113) | `ℝ` with `dx²` and `e^{2x}dx²` | weights `1` and `eˣ`, both continuous and positive, same null sets; SobolevMapsBetweenManifolds §3.1 states it | Pass | None |
| Conventions: smooth metrics in §7.6 (lines 114–117) | local Riemannian isometry for a continuous metric | `IsLocalRiemannianIsometry` needs only `RiemannianBundle`; §2.7 gives `‖dπ‖ⁿ = 1 = J`, `1`-quasiregular without smoothness | Narrower than needed | C01 |
| Conventions: flat metric of `ℝⁿ` (lines 118–124) | `EuclideanSpace ℝ (Fin 2)` | `Bundle.instIsContinuousRiemannianBundle (riemannianMetricVectorSpace _).toContinuousRiemannianMetric` elaborates against Mathlib's `RiemannianBundle` instance | Pass | None |
| Sample §1.5: `a = (A1 − iAi)/2`, `b = (A1 + iAi)/2` | `A z = z + z̄/2`; conjugation | `A1 = 3/2`, `Ai = i/2`, so `a = 1`, `b = 1/2`; conjugation: `a = 0`, `b = 1`; the `wirtingerDeriv g x 1` formula closes by `simp` | Pass | None |
| Sample §1.5: `q_O ≤ (1+k)/(1−k)` iff `|b| ≤ k|a|` | `a = 1`, `b = 1/2`, `k = 1/2`; `a = 0`, `b ≠ 0` | `q_O = (9/4)/(3/4) = 3 = 1.5/0.5`; `a = 0`: `q_O = ∞` and `|b| ≤ 0` false | Pass; Ahlfors2006 uncertified | None |
| §2.2 bullet: isometries and `C¹` factors, proved in §4.3–§4.4 | `θ` an orientation-preserving isometry | §4.3: `K_O(f∘θ) ≤ 1 · K_O(f)`, and `θ⁻¹` gives the reverse; §4.4 with `K' = 1` likewise | Pass | None |
| §2.3 for every map (lines 408–412); previous C02 | fold; a discontinuous `f`; `M = ∅` | fold: both sets empty; off the class `K_O = ∞ ≤ K` is false, both empty; `∅`: both `[1, ∞)` | Pass; previous C02 repaired | None |
| Sample §2.4 | `z²`; the projection `P`; radial stretch `a > 0` | `J = 4|z|² ≥ 0`; `J_P = 0` with `DP ≠ 0`; `J = a|x|^{n(a−1)}`, integrable iff `n(a−1) > −n` | Pass; Rickman1993 uncertified | None |
| Sample §2.5 | shear `(x, y + x³/3)` | `σ₁([[1,0],[x²,1]]) = (x² + √(x⁴+4))/2`, `J = 1`; `K_O` finite on `{|x| < R}`, infinite on `ℝ²` | Pass | None |
| Sample §2.6 and its new *Needs:* line | `(c(x₁), 0)` on `[0,1]²` | `W^{1,1}_loc` gives `ACL` (§5.2), so `c` would be AC on `[0,1]`, contradicting `CantorFunction.lean:245`; §5.2 uses no Layer 2 | Pass | None |
| §2.10: weak and Tau Ceti Wirtinger derivatives agree a.e. (lines 621–626); previous R01 | `f = id`, `Du(0) = 0`, `Du = id` elsewhere | `wirtingerDeriv id 0 1 = 1`, formula gives `0` at that one point; equal almost everywhere, as now stated | Pass; previous R01 repaired | None |
| §2.10, first two statements | `z + z̄/2` with `K = 3`; constant `f`; `K = 1` | `1/2 ≤ (1/2)·1`; `K_O = 1.5/0.5 = 3`; constant: `k₀ = 0`, `K_O = 1`; `K = 1` forces `f_z̄ = 0` a.e. | Pass | None |
| §2.10, third statement; TeichmullerGeometry contract | `z + a z̄`, `|a| < 1` | `μ = a`; §7.4's dilatation `(1+|a|)/(1−|a|)` equals the `q_O` of §1.5; §7.4 (its README line 743) uses the same formulas, agreement a.e. | Pass | None |
| Sample §3.1 | radial stretch `a = 1/2` in `ℝ³`; the projection | `q_O = 2`, `q_I = (1/2)/(1/8) = 4`, `K = 4`; projection: `q_I = 0` but `K_I = ∞` | Pass; MRV 2.20, p. 14 | None |
| Sample §3.2, `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow` | radial stretch `a = 1/2` in `ℝ³`, `K = 2`; `n = 0` | `|x|^{−3/2}/2 ≤ 4 · |x|^{−3/2}/8`, equality; with `K` for `K²`, `≤ |x|^{−3/2}/4` false; `n = 0`: `1 ≤ 1 · 0⁰ = 1` | Pass, sharp | None |
| `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow` | radial stretch `a = 2` in `ℝ³`, `K = 2`; projection of `ℝ²` | `2|x|³ ≤ 2|x|³`; conclusion `8|x|³ ≤ 4 · 2|x|³`; projection satisfies `hI` with `K = 1` and fails `hf` | Pass; `hf` needed | None |
| Sample §3.3 | `P` in `ℝⁿ`, `n ≥ 2`; `n = 1` | `J_P = 0 = ℓ(DP)ⁿ`, `‖DP‖ = 1`; `n = 1`: `P = 0`, `K_O = 1`; the MRV p. 14 example is this one | Pass | None |
| Sample §4.1 | `T²` with `dx² + 4dy²`; target `e^{2x}(dx² + dy²)` | `‖dπ‖' = 2`, `ρ_N = 2`, `q'_O = 2 ≤ 4`; conformal: `q'_O = e^{2x}/e^{2x} = 1` | Pass; HP §1, p. 1 | None |
| Sample §4.4 | radial stretch `a = 2` after `a = 1/2` in `ℝ³` | with `y = |x|^{−1/2}x`, `|y|y = x`; `K_O = 1 ≤ 4 · 2` | Pass; Rickman1993 uncertified | None |
| Sample §5.2, `isACLpOn_iff_exists_hasWeakFDerivOn` | `|x|^{1/2}` on `ℝ²`; Cantor `c(x₁)` | `2π∫₀¹ r^{1−p/2} dr < ∞` iff `p < 4`, on both sides; the Cantor map is in neither class | Pass | None |
| `ae_hasLineDerivAt_of_hasWeakFDerivOn` | `|x₁|` on `ℝ²` | `Du = (sign x₁, 0)` a.e.; `∂₁` fails only on the null line `x₁ = 0` | Pass | None |
| Sample §5.3, `isQuasiregularOn_iff_isACLpOn` | `max(0,t)` with `K = 1`; fold of `ℝ²`; `K = 0` | `|f'| = f'`, both sides hold; fold `det = −1` on `x₁ < 0`, both fail; `K = 0` excluded by `hK` | Pass; MRV 2.20, (2.21), 2.1, p. 7 | None |
| MRV page locators; previous C01 | running heads against scan pages | scan pages 9 and 10 are headed 10 and 11; `ℓ(T)` on printed p. 7, 2.16 on p. 12, (2.21)–(2.23) on p. 14, (2.24)–2.26 on p. 15 | Pass; previous C01 repaired | None |
| Sample §6.2 | triangle with one identified vertex pair; total collapse; fold | ranks `1` and `0`; the fold is non-degenerate with `J = −1` on `x₁ < 0`; HP p. 24 builds the `ϕᵢ` | Pass | None |
| Sample §7.2 | `f ∘ R`, `R` a reflection | `J_(std,−o_N)(Df(Rx) ∘ R) = −J_f(Rx) · det R = J_f(Rx)`; `‖Df ∘ R‖ = ‖Df‖` | Pass; HP §1, p. 1 | None |
| Sample §7.5 | antipodal map of `Sⁿ`; `ℤ` on `ℝ²` by `(x + k, (−1)ᵏy)` | degree `(−1)ⁿ⁺¹`, preserving iff `n` odd; `det diag(1, −1) = −1`, the Möbius band | Pass; Lee2012 uncertified | None |
| Sample §7.6 with `killingHopf_euclidean` | `Tⁿ = ℝⁿ/ℤⁿ`; Klein bottle | `J_π = 1`, `K_O = 1`; the glide reflection reverses orientation and is excluded; `killingHopf_euclidean` at RiemannianGeometry `Suggested.lean:402` | Pass | None |
| §7.1, new *Needs:* line | invariance under isometries | on the `N` side §4.4 with `K' = 1`; on the `ℝⁿ` side §4.3 with `K_θ = 1` | Pass | None |
| Downstream consumers: Part III and forms (lines 1595–1599) | SobolevMapsBetweenManifolds scope; SobolevDifferentialForms summary | "Sobolev spaces of differential forms" is listed outside the former; the latter works on `Ω ⊆ ℝⁿ` | Pass | None |
| SobolevMapsBetweenManifolds contract, Lean names (lines 1899–1935) | all 18 names | each declared in its `Suggested.lean` on `main` (lines 71–406) with the cited section; §4.6(a) is for submersions and §5.1 for tangent norms, as stated | Pass | None |
| Module docstring, not statable; previous C03, C04, N01, N02 | Mathlib and Tau Ceti at the pins | no Sobolev class of maps between manifolds; the supplier import and `IsQuasiregular` with its binders are gone | Pass; repaired or no longer applicable | None |

- **Source locators checked against the text: 22.**
  - MartioRickmanVaisala1969: 2.1, p. 7; 2.16, p. 12; 2.20, (2.21)–(2.23), p. 14; (2.24), (2.25), "best possible", Lemma 2.26, p. 15. Printed page is scan page plus one, by the running heads.
  - HeikkilaPankka2025: §1, p. 1 (Theorem 1.1, (1.1), the definition, tori); §1 and §1.1, p. 2 (the torus, the construction, Corollary 1.2); §2, p. 6; Appendix B, p. 23 (definition, Proposition B.1, Lemma B.2); proofs on pp. 23–24.
  - Prywes2019: §1, p. 1 (definition, Theorem 1.1, Bonk–Heinonen, the torus, Corollary 1.2) and p. 2 (Stoïlow).
- **Library declarations opened at the pins.**
  - Mathlib: `riemannianMetricVectorSpace` and its `RiemannianBundle` instance (`Geometry/Manifold/Riemannian/Basic.lean` 102, 126); `Bundle.ContMDiffRiemannianMetric.toContinuousRiemannianMetric` (`Geometry/Manifold/VectorBundle/Riemannian.lean` 255); `Bundle.instIsContinuousRiemannianBundle` (`Topology/VectorBundle/Riemannian.lean` 497).
  - Tau Ceti: `TauCeti.wirtingerDeriv`, `TauCeti.conjWirtingerDeriv` (`Analysis/Complex/Wirtinger/Basic.lean` 66, 80); `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction` (245); `TauCeti.IsLocalRiemannianIsometry` (70).
  - Tau Ceti `2fd255d` has no `Wirtinger/Weak.lean`, no `Beltrami` and no Sobolev class of maps between manifolds.
- **Cross-roadmap citations resolved on `main` (`40b1417`).**
  - SobolevMapsBetweenManifolds §3.1, §4.6, §5.1–§5.3, its scope, and the 18 Lean names of the contract.
  - TeichmullerGeometry §7.4; RiemannianGeometry R4 item 7 and `killingHopf_euclidean`; SobolevDifferentialForms.
  - No open pull request drops a cited id.
- **Automatic checks.** The gate on this head returns `0` on every count, OK. Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.**
  - `lake env lean` on `Suggested.lean` gives five `declaration uses sorry` warnings (lines 94, 110, 164, 181, 195) and nothing else.
  - `#check @` of all 10 declarations agrees with README §1.1, §2.9, §3.2 and §5.1–§5.3; no binder is lost.
- **Scratch probes.**
  - The Conventions' flat-metric instance elaborates.
  - The §1.5 Wirtinger formula closes by `simp`.
  - The one-tactic probe (`simp`, `rfl`, `infer_instance`) closes none of the five theorems.
- **Record.** The README at `de93025` and at the head have the same seven layers and subsections, with the same ids and titles, and no item is removed. `Suggested.lean` has the same 10 declarations as on `main`, with unchanged signatures.
- **Previous review.** Its seven remarks are R01, C01–C04, N01 and N02 (rows above). R01, C01, C02, C04 and N01 are repaired. C03 and N02 no longer apply, because the declarations they concerned are removed.

Overlap check: read SobolevMapsBetweenManifolds, TeichmullerGeometry and DifferentialGeometry (main), and searched DifferentialGeometry (open revision), GeometricMeasureTheory, ComplexManifolds, PlanarTopology and TangentialBordism (open) by object.
- The Sobolev class, the weak differential and the oriented Jacobian belong to SobolevMapsBetweenManifolds, which cedes distortion, §2.8 and §5.1–§5.2 to this roadmap.
- The weak Wirtinger derivatives and planar quasiconformal maps belong to TeichmullerGeometry §7.4, cited here.
- Nothing else is shared.

Source independence: changed passages only. 13 passages compared with 3 sources (MartioRickmanVaisala1969, HeikkilaPankka2025, Prywes2019); nothing shared beyond formulas and standard terms, the longest run being the four-word term "piecewise linear branched covering". Largest share MartioRickmanVaisala1969, 25 of 74 source mentions. Contents not compared: no layer is added, removed or reordered.

Research link: Layers 2 and 7 formalise the definitions under which Prywes (2019) bounds the de Rham cohomology of closed quasiregularly elliptic manifolds, answering Gromov (1981), and Heikkilä–Pankka (2025) embed their de Rham algebra in `⋀*ℝⁿ`. §7.6–§7.7 are their torus examples. Rests on the README's Summary and Downstream consumers and on HeikkilaPankka2025 §1 and Prywes2019 §1, which I read.

## Not verifiable

- Rickman1993, Vaisala1971, Ahlfors2006 and Lee2012 are settled as uncertified and cited by locator only. They are cited by the sampled §1.5, §2.4–§2.6, §4.1, §4.4, §5.2 and §7.5; I computed the mathematics of those items instead (table). This revision changes none of their locators.
- Reshetnyak1989, IwaniecMartin2001, BonkHeinonen2001, Gromov1981 and Gromov1999 are settled as uncertified. This revision changes none of their locators.

## Source issues

- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24: the source composes the Nash embedding and the piecewise linear map in the wrong order; it should be `ι ∘ p : M → ℝᵐ`; affects the proof.
- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24: the minimum of the Jacobian in the distortion bound drops the simplex index on `ϕ`; it should be the minimum over `κ(σᵢ)` of `det Dϕᵢ`; affects the proof.

## For the human reviewers

- none
