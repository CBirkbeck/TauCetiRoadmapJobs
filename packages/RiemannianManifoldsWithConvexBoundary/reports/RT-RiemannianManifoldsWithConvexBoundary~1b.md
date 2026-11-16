<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18017#issuecomment-6909119179 -->
Red team round 1 pass b (claude) of d3b0e52

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) `geodesicEndpoint` is declared without the Hausdorff property, but its docstring asserts independence of the chosen geodesic

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean:248-251`: "geodesics
   of `M` with the same initial data agree on a common interval (README §4.1), so the choice of `γ`
   does not matter". Same claim in `README.md:1531` ("which does not depend on the choice of `γ`
   (4.1)") and `README.md:1542-1543`.

   **Claim.** The value `h.choose T` does not depend on the witness. The `def` (lines 252-258) has no
   `[T2Space M]` binder; README 4.1 proves uniqueness only for a regular domain of a Hausdorff `N`.

   **Witness.** The README's own manifold of `README.md:938-941`: `[0, ∞)` with the point `1` doubled,
   metric `dx²`, `z = (0, +1)`. The curves `t ↦ t` through `1` and through `1'` are both
   `IsGeodesicCurveOnFrom … (Icc 0 2) 0 1`; at `T = 1` their endpoints lie over different points.

   **Repair.** The theorems are unaffected (each carries `[T2Space M]`); only the wording is wrong.

   1. `Suggested.lean`, docstring of `geodesicEndpoint`, replace the text after "as for every `T ≤ 0`"
      by: "For Hausdorff `M`, geodesics of `M` with the same initial data agree on a common interval
      (README §4.1), so the choice of `γ` does not matter; without the Hausdorff property the value
      can depend on the choice, and every theorem about this map assumes `[T2Space M]`
      (README §5.6)."
   2. `README.md:1531`: "which does not depend on the choice of `γ` (4.1)" → "which, `M` being
      Hausdorff, does not depend on the choice of `γ` (4.1)".
   3. `README.md` 5.6, add the negative-control Check: "The endpoint map without the Hausdorff
      property: on the half-line `[0, ∞)` with the point `1` doubled (3.5, last Check) and `dx²`, the
      curves `t ↦ t` through either copy of `1` are geodesics on `[0, 2]` issuing from `(0, +1)`, and
      their endpoints at `T = 1` lie over the two different copies; the independence of `γ` uses the
      Hausdorff property, which is a hypothesis of every theorem about `geodesicEndpoint` and
      `scatteringRelation`."

   Tested on the witness: with the repaired wording the doubled half-line is excluded from the
   uniqueness claim and recorded as the control.

