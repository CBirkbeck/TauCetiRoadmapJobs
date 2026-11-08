<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7613#issuecomment-6700801233 -->
Review (claude) of 38117fb

Verdict: needs_changes

1. **F01** (P3) §6.1 attributes local finiteness to a lemma that does not yield it

   **Location.** `packages/QuasiregularMaps/README.md` line 1287: "every compact subset of `M`
   meets `κ(σ)` for only finitely many simplices `σ`, so `K` is locally finite
   (`AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact`)"; the `*Needs:*` line of
   §6.1 at line 1337.

   **Claim.** The pinned lemma gives the first bullet of §6.1 and hence local finiteness.

   **Witness.** At the pin, `TauCeti/AlgebraicTopology/SimplicialComplex/Realization/Compact.lean`
   line 128: for compact `s`, `∃ V : Finset ι, ∀ x ∈ s, x.1.support ⊆ V`. This says `s` lies in a
   finite subcomplex. It does not bound the simplices meeting `s`: in the infinite star (one vertex
   `v`, infinitely many edges) `{v}` is compact, lies in the subcomplex on `{v}`, and meets every
   edge. That the star cannot triangulate a manifold is exactly what the route must use, and it
   uses the local compactness of `M` and the weak topology of the realization, which the lemma
   does not contain. The statement is true; the route as written is circular (finiteness of the
   simplices met is what local finiteness means).

   **Repair.** In the first bullet of §6.1, replace the parenthetical by the route: "`M` is locally
   compact (Mathlib `ChartedSpace.locallyCompactSpace`), so each point `p` of the realization has a
   compact neighbourhood `C`, which lies in a finite subcomplex
   (`AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact`); every neighbourhood of
   `p` meets the open simplex `σ°` of each simplex `σ` containing the carrier of `p`, since
   `(1 − t) p + t b_σ → p` as `t → 0` with `b_σ` the barycentre, and a point of `C ∩ σ°` has carrier
   `σ`, so `σ` is a face of that finite subcomplex; hence finitely many simplices contain the carrier
   of `p`, `K` is locally finite, and a compact set, covered by finitely many such neighbourhoods,
   meets finitely many `κ(σ)`." Add Mathlib `ChartedSpace.locallyCompactSpace`
   (`Mathlib/Geometry/Manifold/ChartedSpace.lean` line 244) to the `*Needs:*` line of §6.1 and to
   the Mathlib supplier contract. Tested on the witness: the infinite star has no compact
   neighbourhood of `v` in the weak topology, so the repaired route does not apply to it, and for a
   locally finite complex the argument returns the finitely many simplices at each vertex.

One P3 finding, nothing blocking. Everything else checked is sound: the Lean file elaborates
with the five `sorry` warnings as its only output, none of its five sorried theorems closes by
one tactic, the three headline theorems statable at the pins are stated and the five that are
not are named in the module docstring with the carrier they lack, the seeded sample of fifteen
targets agrees with the certified sources at every cited line, every library declaration the
package cites was opened at the pin, every cross-roadmap citation resolves on main or at the
cited open head, and the dependency check reports no problem. The seven declared supplier gaps
are precise, minimal and declared in both `plan.json` and the README. Acceptance after the fix
round would be conditional on them.

## Verified sound

**Principles.** No route-specific shortcut: every manifold statement is on the general class in
every dimension `n ≥ 1`, with the sources' `n ≥ 2` noted in the Conventions and the Euclidean
statements carrying no dimension hypothesis (the `n = 0` values are computed in the table). No
re-planned roadmap: the Sobolev class is consumed through declared gaps from the board target
`packages/SobolevMapsBetweenManifolds/target.md` (its T1 at line 141, T2 at 151, T3 at 160, T4 at
166, T6 at 181, scope items 1–5 at lines 23–75 read and compared with the seven `needs`
sentences), quasiconformal maps from TeichmullerGeometry §7.4, orientations, null sets, the
Riemannian volume, quotient metrics and realizations from Tau Ceti. Supply is downward only.
No passage of a source is copied: the three certified texts were compared at every cited line.
No computational algorithm. No sorry'd data, no `set_option`, no `lemma`, no `#eval`.

