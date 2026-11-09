# Review of MorseNovikov (pull request #1854 at 80ff9a4)

**Verdict:** needs changes

This is a full review. Since `b66c1e8`, `TauCetiRoadmap/MorseNovikov/` has changed by 689 lines. Layers 1–5 now consume the pinned Novikov-series, Novikov-module, torsion, orbit-zeta and cellular APIs. The padding section of `Suggested.lean` is gone, and §6.5 has a Granas locator.

Five of the seven previous findings are repaired; R01 and R05 are not. There are five new findings. All seven findings are P3, so nothing blocks on mathematics, but the worker's gate still fails (R01).

## R01 (P3) — The gate fails on two files edited outside the pull request's roadmap folders

**Location.** The worker's gate at `80ff9a4` reports `outside-folder=2`:
- `Completed/ArithmeticDirichletSeries/README.md`;
- `TauCetiRoadmap/SymplecticGeometry/README.md`.

Every other check is 0.

**Claim.** The pull request edits two folders that the brief does not list as its own, so no review covers those edits. There is no acceptance while the gate fails.

**Witness.** `git diff --stat origin/main...HEAD`, with all seventeen reviewed folders excluded, leaves exactly `Completed/ArithmeticDirichletSeries/README.md | 2 +-` and `TauCetiRoadmap/SymplecticGeometry/README.md | 6 +++---`.

**Repair.** Choose one:
- move the 3-4-1 remark and the CG6 paragraph into a pull request of their own; or
- register ArithmeticDirichletSeries and SymplecticGeometry as folders of this pull request, so that each gets a review.

Either way, `outside-folder` drops to 0.

## R02 (P3) — §4.2 plans a field decomposition the pin already proves; §4.3's Novikov field and the irrational acceptance example are pinned but not cited

**Location.**
- README §4.2, lines 862–865: "Prove that the total quotient rings of ℤ[H] and Nov(ℤ,H,N) are finite products of characteristic-zero fields, through Mathlib's `IsArtinianRing.equivPi` once reducedness passes to the localization."
- Scope, lines 46–49, lists "the field decomposition and topology of the total quotients" among this roadmap's constructions.
- §4.3, lines 891–893, uses "the Novikov field with coefficients in the fraction field of the corresponding characteristic-zero kernel group algebra" without a supplier.
- Layer 1 Examples (line 497) and Worked examples (lines 1620–1621, 1628–1630) still require the irrational noninjective example.

**Claim.**
- The ℤ[H] half of the §4.2 target is a pinned theorem.
- The Novikov half is a direct composition of pinned results, and none of them is named.
- The Novikov field criterion and the ℤ³, `a+√2b` acceptance example are also pinned.

These are cited, not planned.

**Witness.** `AddMonoidAlgebra.exists_ringEquiv_pi_field_of_isFractionRing` (Algebra/MonoidAlgebra/TotalQuotient.lean:198) states: for a formally real Noetherian R and finitely generated H, Q(R[H]) is ring-isomorphic to a finite product of characteristic-zero fields. For R=ℤ and H=ℤ/2 this is ℚ×ℚ, the README's own Check.

The other pinned pieces are:
- `IsLocalization.isReduced` (RingTheory/Localization/Reduced.lean:38);
- `TauCeti.NovikovSeries.isField_iff` (RingTheory/NovikovSeries/Field.lean:95): Nov is a field iff R is a field and N is injective;
- `TauCeti.NovikovSeries.IrrationalExample.series`, `leadingTerm_series` and `eventually_period_ge` (RingTheory/NovikovSeries/Examples/Irrational.lean:129, 166, 195).

**Repair.**
1. §4.2:
   - Consume `AddMonoidAlgebra.exists_ringEquiv_pi_field_of_isFractionRing` for ℤ[H].
   - State as the target only "Q(Nov(ℤ,H,N)) is a finite product of characteristic-zero fields". Its route is: `TauCeti.NovikovSeries.isReduced_iff` with `AddMonoidAlgebra.isReduced_of_isFormallyReal`, then `IsLocalization.isReduced`, `TauCeti.NovikovSeries.isArtinianRing_of_isFractionRing`, Mathlib's `IsArtinianRing.equivPi` and `TauCeti.NovikovSeries.charZero_quotient_of_isFractionRing`.
   - Keep as targets the cyclotomic and splitting description, splitting-independence, and the compatibility of the injective map with the components.
2. §4.3: cite `TauCeti.NovikovSeries.isField_iff` for the Novikov field over the fraction field of the kernel group algebra, which needs an injective period on the chosen complement.
3. Layer 1 Examples and Worked examples: cite the pinned `IrrationalExample` instead of requiring the example.
4. Scope line 47: change "the field decomposition and topology of the total quotients" to "the cyclotomic description and topology of the total quotients".
5. Add the five newly cited declarations to "From Tau Ceti".

