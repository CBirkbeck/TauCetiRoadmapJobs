<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7415#issuecomment-6699422127 -->
Review (claude) of 9625ad7

Verdict: accepted
Conditional on the announced gaps: `sobolev-maps-class`, `sobolev-maps-weak-differential`, `sobolev-maps-norm`, `sobolev-maps-jacobian`, `sobolev-maps-chain-rules`, `sobolev-maps-euclidean`, `orientation-descent`

No finding. The one finding of round 2 (R01, P3) is repaired, the repair introduced no new
defect, the pattern it repaired occurs nowhere else in the design, the seeded sample of fifteen
targets was verified against the sources at their locators and recomputed in the adversarial
table below, every library declaration those targets cite was opened at the pins, every
cross-roadmap citation was resolved on main and at the open heads, and the dependency check
shows no UPWARD or CYCLE line. Acceptance is conditional on the seven declared supplier gaps
(`sobolev-maps-class`, `sobolev-maps-weak-differential`, `sobolev-maps-norm`,
`sobolev-maps-jacobian`, `sobolev-maps-chain-rules`, `sobolev-maps-euclidean`,
`orientation-descent`). Elaboration: not available (this lane does not elaborate; there is no
Lean file at the design stage).

## Round 2 finding, checked

- **R01 (Part III consumer sentence cites DifferentialGeometry Layers 6–9, an id an open
  revision drops): repaired.** `packages/QuasiregularMaps/design/README.md` line 1488 now reads
  "consumes Part II, de Rham cohomology with the de Rham theorem and Poincaré duality, and
  SobolevDifferentialForms". No layer number remains in the sentence. The repair also removed
  the citation of DifferentialGeometry 10.2 (chartwise null sets), which the same open revision
  drops: the Scope bullet (line 68) now says "Chartwise null sets are already in Tau Ceti
  (`TauCeti.IsNullSet`) and are consumed from there", the "From TauCetiRoadmap.DifferentialGeometry"
  list (lines 298–302) has only 2.1–2.2, 12.1, 12.4 and the gap, and `plan.json`'s
  DifferentialGeometry supplier entry lists `Layer 2.1`, `Layer 2.2`, `Layer 12.1`, `Layer 12.4`.
  A grep of the README for `10.2`, `Layers 6` and `Layer 6–9` finds nothing. Every `*Needs:*`
  line that used null sets (§2.5, §2.7, §6.1, §6.3) already named the Tau Ceti declarations, so
  no statement, hypothesis or Check changed.
- **The repaired pattern elsewhere.** The remaining DifferentialGeometry ids (Layer 2, 2.1, 2.2,
  12.1, 12.4) are present on main (`TauCetiRoadmap/DifferentialGeometry/README.md` lines 341,
  345, 352, 915, 923) and at the heads of the two open revisions the overlaps lead names (at
  a565de6: lines 474, 478, 487, 1210, 1241; at the multi-roadmap head of pull request 1187: the
  main numbering, Layer 2 at 342 and Layer 12 at 911). RiemannianGeometry R4 item 7 with
  Killing–Hopf and the quotient by free properly discontinuous isometries: main lines 717 and
  749–752; at the heads of its two open revisions, lines 1152/1184 and 1226/1258.
  GeometricTopology Layer 11: main line 831; at the four open heads, lines 848, 848, 832 and (the
  rewrite of pull request 1797) line 503, which keeps "Layer 11" for the realization carriers.
  TeichmullerGeometry §7.4 at its open head: line 577, "Wirtinger derivatives, quasiconformal maps
  and the Beltrami equation", with the `W^(1,2)_loc` homeomorphism, `f_z̄ = μ f_z`, `‖μ‖_∞ < 1`
  and dilatation `(1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)` as §2.10 describes. No numbered citation of this
  design breaks at any open head.

## Verified sound

**Principles.** No route-specific shortcut (every statement is on the general class, in every
dimension `n ≥ 1`, with the `n ≥ 2` restriction of the sources declared as the author's extension
in the Conventions). No re-planned roadmap: quasiconformal maps are consumed from
TeichmullerGeometry §7.4, the Sobolev carrier through declared gaps from the board target
SobolevMapsBetweenManifolds, orientations, null sets, the Riemannian volume, quotient metrics and
realizations from Tau Ceti. Supply is downward only. No copied passage (the three certified
sources were compared at every cited line below). No computational algorithm. No Lean file, so
no sorry'd data and no `set_option`.

**Dependency check.** Output of the gate command on the current README:

