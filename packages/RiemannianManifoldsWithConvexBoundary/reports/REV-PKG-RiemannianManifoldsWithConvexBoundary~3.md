<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18017#issuecomment-6908677242 -->
Review (claude) of d3b0e52

Verdict: accepted

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

No finding. Both repairs of the previous round hold, the passages they changed pass the adversarial
pass, the repaired patterns do not occur elsewhere, and the rest of the package was checked again
against the sources, the pins and the supplier roadmaps as recorded below. No maintainer notes were
left for this roadmap. No supplier gap is declared (`design/plan.json` has `gaps = []`) and none is
needed.

## Previous findings, one by one

- **F01 (P2), the product `T = τ(x, v) τ(x, −v)` not stated: repaired.**
  `packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean` line 311 now declares
  `exists_contMDiff_eq_exitTime_mul_exitTime_neg` ("the product `T(x, v) = τ(x, v) τ(x, −v)` is, on
  the unit sphere bundle `SM`, the restriction of a smooth function `G` on `TM`"); the module
  docstring reads "the regularity of the exit time, the smoothness of `σ` and `T` and the identity
  `Xσ = −2` (§5.4)"; README §5.4 has "Likewise there is a smooth `G` on `TM` equal to `T` on `SM`
  (`exists_contMDiff_eq_exitTime_mul_exitTime_neg`); with `F` it gives `τ = (F + √(F² + 4G))/2` on
  `SM`"; the Summary reads "(Paternain–Salo–Uhlmann, Lemmas 3.2.3 and 3.2.11)". Checked against
  `paternain-salo-uhlmann2023` lines 3027–3030 (both functions) and 3046–3055 (the quadratic).
- **F02 (P3), two docstrings citing the wrong lemmas: repaired.** `contMDiffOn_exitTime` now cites
  "Lemma 3.2.3, Exercise 3.2.4" (`paternain-salo-uhlmann2023` lines 2865–2867, 2891); the `σ`
  theorem cites "Lemma 3.2.11 by the fold form of Lemma 3.2.9, Remark 3.2.7 and Lemma 3.2.6 for the
  restriction to `∂SM`, Exercise 3.3.3" (lines 3027–3030, 2955–2966, 2926–2929, 2896–2902,
  3110–3113). Each cited item says what the docstring uses it for.

Pattern search. F01 (a source theorem stated in part): each headline was set beside its source
statement again: Lemma 3.1.8 with lines 96–97 of `stefanov-uhlmann-vasy2021`, Lemma 3.1.12,
Lemmas 3.2.3 and 3.2.11, Proposition 3.3.1 (three conditions), Lemma 3.3.5 (diffeomorphism,
fixed points, `∂± ↔ ∂∓`, involution): all parts are stated. F02 (a docstring locator that names a
result the statement does not use): all 16 docstrings with a locator were read against the text; no
further instance.

## Verified sound

**Elaboration.** `lake env lean` on
`packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean` from the content checkout: exit 0;
eleven warnings, all `declaration uses sorry` (lines 113, 150, 179, 190, 213, 278, 294, 311, 326,
347, 365); nothing else. 22 declarations: 11 definitions with real bodies (one structure), 11
theorems. No `set_option`, `lemma`, `#eval`, `example`, sorried data. Header: `import Mathlib`, then
six `TauCeti.*` modules, each used (boundary atlas, `IsOutwardPointing`, `hessian`,
`IsGeodesicCurveOn`, `geodesicSpray`, `IsRegularValue`).