2. **F02** (P3) the collar extension applies GeometricTopology 1.3 to `∂M × [0, 1)`, which is not on 1.3's carrier

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/README.md:355-356` ("The collar
   extension is the case `N = ∂M × [0, 1)` with its product collar and `f(q) = (q, 0)`") and
   `README.md:808-810` (3.3).

   **Claim.** GeometricTopology 1.3 takes `N = ∂M × [0, 1)` as one of its two manifolds with boundary.

   **Witness.** `TauCetiRoadmap/GeometricTopology/README.md:785-786`: Layer 1 manifolds with boundary
   have "the half-space model `𝓡∂ n`"; `:791-792`: `∂M × [0, 1)` carries "the product structure with
   the half-space model in the second factor" (model `ℝⁿ × [0, ∞)`, constrained coordinate last;
   Mathlib's `𝓡∂ (n+1)` constrains coordinate `0`).

   **Repair.** In the GeometricTopology supplier contract, after "`f(q) = (q, 0)`", add: "Here
   `∂M × [0, 1)` is taken over `𝓡∂ (n+1)`: its charts are the product charts of GeometricTopology 1.1
   followed by the linear reordering `(y, t) ↦ (t, y)`, which carries the product model
   `ℝⁿ × [0, ∞)` onto `EuclideanHalfSpace (n+1)`; the identity is a diffeomorphism between the two
   structures, the boundary is `∂M × {0}` in both, and the product collar is a collar for both, so
   1.3 applies." In 3.3, after "with its product collar and `f(q) = (q, 0)`", add "(over `𝓡∂ (n+1)`
   by the reordering of the supplier contracts)".

   Tested on the instance: for `M = [0, 1]` (`n = 0`) the product `∂M × [0, 1)` is two half-open
   intervals, the reordering is the identity of `[0, ∞)`, and 3.3's first Check (`M̃ = (−1/2, 3/2)`)
   is unchanged; for the half-space Check (`n ≥ 1`) the chart `(y, t) ↦ (t, y)` of
   `ℝⁿ × [0, 1)` is the standard chart of `{0 ≤ x⁰ < 1}`.

Two P3 findings (R01, R02). No P1 or P2 finding survived verification. The whole README (1861
lines) and the whole `Suggested.lean` (377 lines) were read; no Lean was run (read-only pass), the
elaborated types were read from the worker's `signatures.md`.

## Verified sound

**Counts.** Declarations read: 22 of 22 (11 definitions, 11 theorems). Bold README targets and
sections read: all of 1.1–6.5 (32 sections). Line locators verified against the cached texts: every
line locator of the README into `paternain-salo-uhlmann2023`, `stefanov-uhlmann-vasy2021` and
`uhlmann-vasy2016` (61 README lines carrying them), all correct. Checks: all 122 Check bullets read, and those that
carry a computed value recomputed (the values tied to a Lean declaration are in the table below);
none found false, vacuous or a restatement. Sibling
citations checked on main: DifferentialGeometry 5.1, 12.1–12.3, 12.5
(`exists_halfSpaceOutwardUnitNormal`, three laws and smoothness as cited); RiemannianGeometry R5a
conventions, R5c items 1 and 3, R7.9 (sublevel inclusion, outward criterion `dφ(dι v) > 0`, normal
collar, defining function with `grad φ = ν`), 2.2 (R1.4); Surfaces 1.2–1.3; GeometricTopology 1.1,
1.3 and the Layer 1 standing convention; ComplexKahlerGeometry K5a (half-space Seeley extension);
SmoothBundlesConnections B6.0; AffineMorseLefschetz 4.5; PositiveMass 5.1 (averaged `tr A/(n−1)`,
inward normal, `H = 1` ball, `H = −1` exterior). HopfRinow is under `Completed/`.

**Dependency check** (output of the brief's command): `depcheck: 249 roadmaps, 2378 edges, 0
problem(s)`. No UPWARD, CYCLE or `moved:` line. Every named supplier is on main; the roadmap is at
line 14 of the merge order, after SmoothBundlesConnections (line 13).

**Declared gaps.** None declared; none found that should have been (every cited section exists on
main with the content the contract states).

**Ownership.** `roadmaps grep` over main and the open heads for scattering relation, non-trapping,
boundary defining function, (strictly) convex boundary, boundary normal coordinates, simple
manifold: no second owner. "Exit time" hits are stopping times (DysonBrownianMotion,
StochasticCalculus) and a flow exit time (SymplecticGeometry/IntegrableSystems), different
objects. Pinned Tau Ceti and Mathlib grepped by object (exit time, defining function, glancing,
boundary tangent space as a range of `mfderiv Subtype.val`, along-geodesic Hessian identity):
nothing the roadmap restates. `TauCeti.secondFundamentalForm` (map into an inner product space) is
a different fully qualified name and a different object, cited in 6.1. No `Suggested.lean` on main
or at an open head declares a name in this namespace.

**Pinned definitions read and what they imply.**

- `TauCeti.Manifold.IsGeodesicCurveOn` (`Geodesic/Basic.lean`): fields `UniqueDiffOn ℝ s`,
  `ContMDiffOn … 2 γ s`, vanishing `accelerationWithin`; any model with corners. So no geodesic
  exists on `Icc 0 0`, and `IsGeodesicCurveOnFrom` adds `0 ∈ s`, so none on `Icc 0 T`, `T < 0`: the
  README's reading of `geodesicEndpoint z T = z` for `T ≤ 0` and of `exitTime` (`ofReal T = 0` for
  `T ≤ 0`) is correct. Junk curves are excluded by the `C²` field.
- `TauCeti.Manifold.geodesicSpray` (`Geodesic/Spray.lean`): `(v, −Γ_x(v, v))`, no boundaryless
  hypothesis; type `TangentSpace I.tangent z`, as used in the `mfderiv … F z (geodesicSpray …)`
  statements.
- `TauCeti.Manifold.hessian I f x v w = ⟨∇_v grad f, w⟩` with Mathlib's Levi-Civita connection
  (`IsManifold I 2 M`, `C¹` metric, no boundaryless hypothesis): defined at boundary points.
- `TauCeti.IsOutwardPointing x v` contains `x ∈ boundary`; negative derivative of coordinate `0`.
- `TauCeti.IsRegularValue`: surjective `mfderiv` on the fibre; vacuous on an empty fibre (the
  `ρ ≡ ±1` cases).
- Mathlib `ImmersionAtProp`: normal form `(u, 0)` on `(domChart.extend I).target`, charts in the
  maximal atlas; holds for a half-space source of equal dimension with `F` the zero space.
- `hessian_rescale` (`Hessian/WithMetric.lean:76`): for `f = e^{2φ}` the correction is
  `−(dφ(v)du(w) + dφ(w)du(v) − ⟨∇φ, ∇u⟩⟨v, w⟩)`; on `ker du` this is `+⟨∇φ, ∇ρ⟩ g`, the formula
  of 1.6.
- `Sphere.lean:135` has `[I.Boundaryless]` before `sphereBundleChartedSpace`: the module
  docstring's reason for stating Layer 5 on `TM` holds.
- Mathlib `exists_contMDiff_zero_iff_one_iff_of_isClosed`: Hausdorff, σ-compact, finite
  dimension, no boundaryless hypothesis (used on `M` in 1.3 and on `N` in 4.3).

**Elaborated signatures.** All 22 compared with the README. The one flagged binder,
`[IsManifold (𝓡∂ (n + 1)) ∞ M]` missing from `IsBoundaryDefiningFunctionOn`, is harmless: the
structure's fields use only `boundary`, `interior`, `ContMDiffOn` and `mfderiv`, none of which
needs it, and the theorem that consumes it carries the instance. Nothing was changed (read-only).

**Headlines and padding.** Headline theorems of the README summary: Hessian characterisation
(2.2), realisation (3.5), tangent geodesics leave and no interior tangency (4.2), convexity
function (4.5), regularity of `τ` with `σ`, `T`, `Xσ = −2` (5.4), Proposition 3.3.1 (5.5),
involution, fixed points and smoothness of `α` (5.6). Each is stated; none is absent. The `TM`
encodings are equivalent to the source statements, not weakenings: a smooth function on the closed
embedded `SM` is a restriction from `TM` and back; smoothness of a degree `−1` homogeneous function
on `SM ∖ ∂₀SM` is smoothness on the nonzero non-glancing cone; local extension of `α` plus
`α ∘ α = id` is the diffeomorphism statement (an extension with values in `TM` exists: compose `α`
with a smooth retraction of a neighbourhood onto `∂SM`). One-tactic probe, by reading: no theorem
follows from unfolding or one library lemma (2.2 needs Hadamard division and the Hessian product
rule; the others need ODE theory). Every definition is used by a stated theorem. No padding.

**Policy.** The pull request changes only the package folder (`git diff --stat`: README,
Suggested.lean, metadata, sources.toml, three reports). No `lemma`, `set_option`, `#eval`,
`#check`, `True` placeholder or sorry'd data; `module`, `import Mathlib`, six `TauCeti.*` modules,
each present at the pin. No pull-request number or process narrative in the README or docstrings.
Every definition has at least three Checks (1.1: 3, 1.2: 3, 1.3: 3, 1.4: 4, 1.5: 4, 2.1: 3,
3.1: 5, 3.2: 4, 5.1: 4, 5.2: 3, 5.6: 6).

