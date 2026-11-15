<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6903105240 -->
Review (claude) of e885950

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 6.3's `*Needs:*` line omits 5.2

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, 6.3, line 1556:
   "*Needs:* 1.4, 2.1, 3.1, 3.2, 5.5; Tau Ceti `TauCeti.sphereRoundMetric`, …"; Layer 6 Dependencies,
   line 1647; `design/plan.json`, target 6.3.1, prerequisites.

   **Claim.** The line lists, item by item, what the statement and its route need.

   **Witness.** 6.3 states "`C_R` is non-trapping for every `0 < R < π`, with `τ(θ, ±1) = R ∓ θ`"
   (lines 1522–1523): `τ` and non-trapping are 5.2's definitions, and the value is read off 5.2's
   realisation formula, not off 5.5. Sibling lines 1483 (6.1) and 1510 (6.2) list 5.2.

   **Exact repair.** README 6.3: "*Needs:* 1.4, 2.1, 3.1, 3.2, 5.2, 5.5; …". Layer 6 Dependencies:
   "6.3 uses 1.4, 2.1, 3.1–3.2, 5.2, 5.5 and Tau Ceti's round sphere and hyperbolic space". Plan
   6.3.1: add `target:5.2`.

   **Repair test.** `n = 0`, `R = 3π/4`, start `θ`, direction `+1`: the geodesic `t ↦ θ + t` stays
   in `{ǀθǀ ≤ R}` exactly for `t ≤ 3π/4 − θ`, so 5.2's realisation formula gives
   `τ(θ, +1) = 3π/4 − θ`, which is the stated value; 5.2 precedes 6.3 and is already a prerequisite
   of 5.5, so no cycle and no reordering arises.

One finding, P3 (R01), with an exact repair for the fix round; no P1 and no P2. Both round-15 findings are
repaired. No false, vacuous or unowned statement was found; no gap is declared and none is needed.
This review changed no design file, plan or manifest entry. Maintainer notes: none were supplied.

## Previous findings and repairs

