<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6901565600 -->
Review (claude) of e9d4325

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 6.4 (and 6.3's hyperbolic balls) apply 3.2 where its hypothesis `dx ≠ 0 on U` fails

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, 6.4, line 1557:
   "apply 3.2 on `U = B(p, r_p)` with `x = d(p, ·)²` and `c = R²`"; 3.2, line 701: "for an open
   `U ⊆ N` and `x ∈ C^∞(U)` with `dx ≠ 0` on `U`"; `design/plan.json`, target 3.2, hypothesis
   "dx ≠ 0 on U".

   **Claim.** 3.2, as stated, applies to `x = d(p, ·)²` on the whole ball `B(p, r_p)`.

   **Witness.** `N = ℝ²`, `p = 0`, `x = |z|²`, `U = B(0, 1/2)`: `dx_0 = 0` and `0 ∈ U`, so 3.2's
   hypothesis fails. On `U ∖ {0}` it holds, but `{x ≤ R²}` is then the punctured disc, not compact.
   Same for 6.3's `u`, `du = 0` at `(0, 1)`.

   **Exact repair.** The first bullet of 3.2 needs `dx ≠ 0` only on the level `{x = c}`, and the
   pointwise notion only `dx_y ≠ 0`. In the README and in plan target 3.2:

   1. Opening of 3.2: "Define, for an open `U ⊆ N`, `x ∈ C^∞(U)` and `y ∈ U` with `dx_y ≠ 0`: the
      level set of `x` through `y` is strictly concave from the superlevel sets at `y` if
      `Hess x(v, v) > 0` for every nonzero `v ∈ ker dx_y`; the level sets of `x` are strictly concave
      from the superlevel sets on `U` if `dx ≠ 0` on `U` and this holds at every `y ∈ U`."
   2. First bullet: "For `c` a regular value of `x` (`dx ≠ 0` on `{x = c}`; `dx` may vanish elsewhere
      in `U`), so that `{x ≤ c}` is a regular domain of the open submanifold `U` with defining function
      `c − x`: …" (rest unchanged).
   3. First Check of 3.2: state it for `x = |z|²` on all of `ℝⁿ⁺¹` ("`dx = 2z` vanishes only at `0`;
      every `c > 0` is a regular value and `{x ≤ c}` is the closed ball, `II = h/√c`; `c = 0` is a
      critical value and `{x ≤ 0} = {0}` is no regular domain"); on `ℝⁿ⁺¹ ∖ {0}`, where the present
      text places it, `{x ≤ c}` is the punctured ball. Plan hypothesis: "U ⊆ N open, x ∈ C^∞(U);
      dx_y ≠ 0 at the point; dx ≠ 0 on U for the notion on U; c a regular value for the II formula".

   **Repair test.** Witness above with `R = 1/4`: `dx = 2z ≠ 0` on `|z| = 1/4`, so `1/16` is a regular
   value; `{x ≤ 1/16}` is the closed disc, compact; `II = Hess x/|dx| = 2h/(2·1/4) = 4h = h/R`, the
   value of 6.4's torus Check. Hyperbolic `u`: `cosh R > 1 = u(0, 1)` is a regular value,
   `II = u g/|du| = cosh R/sinh R = coth R`, as 6.3 states. 4.5 (`dx̃ ≠ 0` on `U`) and 4.6
   (`x = −ρ̂ = −r_{∂M}` on `W₁`, `|dr| = 1`) satisfy the "on `U`" clause unchanged. No statement of 6.3
   or 6.4 changes.

2. **F02** (P3) 6.2's `*Needs:*` line omits 3.1

   **Location.** `design/README.md`, 6.2, line 1499: "*Needs:* 1.4, 1.5, 2.1, 4.2, 5.2."; the Layer 6
   Dependencies sentence ("6.2 uses 1.4–1.5, 2.1, 4.2 and 5.2"); `design/plan.json`, target 6.2,
   prerequisites.

   **Claim.** The statement and route of 6.2 need only 1.4, 1.5, 2.1, 4.2, 5.2.

   **Witness.** The exterior `{|x − c| ≥ R}` is a regular domain (3.1) and `II = −h/R` is computed from
   the ambient `Hess ρ = 2g`, `|dρ| = 2R`, i.e. 3.1's `II_{D_ρ} = −Hess^N ρ/|dρ|`; 6.1, 6.3, 6.4, 6.5
   list 3.1 for the same step.

   **Exact repair.** Add 3.1: README "*Needs:* 1.4, 1.5, 2.1, 3.1, 4.2, 5.2."; Dependencies "6.2 uses
   1.4–1.5, 2.1, 3.1, 4.2 and 5.2"; plan target 6.2 prerequisite `target:3.1`. Tested: 3.1 precedes
   6.2 and is already in its closure through 4.2 → 4.1 → 3.1, so no order changes.

Two findings, both P3, each with a repair to apply; no P1 and no P2. The round-13
finding is repaired. No false, vacuous or unowned statement was found, no gap is declared and none
is needed. This review changed no design file, plan or manifest entry.

## Previous findings and repairs

| Round-13 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3): 4.4 called `h_r` a metric on all of `∂M` | README 4.4, lines 1067–1073: "`h_r(u, u') := g(dE_{(q, r)}(u, 0), dE_{(q, r)}(u', 0))`, defined for `ǀrǀ < ε(q)`, is an inner product on `T_q∂M` … for each `r` it is a Riemannian metric on the open set `{q ∈ ∂M : ε(q) > ǀrǀ}`, which is all of `∂M` when `ε` is constant"; the strip Check gains `r = 0.5`; plan target 4.4 and its `unequal_strips` test carry the same wording | **Repaired.** The two files agree clause by clause (read both). |