**Signatures.** The elaborated types of all 22 declarations (`scratch/signatures.md`, computed at
this head) were compared with the README statements: every theorem keeps the `C¹` binder its
definitions use and the smooth binder it adds; the five Layer 5 theorems and the `T` theorem keep
`[T2Space M] [CompactSpace M]`; the realisation keeps `[T2Space M] [SecondCountableTopology M]`;
`exists_convexityFunction` keeps `[T2Space N]`. The one lead (`IsBoundaryDefiningFunctionOn` without
`IsManifold`) needs no binder: `ContMDiffOn` and `mfderiv` use the charted space only. A scratch
`#synth Inner ℝ (TangentSpace (𝓡∂ (n + 1)) x)` fails without `RiemannianBundle` and succeeds with
it, so `inner` and `‖·‖` in the statements are the Riemannian ones, not the model space's.

**Padding probe, all 11 theorems.** On a scratch copy each `sorry` was replaced by
`first | rfl | infer_instance | trivial | simp | simp [the ten definitions] | tauto | intros;
assumption | exact ⟨fun _ => 0, contMDiff_const, by simp⟩ | exact?`: 11 errors, one per theorem.
None restates a definition, mirrors a Check, computes a value or treats a boundary case.

**Headline theorems** (README Summary), each stated: Hessian characterisation
(`isStrictlyConvexAt_iff_hessian_neg`); realisation (`exists_isSmoothEmbedding_regularDomain`);
leaving of tangent geodesics (`not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt`,
`mem_interior_of_isGeodesicCurveOn`); convexity functions (`exists_convexityFunction`); regularity
of the exit time (`contMDiffOn_exitTime`, `exists_contMDiff_eq_exitTime_sub_exitTime_neg`,
`exists_contMDiff_eq_exitTime_mul_exitTime_neg`); Proposition 3.3.1 (`isNonTrapping_tfae`);
scattering relation (`scatteringRelation_involutive`, `exists_contMDiffOn_eq_scatteringRelation`).
The module docstring names none as not statable, correctly. The readings on `TM` are equivalent
restatements, not stand-ins: `SM` is a closed embedded submanifold with boundary of `TM`, the exit
time is homogeneous of degree `−1`, and a local smooth extension together with `α ∘ α = id` is the
diffeomorphism statement. All 22 Lean names occur backticked in the README, and every backticked
name the README attributes to this roadmap is declared.

