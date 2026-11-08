# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at da750f5)

**Verdict:** needs changes

This is a full review. The folder changed by 481 lines since `ebaa5bb`, and the last commit moves in material that was previously cited from HomotopySpheres and PointProcesses. All six findings of the previous review are repaired (see *Previous findings*). The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with 32 `sorry` warnings and no error. None of the 32 theorems closes with one tactic.

The blocking finding is new and comes from that last commit. Two families of objects now have a second owner among open roadmaps, and in both cases this roadmap's own targets do not need what is duplicated. The other four findings are P3: a generality slip in §3.3.5, a characteristic slip in the Layer 2 introduction, three §6.6a locators, and §6.8/§4.2 citations without exact locators. One further overlap (Wall forms, `L_n(ℤ)` and the finite Arf algebra) cannot be settled by an edit here; it is recorded under *Verified sound → Ownership* for a human.

## R01 (P2) — The σ-finite Poisson theory and the stable stems now have a second owner, and no target here needs them

**Location.**
- `README.md` line 23 (Scope) claims "Poisson random measures of σ-finite intensity with their law, uniqueness, restriction and Campbell formula" and "the stable stems of spheres with their composition product and their comparison to the sphere spectrum".
- §4.2 lines 1493, 1503, 1512 and 1523; §6.1a line 2286.
- `Suggested.lean` lines 326–388.

**Claim.** This roadmap is the owner of these objects.

**Witness.**
- *Poisson.* PointProcesses (open new-roadmap pull request, head `234a33d`) plans `campbellMeasure`, `campbellMeasure_fst`, `lintegral_campbellMeasure`, `IsPoissonRandomMeasure`, `poissonLaw` and `map_eq_poissonLaw` (its README lines 855–873 and 1098–1119). MarkovChainsAndRenewal on main already consumes these from PointProcesses Layers 0, 1, 4 and 6 (its README lines 392–397).
- *Stable stems.* HomotopySpheres (open, head `a4f5c1e`) §3A.3 (README lines 916–922) plans the suspension homomorphisms, the stable stems, their composition product and graded commutativity. Its consumer list (line 3147) still names this roadmap as the consumer of §3A.3.
- *Not needed here.* No `*Needs:*` line in this README mentions `stableStem` or `sphereSpectrumHomotopyIso` (grep: 0 hits). The Poisson route needs only finite windows. Line 1503 says the greedy covering "requires no construction of a process on the whole noncompact group", and line 1523 samples only "on compact possible-center sets".

The brief forbids citing HomotopySpheres or PointProcesses as suppliers. The overlap therefore has to be removed here, by narrowing; it cannot be settled by a citation.

**Repair.**
1. *Poisson.*
   - Keep `finitePoissonConfiguration`, `configurationCount` and `configurationMeasure` with their API (line 1503).
   - Add to that paragraph the two finite-window facts the selection bound uses, both of which follow from the multinomial–Poisson mixing argument already given there:
     - the restriction of a sample of `finitePoissonConfiguration a μ` to a measurable `B` has the law of `finitePoissonConfiguration a (μ.restrict B)`;
     - restrictions to finitely many pairwise disjoint measurable sets are independent.
   - In line 1523, have the selection bound cite these two facts and `finitePoissonConfiguration_campbell`, in place of `poissonLaw_smul_eq_map`, `IsPoissonRandomMeasure.restrict`, `IsPoissonRandomMeasure.iIndepFun_restrict` and `lintegral_campbellMeasure`.
   - Delete:
     - the σ-finite paragraph (line 1512) and the jointly-observed Campbell measures (line 1493);
     - the Scope clause, the Headline-signature items (lines 88–91), and the Poisson sentence of *How to read the build*;
     - the Mathlib entries used only there, and the Poisson part of the Layer 4 Dependencies (line 2127);
     - `Suggested.lean` lines 326–388, with the docstring clauses on lines 25–26 and 29–30.

   *Tested:* a scratch copy of `Suggested.lean` without lines 326–388 elaborates with 26 `sorry` warnings and no error. On the README's own two-point check (counting measure, `a = 2`), the finite statements give independent Poisson(2) counts at the two points.