Tested on H=ℤ/2 and N=0. Nov=ℤ[ℤ/2] is reduced, and Q=ℚ×ℚ is Artinian. `equivPi` gives two components, with 1−g ↦ (0,2) and 1+g ↦ (2,0), matching the §4.2 Check.

## R03 (P3) — `Suggested.lean` names the wrong missing carriers for the knot-surgery torsion formula

**Location.** `TauCetiRoadmap/MorseNovikov/Suggested.lean`, lines 29–30: "Layer 6's dynamical torsion invariance, its equality with cellular torsion and the mapping-torus and knot-surgery torsion formulas lack both carriers."

**Claim.** README §6.4 (line 1408) states the knot-surgery formula as `τcell(X̃_K)=Δ_K(t)/(1−t)^2 mod ±t^ℤ`. That is a purely topological statement: it uses neither Novikov homology of a closed one-form nor periodic-orbit data. The cellular half of the mapping-torus item is the same. The docstring must name what is actually missing.

**Witness.**
- For the unknot, X_K=S¹×S². Its product cells over ℤ[t^±] have d₁=t−1, d₂=0 and d₃=t−1, so the torsion is (1−t)^(−2). No one-form or orbit enters.
- The pinned `TauCeti.KnotTheory.alexander` (KnotTheory/Alexander.lean:395) takes a Seifert matrix. Its docstring says that producing one from a knot is separate work.

**Repair.** Replace the sentence with:

> Layer 6's dynamical torsion invariance and its equality with cellular torsion lack both carriers, and the mapping-torus orbit-zeta formula lacks the periodic-orbit data. The cellular torsion formulas of §6.4 lack a based cellular torsion of an abelian cover of a finite CW complex: the pinned `TauCeti.cellularChainComplexRep` and `HomologicalComplex.componentwiseReidemeisterTorsion` are not joined by a cell-lift basis and a scalar extension to the total quotient. The zero-surgery formula also lacks the Alexander polynomial of a knot: the pinned `TauCeti.KnotTheory.alexander` is defined on a Seifert matrix.

## R04 (P3) — The Poincaré–Hopf boundary with CharacteristicClasses C2.3 is not stated

**Location.** README Scope, lines 17–18: "It owns the local fixed-point index, the Lefschetz formula and vector-field Poincaré–Hopf theorem used in those comparisons." The theorem itself is §7.1 (lines 1516–1518) and §7.3.

**Claim.** CharacteristicClasses C2.3 proves the sum-of-local-indices formula with e(TM)[M]=χ(M) on closed oriented manifolds. That is the vector-field count in the oriented case. Its C2.3a Checks repeat the Checks of §7.3. Neither README says how the two statements differ, so a reader cannot tell which roadmap owns the oriented count.

**Witness.** CharacteristicClasses README at this head:
- lines 1613–1614: "On a closed oriented manifold prove the sum-of-local-indices formula and e(TM)[M]=χ(M)";
- lines 1773–1775: index sum 4−6+4=2 on S², the point count in dimension 0, and 0 for the empty manifold.

The same text is at main's line 837.

**Repair.** Add to Scope, after line 18:

> CharacteristicClasses C2.3 proves the oriented Euler-class form Σ ind = ⟨e(TM),[M]⟩ = χ(M) through Thom classes; §7.1 proves the vector-field count without orientation, through a Morse cobordism, and consumes nothing from C2.3.

Tested:
- A Morse gradient on RP² gives 1−1+1=1=χ(RP²). §7.3 covers it, and C2.3 does not, because RP² has no orientation.
- On S² both give 2.

## R05 (P3) — Another open pull request changes this roadmap, conflicts with this head, and no order is stated

**Location.** The description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Claim.**
- Open pull request #1161 changes MorseNovikov's `README.md` and `Suggested.lean`, and it conflicts with this head in both.
- Its head still cites DGFloer Layer 1 item 1 as the supplier of H₁=π₁ᵃᵇ. Merging it unchanged would restore the MorseNovikov → DGFloer edge that this pull request cuts.
- The description presents the MorseNovikov change as the Hurewicz cut only. At this head the folder differs from main by 445+/249− lines: Layers 1–5 now consume pinned APIs.

**Witness.**
- The overlap report: "#1161 and #1854 conflict in `TauCetiRoadmap/MorseNovikov/README.md`, `TauCetiRoadmap/MorseNovikov/Suggested.lean`".
- #1161's head `e06d4d0`, README line 80: "The degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ ≅ H₁(X;ℤ)`: DGFloer Layer 1 item 1."

