# Review of GeometricCurrents (pull request #2490 at 5541bd8)

**Verdict:** needs changes

**Summary.** Changes are needed because of one finding, which is in `Suggested.lean` and predates this change. Two definitions there have `sorry` bodies, so none of the six theorems stated about them can be proved. No defect was found in the mathematics of the new G3a: every Check was recomputed and holds, and so do the route for the Lipschitz bound on volume, the filling of the segment pair and the current comparison. There are five small corrections, the main one being that the filling volume function's supremum also ranges over cycles that do not bound, which the cited source excludes by a connectivity hypothesis. There are also four format notes. The humans decide whether this README-only pull request should carry the repair to the Lean file.

## R01 (P2) — `Suggested.lean` defines the mass measure and the interval current by `sorry`, so the six theorems stated about them can never be proved

The file is the roadmap's acceptance test. A theorem about a definition whose body is `sorry` is about an opaque term, so `isLocallyFiniteMeasure_massMeasure`, `massMeasure_open`, `massMeasure_univ`, `eval_le_lintegral_massMeasure`, `intervalCurrent_apply` and `boundary_intervalCurrent` (lines 112–182) ask an implementer for something no proof can supply. Elaborating the file at the pins reports `sorry` on the two definitions themselves, at `massMeasure` (line 108) and `intervalCurrent` (line 175). `#check @massMeasure` also shows that its type keeps only `[MeasurableSpace E]` and loses the section's `[FiniteDimensional ℝ E]` and `[BorelSpace E]`. As written, then, it claims a Radon mass measure on every inner-product space, which G1's construction (Riesz representation, which needs local compactness) does not give. This text is on main and this change does not touch it, but it is in the folder under review.

The smallest repair has two parts. First, give `intervalCurrent` a real body: the functional `ω ↦ ∫ x in a..b, ω x ![1]`, for example built from `TestFunction.toBoundedContinuousFunctionCLM`, evaluation at `![1]` and the interval integral on bounded continuous functions, with bound `|b − a|`. Its two theorems then become real targets. Second, replace `massMeasure` and its four theorems with one existence statement carrying `[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]` in its own signature: for `T` of locally finite mass there is a unique locally finite measure `μ` on `Ω` with `μ U = localMass T U` for every open `U`, and with `|T ω| ≤ ∫ ‖ω‖ dμ`. Alternatively, keep the mass measure only as the G1 target in the README.

## C01 — The filling volume function ranges over all cycles, while Leuzinger–Young define it only on (d−1)-connected spaces

A reader takes `fillingVolumeFunction` (line 589) to be the invariant of the cited paper. Without the paper's hypothesis, though, it is `∞` as soon as some cycle of mass at most `V` does not bound. Leuzinger–Young define FV^d_Y only when Y is (d−1)-connected (LeuzingerYoung2017 line 754, p. 16). Without that hypothesis the definition gives these values:

- On the round unit circle in degree 2, the fundamental 1-cycle has mass `2π` and no filling, so the function is `∞` for `V ≥ 2π`.
- In degree 1 a single point `⟨y⟩` is a 0-cycle of mass 1, and every boundary of a 1-chain has coefficient sum 0, so the function is `∞` for `V ≥ 1` on every nonempty `Y`. This also happens in the paper's own convention.

Two repairs are possible. One keeps the general definition: say in the citation sentence that it agrees with Leuzinger–Young's FV^d_Y on (d−1)-connected `Y`, and add these two values as negative-control Checks. The other takes the supremum over cycles that bound.

## C02 — `simplexVolume` is already a Tau Ceti declaration with a different meaning

`TauCeti.simplexVolume (m : ℕ) (t : ℝ) : ℝ` is the Lebesgue volume of the part of the unit cube below the hyperplane `Σ xⱼ = t` (`TauCeti/MeasureTheory/Measure/Lebesgue/SimplexVolume/Basic.lean:58`). A reader who searches the pin for the G3a name (line 550) finds that object, and an implementer working in the `TauCeti` namespace cannot reuse the name. A distinct name, for instance `lipschitzSimplexVolume`, would resolve this, together with its `_map_le` lemma.

## C03 — G3 still builds the basic API of the Lipschitz subcomplex that G3a now owns

G3 says that the Lipschitz singular complex is a new subcomplex and asks to "build its basic API and both comparison maps" (lines 437–439). G3a now builds that carrier with boundary, support and pushforward for every metric space, and says it is G3's complex, so a reader of G3 alone sees two owners. One fix would rewrite G3's sentence: the complex is G3a's `lipschitzChainComplex` of M, or of X with the restricted distance, and G3 builds both comparison maps.

## C04 — The dependency line for G3a's first part leaves out the subdivision its route uses

The proof of `simplexVolume_map_le` sums over the iterated barycentric subdivisions of Δᵈ and needs their diameters to tend to zero (line 560). The dependency line at line 1071 lists only native singular chains, Hausdorff measure and Lipschitz maps. That subdivision is AlgebraicTopology Layer 3 (`TauCeti.singularSubdivision`, `TauCeti/AlgebraicTopology/Singular/Subdivision/Basic.lean:227`), so add it to that line's inputs.

