<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6900996691 -->
Review (claude) of 3bf4eb0

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 4.4: `h_r` is a metric on all of `∂M` only when the tube radius is constant

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, 4.4, lines
   1067–1068: "On `{|r| < ε(q)}`, `(E* g)((u, a), (u', a')) = a a' + h_r(u, u')` with `(h_r)` a smooth
   family of Riemannian metrics on `∂M` and `h_0 = h`"; `design/plan.json`, target 4.4, the same clause.

   **Claim.** For each `r`, `h_r` is a Riemannian metric on `∂M`.

   **Witness.** The README's own strip Check of 4.4: `M = [0, 1] × ℝ`, `ε = 0.9` on `{x = 0}`, `ε = 0.01`
   on `{x = 1}`. At `r = 0.5` the tube has no point over `{x = 1}`, so `h_{0.5}` exists only over
   `{x = 0} × ℝ`.

   **Exact repair.** In the README and in plan target 4.4 replace the clause by: "with `h_r(q)`, defined
   for `|r| < ε(q)`, an inner product on `T_q∂M` depending smoothly on `(q, r)` in the tube (for each
   `r` a Riemannian metric on the open set `{q : ε(q) > |r|}`, which is all of `∂M` when `ε` is constant
   and `|r| < ε`), and `h_0 = h`".

   **Repair test.** Strip: `{q : ε(q) > 0.5} = {x = 0} × ℝ`, `h_{0.5} = dy²` there, `h_0 = dy²` on both
   lines, `−½ ∂_r h_r|₀ = 0 = II`. Unit ball, constant `ε = 1`: `h_r = (1 − r)² h_0` on all of `Sⁿ` for
   `|r| < 1`, `−½ ∂_r h_r|₀ = h_0 = II`. The fourth bullet (`II = −½ ∂_r h_r|_{r=0}`) is unaffected:
   every `q` has `ε(q) > 0`.

One finding (R01, P3) with an exact repair, so the verdict asks for changes; no P1 and no P2. The round-12 finding is repaired. No false, vacuous or
unowned statement was found; every Check and formula recomputed this round agrees with its
statement. No gap is declared and none is needed. This review changed no design file, plan or
manifest entry.

## Previous findings and repairs

| Round-12 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3): four `*Needs:*` lines (4.3, 5.4, 5.5, 6.1) disagree with the plan's prerequisites | 4.3: "*Needs:* 1.3, 3.1; HopfRinow Layers 1–2; …"; 5.4: "*Needs:* 1.4, 2.1, 4.2, 5.1, 5.2, 5.3; …"; 5.5: "*Needs:* 3.4, 4.2, 4.6, 5.1, 5.2, 5.4."; 6.1: "*Needs:* 1.4, 1.5, 2.1, 3.1, 4.3, 5.2, 5.4, 5.5, 5.6."; the Dependencies sentences of Layers 1, 3, 4, 5, 6 changed to match; 3.1: "*Needs:* 1.1–1.4; …" | **Repaired.** My script over both files: for every section 1.1–6.5 no README item lies outside the closure of the plan's prerequisites and every direct plan prerequisite is in the README line (two flags, 1.2 and 3.3, are items my parser drops after a roadmap name; both lines list them, "…; 1.1" and "…; 3.1; …"). |

Adversarial pass on what the repair changed (dependency lines only; no statement changed): rows
"4.3 boundary case", "5.4 glancing value", "5.5 Hessian criterion", "6.1" and "3.1" below. The
repaired pattern was sought in the rest of the design: the Dependencies paragraph of every layer was
read against its `*Needs:*` lines and agrees. Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,658 lines of the README were read this round; the plan by script (6 layers, 49
targets: 30 theorems, 10 definitions, 2 constructions, 7 examples; every `target:` prerequisite
resolves and precedes its user; every definition and construction has at least three tests;
`gaps: []`; baseline pins equal those of `lake-manifest.json`); the six manifest entries. 31
`**Checks.**` blocks; each of the six layers ends with Examples and Dependencies. Searched and found
none: LaTeX delimiters, pull-request numbers, machine paths, HTML anchors, `set_option`, and the words
"optional", "deferred", "for later", "so far", "to be checked", "checkpoint", "handoff", "packet",
"removed", "current", round labels.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. The citation resolver,
re-run, lists no cross-roadmap citation and no Lean name found nowhere.

