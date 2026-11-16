<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18017#issuecomment-6906654343 -->
Review (claude) of 16982df

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) `geodesicEndpoint` and `α` are misstated for `T < 0` and for infinite exit time

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/README.md`, §5.6, lines 1525–1526 and
   1534–1535: "on a regular domain it is `φ_T(z)` whenever `t ↦ π(φ_t z)` maps `[0, T]` into `M`", and
   "`α(z)` … is `geodesicEndpoint z τ(z)` when `τ(z) > 0`"; the docstring of `scatteringRelation` in
   `packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean` line 249 ("for `z` with positive
   exit time").

   **Claim.** (a) For every real `T`, `geodesicEndpoint z T = φ_T(z)` when the flow maps `[0, T]` into
   `M`. (b) `α(z) = geodesicEndpoint z τ(z)` whenever `τ(z) > 0`, for `z ∈ TM`.

   **Witness.** (a) `T = −1`, closed unit disc, `z = ((0, −1), (0, 1))`: `[0, −1] = ∅`, so the condition
   holds; `φ_{−1}(z) = ((0, −2), (0, 1))`, but the Lean value is `z` (`0 ∉ Icc 0 (−1)`, so
   `IsGeodesicCurveOnFrom.zero_mem` fails). (b) `z = (x, 0)`: `τ = ∞` (README §5.2), not a real `T`;
   Lean takes `toReal ∞ = 0`, the other branch, value `z`.

   **Repair.** In §5.6 write the definition as: "`α(z)` (`scatteringRelation`) is
   `geodesicEndpoint z τ(z)` when `0 < τ(z) < ∞`, and otherwise `(y, −w)` for
   `(y, w) = geodesicEndpoint (x, −v) T′`, `z = (x, v)`, where `T′ = τ(x, −v)` when that is finite and
   `T′ = 0` when it is infinite." Write the API bullet as: "`geodesicEndpoint z T` is `(γ(T), γ'(T))`
   for every geodesic `γ` of `(M, g)` on `[0, T]` issuing from `z`; on a regular domain, for `T > 0`,
   it is `φ_T(z)` whenever `t ↦ π(φ_t z)` maps `[0, T]` into `M`; for `T ≤ 0` it is `z`." Add to the
   last Check of §5.6: "for `T = −1` the value is `z`, not `φ_{−1}(z) = ((0, −2), (0, 1))`; and for the
   zero vector `z = (x, 0)`, where `τ = ∞` in both directions, `α(z) = z`." In the docstring of
   `scatteringRelation` replace "positive exit time" by "positive finite exit time". Tested on the
   witnesses: `T = −1` gives `z` on both sides (no geodesic on the empty parameter set contains `0`);
   `T = 0` gives `z` (the set `{0}` is not `UniqueDiffOn`, so no `IsGeodesicCurveOn`); for `(x, 0)` the
   Lean body gives `geodesicEndpoint (x, 0) 0 = (x, 0)` and then `(x, −0) = z`. No Lean statement
   changes: the two theorems on `α` quantify over unit vectors of a non-trapping `M`, where `τ` is
   finite.

2. **F02** (P3) the manifest locator of `stefanov-uhlmann-vasy2021` names a section that does not exist

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, entry
   `stefanov-uhlmann-vasy2021`: `locator = "Theorem 1.1, Section 1.3"`; and
   `packages/RiemannianManifoldsWithConvexBoundary/README.md` line 1834, "Section 1, lines 15–230".

   **Claim.** The cited material is in Theorem 1.1 and Section 1.3 of the paper, and lines 15–230 are
   Section 1.

   **Witness.** `stefanov-uhlmann-vasy2021` line 24 is the heading of Section 1, which has no numbered
   subsections (the next headings are Section 2 at line 265 and 2.1 at line 278). Lines 15–23 are the
   abstract; §4.4 cites lines 20–22, which are in it.

   **Repair.** In the manifest set `locator = "Abstract; Section 1 (condition (1.1), Theorems 1.1–1.4)"`.
   In the README's References write "abstract and Section 1, lines 15–230". Checked against the text:
   condition (1.1) is at line 67, Theorems 1.1–1.4 at lines 89, 99, 198 and 210, all inside Section 1,
   and every line the README cites from this source (20–22, 53, 66–72, 89–93, 96–100, 128–134,
   150–163, 198–205, 220–221) lies in lines 15–230.

Two findings, one blocking (P2) and one P3. Both are small and local; nothing else in the package
needs a change. No previous review of the package exists and no maintainer notes were left.

## Verified sound

**Elaboration.** `lake env lean` on `packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`
from the content checkout: exit without error, 10 warnings, all `declaration uses sorry` (lines
113, 150, 179, 190, 213, 276, 291, 308, 329, 347). No `set_option`, no `lemma`, no `#eval`, no
sorried data; one `import Mathlib` followed by six `TauCeti.*` modules, each of which exists at the
pin and supplies a name the file uses (`boundaryChartedSpace`, `IsOutwardPointing`, `hessian` and
`mgradient`, `IsGeodesicCurveOn(From)`, `geodesicSpray`, `IsRegularValue`). 21 declarations: 11
definitions with real bodies, 10 theorems.

**Signatures.** The 21 elaborated types of `scratch/signatures.md` compared with the README
statements: all agree. The one flagged binder, `[IsManifold (𝓡∂ (n + 1)) ∞ M]` on
`IsBoundaryDefiningFunctionOn`, is not needed by any field of the structure (smoothness on `U` is
`ContMDiffOn`, which needs only the charted space); nothing changed. With `pp.explicit` I checked
that `‖z.snd‖` and `inner ℝ` on `TangentSpace` resolve to the `RiemannianBundle` instance
(`instNormedAddCommGroupOfRiemannianBundle…`), on `M` and on the existentially bound `N` of the
realisation theorem, not to the Euclidean norm of the model space.

**Padding probe, all 10 theorems.** On a scratch copy each `sorry` was replaced by
`first | rfl | infer_instance | trivial | (simp; done) | (simp [all nine definitions]; done) | tauto`:
10 errors, one per theorem; none closes. None restates a definition, mirrors a Check or treats a
boundary case.

**Headline theorems.** The Summary names seven; all are stated: Hessian characterisation
(`isStrictlyConvexAt_iff_hessian_neg`), realisation (`exists_isSmoothEmbedding_regularDomain`),
leaving of tangent geodesics (`not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt`,
`mem_interior_of_isGeodesicCurveOn`), convexity functions (`exists_convexityFunction`), exit-time
regularity (`contMDiffOn_exitTime`, `exists_contMDiff_eq_exitTime_sub_exitTime_neg`), the
non-trapping criteria (`isNonTrapping_tfae`), and the involution and smoothness of `α`
(`scatteringRelation_involutive`, `exists_contMDiffOn_eq_scatteringRelation`). The docstring's
claim that none is unstatable holds. Every backticked name the README attributes to this roadmap
(21) is declared in the Lean file, and every Lean name appears in the README.

**Adversarial table** (sampled targets, headlines, and the target of R01).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 trichotomy, `T_q∂M = ker dx⁰` | half-plane at 0; disc at `(0,−1)`; `[0,1]` | `ker dx⁰ = ℝe₁`, `dx⁰(−e₀) = −1 < 0` outward; `(t,1)` inward; `n = 0`: `T_q∂M = 0` | sound |
| 1.2 `ν_in` | `g = [[1,a],[a,1]]`, `a = 1/2` | `g(e₀−ae₁, e₁) = 0`, norm² `= 1−a² = 3/4`, `ν_in = (2/√3, −1/√3)`; `dx⁰ > 0` | sound |
| 1.4 `II = −Hess ρ/|dρ|` and its three other forms | ball radius `R`; exterior; half-space | `Hess ρ = −2g`, `|dρ| = 2R`, `II = h/R`; exterior `−h`; `0`; `⟨∇_u grad ρ, w⟩ = |dρ|⟨∇_u ν_in, w⟩` on `T∂M` | sound, sign pinned |
| 1.6 conformal law | `φ = log 2`; `φ = −|x|²`; general radial | `2h`; `dφ(ν_in) = 2`, `II = −e⁻¹h`, `Ĥ = −e`; derived from `Hess_ĝ ρ = Hess ρ + ⟨∇φ,∇ρ⟩g` on `T∂M`, `|dρ|_ĝ = e^{−φ}|dρ|` | sound |
| 2.1 predicates | ball, half-space, `{y ≥ x³}`, `n = 0` | `II(t,t) = 6x/(1+9x⁴)^{3/2}` recomputed from `Hess ρ = diag(−6x, 0)`; `n = 0` both strict predicates vacuous | sound |
| 2.2 Hessian iff (Lean headline) | `ρ′ = (2+x₁)ρ` on the ball; `−ρ` | `ρ = u x⁰`, `u(q) = ∂ρ/∂x⁰ > 0`, `Hess ρ = u Hess x⁰` on `T_q∂M`; `Hess ρ′ = −2(2+x₁)h` | sound, both directions |
| 3.1 regular domains | `(2+x₁)(1−|x|²)`; `(1−|x|²)³`; `x₀²−x₁²` | `{ρ′ ≥ 0}` = ball ∪ `{x₁ ≤ −2}`, `dρ′ = (1−|x|²)dx₁ ≠ 0` there; critical value; cone | sound |
| 3.3 `ρ̃` on the collar extension | `[0,1]`, half-space, `∂M = ∅` | `ρ̃ = φ₀χ(t) + φ₁s`: `= t` where `φ₁ = 0`; sign `+,0,−`; `ρ̃ = 2x` for `|x| < 1/4` | sound |
| 3.5 realisation (Lean headline) | `M = ∅`; closed `M`; `S¹ ⊔ [0,1]`; `[0,∞)`; `n = 0` | `N = ∅`; `N = M`, `ρ = 1`; double `= 3` circles, range `j` = first copy; collar extension non-compact; connected clause vacuous for `M = ∅` | sound |
| 4.2 leaving and no interior tangency (Lean) | ball, exterior, `{y ≥ x⁴}`, `n = 0` | `(x⁰∘γ)(0) = 0`, `′ = 0`, `″ = Hess x⁰(v,v) < 0`; `n = 0`: tangent velocity is `0`, excluded by constant nonzero speed | sound |
| 4.3 tube, signed distance, `ρ̂` | sphere; cutoff `|x|²` near 0 | `E(q,r) = (1−r)q`, `r_Σ = 1−|x|`; `|x|²−|x|³` not `C³`; `W₂ = {1/4 < |x| < 7/4}` | sound |
| 4.4 `g = dr² + h_r`, `II = −½∂_r h_r` | ball; exterior; cap; strip | `h_r = (1−r/R)²h₀ → h₀/R`; `(1+r)² → −h₀`; `a = sin(φ₀−r)/sin φ₀ → cot φ₀`; `d_M((0.8,0),∂M) = 0.2 ≠ 0.8` | sound |
| 4.5 convexity function (Lean) | disc at `(0,−1)`; `dim 1`; `dim 0` | `Hess x̃ = (2−2ε)g`, `dx̃_q = (0,−2) = −dρ_q`, `K_c ⊆ {ε|z−q|² ≤ c}`, `K₀ = {q}`; `dim 0`: hypothesis false | sound, not vacuous for `dim ≥ 2` (`x = −ρ` fails compactness) |
| 5.2 `exitTime`, `IsNonTrapping` | disc; annulus; `T ≤ 0`; zero vector | `2 sin θ`; `3/2 + √3`, limit `3/2`; `T < 0`: `0 ∉ ∅`; `T = 0`: `{0}` not `UniqueDiffOn`; `ofReal T = 0`; `τ(x,0) = ∞` | sound |
| 5.4 regularity, `Xσ = −2` (Lean) | ball; `[a,b]` | `σ = −2⟨x,v⟩`, `dσ(v,0) = −2|v|² = −2`; `F(x,v) = (a+b−2x)v`, `dF(v,0) = −2v² = −2`; outward boundary vector: `τ` is the IFT root, `0` on `∂M` | sound |
| 5.5 TFAE (Lean) | `∅`; closed `M`; `[0,1]`; `S¹ ⊔ [0,1]`; conformal ball | all true; all false (max of `u` on `SM` has `Xu = 0`); all true; all false; `b′ = e^{r⁴−2r²}(2r²−1)²` vanishes at `1/√2` | sound |
| 5.6 `α` involution (Lean) | inward, outward, glancing `z`; `[a,b]` | inward: `α(αz)` via the backward branch `= z`; glancing: `geodesicEndpoint(−z, 0) = −z`, flipped `= z`; `α(a,+1) = (b,+1)` outward | sound |
| 5.6 `geodesicEndpoint` bullet | `T = −1`, `T = 0`, zero vector | `z` versus `φ_{−1}(z) = ((0,−2),(0,1))`; `τ = ∞` | **R01** |
| 6.4 small balls | flat torus; `S¹`; sphere | `Hess|z|² = 2δ − 2z_kΓ^k_ij`; `II = 2h/(2·¼) = 4h`; `τ ≤ ½`; `r_p ≤ π/2` on `S^{n+1}`, `n ≥ 1` | sound |
| 6.5 Herglotz | `φ = −st`; `φ = s²−2s`; `n = 0` | `b′/r = e^φ(1/r + 2rφ′)` equals 1.6's value; threshold `s = ½`; `b′(1) = e⁻¹` | sound |

Also recomputed: the hyperbolic `u` of 6.3 (`Hess u_xx = 1/(2y) + (x²+1)/(2y³) = u/y²`, `u(0,2) = 5/4`,
`|du| = 3/4`), the cap with `p = 2e` (`cot(arccos ¼) = 1/√15`), the ellipse vertex (`a/b²`), the
epigraph curvature `(1+2x²)^{−3/2}`, Remark 3.2.13 on the ball (`a = τ̃² + 4T`), `ρ = (1−|x|²)e^{−|x|²}`
(minimum `−e⁻²` at `√2`).

**Library declarations opened at the pins.** 82 backticked library names of the README resolved by
script against the pinned Mathlib and Tau Ceti, none missing. Read in full:
`TauCeti.Manifold.IsGeodesicCurveOn` and `IsGeodesicCurveOnFrom`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean` lines 102 and 134: `UniqueDiffOn`,
`C²`, `zero_mem`, initial data as a point of `TM`); `curveVelocityWithin`
(`TauCeti/Geometry/Manifold/MFDeriv/Curve.lean` line 135); `hessian`
(`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean` line 135, `IsManifold I 2`, `C¹` metric, no
boundaryless hypothesis); `mgradient` (`…/Riemannian/Gradient/Basic.lean` line 73);
`TauCeti.IsOutwardPointing` (`…/Boundary/Orientation.lean` line 46: includes `x ∈ ∂M`);
`geodesicSpray` (`…/Geodesic/Spray.lean` line 104, any model with corners); `TauCeti.IsRegularValue`
(`…/RegularValue.lean` line 92); `isManifold_boundary` and the instance `boundaryChartedSpace`
(`…/Boundary/Charts.lean` lines 321 and 195); the sublevel atlas (`[I.Boundaryless]`, finite
dimension, `finrank = n + 1`, no second countability); the sphere bundle (boundaryless base);
`exists_isClosedEmbedding_normalExp_norm_le_subset` (`T2Space`, `SecondCountableTopology` on the
ambient manifold, closed core, no completeness); Mathlib `Manifold.IsImmersionAt`
(`Mathlib/Geometry/Manifold/Immersion.lean` line 191: charts of the maximal atlas, no boundaryless
hypothesis) and `IsSmoothEmbedding` (`…/SmoothEmbedding.lean` line 70). The README's descriptions
of these agree with what the files say.

**Duplication audit.** Loogle and LeanSearch leads of `scratch/library-matches.md` (21
declarations): no same-name hit and no library statement of any target. Grep of the pinned
libraries for the objects (defining function, exit time, scattering relation, non-trapping,
glancing, outward unit normal) finds nothing under `Geometry/Manifold`. Roadmap search
(`roadmaps grep`, main and 454 open heads) for scattering relation, non-trapping, boundary defining
function, strictly convex boundary, boundary normal coordinates, and the nine definition names of
the Lean file: no match. `scratch/overlaps.md`: no other pull request changes this roadmap, no
dropped or revision-only id, no second copy.

Overlap check: read RiemannianGeometry, RiemannianGeometry/Surfaces, HopfRinow, SmoothBundlesConnections (main), LorentzianGeometry, ManifoldOptimization (open); the second fundamental form and Gauss equation of immersions: RiemannianGeometry R5a (cited in 3.6); the normal collar and sublevel inclusion: RiemannianGeometry R7.9 (cited in 3.1, 4.3); the compact collar presentation: RiemannianGeometry R5c (cited in 3.5, which adds the non-compact case and the compact double); normal strips of surfaces: Surfaces 1.2–1.3 (cited in 4.4); uniform normal radii: SmoothBundlesConnections B6.0 (cited in 6.4); nothing owned twice.

**Supplier-order audit.** Dependency check output: `depcheck: 242 roadmaps, 2262 edges, 0
problem(s)`; no UPWARD, CYCLE or `moved:` line. Every cited section resolved on main:
DifferentialGeometry 5.1, 12.1, 12.2, 12.3, 12.5 (README lines 1648, 2801, 2848, 2871, 2936;
`exists_halfSpaceOutwardUnitNormal` at `TauCetiRoadmap/DifferentialGeometry/Suggested.lean` line
1020, with the three laws as cited); HopfRinow Layers 1 and 2 (`Completed/HopfRinow/README.md` lines
264, 427); RiemannianGeometry R5a (line 3205; sign conventions lines 188–192, Gauss equation lines
3249–3251, `B = 0` and total geodesicity line 3260), R5c items 1 and 3 (lines 3862–3892, half-space
`x_m > 0` line 3753), R7.9 (line 4469; collar lines 4509–4517, defining function lines 4569–4572,
outward criterion lines 4587–4591), §2.2 (R1.4) (line 1576); Surfaces 1.2–1.3 (lines 296, 340;
`a_t(s,0) = −k_g` line 305); GeometricTopology 1.1 and 1.3 (lines 788, 851; interior line 809,
double line 870); ComplexKahlerGeometry K5a (Seeley extension, line 1796); SmoothBundlesConnections
B6.0 (line 1306); AffineMorseLefschetz 4.5 (line 819); PositiveMass 5.1–5.2 as a consumer (lines
921, 957, `tr A/(n−1)` line 951). No gap is declared and `design/plan.json` has `gaps = []`; none
is needed. No citation of a roadmap on the never-cite list.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, six layers each ending with Examples and Dependencies, Downstream consumers, References.
Every definition has an API list and at least three Checks (counts per section: 1.1–1.6: 3, 3, 3,
4, 4, 3; 2.1, 2.3: 3, 4; 3.1–3.6: 5, 4, 4, 3, 5, 3; 4.2–4.6: 3, 4, 5, 3, 4; 5.1–5.6: 4, 3, 3, 4,
5, 5); theorems carry hypotheses and locators. No LaTeX delimiters, no process words, no
pull-request numbers, dates, anchors or machine paths in the README, the Lean file or the manifest.
The layers are the roadmap's own: boundary geometry, convexity, domains, geodesics at the boundary,
exit time, examples.

**Sources.** Read against the cached texts, at the cited lines, for all 15 sampled targets and
every other locator into the three certified sources (about 60 locators): Paternain–Salo–Uhlmann
lines 307–310, 2449–2481, 2499–2521, 2642, 2646–2696, 2728–2739, 2749–2773, 2781–2844, 2849–2861,
2865–3127; Stefanov–Uhlmann–Vasy lines 20–22, 53, 66–72, 89–100, 128–134, 150–163, 198–205,
220–221; Uhlmann–Vasy lines 25–32, 49–51, 134–140, 499–524. Every theorem number, hypothesis and
statement agrees with the README (in particular Lemma 3.2.9's weaker hypotheses, the side
convention of Definition 2.5.1, the opposite `∂±` labels of Stefanov–Uhlmann–Vasy, and `(r/c)′ > 0`
with `c = e^{−φ(r²)}`). The author flagged no locator as unverified. All six cited works are in the
manifest.

**Copyright.** Wording: a 6-gram comparison of the README and the Lean file with the three cached
texts, then a reading of every run of 7 words or more. The longest shared runs outside titles are
the statement of Lemma 3.2.8 (11 words, a statement the mathematics fixes), "whose level sets are
strictly concave from the superlevel sets" (10 words, the standard name of the condition), and
"with strictly convex boundary the following are equivalent" (8 words). Besides the sampled
locators I compared the proof plans of 5.3 (with the proof of Lemma 3.2.10), 5.4 (Lemmas 3.2.3 and
3.2.6), 5.5 (Proposition 3.3.1), 4.5 (Uhlmann–Vasy Section 3) and the docstrings of `exitTime` and
`scatteringRelation`: own wording, own notation, hypotheses added. Arrangement: the source with the
largest share is Paternain–Salo–Uhlmann; its Sections 3.1, 3.2, 3.3 do not map one to one onto
sections here (3.1's material is spread over Layers 1, 2, 3, 4 and 5.1–5.2; 5.3 lifts two lemmas
out of 3.2; 5.5 and 5.6 split 3.3), and the order 5.2 → 5.4 → 5.5, 5.6 is forced by the `*Needs:*`
lines of 5.4 (5.2, 5.3), 5.5 (5.4) and 5.6 (5.4). Reuse: no table, figure or exercise list taken
over; the disc example of the exit time is restated as a computed Check with its locator.

Source independence: 21 passages compared with 3 sources, none shared beyond statements the mathematics fixes; largest share paternain-salo-uhlmann2023, 47 of 86 named citations; contents compared with paternain-salo-uhlmann2023 (Sections 2.5, 3.1–3.3): independent; the two Lee texts and Sharafutdinov are uncertified and were not read.

## Not verifiable

- `lee-riemannian2018` (Ch. 5–8, cited in 1.2, 1.4, 1.5, 1.6, 3.6, 4.3, 4.4, 6.4): paywalled,
  settled as uncertified; the chapter locators were not checked against the text.
- `lee-smooth2012`, Theorem 9.25 (3.3): paywalled, settled as uncertified; it agrees with the
  locator GeometricTopology 1.1 gives for the collar theorem.
- `sharafutdinov1994`, Ch. 4 (References only): paywalled, settled as uncertified; no target relies
  on it.
- Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps show` at the
  heads of the index of 2026-11-16; LorentzianGeometry and ManifoldOptimization were read there.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the product `T` has second factor the exit time at `x − v`; it should be the exit time at `(x, −v)`; affects nothing.
- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed page 47: the source says the derivative of `b` is positive at `1`; it should be at the outer radius `r₁` of the annulus; affects nothing.

## For the human reviewers

- **Licence.** `paternain-salo-uhlmann2023` was read from the authors' copy on an author's
  university page, which `packages/RiemannianManifoldsWithConvexBoundary/sources.toml` records as
  posted with the publisher's personal-use notice (`licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "16982df1114dc82c09be6d5e7825d4bafab955a4", "job": "REV-PKG-RiemannianManifoldsWithConvexBoundary", "model": "fable", "worker": "chris-x88"} -->
