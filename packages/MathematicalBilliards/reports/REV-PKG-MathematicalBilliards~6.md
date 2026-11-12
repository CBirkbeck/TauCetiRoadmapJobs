<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6795259029 -->
Review (claude) of e5e370d

Verdict: accepted

No finding. The single finding of the previous round is repaired, the repaired passage and its pattern were recomputed, the fifteen sampled targets and the seven headline statements were recomputed, the acceptance file elaborates with `sorry` as its only warning, no sorried theorem closes under the one-tactic probe, every cited library declaration and cross-roadmap section resolves, and the dependency check reports no problem. There are no declared supplier gaps, so the acceptance is unconditional.

## Verified sound

### Previous finding, checked first

**F01 of round 5 (P2, nonnegative radius in the cone-chart area formula): repaired.** The API bullet at `packages/MathematicalBilliards/README.md:748` now reads: "In a cone chart `φ` at `p` with `k = k_p` whose target is the disc of radius `R` centred at `0`, for every real `r` with `0 ≤ r ≤ R` the set `{x ∈ source φ : |φ(x)| < r}` has area `π r^{2k}/k`." A Check was added at line 758 (marked unit-square torus, `R = 1/2`, values at `r = 0, 1/4, 1/2`, negative controls at `r = −1/4` and `r = 1`), and the octagon Check at line 756 now states its range `0 ≤ ρ ≤ R³/3`. Recomputed below; all values agree.

**The repaired pattern in the rest of the package** (a real parameter bounded on one side only). Read every real parameter of the README: `r > 0` in §1.3 (line 130) and §10.5 (line 779); `a < a′ ≤ b′ < b` in §5.1; `0 < |ε| < min(c, π − c)` in §5.6; `0 < ε < ε₁` in §6.4; `t < t₊` in §7.3, where `t < 0` makes `[0, t]` empty and the claim vacuous; `c ≠ 0` for the time rescaling of §12.1; `T → ∞` in Layer 12, where only large `T` matters. No other one-sided range changes a statement.

### Adversarial pass (values computed this round)