Adversarial pass on the changed passage: rows "4.4" below. The repaired pattern (an object indexed
by a parameter and claimed on a domain larger than where it exists) was sought in the rest of the
design: Summary and Scope name `dr² + h_r` without a domain claim; 4.6 uses constant radii; 2.3's
`(g_s)` is a family on `M`; 4.3's `r_Σ` is claimed on `W` only and `ρ̂` is built with a cutoff
vanishing near the frontier of `W`. That search for "a hypothesis stated on a set larger than the
use satisfies" is what produced R01. Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,665 lines of the README were read this round; the plan by script (6 layers, 49
targets: 30 theorems, 10 definitions, 2 constructions, 7 examples; every `target:` prerequisite
resolves and precedes its user; every definition and construction has at least three tests; no
`gap:` prerequisite and `gaps: []`; baseline Mathlib pin `1b1ccf4` equals `lake-manifest.json`);
the six manifest entries. Each of the six layers ends with Examples and Dependencies. No LaTeX
delimiter, pull-request number, machine path, HTML anchor or `set_option` in the README.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2248 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. The citation resolver's
list for this README is empty (no cross-roadmap citation and no Lean name found nowhere).

**Supplier citations resolved** on main this round. The supplier folders and `lake-manifest.json`
have no diff against the head at which round 13 resolved them (checked with `git diff --stat`), and
the headings were found again at the same lines: DifferentialGeometry 5.1 (1648), 12.1 (2801), 12.2
(2848), 12.3 (2871), 12.5 (2936; `exists_halfSpaceOutwardUnitNormal` at README 2950 and
`Suggested.lean` 1020); `Completed/HopfRinow` ("The build, in layers", 224); RiemannianGeometry 2.2
(R1.4) (1576), R5a (3205), R5c (3715), R7.9 (4469); RiemannianGeometry/Surfaces 1.2 (296), 1.3 (340);
GeometricTopology Layer 1 (783), 1.1 (788), 1.3 (851); ComplexKahlerGeometry 5.1 (K5a) (1440) with
the half-space Seeley step at 1796; SmoothBundlesConnections B6.0 (1306); consumers PositiveMass 5.1
(921), 5.2 (957), AffineMorseLefschetz 4.5 (819), and the folders PositiveScalarCurvature and Yamabe.
Read in full this round: R5a's conventions (RiemannianGeometry lines 188–193: `B`, `S_η`, the
averaged `H`, "outward-normal unit sphere has `B = −g` times its position vector") and its pinned
Gauss equation (`⟨R^M(X,Y)Z,W⟩ = ⟨R^N(X,Y)Z,W⟩ + ⟨B(X,W),B(Y,Z)⟩ − ⟨B(X,Z),B(Y,W)⟩`), which is 3.6's
with `B = II ν_in`; R7.9's standing paragraph (second countable, `Σ` closed embedded, normal collar
for compact connected two-sided `Σ` in connected `M`, at most two components). The overlap report
lists no dropped id, no revision-only id, no other pull request changing this roadmap and no second
copy.