**Repair.**
1. State in the merge-order paragraph that #1161 is rebased onto this pull request before either merges. The rebase replaces its DGFloer Layer 1 item 1 citations (its lines 80, 222, 491, 550, 1377, 1436 and 1462) with AlgebraicTopology Stage 8 item 3 and `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`.
2. Extend the description's MorseNovikov bullet to cover the consumption of the pinned APIs in Layers 1–5.

## R06 (P3) — The existing-work paragraph plans a comparison that lives in no layer

**Location.** README Scope, lines 58–62: "For injective N, construct the coefficient-preserving comparison with the one-variable carrier on the image of N, including convolution and the period topology. For noninjective N, retain the finite ties in each period fiber and compare through the supplied kernel splitting below."

**Claim.**
- These are construction targets placed in the Scope section, and they appear in no layer.
- The external repository's carrier is not a dependency of Tau Ceti, so a comparison with it cannot be a library target.
- Read inside the library, both comparisons are pinned and §1.4 already consumes the second.

**Witness.**
- For injective N, `TauCeti.NovikovSeries.continuousDomCongr` (RingTheory/NovikovSeries/Equiv.lean:139), along H ≃+ N(H) with c=1, is the coefficient-preserving comparison of topological rings.
- For noninjective N, the comparison is `TauCeti.NovikovSeries.hahnSeriesEquiv` (HahnSeries.lean:376).

**Repair.** Delete from "For injective N, construct" (line 58) through "in that project." (line 62). Keep the citation of the existing work and the coordination sentence.

Tested on N(a,b)=a+√2b on ℤ²: `domCongr` sends e^(1,1) to the monomial at 1+√2, coefficient for coefficient.

## R07 (P3) — Two wording slips

**Location.**
1. Lines 296–298, in "How to read the build": "its docstring names the pinned declarations that already prove the algebraic headlines".
2. §6.4, line 1413: "The chain adapters and local-index proof below supply the comparisons."

**Claim.**
1. Only Scope and ownership may say "already".
2. The finite-triangulation chain adapter is built above this sentence, in the mapping-torus item, and the local index is in §5.2.

**Witness.** Line 1362: "Build the finite-triangulation chain adapter here." It is inside the mapping-torus bullet, which comes before line 1413.

**Repair.**
1. Write "names the pinned declarations that prove the algebraic headlines".
2. Write "The chain adapter of the mapping-torus item, §5.2's local index and §6.5 supply the comparisons."

## Previous findings

- **R01 — not repaired.** The gate still reports `outside-folder=2` for the same two files. This is R01 above.
- **R02 — repaired.** `Suggested.lean` is now 106 lines, and the `AbelianCoverHomology` section and its docstring lines are gone. README lines 1638–1640 say "Its three supporting definitions are `fixedPointDerivative`, `rationalHomologyMap` and `vectorFieldChartDerivative`", which matches the file.
- **R03 — repaired.** Docstring lines 12–21 now name `TauCeti.NovikovSeries`, `completionPkg`, `mapRingHom`, `isDomain_of_fg`, `HomologicalComplex.reidemeisterTorsion` with its basis-change, homology-basis and componentwise forms, and `orbitZeta_eq_mapRingHom_eulerProduct` as pinned. The knot-surgery reason in lines 29–30 is a separate defect (R03 above).
- **R04 — repaired.**
  - §3.3 (lines 716–719) now reads "Consume the equivariant cellular chain complex `TauCeti.cellularChainComplexRep` of X̃, for the lifted CW structure `TauCeti.cwComplexPreimage`…".
  - "From Tau Ceti" (lines 221–232) lists all seven declarations.
  - The §2.2 *Needs:* (line 565) cites the native Hurewicz pair.
- **R05 — not repaired.** The merge-order paragraph is unchanged. #1161's head `e06d4d0` still cites "DGFloer Layer 1 item 1" at its line 80. This is R05 above.
- **R06 — repaired.** §6.5 (lines 1442–1453) now cites Granas, Example 9.1(iv), p. 221; Theorem 10.1, p. 224; (I), (II) and (VII) of §5, p. 214; §§2–3, pp. 210–211; and §6, p. 215. §6.4 (lines 1348–1349) gives Hopf's construction the article locator and Granas Theorem 10.1 for the index equality. All Granas locators were verified this round (sample table).
- **R07 — repaired.**
  - Line 830 now reads `det(d_s:D_i→E_(i−1))`.
  - The theorem's Checks (lines 1455–1459) now come directly after the theorem paragraph.
  - `## Downstream consumers` (line 1611) now precedes `## Worked examples` (line 1618).

## Verified sound

### Gate, build and dependency check

