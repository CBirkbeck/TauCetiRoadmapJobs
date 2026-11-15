<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6902231121 -->
Review (claude) of c2f7f7a

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 3.6 applies RiemannianGeometry R5a outside R5a's standing setting

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, 3.6, line 878: "For
   a regular domain `M = {ρ ≥ 0}` of `(N, g)` … Prove that RiemannianGeometry R5a's second fundamental
   form `B` of this embedding satisfies `B(u, w) = II(u, w) ν_in`"; the R5a supplier contract, line 274
   ("for an isometric immersion of boundaryless manifolds"); `design/plan.json`, target 3.6,
   hypothesis "(N, g) Hausdorff boundaryless smooth manifold …".

   **Claim.** R5a's `B`, `S_η` and mean curvature vector are available for the embedding `∂M → N` for
   every `N` of 3.1, which is Hausdorff only.

   **Witness.** `TauCetiRoadmap/RiemannianGeometry/README.md` line 156: "Work with finite-dimensional
   real, Hausdorff, second-countable, boundaryless smooth manifolds". `N` = an uncountable disjoint
   union of copies of `ℝ²`, `ρ = 1 − |x|²` on each: admitted by 3.1, outside R5a's setting. 3.1 treats
   the same mismatch for R7.9 explicitly; 3.6 does not.

   **Exact repair.** State the hypothesis, as the contracts for R7.9 and R5c already do:

   1. README 3.6, first sentence: "For a regular domain `M = {ρ ≥ 0}` of a second-countable `(N, g)`
      (RiemannianGeometry's standing setting, in which R5a is stated; in particular a realisation from
      3.5), …".
   2. README, supplier contract: "R5a (in RiemannianGeometry's standing setting, Hausdorff,
      second-countable, boundaryless: for an isometric immersion …".
   3. Plan target 3.6, hypotheses: add "N second countable (the standing setting of RiemannianGeometry
      R5a)".

   **Repair test.** The witness `N` is now excluded. `∂M ⊆ N` is then Hausdorff and second countable,
   so both manifolds of the embedding are in R5a's setting. The consumers are unaffected: 6.5 uses 3.6
   in `(ℝⁿ⁺¹, e^{2φ} g)`, second countable; PositiveMass 5.1–5.2 works with realisations from 3.5,
   which are second countable by 3.5's statement. The three Checks of 3.6 (sphere, cylinder, exterior,
   all in `ℝⁿ⁺¹`) are unchanged.

2. **F02** (P3) 6.3 does not introduce the centre `p` of the cap

   **Location.** `design/README.md`, 6.3, line 1511: "prove for the cap `C_R = {⟨x, p⟩ ≥ cos R}`,
   `0 < R < π`: `II = cot R · h`"; `design/plan.json`, target 6.3.1, hypotheses ("unit round sphere
   S^{n+1}", "0 < R < π").

   **Claim.** The statement holds for the `p` of the formula, which no clause quantifies.

   **Witness.** `p = 2e` with `e ∈ S^{n+1}`, `R = π/3`: `{⟨x, p⟩ ≥ 1/2} = {⟨x, e⟩ ≥ 1/4}` is the cap of
   radius `arccos(1/4) ≈ 1.318`, with `II = cot(1.318) h ≈ 0.258 h`, not `cot(π/3) h ≈ 0.577 h`; and
   `|dρ| = 2 sin(1.318) ≠ sin R`.

   **Exact repair.** README 6.3: "prove for `p ∈ S^{n+1}` and the cap `C_R = {⟨x, p⟩ ≥ cos R}` of
   geodesic radius `R` about `p`, `0 < R < π`: …". Plan 6.3.1, hypotheses: add "p ∈ S^{n+1} (a unit
   vector of ℝⁿ⁺²)".

   **Repair test.** With `|p| = 1`: `ρ = ⟨x, p⟩ − cos R`, `grad ρ = p − ⟨x, p⟩x`, `|dρ|² = 1 − cos² R`,
   `|dρ| = sin R`, `Hess ρ = −cos R · g` on the level, `II = cot R · h`; at `R = π/3`,
   `II = h/√3 ≈ 0.577 h`. The witness `p = 2e` is excluded.