**Pinned declarations.** 76 library names backticked in the README were sought at the pins by
script (declaration keyword plus last name component, over `Mathlib/Geometry`, `Mathlib/Analysis`
and `TauCeti`); 72 matched, and the four the pattern missed were opened by hand:
`TauCeti/Analysis/Calculus/Hadamard.lean:115` (`ContDiff.sub_eq_hadamardFactor_apply`), `:131`
(`ContDiff.contDiff_hadamardFactor`); `TauCeti/Geometry/Manifold/Boundary/Charts.lean:107`
(`ModelWithCorners.mem_boundary_euclideanHalfSpace_iff_of_mem_atlas`);
`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Immersion.lean:65`
(`IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv`). None is missing. The pins are those of
round 13, whose per-file line list stands. `exists_halfSpaceOutwardUnitNormal` is
DifferentialGeometry's and is attributed to it; the README attributes no backticked Lean name to
this roadmap.

**Seeded source sample** (cached texts read this round; "book" is paternain-salo-uhlmann2023,
"article" is stefanov-uhlmann-vasy2021, "UV" is uhlmann-vasy2016). No author-flagged unverified
locator exists.

| Target | Locator read | Result |
|---|---|---|
| 1.2 | book lines 2684–2696 | `∂±SM` by the sign of `⟨v, ν⟩` with `ν` the inward unit normal (2687–2688); as cited. Lee Ch. 8: not readable |
| 1.4 | book lines 2728–2737, 2781–2784; article line 53 | `Π_x(v, w) = −⟨∇_v ν, w⟩`, independence of the extension; `−Π = Hess ρ` on glancing vectors; "positive second fundamental form"; as cited |
| 1.6 | book lines 2462–2473 | Lemma 2.5.2 with (2.5.1): the sign of `r̈(0)` is that of `b′(r̄)`; the rotationally symmetric case only, as the README says. Lee Ch. 7–8: not readable |
| 2.1 | book lines 2738–2739, 2449–2461; article lines 89–90, 93 | Definition 3.1.7; Definition 2.5.1 (`r̈(0) > 0` convex, viewed from `{r = r₁}`, line 2457); strict convexity at `p` and everywhere; as cited |
| 2.2 | book lines 2781–2784, 2838–2841; UV lines 499–503 | the identity for the normalised `ρ` and the iff at 2840–2841; the covector condition; the README's statement for every defining function is its own (1.4, first bullet) |
| 2.3 | book lines 3093–3095; UV lines 49–51 | "open conditions"; stability under small perturbations of `g`; the uniform bound and the families are the README's own |
| 3.1 | article lines 96–97; UV lines 25–26; book lines 2770–2772 | `M`, not necessarily compact, in a boundaryless `M̃`; `ρ > 0` in `X`, `< 0` outside, non-degenerate; `M = {ρ ≥ 0}`; as cited |
| 3.3 | book lines 2749–2762 | Lemma 3.1.8 (compact `M`, closed connected extension), proved for subsets of `ℝⁿ`, the double left as Exercise 3.1.9; the README's statement is wider and its route its own |
| 3.4 | book lines 2755–2762 | the special case extends `g` as a periodic positive definite matrix function; supports "extend the metric", nothing more; the Seeley route is the README's |
| 3.6 | lee-riemannian2018 Ch. 8 | not readable (uncertified); checked against RiemannianGeometry R5a instead (above) and by the values below |
| 4.2 | book lines 2801–2828, 2781–2798, 2840–2844; UV lines 499–503 | Lemma 3.1.13's three derivatives; Taylor expansion at 2842; leaving and no interior tangency at 2795–2798; as cited |
| 4.5 | UV lines 30–32, 504–524; article lines 128–134 | `x̃(p) = 0`, `dx̃(p) = −dρ(p)`; `U₀`, `C₀`, `δ` (504–506); `x̃ = −ρ − ε ǀz − pǀ²` (512); compactness (513–514, 522–524); as cited |
| 5.6 | book lines 3114–3127; article lines 150–163 | Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6; `L : ∂₋SM → ∂₊SM`, `ℓ`, the identification with `B∂M` (160–162), labels opposite (151–152); as cited |
| 6.1 | book lines 307–310, 2677–2680 | strictly convex Euclidean domains are simple; compact subdomains of `ℝⁿ` non-trapping; the graph formula `II = D²w(0)` is the README's own |
| 6.2 | book lines 2449–2473 | Definition 2.5.1 and Lemma 2.5.2; the side convention at 2457; as cited |