## C05 — Ambrosio–Kirchheim state the metric area formula for an arbitrary metric target, not only in w*-separable dual spaces

Line 578 says formulas (9.2)–(9.3) are "stated in w*-separable dual Banach spaces". In the preprint (§9, item (2), pp. 41–42) they are written for a Lipschitz map from ℝᵏ into any metric space E. The metric differential is noted there to exist for every metric target, and the w*-separable setting is that of the w*-differential. A correct version would read "stated for Lipschitz maps from ℝᵏ into any metric space".

## N01 — `Suggested.lean` imports submodules instead of the single line `import Mathlib`

Lines 1–5 import five `Mathlib.*` submodules; this text is on main.

## N02 — Ten names in code font in G3a are declared nowhere

`LipschitzChain`, `lipschitzChainComplex`, `simplexVolume`, `lipschitzMass`, `lipschitzMass_Z`, `simplexVolume_map_le`, `fillingVolume`, `fillingVolumeFunction`, `fillingVolume_le` and `fillingVolume_lt_top_iff` read as declarations. Every carrier that `simplexVolume_map_le` and `fillingVolume_lt_top_iff` need exists at the pin (`singularChainComplexFunctor`, `μHE[d]`, `LipschitzWith`), so the file could state those two with short real definitions. Otherwise, mark the names as proposed.

## N03 — Commit-pinned links and TeX fragments in the README

Six links into this repository are pinned to commits (lines 47, 81, 92, 93), and the TeX fragments `W^{2,p}_loc` and `C^{2,α}` stand outside code spans (lines 861, 919, 923, 931); both are on main.

## N04 — The module docstring does not name the headline theorems that cannot be stated at the pins

Interior regularity for 2 ≤ n ≤ 7 is one such headline. The docstring should also say which carrier each one lacks (integral currents on a manifold).

## Verified sound

| Statement | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| G3a Lipschitz chains, ∂, support, pushforward | 1-simplex; constant 2-simplex; d = 0 | `∂σ = ⟨σ(e₁)⟩−⟨σ(e₀)⟩` vs RS line 210; constant: `c−c+c = c` vs RS line 339 | agrees | none |
| `simplexVolume`, `lipschitzMass` | d = 0; Δ² ⊂ ℝ³; doubled circle; constant 1-simplex | 1 / counting; `√3/2 ≈ 0.866` vs raw `2√3/π ≈ 1.103`; `4π` vs `H¹(image) = 2π`; `∞·0 = 0` | all Checks hold | none |
| `simplexVolume_map_le` route | point y with preimages split between children; skeleton images | each child count ≥ parent count; `Hᵈ(f σ(Δ^{d−1})) ≤ Lᵈ·0 = 0` | monotone convergence valid | C04 |
| `simplexVolume ≤ Lip(σ)ᵈ Hᵈ(Δᵈ)` | d = 1, 2 | `Hᵈ(Δᵈ) = √(d+1)/d!`: `√2`, `√3/2` (finite) | holds | none |
| Riemannian area formula | Δ² ↪ ℝ³; doubled circle on Δ¹ of length √2 | `√det = 1`, integral `√3/2`; speed `4π/√2` over length √2, integral `4π` | matches definition | none |
| `M([α]) ≤ lipschitzMass α` | σ − σ∘ρ, ρ(1−s,s) = (1−s²,s²); doubled circle | `0 < 2ℓ` (strict); `M(2[[S¹]]) = 4π = 4π` | holds | none |
| `fillingVolume 1 (⟨y₁⟩−⟨y₀⟩)` | segment; projection p with IVT | upper `|y₁−y₀|`; lower `∫ Σ|cₖ|#(pσₖ)⁻¹(t) dt ≥ |y₁−y₀|` | equality | none |
| `fillingVolume_lt_top_iff`, finiteness iff class 0 | `⟨y⟩` alone; unit circle fundamental cycle | coefficient sum 1, no filling, `∞`; nonzero H₁, `∞`; antipodal pair at most `π` | consistent | none |
| `fillingVolume 2 (σ−σ′) = 0` | prism plus constant 2-simplices | `∂(const at a) = c_a`; images in segment, `H² = 0` | holds | none |
| `fillingVolumeFunction` | S¹, d = 2, V = 2π; d = 1, V = 1 | `∞` (non-bounding cycle); `∞` from `⟨y⟩`; LY line 754 assumes (d−1)-connected | domain wider than source | C01 |
| `massMeasure` (line 108) | elaborated type | keeps `MeasurableSpace E`; drops `FiniteDimensional ℝ E`, `BorelSpace E`; body `sorry` | unprovable theorems | R01 |
| `intervalCurrent` (line 175) | elaboration | `sorry` at 175:4; `_apply` and `boundary_` are about an opaque term | unprovable theorems | R01 |
| `mass_diracZeroCurrent` (one-tactic probe) | `simp [mass]`; `exact?` | simp leaves a `⨆` goal; exact? finds only itself | not padding | none |
| G3a name `simplexVolume` | Tau Ceti pin | `TauCeti.simplexVolume m t` is the cube-below-hyperplane volume, a different object | clash | C02 |
| AK citation, line 578 | AK §9 item (2), pp. 41–42 | (9.2)–(9.3) are over any metric space E | attribution narrower than source | C05 |
| Roadmap headline: interior regularity 2 ≤ n ≤ 7 | statability at pins | needs integral currents on a manifold, which is not a pinned carrier | not statable; not named | N04 |