**Adversarial table** (passages the repairs changed, the sampled targets, the headlines).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `T` theorem (added) | unit ball; `[a, b]`; `∅`; closed `M`; wrong model `G ≡ 0` | `τ(x, ±v) = ∓⟨x,v⟩ + √(⟨x,v⟩² + 1 − |x|²)`, product `1 − |x|²`; `(b−x)(x−a)`; `TM = ∅`; hypothesis fails (`τ ≡ ∞`); ball centre gives `T = 1 ≠ 0` | sound |
| `τ = (F + √(F² + 4G))/2` (added, §5.4 and docstring) | general; `τ = 0 < τ′` | `t² − σt − T = (t − τ)(t + τ′)`, `σ² + 4T = (τ + τ′)²`, value `(τ − τ′ + τ + τ′)/2 = τ`; `(−τ′ + τ′)/2 = 0` | sound |
| `[a, b]` Check (extended) | `p = b − x`, `q = x − a` | `(p − q)² + 4pq = (b − a)²`; `((a + b − 2x) + (b − a))/2 = b − x`; on `∂SM` one of `τ(x, ±v)` is `0`: strictly inward `v` has `−v` outward, the rest lie in `∂₋SM` | sound |
| Summary "Lemmas 3.2.3 and 3.2.11" (changed) | source lines 2865–2867, 3027–3030 | continuity on `SM` and smoothness off `∂₀SM`; smoothness of `σ` and `T` | agrees |
| 1.1 trichotomy, curves | half-plane; disc at `(0,−1)`; `[0,1]`; `c : [0, ε)` | `ker dx⁰ = ℝe₁`, `dx⁰(∓e₀) = ∓1`; `(t, ±1)` inward, outward; `T_q∂M = 0`; `x⁰ ∘ c ≥ 0 = x⁰(c(0))` gives `(x⁰ ∘ c)′(0) ≥ 0` | sound |
| 1.3 defining functions | glued `ρ = Σ φᵢ x⁰ᵢ + φ₀`; `(2 + x₁)(1 − |x|²)`; `(1 − |x|²)²`; `x(1 − x)` | at `∂M`: `dρ = Σ φᵢ dx⁰ᵢ`, positive on inward vectors; `u = 2 + x₁ ∈ [1, 3]`; `dρ″ = 0` on the sphere; `ρ′(0) = 1`, `ρ′(1) = −1` | sound |
| 1.4 `II` and its three descriptions | ball radius `R`; half-space; exterior; `N = −grad ρ/|grad ρ|`; tangent `W` | `−(−2g)/(2R) = h/R`; `0`; `−h`; `⟨∇_u N, w⟩ = −Hess ρ(u,w)/|dρ|` since `⟨grad ρ, w⟩ = 0`; `⟨∇_u W, ν_in⟩ = −⟨W, ∇_u ν_in⟩` | sound |
| 1.5 Weingarten, `H` | sphere; solid cylinder in `ℝ³`; exterior; `n = 0` | `S = id`, `H = 1`; curvatures `1, 0`, `H = 1/2`; `−1`; undefined, unused | sound |
| 1.6 conformal law | derivation; `φ = log 2`; `φ = −|x|²`; constant `c` | `ĝ(∇̂_XY, ν̂_in) = e^φ(II − dφ(ν_in) h)` from `∇̂_XY = ∇_XY + … − g(X,Y) grad φ`; `2h = (4h)/2`; `dφ(ν_in) = 2`, `−e⁻¹h`, `Ĥ = −e`; `c·II` | sound |
| 2.1 predicates | `{y ≥ x³}`; `n = 0` | `Hess ρ(t,t) = −6x/(1+9x⁴)`, `|dρ| = (1+9x⁴)^{1/2}`, `II = 6x/(1+9x⁴)^{3/2}`; both strict predicates vacuous | sound |
| 2.2 Hessian iff (Lean) | `ρ = u x⁰`, `u(q) > 0`; `ρ′ = (2+x₁)ρ`; `−ρ`; `ρ` arbitrary off `U` | on `T_q∂M`: `Hess ρ = u(q) Hess x⁰`, `II = −Hess x⁰/|grad x⁰|`; `−2(2+x₁)h < 0`; excluded by `pos`; the Hessian at `q` reads the germ on the open `U` | sound, both directions |
| 3.2 level sets | `x = |z|²`, `c > 0`; affine; `n = 0`; `|z − z₀|` | `II = 2h/(2√c) = h/√c`; `Hess = 0`; vacuous when `dx ≠ 0`; `(g − dx⊗dx)/|z − z₀|` | sound |
| 3.4 extension | `√x`; `(x + 1/100)dx²`; empty boundary | no smooth extension at `0`; positive only for `x > −1/100`, cutoff needed; no Seeley step | sound |
| 3.5 realisation (Lean) | `∅`; closed `M`; compact `M` with a closed and a bounded component; `[0, ∞)`; half-space into `ℝⁿ⁺¹` | `N = ∅`; `N = M`, `ρ ≡ 1`; double is compact, `ConnectedSpace M` false; `(−1, ∞)`; `ModelWithCorners.isSmoothEmbedding` at the pin covers a boundary source | sound |
| 4.1 geodesics of a domain | ball, tangent `v`; `v = 0`; half-space | `|q + tv|² = 1 + t²|v|² > 1`; constant curve on `ℝ`; boundary line stays in `∂M` | sound |
| 4.2 leaving, no interior tangency (Lean) | ball; exterior; `{y ≥ x⁴}`; `n = 0`; non-Hausdorff `M` | `(x⁰∘γ)″(0) = Hess x⁰(v,v) = −|dx⁰| II(v,v) < 0` against `x⁰∘γ ≥ 0`; `+t²`; `−t⁴` with `II = 0`; tangent velocity `0` against constant nonzero speed; zero speed forces a locally constant curve, the argument is in one chart | sound |
| 4.5 convexity function (Lean) | disc at `(0,−1)`; `dim E = 1`; `dim E = 0`; `c = 0` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = (0,−2) = −dρ_q`, `K_c ⊆ {ε|z − q|² ≤ c}`; kernel `0`, interval; `mfderiv = 0`, hypothesis false; `K₀ = {q}` | sound, not vacuous |
| 5.2 exit time | disc; annulus `1 ≤ |x| ≤ 2`; `[a, b]`; zero vector; `T ≤ 0` in the Lean supremum | `2 sin θ`; `3/2 + √3` against the limit `3/2`; `b − x`; `∞`; `{0}` is not `UniqueDiffOn`, `Icc 0 T = ∅` fails `zero_mem` | sound |
| 5.4 `contMDiffOn_exitTime` (Lean) | `[a, b]`; strictly outward boundary vector; strictly inward; glancing | `(b − x)/v`, `(x − a)/|v|`; root of `ρ(γ_y(t))` near `0` with `∂_t < 0`; `ρ(γ_y(t)) ≥ ρ(y) + ct` near `0`, transversal exit; `Q(√a)`, `Q(0, z₀) = 0` | sound |
| 5.4 `σ`, `Xσ = −2` (Lean) | ball; `[a, b]`; glancing point of the disc | `−2⟨x,v⟩`, `d/dt = −2|v|²`; `F = (a + b − 2x)v`, `dF(v, 0) = −2v² = −2`; `σ̃(φ_t z) = −2t` | sound |
| 5.5 TFAE (Lean) | `∅`; closed `M`; `[0, 1]`; closed plus bounded components; ball | all true; all false (`Xf = 0` at a maximum, `1 ≠ Xu`, `τ ≡ ∞`); `f = xv`, `Xf = 1`; all false; bound `(1 − (−1))/1 = 2` | sound |
| 5.6 involution (Lean) | strictly inward, strictly outward, glancing `z`; `[a, b]` | `α(αz) = z` through the other branch each time; glancing: `toReal 0`, endpoint `−z`, flip `z`; outwardness flips; `α(a, 1) = (b, 1)`, no fixed point | sound |
| 5.6 smoothness (Lean) | `F = α ∘ π`, `π(x⁰, x′, v) = (0, x′, v/|v|)` | smooth near `z`, equal to `α` on `∂SM` | sound |
| 6.4 small balls | normal coordinates; flat torus; `S^{n+1}`; `S¹` | `Hess|z|² = 2δ − 2z_kΓ^k_ij`; `II = 2h/(2·¼) = 4h`, `τ ≤ ½`; `r_p ≤ π/2`; every `r_p ≤ π` | sound |
| 6.3, 6.1, 6.5 values used above | cap with `p = 2e`; hyperbolic `(0, 2)`; ellipse vertex; `φ(s) = s² − 2s` | `cot(arccos ¼) = 1/√15`; `u = 5/4`, `|du| = 3/4`; `(2/b²)/(2/a) = a/b²`; `b′ = e^{r⁴−2r²}(2r² − 1)²` | sound |

**Library declarations at the pins.** The 83 namespaced library names backticked in the README were resolved: 65
by `#check` in a scratch file against the pins, the 18 whose modules have no built object file by
opening the declaration and its namespace; none is missing. Read for this round: `IsGeodesicCurveOn`,
`IsGeodesicCurveOnFrom` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean` lines 102, 134:
`uniqueDiffOn`, `zero_mem`); `curveVelocityWithin` (`TauCeti/Geometry/Manifold/MFDeriv/Curve.lean`
line 135); `hessian` (`TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean` line 135; `IsManifold I
2`, `C¹` metric, no boundaryless hypothesis); `mgradient`
(`TauCeti/Geometry/Manifold/Riemannian/Gradient/Basic.lean` line 73); `geodesicSpray`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Spray.lean` line 104; any model, read in the chart
at the argument); `IsOutwardPointing` (`TauCeti/Geometry/Manifold/Boundary/Orientation.lean` line
46; includes `x ∈ ∂M`, negative zeroth coordinate); `sphereBundleChartedSpace`
(`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean` line 143; `[I.Boundaryless]`, model
of dimension `finrank (E × F) − 1`, a non-instance definition); `Manifold.IsSmoothEmbedding` and
`ModelWithCorners.isSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean` lines 70,
95); `CovariantDerivative.leviCivitaConnection` and `IsLeviCivitaConnection.uniqueness`
(`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean` lines 360, 256);
`TauCeti.secondFundamentalForm` (`TauCeti/Analysis/InnerProductSpace/SecondFundamentalForm.lean`
line 82, a different object under a different fully qualified name).

