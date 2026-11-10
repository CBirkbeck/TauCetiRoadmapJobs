# Review of DifferentialGeometry (pull request #886 at 4753cef)

**Verdict:** needs changes

Incremental re-review of the 28 changed lines since 03882f5. Both previous findings are repaired. The deletion of `RoughDensity` (the repair of the previous R02) leaves a citation on main pointing at nothing. That citation is the one finding below, P3. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with the 36 `sorry` warnings and nothing else.

## R01 (P3) — Deleting `RoughDensity` leaves ComplexKahlerGeometry on main citing a DifferentialGeometry carrier that no longer exists

**Location.** `TauCetiRoadmap/DifferentialGeometry/Suggested.lean:805–806` (where `abbrev RoughDensity` stood, before `end Densities`), README 1875–1876 and 1905. Both README lines now write "rough densities" without the name. Scope and ownership (README 37–42) maps the old ids of 5.5 and of layer 4 but says nothing about this name.

**Claim.** ComplexKahlerGeometry's README on main identifies the smooth sections of its density bundle with "chart-smooth values of DG 5.5's `RoughDensity` carrier". After this pull request merges, that name exists nowhere. The previous review's witness for deleting it searched only `*.lean` files, so it missed this README citation.

**Witness.** `git grep -n RoughDensity HEAD` at 4753cef finds only `TauCetiRoadmap/ComplexKahlerGeometry/README.md:629`. The pinned Mathlib and Tau Ceti do not contain the name. `roadmaps grep` finds the same line on main at 641f296.