Two findings, both P3, each with a repair to apply (R01, R02); no P1 and no P2. Both round-14
findings are repaired. No false, vacuous or unowned statement was found; no gap is declared and none
is needed. This review changed no design file, plan or manifest entry. Maintainer notes: none were
supplied.

## Previous findings and repairs

| Round-14 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3): 6.4 and 6.3 apply 3.2 where `dx ≠ 0` on `U` fails | README 3.2, lines 702–712: "for an open `U ⊆ N`, `x ∈ C^∞(U)` and `y ∈ U` with `dx_y ≠ 0` … on `U` if `dx ≠ 0` on `U` and this holds at every `y ∈ U`"; "For `c` a regular value of `x` (`dx ≠ 0` on `{x = c}`; `dx` may vanish elsewhere in `U`), `{x ≤ c}` is a regular domain of the open submanifold `U` with defining function `c − x` (3.1)"; Conventions "Level-set concavity" pointwise; 6.3 states `ǀduǀ² = u² − 1` and the regular value `cosh R`; 6.4 "apply 3.2's sublevel statement … the regular value `c = R²`" | **Repaired.** Plan target 3.2 (statement, hypothesis, two API entries, tests `norm_squared`, `dimension_one`), 6.3.2 and 6.4 carry the same wording (read). |
| F02 (P3): 6.2's `*Needs:*` omits 3.1 | README 6.2, line 1506: "*Needs:* 1.4, 1.5, 2.1, 3.1, 4.2, 5.2."; Layer 6 Dependencies "6.2 uses 1.4–1.5, 2.1, 3.1, 4.2 and 5.2"; plan 6.2 has `target:3.1`; 4.2 and plan 4.2.1, 6.3.2 gained 3.1 too | **Repaired.** |

The repaired patterns were sought in the rest of the design. "A hypothesis on a set larger than the
use satisfies": every use of 3.2 (4.5 asserts `dx̃ ≠ 0` on `U`; 4.6 uses the regular value `δ` of
`−ρ̂`; 6.3; 6.4) now meets the hypothesis it invokes. "A supplier's hypothesis not carried by the
user": every supplier with a standing second-countability hypothesis was checked against its users
(R7.9 in 3.1 and 4.3, DifferentialGeometry 12.5 in 1.2, the tube theorems in 4.3–4.6, K5a and 12.1
in 3.4, B6.0 in 6.4, R5c in 3.5: all stated or reduced to charts; HopfRinow Layers 1–2 have no such
hypothesis); R5a in 3.6 is the one place it is missing (R01). "A `*Needs:*` line that omits a used
target": every `*Needs:*` line was read against its statement and route; none found.

## Verified sound

**Coverage.** All 1,679 lines of the README were read; the plan by script (6 layers, 49 targets: 30
theorems, 10 definitions, 2 constructions, 7 examples; every `target:` prerequisite exists and
precedes its user; every definition and construction has at least three tests; every target has a
locator; no `gap:` prerequisite and `gaps: []`; baseline Mathlib `1b1ccf4`, Tau Ceti `2fd255d`); the
six manifest entries. Each layer ends with Examples and Dependencies (12 headings). No LaTeX
delimiter, pull-request number, machine path, HTML anchor, `set_option` or process word in the
README (pattern search).

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2255 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. The citation resolver's
list for this README is empty.