| Round-15 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3): 3.6 applies RiemannianGeometry R5a outside R5a's standing setting | `design/README.md` 3.6, lines 880–883: "For a regular domain `M = {ρ ≥ 0}` of a second-countable `(N, g)` as in 3.1 (RiemannianGeometry's standing setting, in which R5a is stated; …) … both Hausdorff and second countable (`∂M` carries the subspace topology of `N`, by 3.1)"; supplier contract, line 275: "R5a (in RiemannianGeometry's standing setting, Hausdorff, second-countable, boundaryless: for an isometric immersion of such manifolds"; Conventions, line 170: "in a second-countable extension (3.6)"; plan 3.6 has the hypothesis "N second countable (the standing setting of RiemannianGeometry R5a) …" | **Repaired.** The witness (an uncountable disjoint union of planes) is excluded; `TauCetiRoadmap/RiemannianGeometry/README.md` line 156 is the setting cited. |
| F02 (P3): 6.3 does not introduce the centre `p` of the cap | `design/README.md` 6.3, lines 1515–1516: "prove for `p ∈ S^{n+1}` (a unit vector of `ℝⁿ⁺²`) and the cap `C_R = {⟨x, p⟩ ≥ cos R}` of geodesic radius `R` about `p`"; Check, lines 1535–1541, shows `ǀdρǀ² = ǀpǀ² − ⟨x, p⟩²` and the negative control `p = 2e`; plan 6.3.1 has the hypothesis and the test `unit_centre`; 6.1 and 6.2 now quantify `c ∈ ℝⁿ⁺¹` | **Repaired.** |

Adversarial pass on the changed passages (values in the table below, rows 3.6, 6.3, 6.1/6.2). The
repaired patterns were sought in the rest of the design. "A supplier's standing hypothesis not
carried by the user": R5a is used in 1.5 (convention only), 3.6 (now stated), 6.5 (ambient
`ℝⁿ⁺¹`, second countable); R7.9 in 3.1 (reduced to chart domains) and 4.3 (Layer 4 preamble
assumes second countability there); R5c in 3.5 (statement gives a second-countable `M̃`); K5a in
3.4 and 5.3; B6.0 in 6.4 (second countability stated); the tube theorems in 4.3, 4.4, 4.6; all
carry the hypothesis. RiemannianGeometry's Conventions also allow zero-dimensional immersions
("Zero-dimensional immersions use trace B=0", line 193), so 3.6 at `n = 0` stays inside R5a.
"A free symbol in a formula": every centre, radius, parameter and function of Layer 6 and of the
Checks is quantified (`c`, `R`, `p`, `φ`, `b`, `a, b > 0` of the ellipse, `s` of the conformal
family, `φ₀` of 4.4's cap, `q`, `ε`, `c₀` of 4.5, `δ₀`, `ε₁` of 4.6).

## Verified sound

**Coverage.** All 1,690 lines of the README were read this round and every formula and Check
recomputed by hand; the plan by script (6 layers, 49 targets; every `target:` prerequisite exists
and precedes its user; every definition and construction has at least three tests; every target
has a locator; no `gap:` prerequisite, `gaps: []`; baseline Mathlib `1b1ccf4`, Tau Ceti
`2fd255d`); the six manifest entries (three certified, three settled as uncertified; every work
cited in the README has an entry). Each layer ends with Examples and Dependencies. No LaTeX
delimiter, pull-request number, machine path, HTML anchor, `set_option`, `lemma` or round label
in the README (pattern search, no hit).

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 238 roadmaps, 2249 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. The citation resolver's
list for this README is empty (no cross-roadmap citation and no Lean name found nowhere).

**Supplier citations resolved** on main (head `d03a621`; the cited folders are unchanged since the
head the overlap report used): `TauCetiRoadmap/RiemannianGeometry/README.md` Conventions 156
(Hausdorff, second-countable, boundaryless), 188–193 (`B`, `S_η`, averaged `H=(1/m)tr B` for
`m>0`, "outward-normal unit sphere has B=−g times its position vector"), 2.2 (R1.4) at 1576, R5a at
3205 with the Gauss sign `+⟨B(X,W),B(Y,Z)⟩−⟨B(X,Z),B(Y,W)⟩` and "B=0 is equivalent to total
geodesicity", R5c at 3715, R7.9 at 4469 ("M is second countable, as everywhere", 4486);
`RiemannianGeometry/Surfaces` 1.2 (296), 1.3 (340); `DifferentialGeometry` Layer 5 (1644), Layer
12 (2796), 12.5's `exists_halfSpaceOutwardUnitNormal` (README 2950: norm one, orthogonal, decreasing
constrained coordinate, "these three laws determine N at each point"; `Suggested.lean` 1020);
`GeometricTopology` 1.1 (788), 1.3 (851); `ComplexKahlerGeometry` 5.1 (K5a) (1440), the half-space
Seeley step at 1796; `SmoothBundlesConnections` B6.0 (1306); `Completed/HopfRinow` Layer 1 (264),
Layer 2 (427); consumers `PositiveMass` 5.1 (921), 5.2 (957; "averaged mean curvature
`tr A/(n−1)` for the inward normal", 951–961, the same convention as 1.5) and
`AffineMorseLefschetz` 4.5 (819).

**Pinned declarations.** All 76 backticked library names were sought at the pins by script; 74
resolve directly, and the two others were opened by hand: `Bundle.RiemannianBundle`
(`Mathlib/Topology/VectorBundle/Riemannian.lean`, class) and `exists_halfSpaceOutwardUnitNormal`
(a DifferentialGeometry target, cited as such). Opened this round:
`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102` (`IsGeodesicCurveOn`: `UniqueDiffOn`,
`ContMDiffOn … 2`, acceleration within `s` zero; stated for an arbitrary model `I`, so boundary
points and closed intervals are covered, as 4.1 and 5.2 use; it includes no unit-speed or
nonconstancy clause, which is why 4.1 and 5.2 treat `v = 0`), `:134` (`IsGeodesicCurveOnFrom`);
`…/Geodesic/Flow.lean:117` (`contMDiffOn_maximalGeodesic`);
`…/VectorBundle/Riemannian/Sphere.lean:161` (`isManifold_sphereBundle`, dimension
`finrank ℝ (E × F) − 1`, which is `2(n+1) − 1 = 2n + 1`, as 5.1 says);
`…/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean:91` (`UpperHalfSpace E`, `{(x, t) : 0 < t}` in
`E × ℝ`), `…/UpperHalfSpace/Metric.lean:41`, `…/UpperHalfSpace/Curvature.lean:139`
(sectional curvature `−1`); `…/Riemannian/Sphere/Basic.lean:61` (`sphereRoundMetric`). The README
attributes no backticked Lean name to this roadmap.

**Seeded source sample** (cached texts read this round; "book" = paternain-salo-uhlmann2023,
"article" = stefanov-uhlmann-vasy2021, "UV" = uhlmann-vasy2016). No author-flagged unverified
locator exists.

| Target | Locator read | Result |
|---|---|---|
| 1.1 | book lines 2684–2696 | inward and outward strata by the sign of `⟨v, ν⟩`, `ν` inward (2688), `∂₀SM = S(∂M)` (2696); as cited |
| 1.4 | book lines 2728–2737, 2781–2784; article line 53 | `Π_x(v, w) = −⟨∇_v ν, w⟩`, independent of the extension; `−Π = Hess ρ` on glancing vectors; positivity of the form; as cited |
| 1.5 | lee-riemannian2018 Ch. 8 | not readable (uncertified); the averaged convention checked against RiemannianGeometry line 191 and PositiveMass 951 |
| 2.1 | book lines 2738–2739, 2449–2461; article lines 89–90, 93 | Definition 3.1.7; Definition 2.5.1 with the side named at 2457; "at some p", "everywhere"; as cited |
| 2.2 | book lines 2781–2784, 2838–2841; UV lines 499–503 | Lemma 3.1.12 and the equivalence at 2840–2841; covector form `H_G ρ = 0 ⇒ H_G² ρ < 0`; as cited |
| 3.1 | article lines 96–97; UV lines 25–26; book 2770–2772 | `M` "not necessarily compact" in a boundaryless `M̃`; `ρ > 0` inside, `< 0` outside; `M = {ρ ≥ 0}`; as cited |
| 3.4 | book lines 2755–2762 | the source extends the metric only for subsets of `ℝⁿ` (periodic extension on a cube) and leaves the general case to the double; the README's statement and route (Seeley, cutoff gluing) are its own, and the locator is cited for the fact, not the route |
| 3.5 | book lines 2749–2762; article lines 96–97 | Lemma 3.1.8 (compact `M`, closed connected extension); the non-compact case is the README's own; as cited |
| 4.2 | book lines 2801–2828, 2781–2784, 2841–2844, 2795–2798; UV 499–503 | the three derivatives of Lemma 3.1.13 (source: normalised `ρ`; README carries `ǀdρǀ`); Taylor expansion at 2842; leaving and no interior tangency; as cited |
| 5.1 | book lines 2646–2648, 2682–2696, 2931, 3063–3079; article 151, 153 | `SM`, `∂±SM`, `μ`, flow and generator; the article's opposite labels and `L : ∂₋SM → ∂₊SM`; as cited |
| 5.2 | book lines 2659–2661, 2674–2676, 2666, 2849–2861 | Definitions 3.1.1, 3.1.3; Exercise 3.1.2(b); Example 3.2.1's `2 sin θ`; as cited |
| 5.3 | book lines 2970–2982, 2985–3026, 3039–3041, 3044–3045 | Lemma 3.2.10 and its proof (`g`, `F`, `r = sF^{1/2}`, `a = h(g(y), y)`, `Q` increasing in `r`); Exercise 3.2.12 without parameters, used with them at 3039–3041, as the README says |
| 5.4 | book lines 2865–2886, 2868/2891, 2896–2925, 2935–2949, 2955–2966, 3027–3043, 3046–3055, 3110–3113 | Lemmas 3.2.3, 3.2.6, 3.2.8, 3.2.9 (hypotheses: compact, strictly convex near `x₀`, no non-trapping, as the README notes), 3.2.11, Remark 3.2.13 (`Q = (τ̃ + t)/2`, `a = τ̃² + 4T`), Exercise 3.3.3; continuity left as Exercise 3.2.4; as cited |
| 6.3 | book lines 2499–2521, 2677–2680 | small and large caps, the equator trapped; hyperbolic subdomains non-trapping; `u`, `cot R`, `coth R` are the README's own |
| 6.4 | book lines 2677–2678 | small spherical caps non-trapping; the general statement rests on lee-riemannian2018 Ch. 6 (uncertified) and the README's route |

Also read at their locators: 3.2 (article 128–129, 198–200, 203–205; UV 137–140, 507–509), 4.5 (UV
30–32, 504–512), 5.5 (book 3081–3106), 5.6 (book 3114–3127; article 150–163), 6.5 (article 66–72;
book 2462–2481), Conventions (book 2642).

**Adversarial table** (values computed this round: the sampled targets, the headlines, the repaired
passages and the target of R01).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy | half-space `n = 1`; `[0, 1]` at `0` | `dx⁰(−e₀) = −1` outward, `dx⁰(e₁) = 0` tangent, `dx⁰(e₀) = 1` inward; `T_q∂M = 0`, curve `t ↦ t` on `[0, ε)` has derivative `+1`, inward | holds | none |
| 1.4 three descriptions | ball radius `R`; exterior; half-space; `n = 0` | `−(−2g)/(2R) = h/R`; `−(2g)/2 = −h`; `0`; `⟨∇_u x, w⟩ = ⟨u, w⟩` for `N = x`; `⟨∇_u W, −x⟩ = ⟨W, ∇_u x⟩ = ⟨w, u⟩`; zero form | all agree; `ν_in` in the first description gives `−h` | none |
| 1.5 Weingarten, `H` | unit sphere; cylinder; exterior; against R5a | `S = id`, `H = 1`; eigenvalues `1, 0`, `H = 1/2`; `−1`; `S_{ν_in}X = −(∇_X ν_in)^⊤ = (∇_X ν_out)^⊤ = S X` | holds; averaged trace matches R5a and PositiveMass | none |
| 1.6 conformal law | derivation; `φ = log 2`; disc `φ = −ǀxǀ²` | `∇̂_X N = ∇_X N + dφ(X)N + dφ(N)X − ⟨X, N⟩grad φ`, so `II^ĝ = e^φ(II + dφ(ν_out)h)`; `2h`; `e^{−1}(1 − 2)h`, `Ĥ = e(1 − 2) = −e` | sign as stated | none |
| 2.1 predicates | `{y ≥ x³}`; `n = 0` | `Hess ρ(t, t) = −6x/(1 + 9x⁴)`, `ǀdρǀ = (1 + 9x⁴)^{1/2}`, `II = 6x/(1 + 9x⁴)^{3/2}`; both strict conditions vacuous | holds; exclusion needs `n ≥ 1`, as stated | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ`; exterior | `−2h`; `−2(2 + x₁)h`, factor in `[1, 3]`; `+2h` | both directions hold | none |
| 3.1 regular domains | `(2 + x₁)(1 − ǀxǀ²)` at `x₁ = −3`; `x₀² − x₁²` | `(−1)(1 − 9) = 8`; zero set = sphere ∪ `{x₁ = −2}`, disjoint since `ǀxǀ ≥ 2` there, `dρ′ = (1 − ǀxǀ²)dx₁ ≠ 0`; `dρ = 0` at the origin | holds | none |
| 3.3 `ρ̃ = φ₀χ(t) + φ₁s` | `t > 0`; `t < 0`; off `supp φ₁`; `[0, 1]` | both terms `≥ 0`, one `> 0`; both `≤ 0`; `ρ̃ = χ(t) = t` for `ǀtǀ ≤ 1/2`, `dρ̃(∂_t) = 1`; `t = 2x`, `M̃ = (−1/2, 3/2)`, slope `2` | regular value `0`, `M = {ρ̃ ≥ 0}` | none |
| 3.4 extension | `√x` on `[0, 1]`; `(x + 1/100)dx²`; glued metric `ψ g_ext + (1 − ψ) g_N` | derivative `1/(2√x)` unbounded at `0`; positive iff `x > −1/100`; where `ψ > 0` the point is in the positivity neighbourhood, so a convex combination of positive forms with one positive weight | holds | none |
| 3.5 realisation (headline) | disc with radial collar; `[0, 1]`, `(1 + x)²dx²`; closed `M`; compact `M` with a closed component and `∂M ≠ ∅`; doubled point | `ρ̃ = 2(1 − ǀxǀ)` on `3/4 < ǀxǀ < 5/4`; length `3/2`; `ρ̃ ≡ 1`; double is compact, `{ρ_D ≥ 0}` = first copy; non-Hausdorff, no realisation | holds | none |
| 3.6 (repaired) | unit sphere; cylinder; exterior; `n = 0`; uncountable union of planes | `⟨−⟨X,Y⟩x, −x⟩ = ⟨X, Y⟩`; `K = ⟨R(X,Y)Y,X⟩ = 0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨B, +x⟩ = −h`; `T∂M = 0`, `B = 0`, `H` not used; excluded by the new hypothesis | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `[0, 1]` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴` with `II = 0`; a geodesic tangent at an interior time has `γ′ = 0`, constant | iff holds; leaving does not give strict convexity | none |
| 4.3 `ρ̂ = ψr + (1 − ψ)s` | `W₁`; `(W ∖ W₁) ∩ M`; `W ∖ (M ∪ W₁)` with `r < −δ`; off `W` | `ψ = 1`, `ρ̂ = r`; convex combination of `r ≥ ε₁ > 0` and `1`, positive; `ψr + (1 − ψ)(−1) < −δ`; `±1` | `{ρ̂ ≥ −δ} ∖ M ⊆ {r ≥ −δ}` | none |
| 4.5 convexity function (headline) | disc at `q = (0, −1)`; exterior; `[0, 1]` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = (0, −2) = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; `{x + εx² ≤ c}` | holds | none |
| 5.1 strata | disc; `[a, b]`; glancing vector | torus, two circles, annulus; four points, `μ = ±1`; `dμ(ν_in) = 1` in the fibre, so `0` is regular for `n ≥ 1`; `dim SN = 2n + 1` | holds | none |
| 5.2 exit time | annulus at `(−3/2, −1)`; shifted start; reversal; `v = 0` | `13/4 ≤ 4`, exit at `x = √3`: `3/2 + √3`; `3/2 − √(2δ − δ²) → 3/2`; `τ(y, −w) = t + τ(x, −v)`, on `[a, b]`: `(x + t − a) = (x − a) + t`; constant curve, `∞` | discontinuous without convexity; identities hold | none |
| 5.3 fold form, even functions | `y − t²`; `y − t⁴`; general; `cos r` | `Q = r`, `a = y`, roots `±√y`; roots `±y^{1/4}`, `∂_t² h = 0`, excluded; `a = h(g(y), y) = max_t h ≥ h(0, y) ≥ 0`; `H(s) = Σ(−s)^k/(2k)!` | holds | none |
| 5.4 regularity (headline) | ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; fold form; glancing limit; `[a, b]` | `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c) = τ`; `a = 4(b² + c)`, `Q(±√a) = −b ± √(b² + c)`; `sin θ/(2 sin θ) = 1/2 = II/2`; `σ = a + b − 2x`, `Xσ = −2` | holds | none |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; `n = 0` with a circle component | `Xf = 1`, bound `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); (F, F, F) | equivalence holds on each | none |
| 5.6 scattering (headline) | ball; disc; `[a, b]` | `⟨x − 2bv, v⟩ = −b`, `α² = id`, fixed points `b = 0`; `ℓ = 2 sin θ = 2√(1 − ǀwǀ²)`; `α(a, +1) = (b, +1)`, `α(b, +1) = φ_{−(b−a)}(b, +1) = (a, +1)` | holds | none |
| 6.1/6.2 (quantifier added) | `c = 0`, `R = 1`; ellipse vertex; graph; exterior, `v ⊥ q − c` | `II = h`; `(2/b²)/(2/a) = a/b²`; `ρ = x₀ − w`, `Hess ρ = −D²w`, `ǀdρǀ = 1`, `II = D²w(0)`; `ǀRe + tvǀ² − R² = t²ǀvǀ²` | holds for every `c` | none |
| 6.3 caps (repaired), hyperbolic balls, R01 | `ǀpǀ = 1`, `R = π/4`, `π/2`; `p = 2e`, `R = π/3`; `(0, 2)`; `(0, 1)`; arc `R = 3π/4` | `cot = 1`, `0`; radius `arccos(1/4)`, `(1/4)/(√15/4) = 1/√15 ≈ 0.258 ≠ 0.577`; `u = 5/4`, `ǀduǀ = 2·3/8 = 3/4`, `(5/4)² − 1 = 9/16`; `u = 1`, `du = 0`; `Hess u_xx = 1/y − (1/y)u_y = 1/(2y) + (x² + 1)/(2y³) = u/y²`; `τ(θ, ±1) = 3π/4 ∓ θ` from 5.2 | holds for unit `p`; 5.2 is used and not listed | R01 |
| 6.4 small balls | torus `R = 1/4`; `S¹`; `S²` | `ǀdxǀ = 1/2`, `II = 2h/(1/2) = 4h = h/R`, `τ ≤ (1/4 + 1/4)/1 = 1/2`; `θ²` smooth on `B(p, π)`; caps convex iff `R < π/2`, so `r_p ≤ π/2` | holds | none |
| 6.5 conformal ball | general `φ`; `φ = s² − 2s` | `e^{φ}(1/r + 2rφ′) = b′/r`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, zero at `1/√2`, `b′(1) = e^{−1}`; `r/c(r) = b(r)` for `c = e^{−φ(r²)}` | holds; agrees with the article's condition (1.1) | none |

Sections 1.2, 1.3, 2.3, 4.1, 4.4 and 4.6 were also read in full and their Checks recomputed
(`g(e₀ − ae₁, e₁) = a − a = 0`; `u = 2 + x₁ ∈ [1, 3]`; `(1 + 2x²)^{−3/2}`; `e^{−s}(1 − 2s)h`;
`ǀq + tvǀ² = 1 + t²ǀvǀ²`; `h_r = (1 − r/R)²h₀`, `−½∂_r h_r = h₀/R`; `a = sin(φ₀ − r)/sin φ₀`,
`−a_r(0) = cot φ₀`; strips `(−0.9, 0.9) × ℝ` and `(0.99, 1.01) × ℝ` disjoint, `d_M((0.8, 0), ∂M) =
0.2`; `(1 − r²)e^{−r²}` has radial derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, `0` at `√2`,
minimum `−e^{−2}`).

**Duplication and ownership.** Roadmap search this round (open heads, then main; README text):
"scattering relation", "non-trapping", "boundary defining function", "convex boundary",
"mean-convex": no match outside this roadmap. "Boundary normal coordinates / Fermi coordinates":
`RiemannianGeometry/Surfaces` 1.2–1.3 (dimension two, named in the Scope) and `ComplexCurveModuli`
152 (hyperbolic geodesic cuts, a different object). "Second fundamental form of the boundary":
`RiemannianGeometry/MinimalSurfaces` 1959 names R5a's form. "Signed distance":
`RiemannianGeometry` 4688 (a Check of R7.9, cited) and `GeometricCurrents` 870 (barrier planes).
"Strictly convex": `MathematicalBilliards` on main owns planar strictly convex tables through
Mathlib's `StrictConvex` and the billiard map, with no exit time, second fundamental form or
geodesic scattering relation; `RealSemisimpleLieGroups` 1171 uses the convexity of the squared
distance on symmetric spaces; neither states an object of this roadmap. "Exit time" matches only
the stochastic sense. `PositiveMass` 951–961 uses the averaged boundary mean curvature for the
inward normal through R5a and defines none. Ownership against the open pull requests was checked
through the roadmap tools at their heads; the board's package index was read (two packages,
AnalyticNumberTheory and LawrenceVenkateshMethod, neither on this subject). The overlap report
lists no dropped id, no revision-only id, no other pull request changing this roadmap and no second
copy.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; immersion second fundamental form and Gauss equation: owner RiemannianGeometry R5a, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics and the README does not say it follows a source.
The order is forced by the dependency lines: Layer 2 needs 1.4–1.6; Layer 3 needs 1.1–1.4; Layer 4
needs 3.1 and 3.5; Layer 5 needs 4.1–4.2 and 4.6; Layer 6 needs all. Every definition (1.3, 1.4,
1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.4's `τ̃`, 5.6) has API bullets and at least three Checks; every
theorem has its hypotheses in the sentence and a locator.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit and
the import check have nothing to inspect. Elaboration: not available (this lane does not elaborate).
No Lean command was run.

**Copyright and arrangement.** Twenty passages were set beside the sources at the locators listed
above (1.1, 1.3, 1.4, 2.1, 2.2, 3.1, 3.2, 3.4, 3.5, 4.2, 4.5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 6.3,
6.4, 6.5). None reproduces a sentence or follows a source clause by clause. The longest shared run
is in 5.4, "extends to a smooth positive function on `∂SM` whose value at" (11 words, book line
2936), inside a one-line theorem statement that the mathematics fixes; next is the name "strictly
concave from the superlevel sets" (article line 129). The routes of 5.3 name the steps of the
source's proof (implicit function theorem, Taylor factor, inverse function theorem) in the README's
own words and add the conclusion `∂_r Q(0, y₀) > 0`. Contents of the book against the layers: §3.1
is spread over 1.1, 1.4, 2.1, 3.5, 4.1–4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4; §3.3 ↔ 5.5–5.6; §2.5 ↔ 1.6,
6.2, 6.5. The order inside Layer 5 is forced (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need
5.4). Layers 1–4 and 6 map onto no run of sections. No table, figure or exercise list is reused.

Source independence: 20 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 38 of 66 named source mentions in the layers; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, the form `dr² + h_r` of 4.4 and the general statement of 6.4
  have no certified locator besides them; their signs and normalisations are fixed by the computed
  values above and, for 1.5 and 3.6, by RiemannianGeometry R5a's text.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting; the book was read in the
  authors' copy the manifest records.
- No elaboration: there is no Lean file and this lane does not elaborate.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says `T` is the product of `τ(x, v)` with `τ` at "x − v"; it should be `τ(x, −v)`, the exit time of the reversed vector; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e885950212db8d38f61270797a5a7c1ce2fd7805", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~16", "model": "fable", "worker": "chris-x88"} -->
