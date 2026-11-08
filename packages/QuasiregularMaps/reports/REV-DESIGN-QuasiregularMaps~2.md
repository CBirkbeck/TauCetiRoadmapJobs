<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7415#issuecomment-6697569561 -->
Review (claude) of 5ab8144

Verdict: needs_changes

1. **F01** (P3) Downstream consumers cite a DifferentialGeometry id an open revision drops

   - Location: `packages/QuasiregularMaps/design/README.md` line 1489, "consumes Part II,
     DifferentialGeometry Layers 6–9 and SobolevDifferentialForms".
   - Claim: Part III's de Rham cohomology, de Rham theorem and Poincaré duality are
     DifferentialGeometry Layers 6–9.
   - Witness: on main `TauCetiRoadmap/DifferentialGeometry/README.md` lines 782–862 are Layers 6–9
     (de Rham complex, Mayer–Vietoris, de Rham theorem, Poincaré duality). The open revision of
     DifferentialGeometry (pull request 886, the `scratch/overlaps.md` lead) has no Layer 6–9 at its
     head: its layer list runs 0–5, 5.6, 12, and its "Relation to sibling roadmaps" says that
     DeRhamCohomologyAndDuality owns de Rham cohomology. DeRhamCohomologyAndDuality at the head of
     its own pull request (1768) in turn imports "DifferentialGeometry 6.1", "8.3" and "9.3"
     (its README lines 94, 72, 61–62). So at the heads the object is handed back and forth and the
     numbered citation breaks when either merges. The line is not a supplier citation of this roadmap
     (Part III is a future roadmap), so the rule under "Overlap with open pull requests" makes it P3.
     The repair report of round 1 noted the lead and left the line unchanged because neither head's
     numbering would fix it; that is right about the numbering, but the rule's other option, to state
     the object, was not taken.
   - Repair: name the object, not the layer numbers: "consumes Part II, de Rham cohomology with the
     de Rham theorem and Poincaré duality, and SobolevDifferentialForms"; Part III's own design cites
     whichever of DifferentialGeometry and DeRhamCohomologyAndDuality owns them when it is written.
     Tested on the witness: the sentence no longer names an id that either head drops, and it says
     the same mathematics.

Needs changes on one finding (R01, P3): a repair, whatever its priority, asks for a fix round.
Nothing blocks. Once R01 is applied, acceptance is conditional on the seven declared supplier
gaps (`sobolev-maps-class`, `sobolev-maps-weak-differential`, `sobolev-maps-norm`,
`sobolev-maps-jacobian`, `sobolev-maps-chain-rules`, `sobolev-maps-euclidean`,
`orientation-descent`). The four P3 findings of round 1 are repaired (checked below, finding by
finding). No P1 or P2 finding: no false statement, no vacuous target, no unowned prerequisite,
no upward or cyclic supply, no copied passage, no computational content, no re-planned roadmap.
Elaboration: not available (this lane does not elaborate; there is no Lean file at the design
stage).

## Round 1 findings, checked

- **F01 (locality supremum at the empty cover): repaired.** §2.5 line 628 now reads
  "`K_O(f) = max(1, sup_i K_O(f|_{U_i}))`; the `max` matters only for the empty cover of `M = ∅`,
  since every `K_O(f|_{U_i})` is at least `1`", with a third Check for `M = ∅` ("the supremum of
  the empty family in `[0, ∞]` is `0`"). `plan.json` 2.5 has the same statement and the test
  `local_empty_cover`. Values: `M = ∅`, empty cover: `K_O = 1 = max(1, 0)`; cover `{∅}` of `∅`:
  `max(1, 1) = 1`.