2. *Stable stems.*
   - Delete the paragraph "The sphere spectrum and the stable stems" with its Checks (line 2286), the forward reference to it in line 2276, and the Scope clause.
   - Delete the AlgebraicTopology supplier subsection (line 200 says it is "used only by the stable stems of 6.1a and `sphereSpectrumHomotopyIso`") and its Dependencies mention (line 3320).
   - Delete the Mathlib entries `TopCat.sphere`, `TopCat.toSSet`, `HomotopyGroup.Pi`, `HomotopyGroup.transAt_indep` and `AddCommGrpCat` (line 116), and the docstring and README sentences that call the stable stems unstatable (`Suggested.lean` lines 50–51, README lines 107–108).

   No remaining target loses an input: this was checked by the same grep.

## R02 (P3) — §3.3.5 excludes `K = ℚ`, though Scope says §3.3 supplies the ℚ specializations

**Location.** Line 1136: "Let K be totally real of degree d≥2". Line 41: "so the `ℚ` and `ℚ_p` specializations named in OrthogonalSpinGroups' consumer contract and in IntegralLattices' moved-out owner table are these same results".

**Claim.** The maximal-lattice mass formula needs `d ≥ 2`.

**Witness.** `d ≥ 2` is Kirschmer's standing hypothesis (`kirschmer-2013` line 63). Gan–Hanke–Yu §7 works over any totally real `k` (`gan-hanke-yu-2001` lines 804–813). The formula also holds at `K = ℚ`. Take `Q = x²+y²+z²` (`ℤ³` is maximal) and `m = 3`, `r = 1`. Then `d_Q = −1` and `ω₂ = (−1,−1)₂ = −1`, so `p = 2` has type `I` with `λ₂ = (4−1)/(2·3) = ½`, and every odd prime has type `zero`. The right side is `2·(1/4π²)·ζ(2)·½ = 1/24`, which equals `2·mass = 2/|O(ℤ³)| = 2/48`.

**Repair.** Replace "of degree d≥2" by "of degree d", and cite Gan–Hanke–Yu Propositions 7.4–7.5 for `d = 1`. Add the `ℤ³` computation as a Check. *Tested* on that instance above.

## R03 (P3) — The Layer 2 introduction restricts the atomic normal forms to characteristic zero

**Location.** Line 458: "Voight's atomic normal forms over a characteristic-zero DVR, dyadic case included (2.6)".

**Claim.** §2.6 is a characteristic-zero theory.

**Witness.**
- 2.6.1 makes "no assumption on the characteristic".
- 2.6.11 and `atomic_normal_form` (`Suggested.lean` line 128) say "of any characteristic", and 2.6.11's Check uses `𝔽₂[[t]]`.
- Voight Proposition 9.8.4 is stated for any local PID (`voight-quat-book` line 6511).

**Repair.** Read "Voight's atomic normal forms over a DVR of any characteristic, dyadic and characteristic-two cases included (2.6)".

## R04 (P3) — Three §6.6a locators point at §8.1 for material in §8.2

**Location.** Line 2716 (`sFilteringWeakGenerator`) and line 2724 (`sFilteringQuotient`) read "(Source: Schlichting §8.1, p.140; …)". Line 2734 (`DualityStable`) reads "(Source: Schlichting §8.1, p.140, paragraph preceding Theorem 8.2.)".

**Claim.** Weak isomorphisms, the exact quotient and the descended duality are on p.140, §8.1.

**Witness.** §8.1 on p.140 contains only conditions (a)–(d) (`Schlichting2010` lines 1506–1526). "8.2. The exact quotient" starts on printed p.141 (lines 1528–1529). The same page has the weak isomorphisms (lines 1530–1533), the quotient and its conflations (lines 1541–1544), and the induced duality (lines 1545–1550).

**Repair.** In these three places read "Schlichting §8.2, p.141". Keep §8.1, p.140 for `SFiltering` (line 2708).

## R05 (P3) — The §6.8 material moved in this round, and §4.2's Campbell measures, cite works without exact locators

**Location.**
- Line 2954: "Wall, … Chapter 5 …; Ranicki, *Algebraic L-theory I: Foundations*, for the whole-module refinement, Lagrangians and hyperbolic forms".
- Line 2964: "Arf, … 183 (1941), 148–167, for the invariant, its independence of the basis and the classification …; Browder …; Lidl–Niederreiter, *Finite Fields*, Chapter 6, §2".
- Line 2974: "Ranicki, *Algebraic L-theory I*, for formations".
- Line 1494: "Kallenberg, … §6.1".

**Claim.** These locate the stated results.

