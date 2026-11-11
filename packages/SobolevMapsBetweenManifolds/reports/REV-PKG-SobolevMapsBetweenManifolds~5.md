<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12769#issuecomment-6797561090 -->
Review (claude) of 168c207

Verdict: needs_changes

1. **F01** (P3) a Mathlib declaration is cited under a namespace it is not in

   **Location.** `packages/SobolevMapsBetweenManifolds/README.md:250` (supplier contracts),
   `:1435` (§6.4 text) and `:1495` (§6.4 `*Needs:*`): "`MeasureTheory.integral_withDensity_eq_integral_toReal_smul₀`".

   **Claim.** The pinned Mathlib has a declaration of that fully qualified name at
   `Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean:311`.

   **Witness.** At the pin, line 311 of that file is `theorem integral_withDensity_eq_integral_toReal_smul₀`
   with no enclosing namespace (the file's last `end` before it is `end ContinuousMap`, line 156; it
   only `open`s `MeasureTheory`). `#check @MeasureTheory.integral_withDensity_eq_integral_toReal_smul₀`
   fails with "Unknown identifier".

   **Exact repair.** In the three places, write `integral_withDensity_eq_integral_toReal_smul₀`
   (root namespace); keep the file and line. Tested: after `import Mathlib`,
   `#check @integral_withDensity_eq_integral_toReal_smul₀` elaborates and shows the hypotheses the
   README states (an a.e. measurable density that is a.e. finite). The neighbouring
   `MeasureTheory.lintegral_withDensity_eq_lintegral_mul₀` is correctly namespaced
   (`Mathlib/MeasureTheory/Measure/WithDensity.lean:476`, inside `namespace MeasureTheory`, line 32)
   and needs no change.

One finding, P3, none blocking. Both findings of the previous review are repaired. The
acceptance file elaborates with `sorry` as its only warning, and no theorem in it is padding.
No file of the package was edited by this review.

## Verified sound

### Previous findings, checked first

| Previous finding | Repaired passage (`README.md`) | Status |
|---|---|---|
| F01 (P1), pointwise local boundedness of the chosen Jacobian | Lines 1447–1452: "Then `J_f` is locally essentially bounded: … `J_f` need not be locally bounded pointwise, since `Df` is fixed only outside a null set." Lines 1484–1491 add the null-modified identity as a Check; `TauCeti.isLocallyFiniteMeasure_riemannianVolume` is in the `*Needs:*` line (1499). | Repaired |
| F02 (P3), the discontinuity Check had no discontinuous member | Lines 956–961: "`u(x) = log |x|` on `ℝ²`, with `u(0) = 0`, lies in `W^{1,p}_loc(ℝ²; ℝ)` for `1 ≤ p < 2` … A definition requiring `u`, or some representative of `u`, to be continuous would reject it." | Repaired |

Pattern search after the repairs. I read every place where a pointwise property is claimed of the
chosen `Df`, `‖Df‖` or `J_f` (§5.1, §5.3, the Layer 5 and 6 Examples, §6.2, §6.3, §6.4, §7.1): each
is either stated almost everywhere or is a linear-algebra identity that holds for every linear map
(`|J| = normDet`, Hadamard), as the Totality convention says. I read every Check that claims to
separate the definition from a continuity-requiring one (§4.1, §4.2, §8.3): each now exhibits a
member with no continuous representative (`log |x|`, `x/|x|`). No second instance of either
pattern.

### Adversarial table