**Elaboration.** `lake env lean` on `packages/QuasiregularMaps/Suggested.lean` from the content
checkout, real time 3.0 s, output exactly five lines, `declaration uses sorry` at 106:8, 122:8,
175:8, 191:8, 205:8. The file begins with `module`, as 26 of the 142 `Suggested.lean` files on
main do. Imports: `import Mathlib` and `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, whose object
file was present. The elaborated signatures of the ten declarations (`scratch/signatures.md`)
were compared one by one with the README statements of §1.1, §2.9, §3.2 (Euclidean form), §5.1,
§5.2 and §5.3: the binders agree, including `[FiniteDimensional ℝ F]` on the two §5.2 theorems
and on §5.3 through `EuclideanSpace`, `1 ≤ p` on `isACLpOn_iff_exists_hasWeakFDerivOn` and
`1 ≤ K` on `isQuasiregularOn_iff_isACLpOn`; nothing lost a section binder.

**Dependency check.** Output of the gate command on the README, unchanged by this review:

```
depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
```

No UPWARD or CYCLE line. QuasiregularMaps is at line 272 of the merge order, directly after
TeichmullerGeometry (271), its only supplier that is an open pull request; FourManifolds (125),
named under Downstream consumers as a supplier of Part III, precedes it. DifferentialGeometry,
RiemannianGeometry, GeometricTopology and PDE are roadmaps on main.

**Padding probe.** On a copy in the scratch directory each `sorry` was replaced by `simp`, and
on a second copy by `first | rfl | infer_instance | simp_all` (for the two `iff`s
`first | exact Iff.rfl | rfl | simp_all`). Every one of the five fails (`simp made no progress`
at lines 113, 129, 184; unsolved goals at 198 and 211; `simp_all made no progress` on the second
copy). The one proved `example` (the identity is `1`-quasiregular) tests satisfiability of
`IsQuasiregularOn` through the pinned `TauCeti.hasWeakFDerivOn_of_differentiableOn`; it is the
only example and is kept.

**Headline theorems.** From the Summary:

| headline | in `Suggested.lean` |
| --- | --- |
| `K_I ≤ K_O^{n−1}`, `K_O ≤ K_I^{n−1}` on Euclidean domains | `IsQuasiregularOn.det_le_pow_mul_minimalStretch_pow`, `IsQuasiregularOn.of_det_le_mul_minimalStretch_pow` |
| the same between manifolds | docstring: not statable, lacks `W^{1,n}_loc(M, N)` |
| `ACL^p = W^{1,p}_loc` for continuous maps | `isACLpOn_iff_exists_hasWeakFDerivOn`, `ae_hasLineDerivAt_of_hasWeakFDerivOn`; agreement with Definition 2.20: `isQuasiregularOn_iff_isACLpOn` |
| simplicial maps are quasiregular | docstring: not statable, same carrier |
| ellipticity independent of metric and orientation | docstring: not statable |
| flat manifolds `1`-elliptic | docstring: not statable |
| branched coverings by tori | docstring: not statable |

The Euclidean form is MartioRickmanVaisala1969 (2.25) in the setting of its own proof (line
438, with Definition 2.20 at 409–412 on domains of `ℝⁿ`), stated in §3.2 as its own target, so it
is not a stand-in. Neither Mathlib nor Tau Ceti has a class of Sobolev maps between manifolds at
the pins (`TauCeti/Analysis/Sobolev` is Euclidean; the manifold Sobolev file is a scalar `C¹`
inequality), so the five docstring entries are correct. Every backticked name the README
attributes to the roadmap (`minimalStretch`, `IsQuasiregularOn`, the two §3.2 theorems,
`formalDeriv`, `IsACLOn`, `IsACLpOn`, the two §5.2 theorems, `isQuasiregularOn_iff_isACLpOn`) is
declared, and every Lean name appears in the README. The two names `roadmaps resolve` lists
(README lines 909 and 912) are these own declarations.

**Sources: the seeded sample.** Certified texts read at the cited lines; the uncertified ones
cited by locator only (listed under Not verifiable).

| target | locator | read | result |
| --- | --- | --- | --- |
| 1.3 | MRV (2.25) line 438; (2.21)–(2.22) 411–416 | yes | (2.25) is `K_O ≤ K_I^{n−1}`, `K_I ≤ K_O^{n−1}`, line 439 best possible; the Lean docstrings name first and second inequality in the source's order |
| 1.4 | MRV (2.23) 426–430, (2.24) 435 | yes | (2.23) is the Hilbert–Schmidt form with `n^{n/2}`; (2.24) `K_S ≤ K_O ≤ n^{n/2} K_S`, best possible (436) |
| 2.1 | HP 22–27; Prywes 22–26; MRV Def 2.20 409–412 | yes | HP: `W^{1,n}_loc`, `‖Df‖ⁿ ≤ K J_f` a.e., `n ≥ 2`, `K ≥ 1`; Prywes: closed connected orientable target, `J_f = det Df`; MRV: `ACLⁿ`, `K ≥ 1` |
| 2.2 | MRV 412–413, 418–419 | yes | least `K ≥ 1`; `∞` for non-quasiregular maps |
| 2.3 | MRV 412–413 | yes | "the smallest `K ≥ 1`" exists: the attainment statement |
| 2.5 | Rickman1993 Ch. I | no (uncertified) | locality is also HP's class definition read on charts (22–23); cited by locator |
| 2.9 | MRV Def 2.20; Prywes 22–26 | yes | as above; `J(x, f)` of line 124 is the Jacobian of the formal derivative |
| 3.1 | MRV 413–419 | yes | inner dilatation defined for quasiregular `f` only (414), `K(f) = max`, "`K`-quasiregular" means `K(f) ≤ K` (418) |
| 4.2 | HP 20–27 | yes | oriented manifolds; the sign law is linear algebra on `J_f` |
| 5.2 | Vaisala1971 Ch. 3; Rickman1993 Ch. I | no (uncertified) | the definition it identifies is MRV 332–340, read; see the table row |
| 5.3 | MRV Def 2.20, (2.21) 409–411; 412–419 | yes | right-hand side is exactly Definition 2.20 |
| 6.2 | HP Prop. B.1 1247–1251; 1322–1327 | yes | closed oriented PL Riemannian `n`-manifolds, `n ≥ 2`, non-degenerate orientation-preserving PL map; local diffeomorphisms `ϕᵢ` at 1323–1327 |
| 6.3 | HP Lemma B.2 1255–1260; proof 1261–1316 | yes | closed `M`, continuous `ρ` with a smooth extension on each `n`-simplex, `ρ ∈ W^{1,∞}`; proof by Stokes |
| 7.2 | HP 20–21 | yes | ellipticity for connected oriented `N` |
| 7.3 | HP 20–27 (through §4.1) | yes | the class and the inequality; comparability is the roadmap's own argument |

Also read: MRV 117–127 (formal derivative, `J(x, f)`, `ℓ(T) = min |Tx|` over `|x| = 1`),
332–340 (Definition 2.16: open `n`-intervals with closure in `U`, segments of the closure,
`m_{n−1}(E_i) = 0`, `p ≥ 1`), 420–425 (quasiconformal agreement; the projection), 440–444
(Lemma 2.26); HP 32–34, 52–57, 84–96, 271–273, 1234–1245 (the piecewise smooth definition asks
for an extension `λ` of `κ|σ` to a neighbourhood, as the README says), 1317–1339; Prywes 28–65.
Every locator in the References block is consistent with these reads, and all eleven cited
works are recorded in `sources.toml` with the `cited_for` sections the README uses.

**Library declarations opened at the pins.** Mathlib (`Mathlib/…`):
`LinearMap.singularValues` (Analysis/InnerProductSpace/SingularValues.lean 95: a finsupp on `ℕ`,
zero at and beyond `finrank`), `singularValues_antitone` (142),
`injective_iff_forall_lt_finrank_singularValues_pos` (156), `normDet_eq_abs_det`
(NormDet.lean 389), `normDet_eq_prod_singularValues`, `Orientation.volumeForm`,
`volumeForm_robust`, `volumeForm_neg_orientation`, `volumeForm_map` (Orientation.lean 290),
`abs_volumeForm_apply_le`, `essSup`, `ae_le_essSup`, `essSup_le_of_ae_le`,
`AbsolutelyContinuousOnInterval` and `.ae_differentiableAt` (MeasureTheory/Function/
AbsolutelyContinuous.lean 444), `.integral_mul_deriv_eq_deriv_mul`,
`volume_preserving_piFinSuccAbove`, `IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero`,
`LipschitzWith.ae_differentiableAt`, `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le`
(MeanValue.lean 423) and its primed form (527), `extChartAt`, `DifferentiableAt.conformalAt`,
`lineDeriv` (LineDeriv/Basic.lean 109: `deriv` at `0`, junk `0`), `HasLineDerivAt`,
`LineDifferentiableAt`, `measurable_lineDeriv` (Measurable.lean 44: needs global `Continuous f`,
which the README acknowledges by citing "the argument of"), `EuclideanSpace.basisFun`,
`Module.Basis.constr`, `LinearMap.toContinuousLinearMap`, `MemLp` (LpSeminorm/Defs.lean 154,
with `eLpNorm = ∞` for non-measurable functions at 92–97, so it includes a.e. strong
measurability and asks nothing else at `p = 0`, as the README says), `LocallyIntegrableOn`
(LocallyIntegrable.lean 50), `measureSpaceOfInnerProductSpace` (Haar/OfBasis.lean 310),
`ChartedSpace.locallyCompactSpace` (ChartedSpace.lean 244, for R01). Tau Ceti (`TauCeti/…`):
`LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero` (EckartYoung.lean 98),
`LinearMap.singularValues_mul_norm_le_norm_apply` (InnerProductSpace/SingularValues.lean 325),
`frobenius_apply_eq_sqrt_sum_sq_singularValues`, `Manifold.Orientation`, `orientationAt`,
`eq_or_eq_neg` (Orientation/Basic.lean, needs `PreconnectedSpace`), `model`,
`IsOrientationPreservingAt` (Preserving.lean, needs `IsManifold I 1`), `IsOrientationReversingAt`,
`Orientation.restrict`, `Orientation.pullback` (Pullback.lean: `ContMDiff 1`, invertible
`mfderiv` everywhere, `card ι = finrank`), `IsNullSet`, `.iUnion`, `.interior_eq_empty`,
`riemannianVolume`, `isLocallyFiniteMeasure_riemannianVolume`,
`isOpenPosMeasure_riemannianVolume`, `riemannianVolumeForm`, `WithMetric`,
`IsLocalRiemannianIsometry`, `Bundle.ContMDiffRiemannianMetric.quotient`,
`isLocalRiemannianIsometry_descend`, `isLocalDiffeomorph_quotientMk`, `HasWeakFDerivOn`
(WeakDeriv/Basic.lean 251, through `HasWeakLineDerivOn` at 212: `CompleteSpace F`, local
integrability of `u` and `u'` on `Ω`, the identity against `𝓓(Ω, ℝ)`),
`Module.Basis.hasWeakFDerivOn_of_forall` (657), `HasWeakFDerivOn.ae_eq` (856, a.e. on
`μ.restrict Ω` through `finBasis`), `.mono` (292), `hasWeakFDerivOn_of_differentiableOn` (747),
`hasWeakFDerivOn_iff_forall_isCompact_closure`, `hasWeakFDerivOn_of_hasFDerivAt_off_countable`
(Removable.lean 43: `ContinuousOn`, locally integrable `U`, `HasFDerivAt` off a countable set),
`LocallyLipschitzOn.hasWeakFDerivOn_fderiv` (Lipschitz.lean 134, `[FiniteDimensional ℝ F]`),
`HasWeakLineDerivOn.absolutelyContinuousOnInterval` and `.ae_hasDerivAt` (Interval.lean),
`W1p`, `W1p.exists_value_ae_eq_const_of_gradient_eq_zero` (Wirtinger/W1p.lean 436, preconnected
`Ω`), `LocallyLipschitzOn.ae_differentiableAt_of_mem` (Rademacher.lean 83),
`DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` (Sard/LowDimension.lean 73),
`cantorFunction`, `cantorFunction_of_nonpos` (162), `cantorFunction_of_one_le` (167),
`not_absolutelyContinuousOnInterval_cantorFunction` (245), `IsSmoothTriangulation`,
`IsSimplexImmersion` (on `StandardSimplex σ → M`), `exists_contMDiff_not_isSmoothTriangulation_trans`
(SmoothTriangulation/Basic.lean 365; its docstring names the squaring map, as the §6.1 Check
says), `AbstractSimplicialComplex.Realization`, `faceInclusion`,
`exists_finset_support_subset_of_isCompact` (Compact.lean 128),
`compactSpace_realization_iff_finite` (`Finite ι`), `SimplicialMap`, `realizationMap`, `IsPure`.
Also `Bundle.RiemannianBundle`, `IsContinuousRiemannianBundle`, `fderiv_id`,
`ContinuousLinearMap.norm_id` used by the example. Count: 86 declarations, all present, all
with the hypotheses the README states for them.