- Source locators checked against the text: 7 (RiedwegSchaeppi2009 §2.2, Def 2.4, pp. 4–5, lines 191–250; LeuzingerYoung2017 §2.4, pp. 15–17, lines 673–782, four in-text locators and one in the References; AmbrosioKirchheim2000 §9, item (2), pp. 41–42).
- Library declarations opened at the pin (8): `Measure.euclideanHausdorffMeasure` (Mathlib/Geometry/Euclidean/Volume/Measure.lean:68, `_zero` :82); `LipschitzWith.hausdorffMeasure_image_le` (Mathlib/MeasureTheory/Measure/Hausdorff.lean:745); `LipschitzWith.ae_differentiableAt` (Mathlib/Analysis/Calculus/Rademacher.lean:386); `StdSimplex` (Mathlib/Geometry/Convex/ConvexSpace/Defs.lean:61); `SimplexCategory.toTop` (Mathlib/AlgebraicTopology/TopologicalSimplex.lean:44); `singularChainComplexFunctor` (Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:37); `TauCeti.singularSubdivision` (TauCeti/AlgebraicTopology/Singular/Subdivision/Basic.lean:227); `TauCeti.simplexVolume` (TauCeti/MeasureTheory/Measure/Lebesgue/SimplexVolume/Basic.lean:58).
- Cross-roadmap citations resolved: GeometricMeasureTheory G2's area formula with multiplicity (main), HopfRinow L0 (Completed), internal G2/G3, AlgebraicTopology Layer 3. VariationalMethods 2.3 exists on main, so the resolver's "no V2.3" lead is only the V prefix.
- Dependency check: `depcheck: 218 roadmaps, 2356 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings and no errors; two of them are on definitions (108:4, 175:4).
- `#check @name`: all 25 elaborated types were compared with the README. `massMeasure` lost `[FiniteDimensional ℝ E] [BorelSpace E]`; the others carry their binders.
- Wording: the whole README was compared mechanically with LeuzingerYoung2017 and RiedwegSchaeppi2009 (longest shared run 8 words, the RS title in the References). Six G3a passages were compared by hand with LY lines 705–758, RS lines 191–250 and AK §9 (2).
- Overlap check: read MinimalSurfaces, Varifolds and GeometricMeasureTheory (also CalibratedGeometry), and searched every roadmap for filling volume, Dehn functions, Lipschitz chains and metric currents. The one shared object is the Euclidean area formula with multiplicity, owned by GeometricMeasureTheory G2 and consumed by G3a; nothing else is shared.

Source independence: 6 G3a passages compared by hand with 3 sources and the whole README compared mechanically with 2, none shared; largest share LeuzingerYoung2017, 5 of 8 source locators; contents compared with LeuzingerYoung2017 §2.4: independent. The order chains → mass → filling is forced by the definitions, and G3a's Hausdorff-measure definition, pushforward bound, area formula and current comparison are not in §2.4.

Research link: G3a's filling volume and filling volume functions are the invariants in which Leuzinger–Young (2017) state their filling bounds for arithmetic groups; their Theorem 2.12 (Gromov 1983, Wenger 2008) bounds them on CAT(0) spaces. G6's interior regularity is the minimizing-hypersurface input to nonspin positive mass. Rests on LeuzingerYoung2017 §2.4 and the README.

## Not verifiable

- Federer, *Geometric Measure Theory* (References only, outside the sample): no open legal copy; not opened.

Automatic checks set aside as false positives: the dropped-name hit on line 1102 names HomotopySpheres as a consumer of CalibratedGeometry C1's later comparisons, not as a supplier of this roadmap.

## Source issues

- **Misprint** in LeuzingerYoung2017 at §2.4, formula (11), p. 16: the source says the integrand evaluates f at the image under the whole chain α; it should be f at the image under the i-th simplex αᵢ of the sum; affects nothing.
- **Gap** in LeuzingerYoung2017 at §2.4, p. 16: the source says the chain integral is defined for continuous f and then applies it to the indicator of an arbitrary subset Z; it should require Z Borel and extend the integral to bounded Borel functions; affects nothing.

## For the human reviewers

- R01, N01, N03 and N04 concern `Suggested.lean` and README lines that are on main and that this README-only pull request leaves unchanged (`Suggested.lean` lines 1–5, 108 and 175). Whether this pull request or a separate one carries the repair is for you to decide.
- Licence: AmbrosioKirchheim2000 was read from the Max Planck Institute MiS preprint repository (files-www.mis.mpg.de), a host the sources service does not classify; I treated it as institutional.