**Supplier citations resolved** on main (head `eb4a735`): DifferentialGeometry Layer 5 (1644), Layer
12 (2796), 12.5 with `exists_halfSpaceOutwardUnitNormal` (README 2950, `Suggested.lean` 1020: smooth
into `TM`, norm one, `TauCeti.IsOutwardPointing`, orthogonal to the image of `mfderiv Subtype.val`,
as the contract says); `Completed/HopfRinow` Layer 1 (264), Layer 2 (427), whose standing hypotheses
(68–99) have `[T2Space M]` and no second countability; RiemannianGeometry 2.2 (R1.4) (1576), R5a
(3205; conventions 188–193: `B`, `S_η`, averaged `H`, "outward-normal unit sphere has B=−g times its
position vector"; Gauss sign at 3251, `+⟨B(X,W),B(Y,Z)⟩−⟨B(X,Z),B(Y,W)⟩`), R5c (3715), R7.9 (4469;
"M is second countable, as everywhere in this roadmap", normal collar for compact connected
two-sided `Σ` in connected `M`, at most two components); Surfaces 1.2 (296), 1.3 (340);
GeometricTopology 1.1 (788), 1.3 (851); ComplexKahlerGeometry 5.1 (K5a) (1440) with the half-space
Seeley step at 1796; SmoothBundlesConnections B6.0 (1306: "Export positive uniform normal and
strong-convexity radius bounds on each compact set … with `IsNormalDomain` on every tangent ball of
that normal radius"); consumers PositiveMass 5.1 (921), 5.2 (957), AffineMorseLefschetz 4.5 (819).
The overlap report lists no dropped id, no revision-only id, no other pull request changing this
roadmap and no second copy.

**Pinned declarations.** All 76 backticked library names were sought at the pins; all exist.
Opened this round, among others: `TauCeti/Geometry/Manifold/Riemannian/Hessian/Conformal.lean:81`
(`hessian_rescale`: `Hess_ĝ u = Hess_g u − (2f)⁻¹(df⊗du + du⊗df − ⟪grad f, grad u⟫ g)`; with
`f = e^{2φ}` and `du = 0` on `T∂M` this is 1.6's `Hess_g ρ + ⟨grad φ, grad ρ⟩ g`);
`…/LeviCivita/Conformal.lean:260` (`leviCivitaConnection_rescale_apply`);
`TauCeti/Analysis/Calculus/Hadamard.lean:115, 131`; `…/Boundary/Charts.lean:107, 321, 374`;
`…/Boundary/Derivative.lean:64`; `…/Boundary/Orientation.lean:46, 63`;
`…/Boundary/TransitionNormal.lean:36`; `…/Boundary/OutwardExistence.lean:75`;
`…/Riemannian/Boundary.lean:115, 146`; `…/RegularValue/Scalar/Sublevel.lean:473, 639, 652, 675`;
`…/RegularValue/Level.lean:234, 435, 485`; `…/Riemannian/Laplacian.lean:158, 197`;
`…/Geodesic/Flow.lean:65, 117`; `…/Geodesic/Compact.lean:75`;
`…/Geodesic/Normal/Coordinates.lean:84, 270, 292`;
`…/TubularNeighborhood/Riemannian/Coordinates.lean:89` (carries `[SecondCountableTopology N]`, as
Layer 4's preamble says), `…/Noncompact.lean:58`; `…/VectorBundle/Riemannian/Sphere.lean:143, 161,
181`; `…/Hyperbolic/UpperHalfSpace/Curvature.lean:139`; `…/Riemannian/Pullback/Basic.lean:158`;
`…/LeviCivita/Immersion.lean:65`; `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:256`
(`IsLeviCivitaConnection.uniqueness`); `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:123, 593,
797`; `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:330`;
`Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41`. The README attributes no backticked Lean name
to this roadmap.

**Seeded source sample** (cached texts read this round; "book" = paternain-salo-uhlmann2023,
"article" = stefanov-uhlmann-vasy2021, "UV" = uhlmann-vasy2016). No author-flagged unverified
locator exists.

| Target | Locator read | Result |
|---|---|---|
| 1.1 | book lines 2684–2696 | inward/outward strata by the sign of `⟨v, ν⟩`, `∂₀SM = S(∂M)` (2696); as cited |
| 1.2 | book lines 2687–2689 | `ν` the inward unit normal; as cited. Lee Ch. 8: not readable |
| 1.3 | UV lines 25–26, 134–136; book 2766–2773 | `ρ > 0` in `X`, `= 0` at `∂X`, `dρ ≠ 0` at `∂X`; Lemma 3.1.10 is the normalised one; as cited |
| 1.4 | book lines 2728–2737, 2781–2784; article line 53 | `Π_x(v, w) = −⟨∇_v ν, w⟩`, independent of the extension; `−Π = Hess ρ` on glancing vectors; as cited |
| 2.1 | book lines 2738–2739, 2449–2461; article lines 89–90, 93 | Definition 3.1.7; Definition 2.5.1 with the side at 2457; "strictly convex at some p", "everywhere strictly convex"; as cited |
| 3.1 | article lines 96–97; UV lines 25–26; book 2770–2772 | `M` (not necessarily compact) in a boundaryless `M̃`; `M = {ρ ≥ 0}`; as cited |
| 3.2 | article lines 128–129, 198–200, 203–205; UV 137–140, 507–509 | zero level set "strictly concave from the superlevel sets"; "non-vanishing differential"; the distance example; UV says the same from the sublevel side; as cited |
| 3.3 | book lines 2749–2762 | Lemma 3.1.8 for compact `M`, proved for subsets of `ℝⁿ`, the double left as Exercise 3.1.9; the README's wider statement and route are its own |
| 3.6 | lee-riemannian2018 Ch. 8 | not readable (uncertified); checked against RiemannianGeometry R5a's text (above) and by the values below |
| 4.2 | book lines 2801–2828, 2781–2784, 2840–2844, 2795–2798; UV 499–503 | Lemma 3.1.13's three derivatives (for the normalised `ρ`; the README carries `ǀdρǀ`); Taylor expansion at 2842; leaving and no interior tangency; covector condition; as cited |
| 4.6 | book lines 3093–3096 | "slightly larger compact manifold `M₁`" with strictly convex boundary, from openness; the construction through `ρ̂` is the README's own |
| 5.2 | book lines 2659–2661, 2674–2676, 2666, 2849–2861 | Definitions 3.1.1, 3.1.3; Exercise 3.1.2(b); Example 3.2.1's `2 sin θ`; as cited |
| 5.3 | book lines 2970–2982, 2985–3026, 3039–3041, 3044–3045 | Lemma 3.2.10 and its proof (`g`, `F`, `r = sF^{1/2}`, `a = h(g(y), y)`, `Q = g + S` increasing in `r`); Exercise 3.2.12 is stated without parameters and used with them at 3039–3041, as the README says |
| 6.1 | book lines 2849–2864, 307–310, 2677–2680 | Example 3.2.1; strictly convex Euclidean domains simple; compact subdomains of `ℝⁿ` non-trapping; the graph formula is the README's own |
| 6.3 | book lines 2499–2521, 2677–2680 | small and large caps, equator trapped; hyperbolic subdomains non-trapping; `u` and `coth R` are the README's own |

**Adversarial table** (values computed this round: the sampled targets, the headlines, the repaired
passages and the targets the findings touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy | half-space `n = 1`; `n = 0` at `0 ∈ [0, 1]` | `dx⁰(−e₀) = −1` outward, `dx⁰(e₁) = 0` tangent, `dx⁰(e₀) = 1` inward; `T_q∂M = 0`, a hyperplane of `ℝ`, the curve `t ↦ t` on `[0, ε)` has derivative `+1`, inward | holds | none |
| 1.2 chart formula, sign test | `g = [[1, a], [a, 1]]`, `a = 1/2` | `g⁻¹e⁰ = (1, −a)/(1 − a²)`, `ǀgrad x⁰ǀ² = 1/(1 − a²)`, quotient `(1, −1/2)/√(3/4) = (2/√3, −1/√3)`; `g(e₀ − ae₁, e₁) = 0`; `dx⁰ = 2/√3 > 0` | holds; chart direction `e₀` excluded (`g(e₀, e₁) = 1/2`) | none |
| 1.3 defining functions | ball `ρ`, `(2 + x₁)ρ`, `ρ²`, `−ρ`; `x(1 − x)` | `u = 2 + x₁ ∈ [1, 3]`, `ǀdρ′ǀ/ǀdρǀ = u`; `d(ρ²) = 0` on the sphere; `−ρ < 0` inside; slopes `+1`, `−1` | holds | none |
| 1.4 three descriptions | ball radius `R`; exterior; half-space; `n = 0` | `−(−2g)/(2R) = h/R`; `−(2g)/2 = −h`; `0`; `⟨∇_u x, w⟩ = ⟨u, w⟩` for `N = x`; `⟨∇_u W, −x⟩ = ⟨W, ∇_u x⟩ = ⟨w, u⟩`; zero form | all agree; inward normal in the first description gives `−h` | none |
| 1.6 route against `hessian_rescale` | `f = e^{2φ}`; disc `φ = −ǀxǀ²` | `(2f)⁻¹·2f⟨grad φ, grad ρ⟩ = ǀdρǀ dφ(ν_in)`; `e^{−1}(1 − 2)h = −e^{−1}h`, `Ĥ = e(1 − 2) = −e` | agrees with the pinned formula | none |
| 2.1 predicates | `{y ≥ x³}`; `n = 0` | `Hess ρ(t, t) = −6x/(1 + 9x⁴)`, `ǀdρǀ = (1 + 9x⁴)^{1/2}`, `II = 6x/(1 + 9x⁴)^{3/2}`; both strict conditions vacuous | holds; exclusion needs `n ≥ 1`, as stated | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ`; exterior | `−2h`; `−2(2 + x₁)h`, factor in `[1, 3]`; `+2h` | both directions hold | none |
| 3.1 regular domains | ball with `(2 + x₁)ρ` at `x₁ = −3`; `x₀² − x₁²` | `(−1)(1 − 9) = 8 > 0`; `{ρ′ ≥ 0}` = ball ∪ `{x₁ ≤ −2}`, `dρ′ = (1 − ǀxǀ²)dx₁ ≠ 0` there; `dρ = 0` at the origin of the zero set | holds | none |
| 3.2 (repaired) | `ǀzǀ²` on `ℝ²`, `c = 1/16`, `c = 0`, `c = −1`; `a x + b` with `a = 2`; superlevel `c = 1` | `ǀdxǀ = 1/2`, `II = 2h/(1/2) = 4h`; `{0}`, `dx_0 = 0`, critical; empty fibre, `∅`; kernel unchanged, Hessian doubled; `−2h/2 = −h` | holds | none |
| 3.3 `ρ̃ = φ₀χ(t) + φ₁s` | `t > 0`; `t < 0`; near `∂M`; `[0, 1]`; half-space | both terms `≥ 0`, sum `> 0` since `χ > 0` and `φ₀ + φ₁ = 1`; both `≤ 0`, sum `< 0`; `φ₁ = 0`, `ρ̃ = χ(t) = t`, `dρ̃(∂_t) = 1`; `t = 2x`, `M̃ = (−1/2, 3/2)`, slope `2`; `ρ̃ = x⁰` on `{x⁰ > −1}` | regular value `0`, `M = {ρ̃ ≥ 0}` | none |
| 3.5 realisation (headline) | disc with radial collar; `[0, 1]`, `(1 + x)²dx²`; closed `M`; doubled point | `ρ̃ = 2(1 − ǀxǀ)` on `3/4 < ǀxǀ < 5/4`; length `3/2`; `ρ̃ ≡ 1`; non-Hausdorff, no realisation | holds | none |
| 3.6 immersion comparison (R01) | unit sphere; cylinder; exterior; uncountable union of planes | `⟨−⟨X,Y⟩x, −x⟩ = ⟨X, Y⟩`; `S_{ν_in}X = −(∇_X ν_in)^⊤ = (∇_X ν_out)^⊤`; `K = 0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0`; `⟨B, +x⟩ = −h`; `N` not second countable | identities hold; hypothesis of R5a not stated | R01 |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴` with `II = 0`; no nonzero tangent vector | iff holds; leaving does not give strict convexity | none |
| 4.5 convexity function (headline) | disc at `q = (0, −1)`; exterior; `[0, 1]` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = (0, −2) = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; `{x + εx² ≤ c}` | holds | none |
| 4.6 enlargement | ball `ε₁ = 1/4`, `δ = 1/8`; `(1 − r²)e^{−r²}`; arc of `S¹` | radius `9/8`, `II = 8h/9`; on `W ∖ W₁` outside `M`, `s = −1`, so `ρ̂ ≥ −δ > −1` forces `r ≥ −δ`; derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, `0` at `√2`, minimum `−e^{−2}`; tube forces `ε ≤ min(R, π − R)` | holds | none |
| 5.2 exit time | annulus at `(−3/2, −1)`; shifted start; reversal | `9/4 + 1 ≤ 4`, exit at `x = √3`: `3/2 + √3`; `3/2 − √(2δ − δ²) → 3/2`; `τ(y, −w) = τ(x, −v) + t`, on `[a, b]`: `(x + t − a) = (x − a) + t` | discontinuous without convexity; identities hold | none |
| 5.3 fold form, even functions | `y − t²`; `y − t⁴`; general; `cos r` | `Q = r`, `a = y`, roots `±√y`; `Q(√a) − Q(−√a) = 2y^{1/4}` forces `a ≈ √y/c²`, not smooth; `a = h(g(y), y) = max_t h ≥ h(0, y)`; `H(s) = Σ(−s)^k/(2k)!` | holds | none |
| 5.4 regularity (headline) | ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; glancing limit; `[a, b]` | `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c) = τ`; root `2μ/II` of `μt − ½ II t²`, so `μ/τ̃ → II/2`, disc `sin θ/(2 sin θ) = 1/2`; `σ = a + b − 2x`, `Xσ = −2` | holds | none |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅` | `Xf = 1`, bound `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T) | equivalence holds on each | none |
| 5.6 scattering (headline) | ball; disc; `[a, b]` | `⟨x − 2bv, v⟩ = −b`, `α² = id`, fixed points `b = 0`; `ℓ = 2√(1 − ǀwǀ²)`; `α(a, +1) = (b, +1)`, `α(b, +1) = φ_{−(b−a)}(b, +1) = (a, +1)` | holds | none |
| 6.1 ball, convex domains | `x = (0, −1)`; `v = e₁/4` at `0`; ellipse vertex; graph | `sin θ + ǀsin θǀ`; `(0 + 1/4)/(1/16) = 4 ≤ 2/(1/4) = 8`; `(2/b²)/(2/a) = a/b²`; `ρ = x₀ − w`, `Hess ρ = −D²w`, `ǀdρǀ = 1`, `II = D²w(0)` | holds | none |
| 6.3 caps (R02), hyperbolic balls (repaired) | `ǀpǀ = 1`, `R = π/4`; `p = 2e`, `R = π/3`; `a = ǀxǀ²`, `b = y²`; `(0, 2)`; `(0, 1)` | `cos/sin = 1`; radius `arccos(1/4)`, `cot ≈ 0.258 ≠ 0.577`; `4ab + (b − a − 1)² = (a + b + 1)² − 4b`; `u = 5/4`, `ǀduǀ = 2·3/8 = 3/4`, `(5/4)² − 1 = 9/16`; `u = 1`, `du = 0`; `Hess u_xx = 1/y − (1/y)u_y = 1/(2y) + (x² + 1)/(2y³) = u/y²` | holds for unit `p`; `p` not quantified | R02 |
| 6.4 small balls (repaired route) | torus `R = 1/4`; `S¹`; `S²` | `ǀdxǀ = 1/2`, `II = 4h = h/R`, `τ ≤ (1/4 + 1/4)/1 = 1/2`; `θ²` smooth on `B(p, π)`; `Hess θ²(v, v) = 2R cot R`, `ǀdxǀ = 2R`, `II = cot R · h`, so `r_p ≤ π/2` | holds; `dx_p = 0` is allowed by the repaired 3.2 | none |
| 6.5 conformal ball | general `φ`; `φ = s² − 2s` | `e^{φ}(1/r + 2rφ′) = b′/r`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, zero at `1/√2`, `b′(1) = e^{−1}` | holds | none |

Sections 1.5, 2.3, 3.4, 4.1, 4.3, 4.4 and 5.1 were read in full and their Checks recomputed
(`(1 + 2x²)^{−3/2}` for the hyperbola epigraph; `e^{−s}(1 − 2s)h` for the conformal family; `√x` not
smooth up to `0`; `ǀq + tvǀ² = 1 + t²ǀvǀ²`; `ǀxǀ² − ǀxǀ³` not `C³` at `0`; `h_r = (1 − r/R)²h₀`,
`−½∂_r h_r = h₀/R`; `d_M((0.8, 0), ∂M) = 0.2`; `dμ` nonzero in the fibre direction `ν_in` at a
glancing vector, so `0` is a regular value of `μ` for `n ≥ 1`).

**Duplication and ownership.** Roadmap search this round (open heads, then main; README text) for
scattering relation, non-trapping, boundary defining function, strictly convex boundary, lens data,
mean-convex: no match outside this roadmap. "Boundary normal coordinates / Fermi coordinates":
Surfaces 1.2–1.3 (dimension two, named in the Scope) and ComplexCurveModuli 152 (hyperbolic
geodesic cuts, a different object). "Second fundamental form of the boundary":
RiemannianGeometry/MinimalSurfaces 1959 names R5a's form. "Collar extension": AffineMorseLefschetz
4.5 (named in the Scope) and uses in other subjects. "Exit time" matches only the stochastic sense.
SmoothBundlesConnections B6.0 also proves strict convexity of the squared radial distance along
short geodesics and builds strongly convex neighbourhoods; 6.4 states a different object (`II` of
the geodesic sphere, non-trapping) and cites B6.0 for the uniform radii, so nothing is restated.
ManifoldOptimization (open) owns geodesically convex functions and cites SmoothBundlesConnections for
convex neighbourhoods; LorentzianGeometry (open) owns signature-general connection, geodesic and
immersion interfaces and states no boundary convexity; RealSemisimpleLieGroups and
TeichmullerGeometry state none of this roadmap's objects. Ownership against the open pull requests
was checked through the roadmap tools at their heads; the board's package index was read (two
packages, neither on this subject).

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii and convex neighbourhoods: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics and the README does not say it follows a source.
The order is forced by the dependency lines: Layer 2 needs 1.4–1.6; Layer 3 needs 1.1–1.4; Layer 4
needs 3.1 and 3.5; Layer 5 needs 4.1–4.2 and 4.6; Layer 6 needs all. Every definition (1.3, 1.4,
1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.4's `τ̃`, 5.6) has API bullets and at least three Checks; every
theorem has its hypotheses in the sentence and a locator, with the two exceptions R01 and R02.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit and
the import check have nothing to inspect. Elaboration: not available (this lane does not elaborate).
No Lean command was run.

**Copyright and arrangement.** Seventeen passages were set beside the sources at the locators of the
sample table (1.1, 1.2, 1.3, 1.4, 2.1, 3.1, 3.2, 3.3, 4.2, 4.5, 4.6, 5.2, 5.3, 5.4, 6.1, 6.2, 6.3).
None reproduces a sentence or follows a source clause by clause; what is shared is formulas, lemma
hypotheses that can be written one way, and standard names (the longest shared run is the name
"strictly concave from the superlevel sets", article line 129). The proof routes of 5.3 name the
steps of the source's proof (implicit function theorem, Taylor factor, inverse function theorem) in
the README's own words. Contents of the book against the layers: §3.1 is spread over 1.1, 1.4, 2.1,
3.5, 4.1–4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4; §3.3 ↔ 5.5–5.6; §2.5 ↔ 1.6, 6.2, 6.5. The order inside
Layer 5 is forced (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need 5.4). Layers 1–4 and 6 map
onto no run of sections. No table, figure or exercise list is reused.

Source independence: 17 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 38 of 66 named source mentions in the layers; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, the form `dr² + h_r` of 4.4 and the general statement of 6.4
  have no certified locator besides them; their signs and normalisations are fixed by the computed
  values above and, for 3.6, by RiemannianGeometry R5a's text.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting; the book was read in the
  authors' copy the manifest records.
- No elaboration: there is no Lean file and this lane does not elaborate.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says `T` is the product of `τ(x, v)` with `τ` at "x − v"; it should be `τ(x, −v)`, the exit time of the reversed vector; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c2f7f7a9d13f353435b26d98a9e995c6a97e4af6", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~15", "model": "fable", "worker": "chris-x26"} -->