**Adversarial table** (values computed this round: the sampled targets, the headlines, the repaired
passage and the targets the findings touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.2 chart formula, sign test | `g = [[1, a], [a, 1]]`, `a = 1/2`; unit ball; `[0, 1]` | `g(e₀ − a e₁, e₁) = a − a = 0`, norm² `1 − a² = 3/4`, `ν_in = (2/√3, −1/√3)`, `g(e₀, e₁) = 1/2 ≠ 0`; `⟨v, ν_in⟩ = −⟨v, x⟩`; `ν_out(0) = −∂_x`, `ν_out(1) = +∂_x` | holds; chart direction excluded | none |
| 1.4 three descriptions, independence of `ρ` | unit ball, `ρ` and `uρ`; exterior; `n = 0` | `Hess(uρ) = u Hess ρ` on `T∂M` (terms with `ρ`, `dρ` vanish), `ǀd(uρ)ǀ = uǀdρǀ`: ratio unchanged; `−(−2g)/2 = h`; `⟨∇_u x, w⟩ = ⟨u, w⟩`; `⟨∇_u W, ν_in⟩ = −⟨W, ∇_u ν_in⟩ = ⟨w, u⟩`; `−(2g)/2 = −h`; zero form | all agree | none |
| 1.6 conformal law | general; disc `φ = −ǀxǀ²`; `φ = log 2` | `Hess_ĝ ρ = Hess ρ + ǀdρǀ dφ(ν_in) g` on `T∂M`, `ǀdρǀ_ĝ = e^{−φ}ǀdρǀ`, quotient `e^{φ}(II − dφ(ν_in)h)`; `dφ(−x) = 2`, `e^{−1}(1 − 2)h`; with `ĥ = e^{−2}h` this is `−e ĥ`, and `Ĥ = e(1 − 2) = −e`: consistent; `2h` | holds; wrong sign gives `3e^{−1}h` | none |
| 2.1 predicates | `{y ≥ x³}`; cylinder; `n = 0` | `Hess ρ(t, t) = −6x/(1 + 9x⁴)`, `ǀdρǀ = (1 + 9x⁴)^{1/2}`, `II = 6x/(1 + 9x⁴)^{3/2}`; curvatures `1, 0`, `H = 1/2`; both strict conditions vacuous | holds; exclusion needs `n ≥ 1`, as stated | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ`; exterior; `−ρ` | `−2h`, `−2(2 + x₁)h` with factor in `[1, 3]`; `+2h`; `−ρ < 0` inside | both directions hold | none |
| 2.3 openness, bound, families | hyperbola epigraph; ball; `n = 0`; `g_s = e^{−2sǀxǀ²}g` | `y″ = (1 + x²)^{−3/2}`, `1 + y′² = (1 + 2x²)/(1 + x²)`, curvature `(1 + 2x²)^{−3/2} → 0`; `1 ≥ c`; `0 = c·0`; `e^{−s}(1 − 2s)h`, zero at `s = 1/2` | holds; compactness needed | none |
| 3.1 regular domains | ball with `ρ`, `(2 + x₁)ρ` | at `x₁ = −3`: `(−1)(1 − 9) = 8 > 0`; `{ρ′ ≥ 0}` = ball ∪ `{x₁ ≤ −2}`; `dρ′ = (1 − ǀxǀ²)dx₁ ≠ 0` on `{x₁ = −2}`; outward iff `2⟨x, v⟩ > 0` | holds | none |
| 3.2 (R01) | `x = ǀzǀ²` on `B(0, 1/2) ⊆ ℝ²`, `c = 1/16`; hyperbolic `u`, `c = cosh R` | `dx_0 = 0` with `0 ∈ U`: stated hypothesis fails; `dx = 2z ≠ 0` on the level, `II = 2h/(1/2) = 4h`; `du = 0` at `(0, 1)`, `II = cosh R/sinh R` | formula holds under "`c` regular"; hypothesis too strong for 6.3, 6.4 | R01 |
| 3.3 `ρ̃ = φ₀ χ(t) + φ₁ s` | `t > 0`; `t < 0`; near `∂M`; `[0, 1]` | two terms `≥ 0`, not both `0`; both `≤ 0`, not both `0`; `supp φ₁ ∩ ∂M = ∅`, so `ρ̃ = χ(t) = t`, `dρ̃(∂_t) = 1`; `t = 2x`, `M̃ = (−1/2, 3/2)`, slope `2` | regular value `0`, `M = {ρ̃ ≥ 0}` | none |
| 3.4 extension | `√x` on `[0, 1]`; `(x + 1/100)dx²`; cutoff gluing; `∂M = ∅` | derivative `1/(2√x)` unbounded at `0`: not smooth up to the boundary; coefficient `< 0` for `x < −1/100`; `ψ g̃ + (1 − ψ)g₀` with `ψ > 0` only where `g̃ > 0`: convex combination of positive forms, `g₀` elsewhere, `= g̃ = g_M` on `M`; `M` clopen, any extension | holds; symmetrising the extended tensor keeps the restriction | none |
| 3.5 realisation (headline) | disc; `[0, 1]`, `(1 + x)² dx²`; closed `M`; compact `M` with a closed component | `ℝ²` or `S²`, `II = h` in both; length `∫₀¹(1 + x)dx = 3/2`; `ρ̃ ≡ 1`; the double has that component twice with `ρ_D = ±1`, compact | holds | none |
| 3.6 immersion comparison | unit sphere; cylinder; exterior; R5a's Gauss sign | `⟨−⟨X,Y⟩x, −x⟩ = ⟨X, Y⟩ = II`; `S_{ν_in}X = −(∇_X ν_in)^⊤ = (∇_X ν_out)^⊤ = SX`; `K = 0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `ν_in = +x`: `⟨B, ν_in⟩ = −h`; R5a's `+⟨B(X,W),B(Y,Z)⟩ − ⟨B(X,Z),B(Y,W)⟩` with `X = W`, `Y = Z` orthonormal gives `II(X,X)II(Y,Y) − II(X,Y)²` | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴`, `Hess ρ(e_x, e_x) = 0`; no nonzero tangent vector (both sides vacuous) | iff holds; leaving does not give strict convexity | none |
| 4.3 two components, `ρ̂` | compact connected `∂M ≠ ∅` in connected `N`; `{ρ̂ ≥ −δ} ∖ M`, `δ < 1` | `{ρ > 0}`, `{ρ < 0}` disjoint, open, nonempty (regular zero), union `N ∖ ∂M`, at most two components: exactly these; `ρ̂ ≤ max(r, −1)` on `W ∖ M`, so `r ≥ −δ` | holds | none |
| 4.4 `h_r` (repaired) | ball radius `R`; cap `φ₀`; strip `ε = 0.9 / 0.01`; general | `dE(u, 0) = (1 − r/R)u`, `h_r = (1 − r/R)²h₀`, `−½∂_r = h₀/R`; `a = sin(φ₀ − r)/sin φ₀`, `−a·a_r(0) = cot φ₀`; `{ε > 0.5} = {0} × ℝ`, `h_{0.5} = dy²` there, `h₀ = dy²` on both lines; `∂_r h_r(u, u) = 2⟨∇_u ∂_r, u⟩ = 2⟨∇_u ν_in, u⟩ = −2 II(u, u)` | holds on the stated domain | none |
| 4.5 convexity function (headline) | disc at `q = (0, −1)`; exterior; `[0, 1]`; general | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; `{x + εx² ≤ c}`; on `ker dx̃`: `ǀdρ(v)ǀ = εǀdǀzǀ²(v)ǀ < δ`, so `Hess x̃ ≥ C₀ − C″ε > 0` | holds | none |
| 4.6 enlargement | ball `ε₁ = 1/4`; `(1 − r²)e^{−r²}` | radius `1 + δ`, `II = h/(1 + δ)`; radial derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, `0` at `√2`, minimum `−e^{−2}` | holds | none |
| 5.2 exit time | annulus at `(−3/2, −1)`; nearby start | `9/4 + 1 ≤ 4`; exit at `x = √3`: `3/2 + √3`; `3/2 − √(2δ − δ²) → 3/2` | discontinuous without convexity | none |
| 5.4 regularity (headline) | ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; glancing limit; `[a, b]` | `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c) = τ`; `h ≈ ǀdρǀ(μt − ½ II t²)`, root `2μ/II`, so `μ/τ̃ → II/2`, disc `sin θ/(2 sin θ) = 1/2`; `σ = a + b − 2x`, `Xσ = −2` | holds | none |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅` | `Xf = 1`, bound `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T) | equivalence holds on each | none |
| 5.6 scattering (headline) | ball; disc; `[a, b]`; `n = 0` ball bundle | `⟨x − 2bv, v⟩ = −b`, `α² = id`, fixed points `b = 0`; `ℓ = 2μ = 2√(1 − ǀwǀ²)`, `ǀLǀ = ǀwǀ`; `α(a, +1) = (b, +1)`, `α(b, +1) = φ_{−(b−a)}(b, +1) = (a, +1)`; `B∂M = ∂M`, `P` bijective from the two inward vectors | holds | none |
| 6.1 ball and convex domains | general speed; ellipse vertex; `v = e₁/4` at `0` | roots of `t²ǀvǀ² + 2tb + ǀx − cǀ² − R² = 0`: `(−b + √(b² + ǀvǀ²(R² − ǀx − cǀ²)))/ǀvǀ²`; `(2/b²)/(2/a) = a/b²`; `(0 + 1/4)/(1/16) = 4 ≤ 2/(1/4) = 8` | holds | none |
| 6.2 half-space, exterior (R02) | exterior radius `R`; half-space; `n = 0`; book's naming | `Hess ρ = 2g`, `ǀdρǀ = 2R`, `II = −h/R`, `H = −1/R`; `ρ(q + tv) = ǀq − cǀ² − R² + t²ǀvǀ² = t²ǀvǀ²`; `Hess x⁰ = 0`; zero form, both strict predicates vacuous; `ǀq + tvǀ² = 1 + t²`, `r̈(0) = 1 > 0`: book's "strictly convex" circle is the ball's boundary | holds; the `II` values come from 3.1's ambient formula | R02 |
| 6.3 caps, hyperbolic balls | cap `R`; `u = cosh d` | `Hess ρ = −cos R·g`, `ǀdρǀ = sin R`, `cot R`; `1 + (ǀxǀ² + (y − 1)²)/(2y) = (ǀxǀ² + y² + 1)/(2y)`; `ǀduǀ = sinh R`, `II = cosh R/sinh R` | holds | R01 (route hypothesis only) |
| 6.4 small balls | normal coordinates; torus `R = 1/4` | `2δ_ij − 2z_kΓ^k_ij = 2g_ij + O(ǀzǀ²)`; `II = 4h`, `τ ≤ (1/4 + 1/4)/1 = 1/2` | statement holds; route cites 3.2 beyond its hypothesis | R01 |
| 6.5 conformal ball | general `φ`; `φ = s² − 2s`; Herglotz form | `e^{φ}(1/r + 2rφ′) = b′/r`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, zero at `1/√2`; `r/c = r e^{φ(r²)} = b` | holds | none |