Integrals of a `p`-th power are written as such; `B` is the unit ball of the plane, `r = |x|`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §6.4 repaired sentence: `J_f ∈ L¹_loc` for a `C¹` open embedding | `id` on flat `ℝ` with `D(1/k) = k² id`; `f = 2x`; `n = 0`; `M = ∅` | Null-modified `id`: `sup_{(−ε,ε)} |j| = ∞`, essential sup `1 = ‖mfderiv id‖¹`; on `K = [0,1]`, `∫_K |j| = 1 ≤ 1 · vol(K) = 1`. `2x`: `|J| = 2 ≤ 2¹`, `∫_{[0,1]} = 2`. `n = 0`: `|J| = 1 = ‖·‖⁰`, compact sets finite, counting measure finite. `∅`: vacuous. | holds; pointwise claim would fail on the first |
| §6.4 new Check | against the identity, the orientation corollary, Hadamard, `|J| = normDet` | `j(1/2) = 4`, `j(1/10) = 100`, `j(1/100) = 10⁴`; `μ⁺([0,1]) = 1`, `μ⁻([0,1]) = 0`, sum `1 = vol(id([0,1]))`; Hadamard at `1/k`: `k² ≤ ‖k² id‖ = k²`; `normDet(k² id) = k²`. | consistent with §6.1–§6.4 |
| §4.1 new Check | `p = 1, 3/2, 2, ∞`; wrong model "has a continuous representative" | `∫_B |u| = 2π ∫_0^1 r|log r| dr = 2π/4 = π/2`; `∫_B |Du| = 2π ∫_0^1 dr = 2π`; `∫_B |Du|^{3/2} = 2π/(1/2) = 4π`; `p = 2`: `2π ∫ dr/r = ∞`; `p = ∞`: essential sup of `|u|` near `0` is `∞`, so no null modification is continuous. | discriminates; agrees with §1.2, §1.3, §4.2, §4.3 |
| §1.1 `MemLpLoc` | `s = ∅`; `|x|^{−1/2}`; `1/x` on `(0,1)`; `p = 0` | `∅`: restricted measure `0`, membership true. `∫_{−1}^1 |x|^{−p/2} = 4/(2−p)`: `4` at `p = 1`, `∞` at `p = 2`. `1/x ≤ 1/a` on `[a,b]`, `∫_0^1 dx/x = ∞`. `p = 0`: seminorm `0`, only measurability remains. | pass |
| §1.3 `memW1pLoc_iUnion` (T1(c)) | empty index type; half-planes with `sign(x₁)`; cover `{ℝ²∖0, B}` with `log r`; `p = ∞` | Empty: left side is membership on `∅` (true: `IsOpen ∅`, zero measure, no nonzero test function), right side vacuous. `sign(x₁)`: `Du = 0` on each half-plane, union omits the line, on `ℝ²` the derivative is `2δ` on the line. `log r`: `p < 2` on both sides. `p = ∞`: a compact `K` meets finitely many compact pieces, bounds `2`, `3` give `3`. | pass, both directions |
| §1.4 comparison with `TauCeti.W1p` | `x₁` on `B(0,1/2)`; `log r`, `p = 2`; `|x|`, `p = ∞`, `V` bounded and `V = ℝ` | `∫_{B(0,1/2)} |∇x₁|^p = π/4`. `∫_{B(0,1/2)} r^{−2} = ∞` on both descriptions. `|x|`: gradient bound `1` on bounded `V`; `ess sup_ℝ |x| = ∞`. `TauCeti.W1p` takes any Haar measure and `[Fact (1 ≤ p)]` (`TauCeti/Analysis/Sobolev/W1p/Basic.lean:372`), so `p = ∞` is statable. | pass |
| §2.2 `precomp_localDiffeomorph` (T1(a)) | `z ↦ z²`, `u = log|w|`; `θ = y³ + y`, `u = |x|`; `θ(y₁,y₂) = (y₁,0)`; `finrank E' ≠ finrank E` | `⟨z², 2zh⟩/|z|⁴ = 2|z|²⟨z,h⟩/|z|⁴ = 2⟨z,h⟩/|z|²` = derivative of `2 log|z|`. `(3y²+1) sign y`: bounded by `3b²+1` on `[−b,b]`, unbounded on `ℝ`. Projection: `∫_{[−1,1]²} |y₁|^{−1} = ∞`. Unequal dimensions: invertibility forces `Ω' = ∅`, both conclusions hold on `∅`. | pass |
| §2.3 `postcomp_boundedDerivative` | `G = id`, `u = x³`; `G = e^{t²}`, `u = log r`; `L < 0`; linear `G` | Mollified `x³` is `x³ + 3σ²ε²x`: `Du_ε − U = 3σ²ε²`, `L¹(−1,1)` norm `6σ²ε²`; `3σ²ε² > 6x²` iff `|x| < σε/√2`. `(log r)² ≥ −2 log r` iff `r ≤ e^{−2}`, so `G(u) ≥ r^{−2}`, `∫ r^{−2} r dr = ∞`. `L < 0`: hypothesis unsatisfiable unless `F = 0`. Linear: `|G(u)| ≤ ‖A‖|u|`. | pass |
| §2.4 `postcomp_continuous` (T1(b)) | `G = log` on `(0,∞)`, `u = r` on `ℝ²∖0` and on `ℝ²`; product | `D(log r)h = ⟨x,h⟩/r²` on both sides; at `0 ∈ Ω` the range hypothesis fails and `∫_B r^{−2} = ∞`. `D(t·t²) = t² + t·2t = 3t²`. | pass |
| §3.1 `isNullSet_iff_riemannianVolume_eq_zero` (T2) | dimension `0`; `4(dx²+dy²)`; `(1+|x₁|^{1/2})(dx₁²+dx₂²)`; half-line model; `M = ∅` | Dim `0`: Haar mass of `{0}` positive, counting measure; only `∅` null on both sides. Square: `1` and `√det(4I₂) = 4`; segment `0` for both. Conformal factor: `∫_0^1 (1+t^{1/2}) dt = 5/3`; segment `0`. Boundary point: Haar-null in `ℝ`, volume `0`. `∅`: both sides true. | pass, both directions |
| §4.1 `MemVectorW1pLoc` | atlas `{x³}`; `0`-manifold | `|y|^{1/3}`: derivative `|y|^{−2/3}/3`, `∫_0^1 y^{−2p/3} dy = 1/(1 − 2p/3)`: `3` at `p = 1`, `∞` at `p = 3/2`. Dim `0`: derivative applied to `v = 0` is `0`. | pass |
| §4.2 `MemManifoldW1pLoc`, `memManifoldW1pLoc_iff_atlases` (T2) | circle map of angle `|t|^{1/2}`; `id` with source atlas `{x³}`; `M = ∅` with a nonempty chart set; discontinuous `log r` | `∫_{−1}^1 (|t|^{−1/2}/2)^p = 2^{1−p}/(1 − p/2)`: `2` at `p = 1`, `∞` at `p = 2`. `y^{1/3}`: threshold `3/2`. Empty `M`: every chart has empty target, membership on `∅` true on both sides. `log r`: vector class yes (`p < 2`), continuous class no. | pass |
| §4.3 `HasWeakMDeriv`, `exists_hasWeakMDeriv` (T2) | `id`, chart `2x`; change at one point; non-Lindelöf source for uniqueness | Transport `1 · Df · (1/2) = 1/2` gives `Df = 1`; with `dφ` in place of its inverse, `1/4`. `{D ≠ D'} = {1}`, chart image a point, Haar measure `0`. Uniqueness: a chart source is second countable, so countably many `f⁻¹(ψ_y.source)` cover it and the chart image of `{D ≠ D'}` is a countable union of null sets, with no countability of `M`. | pass |
| §4.4 `contMDiff_memManifoldW1pLoc` (T2) | `t|t|`; `|t|`; Cantor function | `2|t| ≤ 2` on `[−1,1]`. `|t|` not `C¹`, in every class. Cantor: `c(1/4) = 1/3`, `c(3/4) = 2/3`, difference `1/3 ≠ 0 = ∫ c'`. | pass |
| §4.5 restriction, gluing, corestriction, metric copies | cover `{(0,∞), (−∞,0)}`; `tanh : ℝ → (−1,1)`; chart of `ℝ` at `2` | Circle map: every class on each ray, `p < 2` on `ℝ`; the cover misses `0`. `tanh' = 1 − tanh² ∈ (0,1]` in both readings. Chart at `2 ∉ (−1,1)`: identity, source meets `tanh(ℝ)`, representative `tanh`. | pass |
| §5.2 `memManifoldW1pLoc_iff_norm` (T3) | `|t|^{1/2}`; `t log|t|`; target metric `4dt²`; `M = ∅` | `‖D‖ = |t|^{−1/2}/2`: in `L^p_loc` iff `p < 2`, the range of the class. `|log|t| + 1|`: `∫_0^1 |log t + 1|^p < ∞` for finite `p`, essential sup `∞`. `4dt²`: `‖D‖ = 2‖D‖_flat`, same membership. `∅`: both true. | pass, both directions |
| §5.3 comparable metrics | `g' = c² g` on `N`; `dx² + 4dy²`; `e^{2x}dx²` | `‖A‖' = c‖A‖ = (α/b)‖A‖ = (β/a)‖A‖` with `a = b = 1`, `α = β = c`. `‖id‖' = 2 = β/a`. `‖id‖' = e^x`: bounded by `e^b` on `[a,b]`, unbounded on `ℝ`. | pass |
| §6.1 oriented Jacobian | `diag(2,1)`; `diag(−1,1)`; bases `a`, `b` on `ℝ`; `n = 0` | `J = 2 = det`, `normDet = 2`, `‖A‖² = 4`. `−1`, and `+1` to the reversed orientation. `n = 0`: `±1`, `normDet = 1`, `‖A‖⁰ = 1`. | pass |
| §6.2 chart formula in `jacobian_hadamard_integrability` (T4) | `id`, source chart `2x`, target `4dt²`, model bases `a`, `b ≠ 0`; `n = 0` | Derivation: `vol_N(Dv) = det[A] ε_N ρ_N = j ε_M ρ_M`, so `j = ε_M ε_N det[A] ρ_N/ρ_M`. Values: `det = a/(2b)`, `ρ_M = |a|/2`, `ρ_N = 2|b|`, signs `sign a`, `sign b`: `sign(a) sign(b) · a/(2b) · 2|b| / (|a|/2) = 2`; dropping `ρ_M` gives `1` at `a = b = 1`. `n = 0`: `ρ = 1`, empty determinant `1`, `j = ε_M ε_N = ±1`. | pass |
| §6.3 Hadamard and integrability (T4) | `x r^{−1/2}`; disc sum; `p = ∞`; `p = 1`, `n = 2`; `n ≠ finrank E` | Singular values `r^{−1/2}`, `r^{−1/2}/2`: `J = r^{−1}/2 ≤ r^{−1}`; `∫_B r^{−p/2} r dr < ∞` iff `p < 4`; `∫_B r^{−q} r dr < ∞` iff `q < 2 = p/n`. Discs: centres `2r_k` apart, radii sum `3r_k/2`; `λ_k r_k = k^{−1/2} → 0`; `Σ λ_k^p r_k² = Σ 2^{(p−2)k} k^{−p/2} < ∞` for `p < 2`; `π λ_k² r_k²/4 = π/(4k)`, divergent. `∞/n = ∞`. Exponent `1/2`: `∫ |j|^{1/2} ≤ ∫ ‖D‖`. An orientation carries `finrank = n` at every point (`fact_finrank_tangentSpace`, used at `TauCeti/Geometry/Manifold/Riemannian/VolumeForm.lean:55`), so `n ≠ finrank E` forces `M = ∅`. | pass |
| §6.4 `jacobian_changeOfVariables` (T4) | `2x`; `−x`; `z²` on an annulus; two components of opposite sign | `∫_0^1 2 = 2 = vol([0,2])`. `μ⁻([0,1]) = 1 = vol([−1,0])`. `2π ∫_1^2 4r³ dr = 30π` against area `π(16−1) = 15π`: injectivity excludes it. `1 + 1 = 2 = vol(image)`, signed value `0`. | pass |
| §7.1 `euclidean_compatibility`, `euclidean_volume`, `euclidean_jacobian` (T6) | `Ω = ∅`; sup norm on `ℝ²`; interval `(a,b)`; reflection; `z²`; dimension `0` | `∅`: left side vacuous over `x : Ω`, right side membership on `∅`, both true. Chart of `Ω` is the inclusion, target `Ω`, representative `u`, transported field `U`. Parallelogram values `2 ≠ 4`. `b − a` on both sides; `√det Gram(finBasis) · finBasis.addHaar = volume`. `J = −1 = det`. `4|z|² = |2z|²`. Dim `0`: volume `1`, `det = 1 = j`. | pass |
| §8.1 local retraction | circle; `s³`; figure eight | `r(v) = v/|v|`, `r(ι y) = y`. `(s^{1/3})'` unbounded at `0`. A retraction on each source patch. | pass |
| §8.2 `immersion_comparison` (T5) | circle map; `ι = s³`, `f = t^{1/3}`; double cover | `|D(ι∘f)| = |t|^{−1/2}/2 = ‖Df‖`; with `2ι`, `|t|^{−1/2}`. `ι∘f = id` in every class, `f` only for `p < 3/2`. `z²` after the half-angle map is the circle map, both `p < 2`. | pass, both directions |
| §8.4 `embedding_independence` (T7) | `N = ℝ`, `(s, exp exp s)`, `u = log log(1/r)`; double cover; `(z, z²)`; `N = ∅` | `2π ∫_0^{1/e} dr/(r log²(1/r)) = 2π [1/log(1/r)]_0^{1/e} = 2π`; second coordinate `1/r`, `∫ r^{−2} r dr = ∞`. Half-angle map: `ι₁∘u = z/|z|` smooth, `ι₂∘u` jumps. Gradients `1/r` and `√5/r`, threshold `2` for both. `N = ∅` forces `M = ∅`. Extension: `TauCeti.SmoothEmbedding.exists_contMDiffMap_extension_hasCompactSupport` takes `n : ℕ∞`, a `C¹` source and a smooth Hausdorff σ-compact ambient space (`TauCeti/Geometry/Manifold/SmoothEmbedding/Extension.lean:171`, `:201`). | pass |