**Supplier citations resolved** on main (the content checkout, which contains a40f789), by heading
and statement: DifferentialGeometry 5.1 (README line 1648), 12.1 (2801), 12.2 (2848), 12.3 (2871),
12.5 (2936; `exists_halfSpaceOutwardUnitNormal` at 2949–2951 with the three laws determining `N`
pointwise, "decreasing constrained coordinate" being outward; declared in its `Suggested.lean` line
1020); HopfRinow (`Completed/HopfRinow`); RiemannianGeometry 2.2 (R1.4) (1576), R5a (3205), R5c
(3715), R7.9 (4469: second-countable standing hypothesis, normal collar for compact connected
two-sided `Σ` in connected `M`, at most two components, `φ = h∘t` on `U` and `±1` off it with
`grad φ = ν`, the sublevel inclusion with invertible differential and the outward criterion
`dφ(dι v) > 0`); RiemannianGeometry/Surfaces 1.2 (296), 1.3 (340); GeometricTopology Layer 1 (783;
line 785: Hausdorff and second countable throughout the layer), 1.1 (788: collar as an embedding
`∂M × [0, 1) → M` with open image; every second-countable `M` has one; the interior is a
boundaryless manifold), 1.3 (851: the glued manifold, interiors embed openly, collars identified with
`∂M × (−1, 1)`, closed images meeting in `∂M`, compact and connected clauses, the double closed
exactly when `M` is compact); ComplexKahlerGeometry K5a (5.1 at 1440; the half-space Seeley step at
1795–1796); SmoothBundlesConnections B6.0 (1306; uniform normal radii with `IsNormalDomain` at
1327–1328); consumers PositiveMass 5.1 (921), 5.2 (957), AffineMorseLefschetz 4.5 (819; collar
extension at 841), and the folders PositiveScalarCurvature and Yamabe. The overlap report lists no
dropped id, no revision-only id, no other pull request changing this roadmap and no second copy (no
folder of this name on main).