**Duplication audit.** `scratch/library-matches.md`: no same-name hit and no near-match states any
of the 22 declarations. `roadmaps grep` over main and the 462 open heads for scattering relation,
non-trapping, boundary defining function, strictly convex boundary, convex boundary, boundary
normal coordinates, mean convex, and the ten definition names of the Lean file: no match outside
this roadmap; "exit time" matches only stopping times (DysonBrownianMotion, StochasticCalculus);
"signed distance" matches RiemannianGeometry R7.9 (cited in 4.3) and a barrier construction in
GeometricCurrents (a different statement). `scratch/overlaps.md`: no other pull request changes
this roadmap, no dropped id, no id defined only by a revision, no second copy.

Overlap check: read RiemannianGeometry, RiemannianGeometry/Surfaces, HopfRinow, SmoothBundlesConnections (main and its open revision), LorentzianGeometry, ManifoldOptimization (open); immersion second fundamental form and Gauss equation: RiemannianGeometry R5a (cited in 3.6); sublevel inclusion and normal collar: RiemannianGeometry R7.9 (cited in 3.1, 4.3); compact collar presentation: RiemannianGeometry R5c (cited in 3.5); normal strips: Surfaces 1.2–1.3 (cited in 4.4); uniform normal radii: SmoothBundlesConnections B6.0 (cited in 6.4, unchanged at the open revision); nothing owned twice.