### Sources: the seeded sample

Read at their locators in the three cached texts:

- §4.1, §8.2: Hajlasz2009 line 28 (printed p. 185) defines the class through the ambient
  vector-valued class and the constraint almost everywhere, for compact manifolds (lines 23–27).
- §4.2, §4.3, §6.2, §6.3: HeikkilaPankka2025 lines 22–27 (p. 1): continuous maps in
  `W^{1,n}_loc(M, N)` between oriented Riemannian `n`-manifolds, the operator norm of the weak
  differential and the Jacobian determinant. The source uses the class and the differential without
  constructing them; the README attaches the construction to its own chart gluing and cites these
  lines for the notions only.
- §5.3: Hajlasz2009 lines 104–106 (p. 187): Riemannian metrics on a compact manifold are
  equivalent; lines 106–107: a closed manifold is compact without boundary.
- §7.1: MartioRickmanVaisala1969 line 124 (the Jacobian `J(x, f)`), lines 332–340 (Definition
  2.16, `ACL` and `ACL^p`). The README states that no statement or proof uses the `ACL`
  description, and none does.
- §8.2: HeikkilaPankka2025 lines 1328–1329 (Appendix B, p. 24): the class through a Nash
  embedding; the README writes the composite in the type-correct order.
- Also read: Hajlasz2009 lines 129–130 (Theorem 2.1, `p > dim M`), 138–141 (`p = dim M`), 37–53
  (weakly `p`-harmonic maps), cited for the Part II scope.