- **F02 ("bi-Lipschitz in charts" undefined): repaired.** §6.1 line 1135 now states the local
  form with its quantifiers: "for every `x ∈ σ` there are a neighbourhood `σ'` of `x` in `σ` and
  constants `0 < c ≤ C` such that `κ(σ')` lies in the source of the chart
  `φ = extChartAt 𝓘(ℝ, E) (κ x)` … `c |y − z| ≤ |φ(κ y) − φ(κ z)| ≤ C |y − z|`", in barycentric
  coordinates, with the remark that the property does not depend on the chart. The route uses the
  two mean value inequalities; §6.3 says that only this local form is used ("never a bound on a
  whole closed simplex"); the Scope bullet says "top simplices locally bi-Lipschitz in charts";
  Check 1 of §6.1 computes the circle example and Check 3 the failure at a vertex of the `t ↦ t²`
  reparametrisation. The three new Mathlib names exist at the pin (below).
- **F03 (§7.6 does not use "`N` closed"): repaired.** §7.6 now begins "Let `T` be a connected
  oriented Riemannian `n`-manifold" and says "No compactness of `N` is assumed"; closedness stays
  attached to HeikkilaPankka2025 (lines 32–34, 85–91, Proposition B.1 at line 1247). The witness
  `T = N = ℝ²`, integer grid with diagonals, `s = π = id`, is Check 4. The Summary bullets for §6.4
  and §7.6 were changed to match ("with bounded simplexwise distortion, in particular one with
  closed source"; "a connected oriented Riemannian manifold that receives …"). `plan.json` 7.6
  drops "N closed" from statement and hypotheses and adds `simplicial_elliptic_noncompact`.
- **F04 (§7.4 cites HeikkilaPankka2025 lines 85–91 for a fibre argument): repaired, differently.**
  §7.4 lines 1361–1365 now read "Postcomposing a non-constant quasiregular map `ℝⁿ → N` with a map
  `N → N'` is the construction of HeikkilaPankka2025 lines 85–91, there with a piecewise linear
  branched covering in place of `q` (§7.6)", and the discrete-fibre step is spelled out and
  uncited. I re-read HeikkilaPankka2025 lines 85–91: they compose a piecewise linear branched
  covering `T⁴ → N` with the locally isometric covering `ℝ⁴ → T⁴`; the new sentence describes
  exactly that, so the repair is correct and the reviewer's alternative (attach the locator to the
  finite-covering sentence) would indeed have mis-described the source, whose second map is
  branched. The same pattern in §7.2 ("It is non-constant because `R` is a bijection, so it is a
  witness in the sense of the definition (HeikkilaPankka2025 lines 20–21)") is correct: lines 20–21
  define the notion and the sentence cites them for the notion only.

## Verified sound

**Principles.** No route-specific shortcut. No re-planning: quasiconformal maps and weak
Wirtinger derivatives are consumed from TeichmullerGeometry §7.4 (at its open head, "7.4
Wirtinger derivatives, quasiconformal maps and the Beltrami equation": `W^(1,2)_loc`
homeomorphisms with `f_z̄ = μ f_z`, `‖μ‖_∞ < 1`, dilatation `(1 + ‖μ‖_∞)/(1 − ‖μ‖_∞)`, exactly as
§2.10 describes); the Sobolev carrier is consumed through declared gaps; orientations, null sets,
the Riemannian volume, quotient metrics and realizations through Tau Ceti. No copied passage, no
algorithm, no Lean file (so no sorry'd data and no `set_option`). Supply is downward only (gate
below).

**Dependency check.** Output of the gate command on the current README:

```
candidate: QuasiregularMaps is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2354 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean
name found nowhere (it does not check names outside TauCetiRoadmap; those were opened by hand,
below). `sources check` on `packages/QuasiregularMaps/sources.toml`: 0 problems. `plan.json`
parses; its seven `gaps` carry the same slugs, suppliers and sections as the README's supplier
contracts; every `target:` prerequisite points to an earlier target (Layers 1 and 5 independent;
§5.3 needs §2.9 and §3.1; §6.3 needs §2.8; Layer 7 needs Layers 4 and 6); no layer-level cycle.

**Supplier citations, resolved this round at the copy named.**

- SobolevMapsBetweenManifolds: a board target (`packages/SobolevMapsBetweenManifolds/target.md`,
  299 lines; no design, not on main, not in the merge order, not an open roadmap pull request).
  Its "Final targets" T1 (a)–(c), T2, T3, T4, T6 and "Scope" items 1–7 exist and say what the
  seven gap sections cite: T2 the chartwise class and `Df` with `IsNullSet` = `riemannianVolume`
  null sets; T3 `‖Df‖` with the `L^p` characterisation and metric comparison; T4 `J_f` with
  `|J_f| = normDet(Df)`, the sign law, Hadamard and `L¹_loc` for `p ≥ n`; T1 (a)–(b) the chain
  rules (Scope item 3 the manifold form); T6 `J_f = det Df`. It names QuasiregularMaps as its
  consumer and asks to precede it. Every use here is a gap.
- DifferentialGeometry on main: Layer 2 (line 341), 2.1 orientations (345), 2.2
  `IsOrientationPreservingAt` (352), 10.2 `IsNullSet` (884), 12.1 metrics (915), 12.4 volume form
  and `riemannianVolume` (923). Its Layer 2 has no orbit-space descent of an orientation, so
  `orientation-descent` is a genuine gap. Layers 6–9 (782–862) exist on main: see R01.
- RiemannianGeometry on main, R4 item 7 (`README.md` line 717 ff., Killing–Hopf and the quotient
  by free properly discontinuous isometries at line 749): as cited.
- GeometricTopology on main, Layer 11 (line 831): realizations, `|f|` for simplicial maps with the
  identity and composition laws, the finite-vertex compactness lemma (lines 849–861): as cited.
- PDE on main, Layer 1 "function spaces on a domain" (line 675): consumed through Tau Ceti only.
- TeichmullerGeometry (open pull request 1169, merge-order position 271, before the candidate):
  §7.4 as above.
- PseudoholomorphicCurveAnalysis on main defines `W^{k,p}_loc(Σ, M)` for surfaces with `kp > 2`
  (its 4.1) and hands quasiconformal maps to TeichmullerGeometry 7.4 (its Scope, line 65). It does
  not cover `p = n` in dimension `n`, so the gap `sobolev-maps-class` asks for nothing provided.

**Declared gaps.** Each has a named supplier; each `needs` sentence names one object with its
hypotheses (the class with chart independence, restriction, locality and the `C¹` case; `Df`
with the null-set agreement T2 bundles with it; `‖Df‖` with the `L^p_loc` characterisation;
`J(A)` and `J_f` with the four laws; the two chain rules; the Euclidean compatibility with
`J_f = det Du`; orientation descent for a free, properly discontinuous, orientation-preserving
action). None asks for what Mathlib, Tau Ceti or a main roadmap provides (greps for
`SobolevMap`, `Jacobian`, `orbitRel` in the orientation files, and the ownership greps below,
find nothing; `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` is scalar). The same slugs are
in `plan.json` and the README. `orientation-descent` is used only for the remark of §7.5 that
`ℝⁿ/Γ` carries an orientation; the flat-manifold headline uses the orientation the hypothesis
gives.

**Library declarations opened at the pins.** All 65 dotted names the README cites resolve in the
cited file. The three names added by the repair: `extChartAt`
`Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean:437`;
`Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le` `Mathlib/Analysis/Calculus/MeanValue.lean:423`
and its primed variant at line 527 (hypotheses: `HasFDerivWithinAt f (f' x) s x` on convex `s`,
`‖f' x − φ‖ ≤ C` on `s`; conclusion `‖f y − f x − φ(y − x)‖ ≤ C ‖y − x‖`, which is the lower
bound §6.1 derives). The triangulation carrier §6.1 is now phrased against:
`TauCeti.IsSimplexImmersion` `TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean:97` (a map
`F : (σ → ℝ) → M`, `ContMDiffOn` of order `n` within the standard simplex, with a derivative within
the simplex at every point that is injective on sum-zero vectors), `IsSmoothTriangulation` :191,
`exists_contMDiff_not_isSmoothTriangulation_trans` :365 (the `t ↦ t²` example of Check 3, stated
for every smoothness exponent). Re-opened this round: `LinearMap.singularValues`
`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`, `normDet`, `normDet_eq_prod_singularValues`,
`normDet_eq_abs_det` `NormDet.lean`; `Orientation.volumeForm*` `Orientation.lean`;
`AbsolutelyContinuousOnInterval.ae_differentiableAt` `MeasureTheory/Function/AbsolutelyContinuous.lean`;
`integral_mul_deriv_eq_deriv_mul` `IntervalIntegral/AbsolutelyContinuousFun.lean`;
`volume_preserving_piFinSuccAbove` `Constructions/Pi.lean`;
`IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero` `AEEqOfIntegralContDiff.lean`;
`LipschitzWith.ae_differentiableAt` `Rademacher.lean`; `DifferentiableAt.conformalAt`
`Complex/Conformal.lean`; Tau Ceti `TauCeti.HasWeakFDerivOn` `WeakDeriv/Basic.lean:251`,
`Module.Basis.hasWeakFDerivOn_of_forall` :657 (`[CompleteSpace F]`),
`LocallyLipschitzOn.hasWeakFDerivOn_fderiv` `WeakDeriv/Lipschitz.lean:134` (`[FiniteDimensional ℝ F]`),
`HasWeakLineDerivOn.absolutelyContinuousOnInterval` `WeakDeriv/Interval.lean:302`, `.ae_hasDerivAt` :318,
`W1p.exists_value_ae_eq_const_of_gradient_eq_zero` `Poincare/Wirtinger/W1p.lean:436`,
`DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank` `Sard/LowDimension.lean:73`,
`IsNullSet` `Manifold/Measure.lean:36`, `.iUnion` :72, `.interior_eq_empty` :89
(`[FiniteDimensional ℝ E]`), `Manifold.Orientation` `Orientation/Basic.lean:32`, `orientationAt`
:140, `eq_or_eq_neg` :172 (`[PreconnectedSpace M]`), `model` :235, `pullback`
`Orientation/Pullback.lean:173` (`ContMDiff I I' 1 f`), `restrict` `OpenSubset.lean:49`,
`IsLocalRiemannianIsometry` `Riemannian/Isometry/Local.lean:70`,
`Bundle.ContMDiffRiemannianMetric.quotient` `Riemannian/Pullback/Descent.lean:258`
(`[ContMDiffConstSMul I ∞ G M] [IsManifold I ∞ M]`), `isLocalRiemannianIsometry_descend` :189,
`isLocalDiffeomorph_quotientMk` `Instances/Quotient.lean:253`, `W1p` `W1p/Basic.lean:372`, the
realization, simplicial-map, purity and compactness declarations in
`TauCeti/AlgebraicTopology/SimplicialComplex/`. The hypotheses the README attributes to them
(continuity near the point not included in `IsOrientationPreservingAt`; local finiteness and
purity not included in `IsSmoothTriangulation`; `PreconnectedSpace` for `eq_or_eq_neg`) are as
stated.

**Sources, seeded sample** (MartioRickmanVaisala1969 = MRV, HeikkilaPankka2025 = HP,
Prywes2019 = P; all read in the cache at the cited lines, the MRV scan noisy but legible).

- 1.1: MRV line 127 sets `|T|` and `ℓ(T)` as the maximum and minimum of `|Tx|` over unit
  vectors; supports the statement.
- 1.3: MRV line 438, (2.25) `K_O ≤ K_I^{n−1}`, `K_I ≤ K_O^{n−1}`; line 439 "best possible". The
  pointwise form and the equality cases are the author's, verified in the table.
- 2.1: HP lines 22–27 (continuous `f` in `W^{1,n}_loc(M, N)`, `‖Df‖ⁿ ≤ K J_f` a.e., `K ≥ 1`,
  stated for `n ≥ 2`); P lines 22–26 (the same with `J_f = det Df`); MRV lines 409–412
  (Definition 2.20 with `ACLⁿ`). The design's `n ≥ 1` is declared in the Conventions, with the
  dimension-one witness; the extension is the author's and is marked as such.
- 2.3: MRV lines 412–413, the smallest `K ≥ 1` is the outer dilatation.
- 2.4, 4.3, 4.4: Rickman1993 Ch. I, uncertified (below); the statements are standard and every
  value was recomputed.
- 3.2: MRV lines 438–439 as for 1.3; the sharpness examples are the author's radial stretches,
  verified in the table.
- 4.2: HP lines 20–27 define the class on oriented manifolds; the sign law is the author's,
  verified in the table.
- 5.1: MRV lines 332–340, Definition 2.16: continuous `g`, absolute continuity on almost every
  axis-parallel segment of every open `n`-interval with closure in `U`, `(n−1)`-measure zero of
  the exceptional set, `ACL^p` when the partials are locally `L^p`. The README's closed boxes in
  `Ω` give the same condition.
- 6.3: HP Lemma B.2, lines 1255–1260 (closed `M`, piecewise smooth `ρ`, conclusion `W^{1,∞}`),
  proof lines 1261–1316 by Stokes with cancelling face integrals. The README states the local
  Lipschitz form on every `M` and attributes only the closed case to the source.
- 7.1: HP lines 20–21 (quasiregularly elliptic) and 271–273 (`K`-quasiregularly elliptic:
  a non-constant witness with constant `K` in (1.1)); P lines 26–27.
- 7.3: HP lines 20–27 define the notion only; metric independence is the author's (§4.1).
- 7.5: HP lines 52–57 (the torus is quasiregularly elliptic, in the sentence on Prywes's bound);
  P lines 35–36.
- 7.6: HP lines 32–34 (a piecewise linear branched covering `Tⁿ → N`, quasiregular for the smooth
  structures, makes `N` quasiregularly elliptic) and 85–91 (the composition with `ℝ⁴ → T⁴`);
  Proposition B.1, lines 1247–1251 (closed `M`, `N`, `n ≥ 2`, non-degenerate orientation-preserving
  PL map compatible with the smooth structures). The README states the generalisation and says so.
- Also re-read: HP 16–19 (Theorem 1.1), 94–96 (Corollary 1.2), 1234–1245 (piecewise smooth
  triangulations ask for an extension to a neighbourhood in the plane of the simplex; the README
  notes that Tau Ceti's within-simplex form suffices), 1317–1339 (proof of B.1, the local
  diffeomorphisms `ϕᵢ` at 1322–1327, the distortion bound at 1331–1338); MRV 117–125 (formal
  derivative, Jacobian), 420–425 (sense-preserving `K`-quasiconformal iff `K`-quasiregular
  homeomorphism; the projection satisfies (2.22) with `K = 1`), 426–436 ((2.23) with `n^{n/2}`,
  (2.24) best possible), 440–444 (Lemma 2.26).

**Adversarial pass** (changed passages, the seeded sample, the headline theorems; rows of the
round-1 table for untouched targets were spot-recomputed and agree).

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| Conv. operator-norm normalisation | `diag(2,1)` | `‖A‖² = 4`, `J = 2`, least `K = 2`; HS `(4+1)/(2·2) = 5/4` | normalisations differ as stated | none |
| Conv. `q_O`, `q_I` at `J ≤ 0`, at `0` | `R = diag(−1,1)`; `0`; `diag(1,0)` | `‖R‖²/J = −1` naive, `q_O = ∞`, `q_I = 0`; `0`, `0`; `1/0` set to `∞` | conventions pinned by witnesses | none |
| Conv. orientation sign | `id : (ℝ²,std) → (ℝ²,−std)`; reflection to `−std` | `−1`; `−det R = −(−1) = 1` | holds | none |
| 1.1 `ℓ(A)` | shear `[[1,2],[0,1]]`; `id` vs `0` (Weyl); `diag(1,0)`; `n = 1` | `AᵀA = [[1,2],[2,5]]`, eigenvalues `3 ± 2√2`, `ℓ = √2 − 1 ≈ 0.414`, `‖A‖ = √2 + 1`, `ℓ‖A‖ = 1 = normDet`; basis minimum `1 ≠ 0.414`; `|1 − 0| ≤ 1`; `ℓ = 0`, `‖A‖ = 1`; `|a|` | holds; wrong models excluded | none |
| 1.1 equality `ℓ = ‖A‖`; `ℓ > 0` iff injective | all `σᵢ = σ`; equal dimensions | `A^*A = σ²I`, `A = σU`; injective iff `σₙ > 0`, `‖A⁻¹‖ = 1/σₙ` | holds | none |
| 1.3 `‖A‖ⁿ ≤ KJ` iff `q_O ≤ K`, `K ≥ 0` | `diag(1,0)`, `K = 0`; `A = 0`, `K = 0`; `R`, `K = −1` | `1 ≤ 0` false, `∞ ≤ 0` false; `0 ≤ 0`, `0 ≤ 0`; `1 ≤ 1` true but `∞ ≤ −1` false | holds for `K ≥ 0`; `K ≥ 0` needed | none |
| 1.3 `J ≤ Kℓⁿ` iff `q_I ≤ K` | `J ≤ 0`, `K ≥ 0` | LHS true, `q_I = 0 ≤ K` | holds | none |
| 1.3 (2.25) pointwise, equality cases (headline 1) | `diag(4,2,1)`; `diag(2,2,1)`; `diag(2,1,1)`; `n = 2`; `n = 1` | `q_O = 64/8 = 8`, `q_I = 8`, `8 < 64` both; `q_O = 8/4 = 2`, `q_I = 4 = 2²` (`σ₁ = σ₂`); `q_O = 4 = 2² = q_I²` (`σ₂ = σ₃`); `q_O = q_I = σ₁/σ₂`; exponent `0`, `1 ≤ 1` | holds; equality iff `σ₁ = … = σ_{n−1}` resp. `σ₂ = … = σₙ`, as computed from `q_I = Π_{i≤n−1} σᵢ/σₙ ≤ (σ₁/σₙ)^{n−1}` and `q_O = σ₁/σₙ` iff `σ₂ = … = σ_{n−1} = σ₁` | none |
| 2.1 definition | winding map of `ℝ³`; fold on `x₁ < 0`; `max(0,t)` in `n = 1`; `0 ≤ K < 1` | `8 ≤ 2K` iff `K ≥ 4`; `1 ≤ K·(−1)` false; `1 ≤ 1`, `0 ≤ 0`; `(1 − K)‖Df‖ⁿ ≤ 0` forces `Df = 0` | holds | none |
| 2.3 attainment | radial `a = 2` in `ℝ³`; fold; `M = ∅` | set `[4, ∞)`, `K_O = a² = 4`; `∅`, `K_O = ∞`; ess sup for the zero measure `0`, `K_O = 1`, set `[1, ∞)` | holds | none |
| 2.4 Jacobian | `z²`; radial `a > 0` in `ℝ³`; projection | `J = 4|z|² = ‖Df‖²`, `normDet(2z·) = 4|z|²`; `∫₀¹ a r^{3a−3} r² dr = 1/3 < ∞`; `J = 0`, `DP ≠ 0`, not QR | holds | none |
| 2.5 locality (F01) | `M = ∅`, empty cover; cover `{∅}` of `∅`; shear `(x, y + x³/3)`, cover `{ℝ²}`; `z²`, cover by `{Re z > 0}`, `{Re z < 0}`, `{|Re z| < 1}` | `1 = max(1, 0)`; `1 = max(1, 1)`; `∞ = ∞`; `1 = max(1, 1, 1, 1)` | holds; bare sup fails only at the empty cover | F01 verified |
| 3.2 (2.25) for maps (headline 1) | `diag(4,2,1)` linear; radial `a = 3`, `a = 1/3` in `ℝ³`; `n = 1`; `Df = 0` a.e. points | `K_O = K_I = K = 8`, `8 ≤ 64`; `(K_I, K_O) = (3, 9)`, `(9, 3)`, equality; `K_O = K_I = 1`; both quotients `0` | holds; sharp for `n ≥ 2`; maximal sense: `K(f) ≤ K ⇒ K_O ≤ K`, `K_O ≤ K ⇒ K(f) ≤ K^{n−1}` (uses `K ≥ 1`) | none |
| 4.2 orientations | `−id` on `ℝ³` from `std` to `−std`; `id` to `−std`; QR for both `(o,o_N)` and `(o,−o_N)` | `J = −det(−id) = 1`, `1`-QR; `J = −1`; `J ≥ 0` and `−J ≥ 0` give `J = 0`, then `Df = 0` by 2.4 | holds | none |
| 4.3 precomposition | `θ = (2x, y)` on `ℝ²`, `f = id`; `θ = π : ℝⁿ → Tⁿ`; shear; reflection | `K_θ = 4/2 = 2`, `K_O(θ) = 2 ≤ 2·1`, `K_I(θ) = 2/1 = 2`; `K_π = 1`, same `K_O`; `K_θ = ∞`, excluded; `J = −1`, excluded | holds; `K_I` bound uses `J(dθ) > 0`, `J_f ≥ 0` | none |
| 4.4 postcomposition | `z²` after `z + z̄/2`; isometry after `f`; radial `a = 2` after `a = 1/2`; `K' = 0` | `q_O(dg∘Df) = 1·3`, `K_O ≤ 1·3`; unchanged; identity, `1 ≤ 4·2`; `dg = 0`, `g` constant, "`0`-quasiregular" false | holds; `K' ≥ 1` carried by "`K'`-quasiregular" (§2.1) and by `plan.json` 4.4 | none |
| 5.1 `ACL`, `ACL^p` | `|x₁|`; Cantor; `|x|^{1/2}` in `ℝⁿ`; indicator of `{0}` | `(sign x₁, 0)`; not AC; `∫_{|x|<1}|x|^{−p/2} = c∫₀¹ r^{n−1−p/2} dr < ∞` iff `p < 2n`, `p < 4` for `n = 2`; AC on a.e. line, not continuous | holds | none |
| 5.2 `ACL^p = W^{1,p}_loc` (headline 2) | `|x|^{1/2}`; Cantor; `C¹` | `p < 4` both sides; neither (the distributional derivative of `c` is the Cantor measure, not a function); `Du = fderiv u` | holds | none |
| 6.1 local bi-Lipschitz (F02) | inscribed triangle on `S¹`; `t ↦ t²`; affine triangulation of `ℝ` | `|p(t)|² = (1−t)² + t² − t(1−t) = 1 − 3t + 3t² ∈ [1/4, 1]`, `p × p' = sin(2π/3) = √3/2`, `dθ/dt ∈ [√3/2, 2√3]`, arc `2π/3 < π` misses antipodes; `|y² − z²|/|y − z| = y + z → 0`, lower bound fails; `c = C = 1` | holds for `C¹` triangulations; fails exactly where the differential is not injective | F02 verified |
| 6.1 route, lower bound | `|A(x)v| ≥ c₀|v|` on sum-zero `v`, `‖A(y) − A(x)‖ ≤ c₀/2` on convex `σ'` | primed MVT: `|φκy − φκz| ≥ c₀|y−z| − (c₀/2)|y−z| = (c₀/2)|y−z|` | holds | none |
| 6.1 local finiteness | compact `C`, compact neighbourhood `C'` | a simplex meeting the interior of `C'` has `σ° ∩ int C' ≠ ∅`, its vertices in the finite `V₀` of the lemma | holds | none |
| 6.3 gluing (F02) | `[0,1] = [0,1/2] ∪ [1/2,1]`, `f = |t − 1/2|`; eight-sector map | `L = 1` on each piece and on the whole; `L = [[1,−1],[0,√2]]`, `LᵀL = [[1,−1],[−1,3]]`, eigenvalues `2 ± √2`, `det = √2`, Lipschitz constant `√(2+√2) ≈ 1.848` on each sector and on `ℝ²`, `q_O = (2+√2)/√2 = 1 + √2` | holds; pieces can be taken closed (`σ ∩ closedBall`) | none |
| 6.4 simplicial QR (headline 3) | `id`; doubling on `T²` (`6×3` to `3×3` grid); strip map; collapse; fold | `1`; cell `[i/6,(i+1)/6]×[j/3,(j+1)/3] ↦ [i/3,(i+1)/3]×[j/3,(j+1)/3]`, `dp = diag(2,1)`, `4/2 = 2`; `q_O = k²/k = k`, `K_p = ∞`; rank `n−1`, `J = 0`; reversing on `x₁ < 0` | holds; `K_O(p) = max(1, K_p)` from continuity on `κ₁(σ°)` and full support | none |
| 7.1 ellipticity | `ℝⁿ`; ball in place of `ℝⁿ`; constants; `n = 1` | `id`, `K = 1`; a chart ball is QR with bounded distortion, every `N` elliptic; constant always QR; `ℝ`, `ℝ/ℤ` | holds | none |
| 7.2 orientation independence (headline 4, F04 pattern) | `f ∘ R` | `J_{(std,−o_N)}(f∘R)(x) = J_f(Rx)·J_{(std,−std)}(R) = J_f(Rx)·1`; `f∘R` constant would force `f = (f∘R)∘R⁻¹` constant | holds | none |
| 7.3 metric independence (headline 4) | `c² g_N`; `dx² + 4dy²` on `T²` | factor `(c/c)ⁿ = 1`; bound `(2/1)²·1 = 4`, true `1` (isometric to `ℝ²/(ℤ × 2ℤ)`) | holds, not sharp | none |
| 7.4 transfer (F04) | doubling of `T²`; `ℂ∖{0} ⊂ ℂ`; conjugation | `‖dq‖² = 4`, `J = 2`, `K_q = 2`, fibres `2` points; `K_q = 1`, fibres `1` point; `J = −1`, `K_q = ∞` | holds; a connected `f(ℝⁿ)` in a discrete fibre is a point | F04 verified |
| 7.5 flat manifolds (headline 5) | `ℝⁿ/ℤⁿ`; `exp`; Klein bottle; `Sⁿ`; closed orientable flat `N` | `J_π = 1`; nowhere-zero derivative, conformal; glide reflections reverse, excluded; `dσ = 2/(1+|x|²)·isometry`; Killing–Hopf gives `ℝⁿ/Γ`, orientation by hypothesis, pullback is `±std` on connected `ℝⁿ` | holds; the gap is used only for the orientation remark | none |
| 7.6 tori (headline 6, F03) | `T = N = ℝ²`, grid, `s = π = id`; `T = N = T²`, doubling; `n = 1`; degenerate `s` | `K_π = K_p = 1`, `id` non-constant, `1`-QR, `N` open; `2`; `1`; excluded by 6.4 | holds without "`N` closed"; non-constancy from `κ₁(σ°)` dense (null complement has empty interior) | F03 verified |
| Summary bullets 3 and 6 (F03 pattern) | compact source; strip map; open `N` | finitely many `n`-simplices, `K_p < ∞`; `K_p = ∞` excluded by "bounded simplexwise distortion"; covered by "connected oriented Riemannian manifold" | match §6.4 and §7.6 | none |

Notes that are not findings: §7.6 does not use that `T` is connected (the image of `π` lies in
one component anyway); §4.4's `K' ≥ 1` is implicit in "`K'`-quasiregular" and explicit in
`plan.json`; §6.3's closed pieces are obtained from §6.1's neighbourhoods by intersecting with a
closed ball, a route detail.

**Ownership against open work.** `roadmaps grep` over main and the 460 open heads:
`quasiregular` (only the measure-theoretic `StronglyQuasiregularMap` of
GeometryOfNumbersAndQuadraticArithmetic and quasiregular crystalline calculations elsewhere);
`ACL` (no match); `minimal stretch` (no match); `outer|inner|bounded distortion` (no match);
`smooth triangulation` (PlanarTopology: Whitehead's theorem; ArithmeticLocallySymmetricSpaces:
with boundary; HomotopySpheres: consumes); `Beltrami equation` (TeichmullerGeometry 7.4 and
PseudoholomorphicCurveAnalysis, which cites 7.4 as the owner); orientation descent to orbit
spaces (no match; DifferentialGeometry's open revision names only its orientation-cover descent).
The board index lists three unrelated packages. No open pull request builds the objects of
Layers 1–7; SobolevMapsBetweenManifolds on the board owns the carrier and is consumed through
gaps. Ownership against open pull requests was checked through the tool over all 460 heads.

**Overlaps** (`scratch/overlaps.md`). No open pull request changes this roadmap. One dropped id:
R01. No id only an open revision defines; this design drops no id others cite. Closest in
vocabulary: SobolevDifferentialForms (1609), DifferentialGeometry (886, 1187), TeichmullerGeometry
(1169), SobolevPolynomialApproximation (1612); their scopes were read and none owns distortion,
quasiregular maps, `ACL^p` maps, simplicial maps of triangulated manifolds or quasiregular
ellipticity.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, seven layers in build order with `### Examples` and `### Dependencies`, Worked examples,
Downstream consumers, References. Ten definitions (1.1, 1.2, 1.4, 2.1, 2.2, 3.1, 3.4, 5.1, 6.2,
7.1) with API lists and 3–6 Checks each (§2.5 now has 3, §6.4 has 5, §7.6 has 4); every theorem
carries its hypotheses in the sentence and a locator; every `*Needs:*` line names its inputs. No
LaTeX delimiters, no pull-request numbers, no process words, no machine paths, no `lemma` as a
Lean keyword (the word occurs only in prose), no target-numbering tables; Unicode mathematics
with ASCII in code spans. The vocabulary is the literature's; the term of round 1's F02 is now
defined at its first use.

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
  standard facts, routes, or Part II/III targets; every value the design takes from them was
  recomputed in the table.
- The Annals versions of HeikkilaPankka2025 and Prywes2019: the arXiv versions were read; the
  manifest records that their numbering is the one cited.
- Elaboration: not available (this lane does not elaborate; no Lean file at the design stage).

## Source issues

- **Misprint** in HeikkilaPankka2025 at Proof of Proposition B.1, line 1328 (arXiv v2, p. 24):
  the source writes the composite of the map and the Nash embedding in the wrong order, as the map
  followed by the embedding read right to left; it should be the embedding after the map, as on the
  next line; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5ab8144a2d3a94aa7609c401af34cb90c6f247b9", "job": "REV-DESIGN-QuasiregularMaps~2", "model": "fable", "worker": "chris-x9"} -->