**Witness.** Each cites a whole paper, a chapter or a section for specific results:
- basis independence of the Arf invariant and the finite-field classification;
- the zero count `Q^(2m−1) ± (Q−1)Q^(m−1)`;
- the majority description over `𝔽₂`;
- `WallQuadraticForm.isometry_hyperbolic_of_lagrangian` and the elementary formations;
- Campbell measures with a jointly observed variable.

None gives a theorem number with a page.

**Repair.** Give the theorem (or numbered section) and the printed page for each claim. The Kallenberg citation goes away if R01's repair deletes line 1493.

## Previous findings

- **R01 (P2, §1.2.14 statable): repaired.**
  - `Suggested.lean` line 105 states `sqSuccessiveMin_eq_sq_successiveMin` against `TauCeti.IntegralLattice.realModel` and `ZLattice.successiveMin`.
  - README *Headline signatures* line 72 lists it.
  - §1.2.13a now reads "These are Tau Ceti's, not restated here" and cites the five pinned declarations.
- **R02 (P3, pinned dual and theta): repaired.**
  - 0.3.2 reads "this is Tau Ceti's `ZLattice.covolume_dual` … not restated here".
  - 3.4.1 (line 1210) reads "No second theta series is defined here". It cites the two pinned coefficient theorems and keeps ThetaSeries 3D only for orthogonal sums.
  - The line 23 clause is reworded to the carrier-transport identities. These are consistent with 3.4.1, which names the real-model isometry and `thetaSeries_smul`.
- **R03 (P3, supplier names): repaired.**
  - `QCat`, `quillenQ.*`, `KGroup.*`, `pi1QEquivExactK0`, `kGroup_finiteProduct`, `exactCategory_devissage`, `hSpace_isAbelianSpace`, the three §4.14 names, `locMap` and `TauCeti.linearHomComplex` no longer occur (grep).
  - Line 204 cites `IsPlusConstruction.hSpaceRecognition`. Line 122 uses `CochainComplex.linearHomComplex` and the corrected `DG/Functor/Basic.lean` and `DG/CochainComplex/Basic.lean`.
  - `TauCeti.linearHomComplexEnrichedCategory` exists at the pin (`TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean` line 32).
- **R04 (P3, CDH locators): repaired.**
  - Line 3035 reads "CDH III, Proposition 1.1.13 and Remark 1.1.14 with surgery diagram (4), p.14".
  - The "Definition 1.1.2" and "Remark 1.1.7, pp.18–19" readings are gone.
- **R05 (P3, layer sections): repaired.** `/-! ## Layer k: … -/` comments for Layers 0–6 appear in README order (`Suggested.lean` lines 65, 91, 113, 143, 169, 577, 603).
- **R06 (P3, Checks and history): repaired.** `freeFGAb_not_sFiltering`, `genusMass_pos` and the "has moved" parenthesis no longer occur. The `genusMass` Check (line 1067) reads "outside the nonempty-genus hypothesis of the positivity statement in the basic theory above".

## Verified sound

**Gate, build and signatures.**
- The gate, rerun with the brief's command, prints: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check, verbatim: `depcheck: 245 roadmaps, 2479 edges, 0 problem(s)`. In the merge order, HomotopySpheres is at line 72 and this roadmap at 74; LFunctions is at 28, AdelicAlgebraicGroups at 35, ArithmeticGaloisDuality at 47, and StableHomotopyKTheory, GeneralAlgebraicKTheory and AlgebraicKTheory at 16–18. OrthogonalTamagawaAndLatticeMass (line 146) consumes §3.3 from here.
- `lake env lean Suggested.lean`: 32 `declaration uses sorry` warnings (lines 72 … 630), no error.
- `#check @name` was elaborated for every declaration in one scratch file, and each type was compared with its README statement. The 11 "looks dropped" leads of `signatures.md` are false positives:
  - `hρ`, `hμ`, `hU` and `hΓ` appear as anonymous hypotheses in the Ratner, Dani–Margulis, Mahler and Siegel types;
  - `StarBody`, `admissible`, `IsFiniteType` and `latticeCoveringRadius` do not use the flagged instances.

  No change.
- On the volume in 0.3.1: `volume` on `↥Wᗮ` is the inner-product Haar measure. Mathlib's `Measure.Subtype.measureSpace` is a `def`, not an instance (`Mathlib/MeasureTheory/Measure/Restrict.lean` line 832), so the projected covolume is the intrinsic one and the statement is not vacuous.