Sections 1.1, 1.3, 1.5, 4.1, 5.1 and 5.3 were read in full and their Checks recomputed (`ρ = Σφᵢx⁰ᵢ + φ₀`
has `dρ = Σφᵢ dx⁰ᵢ` on `∂M`, positive on inward vectors; `x(1 − x)` has slope `±1` at the ends;
`ǀq + tvǀ² = 1 + t²ǀvǀ²`; `dμ(ν) = 1`; `h = y − t²` gives `Q = r`, `a = y`).

**Duplication and ownership.** Roadmap search this round (open heads, then main; README text) for
scattering relation, non-trapping, boundary defining function, strictly convex boundary, boundary
normal coordinates, mean-convex, lens data, exit time, and second fundamental form of the boundary:
no owner outside this roadmap ("exit time" matches only the stochastic sense in DysonBrownianMotion
and StochasticCalculus; RiemannianGeometry/MinimalSurfaces line 1959 names R5a's form on a boundary).
MathematicalBilliards, new in the closest list, was read (Scope; Layer 1.1–1.3): it owns `C^k` convex
tables as periodic curves in `ℂ`, their curvature criterion, exit parameters and the billiard map in
`(s, δ)`; its carrier and its exit parameter are not this roadmap's regular domains or `τ`, and
neither roadmap states the other's object. Ownership against the open pull requests was checked
through the roadmap tools at their heads; the board's package index was read (8 lines, none on this
subject).

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, MathematicalBilliards (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics and the README does not say it follows a source.
The order is forced by the dependency lines: Layer 2 needs 1.4–1.6; Layer 3 needs 1.1–1.5; Layer 4
needs 3.1 and 3.5; Layer 5 needs 4.1–4.2 and 4.6; Layer 6 needs all. Every definition (1.3, 1.4,
1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.4's `τ̃`, 5.6) has its API bullets and at least three Checks; every
theorem has its hypotheses in the sentence and a locator.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit and
the import check have nothing to inspect. Elaboration: not available (this lane does not elaborate).
No Lean command was run.

**Copyright and arrangement.** Fifteen passages were set beside the sources at the locators of the
table above (1.2, 1.4, 1.6, 2.1, 2.2, 2.3, 3.1, 3.3, 3.4, 4.2, 4.5, 5.5, 5.6, 6.1, 6.2). None
reproduces a sentence or follows a source clause by clause; the shared material is formulas and
standard names ("level sets … strictly concave from the superlevel sets", article line 199). Round
13's script comparison (longest shared run eleven words, a one-sentence lemma statement) covers text
that has not changed; the repaired 4.4 passage has no source counterpart. Contents of the book
against the layers: §3.1 is spread over 1.1, 1.4, 2.1, 3.5, 4.1–4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4; §3.3 ↔
5.5–5.6; §2.5 ↔ 1.6, 6.2, 6.5. The order inside Layer 5 is forced (5.2 needs 5.1; 5.4 needs 5.1–5.3;
5.5 and 5.6 need 5.4). Layers 1–4 and 6 map onto no run of sections. No table, figure or exercise
list is reused.

Source independence: 15 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 38 of 65 named source mentions in the layers; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, the form `dr² + h_r` of 4.4 and the general statement of 6.4
  have no certified locator besides them; their signs and normalisations are fixed by the computed
  values above and, for 3.6, by RiemannianGeometry R5a's text.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e9d432546cfacb13fd6d7a129a194da1c233fcf6", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~14", "model": "fable", "worker": "chris-x29"} -->
