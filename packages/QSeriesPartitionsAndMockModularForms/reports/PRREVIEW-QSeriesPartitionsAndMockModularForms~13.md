# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at d11ee63)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in the folder since d8a67db. The head is a merge of main; the merge moved the pins of `lake-manifest.json` (Mathlib 6b7abb3c → 1b1ccf4b, Tau Ceti a91d3aaf → 2fd255d9, toolchain v4.36.0-rc2), so the library side was checked again at the new pins. The previous finding is repaired; the pin move leaves one stale passage.

## R01 (P3) — the README names pins that are no longer the pins of this head

**Location.** `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` line 34: "Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`." and line 59: "Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`."

**Claim.** The supplier contracts under "From Mathlib" and "From Tau Ceti" are stated against these two commits.

**Witness.** `lake-manifest.json` at d11ee63 pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; `Suggested.lean` is built against those. The merge of main into the branch changed the manifest, not the README.

**Repair.** Replace the two hashes at lines 34 and 59 by `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Nothing else in the contracts needs to change: tested at the new pins, all 9 `Mathlib/…` and `TauCeti/…` file paths the README cites exist, every backticked library name of the README resolves (the only names not found in the libraries are the supplier-roadmap names `cartier_add`, `cartier_smul`, `cartier_ofPowerSeries`, `finiteWeil_conjugate`, `weight_laplacian_slash`, which resolve in their roadmaps), and the definitions the Checks rely on are unchanged (listed below).

## Previous findings

- R01 — repaired: main now has ModularForms "### 0.2 The eta transformation and eta quotients" (line 395) and the normalized Fricke operator (line 95); the description now says "ModularForms §0.2 (the eta transformation) and its normalized Fricke operator are on main."

The repair introduced no new problem: ModularForms on main names this roadmap only as a consumer (its line 1541), and its ε(γ) for c>0, `exp(πi((a+d)/(12c) − s(d,c) − 1/4))`, gives exp(−πi/12) at γ=(1 0;1 1) (2/12 − 0 − 1/4 = −1/12), the value of this roadmap's §5.2 Check "eta multiplier positive c".

## Verified sound

### Gate and dependency check

- `gate … --base origin/main` at d11ee63, run for this review: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`.
- `gate --depcheck … --movable`: `depcheck: 227 roadmaps, 2109 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The roadmap is at line 247 of the merge order.
- `git diff --stat origin/main...HEAD` outside the folder: empty. (The files listed as changed outside the folder since d8a67db are main's own, brought in by the merge.)
- Folder diff d8a67db..d11ee63: empty, so none of the seeded sample targets falls in a changed passage; the previous report's source readings stand.

### Elaboration and padding, at the new pins

- `lake env lean` on `Suggested.lean` from the worktree: 19 `declaration uses sorry` warnings and nothing else (11 s).
- A scratch copy with every `sorry` replaced by `first | rfl | simp | infer_instance | decide | (intro; simp) | (constructor <;> simp) | (refine ⟨1, one_pos, fun _ => 1, ?_⟩; simp)` and `#check @name` for all 41 declarations: all 19 theorems fail every alternative (error sites at lines 58, 65, 75, 94, 119, 135, 144, 153, 164, 189, 196, 203, 244, 257, 268, 324, 332, 363, 387 of the copy); none is padding at the new pins either. The 41 `#check` types are those of the worker's `signatures.md` (0 lost binders; the file has no `variable` line); `rankCompletion_modular` still reads `∀ t, 1 < t → ∃ N, 0 < N ∧ ∃ χ, ∀ γ ∈ Gamma N, ∀ j, 0 < j → j < t → …`.
- Imports: `import Mathlib` and `TauCeti.Analysis.SpecialFunctions.Erf` (present at 2fd255d9, and built). No `set_option`, no sorry'd data.

### Library declarations re-opened at the new pins (32)

Mathlib 1b1ccf4b: `ModularForm.eta` (`DedekindEta.lean`:57, `𝕢 24 z * ∏' n, (1 - eta_q n z)`), `multipliableLocallyUniformlyOn_one_sub_pow` (:70), `eta_ne_zero` (:114); `ModularForm.discriminant` (`Discriminant.lean`:50, `(eta z)^24`), `discriminant_T_invariant` (:128), `eta_comp_eq_csqrt_I_inv` (:136), `discriminant_S_invariant` (:145), the cusp form (:237); `jacobiTheta₂_term` (`TwoVariable.lean`:46, exponent `2πinz + πin²τ`), `jacobiTheta₂` (:252), `hasDerivAt_jacobiTheta₂_fst` (:337), `jacobiTheta₂_functional_equation` (:466); `slash_apply` (`SlashActions.lean`:149, still `σ g (f (g • τ)) * |det g|^(k−1) * denom g τ^(−k)`, so the §4.8a weight-zero Check keeps its factor 1/N); `CongruenceSubgroup.Gamma` (:42); `Nat.Partition.ofSums` (`Partition/Basic.lean`:87), `restricted` (:205), `conjugate` (`YoungDiagram.lean`:76), `rowLens_ofPartition_eq_sort_parts` (:42), `hasProd_genFun` (`GenFun.lean`:170), `pentagonalSeries` (`Pentagonal/PowerSeries.lean`:81); `tprod_one_add_ne_zero_of_summable` (`Log/Summable.lean`:214, `[CompleteSpace R] [NormMulClass R]`, as line 49 of the README says); `ZMod.val_lt` (:61, `[NeZero n]`), `natCast_zmod_val` (:205), `coe_mul_inv_eq_one` (:778); `PowerSeries.invOfUnit` (`Inverse.lean`:65), `isUnit_iff_constantCoeff` (:92); `Real.GammaIntegral_convergent` (`Gamma/Basic.lean`:66).