**Pinned declarations.** All 75 library names the README backticks were located by declaration at
the pins (script over both libraries, then by hand where the script's pattern missed `public`
declarations). Opened this round:
`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:256` (`uniqueness`), `:360`
(`leviCivitaConnection`), `:409`; `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:50, 55`
(`ContDiffAt.implicitFunction`), `:91`; `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:103,
112, 330`; `Mathlib/Geometry/Manifold/Instances/Real.lean:60, 200`;
`Mathlib/Geometry/Manifold/PartitionOfUnity.lean:123, 593, 797`;
`Mathlib/Geometry/Manifold/Riemannian/PathELength.lean:66, 208`;
`TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:473` (atlas of `{f ≤ a}` on
`EuclideanHalfSpace (n + 1)`, `finrank ℝ E = n + 1`, boundaryless finite-dimensional model, no
Hausdorff or countability hypothesis: 3.1's use for `−ρ ≤ 0` on a merely Hausdorff `N` is right),
`:639, 652, 675`; `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102` (`IsGeodesicCurveOn`:
`UniqueDiffOn`, `C²` on `s`, vanishing acceleration within `s`, for any `ModelWithCorners`, so it is
defined on a manifold with boundary and on closed intervals, as 4.1 and 5.2 use it), `:134`;
`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58` (context at 50:
`[I.Boundaryless] [J.Boundaryless] [T2Space N] [SecondCountableTopology N]`; hypothesis
`IsClosed (range f)`, a smooth radius below any continuous positive `ε`, open embedding of the open
discs and closed embedding of the closed discs: as 4.3 uses it for the closed set `f⁻¹(0)`);
`…/TubularNeighborhood/Riemannian/Coordinates.lean:89`; `…/TubularNeighborhood/Riemannian/Basic.lean:113`;
`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:143, 161, 181` (boundaryless base, model
of dimension `finrank (E × F) − 1`, which is `2n + 1` here and `1` for `n = 0`);
`…/Riemannian/Pullback/Basic.lean:158`; `…/VectorBundle/Riemannian/Conformal.lean:87`;
`…/Riemannian/Hessian/Conformal.lean:81`; `…/Riemannian/Boundary.lean:115`;
`…/Boundary/Orientation.lean:46, 63`; `…/Boundary/Charts.lean:107, 321, 374`;
`…/Boundary/Derivative.lean:64`; `…/Riemannian/Laplacian.lean:135, 158, 197`;
`…/CovariantDerivative/LeviCivita/Immersion.lean:65`; `…/Riemannian/Geodesic/Normal/Coordinates.lean:84,
270, 292`; `TauCeti/Analysis/Calculus/Hadamard.lean:115, 131`;
`TauCeti/Analysis/Calculus/ParametricIntegral.lean:211`. No name is missing at the pins.
`exists_halfSpaceOutwardUnitNormal` is DifferentialGeometry's and is attributed to it; the README
attributes no backticked Lean name to this roadmap.

**Seeded source sample** (read in the cached texts this round; "book" is
paternain-salo-uhlmann2023, "article" is stefanov-uhlmann-vasy2021).

| Target | Locator read | Result |
|---|---|---|
| 1.1, 1.2 | book lines 2681–2696 | `∂±SM` by the sign of `⟨v, ν⟩`, `ν` the inward unit normal (2687–2689), `∂₀SM = S(∂M)` (2696); as cited |
| 2.1 | book lines 2728–2739, 2449–2461; article lines 53, 89–90, 93 | Definition 3.1.7 (positive definite `Π`); Definition 2.5.1 names the circle from the side of the larger radii (2457); strict convexity at a point (89–90) and everywhere (93); as cited |
| 2.2 | book lines 2781–2784, 2838–2841; uhlmann-vasy2016 lines 499–503 | `−Π = Hess ρ` on glancing vectors, the iff at 2840–2841; the covector condition; as cited |
| 2.3 | book lines 3093–3095; uhlmann-vasy2016 lines 49–51 | strict convexity an open condition; stability under small perturbations of `g`; the README proves more itself (uniform bound, families) |
| 3.3 | book lines 2749–2762 | Lemma 3.1.8 for compact `M`, proved only for subsets of `ℝⁿ`, the double left as Exercise 3.1.9; the README's statement is wider and its route is its own |
| 4.2 | book lines 2801–2828, 2781–2784, 2795–2798, 2841–2844; uhlmann-vasy2016 lines 499–503 | Lemma 3.1.13 (three derivatives of `h`), the Taylor expansion at 2842, leaving and no interior tangency at 2795–2798; as cited |
| 4.5 | uhlmann-vasy2016 lines 30–32, 504–524; article lines 128–134 | the Theorem; `U₀`, `C₀`, `δ` at 504–506; `x̃ = −ρ − ε|z − p|²` at 512; compactness at 513–514 and 522–524; as cited |
| 4.6 | book lines 3093–3096 | the slightly larger `M₁` with strictly convex boundary, non-trapping; the source gives no construction, the README's is its own |
| 5.1 | book lines 2646–2648, 2682–2696, 2931, 3063–3079; article lines 151–153 | `SM`, the strata, `μ`, the flow and `X`; the article's `∂₊` points outside and its `L` maps `∂₋` to `∂₊`; as cited |
| 5.2 | book lines 2659–2661, 2674–2676, 2666, 2849–2861 | Definitions 3.1.1 and 3.1.3, Exercise 3.1.2(b), Example 3.2.1; as cited |
| 5.3 | book lines 2970–2982, 2985–3026, 3039–3045 | Lemma 3.2.10 with `a = h(g(y), y)`, `Q = g + S`, `r ↦ Q` increasing (3020–3021); Exercise 3.2.12 has no parameters and line 3039 uses them: the README says so |
| 5.6 | book lines 3114–3127; article lines 150–163 | Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6; `L`, `ℓ` on `B∂M` (160–162); as cited |
| 6.4 | book lines 2677–2678 | small spherical caps non-trapping; the general statement rests on lee-riemannian2018 (uncertified) and the route |
| 6.5 | article lines 66–72; book lines 2462–2481 | condition (1.1) `(r/c(r))′ > 0` and its equivalence with strict convexity of the spheres (72); Lemma 2.5.2, Corollary 2.5.3; as cited |

No author-flagged unverified locator exists. Also read: book lines 305–310 (6.1), 2499–2521 (6.3),
2865–2949 and 2955–2969 (5.4: Lemmas 3.2.3, 3.2.6, 3.2.8, 3.2.9), 3027–3055 (Lemma 3.2.11, Remark
3.2.13), 3081–3113 (5.5, Exercise 3.3.3), 2766–2773 (4.3); article lines 20–22, 96–100, 198–205,
220–221; uhlmann-vasy2016 lines 25–29, 134–140.

**Adversarial table** (values computed this round: the sampled targets, the headlines, and the
targets the repair and R01 touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy and curves | half-plane, `v = (a, b)`; `c` on `(−ε, ε)` | `dx⁰(v) = a`: outward `a < 0`, tangent `a = 0`, inward `a > 0`; `x⁰ ∘ c ≥ 0` with minimum `0` at `t = 0`, so `a = 0` | holds | none |
| 1.2 chart formula | `g = [[1, a], [a, 1]]`, `a = 1/2`; `[0, 1]` | `g(e₀ − a e₁, e₁) = a − a = 0`, norm² `1 − 2a² + a² = 1 − a² = 3/4`, `ν_in = (2/√3, −1/√3)`; `g(e₀, e₁) = 1/2 ≠ 0`; `ν_out(0) = −∂_x`, `ν_out(1) = +∂_x` | holds; chart direction excluded | none |
| 1.4 three descriptions | unit ball, `ν_out = x`; tangent `W` | `−Hess ρ/ǀdρǀ = 2h/2 = h`; `⟨∇_u x, w⟩ = ⟨u, w⟩`; `⟨∇_u W, ν_in⟩ = −⟨W, ∇_u ν_in⟩ = ⟨w, u⟩`; with `ν_in`: `−h` | all three agree | none |
| 1.6 conformal law | general; disc `φ = −ǀxǀ²`; `φ = log c` | `−(Hess ρ + ǀdρǀ dφ(ν_in) g)/(e^{−φ}ǀdρǀ) = e^{φ}(II − dφ(ν_in) h)`; `dφ(−x) = 2`, `e^{−1}(1 − 2)h`, `Ĥ = e·(1 − 2) = −e`; `c II` | holds; wrong sign gives `3e^{−1}h` | none |
| 2.1 predicates | `{y ≥ x³}`; `n = 0`; cylinder | `Hess ρ(t, t) = −6x/(1 + 9x⁴)`, `ǀdρǀ = (1 + 9x⁴)^{1/2}`, `II = 6x/(1 + 9x⁴)^{3/2}`; both strict conditions vacuous; curvatures `1, 0`, `H = 1/2` | holds; exclusion needs `n ≥ 1`, as stated | none |
| 2.2 Hessian iff (headline) | ball with `ρ` and `(2 + x₁)ρ`; exterior; `−ρ` | `−2h` and `−2(2 + x₁)h`, factor in `[1, 3]`; `+2h`; `−ρ < 0` inside, not a defining function | both directions hold | none |
| 2.3 openness, bound, families | hyperbola epigraph; ball; `n = 0`; `g_s = e^{−2sǀxǀ²}g` | `y″/(1 + y′²)^{3/2} = (1 + 2x²)^{−3/2} → 0`; `1 ≥ c`; `0 = c·0` for every `c`; `dφ(ν_in) = 2s`, `II = e^{−s}(1 − 2s)h`, zero at `s = 1/2` | holds; compactness needed for the bound | none |
| 3.1 (dependency line repaired) | ball with `ρ`, `e^{x₁}ρ`, `(2 + x₁)ρ` | same `II = h`; `(2 − 3)(1 − 9) = 8 > 0` at `x₁ = −3`, `{ρ′ ≥ 0}` is ball ∪ `{x₁ ≤ −2}`, `dρ′ = (1 − ǀxǀ²)dx₁ ≠ 0` there; no `H`, no conformal law used | holds from 1.1–1.4 | none |
| 3.3 `ρ̃ = φ₀ χ(t) + φ₁ s` | `t > 0`; `t < 0`; near `∂M`; `[0, 1]`; `∂M = ∅`; `x³(1 − x)³` | two terms `≥ 0`, not both `0`; both `≤ 0`, not both `0`; `supp φ₁ ∩ ∂M = ∅`, so `φ₀ = 1`, `ρ̃ = t`, `dρ̃(∂_t) = 1`; `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x`, slope `2`; `ρ̃ ≡ 1`; derivative `0` at `0, 1` | regular value `0`, `M = {ρ̃ ≥ 0}` | none |
| 3.5 realisation (headline) | disc; `[0, 1]`, `(1 + x)² dx²`; closed `M`; `[0, ∞)`; compact `M` with a closed component; doubled point | `ℝ²` or `S²`, `II = h` in both; length `∫₀¹(1 + x) = 3/2`; `ρ̃ ≡ 1`; `M̃ ≅ (−1, ∞)`; the double has that component twice with `ρ_D = ±1`, still compact; not Hausdorff, no realisation | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴` with `Hess ρ(e_x, e_x) = −12x² = 0`; no nonzero tangent vector | iff holds; leaving does not give strict convexity | none |
| 4.3 boundary case (dependency line repaired) | ball, `y = e₁/2`; strip, `y = (0.8, 0)` | `r = 1/2`; segment `(1 − t)e₁`, `ρ = 1 − (1 − t)² ≥ 0`, length `1/2 = d_N`; lower bound from 3.1 (Lengths) only; strip: `r_{x=1} = 0.2` | holds without 4.1 | none |
| 4.3 `ρ̂` | `W ∖ M`, `r < −δ`; off `M ∪ W`; ball `ε₂ = 3/4`, `ε₁ = 1/2` | convex combination of `r < −δ` and `−1 < −δ`; `ρ̂ = −1`; `ψ = 0` for `ǀxǀ ≤ 1/4`, so no `ǀxǀ³` term at `0` | holds; `δ < 1` needed, as stated | none |
| 4.4 `h_r` | ball radius `R`; cap; strip `ε = 0.9, 0.01`, `r = 0.5` | `(1 − r/R)² h₀`, `−½ ∂_r = h₀/R`; `a = sin(φ₀ − r)/sin φ₀`, `−a_r(0) = cot φ₀`; `h_{0.5}` only over `{x = 0}` | formula holds; "metrics on `∂M`" imprecise | R01 |
| 4.5 convexity function (headline) | disc at `q = (0, −1)`; exterior; `[0, 1]`; `K₀` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = (0, −2) = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; `{x + εx² ≤ c}`; `{q}` | holds | none |
| 4.6 enlargement | ball `ε₁ = 1/4`; cap `R`; `(1 − r²)e^{−r²}`; `∂M = ∅` | radius `1 + δ < 5/4`, `II = h/(1 + δ)`; convex iff `R + δ < π/2`; radial derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, `0` at `√2`, minimum value `−e^{−2}`; `M_δ = M` | holds; `δ₀` depends on the domain | none |
| 5.1 strata | disc; `[a, b]`; `μ` on a fibre, `n ≥ 1`; glancing point | torus, two circles, annulus; four points, `μ = ±1`; `dμ(δv) = ⟨δv, ν⟩ = 1` for `δv = ν ⊥ v`; `σ̃(φ_t z) = −2⟨(t, −1), (1, 0)⟩ = −2t` | holds | none |
| 5.2 exit time | annulus at `(−3/2, −1)`; nearby start; speed `λ`; `v = 0` | `9/4 + 1 ≤ 4`, exit at `x = √3`: `3/2 + √3`; `3/2 − √(2δ − δ²) → 3/2`; `τ/λ`; `∞` | discontinuous without convexity | none |
| 5.3 fold form, even functions | `y − t²`; `y − t⁴`; ball; `cos r`; `ǀrǀ` | `g = 0`, `F = 1`, `Q = r`, `a = y`; `∂_t² h = 0`; `g = −⟨x, v⟩`, roots `−b ± √(b² + c)`, and Remark 3.2.13's `Q = (−2b + r)/2`, `a = 4(b² + c)` give the same roots, `∂_r Q = 1/2 > 0`; `H(s) = Σ(−s)^k/(2k)!`; not smooth | holds | none |
| 5.4 regularity (headline) | ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; glancing value with `ρ` and `2ρ`; `[a, b]` | `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c) = τ`, `τ² − στ − T = 0`; root `≈ −2h′(0)/h″(0) = 2μ/II`, unchanged when `ρ` doubles; ball: `(−b)/(−2b) = 1/2`; `σ = a + b − 2x`, `Xσ = −2` | holds; no `ρ̂`, no uniform bound used | none |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; half-circle; `u = −∫₀^{τ_δ} h ∘ φ_t` | `Xf = Hess(ǀxǀ²/2)(v, v) = 1` (4.2's identity), bound `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); `τ(θ, ±1) = π/2 ∓ θ`; `u(φ_s z) = −∫_s^{τ_δ(z)} h(φ_t z) dt`, `s`-derivative `+h(z)` | equivalence holds on each | none |
| 5.6 scattering (headline) | ball; disc; `[a, b]`; `z ∈ ∂₊SM` | `⟨x − 2bv, v⟩ = −b`, `α² = id`, fixed points `b = 0`; `ℓ = 2μ = 2√(1 − ǀwǀ²)`, `ǀLǀ = ǀwǀ`; `α(a, +1) = (b, +1)`; `τ̃(αz) = −τ(z)`, `α(αz) = φ_{−τ}φ_τ z = z` | holds | none |
| 6.1 (dependency line repaired) | speed `1/4`; ellipse vertex; graph form | `(0 + √(1/16))/(1/16) = 4 ≤ 2/(1/4) = 8`; `(2/b²)/(2/a) = a/b²`; `ρ = x₀ − w`, `Hess ρ = −D²w`, `ǀdρǀ = 1`: from 1.4 and 3.1 only | holds without 3.2 | none |
| 6.3 caps, hyperbolic | cap; hyperbolic plane; `R = 1` | `−(−cos R)/sin R = cot R`; `Hess u_xx = 1/y − u_y/y = 1/(2y) + (x² + 1)/(2y³) = u/y²`, `Hess u_xy = −x/y² + x/y² = 0`, `Hess u_yy = (x² + 1)/y³ + u_y/y = u/y²`; `coth 1 = 1.313`, `cot 1 = 0.642` | holds | none |
| 6.4 small balls | normal coordinates; torus `R = 1/4`; `S¹` | `2δ_ij − 2z_k Γ^k_ij = 2g_ij + O(ǀzǀ²)`; `II = 2h/(2·1/4) = 4h`, `τ ≤ (1/4 + 1/4)/1 = 1/2`; `θ²` smooth on `B(p, π)` | holds | none |
| 6.5 conformal ball | general `φ`; `φ = s² − 2s`; `φ = −s`; Herglotz form | `dφ(ν_in) = −2rφ′`, `II = e^{φ}(1/r + 2rφ′)h = (b′/r)h`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, zero at `1/√2`, `b′(1) = e^{−1}`; `b′(1) = −e^{−1}`; `r/c = r e^{φ(r²)} = b` | holds | none |