**Cross-roadmap citations.** DifferentialGeometry on main: Layer 2 (README line 341) with
2.1 (345) and 2.2 (352), Layer 12 (910) with 12.1 (915) and 12.4 (923). RiemannianGeometry R4
item 7 on main (lines 717–756: Killing–Hopf and the quotient atlas, descended metric and covering
for free properly discontinuous isometry groups). GeometricTopology Layer 11 on main (831). PDE
Layer 1 (675) and §1.1 (677, absolutely continuous representatives of `W^{1,p}` on intervals).
TeichmullerGeometry §7.4 at its open head (line 577: weak Wirtinger derivatives, quasiconformal
maps as `W^{1,2}_loc` homeomorphisms with `f_z̄ = μ f_z`, `‖μ‖_∞ < 1`, dilatation
`(1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)`), one line above this roadmap in the merge order. `scratch/overlaps.md`:
no pull request changes this roadmap, no cited id is dropped by an open head, no id of this
roadmap is cited elsewhere. The closest roadmaps in vocabulary (SobolevDifferentialForms,
DifferentialGeometry at two heads, SobolevPolynomialApproximation, GeometricMeasureTheory) own
none of these objects.

**Duplication by object.** `roadmaps grep` over main and the 466 open heads: "quasiregular"
matches only ring-theoretic and crystalline uses; "quasiregularly elliptic", `ACL` with lines,
outer or inner distortion or dilatation, "minimal stretch": no roadmap match (RandomMatrices
§11.1 writes the least singular value inline, as the author recorded); "formal derivative":
only power-series derivatives; "smooth triangulation": ArithmeticLocallySymmetricSpaces owns
the existence of a triangulation of a compact manifold with boundary
(`LocallySymmetric.BorelSerre.smoothTriangulation`), a different object from §6.1's properties
of a given `C¹` triangulation. Tau Ceti has `torusOrientation` for the product torus
`∀ i, AddCircle (p i)` and the orientation double cover (`Orientation/Cover`), neither of which
is the descent of an orientation to a general orbit space `X/Γ` that the gap
`orientation-descent` asks for, so that gap is minimal. Ownership against open pull requests
was checked through the tool over every head.