Tau Ceti 2fd255d9: `TauCeti.Real.erf` (`Erf.lean`:61, `2/√π ∫₀ˣ exp(−t²)`), `erfc` (:64, `1 − erf`), `erf_zero` (:74), `erfc_zero` (:78), `erf_neg` (:82), `hasDerivAt_erf` (:102); `lowerIncompleteGamma` (`IncompleteGamma.lean`:115) with `_eq_integral` (:124, `0 < s`, `0 ≤ x`) and `hasDerivAt_` (:250, `0 < x`); `modFormCharSpace`, `cuspFormCharSpace` and the two nebentypus criteria (`DiamondOperators.lean`); `eichlerIntegral_slash_apply` (`EichlerIntegral/Transformation.lean`); `homologyCauchyTheorem` (`Analysis/Contour/HomologyCauchy.lean`:108), `classicalResidueTheorem_circle`.

### Duplication at the new pins

A case-sensitive grep of both libraries for `Appell`, `Lerch`, `mockTheta`, `Zwegers`, `qPochhammer`/`QPochhammer`, `RogersRamanujan`, `quintuple`, `qBinomial`, `BaileyPair`, `partitionRank`, `crank` finds two new Tau Ceti modules, neither of which states a target of this roadmap or a declaration of `Suggested.lean`:

- `TauCeti/Analysis/SpecialFunctions/QPochhammer.lean` (new since a91d3aaf): convergence, shift and nonvanishing of `∏_{n≥1}(1 − qⁿw)` over a complete normed field, the theta product `qTheta` with `qTheta_mul_left`, and the analytic distinct/odd identity. This is the analytic complex product that this roadmap does not own: §1.6 and §3.3 take it from GeometryOfNumbersAndQuadraticArithmetic §4.3. No change is asked here.
- `TauCeti/NumberTheory/ModularForms/DedekindEta.lean` (new): `eta_two_mul`, `eta_div_two`, `eta_add_one_div_two`, `eta_neg_one_div_sq`. These are eta-quotient product identities and the squared S law; the general multiplier ε(γ) that §5.2 consumes is still ModularForms §0.2, not a pinned declaration.

The worker's `library-matches.md` has 0 same-name hits for the 41 declarations.

### Cross-roadmap citations resolved again (main 8101f2c, open heads of the 18:23 index)