All eight cited works are in `sources.toml`, one key each; no entry was added or changed.

### Library declarations at the pins

Every backticked library name of the README was resolved: 89 by `#check` in one scratch file
against the pinned Mathlib and the built Tau Ceti modules, 17 in modules without object files by
reading the declaration and its enclosing namespace in the pinned source. All exist under the cited
names except R01. Declarations read for what they say:

- `TauCeti.HasWeakFDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`, through
  `HasWeakLineDerivOn`, `:212`): completeness of the codomain, local integrability of `u` and of
  each `x ↦ U x v`, and the test-function identity. No `Lᵖ` demand and no continuity.
- `TauCeti.IsNullSet` (`TauCeti/Geometry/Manifold/Measure.lean:36`): every preferred chart and every
  Haar measure; no measurability of the set, no separation axiom.
- `TauCeti.riemannianVolumeForm` (`TauCeti/Geometry/Manifold/Riemannian/VolumeForm.lean:55`): the
  fibrewise `volumeFormL`, with the dimension fact supplied by the orientation.
- `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`
  (`TauCeti/Analysis/Calculus/Sard/LowDimension.lean:73`): source of strictly smaller dimension, any
  set, as §2.1 uses it.
- `TauCeti.W1p` (`TauCeti/Analysis/Sobolev/W1p/Basic.lean:372`), `TauCeti.W1p.compL`
  (`…/W1p/ChangeOfVariables.lean:274`), `TauCeti.W1p.hasWeakFDerivOn_comp` (`…/W1p/ChainRule.lean:375`,
  `p ≠ ∞`, `C¹` with bounded derivative).