"Circle" is `γ(s) = R exp(is/R)`, `ℓ = 2πR`; "ellipse" is `(2 cos u, sin u)`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §10.3 cone-chart area, repaired | marked unit torus, `k = 1`, `R = 1/2`, `r = −1/4, 0, 1/4, 1/2, 1`; density for `k = 2, 3` | set area `0, 0, π/16, π/4, π/4`; formula `π/16, 0, π/16, π/4, π`: the two unequal pairs are exactly the excluded `r < 0` and `r > R`. `∫₀^r 2πρ^{2k−1} dρ = πr⁴/2`, `πr⁶/3` | sound |
| §10.3 octagon Check, repaired | `k = 3`, `ρ = 0.1`, `ρ = R³/3` | `r = (3ρ)^{1/3}`, `πr⁶/3 = 3πρ² = 0.03π`; eight sectors `8 · (3π/4) · ρ²/2 = 3πρ²`; at `ρ = R³/3`, `r = R`. Wrong models `π(3ρ)^{2/3} ≈ 1.41`, `9πρ² ≈ 0.283` against `0.0942` | sound |
| §10.3 uniqueness and finiteness | atom at a cone point; non-second-countable worry | adding `cδ_p` changes `area(Σ)` from `0` to `c`. A compact Hausdorff locally Euclidean space is metrisable, so countably many charts cover `X ∖ Σ` and the chart condition determines the measure | sound |
| §1.1 carrier | circle, clockwise circle, reversed table, rigid motion, superellipse, circle–ellipse join | `τ(s) × (γ(t) − γ(s)) = R(1 − cos((t − s)/R))`, `2R` at the antipode; reversed parametrisation gives the negative; `conj(aτ) · aΔ = conj(τ)Δ` for `|a| = 1`; superellipse curvature numerator `192(x²y⁶ + y²x⁶) = 0` at `(1, 0)`; join curvatures `1` and `a/b² = 4` | sound |
| §2.2 regularity and derivative formulas | general `Φ`; circle; one-sided values at the `C¹` join | `∂Φ/∂s₁ = sin δ₁`, `∂Φ/∂s = sin δ − κL`, `∂Φ/∂δ = −L`, so `∂s₁/∂s = (κL − sin δ)/sin δ₁`, `∂s₁/∂δ = L/sin δ₁`. Circle: `1` and `2R`. Join, `L = 2`, `δ = δ₁ = π/2`: `2·1 − 1 = 1`, `2·4 − 1 = 7` | sound |
| §2.3 closed cylinder | limits `δ → 0, π`; lift at `δ = 0, π`; superellipse flat point | `⟨e, τ(s₁)⟩ → 1` and `→ −1`, so `δ₁ → 0, π`. Lean lift: at `δ = 0` the set is `(s, s + ℓ)`, value `(s, 0)`; at `δ = π` the set is empty, `sInf ∅ = 0 ≠ s + ℓ`. Flat point: `δt ≈ ct⁴` gives `t ∼ δ^{1/3}` | sound |
| §3.1 chord length | general mixed derivative; circle; diagonal | `∂u/∂s = sin δ · (iu)/L`, `⟨iu, τ(s₁)⟩ = sin δ₁`, so `∂²L/∂s∂s₁ = sin δ sin δ₁/L`. Circle: `L = 2R sin δ`, mixed `sin δ/(2R) = sin²δ/L`. One-sided `∂L/∂s₁ = ±1` at `s₁ = s`, `s + ℓ` | sound |
| §3.2–3.3 invariant measure (headline) | circle; ellipse from `(2, 0)`, `δ = π/4`; pieces off `A` | exit `(6/5, 4/5)`, chord `4√2/5`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, `det DF = √73/5 ≈ 1.709`, `sin δ₁ · det = 1/√2 = sin δ`. For `δ ∈ (π, 2π)` the parameter set is `(s, s₁′]`, infimum `s`; for `δ ≡ π` it is empty | sound; total map Borel |
| §5.2 Birkhoff–Fathi | shear with `U = AddCircle 1 × [0, 1)`; folded curve; inverse of a topological twist | frontier `{y = 1}`; `dx/dt = 1 + 0.8π cos 8πt`, minimum `1 − 2.51 < 0`. A point of `V_x` above its crossing with `F(V_{x′})` lies left of that curve (top endpoint `F₁(x′, b) > x`), so `(F⁻¹)₁(x, ·)` is strictly decreasing | sound; a topological twist deviates the verticals |
| §5.3 graph and Lipschitz (headlines) | circle; conjugated shear `Φ(x, y) = (x, y + ε sin 2πx)` | circle slopes `±1/(2R)` against graph slope `0`. Conjugated shear: invariant graphs of slope up to `2πε`, forward ratio `∂_yG₂/∂_yG₁ = 1 + 2πε cos 2πX`, maximum `1 + 2πε ≥ 2πε` | sound |
| §5.4 strict comparison | `α = √2/2`, `ε = 1/10`, `q = 7`, `p = 5`; rational control | `7α = 4.9497`, `p − qα = 0.0503 < ε`; induction `g₂^q ≥ g₁^q + ε` uses monotonicity of `g₂` only. Control: both lifts have fixed points, translation number `0` | sound |
| §5.6 only the circles `δ = c` | nonconstant invariant graph | on a level `{ψ = c}` the map is rotation by `2Rc`; for `c/π` irrational the closed invariant level is dense, hence the whole circle | sound |
| §6.4 two orbits (headline) | circle `(1, 2)`; ellipse; collapsed `(1, 3)`; general collapsed rate | `s_j = jπ` and `s_j = jπ + π/2` differ by no `mπ + 2πn`; ellipse `W = 8` and `4`; `(q − p)·pℓ/q + p·(q − p)ℓ/q = 2p(q − p)ℓ/q`, `= 4ℓ/3` at `(1, 3)`; `cl + 1 = 2` rest points | sound |
| §7.1, §7.3 | angle sum with holes; corner bound | `(n₀ − 2)π + Σ(nᵢ + 2)π = (n − 2 + 2h)π`, `8π` for the square with a hole. At most `⌈π/α⌉` multiples of `α` in an open interval of length `π`: `2, 2, 1` for `α = π/2, 2π/3, 3π/2` | sound |
| §8.3 measure and reversal | square state `((1/2, 1/2), 1)`; singular states | `J F¹ J` gives `((1/2, 1/2), −1) = F⁻¹`; `J(Σ) = Σ`, so both sides are the identity on `Σ`; each itinerary piece is an isometry in `x` and in `v` | sound |
| §9.1 reflection group | square, equilateral triangle, `π/√2` triangle; similarity | `σ_d σ_{d′} = (d/d′)² ·`, a rotation by twice the angle; orders `4`, `6`, infinite; a polygon has two non-parallel sides, so `N ≥ 2`. `u σ(u⁻¹v) = u²d² conj v` | sound |
| §9.3 invariant function | rotation `ω^j`, reflection `σ_d`; `N = 1` control | `(conj d · ω^j v)^N = (conj d · v)^N`; `conj d · d² conj v = conj(conj d · v)`, same real part. `Re v` changes sign under `v ↦ −conj v` | sound |
| §10.5 flat tori | `z = 3 + 2i`, `w = −1 + i`, `r = 1/2`, `n = 12`; chart radius `0.6` | `|z| + |w| ≈ 5.02 < 6`; `(|z| + |w|)/n ≈ 0.418 < r`; `(ψ_{z/n}ψ_{w/n})ⁿ = ψ_{z+w}`. Radius `0.6` contains `0.55` and `−0.45`, a lattice vector apart | sound |
| §11.1 construction | square, equilateral, `π/8` triangle; flat vertex | vertex classes `4/4 = 1`, `6/6 = 1`, `16/4 = 4`, `16/16 = 1`, `16/16 = 1`. Flat vertex: `n_v = 1`, both side reflections equal, subgroup of order `2 = 2n_v` | sound |
| §11.2 translation structure | independence of `x₀`; total angle; L-table, square with hole | `σ_S(rd) = rd`, so `σ_S x₀ − x₀ = σ_S a − a`; `2n_v` copies of angle `πm_v/n_v` give `2πm_v`; L-table `4/4 = 1` class of angle `6π`; hole: four classes of `6π` | sound |
| §11.3 Euler characteristic | five tables; consistency of the two formulas | `0, 0, −2, −2, −8`, genera `1, 1, 2, 2, 5`. `Σ(|G|/2n_v)m_v = (|G|/2)(n − 2 + 2h)` turns `−χ` into `Σ(|G|/2n_v)(m_v − 1)`; simple case `g = 1 + (N/2)Σ(m_v − 1)/n_v` | sound |
| §11.4 unfolding | well-definedness; injectivity; `θ = 1` on the square; areas | `(σ_S g)⁻¹ = g⁻¹σ_S`, glued to `g⁻¹` along `S`. Equal images force `g′ = σ_S g` with `x ∈ S`, the phase identification. `conj(1) = 1` gives two copy points. `16 · tan(π/8)/2 = 8(√2 − 1)` | sound |
| §12.1 Check, weak mixing witness | half-torus under the horizontal flow | overlap `|1/2 − t|`; mean of `u − 1/4` over `u ∈ [0, 1/2]` is `0`, mean of `|u − 1/4|` is `1/8` | sound |
| §12.3 Koopman continuity | route without separability; counting measure | a vector orthogonal to all averages has `∫₀^h φ(F^{−s}x) ds = 0` for rational `h`, almost every `x`; then `‖φ‖² = ∫∫_{[0,1]} |φ(F^{−s}x)|² = 0`. Counting measure: `‖1_{−t} − 1_{0}‖ = √2` | sound |
| §12.4 Wiener (headline) | `0`, `δ₀`, `(δ₀ + δ₁)/2`, Lebesgue on `[0, 1]` | limits `0`, `1`, `1/2 = 1/4 + 1/4`, `0`. `Σσ({ξ})² ≤ σ(ℝ)²`, so the `tsum` is a true sum, not the junk value | sound |
| §12.4.1 projection (headline) | unit mode `e₁`, `a = 1` and `a = 0`; identity group; `v = 0` | `A_T¹e₁ = e₁`, `‖w‖² = 1 = δ_{2π}({2π})`, `⟨e₁, U_{1/4}e₁⟩ = i`; `A_N⁰e₁ = 0`; identity group, `a ≠ 0`: factor `(1 − exp(−2πiaT))/(2πiaT) → 0`. `‖A_T^a v‖² = ∫|K_T(ξ − 2πa)|² dσ_v` | sound |
| §12.5 criterion (headline) | both directions; `a ≠ 0` and `a = 0`; zero function | `a ≠ 0` forces `∫f = 0` and correlation modulus `‖f‖²`, so `f = 0`; `a = 0` is invariance, constant by ergodicity. An atom at `2πa` gives a nonzero eigenvector orthogonal to `1`, with a measurable representative. Zero satisfies every equation and is constant | sound |
| §12.6 tori and rational tables | all angles `π/n`; holes | `Σ(m_v − 1) = 0` gives genus `1`; a hole needs a vertex of angle `> π`, so the hypothesis forces a simple polygon; a dual vector with `⟨λ*, θ⟩ ≠ 0` exists because the dual lattice spans | sound |