- On main: ModularForms §0.2 (395), normalized Fricke operator (95), Layer 10A (1150), Layer 10B (1173); ComplexKahlerGeometry K5b.1; PDE Layer 5 (1827), §3.1 (1304); ClassicalArithmeticCompletion §2.10 (2770), §2.31 (3389), §4.20 (7688), §4.40 (8245), §4.60 (8737), §4.61 (8763); PadicMeasuresIwasawaAlgebras §2.9 (1788); ThetaSeries Layers 1–3 (from 423); IntegralLattices 0G and 1G–1H; ContourIntegration Layers 2–3 and StandardDistributions (completed).
- At open heads: AutomorphicSpectralTheory §1.16 (1249, `weight_laplacian_slash` 1258); GeometryOfNumbersAndQuadraticArithmetic §4.3 (1532, `qPochhammer`, `jacobiProduct`, `appell_lerch_difference_identity` at 1606–1608); HabiroCyclotomicCompletions §1.1 (205); ArithmeticStatisticsPartIV §3.2 (129), §3.9 (781); MetaplecticAutomorphicForms §§2.4b (477), 2.5 (521), 2.6 (529), 4.7 (1245, `finiteWeil_conjugate` 1255), 6.18 (1769), 6.20 (1805), 7.1 (1835), 7.2 (1851), 7.49 (2379); AutomorphicFormsOnReductiveGroups §4.5 (705).
- 37 citations, all found. The worker's lead "BruinierFunke2003, §3" is a source key, not a roadmap. `overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none exists only at an open revision. The closest roadmaps in vocabulary (HalfIntegralWeightModularForms, HabiroNahmSeries, SiegelModularForms, MetaplecticAutomorphicForms, MaassForms) were compared for ownership in the previous report; the folder is unchanged and `roadmaps resolve` reports nothing new.
- Description: its five open suppliers (#1172, #925, #851, #1314, #1063) are open new-roadmap pull requests, all earlier in the merge order; its sentence on ModularForms is now true.

### Declared gaps

Unchanged: the three gaps are stated under their suppliers' subsections with the slugs of the plan (README lines 95, 103, 123). The new Tau Ceti pin does not supply any of them (no pair-model comparison of the metaplectic cover, no analytic elliptic regularity, no vector-bundle Dolbeault vanishing).

### Adversarial table

No statement changed, so every row is carried from the previous report (PRREVIEW-QSeriesPartitionsAndMockModularForms~12, "Adversarial table", 39 rows, values computed there from the Lean definitions). The definitions those computations depend on were re-read at the new pins and are unchanged (`ModularForm.eta`, `jacobiTheta₂_term`, `TauCeti.Real.erf`, `slash_apply`, `Nat.Partition`). The headline rows, with their values:

| Statement | Instances | Values on each side (previous report) | Result |
| --- | --- | --- | --- |
| `qBinomial` | (a,q,z)=(0.3+0.2i,0.4−0.3i,0.5+0.1i); q=0 | 1.8736257319−0.4684739279i both; 1.2454545455 both | Keep |
| `qBinomial_largeBase` | (0.5,2,0.7) | 0.65 both | Keep |
| `euler_qExponential` | q=0.4−0.3i, z=0.5+0.1i; q=0 | 2.4874562632−0.3500169047i both; 2 = 1/(1−z), 1.5 = 1+z | Keep |
| `ramanujanOnePsiOne_hasSum` | (2,0.3,½,0.6); b=0 | −0.0920302027 both; residual ≤5.7×10⁻¹⁶ | Keep |
| `baileyLemma_transform` | exact ℚ, a=⅓, q=½ | β′₁=5484/2717 both ways; pair relation for n=0…8 | Keep |
| `rogersRamanujan_count`, `_count_two` | n=0…20 | …,23,26,31 both; …,15,16,20 both | Keep |
| `rogersRamanujan_hasSum` | q=0.45+0.3i | 1.2605476441+0.7632052939i both | Keep |
| `quintupleProduct_hasSum` | (0.3+0.2i,0.7−0.4i) | 1.8340448725−0.8634664154i both | Keep |
| `partitionRank`, `partitionCrank` | (3,2,1,1),(1),(3,3),(2,2,2),() | rank −1,0,1,−1,0; crank −1,−1,3,2,0 | Keep |
| `rank_equidistribution_five_seven` | sizes 4…24 mod 5; 5…26 mod 7 | classes [1],[6],[27],[98],[315]; [1],[11],[70],[348] | Keep |
| `crank_equidistribution_five_seven_eleven` | sizes 6,17,28 mod 11 | crank classes [1],[27],[338]; rank control at 6 unequal | Keep |
| `partition_primePowerCongruences` | ℓ=5,7,11, r≤3, values ≤1400 | δ=(4,24,99),(5,47,243),(6,116,721); all divisible; p(243)≡0 mod 49, ≡245 mod 343 | Keep |
| `zwegersMuHat_elliptic` | five (k,l,m,n) at τ=0.17+1.1i | residuals ≤5×10⁻¹⁶ | Keep |
| `zwegersMuHat_modular` | S at (i,⅓,¼); four more γ | both sides 0.7167793626i; residuals ≤5.8×10⁻¹⁰ | Keep |
| `thirdOrderF_rank` | q=0.3+0.25i | 1.2056564842+0.0794678723i vs 1.2056564849+0.0794678713i (tail 10⁻⁹) | Keep |
| `thirdOrderCompletion_T`, `_S` | four τ | residuals ≤8.1×10⁻¹⁴; F₃+G₃ fails S by ≥0.43 | Keep |
| `rankCompletion_modular` | t=5, γ=(1 0;25 1), four α | every ratio e(1/24)=0.9659258263+0.2588190451i; +D/2 gives non-constant ratios | Keep |
| `rankResidueDeviation_mock` | t=1…7, every r | worst residual 9.0×10⁻¹⁶; t=1: 0=0 | Keep |
| §5.2 Check, against ModularForms §0.2 on main | γ=(1 0;1 1) | 2/12 − s(1,1) − 1/4 = −1/12, ε=exp(−πi/12) on both sides (recomputed this round) | Keep |
| §4.8a Check "weight-zero normalizations" | W=(0,−1;11,0), k=0 | pinned slash gives 11⁻¹F(−1/(11τ)); (√11)² restores F(−1/(11τ)) (re-read at 1b1ccf4b) | Keep |

## Not verifiable

- As in the previous report: GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified and cited by locator only; the common multiplier of `rankCompletion_modular` was sampled for t=3, 4, 5, 6, not proved for every t.
- Ownership against open pull requests was checked through the worker's `overlaps.md` and `citations.md` and the heads of the six open suppliers; the other open heads were not re-read this round, the folder being unchanged.

## Source issues

- none