**Supplier-order audit.** Output of the dependency check:

    depcheck: 251 roadmaps, 2382 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line; the merge order lists this roadmap directly after
SmoothBundlesConnections. Every supplier is on main and each citation was resolved there again:
DifferentialGeometry 5.1, 12.1, 12.2 (`TauCetiRoadmap/DifferentialGeometry/README.md` lines 1648,
2801, 2848), 12.5 (line 2950, the three laws determine the normal); HopfRinow Layers 1 and 2
(`Completed/HopfRinow/README.md` lines 264, 427); RiemannianGeometry 2.2 (R1.4) (line 1576), R5a
(line 3205), R5c (line 3715; defining function lines 3886–3888), R7.9 (line 4469; outward criterion
lines 4589–4591); Surfaces 1.2, 1.3 (lines 296, 340); GeometricTopology 1.1, 1.3 (lines 788, 851);
ComplexKahlerGeometry K5a (the half-space Seeley extension, line 1796); SmoothBundlesConnections
B6.0 (line 1306, uniform normal radii with `IsNormalDomain`); AffineMorseLefschetz 4.5 (line 819);
PositiveMass 5.1–5.2 (lines 921, 957), a consumer. No roadmap of the never-cite list is cited.

**Shape and policy.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, six layers each ending with Examples and Dependencies, Downstream consumers,
References. Every definition has its API and at least three Checks; theorems carry hypotheses and
locators; layers are named by their mathematics. Scan of the README and the Lean file for process
words, pull-request numbers, dates, anchors, machine paths, LaTeX delimiters and the `lemma`
keyword: none.