The convention witnesses were recomputed against the layers that use them: `∂s₁/∂v = −2R/sin δ`; `S = −L` with `−∂₁S = −cos δ = y` and `∂₂S = −cos δ₁ = Y`; rotation number `1/3` at `δ = π/3`; `σ(v) = d² conj v`. Layers 2, 3 and 4 use them consistently with IntegrableSystems I5.0 and CotangentLagrangian C3.1, where `S = −‖χ(t) − χ(s)‖` and `v = ∂_sS`.

### Seeded source sample

No locator is flagged as unverified by the author. All fifteen sampled targets were examined.

| Target | Locator read | Outcome |
|---|---|---|
| 1.1, 2.2, 2.3 | Tabachnikov2005 Chapter 3; KatokHasselblatt1995 §9.2; ChernovMarkarian2006 Chapter 2 | waived, no text; statements verified by computation above |
| 3.1 | BialyMironov2022 lines 159–161 and 182–185, Section 2, printed p. 4 | supports the coordinates and the chord-length identity; the mixed derivative is labelled as computed in the roadmap, correctly |
| 5.2 | Herman1983 lines 1128–1154 (definition printed p. 40, theorem printed p. 41) and 1159–1166 | theorem, page and hypotheses agree: orientation preserving, deviating the verticals, `U` open, relatively compact, homeomorphic to the half-open annulus, invariant, in the non-wandering set. The source's graph is into `[0, ∞)`; the README's open interval follows since `U` is open, contains the boundary circle and is relatively compact |
| 8.3 | ChernovMarkarian2006 Chapter 2; BoldrighiniKeaneMarchetti1978 §2 | waived |
| 9.1, 10.5, 11.1, 11.2, 11.3, 12.6 | MasurTabachnikov2002 §1; ZemlyakovKatok1975 | uncertified and waived; recomputed above |
| 10.3 | ChaikaForni2026 lines 83–88, Section 1, printed p. 3 | supplies the invariant area of the directional flows; the README says the uniqueness construction is its own, correctly |
| 11.4 | MasurTabachnikov2002 §1; KerckhoffMasurSmillie1986 Theorem 1 | uncertified and waived |
| 12.4.1 | Hochman2012 lines 3076–3096, Lemma 6.6.2, printed p. 69 | a discrete-time statement for a cyclic vector, as the README says; the README's twist `exp(−2πiat)` is the correct conjugate (see Source issues) |