**Padding probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | infer_instance | simp | norm_num | trivial | positivity | aesop | exact le_rfl | decide` (each followed by `done`). All 32 theorems fail. No declaration restates a definition, mirrors a Check or computes a small value. The Poisson declarations are covered by R01.

**Library declarations opened at the pins.**
- Tau Ceti `2fd255d`, by declaration line:
  - `ContRepresentation.IsUnitary` (`RepresentationTheory/Continuous/Unitary/Basic.lean` 49) and `ContRepresentation.matrixCoeff` (`MatrixCoefficient.lean`, namespace at 61);
  - `TauCeti.IntegralLattice.orthogonalSum` (`IntegralLattice/Orthogonal/Sum.lean` 94), `scale (n : ℤ)` (`Scaling.lean` 76), `representationNumber (n : ℚ)` (`PosDef/RepresentationNumber.lean` 78), `minimum` (`PosDef/Minimum.lean` 83), `IsPosSemidef.isLeast_minimum` (125), `integralNorm` (`Norm.lean` 105), `dualCarrier` (`Dual/Basic.lean` 75) and `IsPosDef.finite_isometry` (`PosDef/Finite.lean` 147);
  - `successiveMinimum` (`PosDef/SuccessiveMinima.lean` 47) with `_le_iff` (84), `monotone_` (96), `IsPosSemidef.successiveMinimum_zero` (105), `…exists_linearIndependent_integralNorm_eq_successiveMinimum` (186) and `IsPosDef.successiveMinimum_pos` (255);
  - `norm_sq_realModelMap` (`ZLattice/RealModel.lean` 166) and `realModelCarrierEquiv` (42);
  - `ZLattice.covolume_sq_eq_det_gram` (`Covolume.lean` 253);
  - `thetaSeries_smul` (`ThetaSeries/Functoriality.lean` 74), `summable_thetaSeries` and `mdifferentiable_thetaSeries` (`Basic.lean` 190, 266), `thetaCoset` (108), `hasSum_thetaSeries_qParam` and `_two` (`QExpansion.lean` 143, 181), and the two real-model coefficient theorems (`RealModel.lean` 39, 48);
  - `SchwartzMap.gaussian` (`SchwartzSpace/Gaussian.lean` 56);
  - `IsSemialgebraic` (`Semialgebraic/Basic.lean` 75), `TauCeti.cohomologicalDimensionAt` (`CohomologicalDimension/Basic.lean` 146) and `TauCeti.riemannianVolume` (`Riemannian/VolumeDensity/Volume.lean` 82);
  - `WittRing` (needs `[Invertible (2:K)]`) and `WittGrothendieckRing` (`QuadraticForm/Witt/Ring.lean` 218, 123), and `scharlauTransfer` (`Transfer/Basic.lean` 48);
  - `IsInvolutiveDual` (`CategoryTheory/InvolutiveDual.lean` 50), `IsConflationExact` (`Exact/Functor.lean` 74), `ReflectsConflations` (`Exact/ExtensionClosed.lean` 375), `ExactK0` (`GrothendieckGroup/Exact.lean` 179) and `finiteProjectiveModulesExactStructure` (`CartanMap/Basic.lean` 232);
  - the spinor-norm names of *From Tau Ceti* (`SpinorNorm/Basic.lean` 98, 212; `Real/SpinorNorm.lean` 104, 165; `LocalField/…/HigherRank.lean` 91, `Basic.lean` 57; `AdelicSpinorNorm/Basic.lean` 75, 83);
  - `IsReducedForm` and `reducedForms` (`BinaryQuadraticForm/Reduced.lean` 63, 87), `hurwitzClassNumber : ℕ → ℚ` (`HurwitzClassNumber.lean` 90), and `eight_dvd_sigPos_sub_sigNeg_of_isUnimodular`, `typeE₈RootLattice` and its two instances.
- No Arf invariant, Wall form, `L`-group, Poisson random measure or Campbell measure exists at either pin (grep). Mathlib's `ZLattice.covolume` (`Algebra/Module/ZLattice/Covolume.lean` line 73) needs no instances.

**Cross-roadmap citations resolved** (on main unless stated otherwise):
- AlgebraicTopology Stage 4 item 4 (`coordinateCubeQuotientSphereHomeomorph`, `sphereSmashHomeomorph`, `reducedSuspensionSphereHomeomorph`, lines 543–580) and `kanCubicalHomotopyComparison` (line 1657).
- DifferentialGeometry 12.1 and 12.4 (`riemannianDensity`, `integral_riemannianVolume_eq_integralDensity`, lines 915–927).
- ThetaSeries 3D (line 616).
- IntegralLattices B2, B4 and B5 (lines 1032, 1125, 1167) and 7E (line 1869). The `overlaps.md` lead that only the open IntegralLattices revision defines §7E is false.
- IntegralLattices' moved-out table (lines 97–100 and 148: the Smith–Minkowski–Siegel formula goes to OrthogonalTamagawaAndLatticeMass).
- LFunctions `gammaFactor`, `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`, `completedDedekindZeta_one_sub` and `dedekindZetaData` (its `Suggested.lean` lines 130, 1000, 1046, 1053).
- Completed AlgebraicCodingTheory Layer 6 (line 323).
- OrthogonalTamagawaAndLatticeMass, at its open head, consumes `orthogonalTamagawa_two` and the gauge targets of §3.3 (its line 46) and derives its own `ℚ` formula (line 226).

**Ownership against open work.**
- PointProcesses and HomotopySpheres: see R01.
- *Left for a human:* §6.8's Wall forms, formations and `wallLGroup` duplicate HomotopySpheres §7B.2–7B.4 and §7C.1–7C.3. HomotopySpheres' consumer list (line 3147) names this roadmap as their consumer.
- The finite `𝔽₂` Arf algebra is owned by the open GeometricTopology revision, Layer 4.3.1 (its lines 48–50 and 3538–3549; main's GeometricTopology does not have it). TangentialBordism declares `gap:finite-quadratic-arf` on it.
- Unlike the R01 objects, §6.10a's `integralLTheoryCalculations` (line 3247) needs these. HomotopySpheres may not be cited from here, and a revision is not a dependency, so this roadmap is their owner by necessity. Settling a single owner needs a board decision, so these overlaps are not raised as a finding.
- The other closest open roadmaps (HermitianKTheoryOfPoincareCategories, GeneralAlgebraicKTheory, LatticePackingsAndPerfectForms, GeometryOfNumbersAndQuadraticArithmeticPartII) were checked only through `overlaps.md` and the r9 checks. No new two-owner object was found.

**Sources read at their locators** (keys are fetch keys; line numbers are into the sources cache).
- 0.3: `horesh-karasik-2023` (QJM version of record):
  - Proposition B.4 at printed p.1290 (lines 1375–1382), Proposition B.5 and Corollary B.6 at p.1291 (lines 1391–1399);
  - Proposition A.1 at p.1284 (line 1174) and Corollary A.3 at p.1285 (line 1188).

  Remark B.7 (lines 1400–1416) shows that self-duality is load-bearing: for `Δ = ℤe₁⊕2ℤe₂` and `W = ℝe₁` the two covolumes are 1 and 2. 0.3.3 assumes `Δ* = Δ`, and the B.5 pairing proof extends to that case.
- 1.1: `couveignes-2020-arxiv` (v2) p.6, lines 220–233: the ball volume is `≥ 2^ℓ ℓ^(−ℓ/2)`, with the ordered product and the `ℓ+1−i` roots.
- 2.2, 2.4.1, 2.6: `voight-quat-book` (v1.0.7u):
  - Definition 9.3.1 p.137 (line 6066); (9.4.1)–(9.4.5) pp.139–140; Lemma 9.4.6 and Corollary 9.4.7 p.140 (lines 6198, 6214); (9.5.1)–(9.5.4) and Lemma 9.5.3 pp.142–143 (lines 6292–6305);
  - Definitions 9.7.1–9.7.8 pp.144–145; Definition 9.7.13 p.146 (line 6447);
  - Definition 9.8.1 p.147 (lines 6486–6490; `v(a)v(b) = 0` ⇔ `IsUnit a ∨ IsUnit b`); Proposition 9.8.4 pp.147–148 (lines 6511–6523).
- 2.4: `schulze-pillot-2021` (OCR): Lemma 9.19 pp.126–127 (lines 4990–5002), Definition/Lemma 9.20 and Theorem 9.21 p.127 (lines 5003–5032), Definition 9.9 p.124 (line 4903), Definition 9.13 and Remark 9.14 p.125 (lines 4928–4936). `kirschmer-2013` Proposition 3.2 and Theorem 3.3 pp.3–4 (lines 169–202). `gan-hanke-yu-2001` (7.1) pp.118–119 (lines 803–813).
- 2.8: r9 read the version of record. The service now returns arXiv v2, where Lemma 5.1 is on p.12; not re-read this round.
- 2.9: `KurinczukSkodlerackStevens2020` as in r9 (Lemma 3.1 p.10, Proposition 3.12 p.14, Propositions 3.13–3.14 p.15).
- 5.1: `lll-1982` (OCR) (1.2)–(1.4) p.2 (lines 73–82), (1.6)–(1.7) and proof p.3 (lines 96–134), (1.11) p.4 (lines 143–150).
- 6.2, 6.6, 6.8: `Schlichting2010` Example 2.2 p.109 (line 182), Lemma 2.8 p.111, Remark 4.14 p.123, Proposition 4.9 and Lemma 4.10 p.120, Theorem 5.1 p.126 (line 886), Corollary 5.2 p.127 (line 949).
- 6.6a: `Schlichting2010` §8.1 p.140 (lines 1506–1526): conditions (a)–(d) match `left_factor`, `right_factor`, `lift_deflation` and `descend_inflation`. Theorem 8.2 and Remark 8.3 are on p.141 (lines 1552–1557). Exceptions: R04.
- 6.11: `CDHIII2026v4` Lemma 3.2.7 p.58 (lines 2703–2722), Theorem 3.2.9 (lines 2725–2735), Lemma 3.2.10 p.59 (lines 2737–2740).

**Adversarial table.** One row per statement; computed values on each side.

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 0.3.1 `covolume_projection` | ℤ², `W=ℝ(1,1)`; `W=E`; `W=0`; `2ℤe₁⊕3ℤe₂`, `W=ℝe₁` | `1/√2 = 1/√2`; `1 = covΔ/covΔ`; `covΔ = covΔ/1`; `3 = 6/2` | holds, intrinsic Haar | none |
| 0.3.3 `primitive_orthogonal_covolume` | ℤ², `W=ℝ(1,2)`; `W=0`; non-self-dual `ℤe₁⊕2ℤe₂` | `√5 = √5`; `1 = 1`; `2 ≠ 1` | self-duality load-bearing | none |
| 1.1.1–1.1.5 | `(1,2,4)`; `(½,2)`; `(4,1)`; cube `n=2,r=3`; ball `n=1,2,4` | `1,4,4 ≤ 8`; `2 > 1`; `16 > 4`; `36`; `2≤2`, `2≤π`, `1≤π²/2` | holds | none |
| 1.2.14 `sqSuccessiveMin_eq_sq_successiveMin` | `[4]`; `diag(1,4)`; `I₂`; rank 0 | `4 = 2²`; `(1,4)=(1²,2²)`; `(1,1)`; `Fin 0` empty | holds | none |
| 2.2.1–2.2.4 | `ℤ_(2)`; `L=ℤ`, `M=6ℤ`; `ℤ[√−3]` | `1/3 ∈`, `½ ∉`; fails at 2 and 3, holds at 5; not integrally closed | holds | none |
| 2.4.2 / 2.4.5 | Lemma 9.19; `q=xy`, `τ_(1,1)τ_(1,2)` | `θ = R^×F^{×2}`; `diag(2,½)`, `θ = [1·2]` | holds | none |
| 2.4.6 | `ℤ₂`, `xy`, `v=(1,1)`; `v=(1,2)` | `(a,b)↦(−b,−a)`, det −1; `(0,1)↦(−½,0)` | least valuation load-bearing | none |
| 2.6.1/2.6.11 `atomic_normal_form` | `[1,1,1]` over `𝔽₂[[t]]`; `x²+ty²`; `xy` over ℤ₂; zero form rank 2 | `0 < ⊤ ≤ ⊤`, unit; polar 0, exponents `0,1`; `[0,1,0]`; `s=0, z=2` | holds in every characteristic | R03 |
| E12 / Voight Ex. 9.8.2 | `(x,y)↦(x+y/3,y/3)` on `[1,1,1]` | `x²+xy+y²/3` | `[1,1,1] ≅ [1,1,1/3]` | none |
| 2.8 Checks | Lipschitz `h(i,i)`; `(1+i+j+k)/2` | `1`; not in `ℤ⟨1,i,j,k⟩` | holds | none |
| 2.9.1/2.9.4 | `ℚ₃(√3)`; `ℚ₅(√5)` | `−1 ∉ N` → order-4 cyclic; `−1 ∈ N` → `C₂×C₂` | holds | none |
| 2.9.2 | `[[0,1],[ε,0]]` | det `−ε` | holds | none |
| 3.1.3 `finite_hermitian_isometry_formula` | `q=2`: `(n,m,a)=(1,1,0),(1,2,0),(1,3,0),(1,1,1)`; `m=n=0` | `2·3/2=3`; `8·¾=6`; `32·9/8=36`; `0`; `1` | matches direct counts | none |
| 3.2.5 | `a=0,1,2` | `0, 1, 1+q` | holds | none |
| 3.3 trace form | `ℚ(√5)`, `x²` | `2a²+2ab+3b²`, det 5, polar det 20 | holds | none |
| 3.3 gauges | `V₂,V₃,V₄`; `γ_odd(1),γ_odd(2),γ_even(2)` | `2π, 8π², 16π⁴`; `1/4π², 6/(2π)⁶, 1/(2π)⁴`; `V₃ = 2/γ_odd(1)` | holds | none |
| 3.3 fibre scaling | `m=5` | `|a|^{−m+2} = |a|^{−3}` | holds | none |
| 3.3.5 | `K=ℚ`, `x²+y²+z²` | `2·(1/4π²)·(π²/6)·½ = 1/24 = 2/48` | holds at `d=1` | R02 |
| 3.3.6 | order 2 with improper; order 4 without | `½→1`; `¼+¼` | doubles | none |
| 3.4.1 | ℤ; ℤ²; rank 0 | coefficients `2,0,0,2`; `4,4`; `1` | holds | none |
| 4.1.12 Henk | ℤ², `[−1,1]²`; `d=1` | `9 < 18`; `3 = 3` | `d≥2` load-bearing | none |
| 4.2 Koopman / exterior | 3-cycle on `(0,1,2)`; `h=diag(1/10,10)`, `v=e₁,e₂,2e₂` | `(2,0,1)`; `1/10 > 1/50`, `1 ≤ 2`, `2/2 = 1` | rank-increase load-bearing | none |
| 4.2 rescaling Check | `u(a/ε)g_ε u(−a/(ε(1+a)))`, `a=1` | `[[1+a,0],[ε,(1+a)⁻¹]] → diag(2,½)` | holds | none |
| `howe_moore`, `moore_ergodicity` | `ℝ` with `e^{it}`; zero space; compact `K` | abelian, excluded by `IsSimple`; coefficient 0; excluded | hypotheses load-bearing | none |
| Ratner ×3, `dani_margulis_nondivergence` | `U = ⊥`; `u ≡ 1` | `L = ⊥`, `δ_x`; occupation `T ≥ (1−ε)T` | holds | none |
| `oppenheim_values` | `x²+y²−√2z²`; `x²+y²−z²`; `x²−(3+2√2)y²` | dense; `hirr` fails (`c=1`); `n=2` excluded, values `≥1` | holds | none |
| `duke_sphere_equidistribution` | `n≡7 (8)`; `n=1` | excluded; six points `±eᵢ` | holds | none |
| `three_square_hurwitz` | `n=1,2,3,4,7` | `6, 12, 8, 6, 0` | holds | none |
| `siegel_three_square_lower_bound` | `n=1,2,3` | `6, 12, 8 > 0` | holds | none |
| Banaszczyk, covering | `aℤ`; ℤⁿ | `a·(1/a)=1≤1`; `μλ₁* = ½`; `√n/2 ∈ [½,n]` | holds | none |
| `critical_lattice_exists` | dim 0; `c|x|`; `c·x⁺` | `Δ=1` (lattice `⊥`); `Δ=1/c`; no admissible lattice (`−x ∈ L`) | holds; symmetry not needed | none |
| `mahler_relativelyCompact_iff` | `diag(t,1/t)ℤ²`, `t→0` | first minimum `t → 0` | both sides false | none |
| `siegel_mean_value` | junk `tsum` | `∫Σ|f(v)| = ∫|f| < ∞` ⇒ summable a.e. | holds a.e. | none |
| `davenport_multiset_estimate` | `n=1` | `sSup ∅ = 0`, `max 1 0 = 1` | holds | none |
| LLL | `((1,0),(½,1))`; `((2,0),(0,1))`; `((2,0),(1,1))`; `n=1` | `μ=½`, reduced; `1 < 3`; `1 < 2`; factor `1` | holds | none |
| 5.1.3 | `μ=½`, lengths `1, ½` | `1 = 2·½` | equality | none |
| `finiteArfInvariant` | `𝔽₂`: `xy`, `x²+xy+y²`; `𝔽₄` `xy`; dim 0; `x²` on `𝔽₂²` | `2·3>4→0`; `2·1<4→1`; `4·7>16→0`; `2>1→0`; `4≯4→1` | matches Arf | none |
| Arf zero count | `Q=2,4`, `m=1` | `3, 1, 7` | `Q^(2m−1) ± (Q−1)Q^(m−1)` | none |
| `quadraticMap_equivalent_iff_finiteArfInvariant` | `𝔽₂²`: `xy` vs `x²+xy+y²` | 3 vs 1 zeros, Arf 0 vs 1 | holds | none |
| `IsPoissonRandomMeasure`, `map_eq` | `Λ=∞·Leb[0,1]`: `N=0` vs `Z·Leb`; `K(δ_a+δ_b)` | both satisfy the predicate, laws differ; equal counts, not independent | definitions correct | R01 |
| 4.7.1 | zero code; full code | `pⁿ`; `1`; rescaled `p^{n/2−dim C}` | holds | none |
| 6.2 | `H(ℤ)`; `⟨2⟩⊥⟨3⟩`; `𝔽₂`, `xy` | even unimodular; rank 2, det 6; `b(1,1)=1` | holds | none |
| 6.6.1 | free ⊂ projective; even ⊂ all; `0 ⊂ E` | `P⊕Q≅Rⁿ`; `T=k`; `X⊕T≅0 ⇒ X≅0` | holds | none |
| 6.6a Checks | free groups, `2:ℤ→ℤ`; finite groups, `ℤ↠ℤ/2` | `B ∈ {0,ℤ}`, cokernel `ℤ/2`: (d) fails; `B=0`: (c) fails | matches §8.1 | R04 |
| 6.8 Wall Checks | `H₋₁`, `μ(e)=μ(f)=1`; `ℤ/4`, `[[2,1],[−1,2]]`; `ℤ(e+2f)` | `a²+ab+b²` odd; det `5`, `λ(e₁,e₁)=2≠0`; `μ=2≡0`, index 2 | holds | none |
| `wallLGroup` | `n=0..3` | `ℤ, 0, ℤ/2, 0` | holds | none |
| 6.11.1, 6.11.10 | `GW₀^s(ℤ)`; `×8` on `L₀` | `ℤ⊕ℤ`; cokernel `ℤ/8`, `C₁ = C₋₁ = ℤ/2` | CDH III p.58 | none |

## Not verifiable

- **Couveignes 2020, printed p.494 (1.1).** The Annals URL is in no licence class (`classify`: unknown). The arXiv v2 text has the §3 content on its p.6.
- **Last–Penrose (4.2).** The author-hosted URL tried returned "no legal source found".
- **Kallenberg 2017 (4.2).** A Springer book; not read.
- **Ranicki 1981 (6.10a, 6.11).** The fetch from the Edinburgh archive did not complete; CDH III Lemma 3.2.7, which cites it, was read.
- **Not fetched** (books or paywalled): Arf 1941, Browder 1969, Wall, Ranicki 1973, Lidl–Niederreiter, Hatcher, Toda, Weil 1964/1965, Sansuc, Gross–Gan, Margulis–Tomanov, Davenport, Siegel 1935/1945, Banaszczyk and Iwaniec. These are outside the sampled locators except §6.8's, which R05 asks to be made exact first.
- **Ownership against AnalyticNumberTheoryPartI and ImaginaryQuadraticClassNumber** (Siegel's theorem, §4.3) was not checked: the brief gives no checkout of either.

## Source issues

- **Misprint** in couveignes-2020-arxiv at §3, arXiv v2 p.6: the source calls the set of points of norm at most one a sphere; it should say ball (closed unit ball); affects nothing.
- **Error** in Voight2026 at Example 9.8.2, printed p.147: the source asserts that the normalized atomic representative `[a,1,c]` of an isometry class over ℤ₂ is unique; it is not: `[1,1,1] ≅ [1,1,1/3]` via `(x,y)↦(x+y/3,y/3)`; affects a stated result.