- The fifteen `file:line` locators of the supplier contracts were opened; each line is the named
  declaration.

Duplication by object: the pinned Tau Ceti has no comparison of `IsNullSet` with
`riemannianVolume` and no flat-space identification of `riemannianVolume` (the only hit is
`UpperHalfPlane.riemannianVolume_eq_volume`, for the Poincaré metric). No pinned declaration states
any of the 16 theorems.

### Cross-roadmap citations, ownership, order

Resolved on main: PDE Layer 1 (`TauCetiRoadmap/PDE/README.md:675`); GeometricCurrents G6 (`:668`,
the local classes at `:750`); PseudoholomorphicCurveAnalysis §1.1 (`:213`), §1.2 (`:279`), §4.1
(`:807`); SobolevPolynomialApproximation §2.1 (`:324`); PseudodifferentialOperators §5.2 (`:967`);
RiemannianGeometry R4.6 (`:120`); DifferentialGeometry Layers 2 and 12 (`:1005`, `:2796`);
GeometricMeasureTheory G2 (`:148`). Resolved at open heads: TeichmullerGeometry §7.4,
SobolevDifferentialForms §4.1, QuasiregularMaps §2.8. None of the open ones is a supplier.

`TauCetiRoadmap.PseudoholomorphicCurveAnalysis.MemLpLoc` on main
(`TauCetiRoadmap/PseudoholomorphicCurveAnalysis/Suggested.lean:47`) is the planar case of this
package's `MemLpLoc`, with the same body; the fully qualified names differ and the README's scope
and §1.1 Check state the relation. No other roadmap's `Suggested.lean`, on main or open, declares
any of the 21 names. QuasiregularMaps (open) consumes this roadmap through declared gaps and cites
only sections that exist here. The overlap ledger lists no pull request changing this roadmap, no
dropped id and no id defined only by a revision. There are no declared supplier gaps and no
maintainer notes.