Also read: Herman1983 lines 149–155 (I.1.2), 188–192 (I.2.2), 277–319 (I.2.4.2–2.4.4, printed pp. 10–11), 425–436 (I.3.4.3–3.4.4), 762–769 (the Remarque of I.4.3, printed p. 27), 803–807 (I.5.2); Hochman2012 lines 2439, 2474–2487, 2627, 2854–2855, 3099–3143; BialyMironov2022 lines 96–119, 149–185, 261–264; ChaikaForni2026 lines 9–28, 89–100, 168–176. Every in-text locator read matches its text and printed page. All twelve cited works have one manifest entry each, and each entry's `cited_for` matches the sections that cite it.

Remark, no change needed: the References entry for Herman1983 lists the subsections "1.2, 2.2, 2.4, 3.1, 3.4, 5.2" of Chapitre I; the text also cites the Remarque of §4.3 at its claim with exact lines, and the manifest locator includes 4.3. The exact locators are at the claims and are correct.

### Elaboration, signatures, padding

- `lake env lean` on `packages/MathematicalBilliards/Suggested.lean`, run from the content checkout (Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`): exit 0; the only output is seven `declaration uses sorry` warnings, at lines 154, 193, 209, 235, 257, 268, 287. The one Tau Ceti import already had its object file.
- `#check @name` for all 16 declarations, elaborated once on a scratch copy (exit 0) and compared with the README: `[Fact (0 < ℓ)]` on the carrier, lift, map and measure; `2 ≤ k` on the measure and Lipschitz theorems and absent from the periodic-orbit theorem; `0 < ℓ`, `a < b`, the lift relation, the twist disjunction, the non-wandering and open-annulus hypotheses on the graph theorem; `0 < p`, `p < q`, `p.Coprime q`; `[CompleteSpace H]` and `U.IsUnitary`; `[IsFiniteMeasure σ]`; `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]`, `[VAddInvariantMeasure ℝ X μ]`. No binder is lost; nothing changed.
- One-tactic probe on a scratch copy, each of the seven `sorry` replaced by `first | rfl | (simp; done) | infer_instance | (intros; simp_all; done) | (constructor <;> simp; done)`: all seven stay open. None restates a definition, mirrors a Check, computes a small value or treats a boundary case. The one proved `example` (the unit circle is a table, the clockwise circle is not) tests orientation in the kept carrier.
- Form: one module docstring, namespace `TauCetiRoadmap.MathematicalBilliards`, `import Mathlib` then the one Tau Ceti module used, layer comments in README order, a docstring on every declaration, no `set_option`, no sorried data, no `lemma`, no `#eval`.

### Headline theorems

From the Summary: invariance of `sin δ dδ ds` (§3.3), Birkhoff's graph theorem with its billiard Lipschitz form (§5.3), two Birkhoff orbits of each type (§6.4) and the eigenfunction criterion (§12.5) are stated, with Wiener's lemma (§12.4) and the continuous-time projection (§12.4.1). Measure preservation and reversibility of the polygonal flow (§8.3), non-ergodicity of rational tables (§9.3), the unfolding conjugacy (§11.4) and the genus formula (§11.3) are named in the module docstring as not statable, each with the missing carrier (the polygonal billiard flow, the glued translation surface with its directional flows, a finite CW type on the glued surface); nothing is stated in their place. The 16 names listed at README line 92 are exactly the 16 declarations; the six leads of the citation resolver are six of them.

### Library declarations opened at the pins

All in the files the README cites; line numbers at the pins.

- Mathlib: `Dynamics/Circle/RotationNumber/TranslationNumber.lean` (`translationNumber_pow` :643, `tendsto_translationNumber` :685, `translationNumber_mono` :695, the four bound lemmas :704–:718, `translationNumber_units_inv`, `translationNumber_eq_rat_iff`); `MeasureTheory/Integral/IntervalIntegral/Periodic.lean` (`AddCircle.measure_univ` :69, `measurePreserving_mk` on `Ioc t (t + T)`); `Analysis/SpecialFunctions/Complex/Circle.lean:432` (`homeomorphCircle'`); `Topology/Instances/AddCircle/Defs.lean` (`equivIco`); `MeasureTheory/Function/Jacobian.lean` (`lintegral_image_eq_lintegral_abs_det_fderiv_mul`); `Dynamics/Ergodic/Conservative.lean:63` (`MeasurePreserving.conservative`, with `[IsFiniteMeasure μ]`) and `ae_frequently_mem_of_mem_nhds`; `Dynamics/Ergodic/Action/Basic.lean:31` (`ErgodicVAdd`); `MeasureTheory/Group/Action.lean:178` (`measurePreserving_smul`, whose additive form `measurePreserving_vadd` is used elsewhere in Mathlib); `Analysis/Calculus/ImplicitContDiff.lean` (both implicit-function lemmas); `Analysis/Convex/Strict.lean:37`; `Geometry/Manifold/StructureGroupoid.lean`, `HasGroupoid.lean:93` (`maximalAtlas`), `IsManifold/Basic.lean`; `Topology/Homotopy/Contractible.lean:29`; `Geometry/Polygon/Basic.lean:62`, `:71`; `MeasureTheory/Function/LpSpace/Basic.lean:606–:631` (the five pullback lemmas); `Analysis/InnerProductSpace/Projection/Basic.lean` (`orthogonalProjectionOnto`); `MeasureTheory/Measure/CharacteristicFunction/Basic.lean:134` (`charFun_apply_real`); `Analysis/InnerProductSpace/PiL2.lean:853`; `Analysis/InnerProductSpace/MeanErgodic.lean` (one contraction, discrete averages); `Dynamics/Flow.lean:85`.
- Tau Ceti: `Geometry/Polygon/Simple.lean:109` (`Polygon.IsSimple`), `:483`, `:614`, `:767` (`TauCeti.SimplePolygon`); `Topology/JordanCurve/Basic.lean:282` (convex, nonempty interior, bounded); `Analysis/Complex/PlaneSeparation/Inside.lean:190`; `Analysis/Complex/PlaneSeparation/JordanCurve.lean:175`; `Analysis/Complex/Conformal/Jordan/Schoenflies.lean`; `Analysis/Complex/Conformal/PrimeEnd/Crosscut/TwoSides.lean:137` (open, simply connected); `Analysis/Bochner/CharFun/Bochner.lean:101` (continuous and positive definite iff a unique finite measure, kernel `exp(ixξ)`); `Analysis/Semigroups/Group/Basic.lean:74` (real-linear operators, continuity at `0` only, no completeness); `Analysis/Semigroups/Group/Unitary.lean:107`, `:154`; `AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`, `MayerVietoris.lean:93` (four `FiniteCWType` hypotheses); `Probability/Ergodic/MeanErgodic.lean:43` (one map).
- Duplication by object: a search of both pins for billiards, translation surfaces, non-wandering sets, weak mixing and Wiener's lemma finds nothing (the only "Wiener" hits are Wiener–Ikehara). The mean ergodic statements at the pins are for one operator or one map; the unit-mode computation in the table separates them from §12.4.1.

### Cross-roadmap citations resolved (main at `fd02c5bd`, open heads through the index)

| Citation | Where | Resolution |
|---|---|---|
| SymplecticGeometry/CotangentLagrangian C3.1 | `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:471`, `:527`, `:573`–`:576`, `:583` | the smooth next-collision map in `(s, v)`, the tangent-line hypothesis, `exists_billiard_periodic_reflection`, the circle formula with its rational-rotation criterion, finite-volume recurrence: all present |
| SymplecticGeometry/IntegrableSystems I5.0, I5.4 | `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:426`, `:434`, `:623`, `:644`–`:684` | convention `y = −∂₁S`, `Y = ∂₂S`; compact-pair Čech continuity; cup-length bound for a flow with a Lyapunov function |
| RiemannianGeometry/Surfaces §3.1 | `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:471`, `:489` | the turning theorem and its Lean name |
| GeometricTopology §2.3, §1.7 | `TauCetiRoadmap/GeometricTopology/README.md:1386`, `:1049`, `:1068` | the annulus theorem, proved there for `n + 1 ≤ 3`; genus `(2 − χ − b)/2` |
| FactorRigidity §8.2 | `TauCetiRoadmap/FactorRigidity/README.md:746` | cited only to delimit ownership |
| ProbabilisticAndMetricNumberTheory §4.6, §4.9a | open head, `README.md:5508`, `:6320` | cited only to delimit ownership; §4.9a's strong continuity needs a continuous action and a regular measure, which §12.3 does not assume |

### Ownership against open work

Searched the open roadmap heads and main, by object, with `roadmaps grep`: billiard, translation surface, weak mixing, non-wandering, twist map, Wiener's lemma, Zemlyakov, unfolding, rotation number, directional flow, mean ergodic, and the nine definition names of `Suggested.lean`. The only billiard text is CotangentLagrangian C3.1, which the README imports and extends to finite regularity. The only translation surface is Nelson's single example in UnboundedOperators. No other acceptance file declares these names. The overlap report lists no pull request changing this roadmap, no dropped id and no revision-only id; none of the three packages in the board index concerns this subject. Ownership was checked against the indexed heads only.

### Supplier order

Every `*Needs:*` line and layer dependency names Mathlib, Tau Ceti, an earlier layer, or one of four roadmaps on main. No forbidden supplier, no gap. The dependency check prints:

```text
depcheck: 231 roadmaps, 2072 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Principles, shape and style

- No route-specific shortcut: vanishing curvature, `C¹` tables, holes, non-separable Hilbert spaces and actions with no topology are all covered. No re-planned roadmap, no copied passage, no algorithm.
- The organisation is the roadmap's own: twelve layers named by their mathematics, the order forced by the dependency lines (Layers 1–6 and 7–11 independent, Layer 12 applied in §12.6); no layer is named after a source's chapter.
- Summary, Scope and ownership, Conventions (each with a computed witness), Exact supplier contracts, How to read the build, twelve layers each ending in Examples and Dependencies, Downstream consumers, References. Every definition has its API and at least three Checks; every theorem has its hypotheses and a locator.
- A search of the README for process words, pull-request numbers, machine paths, HTML, LaTeX delimiters and "optional/deferred" wording finds none.

## Not verifiable

- Tabachnikov2005, KatokHasselblatt1995, ChernovMarkarian2006, BoldrighiniKeaneMarchetti1978, ZemlyakovKatok1975 and KerckhoffMasurSmillie1986 are settled as waived, and MasurTabachnikov2002 and Birkhoff1927 as uncertified: no text is available, so their locators and hypotheses cannot be certified. The statements that cite them were checked by computation instead.
- Ownership against open pull requests rests on the indexed heads (index of 2026-11-11); pull requests outside the index were not sought.

## Source issues

- **Misprint** in Hochman2012 at Lemma 6.6.2, proof, printed p. 69 (Hochman2012 lines 3081–3095): the source says the twisted operator is α times U and that its averages vanish off α; it should be the conjugate of α times U; affects the proof.
- **Misprint** in Hochman2012 at Section 6.6, example before Theorem 6.6.1, printed p. 68 (Hochman2012 lines 3019–3020): the source says U preserves the norm and that the inverse multiplies by z; it should be M, with inverse multiplication by the conjugate of z; affects nothing.
- **Misprint** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 68 (Hochman2012 line 3029): the source says the Fourier transform of the spectral measure is real valued; it should be complex valued; affects nothing.
- **Misprint** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 68 (Hochman2012 line 3034): the source says the positive-definite sequence is formed with the vector 1; it should be formed with the cyclic vector v; affects the proof.
- **Gap** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 69 (Hochman2012 lines 3065–3073): the source says polynomials in nonnegative powers of z are dense in the spectral L² space; it should use Laurent polynomials; affects the proof.
- **Misprint** in Hochman2012 at Lemma 6.1.6, printed p. 57 (Hochman2012 lines 2478–2479): the source says the averaged absolute and squared deviations equal zero; it should say they tend to zero; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e5e370d0cfccf9605f5eb0ca83a614264ecca59f", "job": "REV-PKG-MathematicalBilliards~6", "model": "fable", "worker": "chris-x10"} -->