**Declared gaps.** The seven slugs are in `plan.json` (`gaps`) with the suppliers and sections
the README states, and each README contract line reads `What <Supplier> must provide
(gap:<slug>): …` with one object and its hypotheses. Minimality: the Sobolev class between
manifolds exists nowhere at the pins or on main; the Euclidean compatibility is asked for a
general inner product space, which the supplier's T6 states for `ℝ^m`, a stated contract and
not a finding.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts (per
supplier, by name, with what each declaration does not include), How to read the build, seven
layers with `### k.n` prose, `### Examples` and `### Dependencies` in each, Downstream
consumers, Worked examples, References. Every definition has an API list and at least three
Checks (§1.1: 5, §1.2: 5, §1.4: 5, §2.1: 4, §2.2: 4, §2.8: 3, §2.9: 5, §3.1: 3, §3.4: 3, §5.1: 6,
§6.2: 3, §7.1: 4); every theorem carries its hypotheses and a locator; every target a `*Needs:*`
line. Unicode mathematics, no LaTeX delimiters, no pull-request numbers, dates, machine paths or
process words (grep for each: none). `metadata.toml` topic `math.CV` matches MSC 30C65.

**Adversarial pass.** One row per sampled target, headline theorem and the finding; values
computed on both sides.

| statement | instances tried | values computed | result |
| --- | --- | --- | --- |
| §1.1 `ℓ(A) = σₙ`, index `n − 1` | `diag(3, 1/2)`; shear `[[1,1],[0,1]]`; `diag(1, 0)`; `n = 1`; `n = 0` | index 1 of `(3, 1/2)` is `1/2`, index 0 is `3 = ‖A‖`, index 2 is `0`; shear `AᵀA = [[1,1],[1,2]]`, eigenvalues `(3 ± √5)/2`, `ℓ = (√5 − 1)/2`; projection `ℓ = 0`, `‖A‖ = 1`; `|a|`; `n = 0`: index `0 − 1 = 0`, value `0`, `0⁰ = 1` | holds; Tau Ceti's `σ_k ‖x‖ ≤ ‖Ax‖` on the span of indices `≤ k` with `k = n − 1` is all of `V` |
| §1.3 `q_I ≤ q_O^{n−1}`, `q_O ≤ q_I^{n−1}` | `diag(2,1,1)`; `diag(1,1,1/2)`; `diag(3,2,1)`; `n = 1`; `diag(1,0)`; `R = diag(−1,1)` with `K = −1` | `q_O = 8/2 = 4`, `q_I = 2/1 = 2 = √4`; `q_O = 1/(1/2) = 2`, `q_I = (1/2)/(1/8) = 4 = 2²`; `q_O = 27/6 = 9/2`, `q_I = 6`, `6 < 81/4`, `9/2 < 36`; `q_O = q_I = 1`, exponent `0`; `J = 0`: `q_O = ∞ > q_I¹ = 0`, so `J > 0` is used; `‖R‖² = 1 ≤ (−1)(−1)` but `q_O(R) = ∞`, so `K ≥ 0` is used | holds; equality cases: `q_I = (σ₁/σₙ)^{n−1}` iff `σ₁ = … = σ_{n−1}` and `σ₁/σₙ = q_O` iff `σ₂ = … = σ_{n−1} = σ₁`, so iff `σ₁ = … = σ_{n−1}` as stated |
| §1.4 `q_S ≤ q_O ≤ n^{n/2} q_S` | `diag(2,1)`; `diag(1, ε)`; `diag(1, ε, ε)`; `id`; `A = 0`; `J ≤ 0` | `‖A‖²_HS = 5`, `q_S = 5/(2·2) = 5/4 ≤ 2 ≤ 5/2`; `q_O/q_S = 2/(1 + ε²) → 2`; `3^{3/2}/(1 + 2ε²)^{3/2} → 3^{3/2}`; `q_S(id) = n^{n/2}/n^{n/2} = 1`; `0 ≤ 0 ≤ 0`; `∞ ≤ ∞ ≤ ∞`; strictness: `σ₁ⁿ = (Σσᵢ²)^{n/2}` iff `σ₂ = … = σₙ = 0`, impossible with `J > 0` | holds, matches MRV (2.24) |
| §2.1 `K`-quasiregular | identity; `(M, o) → (M, −o)` with `K = −1`; fold; `max(0, t)`; `0 ≤ K < 1` | `1 ≤ 1·1`; `J = −1`, `1 ≤ (−1)(−1)` true but `1 ≤ K` fails; `‖DF‖ = 1`, `J_F = sign x₁`, fails on `{x₁ < 0}`; `n = 1`: `Df ∈ {0, 1}`, `|Df| ≤ Df` a.e.; `‖Df‖ⁿ ≤ K J_f ≤ K‖Df‖ⁿ` gives `Df = 0` | holds; the `|J|` model is excluded by the fold |
| §2.2 `K_O = max(1, ess sup q_O)` | constant; `z ↦ z²`; radial `a = 2`, `a = 1/2` in `ℝ³`; fold; non-quasiregular `f` in the class | `ess sup = 0`, `K_O = 1`; `q_O = 1` off `0`, `0` at `0`; `a^{n−1} = 4`, `1/a = 2`; `q_O = ∞` on `{x₁ < 0}`, naive ratio `±1`; `q_O ≤ K` a.e. for no `K`, so `ess sup = ∞ = K_O`, consistent with MRV 419 | holds |
| §2.3 attainment | identity; fold; `M = ∅` | `[1, ∞)`; `∅` and `K_O = ∞`; measure `0`, `ess sup = 0`, `K_O = 1`, set `[1, ∞)` | holds via `ae_le_essSup`, `essSup_le_of_ae_le` |
| §2.5 restriction, locality, cover formula | shear `(x, y + x³/3)`; `M = ∅`, empty cover; uncountable cover | `Df = [[1,0],[x²,1]]`, `‖Df‖² = ((x² + √(x⁴+4))/2)²`, finite on `{|x| < R}`, `K_O = ∞` on `ℝ²`; `max(1, 0) = 1`; `sup_i ≥` countable subcover value `= K_O`, and `≤ K_O` termwise | holds |
| §2.9 `IsQuasiregularOn` and agreement | radial `a > 0`, `a = 0`; `−o` on the target; identity; fold; `n = 0` | singular values `a r^{a−1}` once, `r^{a−1}` `n − 1` times, `‖Du‖ⁿ ≍ r^{n(a−1)}` integrable iff `a > 0`; `a = 0`: `x/|x|` discontinuous, `r^{−n}` not integrable; `J = −det Du`; `1 ≤ 1·1`, proved in Lean; `diag(sign x₁, 1, …)`, `det = −1` on `{x₁ < 0}`; `n = 0`: `det = 1`, `1 ≤ K·1` | holds; `det`, not `|det|` |
| §3.1 `K_I`, `K` | radial `a = 1/2`, `a = 2` in `ℝ³`; projection `P`; `n = 2` | `K_O = 2, K_I = 4, K = 4`; `K_O = 4, K_I = 2, K = 4`; `q_I(DP) = 0` but `K_I = ∞`, the bare `ess sup` would give `1`; `q_I = q_O = σ₁/σ₂` | holds |
| §3.2 manifold form | winding map; `diag(3,2,1)`; `n = 1`; sharpness `a = s`, `a = 1/s` | `K_O = 4 = 2² = K_I²`; `9/2`, `6`; `K_O = K_I = 1`; `K_I = s`, `K_O = s^{n−1}` and `K_O = s`, `K_I = s^{n−1}` | holds; `K_O ≤ K ≤ K_O^{n−1}` uses `K_O ≥ 1` |
| Thm A `det Du ≤ K^{n−1} ℓ(Du)ⁿ` a.e. | radial `a = 1/2`, `ℝ³`, `K = 2`; `det ≤ 0` points; `n = 1`; `n = 0`; exponent `K` instead of `K^{n−1}`; another weak derivative | `det = r^{−3/2}/2`, `ℓ³ = r^{−3/2}/8`, `K² ℓ³ = r^{−3/2}/2`, equality; `‖Du‖ⁿ ≤ K det ≤ 0` forces `Du = 0`, `0 ≤ 0`; `det = |Du| ≤ 1·|Du|`; `1 ≤ 1·1`; `r^{−3/2}/2 ≤ r^{−3/2}/4` false; `Du = Du'` a.e. by `HasWeakFDerivOn.ae_eq` | holds, sharp |
| Thm B `IsQuasiregularOn (K^{n−1})` | radial `a = 2`, `K = 2`, `K' = 4`; projection `(x₁, 0)` with `K = 1`; constant map with `K = 1/2`; `n = 1`; `n = 0` | `det = 2r³ ≤ 2·r³ = K ℓ³`; `‖Du‖³ = 8r³ = 4·2r³`, attained; `0 ≤ 1·0` holds but `1 ≤ K'·0` fails, so `hf` excludes it; `0 ≤ (1/2)·0` holds, conclusion needs `1 ≤ 1/2`, so `hK` is used; `|Du| ≤ det Du` from `Du ≥ 0` a.e.; `K⁰ = 1`, `1 ≤ 1` | holds; both hypotheses needed |
| §4.2 orientations | `(M, o) → (M, −o)`; reflection `(ℝⁿ, std) → (ℝⁿ, −std)`; both reversed | `J = −1`; `J = −det R = 1`; `J` unchanged | holds |
| §5.1 `formalDeriv`, `IsACLOn`, `IsACLpOn` | `u = (x₂, 0)`; `|x₁|`; `c(x₁)`; `|x|^{1/2}` with `p = 2, 4, 6`; indicator of `{0}`; `x = (1/2, 1/2)`, `i = 2`; `n = 0`; `p = 0` | columns `[[0,1],[0,0]] = fderiv`, rows would send `e₁ ↦ e₂`; entry `0` on the null line `x₁ = 0`; segments in direction 1 are `c` on `[0, 1]`, not AC, bad set of measure `1`; `2π∫₀¹ r^{1 − p/2} dr` finite iff `p < 4`; discontinuous; line `t ↦ u(1/2, t)` on `[0, 1]` versus the unshifted `[1/2, 3/2]`; vacuous box condition; `MemLp` at `0` is measurability | holds; matches MRV 332–340 by Fubini with `aᵢ < bᵢ` |
| §5.2 `ACL^p ⇔ W^{1,p}_loc` | `|x|^{1/2}`; `C¹`; Cantor; `p = 1/2` strips; `|x₁|` at `p = ∞`; `n = 0` | both sides agree for each `p` (`p < 4`); both true; both false; strips `{|y − 2^{−k}| < 8^{−k}}` disjoint since `4^{k+1} > 9`, `∫|∂₁u| ≈ Σ 2^{−k}16^k 8^{−k} = Σ 1 = ∞`, `∫|∂₁u|^{1/2} ≈ Σ 8^{−k/2}`, `∫|∂₂u|^{1/2} ≈ Σ 4^{−k}`, vertical total variation `≤ Σ 2·2^{−k}`: `ACL^{1/2}` with no weak derivative; `Du = (sign x₁, 0)`; both true | holds with `1 ≤ p`, which is used |
| §5.2 `HasLineDerivAt` a.e. | `|x₁|`; Cantor; the strip example | derivative `sign x₁` off the null line; no weak derivative exists, so vacuous; one would force `∂₁u ∈ L¹_loc`, false | holds; the statement needs no exponent, consistent with `HasWeakFDerivOn` including local integrability |
| §5.3 agreement with Definition 2.20 | radial `a = 1/2`, `ℝ³`; identity; `K = 0` constant; `max(0, t)`; `n = 0` | `2`-quasiregular here, `K = 4` in MRV; all `1`; `0 ≤ 0·det 0` and `ACLⁿ` hold, `1 ≤ 0` fails; `f' ∈ {0, 1}`, `|f'| = f'`; both sides `1 ≤ K·1` | holds; `1 ≤ K` is used |
| §6.1 local finiteness (R01) | infinite star; locally finite complex | `{v}` compact, support `⊆ {v}`, meets every edge: the pinned lemma alone does not give finiteness; with a compact neighbourhood `C` of `v` and `C ∩ σ° ≠ ∅` for every `σ ∋ v`, each such `σ` is a face of the finite subcomplex containing `C` | statement true, route repaired in R01 |
| §6.1 Checks | inscribed triangle edge `p(t) = (1 − 3t/2, t√3/2)`; `t ↦ t²` | `|p|² = 1 − 3t + 3t² ∈ [1/4, 1]`, `dθ/dt = (√3/2)/|p|² ∈ [√3/2, 2√3]`; the Tau Ceti theorem's docstring names the squaring map | holds |
| §6.2 non-degenerate, orientation preserving | identity; fold on a symmetric triangulation; vertex collapse | `J(dp) > 0` on closed simplices by continuity, density of `κ₁(σ°)` and invertibility; fold reverses on `x₁ < 0`; rank `n − 1` | holds |
| §6.3 locally Lipschitz | eight-sector map; `|x₁|`; gluing lemma | `L = [[1, −1],[0, √2]]`, `det = √2`, `LᵀL = [[1,−1],[−1,3]]`, eigenvalues `2 ± √2`, `q_O = (2 + √2)/√2 = 1 + √2 = q_I`; `1`-Lipschitz; a continuous function `L`-Lipschitz on each of finitely many closed pieces covering a segment is `L`-Lipschitz (sup argument: a piece not containing `x₀` is at positive distance) | holds |
| §7.2 orientation independence | `f ∘ R` | `J_{f∘R}(x)` for `(std, −o_N)` is `−(J_f(Rx) · det R) = J_f(Rx)`; non-constant since `R` is bijective | holds |
| §7.3 metric independence | `g' = c² g`; `T²` with `dx² + 4dy²` | factor `(c/c)ⁿ = 1`; `(2/1)²·1 = 4`, while the torus is flat and `1`-elliptic | holds, bound not sharp as stated |

