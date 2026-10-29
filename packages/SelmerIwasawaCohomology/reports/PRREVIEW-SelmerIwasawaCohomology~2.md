# Review of SelmerIwasawaCohomology (pull request #869 at cbf830f)

**Verdict:** needs changes

## R01 (P2) — The L-function-record comparison still makes LFunctions an upward supplier

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:141`–`:148` (“### Gamma products … The record comparison consumes LFunctions Layer 0”), `:2056`–`:2059` (“For such a list `f` and a supplied LFunctions `AnalyticLFunctionData d` … prove the equality”), `:2086`, `:2101`–`:2103`, `:2107` (“*Needs:* … LFunctions Layer 0 (`AnalyticLFunctionData.gammaFactor`, for the record comparison)”), and `TauCetiRoadmap/SelmerIwasawaCohomology/Suggested.lean:33` (“The L-function-record comparison in §4.14 requires its analytic L-function record”).

**Claim:** §4.14 consumes the analytic L-function record of LFunctions Layer 0 and compares the Hodge Gamma product with its gamma factor.

**Witness:** The dependency check on this head: `UPWARD: SelmerIwasawaCohomology (#40) -> LFunctions (#268) at README lines [2107]` and `not movable: … consumed by ArithmeticKTheory (#251), which comes first`. The repair round changed only the link format of the citation (change set, lines 103–107) and left the target, the contract subsection and the docstring sentence in place; the previous review's R01 was neither repaired nor marked not actionable with a reason. The same contract subsection also names ZerosOfLFunctions (#268) as the owner of the divisor, inside “Exact supplier contracts”.

**Repair:** Delete the record-comparison target from §4.14 (the two sentences at lines 2056–2059, the API bullet at line 2086, the Check at lines 2101–2103 and the LFunctions item of the `*Needs:*` line), delete the “Gamma products” subsection of the supplier contracts (lines 139–148; if the ZerosOfLFunctions deferral is wanted, state it in Scope and ownership as a deferral, not as a contract), and delete the docstring sentence at `Suggested.lean:33`. Record under Downstream consumers that LFunctions Layer 0 may compare its record's gamma factor with `hodgeGammaFactor`; LFunctions is later in the order and can consume this roadmap. Test on the refuting instance: the list with two real shifts `0` and one complex shift `0` still has product `Γℝ(s)²Γℂ(s)`, integer count `3` and order `−3` at `0` with no record present, and both headline theorems `gammaPoleOrder_hodge_analytic` and `gammaPoleOrder_complexHodge_analytic` keep their statements unchanged. Re-run the dependency check; it must print no UPWARD line.

## R02 (P3) — Four ArithmeticGaloisDuality names cited here do not exist at that supplier's head

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:253` and `:259` (“`Set.unit_moduleFinite` of ArithmeticGaloisDuality §R02.3.0c”), `:1016` and `:1095` (“the finite-place `GaloisCohomology.compactCochains`”), `:1192` (“(`localDualError`). When every `Err_v` is acyclic (`derivedComplement_iff`)”).

**Claim:** These are declarations of ArithmeticGaloisDuality §§R02.3.0c, D7.5 and D7.7.3.

**Witness:** ArithmeticGaloisDuality at its open head (`roadmaps show`, 7442 lines) contains none of the four strings. §R02.3.0c names `Set.unit_fg` and `Set.unit_fg_of_units` for the finite-generation statement; §D7.7.3 defines the error cone as `Err_v` and states derived complementarity as its acyclicity without a named `iff`; the compact-support paragraph of §D7.5 carries no backticked declaration name. The mathematics is owned there; only the names are stale.

**Repair:** Replace `Set.unit_moduleFinite` by `Set.unit_fg` (§R02.3.0c) at lines 253 and 259; write the finite-place compact-support complex of §D7.5 in prose at lines 1016 and 1095; and at line 1192 write “its cone is `⊕_v Err_v` of §D7.7.3, and derived complementarity means every `Err_v` is acyclic”, dropping the two invented names. Test: `roadmaps resolve` on the README must list none of these four names.

## R03 (P3) — Checks of §4.14 name a Lean declaration

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:2094`, `:2095`, `:2097` (“directly at a complex place, `complexHodgeGammaFactors` of the zero carrier gives product `1`”).

**Claim:** The Check describes the complex-place factor list of the zero and Tate carriers.

**Witness:** Three Checks name `complexHodgeGammaFactors`; the house rule in the brief is that a Check never names or claims a Lean counterpart (the API bullet at line 2081 already carries the name).

**Repair:** Write the three Checks in prose (“the complex-place factor list of the zero carrier”, “of the type-`(2,2)` Tate line”, “of the weight-one structure”). The computed values stay: product `1`; `Γℂ(s−2)`; two zero shifts giving `Γℂ(s)²`.

## R04 (P3) — Dangling sentence fragment in §3.0

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1367`–`:1369` (“… profinite abelian group `Γ`. The definition\nThe involution needs only a commutative ring `O` and a topological abelian group `Γ`.”).

**Claim:** Two hypothesis statements for the involution.

**Witness:** “The definition” ends the line without a predicate; the next line restates the hypotheses with a different generality (profinite versus topological `Γ`), so the reader cannot tell which is meant.

**Repair:** Keep one sentence: the involution is defined on `TauCeti.completedGroupAlgebra O Γ` for a commutative ring `O` and a topological abelian group `Γ` by `domCongr` along inversion; continuity and involutivity hold for every topological commutative `O` and profinite abelian `Γ`.

## R05 (P3) — Three locators point beside the statement they support

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:826` (§2.18, “Rubin … Proposition 5.6 … Remark 5.5”), `:1648` (§3.14, “Nekovář, §8.9 … §8.10 …; Kato, §12.2, pp. 220–221”), `:283` (§0.11, “Rubin … Appendix B §§4–5, pp. 155–158”).

**Claim:** The cited passages support, respectively, the finiteness and finite-generation statements of §2.18, the `det⁻¹` convention and height-one divisor formula of §3.14, and the cup-product and projection-formula statements of §0.11.

**Witness:** rubin-aws line 770: finiteness of `S^Σ(K,W_M)`, finite generation of `S^Σ(K,T)` and of the dual of `S^Σ(K,W)` are Lemma 5.7, which §2.18 states but does not cite. kato lines 4004–4035: §12.2 states the Iwasawa rank formula (12.2.1)–(12.2.3) and the local `H²`, not a determinant convention; nekovar lines 9174–9230 and 9492–9515 give duality error terms and control, not the inverse-determinant normalisation. rubin-aws lines 6764–6800: Appendix B §4 is induced modules and Shapiro (Proposition 4.2, Remark 4.3) and §5 is semilocal cohomology; neither contains cup products or the projection formula.

**Repair:** Add Lemma 5.7 (printed p. 13) to §2.18's locator. In §3.14 cite PadicMeasuresIwasawaAlgebras §5.1 and Burns–Flach, equation (1.9), p. 73, for the determinant normalisation, keeping Nekovář §8.9 for the error terms. In §0.11 keep Rubin B.4.2–B.4.3 for the Shapiro and induced-module parts and attribute the cup and projection formulas to ProfiniteCohomology Layer 12 alone, as the `*Needs:*` line already does. Test: each displayed statement then has a locator whose text contains it.

## R06 (P3) — §4.18 restates the supplier's Leopoldt proposition

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:2184` (“The resulting Selmer group is finite iff the p-adic unit localization map … has `rank r₁+r₂−1` (Leopoldt)”).

**Claim:** Leopoldt's condition is stated in prose as the rank of the unit localisation.

**Witness:** IntegralIwasawaTheory §2.2 (open head, lines 313–319) defines `leopoldtDefect E p` and `LeopoldtConjecture E p` with the equivalence to injectivity of the localisation, and NoncommutativeAndEquivariantIwasawa §F.4 already consumes them (“no second proposition or rank defect is defined here”). The rank statement here is the same proposition under a third wording.

**Repair:** State §4.18 as: the strict-at-`p` Selmer group of `ℚ_p/ℤ_p(1)` is finite iff `LeopoldtConjecture F p` holds (IntegralIwasawaTheory §2.2), with its corank equal to `leopoldtDefect F p`; keep Rubin Corollary I.6.4 and Remark II.2.7 as the source of the equivalence. Test: for `F = ℚ` the defect is `0` and the group is finite; for a field with positive unit rank the zero localisation would give corank `r₁+r₂−1`, which the supplier's definition detects.

## Verified sound

**Head and scope.** The worktree is at `cbf830f1495231eca43e452da14380d5875b6fed`; `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds `README.md` (2674 lines), `Suggested.lean` (233 lines) and `metadata.toml` (`topic = "math.NT"`). Both target files were read in full. No `set_option`, no sorried data, no computational algorithm, no copied source passage, no LaTeX delimiters, no process words, no pull-request numbers and no machine paths were found; the roadmap imports its suppliers by name and section and plans none of them again.

**Previous findings, checked one by one.**

| r1 finding | Passage at this head | Status |
| --- | --- | --- |
| R01 LFunctions record comparison | `README.md:141`–`:148`, `:2056`–`:2059`, `:2107`; docstring line 33 | Not repaired (R01 above); the dependency check still fails on it. |
| R02 import supplier module-level Selmer objects | `:17` (“NoncommutativeAndEquivariantIwasawa §F.4 supplies … the module-level local conditions, Selmer groups, their contragredient duals and the basic étale comparison”), `:97`, `:506`, `:533`, `:579`, `:606`, `:666`, `:1667` | Repaired. Each of §§2.7, 2.8, 2.9, 2.10, 2.12 and 3.15 now names the supplied instance and retains only its stated extension; the supplier's §F.4 (open head, lines 1752–1770) says the same in its own words. |
| R03 reuse arithmetic class and unit towers | `:83`, `:2142`–`:2162` (“import the arithmetic tower modules of IntegralIwasawaTheory … Notation dictionary”), `:2170` | Repaired. §4.16 keeps only the plus/minus parts and the real-tower identification; §4.17 derives its sequence from the supplier's `infiniteGlobalLocalSequence` with the quotient direction `U/E`. |
| R04 Fontaine–Laffaille realization | `:129`, `:1891`–`:1897` (“Consume from FiniteFlatGroupsAndIntegralPadicHodgeTheory … This target identifies the essential image in this roadmap's sign convention”) | Repaired. §§R07.3.3a, 3.6–3.7, 3.10–3.12, 3.14, 3.16–3.17 all exist at that supplier's head (lines 4741–5239); §4.7 adds only the reindexed essential-image statement. |
| R05 rank-one locator | `:1145` (“ArithmeticGaloisDuality §R02.5.2 *Rank-one Selmer numerics*”) | Repaired; §R02.5.2 exists (supplier line 6749). |
| R06 undeclared own API names | API bullets throughout; the 17 backticked own names each occur in `Suggested.lean` | Repaired. Every own backticked name in the README is declared in the Lean file (count check: all 17 names, 1–4 occurrences each); the remaining backticked names are library or supplier declarations. |
| R07 layer form | `:1` (lower-case title), `:1330`–`:1336` (Layer 2A Examples and Dependencies), `Suggested.lean:43`, `:114`, `:134` (layer comments) | Repaired. |

**Gate and build.** The worker's gate at this head passes every text, file-scope and build check and fails only `depcheck`. Fresh dependency-check output (verbatim):

```text
not movable: SelmerIwasawaCohomology consumes LFunctions (#268) and is consumed by ArithmeticKTheory (#251), which comes first: moving SelmerIwasawaCohomology after LFunctions would put a supplier after a consumer, a cycle through SelmerIwasawaCohomology
UPWARD: SelmerIwasawaCohomology (#40) -> LFunctions (#268) at README lines [2107]
depcheck: 201 roadmaps, 1323 edges, 1 problem(s)
```

The ClassFieldTheory and ProfiniteProPGroups lines of the previous round no longer appear; the only remaining problem is R01. `lake env lean` on `Suggested.lean` (all three `TauCeti.*` object files present) exits 0 with exactly six `declaration uses sorry` warnings, at lines 74, 103, 123, 197, 203 and 224, and nothing else.

**Signatures.** A scratch copy with `#check @name` for all 17 declarations elaborated. The elaborated types agree with the README statements: `padicKummer_equiv` keeps `[NeZero (p : K)]`; `weaklySemisimple_integral_lift` keeps `IsDomain`, `IsDiscreteValuationRing`, `IsFractionRing O K`, `Module.Free` and `Module.Finite`; `finiteCotype_primaryDecomposition` keeps the p-primary hypothesis and `Finite (torsionBy G p)`; both Gamma theorems keep `FiniteDimensional ℂ W`; `congruentLocalKummerImage_ncard` keeps `Squarefree n`. No binder was lost.

**Padding probe.** In three scratch copies each of the six admissions was replaced by `simp`, by `rfl` and by `infer_instance`. None closed (`simp` made no progress or left the full goal; `rfl` failed on every goal; `infer_instance` found no instance). By object, none of the six restates a definition, mirrors a Check or computes a small value: no padding finding.

**Headline inventory and statability.** The README's end theorems are: the p-adic Kummer identification (§0.8); integral lifting of weak semisimplicity (§0.13); finite-cotype primary decomposition (§2.12a); Poitou–Tate and Greenberg–Wiles for Selmer groups with the arithmetic and deformation comparisons (§§2.19–2.20, 2A.1–2A.5); Iwasawa Shapiro, descent, control, duality, Euler ranks and determinants (§§3.1–3.14); the étale `K(π,1)` and `j_*` comparison (§3.15); Greenberg's structure theorems and Fitting equals characteristic (§§3.18–3.21); the small-weight realization and finite/ordinary conditions (§§4.7–4.12); the Hodge Gamma order formulas and criticality (§§4.14–4.15); the unit/class-group dictionary and the main-conjecture propositions (§§4.16–4.23); elliptic Bloch–Kato and adjoint finiteness (§§4.26–4.27); ordinary-family parity (§4.28); Cassels–Tate and congruent-number parity (§4.29). Six are statable at the pins and are stated (the Gamma formula as its real and complex halves). The module docstring names, for each of the others, the carrier that is missing: restricted-ramification groups with localisation maps and arithmetic Selmer complexes, Iwasawa cochain complexes and determinant lines, crystalline period realizations and finite-condition carriers, arithmetic tower modules and p-adic L-function data, pairings on Selmer complexes, and infinite elliptic Selmer and Sha carriers. At the pin Tau Ceti has only finite 2-Selmer groups of elliptic curves (`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104`, `selmerGroup₂`) and Mathlib only `ContinuousCohomology.tateShafarevich`, so the infinite-Selmer-corank parity and the Cassels–Tate pairing are not statable, as the docstring says. One docstring sentence must go with R01.

**Source sample.** All 15 sampled targets were checked against legally fetched text at the cited locator: Rubin's 1999 Arizona Winter School draft from the AWS site, Rodrigues Jacinto–Williams arXiv v2, Nekovář from Numdam, Liu–Tian–Xiao–Zhang–Zhu from arXiv (v3), Greenberg's structure preprint from the Warwick page, Fontaine–Laffaille and Breuil from Numdam, Nizioł from the author's page, Kato from Numdam and Milne's ADT from the author's page. The README flags no locator as unverified. Page arithmetic used the README's stated offsets (Rubin +10, Nekovář +9, Milne +8).

| Target | Text read (source id, line or page) | Conclusion |
| --- | --- | --- |
| 0.11 | rubin-aws lines 6764–6800 (B.4.2–B.4.5, printed 156) and 6834–6880 (B.5.1–5.3, printed 157–158); Chapter I Example 2.1, line 353 | Shapiro, induced-module and semilocal statements supported; the cup/projection parts are not in B.4–B.5 (R05). The Check `κ_K(Na) = [L:K]κ_K(a)` recomputed. |
| 0.13 | ltxzz lines 493–546 (Definition 2.1.2, Lemmas 2.1.3–2.1.5) | Hypotheses match: residual weak semisimplicity plus the dimension inequality give equality and integral weak semisimplicity; the endomorphism form over a DVR was proved independently in the table below. Journal pages not re-verified (arXiv v3 read). |
| 2.7 | rubin-aws lines 406–426 (Definition 3.1, Lemma 3.2, printed 4) | Coinvariant formula needs torsion discrete, finite-type `ℤ_p` or finite-dimensional `ℚ_p` coefficients, exactly as stated; the non-torsion discrete control is correct. |
| 2.8 | rjw lines 3942–3949 (Definition 13.19(1), p. 70) | Definition matches; the source asks for a `G_ℚ`-invariant filtration, the roadmap for decomposition-group stability, and says so. |
| 2.14 | rubin-aws lines 429–448 (Corollary 3.3, printed 5) | Both dimension formulas and the `I′`/tame-quotient argument match. |
| 2.16 | rubin-aws lines 597–610 (Proposition 4.2, printed 9) | Statement and dimension count match; archimedean case is the zero case. |
| 2.18 | rubin-aws lines 746–777 (Lemma 5.4, Remark 5.5, Proposition 5.6, Lemma 5.7, printed 12–13) | Limits and the strict exception match; the finiteness clauses are Lemma 5.7 (R05). |
| 2.19 | rubin-aws lines 957–1047 (Theorem 7.3, printed 17–18) | (i)–(iii) and the hypotheses (orthogonal finite conditions at `p`, finite `Σ₀ ⊆ Σ`) match. |
| 2.20 | rubin-aws lines 1056–1075 (Corollary 7.5, printed 19) | Statement matches; the `lim¹` bookkeeping is the roadmap's addition. |
| 3.0 | nekovar lines 7777–7805 (8.4.1–8.4.2, printed 204–205), 8163–8200 (8.4.8.1, printed 214), 8226–8243 (8.4.8.3–8.4.8.4, printed 215–216) | Coordinates, twists `M⟨n⟩`, `M^ι`, the regular sequence and closed-subgroup descent match; the semilocal non-local case for `Δ ≠ 1` is correctly flagged as the roadmap's extension. |
| 3.14 | nekovar lines 9174–9230 and 9492–9515; kato lines 4004–4035 (§12.2, printed 220) | Duality errors and control supported; the `det⁻¹` convention has no locator in these passages (R05). |
| 3.18 | greenberg-structure lines 179–257 (RFX, LOC(1), LOC(2), LEO, CRK, printed 6–7), 398–405 (Proposition 2.6.3, printed 11), 722–731 (Proposition 4.1.1, printed 19) | Every listed hypothesis and the alternatives (a)–(c), including divisible versus coreflexive `Q_η`, match the source. |
| 4.7 | fontaine-laffaille pages 16, 36–37, 48–49 (Theorems 3.3, 6.1, Propositions 7.15, 7.17, Theorem 8.4); niziol lines 77–176 (§2, printed 749–751); breuil lines 244–274 (Proposition 6, Remark 8, printed 465); ltxzz lines 607–619 (Lemma 2.2.6) | Interval, unramified base, torsion/lattice realization and the Breuil lifting criterion match; the sign reindexing is the roadmap's. |
| 4.16 | rjw lines 3829–3854 (Definition 13.12, Proposition 13.13, Corollary 13.14, pp. 67–68) | Closed unit images, the plus parts and the reciprocity sequence match; the reversed quotient in the source is corrected here. |
| 4.18 | rubin-aws lines 896–901 (Corollary 6.4, printed 16) and 1273–1274 (Remark II.2.7, printed 25) | “Finite iff Leopoldt” is Remark II.2.7; Corollary 6.4 gives the forward direction. |

Also read for targets touched by findings: rjw lines 3960–4042 (§§13.5.2–13.5.3, Conjecture 13.21, Example 13.22, Remark 13.23) for §§4.20–4.22; rjw line 3834 (Definition 13.12 remark) and 3853 (Corollary 13.14 proof); nekovar lines 8244–8258 (8.4.8.5) for §3.4; ltxzz lines 620–629 and 752–774 (Lemmas 2.2.7, Proposition 2.4.6) for §§4.11, 4.24–4.25; rubin-aws lines 846–893 (§6.2) for §4.18.

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`, the manifest pins): `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` (`tateShafarevich`, `mem_tateShafarevich`, `tateShafarevich_eq_ker_pi`); `Mathlib/LinearAlgebra/Matrix/Trace.lean:265` (`trace_surjective` needs `[Nonempty n]`, as §2A.4 says); `Mathlib/RingTheory/AdicCompletion/Basic.lean:618` (`of_injective_iff`); `Mathlib/RingTheory/DedekindDomain/SInteger.lean:108` (`Set.unit`); `Mathlib/RepresentationTheory/Continuous/TopRep.lean:64` (`TopRep.of`); `Mathlib/RingTheory/Regular/RegularSequence.lean:146` (`IsRegular`); `Analysis/SpecialFunctions/Gamma/Deligne.lean` (`Gammaℂ_def`, `differentiable_Gammaℂ_inv`), `Analysis/Meromorphic/Complex.lean` (`Meromorphic.Gamma`), `meromorphicOrderAt_mul`, `Algebra.IsUnramifiedAt`, `Algebra.FormallyEtale`, `PadicAlgCl`, `PadicComplexInt`, `BDeRhamPlus`, `fontaineThetaInvertP`, `isMittagLeffler_of_exists_finite_range`, `exist_unique_eq_mul_prod`, `instFintypeClassGroup`, `card_rootsOfUnity`, `IsIntegral.of_pow`, `orthogonalBilin_*`, `IsPerfPair`, `cyclotomicCharacter`, `ContRepresentation`; Tau Ceti `PadicTateTwist`, `padicCompletionUnits`/`Transition`/`UnitsOf`, the Kummer file (`kummerClassMap_injective`, `kummerIso_res`, `kummerIso_norm`, `kummerCoeffPow`, `explicitCoeff1_kummerCoeffPow_*`, `powerClassQuotient`), `finiteIndex_range_powMonoidHom`, `shapiroIsoTopRep`, `shapiroMap`, `explicitInfRes_exact`, `completedGroupAlgebra` with `domCongr_of` and `powerSeriesCoordinate`, `localCyclotomicCharacter`, `Hodge.Conjugation`, `finite_setOf_hodgeNumber_ne_zero`, `finrank_dual_piece`, `tateTwist`, `prod_piece`, `latticeConjugation`, `isBaseChange_tateLatticeMap`, `tate_hodgeNumber`, `instModulePadicCharacterContragredient`, `FiniteBilinearModule.orthogonalComplement`, `AbelianVariety`, `SInteger/Unit.lean`, `selmerGroup₂`. Every library name the README cites exists at the pin.

**Cross-roadmap citations resolved** on the current heads (open pull requests read with `roadmaps show`; main and Completed read in the content checkout): IntegralIwasawaTheory §§2.0, 2.1–2.3, 2.7, 10.0–10.3 with `arithmeticPoitouTate`, `arithmeticCompactSupport`, `arithmeticCompactDuality`, `completedArithmeticCoefficients`, `derivedArithmeticTower`, `compactArithmeticShapiro`, `arithmeticLocalMappingFiber`, `arithmeticIwasawaComplex`, `arithmeticIwasawa_shapiroComparison`, `burnsFlachFiniteComplex`, `burnsFlachFinite_perfect`, `burnsFlachComplex`, `burnsFlach_derivedBaseChange`, `classGroupLimit`, `unramifiedModule_classGroupLimit`, `pRamifiedModule_rayLimit`, `globalUnitClosure`, `unitLimit_eq_limit_closures`, `infiniteGlobalLocalSequence` (lines 275–407, 1305–1362); its §10.2 is indeed restricted to cyclotomic towers of finite abelian extensions, as §§3.1, 3.3, 3.8 and 3.10 now say. NoncommutativeAndEquivariantIwasawa §F.4 (lines 1752–1770) with `arithmeticSelmerComplex.changeCondition`, `.h1_exact`, `.duality`, `.control`, `arithmeticIwasawaCochains.shapiro`. PadicLocalLanglandsForGL2Qp §0.3 (lines 274–276) with `DualitySupport.torsionDual`, `exact`, `bidual`, `finiteQuotient`, `traceComparison`, `contragredient`, and its `L/𝔇⁻¹` trace remark. ArithmeticGaloisDuality §§R02.3.0a–c, R02.2.3a, R02.5.1–R02.5.2, R02.4.5, D7.7.1–D7.7.6, D8.1 and every named D7.3/D7.5/D7.6 item and R02.4.4 item (lines 1514–6860); `RestrictedRamification.maxUnramifiedOutside` at line 1862; the four stale names of R02. FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–P5a and R07.3.3a, 3.4, 3.6–3.7, 3.9–3.12, 3.14–3.17 with `IsTorsionCrystalline`, `IsIntegralCrystalline`, `ringS`, `flFunctor_eq_hom`, `dCris`, `dDeRham`, `IsCrystalline`, `IsDeRham` and the `HT = +1` convention (lines 44, 267–269, 1350–1503, 4741–5239). PadicPeriodRings §§1.1–1.5, 2, 3, 4.1–4.3 (headings at lines 95–480). NeronModelsAndSemistableAbelianVarieties §§3.10, 3.13–3.14, 5.3 with `PadicComparison`, `AbelianVariety.deRham` (lines 1720–3248). AbelianSchemesAndArithmeticModuli §§A2.2–A2.3, A3.1, A3.5, A3.7, A4.3, A5.1 and the `a ↦ O([−a] − [0])` convention (lines 280, 1082–2511). PerfectoidTowers §P9.0 and its two named items. HeightsRationalPointsAndObstructions §§1.0a–1.5 and 3.17a–3.17d, which names this roadmap's §2.12a as its supplier (consumer, later in the order: not a finding). SelmerIwasawaCohomologyPartII (line 10) consumes this base and declares no object of it. On main: ProfiniteCohomology Layers 5–7, 9–12 with `cup_coeffMap`, `cup_projection`; ClassFieldTheory Layers 5, 10–13 with `eulerCharacteristic_mixed`, `eulerCharacteristic_finrank_fp`, `globalClassFieldCorrespondence`, `gal_hilbertClassField_equiv_classGroup`; EllipticCurves Layers 2 and 7; LocalFieldsRamification Layers 1, 3, 4; HeightsAndUnits §4.2; PadicMeasuresIwasawaAlgebras §§1.7, 4.1, 4.2, 4.4, 4.6, 5.1, 6.1, 6.3; DerivedModuleAlgebra §§1.T.1 (all three named items) and S.1; SchemeAndStackFoundations §§0.12, 1.1, 2.1, 2.2, 2.11, 2.15, 2.22 with all seven named declarations; Completed LocalGaloisGroups Layers 5 and 7 with `padicCompletionUnits`, `padicCompletionTransition`, `padicCompletionUnitsOf`; Completed ProfiniteProPGroups Layer 9 with `completedGroupAlgebra`, `powerSeriesCoordinate`. Ownership by object was searched in the sibling heads this brief lists and in the main checkout: no second owner of the Kummer-limit, weak-semisimplicity, finite-cotype, Hodge-Gamma or congruent-number objects, and no second declaration of any of the 17 fully qualified names, was found.

**Adversarial table.** One row per statement; “pass” means the displayed instance agrees with the statement as written. Rows marked (new) were not in the previous review's table.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: Tate dual action | `ℤ/7`, `g` = ×2 | contragredient ×4 = 2⁻¹; product 8 ≡ 1 | Pass. |
| Conventions: twist `Tw_k` | `κ(γ)=4` in `ℤ₃`, `k=1` | `φ₁(γx) = 4⁻¹γφ₁(x)`; with `t^k`: `γ(x⊗t) = γx ⊗ 4t` | Pass; scalar 4 fails. |
| Conventions: `det⁻¹` | `Λ —X→ Λ` in degrees 1,2 | `H¹=0`, `H²=Λ/(X)`; signed length `+1`; lattice `(X)` | Pass; degrees 0,1 give `(X)⁻¹`. |
| 0.4 tensor/completion | `ℚ₃`, `p=3`; `ℚ₅`, `p=3` | completions `ℤ₃²`, `ℤ₃`; `a⊗1−1⊗a` with `a∉ℚ` nonzero in `ℚ₃⊗_ℚℚ₃`, killed by multiplication | Pass. |
| 0.5 topology | `K=ℚ₅`, `p=3` | `K^×/(·)^{3^m}` has `3^m` elements, limit `ℤ₃`; `ℚ^×/(·)^2` infinite | Pass. |
| 0.6/0.8 Kummer headline | `K` sep. closed; `ℝ`, `p=2`; `𝔽₇`, `p=3` | `H¹`/completion pairs `0/0`; `ℤ/2` (sign action: `ℤ₂/2`) `/ ℤ/2`; `ℤ₃/(7−1)=ℤ/3` `/ C₆/C₆³=ℤ/3` | Pass; `NeZero (p:K)` excludes char `p`. |
| 0.8 char-`p` control | `𝔽_p(t)` | étale `μ_p = 1`, `H¹=0`; `t` has nontrivial `p`-power class | Excluded correctly. |
| 0.9 S-unit Kummer | `ℚ`, `S={3,∞}`, `p=3` | `ℤ[1/3]^×⊗ℤ₃ = ℤ₃` (from 3; `−1` a cube); `Pic=0` | Pass. |
| 0.10 Mittag-Leffler | `μ₉→μ₃` over `ℚ`, class of 2 | transition onto on `ℚ^×/(·)^9 → ℚ^×/(·)^3` | Pass. |
| 0.11 Kummer/cup (new values) | `L=K`; base `a`, `[L:K]=2` | Shapiro, norm identity; `κ_K(Na)=2κ_K(a)`; `cor(res κ(b)∪res x)=2(κ(b)∪x)=κ(b²)∪x` | Pass (locator R05). |
| 0.12 invariants→coinvariants | `σ=id`; `J₂(1)`; `J₂(2)` over `ℚ` | map ranks 1,0,0; (dim ker, dim coker) = (1,1),(1,1),(0,0) | Pass. |
| 0.13 headline (new proof check) | DVR `O`, free `M`, `N=ker(σ−1)` | `M/N ↪ M` torsion-free so `N` a summand; `N⊗k ↪ ker(σ̄−1)` gives `dim_k ker(σ̄−1) ≥ rank N = dim_K`; with hypothesis, equality; weak semisimplicity of `σ̄` plus Nakayama gives `N + im(σ−1) = M`; rank count gives `N ∩ im = 0` | Pass; statement true in the endomorphism form. |
| 0.13 instances | `ℤ₃`, `σ=1,2,4` | (dim_K, dim_k) invariants (1,1),(0,0),(0,1); bijective yes, yes, no (`0→ℤ/3`) | Pass; `σ=1+p` rejected by the inequality. |
| 2.1–2.2 Selmer datum | `H=k²`, `res(x,y)=y`, `L=0`; `L=k`; no places | kernels `k×0`, `k²`, `k²`; strict ⊆ relaxed | Pass. |
| 2.2 product necessity | `u_m=∏_{j<m}ℓ_j^{p^j}` | limit class has singular valuation `p^j` at every `ℓ_j` | Pass. |
| 2.3/2.4/2.5 | `g:k²→k` first coordinate, `L=k×0` | `g(L)=0`, `g⁻¹(0)=k×0`; adjunction both sides true; `L=k²`: false/false | Pass. |
| 2.6 saturation | `O=ℤ`, `ℤ→ℚ`, `L_V=0`; `2ℤ⊂ℚ` | preimage `0` saturated; `2·1∈2ℤ`, `1∉` | Pass; E-linearity needed. |
| 2.7 unramified | `ℤ/p` trivial over `ℚ_ℓ`; `ℤ` discrete | `Hom(Ẑ,ℤ/p)=ℤ/p=B/(Fr−1)`; `Hom_cts(Ẑ,ℤ)=0 ≠ ℤ` | Pass; torsion needed. |
| 2.8 Greenberg | `F⁺=0,T`; `T=ℤ₃(1)` at 3 | `L^Gr` = unramified, all; for `ℤ₃(1)`: `T^I=0` so unramified part `0`, full `H¹=ℤ₃²` | Pass; two supplied summands agree. |
| 2.8a filtrations | `ℚ_p(n)`, `n=−1,0,1`; `y²=x³−x` at 3 | `Fil¹` = 0,0,`V`; discriminant 64, good supersingular, niveau-two inertia | Pass. |
| 2.9 restricted Selmer | `ℚ`, `p=3`, `Σ={3,19,∞}`, `μ₃` | relaxed `(ℤ/3)²` (3, 19; `−1` cube; `Pic ℤ[1/57]=0`); strict at 3: `19∈1+9ℤ₃` cube, `v₃(3)=1` → line `⟨19⟩`; strict at both: `v₁₉(19)=1` → 0 | Pass. |
| 2.10 duals | `ℤ/7` ×2; `(ℚ₃/ℤ₃)(1)` scalar `u` | dual ×4; dual `u⁻¹` | Pass. |
| 2.11 coranks | `0`, `ℤ/p`, `ℚ_p/ℤ_p`, `(ℚ_p/ℤ_p)²` | compact duals `0, ℤ/p, ℤ_p, ℤ_p²`; coranks 0,0,1,2 | Pass. |
| 2.12 elliptic Selmer | MW `ℤ^r⊕finite`, finite `Ш[p^∞]` | tensor `(ℚ_p/ℤ_p)^r`; corank `r` | Pass. |
| 2.12a headline | `0`, `ℤ/p²`, `ℚ_p/ℤ_p`, `(ℚ_p/ℤ_p)²⊕ℤ/p`, `⊕_ℕ ℤ/p` | `(r,F)=(0,0),(0,ℤ/p²),(1,0),(2,ℤ/p)`; last has infinite `G[p]`, excluded | Pass; `Squarefree`-style junk: `ℤ_p` not torsion, excluded. |
| 2.12a real/complex Kummer | `E(ℝ)` two components, `n=2`; odd `n`; `ℂ` | `E(ℝ)/2=ℤ/2`; `0`; `0` | Pass. |
| 2.13 trace dual | `O=ℤ_p[√p]`, `p` odd | different `(2√p)`, `d⁻¹=(1/(2√p))`, `Tr(1/(2√p))=0`, `Tr(√p/(2√p))=1` | Pass; trace alone not an `O`-dual. |
| 2.14 dimensions | `V=ℚ_p`, `ℚ_p(1)` over `ℚ_ℓ` | `(dim H¹_ur, dim H¹/H¹_ur)=(1,0),(0,1)`; `dim H²=0,1` | Pass. |
| 2.15 bad primes | `𝒲=ℤ/3`, `Fr=1`, `Fr=2` | `(𝒲/(Fr−1), 𝒲^{Fr=1})=(ℤ/3,ℤ/3),(0,0)` | Pass. |
| 2.16 orthogonality | `V=ℚ_p`, `V*=ℚ_p(1)` over `ℚ_ℓ` | `dim H¹_f=1`, `dim H¹_f(V*)=0`, `dim H¹(V)=1` | Pass. |
| 2.17 finite levels | `ℤ/9` evaluation pairing, subgroup `3ℤ/9` | annihilator `3ℤ/9`, sizes `3·3=9` | Pass. |
| 2.18 limits | `T=ℤ_p` trivial, `Σ={p,∞}`, `ℚ` | `S^Σ(W_M)=Hom(G_Σ,ℤ/p^m)` finite; `S^Σ(T)=Hom(G_Σ,ℤ_p)=ℤ_p` | Pass (locator R05). |
| 2.19 Poitou–Tate | `ℚ`, `T=ℤ_p(1)`, `Σ={p,∞}`, `Σ₀=∅`, `W_M=μ_{p^m}` | `S^Σ(W_M)=⟨p⟩≅ℤ/p^m`; `loc^s` onto `H¹_s(ℚ_p)=ℤ/p^m` (valuation); coker 0; `S_∅(ℤ/p^m)/S_Σ=0` | Pass. |
| 2.20 limit form | same, `M→∞` | `S^{Σp}(T)=ℤ_p[p]→H¹_s(ℚ_p,T)=ℤ_p` onto; quotient `S/S_{Σp}=0` | Pass. |
| 2.21 fibre/archimedean | `ℚ`, `S={p,∞}`, `T=𝔽_p`, `p` odd, strict | ordinary `H⁰` map `k→k⊕k` coker `k`; modified `k→k⊕0` onto; `Q_∞[−1]≃k[0]` | Pass. |
| 2.21 dyadic real | `C₂`, `𝔽₂` trivial | Tate `Ĥ^i=𝔽₂` all `i`; `Cone(q_v)` has `H^j=𝔽₂` for `j≤−1`, `0` for `j≥0` | Pass. |
| 2.22 `H⁰` correction | global 0, local `k[0]`, strict | `Sel=0`, fibre `H¹=k`, `J=k` | Pass. |
| 2.23–2.24 | identical conditions; `T′=p⁻¹T` | cone acyclic; `Q=T/pT≠0`, rationally 0 | Pass. |
| 2.25 descent | index 2, `p=3`; `C₃`, `M=ℤ/3` | `cor∘res=2` unit; `H¹(C₃,ℤ/3)=ℤ/3` restricts to 0 | Pass. |
| 2A.1 compact support | strict modified, `ℚ`, `S={2,∞}`, `𝔽₂` | `H^i=𝔽₂` for `i<0` from Tate term; bounded models have none | Pass. |
| 2A.2 function field | `𝔽_q(t)`, `𝔽_p`, `p∤q(q−1)`, unramified | `Sel=Hom(Ẑ,𝔽_p)` dim 1; dual `𝔽_q^×/p=0`; `h⁰=1,0`; local terms `1−1=0`; difference 1 | Pass; over `ℚ` the real term gives 0. |
| 2A.3 tangents | `n=1` trivial, `s` strict places | `H⁰` map `k→k^s`, coker `k^{s−1}` | Pass. |
| 2A.4 trace | `n=1`; `n=0`; char 2, `u=[[1,1],[0,1]]` | `ad⁰=0`; fibre `RΓ(k)[−1]`; invariants dim 2,2; norm images dim 2,1 (`X+uXu=[[c,a+c+d],[0,c]]`); `Ĥ⁰=0`, `k` | Pass; `Matrix.trace_surjective` needs `Nonempty n`. |
| 2A.5 Tor | `ℤ_p→𝔽_p` | `0→H¹/p→H¹(C′)→H²[p]→0` | Pass. |
| 3.0 coordinates | `d=0`; `d=1`; `ℤ₃`, `Δ=C₂`; `Δ=C₃` | `R[Δ]`; `O[[X]]` regular dim 2; idempotents `(1±δ)/2`, product of two; `(1+Y)³−1=3Y+3Y²+Y³∈(3,X,Y)²`, embedding dim 3, not regular | Pass. |
| 3.0 regular sequence | `𝔽_p`, `Γ′=pℤ_p`; `ℤ_p²`, `Γ′=⟨γ₁^{p²}⟩` | `X^p` non-zero-divisor, quotient `𝔽_p[C_p]`; quotient keeps `X₂` and `C_{p²}` | Pass. |
| 3.0 involution/twist | `X=γ−1`; `κ(γ)=u` | `ι(X)=−X+X²−…`; `Tw_κ(X)=u(1+X)−1`; `ι Tw_κ ι(γ)=κ(γ)⁻¹γ` | Pass. |
| 3.1 `H⁰_Iw` | cyclotomic tower, `ℤ_p` trivial; restriction instead | corestriction ×`p`, limit 0; restriction limit `ℚ_p/ℤ_p≠0` | Pass. |
| 3.2 topologies | `ℤ₅`, `Γ=ℤ₅×C₂`; `ℤ_p×C_p` | `J=(5,T)A×(5,T)A`, `∩m₊^n=0×A`; `(δ−1)^p∈pR̄`, `rad^p⊆J⊊rad` | Pass. |
| 3.3/3.10 control | `[Λ—X→Λ]` degrees 1,2 | `H¹_Iw=0`, `H²_Iw[X]=O`, finite-level `H¹=O` | Pass. |
| 3.4 Nakayama | `[Λ—1→Λ]`; `[Λ—X→Λ]` | first acyclic; second specialises to two copies of `k` | Pass. |
| 3.5 universal norms | `ℤ_p`, unramified tower away `p` | norm valuations `p^mℤ_p`, intersection 0 | Pass. |
| 3.6 semilocal | `q` split in `F`, `[F:K]=2`, coefficient `k` | two summands, dim 2 | Pass. |
| 3.7 twist | `k=0,1,−1`, `κ(γ)=4` | scalars 1, 1/4, 4 | Pass. |
| 3.9 local error | `0→O[0]` | error `O[0]` | Pass. |
| 3.11 classical control | `H=0`, `Q=k` | `I=0`, `coker(H→Q)=k` | Pass. |
| 3.12 duality shift | `C=Λ[−1]` | `RHom(C,Λ)[−3]` in degree 2; `H¹`/`H²` paired | Pass. |
| 3.13 Euler ranks | `ℚ`, `ℤ_p`, `ℤ_p(1)`, `p` odd | real minus ranks 0,1; local `ℚ_p` rank 1 | Pass. |
| 3.14 determinant | `H¹=Λ/(a)`, `H²=Λ/(b)` | divisor `(b)/(a)` | Pass (locator R05). |
| 3.15 covers | `ℤ[1/2,i]`; `ℤ[1/2,√3]` | discriminants `−4`, `12`: étale, not étale | Pass. |
| 3.15 `G_m` | `ℚ`, `S={p,∞}`; `r=4` | `ker(ℚ/ℤ⊕½ℤ/ℤ→ℚ/ℤ)=ℤ/2`; `H⁴=ℝ^×/ℝ_{>0}=ℤ/2` | Pass. |
| 3.15 `K(π,1)` | `p=3`, `S={3,∞}`; `p=2`, `ℤ/2`, `r=3` | `ℚ(μ₃)` allowed, `ℚ(i)` not; both sides `ℤ/2` | Pass. |
| 3.15 `j_*` | `Σ={2,7}`, `𝔽₃`; `ℓ≡1 (p)` | `(𝔽₃(−1))^{Fr₂=1}=0` (`2⁻¹≡2≠1`); cubic field in `ℚ(ζ₇)` ramified at 7; degree-`p` subfield of `ℚ(μ_ℓ)` ramified | Pass. |
| 3.15 tower limit | trivial tower, `Σ={7}`, `ℤ₃(1)` | `ℤ₃⟨3⟩→ℤ₃⟨3,7⟩` proper | Pass; hypothesis needed. |
| 3.16 lattices | `ℤ₃`, `3ℤ₃` | both rationalise to `ℚ₃`; quotient `ℤ/3` | Pass. |
| 3.17 exclusions | `θ̄=1`, `ω` | `H⁰` or dual `H⁰` nonzero | Pass. |
| 3.18 pseudo-null | `O[[T₁,T₂]]/(T₁,T₂)≅O` | pseudo-null, infinite; over `O[[T]]` finite | Pass. |
| 3.19/3.20 | `Λ/(λ,T)` | torsion with finite submodule | Pass; hypothesis substantive. |
| 3.21 Fitting | `Λ/(f)`, `Λ/(λ,T)`, `0`; `k[[λ]]`, `k` infinite | `((f),(f))`, `((λ,T),Λ)`, `(Λ,Λ)`; `k` has no finite-cardinality submodule yet fails | Pass; finite residue field needed. |
| 4.7 realization | `p=5`, jump `−1`; `W(k)/5` weight 0; `μ₃` at `ℚ₃` | `ℤ₅(1)`, weights `−1`/supplier `+1`; `ℤ/5` nonzero with zero `B_cris` tensor; `μ₃` not in `[0,0]` | Pass; Breuil needs `K₀` unramified, width `≤p−2`. |
| 4.8 | zero; `ℤ/p^m(1)`; finite `R` | zero group; crystalline in intervals containing `−1`; `R⊗B_cris=0` | Pass. |
| 4.9 Bloch–Kato | `ℚ_p`; `ℚ_p(1)` over `K` | `dim H¹_f=0·[K:ℚ_p]+1=1`; `[K:ℚ_p]·1+0`; unramified quadratic: 2 | Pass. |
| 4.10 preimage | `ℤ_p`, `[0,0]`; `ℤ_p(1)`, `[−1,0]`; `p=2` | unramified line; unit Kummer classes, uniformiser excluded; `p>2` fails | Pass. |
| 4.11 inverse different | `δ=z=1/(2√p)` | `Tr(z)=0`, `Tr(δz)=1/(2p)∉ℤ_p` | Pass. |
| 4.12 | `ℚ_p`, `V⁺=0`; `ℚ_p(1)`, `V⁺=V` | `L_str=0`, `L_f=L_Gr` dim 1; `L_str=L_Gr=H¹` dim 2, `L_f` dim 1 | Pass. |
| 4.13 realization | weight 0, `F∞=±1`; `ℚ_p(n)` | `Γℝ(s)`, `Γℝ(s+1)`; type `(n,n)`, `F∞=(−1)^n`, `Γℝ(s−n)` | Pass. |
| 4.14 real headline | empty list; real shift 0 at `m=0,−1,−2` | product 1, order 0; `Γℝ(s)` orders `−1,0,−1` (poles at `0,−2,…`) | Pass. |
| 4.14 complex headline | complex shift 0 at `m=0,−1`; weight-one pair | orders `−1,−1`; real place `Γℂ(s)`, complex place `Γℂ(s)²` | Pass. |
| 4.14 Deligne recipe (new) | diagonal `H^{a,a}`, `ε=0,1` | eigenvalue `(−1)^a` → shift `−a`; `−(−1)^a` → shift `1−a`; off-diagonal pair once with shift `−a`, `a<b` | Pass; agrees with Deligne 5.3 and the RJW Tate convention. |
| 4.14 totalized Gamma (new) | `Γℝ` at 0 | value 0, `meromorphicOrderAt` `−1` | Pass; statement is about the order. |
| 4.14 record comparison | two real 0, one complex 0 | `Γℝ²Γℂ`, count 3, order `−3` with or without record | Math passes; move per R01. |
| 4.15 criticality | `n=−1,0,1,2`; `−6..6` | orders of `Γℝ(1−n)`,`Γℝ(n)` at 1: (0,0),(0,−1),(−1,0),(0,0); critical set `{−5,−3,−1,2,4,6}` | Pass. |
| 4.16 towers | constant `C₃`; `p=2` | norm limit `C₃` both sides; `1/2∉ℤ₂` | Pass. |
| 4.17 reciprocity | `E=3ℤ₃⊂U=ℤ₃`, `C=0,E` | kernel `U/E=ℤ/3`; `E/U` undefined | Pass. |
| 4.18 Leopoldt | `ℚ`; positive unit rank with zero localisation | defect 0, finite; defect `r₁+r₂−1`, infinite | Pass (duplication R06). |
| 4.19 | norm-compatible units; `Fr` scalar `a` | norms ↦ corestriction; Euler factor `1−a⁻¹` | Pass. |
| 4.20 Tate twists | `n=−1,0,1,2` | `Fil¹=0,0,V,V`; modules `Y⁻,Y⁺,X⁻,X⁺`; dual `X⁺(−2)` | Pass. |
| 4.21 corank | `Δ⁺=1`, `X=O[[T]]`; `Λ/(T)`; `p=5`, `e₊Λ` | corank 1; 0; `(1,0)` with two field factors of `Frac Λ` | Pass. |
| 4.21 ideal predicate | `X=Λ/(f)`, supplied `f`, `pf`, `uf` | true, false, true | Pass. |
| 4.22 twist | `p=3`, `a=γ−1`; `p=5`, `Δ⁺=C₂`, `n=2` | `Tw_{−2}(a)=χ(γ)²γ−1` nonunit; `e₀` moves to the other idempotent | Pass. |
| 4.23 | `[O[[u]]—u→O[[u]]]` at `u=0` | `H¹=H²=O`, generically acyclic | Pass; regulator is input. |
| 4.24–4.25 | `ℚ_p(1)` at `w∤p` | `H⁰(V*(1))=ℚ_p≠0`, uniformiser spans `H¹`; finite preimage killed by `p^{ord_p(q_w−1)}` | Pass; hypotheses necessary. |
| 4.26 elliptic | `Lie E` dim 1; MW rank `r`, `Ш` corank `d` | `dim H¹_f=[K:ℚ_p]`; global dim `r+d` | Pass. |
| 4.27 | trivial `ρ` over `ℚ`, `L=ℚ` | `Hom(Cl_ℚ[p^∞],A)=0`; kernel `H¹(1,A)=0` | Pass. |
| 4.28 Cassels–Tate parity | `(O/ϖ)²` symplectic; `𝒦/O` zero form; `O/ϖ²` | `gr¹` dim 2, `F^∞=0`; `F¹=F^∞` dim 1; `dim N[ϖ]=1` with even length | Pass; perfect alternating needed. |
| 4.28 Euler characteristic (new) | strict ordinary at `p`, unramified at `w∤p`, acyclic archimedean | `χ=Σ_{v∣∞}dim V^{G_v}−[E:ℚ]dim V+Σ_{v∣p}[E_v:ℚ_p](dim V−dim V_v⁺)`; with `dim V^{G_v}=dim V/2` (isotropic eigenspaces of `c`), `χ=(r₁+2r₂−[E:ℚ])dim V/2=0` | Pass. |
| 4.28 cubic twist (new) | `V=𝒦(α⁻¹)⊕𝒦(α)(1)`, `V_p⁺=𝒦(α⁻¹)` | `H⁰(ℚ,V⊗α)=𝒦`; `h⁰(C_α)=(1+#S_f)−#S_f=1`, `h⁰(C_{α⁻¹})=0`; `h¹(C_α)−h¹(C_{α⁻¹})=1` odd | Pass; `H⁰(E′,V)=0` cannot be dropped. |
| 4.29 coboundary | `(X,Y)=(2,4)`, `n=1` | `16=8+8`; class of 2 | Pass. |
| 4.29 local images (Lean headline, computed) | `(2,n)` for `n=1,3,5,7,9,15,2,6,10,14,−1,−5,33,41`; `(3,3),(3,1),(3,2),(5,5),(5,1),(7,7),(13,13),(3,6),(5,10),(7,21),(3,21),(3,−3)` | p-adic search over `X=p^v u`, `|v|≤4`, units mod `p⁴`/`64`: sizes 4,2,2,4,4,4,1,1,1,1,4,2,4,4; 1,2,2,2,2,1,2,1,2,1,1,1; `I₂(1)={1,2,5,10}` | Pass in all 26 cases; `Int.emod` makes `n=−1 ≡ 7`. |
| 4.29 signs | `n` odd: `(−1)σ₂(−1/n)`; `n=2m` | `n≡1,3,5,7 (8)`: `+,+,−,−`; `n≡2,6`: `+,−` | Pass; `n=1,5,6` give even, odd, odd. |
| 4.29 junk | `n=0` | `Squarefree 0` false in `ℤ` | Excluded correctly. |
| 4.29 alternation | `Ш[2^∞]_red=ℤ/2`? | order must be a square: excluded | Pass. |

## Not verifiable

- Liu–Tian–Xiao–Zhang–Zhu was read in its arXiv v3 text; the README cites the Inventiones version of record (pp. 121–131). Theorem numbering agrees; the journal page numbers were not re-verified this round (the previous review read the journal pages).
- Milne's *Arithmetic Duality Theorems* was fetched legally but its locators for §§2.12a, 3.15 and 4.29 were outside the seeded sample and were not checked beyond the existence of the cited pages; Greenberg 1989 (Annals of Math. Studies), Ax 1970, Tate 1967, Silverman, Cassels IV/VIII and Neukirch–Schmidt–Wingberg remain cited by locator only, as before.
- The adversarial table is a computation record on the displayed instances, not a proof of the prose theorems; the arithmetic hypotheses of §4.28's family parity (perfectness, the common generic diagram, (A1), (A2)) are supplier contracts and were checked for consistency, not discharged.

## Source issues

- **Misprint** in rjw at §13.5.2(3), printed p. 71 (rjw line 3995): the source gives `n ≥ 0` for the branch where the condition at `p` is unramified; it should be `n ≤ 0`; affects a stated result.
- **Misprint** in rjw at §13.5.2(3)–(4), printed p. 71 (rjw lines 3998–4007): the source labels the descended Selmer group by `F∞`; it should be labelled by `F = F∞⁺`, the field the section works over; affects a stated result.
- **Misprint** in rjw at Corollary 13.14, proof, printed p. 68 (rjw line 3853): the source identifies the Galois group with `E⁺∞,1/U⁺∞,1`; it should be `U⁺∞,1/E⁺∞,1`, the quotient of the larger module; affects the proof.
- **Misprint** in rjw at Definition 13.12, printed p. 67 (rjw line 3834): the source equates `r₁+r₂−1` with `p^{n−1}(p−1)/2` for `ℚ(μ_{p^n})`; it should be `p^{n−1}(p−1)/2 − 1`; affects a stated result.
- **Error** in rjw at Theorem 13.1 and Definition 13.3, printed p. 65 (rjw lines 3719–3746): the source uses powers of `p` for the elementary factors over `O_L`; it should use a uniformiser of `O_L`; affects a stated result (as recorded in the previous review; re-read this round).