**Note (not a finding).** `exists_convexityFunction` carries `[T2Space N]`; the statement also
holds without it (`K_c` is a closed subset of the image of a closed coordinate ball, compact
without separation). The README states Layer 4 for Hausdorff `N`, so the two agree.

**The adversarial pass.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `secondFundamentalForm`, 1.4 | ball radius `R`; exterior; half-space; `n = 0` | `Hess ρ = −2g`, `\|dρ\| = 2R`, `II = h/R`; `Hess = 2g`, `II = −h`; `0`; zero space | sign and normalisation consistent in 1.4, 3.2, 4.4, 6.1 |
| Conventions, three forms of `II` | unit sphere, `Y` tangent | `⟨∇_X Y, ν_in⟩ = \|X\|²`, `⟨∇_X ν_out, Y⟩ = ⟨X, Y⟩` | equal |
| 1.2 slanted metric | `g = [[1,a],[a,1]]`, `a = 1/2` | `g(e₀ − ae₁, e₁) = 0`, norm² `1 − a²`, `ν_in = (2/√3, −1/√3)` | holds |
| 1.6 conformal law | `φ = log 2`; `φ = −\|x\|²`; `φ(\|x\|²)` | `2h`; `dφ(ν_in) = 2`, `−e⁻¹h`, `Ĥ = −e`; `e^{φ}(1/r + 2rφ′) = b′(r)/r` | agrees with 6.5 and with `hessian_rescale` |
| `IsStrictlyConvexAt`, 2.1 | `{y ≥ x³}`; `n = 0` | `II = 6x/(1 + 9x⁴)^{3/2}`; vacuous, both strict | holds; wrong model (inward normal) excluded by ball Check |
| `isStrictlyConvexAt_iff_hessian_neg` | `ρ′ = (2 + x₁)ρ`; `−ρ`; `n = 0`; `ρ = uρ₀` general | `Hess ρ′ = −2(2 + x₁)h`; `−ρ` fails `pos`; both sides vacuous; `Hess ρ = u(q) Hess x⁰` on `T_q∂M`, `u(q) > 0` | iff true in both directions |
| 2.3 uniform bound | hyperbola epigraph; ball; `g_s` | curvature `(1 + 2x²)^{−3/2}` → 0; `c = 1`; `e^{−s}(1 − 2s)` | compactness needed; threshold `s = 1/2` |
| 3.1 regular domains | `(2 + x₁)(1 − \|x\|²)` at `x₁ = −3`; `(1 − \|x\|²)³`; outward criterion | `8 > 0`, extra half-space; critical; `dφ(v) = 2⟨x, v⟩` | holds |
| `IsStrictlyConcaveLevelSetAt`, 3.2 | `\|z\|²`; affine; `n = 0`; `\|z − z₀\|` | `II = h/√c`; `Hess = 0` fails; vacuous; `(g − dx⊗dx)/\|z − z₀\|` | holds |
| 3.3 `ρ̃` | `[0,1]` with collar `t/2`; `∂M = ∅`; `x³(1 − x)³` | `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x` near `0`; `ρ̃ ≡ 1`; derivative `0` at ends | holds |
| `exists_isSmoothEmbedding_regularDomain` | `M = ∅`; closed `M`; compact connected with boundary; disconnected compact with a closed component; doubled half-line | `N` empty or `ρ ≡ −1`; `N = M`, `ρ ≡ 1`; double connected; first copy `= {ρ_D ≥ 0}`; `T2Space` excludes it | true as typed |
| 3.6 Gauss equation | unit sphere; cylinder | `0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0` | sign agrees with R5a |
| `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` | ball `v ⊥ q`; exterior; `{y ≥ x⁴}`; `n = 0`; `v = 0` | `ρ = −t²`; `+t²` stays; `−t⁴` leaves with `II = 0`; no nonzero `v`; excluded by `hv` | true; converse correctly not claimed |
| `mem_interior_of_isGeodesicCurveOn` | constant curve on `∂M`; `n = 0`; half-space tangent line | excluded by `hnc`; tangent velocity is `0`, contradiction with nonzero speed; excluded by strict convexity | true, no Hausdorff needed |
| 4.3 `ρ̂` | ball, `ε₂ = 3/4`, `ε₁ = 1/2`; `ε > 1` | `W₂ = {1/4 < \|x\| < 7/4}`, `ψ = 0` near `0`; `r < −1` gives `ρ̂ ≤ −1 < −δ` | holds |
| 4.4 | ball; cap; strip `x(1 − x)` | `−½∂_r(1 − r/R)² = 1/R`; `−a_t(0) = cot φ₀`; `r = 0.8`, `d_M = 0.2` | holds |
| `exists_convexityFunction` | disc at `(0,−1)`; exterior; `n = 0`; `dim E = 0` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = (0,−2) = −dρ_q`, `K_c ⊆ {ε\|z − q\|² ≤ c}`; `−(2 + 2ε)g` fails hypothesis; interval; hypothesis false | true as typed |
| 4.6 | `(1 − \|x\|²)e^{−\|x\|²}` | radial derivative `−2/e` at `1`, minimum `−e⁻²` at `√2` | normalisation needed |
| `exitTime`, 5.2 | disc at `(0,−1)`; annulus; `v = 0`; outward; `T ≤ 0` | `2 sin θ` / `0`; `3/2 + √3` vs `3/2`; `∞`; `0`; contributes `0` | holds; homogeneity `τ(0, e₁/4) = 4` |
| `contMDiffOn_exitTime` | `[0,1]` (`n = 0`); outward boundary vector; glancing | `(1 − x)/v`, `x/(−v)`; root by implicit function, `∂_t h = dρ(v) ≠ 0`; excluded, continuity via fold form | true |
| σ, `T`, `Xσ = −2` | ball; `[a, b]` | `−2⟨x, v⟩`, `1 − \|x\|²`, derivative `−2`; `a + b − 2x`, `(b − x)(x − a)`, `σ² + 4T = (b − a)²` | true; Remark 3.2.13 returns `τ` |
| `isNonTrapping_tfae` | `M = ∅`; nonempty closed `M`; `[a, b]`; hemisphere `n ≥ 1`; ball bound | all three hold; all three fail (max of `f`); all hold; excluded by convexity; `τ ≤ 2` | true |
| `geodesicEndpoint` | disc `T = 1, 3, 0, −1`; zero vector; doubled half-line | `((0,0),(0,1))`, `z`, `z`, `z`; `(x, 0)`; two values | R01 |
| `scatteringRelation_involutive` | ball inward, outward, glancing; `[a, b]`; `M = ∅` | `(x − 2⟨x,v⟩v, v)`, twice gives `(x, v)`; backward branch `((0,1),(0,−1))`; fixed; no fixed point; vacuous | true |
| `exists_contMDiffOn_eq_scatteringRelation` | ball; `n = 0` | `F = α ∘ r`, `r` a retraction onto `∂SM`; four points | true |
| 6.1 ellipse, 6.3, 6.4, 6.5 | vertex `(a, 0)`; cap, `p = 2e`; hyperbolic `(0, 2)`; torus `R = 1/4`; `φ = s² − 2s` | `a/b²`; `cot R`, `1/√15`; `u = 5/4`, `\|du\| = 3/4`; `II = 4h`, `τ ≤ 1/2`; `b′ = e^{r⁴−2r²}(2r² − 1)²` | holds |

## Not verifiable

- Locators into `lee-riemannian2018` (11 citations, chapter level: Ch. 5–6, 7–8, 8) and
  `lee-smooth2012` (Theorem 9.25) and `sharafutdinov1994` (Ch. 4): settled as uncertified, the
  texts were not read. In particular the attribution of the conformal change law of `II` (1.6) to
  Ch. 7–8 of `lee-riemannian2018` could not be confirmed.
- Elaboration: no Lean was run in this pass; types are those of `signatures.md`.
- Ownership against open pull requests was checked through `roadmaps grep` and `overlaps.md`
  only, not by reading each of the 237 sibling checkouts.

Source independence: 12 passages compared with 3 sources (1.4, 3.5, 4.2, 4.5, 5.3, 5.4 fold form,
5.5 route, 5.6 lens data, four docstrings), none shared beyond statements the mathematics forces;
largest share `paternain-salo-uhlmann2023`, 46 of 84 source citations; contents compared with
`paternain-salo-uhlmann2023` (Sections 3.1–3.3: its 3.1 is spread over README 1.4, 2.1, 2.2, 3.5,
4.2, 4.3, 5.1, 5.2; its 3.2 over 5.3–5.4; its 3.3 over 5.1, 5.5, 5.6): independent. The texts of
`lee-riemannian2018`, `lee-smooth2012` and `sharafutdinov1994` could not be read.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the product `T` has second factor the exit time at `x − v`; it should be the exit time at `(x, −v)`; affects nothing.
- **Gap** in paternain-salo-uhlmann2023 at Exercise 3.2.12, printed page 64: the source says an even smooth function of one variable is a smooth function of the square; it should be stated with parameters, as the proof of Lemma 3.2.11 uses it; affects the proof.
- **Gap** in paternain-salo-uhlmann2023 at Lemma 3.1.8, printed page 56: the source says a compact manifold with boundary has a closed connected extension; it should assume `M` connected (the section's standing hypothesis), since a closed component fills its extension; affects a stated result.

## For the human reviewers

- **Licence.** `paternain-salo-uhlmann2023` was read from an author's copy on a university page, posted with the publisher's personal-use notice (`sources.toml`, `licence_class = "author-page"`); the roadmap cites locators only.
- **Not tested.** `lee-riemannian2018`, `lee-smooth2012`, `sharafutdinov1994` are uncertified: wording and arrangement were not compared with them (none has the largest share of locators).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d3b0e521cef5ab9ecbd1cf544ab7c3b150d92670", "job": "RT-RiemannianManifoldsWithConvexBoundary~1b", "model": "fable", "worker": "chris-x89"} -->