Dependency check, the brief's command:

```text
depcheck: 223 roadmaps, 1966 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The citation resolver lists nothing missing.

### Acceptance file

- Elaboration from the content checkout: exit 0, 16 warnings, each "declaration uses `sorry`".
- One-tactic probe on a scratch copy, every theorem: `first | rfl | (simp; done) | infer_instance |
  (exact?) | sorry`. All 16 fall through to `sorry`; no "Try this". No padding.
- Binders: the 21 elaborated types were compared with the README. None lost a section variable;
  `isNullSet_iff_riemannianVolume_eq_zero` carries no boundarylessness, as §3.1 says, and the later
  theorems carry both.
- Headlines: T1 (4 theorems), T2 (4), T3 (1), T4 (2), T5 (1), T6 (3), T7 (1) are stated; the module
  docstring says all are statable. The two unstated clauses (metric comparison in T3, the isometric
  norm identity in T5) are one-step consequences of the definition of the operator norm and of
  `LinearIsometry.norm_toContinuousLinearMap_comp`, and are rightly left to the README.
- Five definitions, each with a real body on native carriers and each needed by a headline. No
  sorry'd data, `set_option`, `lemma`, `example`, `#eval` or placeholder. Imports: `import Mathlib`
  and six `TauCeti.*` modules, each used.
- Every Lean name appears in the README and every backticked name of the roadmap's own is declared.

### Shape and principles

Title, Summary, scope, conventions, supplier contracts, build paragraph, eight layers each ending
in Examples and Dependencies, consumers, worked examples, references. 29 numbered sections, 29
`*Needs:*` lines, consistent with the layer dependencies and the build paragraph. Every definition
has at least three Checks (§1.1: 5, §1.2: 6, §4.1: 4, §4.2: 4, §4.3: 4, §5.1: 3, §6.1: 5, §6.2: 5,
§6.4: 6, §8.3: 3). The layers are named by their mathematics. No process residue, pull-request
number, date, machine path, HTML anchor or LaTeX delimiter. No algorithm, no copied passage.

Remark, no change needed: `jacobian_changeOfVariables` assumes a bijective differential; the
identity also holds for an injective `C¹` map without it, but the hypothesis is the README's
definition of a `C¹` open embedding.

## Not verifiable

- Ziemer1989 (Ch. 2 §2.1, Theorems 2.1.11, 2.2.2), Mazya2011 (§1.1), Rickman1993 (Ch. I §1),
  Lee2012 (Ch. 4, 6, 15, 16), Bethuel1991 (Introduction): settled as uncertified, no text to read.
  This covers the source locators of the sampled §1.1, §1.3, §1.4, §2.3, §4.4, §4.5 and §8.1; their
  mathematics was checked independently above.
- MartioRickmanVaisala1969: the printed page number of line 124 is not legible in the extraction;
  the line itself was read.
- 17 Tau Ceti declarations live in modules without object files; they were read in the pinned
  source, not elaborated.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, printed p. 24 (line 1328): the source says the manifold map is applied after the Nash embedding; it should be the embedding applied after the manifold map; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "168c20783f026cc77528169e2761565520d46581", "job": "REV-PKG-SobolevMapsBetweenManifolds~5", "model": "fable", "worker": "chris-x10"} -->
