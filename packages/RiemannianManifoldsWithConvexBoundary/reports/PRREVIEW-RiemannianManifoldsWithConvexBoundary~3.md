# Review of RiemannianManifoldsWithConvexBoundary (pull request #2451 at 689d6f5)

**Verdict:** accepted

No findings. Full review; the head is the one the previous review read (no change in the folder since).

## Previous findings

- R01 (4.5 negative control): repaired. README §4.5: "For `x̃ = −ρ` and any open `U ∋ q`, `K_0 = U ∩ {y = x²}` is a nonempty open subset of the parabola, which is connected and not compact".
- R02 (4.3–4.4 locators): repaired. README §4.4: "(Paternain–Salo–Uhlmann, Proposition 11.2.2, lines 10065–10077, for compact `M` in a closed manifold; …"; §4.3: "(Stefanov–Uhlmann–Vasy, lines 99–100; Paternain–Salo–Uhlmann, Lemma 3.1.10, lines 2766–2773; …".
- R03 (description's supplier list): repaired. Description: "RiemannianGeometry (R5a; R5c, items 1 and 3; R7.9), GeometricTopology (1.1, 1.3), ComplexKahlerGeometry (K5a) and SmoothBundlesConnections (B6.0)".

## Verified sound

| Target | Instances tried | Values computed (roadmap / independent) | Result |
|---|---|---|---|
| 1.1 tangent, inward, outward | disc at `(0, −1)`, `v = (t, ±1)`; `[0, 1]` | `⟨(t, 1), (0, 1)⟩ = 1 > 0` inward; `T_q∂M = 0` in dimension one, every nonzero vector inward or outward | holds |
| 1.2 unit normal (convention used by 1.4) | half-plane, `g = [[1, a], [a, 1]]`, `a = 1/2` | `g(e₀ − a e₁, e₁) = 0`, norm² `1 − a² = 3/4`, `ν_in = (2/√3, −1/√3)` | holds |
| 1.4 `secondFundamentalForm` | unit ball, exterior, half-space; wrong model `⟨∇ν_in, ·⟩` | `−Hess(1 − \|x\|²)/2 = h`; exterior `−h`; half-space `0`; wrong model gives `−h` on the ball | sign pinned; Lean body uses coordinate `0` of `extChartAt` |
| 1.5 Weingarten, `H` | sphere, cylinder in `ℝ³`, exterior | `H = 1`; `(1 + 0)/2 = 1/2`; `−1`; `n = 0` excluded | holds |
| 1.6 conformal law | `φ = log 2`; `φ = −\|x\|²` on disc; `φ = (\|x\|² − 1)²` | `2h` (= radius-2 ball pulled back, `4h/2`); `dφ(ν_in) = 2`, `e^{−1}(1 − 2)h`, `Ĥ = −e`; `II` unchanged | holds; derivation from conformal Hessian rechecked |
| 2.1 predicates | `{y ≥ x³}`; `n = 0`; PSU Def. 2.5.1 side | `II = 6x/(1 + 9x⁴)^{3/2}`; both strict predicates vacuous for `n = 0`; `r̈ > 0` ⇔ `{r ≤ r̄}` strictly convex | holds |
| 2.2 `isStrictlyConvexAt_iff_hessian_neg` | `ρ' = uρ`, `u = 2 + x₁`; `−ρ`; `n = 0` | on `T∂M`: `Hess ρ' = u Hess ρ = −2(2 + x₁)h < 0`; `−ρ` fails `pos`; `n = 0` both sides vacuous | holds; not closed by one tactic |
| 3.2 level sets | `x = \|z\|²`, `c > 0`; affine; SUV distance example | `II = 2h/(2√c) = h/√c`, superlevel `−h/√c`; affine `0`; `Hess\|z − z₀\| = (g − dx⊗dx)/\|z − z₀\|` | holds |
| 3.3 `ρ̃` on collar extension, double | `[0, 1]`, `c(0, t) = t/2`; half-space; `x³(1 − x)³` | `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x` for `\|x\| < 1/4`; `φ₁ = 0` near `∂M` gives `ρ̃ = χ(t) = t`; cubic has `dρ = 0` | holds |
| 3.5 `exists_isSmoothEmbedding_regularDomain` | `[0, 1]`; `[0, ∞)`; closed `M`; compact `M` with a closed component; `M = ∅` | circle; `(−1, ∞)`; `ρ ≡ 1`; double carries `ρ_D = −1` on the second copy; Mathlib `IsImmersion` uses extended chart target | holds; not closed by one tactic |
| 3.6 comparison with `B` | unit sphere; cylinder; exterior | `⟨−⟨X,Y⟩x, −x⟩ = h`; Gauss `0 + 1·1 − 0 = 1` and `0 + 1·0 − 0 = 0`; exterior `−h` | holds; Gauss sign matches index order |
| 4.2 second-order contact; `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt`, `mem_interior_of_isGeodesicCurveOn` | ball, exterior, `{y ≥ x⁴}`; `n = 0`; `a ≥ b` | `ρ(q + tv) = −t²`, `+t²`, `−t⁴` with `II = 0`; `n = 0`: no nonzero tangent `v`; `a ≥ b`: `hnc` false | holds; one-sided `C²` Taylor suffices on `Ico 0 ε` |
| 4.3 signed distance, `ρ̂` | `S^n`, `f = 1 − \|x\|²`; cutoff `\|x\|²` near `0` | `r_Σ = 1 − \|x\|`; `\|x\|² − \|x\|³` not `C³`; `M ∖ W₁`, `N ∖ (M ∪ W₁)` disjoint closed; `ρ̂ ≥ −δ ⇒ r ≥ −δ` | holds |
| 4.5 `exists_convexityFunction` | disc; parabola; `dim E = 0, 1` | `Hess x̃ = (2 − 2ε)g`; `K_c ⊆ {ε\|z\|² ≤ c}`; `dim 0` hypothesis false; `dim 1` kernel zero | holds; not closed by one tactic |
| 4.6 enlargements | unit ball `ε₁ = 1/4`; `(1 − \|x\|²)e^{−\|x\|²}`; `∂M = ∅` | `II = h/(1 + δ)`; radial derivative `−2re^{−r²}(2 − r²)`, minimum `−e^{−2}` at `√2`; `M_δ = M` | holds |
| 5.2 `exitTime`, `IsNonTrapping` | disc; annulus; `T ≤ 0`; zero vector | `2 sin θ`; `3/2 + √3` versus `3/2 − √(2δ − δ²)`; `ofReal T = 0`; constant curve gives `∞` | holds |
| 5.3 fold form, even functions | `h = y − t²`; `y − t⁴`; Morse chart | `Q = r`, `a = y`; `k = k(y, 0) − cϑ²`, `∂_rQ = 1/(√c ∂_sϑ)`; `exists_parametric_morse_chart` has `n : ℕ∞`, so `∞` allowed | holds |
| 5.4 `contMDiffOn_exitTime`, `…_sub_…`, `…_mul_…` | unit ball; `[a, b]` | `σ = −2⟨x, v⟩`, `T = 1 − \|x\|²`, `Xσ = −2`; `σ² + 4T = (b − a)²`, `τ = b − x`; `μ/τ̃ = 1/2` | holds; none closed by one tactic |
| 5.5 `isNonTrapping_tfae` | ball `u = \|x\|²/2`; closed `M ≠ ∅`; `M = ∅`; half-circle | bound `2`; all three fail (`u(φ_t z) = u(z) + t` unbounded); all three hold; `τ = π/2 ∓ θ` | holds; not closed by one tactic |
| 5.6 `scatteringRelation_involutive`, `exists_contMDiffOn_eq_scatteringRelation` | disc `w = (c, 0)`; `[a, b]`; glancing; zero vector; `T ≤ 0` | `y = (2c√(1 − c²), 1 − 2c²)`, `\|L\|² = c²`; `α(a, 1) = (b, 1)`; `Icc 0 0` not `UniqueDiffOn`, `0 ∉ Icc 0 T` for `T < 0`: endpoint `z` | holds; local retraction onto `∂SM` gives the extension |
| 6.1 balls, convex domains | `τ` root; ellipse vertex; speed `1/4` | roots of `t² + 2⟨x − c, v⟩t + \|x − c\|² − R²`; `II = (2/b²)/(2/a) = a/b²`; `τ(0, e₁/4) = 4` | holds |
| 6.3, 6.5 (used by Checks of 4.6, 5.5) | cap; `u = cosh d`; `φ(s) = s² − 2s` | `cot R`; at `(0, 2)`: `u = 5/4`, `\|du\| = 3/4`; `b′ = e^{r⁴ − 2r²}(2r² − 1)²`, `b′/r = e^φ(1/r + 2rφ′)` | holds |

- Source locators checked against the text: 61 (45 in `paternain-salo-uhlmann2023`, 11 in `stefanov-uhlmann-vasy2021`, 5 groups in `uhlmann-vasy2016`), every locator of the fifteen sampled sections among them; all carry the cited statement, with the hypotheses the README states (compactness in Lemma 3.1.8, Proposition 11.2.2; dimension two in Section 2.5). No locator is flagged unverified in the README.
- Library declarations opened at the pins: `TauCeti.Manifold.IsGeodesicCurveOn` and `IsGeodesicCurveOnFrom` (`Geometry/Manifold/Riemannian/Geodesic/Basic.lean`:101, 134: `UniqueDiffOn`, `zero_mem`), `TauCeti.Manifold.hessian` (`Riemannian/Laplacian.lean`:135, no boundaryless hypothesis), `TauCeti.IsOutwardPointing` (`Boundary/Orientation.lean`:46), `TauCeti.IsRegularValue` (`RegularValue.lean`:92), `TauCeti.exists_parametric_morse_chart` (`Analysis/Calculus/Morse/Parametric.lean`:100), sphere bundles (`VectorBundle/Riemannian/Sphere.lean`:135, `[I.Boundaryless]`), `isGeodesicallyCompleteAt_of_compactSpace` (`Geodesic/Compact.lean`:68–71), `exists_isClosedEmbedding_normalExp_norm_le_subset` (`TubularNeighborhood/Riemannian/Noncompact.lean`:58), Mathlib `IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean`:70) and `ImmersionAtProp` (`Immersion.lean`:143); every other backticked library name of the supplier contracts resolves at the pins.
- Cross-roadmap citations resolved on main: DifferentialGeometry 5.1 (README line 1648), 12.5 `exists_halfSpaceOutwardUnitNormal` (line 2950, `Suggested.lean`:1020); RiemannianGeometry R1.4 (1576), R5a (3205), R5c items 1 and 3 (3715, 3868–3890), R7.9 (4469); Surfaces 1.2–1.3 (296, 340); GeometricTopology 1.1, 1.3 (788, 851); ComplexKahlerGeometry K5a Seeley step (1796); SmoothBundlesConnections B6.0 (1306); AffineMorseLefschetz 4.5 (819); PositiveMass 5.1–5.2 (921, 957); HopfRinow under `Completed/`.
- Gate: every check passes, the targeted build included. Dependency check output: `depcheck: 258 roadmaps, 2463 edges, 0 problem(s)`. Outside-folder diff: empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. Elaborated types of the 22 declarations compared with the README: the only dropped binder is `[IsManifold (𝓡∂ (n + 1)) ∞ M]` on `IsBoundaryDefiningFunctionOn`, which its fields do not use; nothing changed. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: 0 of 11 theorems close. All 11 headline theorems of the Summary are stated; the 11 definitions are each used by one of them.
- Duplication audit by object (exit time, scattering relation, non-trapping, boundary defining function, strictly convex boundary, boundary normal coordinates, the ten definition names) over main and the open heads: no other owner; Varifolds states the second fundamental form of a `C²` submanifold and cites RiemannianGeometry R5a, as 3.6 does. No `Suggested.lean` shares a fully qualified name.
- Overlap check: read ManifoldOptimization, LorentzianGeometry, Varifolds, HyperbolicDynamicsAndThermodynamicFormalism, SmoothBundlesConnections, RiemannianGeometry, HopfRinow, Surfaces; nothing shared (R5a, R5c, R7.9, Surfaces' normal strips and B6.0 are cited from their owners; no open pull request changes this roadmap or drops an id it cites).
- Pull-request text read against the head and the folder's change: title, summary block and prose agree with it (a new roadmap, six suppliers, all on main).
- Source independence: 20 passages compared with 3 sources (the fifteen sampled sections and the statements of 3.5, 5.4, 5.5, the 5.3 route and the `Suggested.lean` docstring of `exists_convexityFunction`), none shared beyond formulas and hypothesis lists; largest share `paternain-salo-uhlmann2023`, 47 of 84 citations; contents compared with `paternain-salo-uhlmann2023` (Sections 2.5, 3.1–3.3, 11.2 feed parts of Layers 2–6, in no matching order or scope): independent. The texts of `lee-riemannian2018`, `lee-smooth2012` and `sharafutdinov1994` were not read.

## Not verifiable

- `lee-riemannian2018` (Ch. 5 pp. 133–136, Ch. 6 Lemma 6.16 and Theorem 6.17, Ch. 7–8): settled as uncertified; cited by locator only.
- `lee-smooth2012` Theorem 9.25: settled as uncertified; cited through GeometricTopology 1.1, which carries the same locator.
- `sharafutdinov1994` Ch. 4: settled as uncertified; named in the References as an alternative account, no target depends on it.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the product `T` is the exit time at `(x, v)` times the exit time at `(x − v)`; it should be the exit time at `(x, −v)`, as Remark 3.2.13 uses it; affects nothing.
- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed page 47: the source says the outer-boundary condition is positivity of `b′` at `1`; it should be at the outer radius `r₁` of the annulus `{r₀ < r ≤ r₁}`; affects nothing.

## For the human reviewers

- none