Sections 1.3, 1.5, 3.2, 3.4, 3.6 and 4.1 were read in full and their Checks recomputed
(`u = 2 + x₁ ∈ [1, 3]` and `dρ″ = 0` on the sphere; `II{ǀzǀ² ≤ c} = 2h/(2√c) = h/√c`;
`Hess(ǀz − z₀ǀ) = (g − dx ⊗ dx)/ǀz − z₀ǀ`; `(x + 1/100) < 0` for `x < −1/100`; Gauss
`0 + 1·1 − 0 = 1` and `0 + 1·0 − 0 = 0`; `ǀq + tvǀ² = 1 + t²ǀvǀ² > 1`).

**Duplication and ownership.** Roadmap search this round (open heads, then main), README text, for:
scattering relation, non-trapping, boundary defining function, strictly convex boundary, convex
boundary, boundary normal coordinates, mean-convex, and second fundamental form or mean curvature of
a boundary: no owner outside this roadmap (RiemannianGeometry/MinimalSurfaces line 1959 names R5a's
form on a boundary; PositiveMass 5.1 is a consumer). "Exit time" matches on main only in the
stochastic and flow senses; "signed distance" in GeometricCurrents line 870 (planes) and
RiemannianGeometry line 4688 (a Check of R7.9, cited here); "collar extension" in AffineMorseLefschetz
line 841, which the Scope names; "defining function" in ManifoldOptimization line 304 (local
equations of an embedded submanifold, another object). Ownership against the open pull requests was
checked through the roadmap tools at their heads; the board's package index lists AnalyticNumberTheory
and LawrenceVenkateshMethod only.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics and the README does not say it follows a source.
The order is forced by the dependency lines: Layer 2 needs 1.4–1.6; Layer 3 needs 1.1–1.5; Layer 4
needs 3.1 and 3.5; Layer 5 needs 4.1–4.2 and 4.6; Layer 6 needs all. Every definition (1.3, 1.4,
1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.4's `τ̃`, 5.6) has its API bullets and at least three Checks; every
theorem has its hypotheses in the sentence and a locator.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit and
the import check have nothing to inspect. Elaboration: not available (this lane does not elaborate).
No Lean command was run.

**Copyright and arrangement.** Twenty-one passages were set beside the sources at their locators
(the sampled sections above and 1.3, 1.4, 3.2, 4.3, 5.4, 5.5, 6.1, 6.3), and a script compared every
run of seven or more words of the README with the cited regions of the three cached texts. The
longest shared prose run is eleven words, in 5.4's statement of Lemma 3.2.8 (book line 2936), a
one-sentence statement within what the mathematics forces; the next are ten words (the standard
name "level sets … strictly concave from the superlevel sets", article line 199) and nine (the
hypotheses of Lemma 3.2.10, book line 2970). No sentence, list or proof plan follows a source clause
by clause: the routes of 3.3, 4.3, 4.6 and 5.4's fold bullet are not in the sources. Contents of the
book against the layers: §3.1 is spread over 1.1, 1.4, 2.1, 3.5, 4.1, 4.2, 4.3, 5.1, 5.2; §3.2 ↔
5.3–5.4; §3.3 ↔ 5.1 (flow), 5.5–5.6; §2.5 ↔ 1.6, 6.2, 6.5. The order inside Layer 5 is forced (5.2
needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need 5.4), 5.3 is placed before its use and the flow before
the exit time, unlike the source. Layers 1–4 and 6 map onto no run of sections. No table, figure or
exercise list is reused.

Source independence: 21 passages compared with 3 sources, none shared beyond an eleven-word statement; largest share paternain-salo-uhlmann2023, 38 of 66 named source mentions in the layers; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, the form `dr² + h_r` of 4.4 and the general statement of 6.4
  have no certified locator besides them; their signs and normalisations are fixed by the computed
  values above.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of `T` is the exit time at the point "x minus v"; it should be the exit time of the reversed vector `(x, −v)`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3bf4eb06437938689af3b7dc26a53684d4112bd9", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~13", "model": "fable", "worker": "chris-x88"} -->