Also recomputed: §4.1 `J'(A) = J(A) ρ_N(y)/ρ_M(x)` from `A^* vol'_N = ρ_N J vol_M = ρ_N J vol'_M/ρ_M`
and the four Checks (`‖dπ‖' = 2`, `ρ_N = 2`, `q'_O = 2 ≤ 4`; `q'_O = e^{|x|}` for `dx² + e^{2x}dy²`;
`q'_O = 1` for the conformal metric); §4.3–§4.4 submultiplicativity of `q_O` for all `A`, `B`
with `0·∞ = 0` (cases `BA = 0`, `J(BA) > 0` with both `J > 0` or both `< 0`, `J(BA) ≤ 0` with
`BA ≠ 0`) and of `q_I` under `J(A), J(B) ≥ 0`, with `R ∘ R = id` showing the sign hypotheses are
needed; §1.2 lower semicontinuity of `q_O` at `A = 0` (value `0`), at `J(A) = 0`, `A ≠ 0`
(`‖B‖ⁿ/J(B) → ∞`) and at `J(A) < 0`; §2.8 the winding map is `2`-Lipschitz (segments through `0`
give `|F(p) − F(q)| ≤ |p| + |q| = |p − q|`) with singular values `2, 1, 1`; the Layer 3 table
(`q_S` of the winding map `6^{3/2}/(2·3^{3/2}) = √2`, of the radial stretch
`(a² + n − 1)^{n/2}/(n^{n/2} a)`); §7.5 that an orientable `ℝⁿ/Γ` has every `γ` orientation
preserving (pull `o_N` back; `π ∘ γ = π`), so the gap is used only to orient the tori.

## Not verifiable

- Rickman1993 Ch. I and Ch. VI, Vaisala1971 Ch. 3, Reshetnyak1989 Ch. II, IwaniecMartin2001
  Ch. 6, Ahlfors2006 Ch. I, BonkHeinonen2001 Theorem 1.1, Gromov1981 p. 200, Gromov1999 Ch. 2:
  settled as uncertified in the manifest; cited by locator only. The statements they are cited
  for in the sampled targets (§2.5 locality, §5.2 `ACL^p = W^{1,p}_loc`, §1.5 and §2.10 planar
  linear algebra) were checked against MartioRickmanVaisala1969 where it covers them (332–340,
  409–425) and by the computations in the table otherwise.
- The Annals versions of HeikkilaPankka2025 and Prywes2019 were not checked; the arXiv
  numbering the manifest records was used throughout.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Proof of Proposition B.1, line 1328 (printed page 24):
  the source writes the composite of the Nash embedding and the map in the order "map after
  embedding"; it should be the embedding after the map, since the embedding goes out of the
  target; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "38117fbaa57d9fc796bf4e44b0b05b2bc073639e", "job": "REV-PKG-QuasiregularMaps", "model": "fable", "worker": "chris-x9"} -->