```
candidate: QuasiregularMaps is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no
Lean name found nowhere (names outside TauCetiRoadmap were opened by hand, below).
`sources check` on `packages/QuasiregularMaps/sources.toml`: 0 problems. `plan.json` parses: 7
layers, 36 targets, 123 tests; its seven `gaps` carry the same slugs, suppliers and sections as
the README's supplier contracts; every `target:` prerequisite of the sampled targets points to an
earlier target (1.1 → none; 1.2 → 1.1; 1.4 → 1.2, 1.3; 2.1 → 1.2, 1.3; 2.4 → 2.1, 2.3;
2.5 → 2.1, 2.2; 2.6 → 2.4; 2.7 → 1.2, 2.2, 2.3; 2.8 → 2.1; 2.9 → 2.1; 3.1 → 1.2, 2.2–2.4;
5.2 → 5.1; 6.3 → 2.8, 6.1; 7.1 → 2.1, 2.6; 7.5 → 2.7, 7.1, 7.2).

**Declared gaps.** Each names a supplier and a section; each `needs` sentence names one object
with its hypotheses. Minimality was re-checked against the two places that could already provide
them: PseudoholomorphicCurveAnalysis 4.1 on main defines `W^{k,p}_loc(Σ, M)` for surfaces with
`kp > 2` only (its own Check says `k = 1`, `p ≤ 2` is excluded), so it does not cover `p = n`;
`TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` is scalar; the board target
`packages/SobolevMapsBetweenManifolds/target.md` plans `C¹` maps in the class (its Scope item 3,
line 54) and bi-Lipschitz chain rules as a Part II item (line 120), so the locally Lipschitz case
§2.8 keeps here has no second owner. DifferentialGeometry Layer 2 on main and at a565de6 has no
orbit-space descent of an orientation (its 2.2 has the pullback and the product only), so
`orientation-descent` is genuine; the README uses it only for the remark of §7.5 that `ℝⁿ/Γ`
carries an orientation, and the flat-manifold headline uses the orientation the hypothesis gives.

**Library declarations opened at the pins, for the sampled targets** (file and line in the
pinned Mathlib and Tau Ceti). Mathlib: `LinearMap.singularValues`
`Analysis/InnerProductSpace/SingularValues.lean:95` (zero-indexed, descending, zero beyond the
dimension, as the Conventions say), `singularValues_antitone` :142,
`injective_iff_forall_lt_finrank_singularValues_pos` :156; `LinearMap.normDet_eq_prod_singularValues`
`NormDet.lean:374`, `normDet_eq_abs_det` :389; `Orientation.volumeForm_robust`
`Orientation.lean:198`, `volumeForm_neg_orientation` :223, `abs_volumeForm_apply_le` :245,
`volumeForm_map` :290; `essSup_le_of_ae_le` `EssSup.lean:109`, `ae_le_essSup` :266;
`AbsolutelyContinuousOnInterval.ae_differentiableAt` `AbsolutelyContinuous.lean:444`;
`AbsolutelyContinuousOnInterval.integral_mul_deriv_eq_deriv_mul`
`IntervalIntegral/AbsolutelyContinuousFun.lean:259`; `volume_preserving_piFinSuccAbove`
`Constructions/Pi.lean:819`; `IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero`
`AEEqOfIntegralContDiff.lean`; `LipschitzWith.ae_differentiableAt` `Rademacher.lean:386`;
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` `MeanValue.lean:423` and its primed variant
:527; `extChartAt` `ExtChartAt.lean:437`; `DifferentiableAt.conformalAt`
`Analysis/Complex/Conformal.lean:147` (hypotheses `DifferentiableAt ℂ f z`, `deriv f z ≠ 0`, as
§7.5 uses). Tau Ceti: `LinearMap.norm_toContinuousLinearMap_eq_singularValues_zero`
`Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean`;
`LinearMap.singularValues_mul_norm_le_norm_apply` `Analysis/InnerProductSpace/SingularValues.lean`;
`UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues`
`UnitarilyInvariantSeminorm/Frobenius.lean`; `IsNullSet` `Geometry/Manifold/Measure.lean:36`
(every chart image null for every Haar measure on the model; no measurable structure on `M`),
`.iUnion` :72 (`[Countable ι]`), `.interior_eq_empty` :89 (`[FiniteDimensional ℝ E]`);
`riemannianVolume` `VolumeDensity/Volume.lean:82`, `isLocallyFiniteMeasure_riemannianVolume`
:179, `isOpenPosMeasure_riemannianVolume` `VolumeDensity/Support.lean:36`;
`riemannianVolumeForm` `VolumeForm.lean:55`; `WithMetric` `WithMetric.lean`;
`IsLocalRiemannianIsometry` `Isometry/Local.lean:70` (`ContMDiff I J ∞ f`, invertible `mfderiv`,
inner-product preserving: exactly the README's gloss); `ContMDiffRiemannianMetric.quotient`
`Pullback/Descent.lean:258` (defined as `descend` along `isLocalDiffeomorph_quotientMk`) and
`isLocalRiemannianIsometry_descend` :189, so the orbit projection is a local Riemannian isometry
for the descended metric as §7.5 says; `isLocalDiffeomorph_quotientMk`
`Instances/Quotient.lean:253` (`[IsManifold I n M]`, free properly discontinuous `C^n` action);
`Manifold.Orientation.orientationAt` `Orientation/Basic.lean:140`, `eq_or_eq_neg` :172
(`[PreconnectedSpace M]`, used on `ℝⁿ`), `model` :235, `IsOrientationPreservingAt`
`Preserving.lean:63` (`[IsManifold I 1 M]`), `restrict` `OpenSubset.lean:49`, `pullback`
`Pullback.lean:173` (`ContMDiff I I' 1 f`, invertible `mfderiv`, `Fintype.card ι = finrank ℝ E`);
`HasWeakFDerivOn` `WeakDeriv/Basic.lean:251` (arguments `μ Ω u U` in the order §2.9 writes them;
`Ω : Opens E`), `Module.Basis.hasWeakFDerivOn_of_forall` :657 (`[CompleteSpace F]`);
`hasWeakFDerivOn_iff_forall_isCompact_closure` `WeakDeriv/Local.lean:71`;
`hasWeakFDerivOn_of_hasFDerivAt_off_countable` `WeakDeriv/Removable.lean:43` (`ContinuousOn u Ω`,
`LocallyIntegrableOn U Ω μ`, `HasFDerivAt` off a countable set, `[CompleteSpace F]`: the radial
stretch of §2.9 satisfies all three for `a > 0`, below);
`LocallyLipschitzOn.hasWeakFDerivOn_fderiv` `WeakDeriv/Lipschitz.lean:134`
(`[FiniteDimensional ℝ F]`); `LocallyLipschitzOn.ae_differentiableAt_of_mem`
`Analysis/Calculus/Rademacher.lean:83` (`IsOpen s`); `HasWeakLineDerivOn.absolutelyContinuousOnInterval`
`WeakDeriv/Interval.lean:302` (weak derivative on `Ioo a b`, `IntegrableOn u' (Ioo a b)`, a
continuous representative on `Icc a b`; conclusion on the closed interval, which is what §5.2's
(⇐) needs), `.ae_hasDerivAt` :318; `W1p.exists_value_ae_eq_const_of_gradient_eq_zero`
`Poincare/Wirtinger/W1p.lean:436` (`IsPreconnected Ω`, scalar `W1p`, zero gradient; conclusion
almost-everywhere constant, as §2.6's route states);
`DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` `Sard/LowDimension.lean:73`;
`not_absolutelyContinuousOnInterval_cantorFunction` `CantorFunction.lean:245`;
`IsSimplexImmersion` `SmoothTriangulation/Basic.lean:97` (a map `F : (σ → ℝ) → M`, `ContMDiffOn`
within the standard simplex, a derivative within the simplex at every point injective on sum-zero
vectors) and `IsSmoothTriangulation` :191 (an immersion on every closed simplex; no local
finiteness or purity, as the README says), `exists_contMDiff_not_isSmoothTriangulation_trans`;
`exists_finset_support_subset_of_isCompact` `Realization/Compact.lean:87`,
`compactSpace_realization_iff_finite` :97 (`CompactSpace (Realization K) ↔ Finite ι`);
`SimplicialMap` `SimplicialComplex/Maps.lean:36`, `SimplicialMap.realizationMap`
`Realization/Map.lean`; `IsPure` `SimplicialComplex/Pure.lean:37` (every simplex lies in one of
`n + 1` vertices, which also excludes simplices above dimension `n`, as §6.1 states);
`faceInclusion` `Realization/Basic.lean:150`, `Realization` same file. All as the README's
contracts describe them, with the hypotheses the README attributes.

**Sources, seeded sample** (MartioRickmanVaisala1969 = MRV, HeikkilaPankka2025 = HP,
Prywes2019 = P; read in the cache at the cited lines; the MRV scan is noisy but legible).

- 1.1: MRV line 127 sets `|T|` and `ℓ(T)` as the maximum and minimum of `|Tx|` over unit
  vectors; the README's minimal stretch is that `ℓ(T)`. Supports the statement.
- 1.2: MRV lines 411–416, (2.21) `|f'|ⁿ ≤ K J` and (2.22) `J ≤ K ℓ(f')ⁿ`, with `K_O`, `K_I` the
  least `K ≥ 1`. The pointwise quotients and the conventions at `J ≤ 0` are the author's, verified
  in the table.
- 1.4: MRV lines 426–430, (2.23), the Callender–Reshetnyak form with `n^{n/2}` and the sum of
  squares of the partials; line 433, `K` sometimes replaced by `Kⁿ` or `K^{n/2}`; line 435,
  (2.24) `K_S ≤ K_O ≤ n^{n/2} K_S`; line 436, best possible. Supports §1.4 and §3.4.
- 2.1: HP lines 22–27 (continuous `f ∈ W^{1,n}_loc(M, N)`, `‖Df‖ⁿ ≤ K J_f` a.e., `K ≥ 1`,
  stated for `n ≥ 2`); P lines 22–26 (`K ≥ 1`, `W^{1,d}_loc`, `J_f = det Df`); MRV Definition
  2.20, lines 409–412 (`ACLⁿ`, `K ≥ 1`). The dimension-one extension is declared in the
  Conventions with its witness.
- 2.4: Rickman1993 Ch. I, uncertified; every value recomputed.
- 2.5, 2.6, 2.7: Rickman1993 Ch. I, uncertified; the routes use only pinned declarations
  (above) and the gaps.
- 2.8: HP Lemma B.2, lines 1255–1260: closed `M`, piecewise smooth `κ`, continuous `ρ : M → ℝ`
  with a smooth extension on each `n`-simplex image, conclusion `ρ ∈ W^{1,∞}(M, ℝ)`; the proof
  (lines 1266–1316) tests a candidate differential against `(n − 1)`-forms and cancels the face
  integrals of opposite orientation, which is Stokes on each simplex as the README says. The
  README states the locally Lipschitz form on every `M` and attributes only the closed case.
- 2.9: MRV lines 409–412 and P lines 22–26 as for 2.1; P's `J_f = det(Df)` is the Euclidean form.
- 3.1: MRV lines 413–419: `K_O`, `K_I`, `K(f) = max`, `K`-quasiregular means `K(f) ≤ K`, and all
  three are `∞` off the class (lines 418–419). Supports the definition and the "maximal sense".
- 5.2: Vaisala1971 Ch. 3 and Rickman1993 Ch. I, uncertified; the route uses only pinned
  declarations and is recomputed below.
- 6.3: HP Lemma B.2 as for 2.8.
- 7.1: HP lines 20–21 (non-constant quasiregular `ℝⁿ → N`, `N` connected oriented) and 271–273
  (`K`-quasiregularly elliptic: a witness with constant `K` in (1.1)); P lines 26–27.
- 7.5: HP lines 52–57 (the `n`-torus is quasiregularly elliptic, in the sentence on Prywes's
  bound); P lines 35–36. Supports the flat-torus example; the flat-manifold statement is the
  author's and is recomputed below.
- Also re-read: HP 1234–1245 (piecewise smooth triangulations ask for a smooth extension to a
  neighbourhood of the standard simplex in its plane, lines 1240–1242, as §6.1 says), 1247–1251
  (Proposition B.1, closed `M`, `N`, `n ≥ 2`), 1317–1339 (its proof; the local diffeomorphisms
  `ϕᵢ` at 1322–1327, the distortion bound at 1331–1338); MRV 117–125 (formal derivative and
  Jacobian), 332–340 (Definition 2.16: continuous `g`, absolutely continuous on almost every
  axis-parallel segment of every open `n`-interval with closure in `U`, `(n − 1)`-measure zero of
  the exceptional set, `ACL^p` when the partials are locally `L^p`; the README's closed boxes in
  `Ω` are the same condition), 420–425 (sense-preserving `K`-quasiconformal iff `K`-quasiregular
  homeomorphism; the projection satisfies (2.22) with `K = 1` and is not quasiregular), 438–439
  ((2.25) and "best possible"), 440–444 (Lemma 2.26).

**Adversarial pass** (the sampled targets, the headline theorems, the repaired passage; rows of
the round-2 table for untouched targets were spot-recomputed and agree).

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| Repaired Scope/contract: null sets from `TauCeti.IsNullSet` | `M = ℝ`, `s = {0}`; `s = (0, 1)`; `M = ∅`; countable union of points | `{0}`: Lebesgue measure `0` in every chart, null; `(0,1)`: measure `1 ≠ 0`, not null, interior non-empty, consistent with `interior_eq_empty`; `∅`: vacuously null; `ℚ`: null by `iUnion`, interior empty | holds; the pin provides what the Scope attributes to it | none |
| 1.1 `ℓ(A)` as `σₙ` and as a minimum | shear `[[1,1],[0,1]]`; `diag(3, 1/2)`; `diag(1,0)`; `0`; `n = 1` | `AᵀA = [[1,1],[1,2]]`, eigenvalues `(3 ± √5)/2`, `ℓ = (√5 − 1)/2 ≈ 0.618` (its square is `(3 − √5)/2`), `‖A‖ = (√5 + 1)/2`, `ℓ‖A‖ = 1 = normDet`; basis minimum `1 ≠ 0.618`; `ℓ = 1/2`, `‖A⁻¹‖ = 2`, product `1`; `ℓ = 0`, `‖A‖ = 1`; `ℓ = 0`; `|a|` | holds; wrong models (basis minimum, minimum over all `v`) excluded | none |
| 1.1 Lipschitz bound, composition, equality case | `A' = A + tI`; `B ∘ A` with `A = diag(1, 2)`, `B = diag(2, 1)`; `A = σU` | `|Av| ≤ |A'v| + ‖A − A'‖` on the unit sphere, so `|ℓ(A) − ℓ(A')| ≤ ‖A − A'‖`; `ℓ(BA) = 2 ≥ 1·1`; `A^*A = σ²I` iff all `σᵢ = σ` iff `ℓ = ‖A‖` | holds | none |
| 1.2 `q_O`, `q_I` conventions | `diag(2,1)`; `R = diag(−1,1)`; `0`; `R∘R = id`; `−id` for `n = 2, 3`; `c < 0` odd `n` | `4/2 = 2`, `2/1 = 2`; `q_O = ∞`, `q_I = 0`, naive `−1`; `0`, `0`; `q_I(id) = 1 > 0 = 0·0`; `J = 1`, `q_O = 1`; `J = −1`, `q_O = ∞`; `J(cA) = cⁿJ(A) < 0` | holds; sign hypothesis of `q_I`-submultiplicativity needed | none |
| 1.2 submultiplicativity of `q_O` for all `A`, `B` with `0·∞ = 0` | `A = 0`, any `B`; `J(A) ≤ 0`, `A, B ≠ 0`; `J(A), J(B) > 0` | `q_O(0) = 0 ≤ 0`; RHS `= ∞·q_O(B)` with `q_O(B) ≥ 1` or `∞`, so `∞`; `‖BA‖ⁿ ≤ ‖B‖ⁿ‖A‖ⁿ`, `J(BA) = J(B)J(A)` | holds in all three cases | none |
| 1.2 `q_O ≤ 1` iff `A = 0` or `λU`; lower semicontinuity | `λU`; `A ≠ 0`, `J(A) ≤ 0`, `A_k → A` with `J(A_k) > 0` | `q_O = Π σ₁/σᵢ = 1` iff all `σᵢ` equal, then `J(A) = σ₁ⁿJ(U) > 0` forces `J(U) = 1`; `‖A_k‖ⁿ → ‖A‖ⁿ > 0`, `J(A_k) → 0⁺`, quotient `→ ∞ = q_O(A)`; at `A = 0` the value `0` is a lower bound | holds; `q_O` is lower semicontinuous, `q_I` too (its value is `0` at every point of discontinuity) | none |
| 1.3 `‖A‖ⁿ ≤ KJ` iff `q_O ≤ K`, `K ≥ 0`; (2.25) and equality cases (headline 1) | `K = −1`, `R`; `diag(4,2,1)`; `diag(2,2,1)`; `diag(2,1,1)`; `diag(1,1,1/2)`; `diag(3,2,1)`; `n = 1` | `1 ≤ 1` true, `∞ ≤ −1` false; `q_O = 64/8 = 8`, `q_I = 8/1 = 8`, `8 < 64` both; `q_O = 2`, `q_I = 4 = 2²`; `q_O = 4 = 2² = q_I²`; `q_O = 2`, `q_I = 4 = q_O²`; `q_O = 9/2`, `q_I = 6`, `6 < 81/4`, `9/2 < 36`; exponent `0`, `1 ≤ 1` | holds; equality iff `σ₁ = … = σ_{n−1}` resp. `σ₂ = … = σₙ`, from `q_I ≤ (σ₁/σₙ)^{n−1} ≤ q_O^{n−1}` with both steps equalities | none |
| 1.4 `q_S` and (2.24) | `id`; `diag(2,1)`; `diag(1,ε)`; `diag(1,ε,ε)`; `0`; `R` | `n^{n/2}/n^{n/2} = 1`; HS² `= 5`, `q_S = 5/4`, `q_O = 2`, `5/4 ≤ 2 ≤ 5/2`; `q_O/q_S = 2/(1+ε²) → 2`; `3^{3/2}/(1+2ε²)^{3/2} → 3^{3/2}`; `0 ≤ 0 ≤ 0`; `∞ ≤ ∞ ≤ ∞` | holds; `q_S ≥ 1` by AM–GM on `σᵢ²` with equality iff all equal; `q_S ≤ q_O` from `Σσᵢ² ≤ nσ₁²`, `q_O ≤ n^{n/2}q_S` from `σ₁² ≤ Σσᵢ²`, strict for `n ≥ 2`, `J > 0` | none |
| 2.1 definition | winding map of `ℝ³`; fold on `x₁ < 0`; `max(0,t)` in `n = 1`; `0 ≤ K < 1`; `M = ∅` | `8 ≤ 2K` iff `K ≥ 4`; `‖DF‖ = 1`, `J = −1`, `1 ≤ −K` false; `1 ≤ K`, `0 ≤ 0`; `‖Df‖ⁿ ≤ KJ_f ≤ K‖Df‖ⁿ` gives `(1−K)‖Df‖ⁿ ≤ 0`, `Df = 0`; vacuous, `1`-quasiregular | holds | none |
| 2.4 Jacobian sign and integrability | `z²`; projection `P` of `ℝⁿ`, `n ≥ 2`; radial `a > 0` | `J = 4|z|² ≥ 0`, `Df = 0` only at `0`; `J = 0`, `DP ≠ 0`, not QR; singular values `a|x|^{a−1}`, `|x|^{a−1}` (`n−1` times), `J = a|x|^{n(a−1)}`, `∫₀¹ r^{n(a−1)} r^{n−1} dr < ∞` iff `na > 0` | holds | none |
| 2.5 restriction and locality | shear `(x, y + x³/3)` on `{|x| < R}` and on `ℝ²`; `z²` on `{Re z > 0}`; `M = ∅`, empty cover | `Df = [[1,0],[x²,1]]`, `J = 1`, `DfᵀDf` has trace `2 + x⁴`, det `1`, `‖Df‖ = (x² + √(x⁴+4))/2` (its square is the top eigenvalue), `K_O = ((R² + √(R⁴+4))/2)² < ∞`, `K_O(f) = ∞`; injective, `K_O = 1`; `max(1, 0) = 1` | holds; locally QR is not QR | none |
| 2.6 vanishing differential (sampled) | two balls to two points; Cantor map `(c(x₁), 0)`; `M = ∅` | `Df = 0`, not constant, so connectedness is used; classical derivative `0` a.e., not constant, not `W^{1,1}_loc` since `ACL` would force `c` absolutely continuous (pinned Cantor lemma); vacuous | holds; route: scalar coordinates in a chart ball with zero gradient are a.e. constant (pin :436), continuity makes them constant, connectedness glues | none |
| 2.7 `C¹` maps | `z²`; `−id` on `ℝⁿ`; `(x³, y)`; orbit projection to `ℝⁿ/ℤⁿ`; an a.e. bound | `1`-QR, not injective; `J = (−1)ⁿ`, `1`-QR iff `n` even; `df = diag(3x², 1)`, `q_O = max(3x²,1)²/(3x²) → ∞`, at `x = 0` `df ≠ 0`, `J = 0`, `q_O = ∞`; `‖dπ‖ = 1 = J`; the failure set `{‖df‖ⁿ − KJ > 0}` is open and null, hence empty | holds; `ess sup = sup` because `{q_O(df) > t}` is open and non-empty for `t < sup`, so of positive measure (`q_O ∘ df` lower semicontinuous, `isOpenPosMeasure`) | none |
| 2.8 locally Lipschitz in charts | winding map; fold; `|x|^{1/2}` on `ℝ` | `((x²−y²)/r, 2xy/r, z)`, degree-one homogeneous, singular values `2, 1, 1` (unit tangential vector to `2 e_θ'`), `J = 2`, `q_O = 8/2 = 4`, `q_I = 2/1 = 2`; `1`-Lipschitz, `J = −1` on `x₁ < 0`; derivative `|x|^{−1/2}/2 ∈ L^p_loc` iff `p < 2` | holds; the pinned Lipschitz lemma needs `[FiniteDimensional ℝ F]`, satisfied by the model | none |
| 2.9 Euclidean domains | radial `a > 0` through `off_countable` with `s = {0}`; `a = 0`; `o` on `Ω`, `−o` on `E` | continuous at `0` (`|x|^a → 0`), `‖U‖ ≍ |x|^{a−1}` locally integrable iff `a > 1 − n`, `‖U‖ⁿ` iff `a > 0`; `K_O = aⁿ|x|^{n(a−1)}/(a|x|^{n(a−1)}) = a^{n−1}`, `K_I = a` for `a ≥ 1`, `K_O = 1/a`, `K_I = a^{1−n}` for `a < 1` (agrees with the Conventions witness `a = 1/2`, `n = 3`: `2`, `4`, and §2.2's `a = 2`: `4`); `x/|x|` discontinuous, `|x|^{−n}` not integrable; `J = −det Du = −1` for the identity | holds | none |
| 3.1 inner and maximal distortion | radial `a = 1/2`, `a = 2` in `ℝ³`; projection `P`; `z + z̄/2`; `K(f) = 1` | `(K_O, K_I, K) = (2, 4, 4)`, `(4, 2, 4)`; `q_I(DP) = 0` everywhere, `K_I(P) = ∞` by definition (unconditional ess sup would give `1`); `|a| = 1`, `|b| = 1/2`, `K_O = K_I = (3/2)/(1/2) = 3`; a.e. `Df = 0` (`q_I = 0`) or `J > 0` with `q_O = 1` iff all `σᵢ` equal iff `q_I = 1` | holds; `K_I < ∞` for QR `f` from `q_I ≤ q_O^{n−1}` a.e. | none |
| 3.2 (2.25) for maps (headline 1) | radial `a = s`, `a = 1/s`, `n ≥ 2`; `diag(3,2,1)`; `n = 1`; `Df = 0` points | `(K_I, K_O) = (s, s^{n−1})` and `(s^{n−1}, s)`, both equalities attained; `9/2`, `6`, strict; `1 = 1`; both quotients `0` | holds, sharp | none |
| 5.1, 5.2 `ACL^p = W^{1,p}_loc` (headline 2) | `|x₁|` on `ℝ²`; Cantor `c(x₁)`; `|x|^{1/2}` on `ℝ²`; indicator of `{0}`; `C¹` | `(sign x₁, 0)`, `ACL^∞`; partials `0` a.e., not `ACL` (Cantor lemma at the pin); `|∇u| = |x|^{−1/2}/2`, `∫₀¹ r^{1−p/2} dr < ∞` iff `p < 4`, both sides; AC on a.e. line, not continuous, not `ACL`; `Du = fderiv u` | holds; (⇐) uses the pinned line lemmas on `Ioo` with a continuous representative on `Icc`, which is what the box condition asks | none |
| 6.3 piecewise `C¹` maps locally Lipschitz | `|t − 1/2|` on `[0,1]`; eight-sector map; a segment covered by `m` closed pieces | `L = 1` on each piece and on the whole; `L = [[1,−1],[0,√2]]` sends `e₁ ↦ e₁`, `(1,1)/√2 ↦ e₂`, `det = √2`, `LᵀL = [[1,−1],[−1,3]]`, eigenvalues `2 ± √2`, Lipschitz constant `√(2+√2) ≈ 1.848` on each sector, `q_O = q_I = (2+√2)/√2 = 1 + √2`; chain `t₀ = s`, `t_{k+1} = max(C_{j_k} ∩ [t_k, t])`, each index used once, at most `m` steps, `|f(t) − f(s)| ≤ L(t − s)` | holds; gluing needs only closed pieces and a finite cover | none |
| 6.4 simplicial QR (headline 3) | `id`; doubling on `T²`; strip map; collapse; fold | `1`; `dp = diag(2,1)`, `4/2 = 2`; `q_O = k²/k = k`, `K_p = ∞`; rank `n−1`, `J = 0`; reversing on `x₁ < 0` | holds (round-2 values re-confirmed) | none |
| 7.1 ellipticity | `ℝⁿ`; ball in place of `ℝⁿ`; constants; `n = 1`; isometries of `ℝⁿ` and `N` | `id`, `K = 1`; a chart ball with bounded distortion on the closed ball makes every `N` elliptic; always QR, excluded by "non-constant"; `ℝ`, `ℝ/ℤ`; `K_θ = 1` (§4.3), `K' = 1` (§4.4), non-constancy preserved | holds; `J_f > 0` on positive measure iff non-constant, by §2.6 on connected `ℝⁿ` | none |
| 7.2, 7.3 independence (headline 4) | `f ∘ R`; `c²g_N`; `dx² + 4dy²` on `T²` | `J_{(std,−o_N)}(f∘R)(x) = J_f(Rx)·J_{(std,−std)}(R) = J_f(Rx)·1`; factor `1`; bound `4`, true value `1` | holds (round-2 values re-confirmed) | none |
| 7.5 flat manifolds (headline 5) | `ℝⁿ/ℤⁿ`; `exp`; `ℂ → ℂ/(ℤ+iℤ)`; Klein bottle; rotation by `π`; `Sⁿ`; closed orientable flat `N` with its given orientation | `J_π = 1`, `K_O = 1`; `f' ≠ 0`, `J = |f'|² > 0`, conformal; same; glide reflections reverse orientation, excluded; fixes `0`, not free; `dσ = 2/(1+|x|²)·isometry`, `q_O = 1`; Killing–Hopf gives an isometry `ℝⁿ/Γ ≅ N`, the composite `ℝⁿ → N` is a local Riemannian isometry, its pullback of `o_N` is `±std` on connected `ℝⁿ` (pin :172), so bullet 2 applies with `o_N` directly and the descent gap is used only for the remark | holds; the pinned `quotient` is `descend` along the orbit projection, so `isLocalRiemannianIsometry_descend` applies as cited | none |
| 7.6 tori (headline 6) | `T = N = ℝ²`, grid, `s = π = id`; doubling of `T²`; degenerate `s` | `K_π = K_p = 1`, `id` non-constant, `1`-QR, `N` open; `2`; excluded by §6.4 | holds (round-2 values re-confirmed) | none |

Notes that are not findings: §2.6 has two Checks, which is the rule for theorems (three are
required for definitions); the hypothesis "`T` connected" in §7.6 is unused, as noted in round 2.

**Ownership against open work.** `roadmaps grep` over main and the open heads (464 pull
requests): `quasiregular` (only the measure-theoretic `StronglyQuasiregularMap` of
GeometryOfNumbersAndQuadraticArithmetic and quasiregular semiperfect rings in
CrystallineCohomology); `ACL^p`, `ACL-mapping`, `absolutely continuous on lines` (no match);
`outer|inner|bounded distortion`, `minimal stretch`, `outer dilatation` (no match);
`quasiregularly elliptic` (no match); `smooth triangulation` (PlanarTopology: Whitehead's theorem;
HomotopySpheres and ArithmeticLocallySymmetricSpaces consume GeometricTopology Layer 11);
orientation descent to orbit spaces (no match beyond DifferentialGeometry's own orientation
sections); `Sobolev maps between manifolds` (PseudoholomorphicCurveAnalysis 4.1 on main,
`kp > 2`, above). The board index lists three unrelated packages. No open pull request builds
the objects of Layers 1–7. Ownership against open pull requests was checked through the tool
over all open heads.

**Overlaps** (`scratch/overlaps.md`, re-read). No open pull request changes this roadmap. No id
this README cites is dropped by an open pull request (the round-2 lead is repaired). No id only an
open revision defines. This design drops no id others cite. Closest in vocabulary:
SobolevDifferentialForms, DifferentialGeometry (two heads), TeichmullerGeometry,
SobolevPolynomialApproximation; none owns distortion, quasiregular maps, `ACL^p` maps,
simplicial maps of triangulated manifolds or quasiregular ellipticity.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, seven layers in build order with `### Examples` and `### Dependencies`, Worked examples,
Downstream consumers, References. Ten definitions (1.1, 1.2, 1.4, 2.1, 2.2, 3.1, 3.4, 5.1, 6.2,
7.1) with API lists and 3–5 Checks each; every theorem carries its hypotheses in the sentence
and a locator; every `*Needs:*` line names its inputs. No LaTeX delimiters, no pull-request
numbers, no process words, no machine paths, no `lemma` as a Lean keyword, no target-numbering
tables; Unicode mathematics with ASCII in code spans; the vocabulary is the literature's.

**Headline theorems and statability at the pins** (no `Suggested.lean` at the design stage).
The Summary's six end theorems: (1) `K_I ≤ K_O^{n−1}`, `K_O ≤ K_I^{n−1}` (§3.2); (2)
`ACL^p = W^{1,p}_loc` for continuous maps (§5.2); (3) non-degenerate orientation-preserving
simplicial maps with `K_p < ∞` are quasiregular (§6.4); (4) ellipticity independent of
orientation and, for closed manifolds, of the metric (§7.2, §7.3); (5) closed orientable flat
manifolds are `1`-quasiregularly elliptic (§7.5); (6) simplicial branched coverings by tori
(§7.6). At the pins, (2) is statable (`AbsolutelyContinuousOnInterval`, `TauCeti.HasWeakFDerivOn`
exist) and (1) in its Euclidean form through §2.9 with `LinearMap.det`; (3)–(6) need
`W^{1,n}_loc(M, N)` of SobolevMapsBetweenManifolds and are not statable until it exists. The
package stage must state (2) and the Euclidean (1), named as Euclidean so that README and Lean
generality agree, and name (3)–(6) in the module docstring with the missing carrier. The
one-tactic padding probe does not apply at the design stage.

## Not verifiable

- Rickman1993 Ch. I and Ch. VI, Vaisala1971 Ch. 3, Reshetnyak1989 Ch. II, IwaniecMartin2001
  Ch. 6, Ahlfors2006 Ch. I, BonkHeinonen2001 Theorem 1.1, Gromov1981 p. 200, Gromov1999 Ch. 2:
  settled as uncertified in the manifest and not requested. They are cited at chapter level for
  standard facts, routes, or Part II/III targets; every value the sampled targets take from them
  was recomputed in the table.
- The Annals versions of HeikkilaPankka2025 and Prywes2019: the arXiv versions were read; the
  manifest records that their numbering is the one cited.
- Elaboration: not available (this lane does not elaborate; no Lean file at the design stage).

## Source issues

- **Misprint** in HeikkilaPankka2025 at Proof of Proposition B.1, line 1328 (arXiv v2, p. 24):
  the source writes the composite of the map and the Nash embedding in the wrong order, as the map
  followed by the embedding read right to left; it should be the embedding after the map, as on the
  next line; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9625ad7298330ffd40bcbc07148c2e784ea87722", "job": "REV-DESIGN-QuasiregularMaps~3", "model": "fable", "worker": "chris-x9"} -->
