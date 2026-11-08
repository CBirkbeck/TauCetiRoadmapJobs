<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7415#issuecomment-6692603646 -->
Review (claude) of 7ba078f

Verdict: needs_changes

1. **F01** (P3) Locality supremum has a junk value at the empty cover

   - Location: `packages/QuasiregularMaps/design/README.md` line 624, "For every open cover `(U_i)`
     of `M` and continuous `f`, `K_O(f) = sup_i K_O(f|_{U_i})`".
   - Claim: the outer distortion is the supremum of the outer distortions over any open cover.
   - Witness: `M = ∅` with the empty cover. §2.2 and the §2.3 Check give `K_O(f) = 1`; the
     supremum of the empty family in the extended non-negative reals of the Conventions is `0`.
     Every non-empty cover and every non-empty `M` agree with the claim.
   - Repair: write `K_O(f) = max(1, sup_i K_O(f|_{U_i}))`, as §2.7, §6.4 and §7.4 already do for
     their suprema. Tested on the witness: both sides are `1`.

2. **F02** (P3) "bi-Lipschitz in charts" is not defined

   - Location: `packages/QuasiregularMaps/design/README.md` line 1127, "for each `n`-simplex `σ`,
     `κ|σ` is bi-Lipschitz in charts onto its image"; used at line 1201.
   - Claim: the restriction of a `C¹` smooth triangulation to a closed top simplex is bi-Lipschitz
     "in charts".
   - Witness: the only chartwise Lipschitz notion the roadmap defines is §2.8's "locally Lipschitz
     in charts", for maps `M → N`; here the source is a simplex of a realization and the target is
     `M`, and a closed `n`-simplex image is a compact set that need not lie in one chart domain, so
     the statement has no fixed meaning (defect class 15, invented vocabulary).
   - Repair: state the quantifiers: for every `x ∈ σ` there are a chart `φ` of `M` at `κ(x)` and a
     neighbourhood `σ'` of `x` in `σ` such that `φ ∘ κ` is bi-Lipschitz on `σ'` for the barycentric
     coordinates of `σ`; and say in §6.3 that this local form is what the Lipschitz bounds on each
     `κ(σ)` use. Tested on the triangle triangulation of `S¹` (Check 1 of §6.1): each edge image is
     an arc, covered by the two stereographic charts, and radial projection is bi-Lipschitz on
     each piece.

3. **F03** (P3) §7.6 does not use "`N` closed"

   - Location: `packages/QuasiregularMaps/design/README.md` line 1382, "Let `N` be closed, `T` a
     connected oriented Riemannian `n`-manifold".
   - Claim: the simplicial branched-covering transfer needs `N` closed.
   - Witness: `T = N = ℝ²` with the integer-grid triangulation with diagonals on both sides,
     `s = id`, `π = id`: `K_π = 1`, `K_p = 1`, `p ∘ π = id` is non-constant and `1`-quasiregular,
     and `N` is not closed. The route (§4.3, §6.4, density of the open top simplices) uses only
     `K_p < ∞`, which is a hypothesis.
   - Repair: drop "closed" from the statement and keep it in the sentence on HeikkilaPankka2025
     (whose Proposition B.1, line 1247, is for closed manifolds). Tested on the witness.

4. **F04** (P3) §7.4 cites HeikkilaPankka2025 lines 85–91 for an argument they do not contain

   - Location: `packages/QuasiregularMaps/design/README.md` line 1329, "and `f` would be constant
     (HeikkilaPankka2025 lines 85–91)".
   - Claim: the discrete-fibre argument for non-constancy of `q ∘ f` is at those lines.
   - Witness: HeikkilaPankka2025 lines 85–91 describe composing a piecewise linear branched
     covering `T⁴ → N` with a locally isometric covering `ℝ⁴ → T⁴`; they contain no fibre argument
     and no transfer along local diffeomorphisms (defect class 10: a source cited for a statement it
     does not make).
   - Repair: move the citation to the sentence "In particular, a closed manifold finitely ... covered
     ... is quasiregularly elliptic", as the construction it generalises, and leave the
     discrete-fibre step uncited (it is elementary: fibres of a local homeomorphism are discrete,
     and a connected subset of a discrete set is a point).

Needs changes on four P3 findings, each with its repair below, to be applied in a fix round
before the port. The seven declared supplier gaps (`sobolev-maps-class`,
`sobolev-maps-weak-differential`, `sobolev-maps-norm`, `sobolev-maps-jacobian`,
`sobolev-maps-chain-rules`, `sobolev-maps-euclidean`, `orientation-descent`) are stated
contracts and raise no finding. No P1 or P2 finding: no false
statement, no vacuous target, no unowned prerequisite, no upward or cyclic supply, no copied
passage, no computational content, no re-planned roadmap.

## Verified sound