- **Worker's gate.** Every check is 0 except `outside-folder` (R01). `git diff --stat`, with the seventeen folders excluded, gives exactly those two files.
- **Dependency check.** The requested `gate --depcheck … --movable` prints exactly `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/MorseNovikov/Suggested.lean` exits 0. Its only warnings are the two `declaration uses sorry` at lines 61 and 90.
- **`#check` comparison.** I ran `#check @` on all five declarations in one scratch copy. Each type matches `signatures.md`.
  - Both headlines carry `FiniteDimensional ℝ E`, `I.Boundaryless`, `IsManifold I ∞ M`, `T2Space M`, `SecondCountableTopology M` and `CompactSpace M`, as README §6.5 and §7.3 state.
  - `hf : ContMDiff I I ∞ f` and `hV : ContMDiff I I.tangent ∞ …` are explicit.
  - No binder is lost. Nothing changed.
- **One-tactic probe.** On a scratch copy, `first | (simp; done) | rfl | infer_instance | decide | (norm_num; done) | exact?` fails on both `lefschetz_fixed_point_formula` and `poincare_hopf`, since `exact?` cannot close either goal. The file has no padding. No pinned declaration states either theorem: I grepped for Lefschetz, fixed-point index and Poincaré–Hopf names at both pins.
- **Form.** The file has one module docstring of the required shape, `namespace TauCetiRoadmap.MorseNovikov`, and the Layer 6 and Layer 7 section comments in README order. It uses `theorem` only and has no `set_option` and no sorry'd data. `public import Mathlib` is the only import; 20 roadmaps on main use the same module form, and the gate accepts it.

### Pinned declarations opened this round (49)

Each was opened at the pin and its hypotheses compared with the README sentence that cites it.

- **Novikov series** (RingTheory/NovikovSeries/):
  - `ofFinsupp_surjective_iff` (Basic.lean:697);
  - `unitsOneSub` (TopologicalRing.lean:312);
  - `expMulEquiv` (ExpLog.lean:70);
  - `multipliable_of_finite_cutoffs` (InfiniteProduct.lean:148);
  - `domCongr` and `continuousDomCongr` (Equiv.lean:55, 139), with the hypothesis ∃ c>0 that covers the reversal h↦−h;
  - `toLaurentSeries`, which is `≃+*` (LaurentSeries.lean:77), and `toLaurentSeriesUniformEquiv` over a field (:183);
  - `PeriodKernelSplitting`, `toHahnSeries` and `hahnSeriesEquiv` (HahnSeries.lean:98, 287, 376);
  - `isDomain_of_fg` (LeadingTerm.lean:266);
  - `cosetBasis`, `finrank_eq_index` and `trace_eq_index_smul_comap` (FiniteIndex.lean:146, 207, 216);
  - `log_normNonnegSubring` (Norm.lean:189);
  - `ofAddMonoidAlgebra_mem_nonZeroDivisors`, under `[NoZeroDivisors R] [AddGroup.FG H]`, and `map_ofAddMonoidAlgebra_injective` (NonZeroDivisors.lean:153, 169);
  - `isReduced_iff` (Reduced.lean:63);
  - `exists_finiteIndex_isDomain`, `charZero_quotient_of_isFractionRing` and `isArtinianRing_of_isFractionRing` (TotalQuotient.lean:67, 87, 95);
  - `isField_iff` (Field.lean:95);
  - `IrrationalExample.series`, `leadingTerm_series` and `eventually_period_ge` (Examples/Irrational.lean:129, 166, 195);
  - `orbitLog`, `orbitZeta`, `isUnit_orbitZeta`, `orbitZeta_eq_eulerProduct` and `orbitZeta_eq_mapRingHom_eulerProduct` (OrbitZeta.lean:98, 104, 183, 220, 264). The product exponent is −(ε₁σ), as README §5.3 states.
  - `Matrix.continuous_mulVec_extension_iff` (Matrix.lean:125).
- **Novikov modules:** `TauCeti.NovikovModule.kernelMap` (RingTheory/NovikovModule/KernelMap.lean:126). Its potential bound C and completed outputs are as README §3.1 requires.
- **Reidemeister torsion** (Algebra/Homology/ReidemeisterTorsion/):
  - `reidemeisterTorsion_eq_det_zpow` (Basic.lean:502): a two-term complex in degrees 1, 0 has torsion det(d)⁻¹;
  - `reidemeisterTorsion_eq_mul_of_splitting` (:738);
  - `reidemeisterTorsion_eq_mul_finprod_det_toMatrix` (:896): τ(A⁻¹dA)=τ(d)·Π det(A_i)^((−1)^i);
  - `componentwiseReidemeisterTorsion` (Componentwise.lean:99);
  - `tendsto_reidemeisterTorsion_of_det_torsionMinor_ne_zero` (Topology.lean:110).