**Sources.** Read at the cited lines for the 15 sampled targets and every docstring locator:
`paternain-salo-uhlmann2023` lines 305–311, 2443–2525, 2640–2700, 2726–3127;
`stefanov-uhlmann-vasy2021` lines 18–24, 50–56, 62–74, 86–102, 124–136, 148–164, 196–224;
`uhlmann-vasy2016` lines 13–34, 46–52, 130–142, 496–526. Theorem numbers, hypotheses and statements
agree with the README: Definitions 3.1.1, 3.1.3, 3.1.7, 2.5.1, 3.3.4; Lemmas 2.5.2, 3.1.8, 3.1.10,
3.1.12, 3.1.13, 3.2.3, 3.2.6, 3.2.8, 3.2.9 (compactness and local strict convexity only), 3.2.10,
3.2.11, 3.3.5; Proposition 3.3.1; Examples 3.1.4, 3.2.1; Exercises 3.1.2(b), 3.1.9, 3.2.4, 3.2.12,
3.3.3, 3.3.6; the opposite labelling of `∂±SM` (`stefanov-uhlmann-vasy2021` line 151); the covector
condition and the construction of `x̃` (`uhlmann-vasy2016` lines 499–524). The author flagged no
locator as unverified. All six cited works are in the manifest.

**Copyright.** Wording: besides the sampled locators, the README or docstring was set beside the
source for the fold normal form (Lemma 3.2.10), the route of 5.5 (proof of Proposition 3.3.1), the
construction of 4.5, the docstrings of `exitTime` and `scatteringRelation`, the remark on
Definition 2.5.1, and the lens data of 5.6: own wording and notation throughout (the exit time is a
supremum here and a maximal interval in the source); the longest shared runs are statements the
mathematics fixes (the three conditions of Proposition 3.3.1). Arrangement: Sections 3.1–3.3 of the
source cited most do not map onto sections here (3.1 is spread over Layers 1–4 and 5.1–5.2, 5.3
lifts two lemmas out of 3.2, 5.1 takes the flow from 3.3, 5.5 and 5.6 split 3.3), and the order
5.2 → 5.4 → 5.5, 5.6 is forced by the `*Needs:*` lines of 5.4 (5.2, 5.3), 5.5 (5.4) and 5.6 (5.4).
Reuse: no table, figure or exercise list taken over.

Source independence: 22 passages compared with 3 sources, none shared beyond statements the mathematics fixes; largest share paternain-salo-uhlmann2023, 47 of 85 named citations; contents compared with paternain-salo-uhlmann2023 (Sections 2.5, 3.1–3.3): independent; lee-riemannian2018, lee-smooth2012 and sharafutdinov1994 are uncertified and were not read.

## Not verifiable

- `lee-riemannian2018` (Ch. 5–8, cited in 1.2, 1.4, 1.5, 1.6, 3.6, 4.3, 4.4, 6.4): paywalled,
  settled as uncertified; the chapter locators were not checked against the text.
- `lee-smooth2012`, Theorem 9.25 (3.3): paywalled, settled as uncertified; GeometricTopology 1.1
  gives the same locator for the collar theorem.
- `sharafutdinov1994`, Ch. 4 (References only): paywalled, settled as uncertified; no target
  relies on it.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the second factor of the product is the exit time at `x − v`; it should be the exit time at `(x, −v)`; affects nothing.
- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed page 47: the source says the derivative of `b` is positive at `1`; it should be at the outer radius `r₁`; affects nothing.

## For the human reviewers

- **Licence.** `paternain-salo-uhlmann2023` was read from the authors' copy on an author's
  university page, recorded in `packages/RiemannianManifoldsWithConvexBoundary/sources.toml` with
  the publisher's personal-use notice (`licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d3b0e521cef5ab9ecbd1cf544ab7c3b150d92670", "job": "REV-PKG-RiemannianManifoldsWithConvexBoundary~3", "model": "fable", "worker": "chris-x52"} -->