**Principles.** No route-specific shortcut; no re-planning (quasiconformal maps and Wirtinger
derivatives are consumed from TeichmullerGeometry §7.4; the Sobolev carrier is consumed through
gaps; orientations, null sets, the Riemannian volume, quotient metrics and realizations are
consumed from DifferentialGeometry, RiemannianGeometry, GeometricTopology through Tau Ceti); no
copied passage (every statement is in the author's words with locators); no algorithm; no
`Suggested.lean` at the design stage, so no sorry'd data and no `set_option`.

**Dependency check.** Output of the gate command:

```
candidate: QuasiregularMaps is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2348 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` reports no cross-roadmap citation and no Lean name
found nowhere (it did not check names outside TauCetiRoadmap; those were opened by hand, below).
`sources check` on `packages/QuasiregularMaps/sources.toml`: 0 problems.

**Supplier citations resolved (every round, at the copy named).**

- SobolevMapsBetweenManifolds: a board target with no design (`packages/SobolevMapsBetweenManifolds/target.md`),
  not on main, not in the merge order, not an open roadmap pull request. Every use is a declared
  gap. Its target lists T1 (a)–(c), T2, T3, T4, T6 and Scope items 1–7; the gap sections
  "T2 and Scope item 3", "T2 and Scope item 2", "T3 and Scope item 4", "T4 and Scope item 5",
  "T1 (a)-(b) and Scope item 3", "T1 and T6" all exist there and say what the gaps ask. The target
  names QuasiregularMaps as its consumer and requires to precede it in the merge order.
- DifferentialGeometry (main): Layer 2.1 (orientations, `orientationAt`, `eq_or_eq_neg`), 2.2
  (`IsOrientationPreservingAt`, pullback orientations), 10.2 (`IsNullSet` through charts), 12.1
  (`Opens` metrics), 12.4 (`riemannianVolumeForm`, `TauCeti.riemannianVolume`) all present at
  `TauCetiRoadmap/DifferentialGeometry/README.md` lines 341–370, 877–897, 910–935. Layer 2 has no
  orbit-space descent of orientations (its 2.4 "descent API" is the orientation double cover), so
  `orientation-descent` is a genuine gap.
- RiemannianGeometry (main) R4 item 7 (`README.md` lines 717–774): Killing–Hopf, the quotient
  atlas, descended metric and covering for a free properly discontinuous group of isometries. Its
  orientation descent is proved only for the antipodal action on spheres, not in general.
- GeometricTopology (main) Layer 11 (`README.md` lines 831–900): realizations, realized
  simplicial maps, finite-vertex compactness. The open revision of GeometricTopology (its 11.3)
  plans the existence of smooth triangulations of surfaces, not the measure-theoretic facts of
  §6.1; a revision pull request is not a dependency, and the design does not cite it.
- TeichmullerGeometry §7.4 at the head of its open pull request: weak Wirtinger derivatives,
  quasiconformal maps as `W^{1,2}_loc` homeomorphisms with `f_z̄ = μ f_z`, `‖μ‖_∞ < 1`, dilatation
  `(1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)`, with the Check `z + a z̄`, `K = (1 + |a|)/(1 − |a|)`. The README's
  description matches. TeichmullerGeometry is at merge-order position 271, before the candidate.
- PDE (main) Layer 1: Euclidean Sobolev spaces, consumed through Tau Ceti declarations only.

**Declared gaps.** Each has a named supplier; each `needs` sentence names one object (the class;
`Df` with the null-set identification that T2 bundles with it; `‖Df‖`; `J(A)` and `J_f`; the two
chain rules of T1 (a)–(b); the Euclidean compatibility; orientation descent) with its hypotheses;
none asks for what Mathlib, Tau Ceti or a main roadmap provides (no manifold-valued Sobolev class,
no oriented Jacobian of a linear map, no orientation descent exists at the pins: greps for
`SobolevMap`, `orientedJacobian`, `Jacobian`, `orbitRel` under the orientation files found
nothing relevant; `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` is the scalar Sobolev
inequality on closed manifolds). The same seven slugs appear in `plan.json` `gaps` and in the
README's supplier contracts. `orientation-descent` is used only for the orientability remark of
§7.5; the ellipticity statements hold for a given orientation without it.

**Library declarations opened at the pins** (file and line; all 64 dotted names of the README
resolve, plus `essSup`, `ae_le_essSup`, `essSup_le_of_ae_le`, `AbsolutelyContinuousOnInterval`):

- Mathlib: `LinearMap.singularValues` `Analysis/InnerProductSpace/SingularValues.lean:95`
  (`ℕ →₀ ℝ`), `singularValues_antitone` :142, `injective_iff_forall_lt_finrank_singularValues_pos`
  :156, `singularValues_of_finrank_le` :125 (zero beyond the dimension, as the contract says);
  `LinearMap.normDet` `NormDet.lean:69`, `normDet_eq_prod_singularValues` :374,
  `normDet_eq_abs_det` :389; `Orientation.volumeForm_robust` `Orientation.lean:198`,
  `volumeForm_neg_orientation` :223, `abs_volumeForm_apply_le` :245, `volumeForm_map` :290 (for
  linear isometric equivalences only, which is how §1.2 uses it); `essSup`
  `MeasureTheory/Function/EssSup.lean:46`, `essSup_le_of_ae_le` :109, `ae_le_essSup` :266;
  `AbsolutelyContinuousOnInterval` `MeasureTheory/Function/AbsolutelyContinuous.lean:155` (for
  `ℝ → X`), `.ae_differentiableAt` :444 (scalar `ℝ → ℝ`: §5.1 applies it coordinatewise, which its
  "composition with linear maps" bullet allows), `.integral_mul_deriv_eq_deriv_mul`
  `IntervalIntegral/AbsolutelyContinuousFun.lean:259` (scalar);
  `MeasureTheory.volume_preserving_piFinSuccAbove` `Constructions/Pi.lean:819`;
  `IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero` `AEEqOfIntegralContDiff.lean:205`;
  `LipschitzWith.ae_differentiableAt` `Rademacher.lean:386`;
  `Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` `MeanValue.lean:423`;
  `DifferentiableAt.conformalAt` `Complex/Conformal.lean:147`; `LinearMap.det`
  `LinearAlgebra/Determinant.lean`.
- Tau Ceti: `LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`
  `Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean:98`;
  `LinearMap.singularValues_mul_norm_le_norm_apply` `Analysis/InnerProductSpace/SingularValues.lean:325`
  (on the span of the right singular vectors of index `≤ k`; at `k = n − 1` zero-indexed that is
  all of `V`, as §1.1 says); `frobenius_apply_eq_sqrt_sum_sq_singularValues`
  `UnitarilyInvariantSeminorm/Frobenius.lean:191`; `TauCeti.Manifold.Orientation`
  `Geometry/Manifold/Orientation/Basic.lean:32`, `orientationAt` :140, `eq_or_eq_neg` :172
  (`[PreconnectedSpace M]`), `model` :235; `IsOrientationPreservingAt` `Orientation/Preserving.lean:63`
  (an `mfderiv` equivalence carrying `orientationAt`; no differentiability near the point, as the
  contract notes), `IsOrientationReversingAt` :82; `restrict` `Orientation/OpenSubset.lean:49`;
  `pullback` `Orientation/Pullback.lean:173` (needs `ContMDiff I I' 1 f`, invertible `mfderiv`
  everywhere and `card ι = finrank`, all available for a local Riemannian isometry in §7.5);
  `TauCeti.IsNullSet` `Geometry/Manifold/Measure.lean:36` (every Haar measure on the model),
  `.iUnion` :72, `.interior_eq_empty` :89 (`[FiniteDimensional ℝ E]`); `riemannianVolume`
  `Riemannian/VolumeDensity/Volume.lean:82` (`[LindelofSpace M]`, continuous metric),
  `isLocallyFiniteMeasure_riemannianVolume` :179, `isOpenPosMeasure_riemannianVolume`
  `VolumeDensity/Support.lean:36`; `riemannianVolumeForm` `Riemannian/VolumeForm.lean:55`;
  `WithMetric` `Riemannian/WithMetric.lean:74`; `IsLocalRiemannianIsometry`
  `Riemannian/Isometry/Local.lean:70` (`ContMDiff ∞`, invertible differential, inner products
  preserved); `Bundle.ContMDiffRiemannianMetric.quotient` `Riemannian/Pullback/Descent.lean:258`
  (free, properly discontinuous, `ContMDiffConstSMul I ∞`, `T2Space`, `LocallyCompactSpace`,
  smooth invariant metric), `isLocalRiemannianIsometry_descend` :189;
  `TauCeti.isLocalDiffeomorph_quotientMk` `Instances/Quotient.lean:253`; `HasWeakFDerivOn`
  `Analysis/Sobolev/WeakDeriv/Basic.lean`, `Module.Basis.hasWeakFDerivOn_of_forall` :657;
  `hasWeakFDerivOn_iff_forall_isCompact_closure` `WeakDeriv/Local.lean:71`;
  `hasWeakFDerivOn_of_hasFDerivAt_off_countable` `WeakDeriv/Removable.lean:43` (continuous on
  `Ω`, locally integrable derivative, countable exceptional set, as §2.9 uses);
  `LocallyLipschitzOn.hasWeakFDerivOn_fderiv` `WeakDeriv/Lipschitz.lean:134`
  (`[FiniteDimensional ℝ F]`); `HasWeakLineDerivOn.absolutelyContinuousOnInterval`
  `WeakDeriv/Interval.lean:302` and `.ae_hasDerivAt` :318 (vector-valued `ℝ → F`);
  `W1p.exists_value_ae_eq_const_of_gradient_eq_zero` `Poincare/Wirtinger/W1p.lean:436`
  (preconnected `Ω`); `LocallyLipschitzOn.ae_differentiableAt_of_mem` `Calculus/Rademacher.lean:83`;
  `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` `Calculus/Sard/LowDimension.lean:73`;
  `not_absolutelyContinuousOnInterval_cantorFunction` `SpecialFunctions/CantorFunction.lean:245`;
  `IsSimplexImmersion` `SmoothTriangulation/Basic.lean:97` (`Cⁿ` within the standard simplex, with
  a within-simplex derivative injective on sum-zero directions), `IsSmoothTriangulation` :191,
  `exists_contMDiff_not_isSmoothTriangulation_trans` :365; `AbstractSimplicialComplex.Realization`
  and `faceInclusion` `SimplicialComplex/Realization/Basic.lean`;
  `exists_finset_support_subset_of_isCompact` `Realization/Compact.lean:87`,
  `compactSpace_realization_iff_finite` :97; `PreAbstractSimplicialComplex.SimplicialMap`
  `SimplicialComplex/Maps.lean:36`, `.realizationMap` `Realization/Map.lean:149`; `IsPure`
  `SimplicialComplex/Pure.lean:37`.

**Sources, seeded sample** (MartioRickmanVaisala1969 = MRV, HeikkilaPankka2025 = HP,
Prywes2019 = P; all three read in the cache at the cited lines):

- 1.1: MRV line 127 defines `ℓ(T)` as the minimum of `|Tx|` over unit vectors (OCR noisy but
  legible); `|T|` the maximum. Supports the statement.
- 1.2: MRV lines 409–416, (2.21) `|f'(x)|ⁿ ≤ K J(x,f)` and (2.22) `J(x,f) ≤ K ℓ(f'(x))ⁿ`, with the
  smallest `K ≥ 1` as outer and inner dilatation; the pointwise quotients here are the right
  objects.
- 1.3: MRV line 438, (2.25) `K_O ≤ K_I^{n−1}`, `K_I ≤ K_O^{n−1}`, line 439 "best possible".
  The pointwise form and the equality cases are the author's own, verified below.
- 1.4: MRV lines 426–430, (2.23) `(Σ_{ij} (∂_j f_i)²)^{n/2} ≤ n^{n/2} K J`; line 435, (2.24)
  `K_S ≤ K_O ≤ n^{n/2} K_S`, best possible (line 436).
- 2.2: MRV lines 412–413 (outer dilatation as the smallest `K`), 418–419 (`∞` off the class).
- 2.10: MRV lines 420–422 (a sense-preserving map is `K`-quasiconformal iff it is a
  `K`-quasiregular homeomorphism; MRV's `K` is the maximal dilatation, which in dimension two
  equals `K_O`, so the planar use is correct). Ahlfors2006 Ch. I is uncertified (below).
- 4.2: HP lines 20–27 (the definition on oriented Riemannian manifolds; the sign law is the
  author's own, verified below).
- 5.1: MRV lines 332–340, Definition 2.16: `ACL` for continuous `g` on open `n`-intervals with
  closure in `U`, absolute continuity on almost every axis-parallel segment, `(n−1)`-measure of the
  exceptional set zero; `ACL^p` when the partials are locally `L^p`. Matches §5.1 (closed boxes
  in `Ω` are the same condition).
- 5.2: Vaisala1971 Ch. 3 and Rickman1993 Ch. I are uncertified (below); the statement is the
  standard one and its route uses only pinned declarations.
- 6.2: HP lines 1247–1251 (Proposition B.1: closed oriented PL Riemannian `n`-manifolds, `n ≥ 2`,
  non-degenerate orientation-preserving PL map compatible with the smooth structures is
  quasiregular) and lines 1322–1327 (the local diffeomorphisms `ϕᵢ`). The README states the
  generalisation (every `M` with `K_p < ∞`, `n ≥ 1`) and says so.
- 7.1: HP lines 20–21 (quasiregularly elliptic), 271–273 (`K`-quasiregularly elliptic); P lines
  26–27.
- 7.2: HP lines 20–21 only define the notion; the orientation independence is the author's,
  verified below.
- 7.4: HP lines 85–91: see R04.
- 7.5: HP lines 52–57 (the torus is quasiregularly elliptic, Prywes's bound); P lines 35–36.
- 7.6: HP lines 32–34 and 85–91 (PL branched coverings `Tⁿ → N` compose with the locally
  isometric covering to give quasiregular maps). Supports the statement.
- Also read: HP lines 18–19 (Theorem 1.1), 94–96 (Corollary 1.2), 1236–1245 (piecewise smooth
  triangulations), 1255–1260 (Lemma B.2), 1261–1316 and 1317–1339 (proofs); P lines 22–30
  (definition with `J_f = det Df`, Theorem 1.1), 33–34, 41–53, 59–65; MRV lines 117–125 (formal
  derivative, Jacobian), 423–425 (projection warning), 440–444 (Lemma 2.26). All as cited.

**Adversarial pass** (sampled targets, headline theorems, and the targets of the findings; the
remaining rows of the author's table were recomputed and agree).

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| Conv. operator-norm normalisation | `diag(2,1)` | `‖A‖² = 4`, `J = 2`: least `K = 2`; HS: `(4+1)/(2·2) = 5/4` | normalisations differ as stated | none |
| Conv. `q_O(0) = 0`, `q_O = ∞` on `J ≤ 0` | `0`; `R = diag(−1,1)`; `diag(1,0)` | `0`; `‖R‖²/J = −1` naive, `q_O = ∞`, `q_I = 0`; `1/0`, set `∞` | conventions needed | none |
| Conv. two meanings of `K`-QR | radial `a = 1/2`, `n = 3` | `K_O = 1/a = 2`, `K_I = a^{−2} = 4`, `K = 4` | terminologies differ exactly so | none |
| 1.1 `ℓ(A)` | `diag(3,1/2)`; shear; `0`, `diag(1,0)`; `n = 1` | `ℓ = 1/2`, `‖A⁻¹‖ = 2`, product `1`; `AᵀA = [[1,1],[1,2]]`, eigenvalues `(3±√5)/2`, `ℓ = (√5−1)/2` (`ℓ² = (3−√5)/2` ✓), basis minimum `1`; `ℓ = 0`, `‖diag(1,0)‖ = 1`; `|a|` | holds; wrong models excluded | none |
| 1.1 equality `ℓ = ‖A‖` iff `A = σU` | `σ₁ = … = σₙ = σ` | `A^*A = σ² I`, so `A = σU`, `U` isometry; `σ = 0` gives `A = 0` | holds | none |
| 1.1 `ℓ(A) > 0` iff injective; `ℓ‖A⁻¹‖ = 1` | equal dimensions | injective iff `σₙ > 0`; `‖A⁻¹‖ = 1/σₙ` | holds | none |
| 1.1 Weyl `|ℓ(A) − ℓ(A')| ≤ ‖A − A'‖` | `A = id`, `A' = 0` in `ℝ²` | `|1 − 0| ≤ 1` | holds | none |
| 1.2 `q_O`, `q_I` formulas | `diag(2,1)`; `R`; `0`; `−id`, `n = 2, 3` | `4/2 = 2`, `2/1 = 2`; `∞`, `0`; `0`, `0`; `J = (−1)ⁿ`: `q_O = 1`, `∞` | holds | none |
| 1.2 `q_O ≥ σ₁/σₙ`, `q_I ≥ σ₁/σₙ` | `n = 1`; `diag(3,2,1)` | `1 ≥ 1`; `9/2 ≥ 3`, `6 ≥ 3` | holds | none |
| 1.2 `c < 0` | `n = 2`, `c = −1`, `A = diag(2,1)`; `n = 3` | `J(−A) = 2`, `q_O = 2`; `J(−A) = −2`, `q_O = ∞`, `q_I = 0` | holds | none |
| 1.2 `q_O` submultiplicative with `0·∞ = 0` | `A = 0`, `B` with `J(B) < 0`; `A = R`, `B = R`; `J(A), J(B) > 0` | `q_O(0) = 0 ≤ 0·∞ = 0`; `q_O(id) = 1 ≤ ∞·∞`; `‖BA‖ⁿ ≤ ‖B‖ⁿ‖A‖ⁿ`, `J(BA) = J(B)J(A)` | holds | none |
| 1.2 `q_I` submultiplicative with signs | `R ∘ R`; `J(A) = 0`, `J(B) > 0` | `1 > 0·0`; `q_I(BA) = 0 ≤ RHS` | fails without signs, holds with them | none |
| 1.2 `q_O ≤ 1` iff `A = 0` or `λU`, `J(U) = 1` | `J > 0`, `q_O = 1` | all `σᵢ` equal to `λ`, `J(U) = J(A)/λⁿ = normDet(U) = 1` | holds | none |
| 1.2 `q_O` lower semicontinuous | `A_k → 0`; `A_k → A ≠ 0`, `J(A) = 0`, `J(A_k) > 0`; `J(A) < 0` | `0 ≤ liminf`; `‖A_k‖ⁿ/J(A_k) → ∞`; eventually `∞` | holds | none |
| 1.3 `‖A‖ⁿ ≤ KJ` iff `q_O ≤ K`, `K ≥ 0` | `A = 0`; `R`, `K = 1`; `R`, `K = −1`; `K = 0` | `0 ≤ 0` ⇔ `0 ≤ K`; `1 ≤ −1` false ⇔ `∞ ≤ 1` false; `1 ≤ 1` true but `∞ ≤ −1` false; `A = 0` both sides | holds for `K ≥ 0`, fails at `K = −1` | none |
| 1.3 `J ≤ Kℓⁿ` iff `q_I ≤ K` | `J ≤ 0` | LHS true (`Kℓⁿ ≥ 0`), `q_I = 0 ≤ K` | holds | none |
| 1.3 `q_I ≤ q_O^{n−1}`, `q_O ≤ q_I^{n−1}` (headline) | `diag(2,1,1)`; `diag(1,1,1/2)`; `diag(3,2,1)`; `n = 1`; `n = 2` | `(4, 2)`, `4 = 2²`; `(2, 4)`, `4 = 2²`; `6 ≤ 81/4`, `9/2 ≤ 36`; `(1,1)`, exponent `0`; `q_O = q_I = σ₁/σ₂` | holds; each `σᵢ/σₙ ≤ σ₁/σₙ ≤ q_O` | none |
| 1.3 equality cases | `q_I = q_O^{n−1}` | needs `σᵢ/σₙ = q_O` for `i ≤ n−1` and `q_O = σ₁/σₙ`, i.e. `σ₁ = … = σ_{n−1}` | holds (vacuous for `n ≤ 2`) | none |
| 1.3 `J ≤ 0` | `diag(1,0)` | `q_O = ∞`, `q_I = 0`, `∞ ≤ 0¹` fails | hypothesis `J > 0` used | none |
| 1.4 `q_S ≥ 1`, equality | AM–GM on `σᵢ²` | `(Σσᵢ²/n)^{n/2} ≥ Πσᵢ`, equality iff all equal iff `q_O = 1` | holds | none |
| 1.4 `q_S ≤ q_O ≤ n^{n/2} q_S` | `id`; `diag(2,1)`; `diag(1,ε)`; `diag(1,ε,ε)`; `R`; `0` | `1`; `5/4 ≤ 2 ≤ 5/2`; `q_O/q_S = 2/(1+ε²) → 2`; `3^{3/2}/(1+2ε²)^{3/2} → 3^{3/2}`; `∞ ≤ ∞ ≤ ∞`; `0 ≤ 0 ≤ 0` | holds; constant sharp, strict for `J > 0`, `n ≥ 2` (`‖A‖_HS > σ₁`) | none |
| 1.5 planar | `a = 1, b = 1/2`; `a = 0, b = 1`; `a = 2i`; `z + z̄/3`; `A = 0` | `3/2, 1/2, 3/4, q_O = 3`; `J = −1`, `∞`; `1`; `(4/3)/(2/3) = 2`, `k = 1/3`; `0 ≤ 0`, `q_O = 0` | holds | none |
| 1.5 `q_O ≤ (1+k)/(1−k)` iff `|b| ≤ k|a|` | `|b| < |a|` | `(|a|+|b|)(1−k) ≤ (1+k)(|a|−|b|)` ⇔ `2|b| ≤ 2k|a|` | holds | none |
| 2.1 definition | `id`; `id` to `−o`; fold; `max(0,t)`; `0 ≤ K < 1` | `1 ≤ 1`; `J = −1`; `J = sign x₁`, `‖DF‖ = 1`, fails on `x₁ < 0`; `q_O ∈ {0,1}`; `(1−K)‖Df‖ⁿ ≤ 0` | holds | none |
| 2.2 `K_O` | constant; `z²`; radial `a = 2, 1/2` in `ℝ³`; fold; `M = ∅` | `max(1,0) = 1`; `(2|z|)²/(4|z|²) = 1`, `0` at `0`; `a³/a = 4`, `1/a = 2`; `∞`; `essSup` for the zero measure is `0`, `K_O = 1` | holds | none |
| 2.3 attainment | `id`; fold; `M = ∅` | `[1,∞)`; `∅` and `K_O = ∞`; `[1,∞)` | holds | none |
| 2.4 Jacobian | `z²`; projection; radial `a > 0` | `J = 4|z|²`, `Df(0) = 0`; `J = 0`, `DP ≠ 0`; `∫₀ r^{n(a−1)} r^{n−1} dr < ∞` iff `a > 0` | holds | none |
| 2.5 restriction; locality (R01) | shear `(x, y + x³/3)`; `z²` on `Re z > 0`; `M = ∅`, empty cover | `‖Df‖² = (2 + x⁴ + x²√(x⁴+4))/2 = ((x²+√(x⁴+4))/2)²`, `K_O(|x|<R)` finite, `K_O(ℝ²) = ∞`; `K_O = 1`; `K_O = 1` vs `sup ∅ = 0` | holds except the empty-cover junk value | R01 |
| 2.6 constancy | two balls; Cantor map | `Df = 0`, two values; derivative `0` a.e., not `W^{1,1}_loc` (not `ACL`) | hypotheses needed | none |
| 2.7 `C¹` | `z²`; `−id`; `(x³, y)`; `ℝⁿ → ℝⁿ/ℤⁿ` | `1`; `J = (−1)ⁿ`; `q_O = max(3x²,1)²/(3x²) → ∞`, `df_0 = diag(0,1)`; `‖dπ‖ = 1 = J` | holds; `essSup = sup` by lsc and full support | none |
| 2.8 Lipschitz | winding map; fold; `|x|^{1/2}` | `σ = 2,1,1`, `J = 2`, `8/2 = 4`, `2/1 = 2`; Lipschitz, not QR; `∫|x|^{−p/2} < ∞` iff `p < 2` | holds | none |
| 2.9 Euclidean | radial; `a = 0`; `(o, −o)` | `σ = a r^{a−1}, r^{a−1}`; `‖Du‖ⁿ ≍ r^{n(a−1)}`; discontinuous, `r^{−n}` not integrable; `J = −det Du` | holds | none |
| 2.10 Beltrami | `z + a z̄`, `a = 1/2`; `z̄`; holomorphic; `{f_z = 0}` | `(1 + 1/2)/(1 − 1/2) = 3`; `J = −1`; `k₀ = 0`, `K_O = 1`; `f_z̄ = 0` forced, `q_O = 0` | holds; `k = (K−1)/(K+1)` inverts `K = (1+k)/(1−k)` | none |
| 3.1 `K_I`, `K` | radial `a = 1/2, 2`; projection; `z + z̄/2` | `(2,4,4)`, `(4,2,4)`; `q_I = 0`, `K_I = ∞`; `3 = 3` | holds | none |
| 3.2 (2.25) for maps (headline) | winding; `diag(3,2,1)`; `n = 1`; `a = s`, `a = 1/s` | `4 = 2²`; `9/2`, `6`; `K_O = K_I = 1`; `(K_I, K_O) = (s, s^{n−1})`, `(s^{n−1}, s)` | holds; sharp for `n ≥ 2` | none |
| 3.3 projection | `n = 2, 3`; `n = 1` | `J = 0 = ℓⁿ`, `‖DP‖ = 1`; `P = 0` | `n ≥ 2` needed | none |
| 3.4 `K_S` | `id`; `diag(2,1)`; winding; radial | `1`; `5/4`; `6^{3/2}/(3^{3/2}·2) = √2`; `(a² + n − 1)^{n/2}/(n^{n/2} a)` | holds | none |
| 4.1 comparable metrics | `c² g_N`; `T²`, `dx² + 4dy²`; `dx² + e^{2x}dy²`; `e^{2x}(dx² + dy²)` | factor `1`; `‖dπ‖' = 2`, `ρ_N = 2`, `q'_O = 2 ≤ 4`; `q'_O = max(1,eˣ)²/eˣ = e^{|x|}`; `eˣ`, `e^{2x}`, `q'_O = 1` | holds; `J' = J ρ_N/ρ_M` from `A^*(ρ_N vol_N) = ρ_N J vol_M` | none |
| 4.2 orientations | `id` to `−o`; reflection to `−std`; constants | `−1`; `−det R = 1`; `Df = 0` | holds | none |
| 4.3 precomposition | `π`; shear; reflection | `K_π = 1`; `K_θ = ∞`, `θ` not QR; `J = −1` | hypotheses needed | none |
| 4.4 postcomposition | `z² ∘ z²`; isometry; `|y|y ∘ |x|^{−1/2}x` | `z⁴`, `1`; unchanged; identity, `1 ≤ 4·2`; `df_0 = 0` admitted by `0 ≤ 0` | holds | none |
| 5.1 `ACL`, `ACL^p` | `|x₁|`; Cantor; `|x|^{1/2}` in `ℝ²`; indicator of `{0}` | `(sign x₁, 0)`; not AC; `∫_{|x|<1}|x|^{−p/2} < ∞` iff `p < 4`; AC on lines, not continuous | holds | none |
| 5.2 `ACL^p = W^{1,p}_loc` (headline) | `|x|^{1/2}`; Cantor; `C¹` | `p < 4` both sides; neither; `Du = fderiv u` | holds | none |
| 5.3 MRV agreement | radial `a = 1/2`, `ℝ³`; `id` | ours `2`-QR, MRV `K = 4`; all `1` | holds | none |
| 6.1 triangulations (R02) | triangle on `S¹`; tetrahedron on `S²`; `t ↦ t²` | pure dim `1`, `3` null points; pure dim `2`, `6` null arcs; derivative `0` at `0`, inverse not Lipschitz | holds; local finiteness from local compactness and the finite-vertex lemma; "bi-Lipschitz in charts" undefined | R02 |
| 6.2 simplicial maps | `id`; symmetric fold; vertex collapse | preserving; reversing on `x₁ < 0`; degenerate | holds; `J(dp) > 0` on closed simplices by continuity and non-vanishing | none |
| 6.3 piecewise `C¹` | `|x₁|`; eight-sector map | `1`-Lipschitz; `L = [[1,−1],[0,√2]]`, `det = √2`, `LᵀL = [[1,−1],[−1,3]]`, eigenvalues `2 ± √2`, `q_O = q_I = 1 + √2` | holds | none |
| 6.4 simplicial QR (headline) | `id`; doubling on `T²`; fold; collapse; strip map | `1`; `diag(2,1)`, `4/2 = 2`; reversing; rank `n−1`, `J = 0`; `q_O = k²/k = k → ∞` | holds; `K_p < ∞`, non-degeneracy, orientation used | none |
| 7.1 ellipticity | `ℝⁿ`; constants; ball; `n = 1` | `id`, `K = 1`; constant always QR; chart ball QR; `ℝ`, `ℝ/ℤ` | holds | none |
| 7.2 orientation independence (headline) | `f ∘ R` | `J_{(std,−o_N)}(f∘R)(x) = J_{(−std,−o_N)}(f)(Rx)·J_{(std,−std)}(R) = J_f(Rx)·1` | holds | none |
| 7.3 metric independence (headline) | `c² g_N`; `dx² + 4dy²` on `T²` | factor `1`; bound `4`, true value `1` | holds, not sharp | none |
| 7.4 transfer (R04) | doubling; `ℂ∖{0} ⊂ ℂ`; conjugation | `K_q = 2`; `K_q = 1`, `exp`; `K_q = ∞` | holds; discrete fibres give non-constancy | R04 (locator) |
| 7.5 flat manifolds (headline) | `ℝⁿ/ℤⁿ`; `exp`; Klein bottle; `Sⁿ` | `J_π = 1`; nowhere-zero derivative; glide reflections reverse; `dσ = 2/(1+|x|²)·isometry` | holds; pullback orientation is `±std` on connected `ℝⁿ` | none |
| 7.6 tori (headline, R03) | `p = id`; doubling; degenerate; `T = N = ℝ²`, `p = π = id` | `K = 1`; `2`-QR; excluded; holds with `N` open | holds; "`N` closed" unused | R03 |

**Build order.** Every `*Needs:*` line and every `target:` prerequisite in `plan.json` points to an
earlier target (§5.1–§5.2 are independent of Layers 2–4; §5.3 needs §2.9 and §3.1; §6.3 needs
§2.8; Layer 7 needs Layers 4 and 6). No layer-level cycle.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, seven layers with `### Examples` and `### Dependencies`, Worked examples, Downstream
consumers, References. Ten definitions (1.1, 1.2, 1.4, 2.1, 2.2, 3.1, 3.4, 5.1, 6.2, 7.1), each with
an API list and 3–5 Checks (plan.json counts 4, 5, 4, 4, 4, 3, 4, 4, 3, 4); §2.8's auxiliary
notion has 3 Checks. Every theorem carries hypotheses in the sentence and a locator. No LaTeX
delimiters, no process words, no pull-request numbers, no machine paths, no `lemma`, no
target-numbering tables. Unicode mathematics with ASCII in code spans. Vocabulary is the
literature's, except the term of R02.

**Headline theorems and statability at the pins** (no `Suggested.lean` at the design stage). The
six end theorems of the Summary: (1) `K_I ≤ K_O^{n−1}`, `K_O ≤ K_I^{n−1}` (§3.2); (2)
`ACL^p = W^{1,p}_loc` for continuous maps (§5.2); (3) simplicial maps are quasiregular (§6.4);
(4) ellipticity independent of metric and orientation (§7.2, §7.3); (5) closed orientable flat
manifolds are `1`-quasiregularly elliptic (§7.5); (6) simplicial branched coverings by tori
(§7.6). At the pins, (2) is statable (`AbsolutelyContinuousOnInterval`, `TauCeti.HasWeakFDerivOn`
exist), and (1) is statable in its Euclidean form through §2.9 with `LinearMap.det` as the
Jacobian; (3)–(6) need the manifold class `W^{1,n}_loc(M, N)` of SobolevMapsBetweenManifolds and
are not statable until it exists. The design report says the same, and asks that the Euclidean
statements be named as such so that README and Lean generality do not diverge. The package stage
must state (2) and the Euclidean (1), and name (3)–(6) in the module docstring with the missing
carrier.

**Ownership against open work.** Checked by object with `roadmaps grep` over main and the open
roadmap pull requests at their heads: `quasiregular` (only crystalline and measure-theoretic
senses elsewhere), `ACL`, `Beltrami` (only Laplace–Beltrami elsewhere), `bounded distortion`
(none), `smooth triangulation` (GeometricTopology 11.3 at its open head: existence for surfaces;
ArithmeticLocallySymmetricSpaces: triangulations with boundary; HomotopySpheres: consumes), orbit
space orientation descent (none), `minimal stretch` (none). The board index lists three unrelated
packages. SobolevMapsBetweenManifolds on the board owns the carrier and is consumed through gaps.
No open pull request builds the objects of Layers 1–7.

## Not verifiable

- Rickman1993 Ch. I and Ch. VI, Vaisala1971 Ch. 3, Reshetnyak1989 Ch. II, IwaniecMartin2001
  Ch. 6, Ahlfors2006 Ch. I, BonkHeinonen2001 Theorem 1.1, Gromov1981 p. 200, Gromov1999 Ch. 2:
  settled as uncertified in the manifest (paywalled; not requested). They are cited at chapter
  level for standard facts, routes, or Part II/III targets; every value the design takes from
  them was recomputed above.
- The Annals versions of HeikkilaPankka2025 and Prywes2019: the arXiv versions were read, and
  the manifest records that their numbering is the one cited.
- Elaboration: not available (this lane does not elaborate; there is no Lean file at the design
  stage).

## Source issues

- **Misprint** in HeikkilaPankka2025 at Proof of Proposition B.1, line 1328 (arXiv v2, p. 24): the
  source writes the composite of the map and the Nash embedding in the wrong order, as the map
  followed by the embedding read right to left; it should be the embedding after the map, as on
  the next line; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7ba078f0aaea0f820622df6da700f2b68deec206", "job": "REV-DESIGN-QuasiregularMaps", "model": "fable", "worker": "chris-x17"} -->