- **Group rings and localizations:**
  - `AddMonoidAlgebra.exists_ringEquiv_pi_field_of_isFractionRing` (Algebra/MonoidAlgebra/TotalQuotient.lean:198);
  - `MonoidAlgebra.isReduced_of_isFormallyReal` (Algebra/MonoidAlgebra/Reduced.lean:56);
  - `IsLocalization.isReduced` (RingTheory/Localization/Reduced.lean:38).
- **Linear algebra and dynamics:**
  - `LinearMap.sign_det_one_sub_pow` (LinearAlgebra/Matrix/Charpoly/DetSign.lean:168): sgn det(1−f^k)=(−1)^(i₊)(−1)^((k+1)i₋);
  - `Flow.ClosedOrbit`, `Flow.ClosedOrbit.iterate` and `Flow.ClosedOrbit.multiplicity` (Dynamics/Flow/ClosedOrbit.lean:307, 382, 427), in the root `Flow` namespace.
- **Topology and manifolds:**
  - `TauCeti.cellularChainComplexRep` and `TauCeti.cellularChainRepIsoFree` (AlgebraicTopology/Cellular/Covering.lean:153, 252);
  - `TauCeti.cwComplexPreimage` (Topology/CWComplex/Classical/Covering.lean:398);
  - `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean:705), under `PathConnectedSpace`;
  - `TauCeti.IsNondegenerateFixedPt` (Geometry/Manifold/MFDeriv/FixedPoint.lean:74). In finite dimension it is equivalent to the headline's det(1−df_x)≠0, given smoothness.
  - `TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt` (FixedPoint.lean:146), under `[CompleteSpace 𝕜] [FiniteDimensional 𝕜 E] [CompactSpace M] [T2Space M]`;
  - `TauCeti.periodHom` and `TauCeti.mpullback_mem_exactForms_one_iff_periodHom_map_eq_zero` (Geometry/Manifold/DeRham/Period.lean:313, 421), under `[PreconnectedSpace M]`;
  - `TauCeti.IsMorseOneForm.finite_zeroSet` (Geometry/Manifold/Morse/OneForm.lean:171);
  - `TauCeti.MorseChart` (Morse/Lemma.lean:69) and `TauCeti.MorseChart.field` (Morse/PseudoGradient/Existence.lean:97);
  - `TauCeti.IsManifoldNondegenerateCriticalPoint` (Morse/Basic.lean:61);
  - `TauCeti.circleAngularForm` (Geometry/Manifold/DeRham/Circle.lean:92);
  - `TauCeti.eulerChar` (AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123). It needs `[FiniteCWType X]`, so `poincare_hopf`'s explicit Betti sum rightly avoids that extra hypothesis.
  - `TauCeti.KnotTheory.alexander` (KnotTheory/Alexander.lean:395).
- **Mathlib:** `IsAddQuotientCoveringMap.toMultiplicative` (Topology/Covering/Quotient.lean:45).

Each of the 137 other backticked identifiers of the README (the 142 minus the five `Suggested.lean` names) has a declaration of that name in a pinned source file, by my grep; the worker's citation check also finds none missing. The statements behind them were compared only for the declarations listed above.

### Cross-roadmap citations resolved (14 groups)

- **AlgebraicTopology at this head:**
  - Stages 1–3 (lines 526, 568, 694);
  - Stage 4 items 2–3, which consume `cellularDifferential` and `cellularSingularHomologyIso` (lines 735 and 738);
  - Stages 5–7 (lines 1172, 1456, 2184);
  - Stage 8 item 3 (lines 2296–2305), which consumes `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` and its naturality.
  - This pull request's AlgebraicTopology diff since `b66c1e8` changes only the Stage 8.8b ownership prose.
- **HeegaardFloer (main):** Lane M (line 217), §1.5 (M.5) (line 467) and §2.8 (F0.6) (line 1913).
- **MorseTheory (main):** M1–M4 and M6 (lines 110, 144, 453, 481, 895).
- **GeometricTopology (main):** Layers 1, 3, 4, 5 and 11 (lines 783, 1429, 1611, 5893, 7732).
- **DifferentialGeometry (main):** Layers 0–3, 5, 6, 8, 10 and 12.
- **Completed UniversalCovers:** Stage 2 item 8 (its line 111).
- **Overlaps.** `overlaps.md` lists #1161 as the only other open pull request that changes this roadmap (R05). There is no dropped or revision-only id, and this pull request drops no id that another roadmap cites.
- **Consumers.** DGFloer, SymplecticFieldTheory, TaubesGromov and HamiltonianFloerOperations cite N1, N4, N5 or N6, and those layers still exist.
- **Ownership.** A `roadmaps grep` over main and the 458 open heads, for the topological Lefschetz formula and for Poincaré–Hopf, finds only MorseNovikov, its consumers (K3Surfaces, K3SurfacesAndSymplecticBoundedness, AlgebraicTopologyPartII) and CharacteristicClasses (R04). The holomorphic Lefschetz formulas of SchubertGeometry and GroupActionsOnRiemannSurfaces are different theorems.

### Seeded sample of locators

| Target | Locator | Text at the locator | Result |
|---|---|---|---|
| 1.2 | rt3 §1.2, p. 211; §3.4, pp. 226–227 | rt3 lines 137–147: Nov(G,N) has finitely many coefficients below each R, and ℤG→Nov is the identity iff N≡0. Line 1043: finite cyclic cover, p. 226 | agrees |
| 1.3 | rt3 §1.3, (1.1)–(1.2), Remark 1.4, p. 212 | lines 166 (ζ=exp), 187–198 (positive part, exp over ℚ), 201 (product formula) and 209–212 (log), all on page marker 4, which is p. 212 | agrees |
| 1.5 | rt3 §1.4, pp. 212–213 | lines 213–224: CN_i is finite above f-thresholds and free on chosen lifts | agrees |
| 2.2 | rt3 Choice 1.2, p. 211 | lines 133–136: connected abelian cover with π*α exact; H₁(X)→H is onto, with kernel the classes of loops that lift | agrees. My computation K^ab→π₁^ab gives image = kernel. |
| 2.3 | Hatcher §1.2, pp. 51–52 | Hat02 lines 2338–2350: N₂ is the Klein bottle (square with word aba⁻¹b); abelianization ℤ₂⊕ℤ^(g−1) | agrees, as a comparison |
| 2.4 | rt3 §1.4, p. 213; Lemma 2.2, pp. 218–219 | line 243 (compactness); lines 538–575 (Lemma 2.2 and proof, bounded flow time) | agrees |
| 3.2 | rt3 §2.1, Lemmas 2.2 and 2.5, pp. 218–219; family-Floer erratum | lines 512, 538 and 592. The erratum (HutErr lines 23–25): the §2.2 continuation needs a generic function path; Proposition 3.4 is false; the fix is generic connections | agrees |
| 4.1 | rt3 Definition A.1, Proposition A.2, p. 239; Proposition A.5, p. 240; Milnor §3, pp. 365–368 | rt3 lines 1851–1875 and 1933–1944. Mil66 lines 258–273: τ(C)=Σ(−1)^i[b_i h_i b_(i−1)/c_i] on p. 365; Theorems 3.1 and 3.2, with the 3n+2 homology complex, at lines 286 and 316–329 | agrees. Milnor's two-term value is 2 against rt3's ½, computed. |
| 4.6 | rt3 (1.4), p. 213; Appendix A, pp. 239–240 | line 254 for (1.4); Appendix A as above | agrees. rt3 does not state the inequalities; the README says they follow by splitting the field complex. |
| 5.2 | rt3 §1.1, §1.3, pp. 210–212; Lemma 3.2, p. 223 | lines 58–82 (period p(γ), Lefschetz sign); 855–858 (Lemma 3.2 statement, p. 223); 861–912 (proof: invariance of the signed fixed-point count, p. 224) | agrees |
| 6.1 | rt3 Theorems A and B, pp. 214–215; §2, pp. 218–222; §§3.1–3.3, pp. 223–226 | lines 322 and 338; Lemma 2.11, (2.1) Cerf chart, lines 783–785 and 815; lines 837, 854 and 956 | agrees. I recomputed the Cerf indices as i and i−1. |
| 6.2 | rt3 §§3.4–3.5, Lemmas 3.5 and 3.7–3.10, pp. 227–231 | page markers 19 (line 1060, p. 227) to 23 (line 1341, p. 231); lemma lines as in the r15 table | agrees |
| 6.5 | Granas Example 9.1(iv), p. 221; Theorem 10.1, p. 224; §5 (I), (II), (VII), p. 214; §§2–3, pp. 210–211; §6, p. 215; Hatcher Theorem 2C.3 and proof, pp. 179–181 | Gra72 lines 452–459, 543–550, 199–226, 68–111 and 227–239; Hat02 lines 7787–7789 and 7829–7870 | agrees |
| 7.1 | rt3 Definition B.1, p. 241; Milnor TDV §6, p. 35 | rt3 line 1983 | agrees for rt3. Milnor is not verifiable (below). |
| 7.3 | Milnor TDV §6, p. 35 | — | not verifiable |

Outside the sample, rt2 Example 1.4, p. 372 (rt2 lines 150–154: zero surgery gives Alex(K)/(1−t)²) agrees with §6.4. No README locator is flagged as unverified. I fetched Mil66, HutErr and rt2 from the AMS open archive, the author's blog and the author's page, without editing any manifest.

### Adversarial table

Rows marked r10 were recomputed this round from the r10 values. Every other row is new this round.

| Statement | Instances | Values computed (left side; right side) | Result |
|---|---|---|---|
| `lefschetz_fixed_point_formula` | M=∅; point, f=id | 0; 0. det on 0-dim space =1, so +1; H₀ trace 1 | holds (r10) |
| same | two points: swap, constant | 0; tr[[0,1],[1,0]]=0. 1; tr[[1,1],[0,0]]=1 | holds (r10) |
| same | S¹ reflection; rotation | det(1−(−1))=2 ⇒ +1,+1 =2; 1−(−1)=2. 0; 1−1=0 | holds (r10) |
| same | S² rotation by θ≠0; antipodal | det(I−R_θ)=2−2cosθ>0 at both poles ⇒ 2; 1+1. 0; 1+(−1)=0 | holds (r10) |
| same | RP², [x:y:z]↦[x:2y:3z] | charts diag(2,3), diag(½,3/2), diag(⅓,⅔): signs +1, −1, +1 ⇒ 1; rational H₀ only ⇒ 1 | holds without orientation |
| same | T², x↦−x | 4 half-periods, det(2I)=4>0 ⇒ 4; 1−tr(−I₂)+det(−I₂)=1+2+1=4 | holds |
| same, wrong models | sign det(df−1); translation of ℝ | reflection gives −2≠2; 0≠1 shows `CompactSpace` is needed | conventions pinned (r10) |
| `poincare_hopf` | ∅; two points (E=0) | 0=0; 1+1=2=dim H₀ | holds |
| same | S¹, V=sin θ∂θ; T² constant field | +1−1=0=1−1; 0=1−2+1 | holds |
| same | S² height gradient; RP² Morse gradient | +1+1=2=1+0+1; 1−1+1=1=1+0+0 | holds without orientation (R04 witness) |
| same | ℝ, constant field | 0≠1 | compactness needed |
| `vectorFieldChartDerivative` | V=±x; V=x²; V=(−x,y) conjugated by diag(−1,1) | ±1; 0, so degenerate; det −1 before and after | determines the sign (r10) |
| `fixedPointDerivative` | f=−x; f=2x conjugated by 3x; 0-dim | det(1−(−1))=2; det(1−2)=−1 in both charts; det=1 | holds (r10) |
| §1.1 support | N(k)=k, Σt^k; H=ℤ, N=0 | 3 terms below 3; square has 3 at t², 0 at t⁻¹; infinitely many terms below 1 when N=0 | holds |
| §1.2 maps | ℤ²→ℤ projection; precomposition along ℤ⊕ℤ/2→ℤ | 1+e^(0,1)↦2; 1↦1+g, (1+g)²=2+2g≠1+g | pushforward only needs finite fibres of N-level sets; φ^* is not a ring map |
| §1.2 filtration | t² in U₂, U₃; −N | N=2 is not <2, so in U₂; 2<3, so not in U₃. Under −N, Σt^(−k) is finite below each cutoff | holds; reversal is `domCongr` along −id with c=1 |
| §1.3 | (1−t)Σt^k; exp, log | 1,0,0; 1+t+t²/2; t−t²/2 | holds |
| §1.4 domain | H=ℤ/2, R=ℤ | (1−g)(1+g)=0 | the torsion-free hypothesis is needed |
| §1.5 orbit module | one orbit with F(s)=0; t²·U₃ | F(e^h s)=−N(h), so finite-above equals finite-below in N; U₃→U₅ | holds |
| §2.2 exactness | ℝ→S¹; Klein cover C | 0→ℤ→ℤ, kernel 0; H₁(C)=ℤ↦2[b]=0, so H₁(X)≅H, exact with a non-injective first arrow | holds |
| §2.3 cover | A, B on ℝ×ℝ/2ℤ | AB=(s+1,−y−1)≡BA=(s+1,−y+1) mod 2; B²=id; A^nB^e is free unless n=0, e=0; P(A^nB^e)=n | universal abelian cover |
| §2.4 dimension | index pairs (1,0), (0,0) | 0; −1, so absent | holds |
| §3.1 differential | nonzero-period circle with a critical pair; t=1 | ∂p̃=q̃−tq̃=(1−t)q̃; 0 | holds |
| §3.2 continuation | constant family; lift change t² | [1]; [t²][t⁻²]=[1] | holds |
| §4.1 convention | ℚ—2→ℚ; A₀=3, A₁=5; minor complex ℚ→ℚ²→ℚ | rt3 ½, Milnor 2 (Mil66 formula); (10/3)⁻¹=3/10=½·3·5⁻¹; minors 1 and −1 ⇒ τ=∓1 | holds |
| §4.2 components | H=0; ℤ/2; ℤ/3; 𝔽₂ | ℚ; ℚ×ℚ with 1−g↦(0,2); ℚ×ℚ(ζ₃), dimension 1+2=3; (1+g)²=0 with 1+g≠0 | holds; ℤ[H] half pinned (R02) |
| §4.3 field / topology | N(a,b)=a on ℤ²; N(a,b)=a+√2b; 2+t^m | 1−e^(0,1)≠0 dies under pushforward, so not a field; injective, so field over ℚ (`isField_iff`); (2+t^m)⁻¹=½−t^m/4+… | holds; d=t^m has τ=t^(−m), so no limit |
| §4.4 norm, trace | s=t²; 1+t²; idempotent of ℚ[ℤ/2] | [[0,s],[1,0]]: trace 0, det −s, Norm(1−t)=1−s; Tr=2+2s=2·restriction; det [[½,½],[½,½]]=0 | holds |
| §4.5 componentwise | H=ℤ/2, d=1−g; lift changes | (0, ½); c₀↦tc₀ gives τ·t; c₁↦tc₁ gives τ·t⁻¹ | holds |
| §4.6 inequalities | d≠0 in ranks (1,1); point; d=0 | q=0: 0≤1, q=1: 0=0; 1=1; b=(1,1), q=1: 0≤0, gap = rank d₁ | holds |
| §5.2 local index | x/2; 2x; x+x²−ε | +1; −1; at ±√ε, 1−g′=∓2√ε, so −1,+1, total 0; ε<0: none, 0 | conserved |
| §5.3 iterate signs | multipliers ½, 2, −2 on a surface; circle | (1−t)⁻¹; (1−t); signs +,−,+,…, factor (1+t); (1+t)/(1−t²)=(1−t)⁻¹; log ζ=Σt^k/k | exponent (−1)^(n−i₀) holds; rt2 (2) fails in even n (Source issues) |
| §5.3 cover norm | double circle cover | Norm((1−t)⁻¹)=(1−s)⁻¹ | holds |
| §6.1 fold | x³/3−εx; Cerf chart (2.1) | zeros ±√ε, f″=±2√ε, so indices 0 and 1; Hessian diag(2x₁,−1^(i−1),+1^(n−i)) gives indices i−1 and i | holds |
| §6.2 covers | H=ℤ⊕ℤ/2, h=(2,1) | d=2; μ=2n mod 3: 4≡1; ν=n mod 4: h↦2, nh∈ker iff 2∣n; log-norm coefficient dk·c₂=4c₂ | holds |
| §6.3 limits | d=2+t^m; d=t^m | τ−½ has order m; τ=t^(−m) has no limit, and the limit d=0 is not acyclic | holds |
| §6.4 mapping torus, surgery | reflection, identity monodromy; unknot; trefoil | L(φ^k)=2 (k odd), 0 (k even) ⇒ (1+t)/(1−t); 1. S¹×S² cells d₁=t−1, d₂=0, d₃=t−1 ⇒ (1−t)⁻²; (t⁻¹−1+t)/(1−t)² | holds; no one-form enters (R03 witness) |
| §6.5 route | Granas Theorem 10.1 (VII), (I), (II), §6 | Ind(f)=Λ(f) on a compact ANR; additivity over isolated points; local index = degree of x−f(x) = sgn det(1−df) | located |
| §7.1 Euler chains | nonsingular S¹; S² gradient | classes form H₁(S¹)=ℤ; 2=χ(S²), not a boundary | holds |
| R06 comparison | N(a,b)=a+√2b on ℤ²; ℤ³, a+√2b | `domCongr` along H≃N(H), c=1: e^(1,1)↦monomial at 1+√2; `hahnSeriesEquiv` with K=⟨(0,0,1)⟩ | both pinned |

## Not verifiable

- **Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35** (§7.1, §7.3). It is not in the roadmap's source manifest. No legal online copy exists (I checked the publisher and author pages), so I did not re-read it this round.
- **Hopf 1929 (`Hop29`).** Settled as uncertified, and cited by its article locator only.
- **Turaev, *Introduction to Combinatorial Torsions* (2001) and the 1990 Euler-structures paper; Pajitnov, *Circle-valued Morse Theory* (2006).** Paywalled, and no legal copy was found. They appear only in References, with no locator that a target relies on.

## Source issues

- **Error** in rt2 at equation (2), p. 371: the source gives each primitive orbit the exponent −(−1)^(i₀); it should be (−1)^(n−i₀), equivalently −(−1)^(i₊+i₋), which agrees only for odd n=dim X; affects nothing.
- **Gap** in rt3 at Lemma A.4, proof, p. 240: the source infers that L_j⊗Q(ℤF) and L_j⊗Q(Nov(F,N)) are fields from ℤF and Nov(F,N) being domains; it should note ℚ is algebraically closed in those fraction fields; affects nothing.