**Repair.** In Scope and ownership, after "`Distribution.exists_leaf` (4.2–4.4).", add the following sentence: "Citations of the 5.5 name RoughDensity resolve to the rough densities of 5.5a, a `Density (TangentSpace I x) m` at every point `x`." Leave `RoughDensity` unbackticked, as README 39–40 already does for Distribution, IsInvolutive and leafThrough. I tested this on a scratch copy of the README: `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere. Keeping the `abbrev` instead would bring back the previous R02.

## Previous findings

- R01 — repaired: `Suggested.lean:91–96` now reads "`Density`, `planarRadialPrimitive`, `contractionAlongMap` and `familyContraction` have no Tau Ceti counterpart at the pin. `immersionMetric` and the boundary metric of 12.5 are the instance-level forms, asking no regularity, of Tau Ceti's …".
- R02 — repaired: `Suggested.lean:798–806` keeps only `structure Density` (`:802`) between `section Densities` and `end Densities`. README 1875–1876 now reads "rough densities (a `Density (TangentSpace I x) m` at every point `x`)" and 1905 "The rough densities of degree `dim` contain `|ω|` …". The repair introduced R01 above.

## Verified sound

**Gate**, re-run on this head (text checks and the dependency check; the worker's run on the same head also passed the targeted build, `build=0`):

    gate DifferentialGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

**Dependency check:**

    depcheck: 233 roadmaps, 2263 edges, 0 problem(s)

The dependency check shows no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty, and `git merge-tree --write-tree HEAD origin/main` (2bbd3cb) is clean. I re-ran the overlap report against the index at main 641f296. It still lists only #334 and #1187 on this folder; the description and its generated merge-order block order both after this pull request. The report shows no dropped or revision-only ids.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 36 `declaration uses sorry` warnings and no other diagnostic. The file has 64 declarations; the previous head had 65, and the difference is `RoughDensity`. The deleted `variable` block was closed by `end Densities` on the next line, so no later declaration's binders change. No `*.lean` file at this head names `RoughDensity`. Of the four importers, `ComplexKahlerGeometry/Suggested.lean:120–121` uses `Density` only.

**Signatures.** I checked all nine "dropped binder" leads:
- The three 3.3–3.4 theorems and `timeDependentFlowDomain_eq_univ` (`:612–620`) drop `[CompleteSpace E]` through `omit … in`, and carry `[FiniteDimensional ℝ E]`.
- `suspendedTimeField`, `timeDependentFlowDomain`, `timeDependentFlow` and `planarRadialPrimitive` are total definitions, and their theorems carry the hypotheses.
- `halfSpaceBoundaryMetric` elaborates with only `[IsManifold (𝓡∂ (n+1)) ∞ M]` and a bare `RiemannianBundle`. That matches "asking no regularity", and none of the dropped `T2Space`, `SecondCountableTopology`, `SigmaCompactSpace`, `MeasurableSpace` or `BorelSpace` binders is needed by a metric.

Nothing changed.

**Library declarations opened** (Tau Ceti `2fd255d9`, unchanged pin, 8 declarations):
- `Geometry/Manifold/Riemannian/Pullback/Basic.lean:143` `contMDiffAt_pullback`, `:158` `Bundle.ContMDiffRiemannianMetric.pullback`, `:193` `pullback_inner`. `pullback` takes `g : ContMDiffRiemannianMetric J n F …`, `hf : ContMDiff I J (n + 1) f` and `hinj`; its inner product is `(v, w) ↦ g_{f x}(df v, df w)`, the same as `immersionMetric`'s `bilinearComp (A x) (A x)`.
- `Riemannian/Boundary.lean:115` `restrictBoundaryTangentSpace` (takes a bundled `C^k` metric, body `g.pullback Subtype.val …`) and `:146` `restrictBoundaryTangentSpace_inner`.
- `Riemannian/VolumeDensity/Volume.lean:82` `TauCeti.riemannianVolume`, which is the body of `halfSpaceBoundaryVolume` (`Suggested.lean:1011–1014`).
- `Geometry/Symplectic/Liouville/Radial.lean:56` `TauCeti.SymplecticForm.radialPrimitive` and `Geometry/Manifold/DifferentialForm/HomotopyOperator.lean:100` `TauCeti.homotopyOperator`. Neither is a counterpart of the planar primitive or of `contractionAlongMap`; see the table.
- No structure of |det|-transforming tuple functions exists in Tau Ceti. A search for `|LinearMap.det T|` finds only proof-internal uses.

**Cross-roadmap citations.** The resolver reports no cross-roadmap citation found nowhere. Its seven Lean-name leads are all this file's own declarations: `Suggested.lean:333, 346, 356, 667, 684, 700, 722`. The changed lines cite only `Density` (declared at `:802`) and 12.4 (present).

**Seeded sample.** The eight targets are at README 544 ("Smooth 2-forms"), 1406, 1629, 2059, 2215, 2323, 2348 and 2363. None falls in the changed lines (1875–1907) or the changed docstring (`Suggested.lean:91–96`). Their text and the pins are unchanged since 03882f5, so the previous report's verification stands. No locator in the README is flagged as unverified.

**Remark** (untouched text, not a finding of this incremental review): ComplexKahlerGeometry's README on main also relies on "DG's existing pointwise `SMul ℝ`" on `Density` (621–622). It also cites DG's `integralTopForm_eq_integralDensity` and `integral_riemannianVolume_eq_integralDensity` (926–928). None of these exists at this head or at 03882f5.

**Adversarial table.** The rows marked "r27" are carried from the report on 03882f5; their statements are untouched by the diff. The first five rows are this round's.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.5a rough densities, a `Density (TangentSpace I x) m` at each `x` (README 1875–1876) | `ℝ²`, `m = 2`, `\|dx∧dy\|`, `T = diag(2, −1)`; `m = 1`, `\|dx\|`, `T = diag(1, 2)`, `v = e₁`; `dim 0`, `m = 0`; wrong model `dx∧dy` itself | `\|ω(Te)\| = 2 = \|det T\|·1`; `\|dx(Te₁)\| = 1 ≠ 2 = \|det T\|·1`, so not a density, agreeing with the README Check that degree below the dimension forces `0`; `det` on the zero space is `1`, so any value works and `Density 0 0 ≅ ℝ`; `ω(Te) = −2 ≠ 2`, so the signed form is excluded by `map_comp` | holds | none |
| 5.5a Check: `\|ω\|` and the Riemannian density lie in degree `dim` (README 1905–1907) | flat `ℝ²`, standard `e`, `T = diag(2, −1)`; general tuple `V` | `√det(I) = 1`; `√det(TᵀT) = √4 = 2 = \|det T\|`; `√((det V)²(det T)²) = \|det T\|·\|det V\|` | holds | none |
| Docstring: `immersionMetric` and `halfSpaceBoundaryMetric` are instance forms of Tau Ceti's `pullback` / `restrictBoundaryTangentSpace` (`:93–96`) | `n = 0`, boundary of `[0, 1]`; flat half-plane; elaborated signatures | trivial fibre on both sides; `dy²` on both sides; ours needs only `f`, `hinj` and a bare `RiemannianBundle`, Tau Ceti's needs `ContMDiff (n+1)` and a `C^n` bundled metric | holds | none |
| Docstring: `Density`, `planarRadialPrimitive`, `contractionAlongMap`, `familyContraction` have no Tau Ceti counterpart (`:91–93`) | `P = 1`, `Q = 0`, `a = 0`; Tau Ceti `radialPrimitive` for `ω = dx∧dy`; `contractionAlongMap id e₁ (dx∧dy)` | ours: `g(z) = Re z`, a function with `dg = dx`; Tau Ceti's: the 1-form `(x dy − y dx)/2`, a different object; ours is `dy = ι_{e₁}(dx∧dy)`, Tau Ceti's insertion is the `p = id` case only and `homotopyOperator` acts on forms on `M × [0, 1]` | holds | none |
| Deletion of `RoughDensity` | consumers at this head | `.lean` users: none; README users: `ComplexKahlerGeometry/README.md:629` | breaks one citation | R01 |
| 5.5a `Density` (r27) | `V = ℝ`, `m = 1`; `dx` | `toFun(−1) = toFun 1`; `dx(−1) = −1`, not a density | discriminates | none |
| 12.1 `immersionMetric` (r27) | `id`; `x ↦ 2x`; `x ↦ x²` | the given metric; `4 dx²`; `hinj` fails at `0`, where `pos` would fail | body correct | none |
| 2.4 `orientable_iff_exists_homeomorph_orientationCover` (r27) | `M = ∅`; `dim E = 0`; `S¹ ⊔ S¹`; `S¹ ⊔ B` | true/true; `M × 2`, true/true; 4 components, true/true; no section over `B`, false/false | holds | none |
| 2.4 `mextDeriv_invariantPart`, `…antiInvariantPart` (r27) | `τ ≡ c` on `ℝ`; `τ = id` | `df/2 = df/2`; `dφ = dφ` | holds | none |
| 9.2 `bijective_integral_…` (r27) | `M` a point; `M = ℝ` | `H⁰_c = ℝ`, integral `±` evaluation; `H¹_c(ℝ) = ℝ` by `∫` | holds | none |
| 9.2 nonorientable vanishing (r27) | open Möbius band | `H²_c = 0` | holds | none |
| 9.3 `bijective_poincarePairing` (r27) | `∅`; countable discrete, `k = l = 0`; `ℝ`, `k = 0`, `l = 1`; `[0, 1]` | `0 → 0`; `∏ℝ → (⊕ℝ)^*`; `1 ↦ ∫`; excluded by boundaryless (`[dx] = 0`, `∫dx = 1`) | holds | none |
| 10.3–10.4 degree formula (r27) | `id` on `S¹`; constant map; `o ↦ −o`; `n = 0` | `∫η = 1·∫η`; `0 = 0`; both sides negate; sign `±1` on a point | holds | none |
| 4.2–4.4 on `TauCeti.IntegralManifold.{u, u}` (r27) | constant family; contact family; rank 0; irrational line on `T²` | affine slice; `[∂y, ∂x + y∂z] = ∂z ∉ D`; point leaves; dense image | holds | none |
| 4.3 slice clause (r27) | `span(e₁)` on `ℝ²` | `id '' (ℝ × {0}) = univ ∩ (ℝ × {0})`, `finrank = 1` | holds | none |
| 5.6 punctured-plane family (r27) | general `α`; unit circle; `α = 1` | curl `2(1−α)ρ^(−α)`; integral `2π`; curl `0` | holds | none |
| 5.6 examples (r27) | ellipse; `P = \|x − ½\|, Q = x` | `πab`; area `1` | holds | none |
| 12.5 divergence theorem (r27) | half-line, `X = f∂t`; unit disc, radial `X`; `X = ∂t` | `−f(0) = −f(0)`; `2π = 2π`; excluded by the support hypothesis | holds | none |
| 12.5 `halfSpaceBoundaryMetric_continuous` (r27) | `n = 0`; flat half-plane | trivial fibre; `dy²` | holds | none |
| 11.1–11.2 hairy ball (r27) | `n = 0, 1, 2` | `v = 0` forced; `ix`, excluded by `Even`; vanishes at the poles | holds | none |
| 2.2 `exists_topForm_of_orientation` (r27) | `dim E = 0`; `ℝ` | `φ = 1 > 0`; `dx(e₁) = 1` | holds | none |
| 2.2 `orientable_iff_exists_atlas` (r27) | `Icc 0 1`; `∅` | excluded by boundaryless; true/true | holds | none |
| 2.2 `pullbackSign_mul_pullbackSign` (r27) | `ℝ`, charts `t`, `−t` | `(+1)(−1) = −1`, the transition sign | holds | none |
| 0.3 `isSmoothBundleForm_mpullback` (r27) | `f = id`; trivial bundle | `φ`; the native case | holds | none |
| 3.1–3.2 Banach flows (r27) | `v = 1`; `v = x²`; `ℓ²`, `v = Ax` | `x + t + u`; `1/(1/x − t)`; `e^{tA}x` | holds | none |
| 3.3 `exists_flowOf_one_eq` (r27) | `ℝ`, `0 ↦ 3` | `v = 3χ`, value `3` | holds | none |
| 3.4 bracket by flow, straightening (r27) | `v = ∂x`, `w = x∂y` | derivative `∂y`, bracket `∂y` | holds | none |
| 3.5 time-dependent flows (r27) | `v s x = s`; `v = x²`; `J = (0,1) ∪ (2,3)` | `x + (t² − s²)/2`; `x/(1 − x(t − s))`; outside the domain | holds | none |
| 5.4 radial primitive (r27) | `(y, x)`; `(−y, x)` | `g = xy`; `−1 ≠ 1`, excluded by closedness | holds | none |
| 5.4a moving pullback (r27) | `P = x + t e₁`, `ω = x dy` | `dy = 0 + dy` | holds | none |
| 12.1 `volume_circle` (r27) | round metric | `⟪iz, iz⟫ = 1`, volume `2π` | holds | none |

## Not verifiable

- [Lee], GTM 218, is not in the sources cache and is not open access. The changed passage keeps its citation [Lee, Ch. 16, "Densities"], unchanged from 03882f5. The previous report's list of Lee and Bott–Tu locators, checked from memory and not against the text, still applies.
- Ownership against open pull requests was checked only through the overlap report's vocabulary list (#2085, #1683, #1807, #1808, #992). The changed lines introduce no new owned object.

## Source issues

- none
