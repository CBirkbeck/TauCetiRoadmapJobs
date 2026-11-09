# Review of ProfiniteCohomology (pull request #616 at c3ef204)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ProfiniteCohomology/` at `c3ef204`. The folder changed by 459 lines since `3781da8`, and nothing outside it changed. Of the previous review's findings:
- R02, R03, R04, R05, R06, R07 and R08 are repaired (details under Previous findings).
- R01 (pin lag) is not repaired. The reply to the previous review accepts its facts and gives no reason for leaving it, and this round's repairs add 26 more names and 12 more module files that exist only at main's Tau Ceti pin. It is re-raised as R01 below, and it is the only finding.

## R01 (P2) — 65 cited names and 24 cited module files are absent at the branch's Tau Ceti pin; at main's pin two `sorry`s restate proved theorems

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:34`–`:36`: "the headline theorems of the roadmap that the pinned libraries do not yet prove"; `:63`–`:65`: "the norm for the trivial coefficients `𝔽₂` alone (`OpenSubgroup.evensNorm`)"; `:78`–`:83`.
- `README.md:37`–`:38`; `:50`–`:60` (the remaining-target list); `:590`–`:600` (the module list of "From Tau Ceti").

**Claim:** `lake-manifest.json` on this branch pins Tau Ceti `358314d4`; main pins `2fd255d9`. Of the 647 Tau Ceti names the folder cites, 65 have no declaration at `358314d4`, and all 65 exist at `2fd255d9`:
1. the 37 names of the previous round (the class-module package, the Evens package, `delta_conjNormalMap`, the two `coindFunctor_preserves*`, `Subgroup.quotientOpenSubgroup`, `OpenSubgroup.indexTwoDelta_eq_cup_character`, `exact_cup_res_of_index_two`, the 4.3 functors, the 7.2 relative-trace theorems, `delta_cup_left`, `delta_cup_right`), unchanged;
2. 28 names this round added: the 13 `OpenSubgroup.evensNorm*` and `trivialF2Map_*evensNorm*` declarations of 13.2 (`:3741`–`:3763`); `explicitMap0/1/2_explicitRes0/1/2_of_conj` and `res_comp_conjMap` (6, `:1671`–`:1677`); `conjMap_eq_id_of_mem`, `explicitH0Iso_conjMap`, `explicitIso_conjMap`, `explicitIso_conjMap2` (10, `:2545`–`:2553`); `cyclicBockstein_cup`, `cyclicBockstein_two_cup` (8.6); `cyclicTwoCohomPolynomialEquiv` (12); `cyclicEightEquivCyclicFourGraphExtension`, `subsingleton_H2_unitsCoeff_of_finite`, `isZero_continuousCohomology_two_unitsCoeff_of_finite`, `cup_kummerClass_neg_one_neg_one_ne_zero_real`, `exists_squarefree_int_kummerClass`, and the eight `TauCeti.zHat.*` names (`h1EquivRatCircle`, `h2EquivRatCircle`, `subsingleton_continuousCohomology_two_of_divisible`, `signCocycle`, the four `cochainsCor1*`/`explicitCor1*` theorems) of Worked examples (`:3899`–`:3960`).
3. Module files cited at `:590`–`:600` and in the layers with no file at `358314d4`: the seven of the previous round, plus `SmoothDiscrete/Products`, `SmoothDiscrete/Subquotients`, `Bockstein/Leibniz`, `Cup/TrivialF2/CyclicTwo`, `Conjugation/Basic`, `Conjugation/Restriction`, `Conjugation/AllDegrees`, `Conjugation/Comparison`, `Evens/Norm/{Basic,IndexOne,IndexTwo,Naturality,Restriction}`, `GaloisCohomology/FiniteField`, `MuTwo/Real`, `MuTwo/Rational`, `ZHat/{DivisibleCohomology,RationalCharacter,IntegralCohomology,Corestriction}`. At `358314d4`, 2.4's `ContCohomology/Conjugation/Basic.lean` is the single file `Conjugation.lean`.

At `2fd255d9` every one of these resolves, and there `Suggested.lean:309` and `:568` state with `sorry` the conclusions of `TauCeti.abelianizationProPClass_generates` (`ClassModule/Sylow.lean:156`–`:160`) and `TauCeti.galoisEvens_galoisRes` (`GaloisCohomology/EvensNorm.lean:143`–`:147`); the binders and conclusions match the elaborated signatures side by side. So the folder is wrong at either pin: at the branch's pin its citations are to nothing, at main's pin its docstring and its two `sorry`s are false.

**Why the reply does not settle it.** The reply to the previous review says only that the facts are right and that the previous reply's reason was wrong; no reason for not acting is given. The merge is resolved entirely inside this folder: `git merge-tree --write-tree --name-only HEAD origin/main` at `c3ef204` against main `db5e748` again reports exactly two conflicts, `TauCetiRoadmap/ProfiniteCohomology/README.md` and `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`; `lake-manifest.json` merges cleanly. GitHub reports the pull request `CONFLICTING`, so it cannot merge without that merge in any case.

**Witness:**
- Declaration indexes of both pins (every `theorem`/`def`/`abbrev`/`instance`/`structure` line of every `.lean` file): the 65 names are in the `2fd255d9` index and not in the `358314d4` index; the 24 files do not exist under `358314d4`.
- One-tactic probe at the branch pin: `exact TauCeti.abelianizationProPClass_generates Fact.out hG hV` at `:315` fails with "Unknown identifier `TauCeti.abelianizationProPClass_generates`".
- `gh pr view 616`: `mergeable: CONFLICTING`.

**Repair:** Merge `origin/main` into the branch, resolving the two conflicts with this branch's text (if the repair worker cannot make a merge commit, this needs the author or an operator; the repair is not an edit of the folder's text). Then:
- replace the `sorry` at `Suggested.lean:315` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`;
- replace the `sorry` at `:574` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`;
- rewrite `:78`–`:83` so that both are theorems proved by the named Tau Ceti theorems, and `:34`–`:36` so that the file states the two universe theorems as the only `sorry`s;
- keep both names, since `Completed/LocalGaloisGroups/Suggested.lean` and QuadraticFormInvariants read them;
- re-run the gate with the build, expecting `sorry` only at `:275` and `:283`.
No README text changes: every citation of this round already names the declaration and file as they are at `2fd255d9`.

## Previous findings

- **R01 (pin lag): not repaired**, re-raised above with 65 names and 24 files.
- **R02 (1.6, 8.2, 8.3, 8.6, 9.8 planned what the pin proves): repaired.** 1.6 (`README.md:906`–`:916`) names `TauCeti.ContinuousCohomology.map_comp_zeroIso_hom` (`DegreeZero.lean:1` at the branch pin: the file exists there, the theorem is in it) with Mathlib's `TopRep.invariantsResMap` (`Continuous/TopRep.lean:283` at Mathlib `f6090c70`); 8.2 (`:2071`–`:2077`) names `explicitCup_assoc000`–`assoc101` and the `_mul` forms (`Cup/Product.lean:1086` is `explicitCup_assoc110`, stated as the README says, `(x ⌣ y) ⌣ z = x ⌣ (y ⌣ z)` through `explicitCup20`, `explicitCup11`, `explicitCup10`); 8.3 (`:2093`–`:2103`) names `cup11_add_cup11_flip_eq_d1`, `explicitCup11_eq_neg_flip` and `explicitCup11_comm_of_neg_eq_self` and adds three Checks; 8.6 (`:2197`–`:2210`) names `explicitBockstein1`, `explicitBockstein1_eq_explicitCup11_self`, `cyclicBockstein`, `cyclicBockstein_comp_cyclicBockstein`; 9.8 (`:2464`–`:2474`) names `kummerClass`, `kummerCocycleModTwo_apply`, `kummerClass_eq_homClass`, `kummerCharacter`, `kummerSquareClassEquiv`, `kummerCup_comm`. All of these exist at `358314d4` except `cyclicBockstein_cup` and `cyclicBockstein_two_cup` (R01). The modules are added at `:593`–`:597`.
- **R03 (4.3 Check): repaired** at `:1386`–`:1393`: the continuity argument is now the order-`pᵏ` extension, and the discontinuous homomorphism `x ↦ λ(x)/p` with `λ(1) = 0`, `λ(b) = 1` is recorded as the counterexample.
- **R04 (remaining list): repaired.** `:50`–`:60` now lists 11.2, 4.2 (transitions against `finiteLevelTransition`), 6.5, 9.4, 10.1 and 13.2 with its five remaining laws; `:649`–`:650` reads "The remaining work is the list of remaining targets in Scope and ownership". `H²(Ẑ, ℤ) ≅ ℚ/ℤ` is cited as `TauCeti.zHat.h2EquivRatCircle` (`IntegralCohomology.lean:55` at `2fd255d9`, absent at `358314d4`: R01). I checked each remaining target against `2fd255d9`: no file mentions both `explicitFiniteQuotientTransition` and `finiteLevelTransition` (4.2); no `explicitCor1*_of_conj` exists anywhere, and `Corestriction/Conjugation.lean:434` is the degree-two `explicitCor2_explicitMap2_of_conj` only (6.5); nothing in `FieldTheory/` or `ContCohomology/` mentions cofinality (9.4); `FiniteQuotient/Canonical.lean` mentions `explicitFiniteQuotientSystem0_map` only in its docstring at `:71` (10.1); `Evens/Norm/` holds exactly `evensNorm`, `evensNorm_cochainClass`, `evensNorm_zero`, the two index-one theorems, `trivialF2Map_evensNorm`, `trivialF2Map_quotientMkContinuousMonoidHom_evensNorm`, `trivialF2Map_evensNorm_of_surjective`, `evensNorm_trivialF2Map_conjHom`, `evensNorm_eq_graphClass` and `evensNormIndexTwo_eq`, so transitivity, multiplicativity, `N 1 = 1` and the expansion are indeed absent (13.2).
- **R05 ("profinite" wording): repaired** at `:70`–`:73`, `:293`–`:296` and `:1235`–`:1238`.
- **R06 (7.2 hypotheses): repaired** at `:1939`–`:1945`, which matches `Shapiro/Corestriction.lean` at `2fd255d9`: `:44`–`:45` compact and totally disconnected `G`, `V ≤ U` with `[(V.subgroupOf U).FiniteIndex]`; `:84` `omit [TotallyDisconnectedSpace G]` for degree 0; `:118` `[CompactSpace U]`, `:141` `omit` and `(hV : IsOpen (V.subgroupOf U))` for degree 1 (`:144`–`:145`); degree 2 (`:199`–`:200`) with `hV` and no `omit`.
- **R07 (dropped names): repaired** at `:4044`–`:4076`, one line per name. All 18 targets exist at both pins (declaration index), and the three noted differences are right: `cohomologicalDimensionAt_eq_of_not_dvd_index` concludes `cd_p G = cd_p U` (`Basic.lean`, sides exchanged), `cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` takes `(hp : p ≠ 0)`, and `longExact_exact₁/₂/₃` are three theorems.
- **R08 (Milne scope): repaired** at `:2140`–`:2141` and `:4143`–`:4144`; MilneADT line 251 ("When G is finite, there are Tate cohomology groups") governs lines 291–301.

## Verified sound

**Scope and gate.**
- The worktree is clean at `c3ef204`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty.
- My gate run (without the build): every check `0`, `OK`. The worker's run with the targeted build: `build=0`, `OK`.
- `lake env lean` on `Suggested.lean`: exit 0 in 48 s, exactly four `declaration uses sorry` warnings, at `:275`, `:283`, `:309` and `:568`.

**Dependency check:**

```text
depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The only roadmap supplier is `RepresentationTheory/InductionRestriction` on main, cited at `:627`–`:631` for "What Mathlib already has (consume)" and Layer 0, which exist there.

**Signatures and the padding probe.**
- A scratch copy of the file with `#check @` for all 56 declarations elaborates with no error; the file has no `variable` block, so every type carries its own binders. The elaborated types match the README: `abelianizationProPClass_generates` takes `[Fact p.Prime]`, `[CompactSpace G] [TotallyDisconnectedSpace G]`, `scd_p p G ≤ 2`, `[V.Normal]`, `IsOpen ↑V`; `explicitH2IsoContinuousCohomology` takes `[CompactSpace G]` only; `explicitFiniteQuotientComparison2` neither compactness binder; `cohomologicalDimensionAt_universe_eq` only `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`.
- One-tactic probe at the branch pin: `first | rfl | simp | exact rfl` fails on both universe theorems (`rfl` reports the two sides `cohomologicalDimensionAt.{u} p G` and `.{0}` as not definitionally equal; `simp` makes no progress); on `:309` the Tau Ceti term is an unknown identifier at this pin; on `:568` `simp` leaves the goal unsolved. None of the four is padding. The proved one-term aliases (`cup_add_left`, `galoisSubgroup_index`, the `theorem`s wrapping `TauCeti.*`) are the names consumers on main read, as in previous rounds.

**Name audit.** 647 backticked `TauCeti.*`/`OpenSubgroup.*` names, matched against declaration indexes of both pins: 582 resolve at `358314d4`, all 647 at `2fd255d9` (the two the index missed, `TauCeti.IsPPrimaryTorsion.continuousMap` at `Topology/Algebra/Group/Torsion.lean:74` and `TauCeti.IsSmoothDiscrete.resolutionX` at `CompactDiscrete.lean:116`, are declared with dotted names and exist at both pins). The remaining 65 are R01.

**Library declarations opened at the branch pin `358314d4`** (beyond those under Previous findings):
- 0.1: `isOpen_ker_toPermHom`, `openActionKernel_smul_eq_self`, `iSup_fixedPoints_openNormal_eq_top` in `Topology/Algebra/GroupAction/Discrete.lean`.
- 1.2: `IsSmoothDiscrete.res` (`SmoothDiscrete/Basic.lean:287`), `not_isSmoothDiscrete_ofDiscreteModule_units_zmod`; `IsSmoothDiscrete.pi` is `SmoothDiscrete/Products.lean:33` at `2fd255d9` only, and `.subrepresentation`/`.quotient` are `Subquotients.lean:30`, `:38` there (R01).
- 1.3: `ofDiscreteModuleHomAddEquiv`, `discreteRepEquivSmoothTopRep`.
- 1.5: `resNatTrans` (`Functoriality.lean:247`, `continuousCohomologyFunctor R G n ⟶ TopRep.resFunctor S.subtype ⋙ continuousCohomologyFunctor R S n`) and `inflNatTrans` (`:391`, `quotientToInvariantsFunctor R G N ⋙ F_(G ⧸ N) ⟶ F_G`), `TopRep.quotientToInvariantsFunctor` (`Continuous/Invariants.lean:301`), exactly as 1.5 states them.
- 2.1: `B1_eq_bot_of_smul_eq_self` (`LowDegree.lean:215`), `H1EquivOfSmulEqSelf` (`:953`, to `Additive (ContinuousMonoidHom G (Multiplicative M))`), `H0_eq_top_of_smul_eq_self` (`:324`).
- 2.4: `explicitConj1` (`Conjugation.lean:141`), `inverseConjugationHomotopy2_spec` (`:207`), `explicitConj1_eq_id_of_mem` (`:299`).
- 4.1: `finiteLevelTransition` (`FiniteQuotient/Basic.lean:223`, on `groupCohomology (A.quotientToInvariants U) n` for `A : Rep k G`, induced by `transitionPair`), `finiteLevelTransition_naturality` (`:300`), `finiteQuotientSystemFunctor : Rep k G ⥤ ((OpenNormalSubgroup G)ᵒᵖ ⥤ ModuleCat k)` (`:364`).
- 4.2: `explicitH0IsoGroupCohomology` (`GroupCohomologyIso.lean:214`) under `variable (G : Type)` (`:95`, `:137`): the three are indeed the only `Type 0` declarations.
- 5.1, 5.3: `C1_map_incl_eq_inf_ker`, `C2_map_proj_eq_C2`, `explicitDelta0_naturality`, `explicitDelta1_coeffMap`.
- 5.2: `structure DiscreteShortExact` (`ShortExact.lean:165`) over `[Monoid G]` with fields `incl`, `proj`, `incl_equivariant`, `proj_equivariant`, exactness in the middle, no continuity field, as 5.2 says.
- 6.4: `explicitCor1_mackey` (`Mackey/Basic.lean:321`): `res_V (cor_U x) = ∑ D, explicitMackeyTerm1 (r D) x` over `DoubleCoset.Quotient V U` with representatives `r`, `[U.FiniteIndex]`, `V` any subgroup.
- 7.3: `inducedShapiroIso [TotallyDisconnectedSpace G]` (`Shapiro/Induced.lean:86`), `topologicalIndCoindIso` (`Coinduced/Induced.lean:158`).
- 8.4, 8.5: `explicitRes2_explicitCup11`, `explicitInfl2_explicitCup20`, `explicitCoeff2_explicitCup11`, and `explicitDelta1_explicitCup10_right` (`Cup/ConnectingMap.lean:268`): `δ¹(x ⌣ y) = −(x ⌣ δ⁰ y)`, the sign `(−1)^1` as 8.5 says.
- 9.6: `kummerShortExact` (`Coefficients.lean:247`) with `incl := kummerCoeffIncl`, `proj := unitsCoeffPow`; `kummerIsoTransport`, `kummerMapCanonical`, `explicitIso_kummerMap`, `kummerIso_norm`.
- 10.4: `shapiroMap` (`Shapiro/AllDegrees.lean:134`) and `isIso_shapiroMap` (`:208`) under `[CompactSpace G] [TotallyDisconnectedSpace G]` (`:115`, `:199`), `hU : IsClosed U`, discrete `A`; `dimensionShiftIso`, `transIsoBot`, `restrictScalarsIntIso`.
- 11.4, 11.5, 11.7: `cohomologicalDimensionAt_le_iff_boundedExponent` (any universe `v`), `_le_iff_forall_finite_subsingleton_succ (hp : p ≠ 0)`, `_le_iff_forall_isIrreducible [Fact p.Prime] [CompactSpace G]` (`Simple.lean`), `subsingleton_continuousCohomology_of_forall_isIrreducible [LocallyCompactSpace G]` (`Simple.lean:64`); `cohomologicalDimensionAt_le_of_isClosed` and `strictCohomologicalDimensionAt_le_of_isClosed` under `[CompactSpace G] [TotallyDisconnectedSpace G]` (`ClosedSubgroup.lean:63`); `_eq_of_not_dvd_index (hp : p.Prime) (U : OpenSubgroup G)`; `_le_strictCohomologicalDimensionAt [CompactSpace G]`; `strict_le_cd_add_one`; `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup (hp : p.Prime)` with trivial `ULift ℤ` (`IntegralCriterion.lean`).
- 11.8: `corestriction_ker_primaryComponent_of_strictCohomologicalDimensionAt_le` (`CohomologicalDimension/Corestriction.lean:378`), `explicitH2CyclicEquiv_mk`, `zmodChar_eq_one_of_transfer_eq_one`, `abelianizationProPInfl2_class`, `abelianizationProPTransferLe_range`, `abelianizationProPClass_generates_of_card_eq_prime`; the Sylow endpoint is R01.
- Mathlib `f6090c70`: `TopRep.invariantsResMap` (`Continuous/TopRep.lean:283`); `Subgroup.subgroupOfContinuousMulEquivOfLe` (`Topology/Algebra/IsUniformGroup/DiscreteSubgroup.lean`).

**At `2fd255d9`:** `OpenSubgroup.evensNorm` (`Evens/Norm/Basic.lean:55`) is defined for `U : OpenSubgroup G` with `[U.toSubgroup.FiniteIndex] [CompactSpace U.toSubgroup] [Fintype (G ⧸ U)]` over any topological group, landing in degree `Fintype.card (G ⧸ U) * n`, as 13.2 says; `evensNorm_zero` and `evensNorm_cochainClass` are `:73` and `:62`.

**Consumers.** The worker's targeted build compiled ClassFieldTheory and QuadraticFormInvariants against this head.

**Overlaps and ownership.**
- `scratch/overlaps.md`: no cited id dropped, none defined only by an open revision, none of this roadmap's dropped and cited elsewhere. #1187 (bump Tau Ceti to `ab00ba392`) is the conflicting head; it is `OPEN` and itself `CONFLICTING`, its pin is older than main's `2fd255d9`, and its order with this branch was stated in an earlier reply; nothing in this round changes that.
- ProfiniteCohomologyPartII (#1839): its README mentions the Evens norm only in its summary of this roadmap (`:25`) and owns neither the general norm, the universe comparison, nor the 4.2, 6.5, 9.4 and 10.1 targets. No second owner found.

**Sources.** MilneADT (sources cache): line 251 (finite `G`, Tate groups), lines 291–301 ((0.1.1)–(0.1.6)), line 445 (Remark 0.10), line 449 (Remark 0.11, `M_*`), line 542 (Prop. 0.15). All match 7.1, 2.4 and the repaired 8.4 and References.

**Seeded sample.**
- **1.5:** the two natural transformations and `quotientToInvariantsFunctor` exist with the stated shapes; the Checks recompute (table).
- **2.1:** the trivial-action characterizations exist; the three Checks recompute (table).
- **4.1:** the six milestones and the functor in `M` resolve; `finiteLevelTransition` is on Mathlib's discrete `groupCohomology`, as 4.2 says.
- **5.2:** the structure matches the prose; the Checks recompute (table).
- **6.4:** `explicitCor1_mackey` matches the displayed formula; the `S₃` check recomputes (table). NSW (1.5.6) is not readable.
- **7.2:** hypotheses match `Shapiro/Corestriction.lean` at `2fd255d9` (R06 repaired); the file is absent at the branch pin (R01). NSW (1.6.4), Ribes–Zalesskii 6.10.5, Koch 3.9 not readable.
- **7.3:** `inducedShapiroIso` carries `[TotallyDisconnectedSpace G]` as "for profinite `G`" says; `Rep.indCoindIso` is Mathlib's.
- **8.2:** the ten shapes exist on cochains; `(0,1,1)` recomputes (table). Brown V (3.5) not readable.
- **8.4:** the four families exist; the projection formula recomputes (table). NSW (1.5.3), Brown V (3.8) not readable; Milne (0.1.6) now scoped to finite `G`.
- **8.5:** the six lemmas exist; the sign at `(1,0)` is `−1` as stated (table).
- **9.6:** the eight constructions exist with `incl`/`proj` pinned; the Checks recompute (table). NSW (6.2.1)–(6.2.2) uncertified.
- **10.4:** `shapiroMap`, `isIso_shapiroMap`, `dimensionShiftIso` exist under the stated hypotheses; the three Checks recompute (table). NSW (1.6.4), (1.3.7) uncertified.
- **11.4:** the three reductions exist with the stated hypotheses (`p ≠ 0`; `[Fact p.Prime] [CompactSpace G]`; local compactness for the fixed-degree step); the Checks recompute (table).
- **11.5:** the four theorems exist; the `⊤ + 1 = ⊤` case holds in `ℕ∞` (table).
- **11.8:** the four Checks and the five sub-milestones recompute (table); the endpoint theorem is proved at `2fd255d9` only (R01).

**Headline theorems.**
1. Comparisons (3), finite-quotient colimit (4, 10.1), long exact and five-term sequences (5, 10.3), Shapiro and dimension shifting (10.4), all-degree corestriction and Mackey (10.5), graded cup (12), Hilbert 90 and Kummer (9): proved at the pin and cited.
2. Universe independence (11.2): stated at `:275` and `:283`; not padding.
3. NSW (3.6.4) (11.8): stated at `:309`; proved at `2fd255d9` only (R01).
4. Evens identity 5 for `L/K` (13.3): stated at `:568`; proved at `2fd255d9` only (R01).
5. The general Evens norm (13.2): not statable; the docstring at `:58`–`:66` says why, and `OpenSubgroup.evensNorm` at `2fd255d9` is `𝔽₂`-only, so stating its laws would be a stand-in. Correct.

No statable headline is absent.

**Adversarial table** (values computed here):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 openness | sign `C₂` on `𝔽₃`; trivial `ℤ_p` on `𝔽_p` | `Stab(1) = {1}` vs `C₂`; `M^{C₂} = 0`, `M^{1} = 𝔽₃`; kernel `ℤ_p`, quotient of order 1 | consistent | none |
| 1.5 named instances | `C₂ → C₄` inflation of the nonzero `𝔽₂` character; `×2` on `ℤ` in degree 0 | parity values `0,1,0,1`; `1 ↦ 2`, zero map `1 ↦ 0` | consistent | none |
| 2.1 complex | `G = 1`, any `M`; sign `ℤ` on `C₂`; `ℤ_p` with `ℤ/pᵏ`, `ℤ`, discrete `ℚ` | `d⁰ = 0`, `d¹ = id`, `d² = 0`, `H⁰ = M`, `H¹ = H² = 0`; `d⁰(1)(s) = −2`, `B¹ = 2ℤ`, `H¹ = ℤ/2`; `#H¹ = pᵏ` (1 at `k = 0`), `H¹(ℤ_p, ℤ) = 0` (elements divisible by all `q ≠ p`), continuous `H¹(ℤ_p, ℚ) = 0`, abstract `≠ 0` | consistent | none |
| 3.2 degrees 1, 2 | `⊕ℕ 𝔽₂ ⊂ ∏ℕ 𝔽₂`; `ℚ_p` | continuous characters `⊕ℕ 𝔽₂` vs all characters `∏ℕ 𝔽₂`; `ℚ_p` locally compact, not compact | consistent | none |
| 4.1 system | `C₂`, trivial `𝔽₂`, degree 1 at `U = G, 1`; sign `𝔽₃` | `0 → 𝔽₂`; invariants `0, 𝔽₃` | consistent | none |
| 4.2 transitions target | `G : Type 0` | `finiteLevelTransition` lives on `groupCohomology (A.quotientToInvariants U)`, the comparisons on `Rep.ofDistribMulAction ℤ (G ⧸ U) M^U`; no file at `2fd255d9` mentions both | target is open | none |
| 4.3 coefficient colimits | `ℤ_p`, `colim p⁻ᵏℤ_p/ℤ_p`; `⊕ℕ ℤ` | `H¹ = ℤ/pᵏ`, colimit `ℚ_p/ℤ_p`; `f(1) = 0`, `f(b) = 1/p` for `x ↦ λ(x)/p`; `(ℤ/pᵏ)^ℕ` has colimit the bounded sequences `≠ (ℚ_p/ℤ_p)^ℕ` | consistent | none |
| 5.2 data | `ℤ →×2 ℤ → ℤ/2`; `×4` | kernel `2ℤ` = image `2ℤ`, quotient of order 2; image `4ℤ ≠ 2ℤ` | consistent | none |
| 5.5 transgression | `C₂ ⊂ C₄`, `𝔽₂`; `C₃ ⊂ C₉`, lift `f(i) = ⌊i/3⌋` | res of parity `= 0`, `tg` injective `𝔽₂ → H²(C₂) = 𝔽₂`; `d¹f(2,1) = 0 − 1 + 0 = −1 = 2`, minus the carry cocycle | consistent | none |
| 6.3 `cor ∘ res` | `C₂ ⊇ 1`, sign `ℤ`, `f(s) = a` | left `0`, right `2a − 2a = 0`; with `−d⁰c` it would be `4a` | sign pinned | none |
| 6.4 Mackey | `S₃`, `U = V = ⟨(12)⟩`, `H⁰(ℤ)` | double cosets of sizes 2, 4; Mackey subgroups `V`, `1`; `1 + 2 = 3 = (G:U)`; single cosets would give 3 summands | consistent | none |
| 6.5 conjugation/corestriction | `S₃`, `U = ⟨(12)⟩`, `V = ⟨(23)⟩`, degree 2, `𝔽₂` | `res ∘ cor = x + cor_1^{C₂} res_1 x = x ≠ 0` on `H²(C₂) = 𝔽₂`, so `cor x ≠ 0` and `res` returns `x` | consistent | none |
| 7.1 coinduced action | `S₃`, `H = 1` | `(a • (b • f))(x) = f(xab)`; the alternative gives `f(bax)` | consistent | none |
| 7.2 Shapiro–corestriction binders | `Shapiro/Corestriction.lean` at `2fd255d9` | degree 0: compact `G`; 1: `+ CompactSpace U`, `V` open in `U`; 2: `+ TotallyDisconnectedSpace G` | matches README | R01 (file absent at branch pin) |
| 7.4 dimension shift at `i = 0` | `C₂`, sign `ℤ` | unit `m ↦ (m, −m)`, quotient trivial `ℤ`, invariants `(a,a) ↦ 2ℤ`, cokernel `ℤ/2 = H¹(C₂, ℤ_sign)`, while `H⁰(quotient) = ℤ` | iso false at `i = 0`, cokernel right | none |
| 8.2 associativity `(0,1,1)` | `C₂`, `𝔽₂` ring, `x = 1`, `y = z = χ` | both sides `(g,h) ↦ χ(g)χ(h)`, `= 1` at `(s,s)` | holds on cochains | none |
| 8.3 homotopy | general cocycles `a, b`; `C₂ × C₂`, `𝔽₂`; sign `𝔽₃` on `C₂`; `C₃`, `𝔽₃` | `d¹(−μ(a g)(b g)) = (a ⌣ b) + (b ⌣_{μᵒᵖ} a)` by the cocycle laws and equivariance; `(x⌣y)(a,b) = 1`, `(y⌣x)(a,b) = 0`, `d¹c(a,b) = 1`; `(m⌣b)(s) = 1`, `(b⌣_{μᵒᵖ}m)(s) = 2`; `χ⌣χ = d¹(χ²)` since `−2 = 1` in `𝔽₃` | consistent | none |
| 8.4 projection formula | `C₂ ⊇ 1`, `(0,0)`, `ℤ` | `cor(res a · b) = 2ab = a · cor b` | consistent | none |
| 8.5 signs | `(p,q) = (1,0)`, second variable | `δ¹(x ⌣ y) = −(x ⌣ δ⁰ y)` at `Cup/ConnectingMap.lean:268`, `(−1)^p` with `p = 1` | consistent | none |
| 8.6 Bockstein | `C₂`, `𝔽₂`, lift `c(s) = 1` in `ℤ/4` | `dc(s,s) = 2 ↦ 1 = χ²(s,s)`; `β(χ²) = 0`; `β(1) = 0` | consistent | none |
| 9.6 Kummer | `ℝ`, `n = 2`; `ℂ`; `𝔽₃`, `n = 2`; `n = 1` | classes of `±1`, cocycle of `−1` sends conjugation to `−1`; both sides trivial; `𝔽₃ˣ/(𝔽₃ˣ)² = ℤ/2`; order 1 | consistent | none |
| 10.2 filtered colimits | `⊕ℕ ℤ`; `ℤ_p` | `(p⁻ᵏ)_k` of unbounded order not in the colimit; `colim ℤ/pᵏ = ℚ_p/ℤ_p` | consistent | none |
| 10.4 shifts | sign `ℤ` on `C₂`, `i = 1, 2` | `H²(ℤ_sign) = 0 ≅ H¹(ℤ) = 0`; `H³(ℤ_sign) = ℤ/2 ≅ H²(ℤ) = ℤ/2` | consistent | none |
| 11.1 invariants | `G = 1`, `ℤ_p`, `C_p` | `0, 0`; `cd_p = 1`, `scd_p = 2` (`H²(ℤ_p, ℤ)(p) = ℚ_p/ℤ_p`); `⊤`, `⊤ + 1 = ⊤` | consistent | none |
| 11.2 universe equality (headline) | `G = 1`, `ℤ_p`, `C_p`; `u = 0` | `0 = 0`, `1 = 1`, `⊤ = ⊤`; `rfl` fails for general `u` | true, not padding | none |
| 11.4 simple modules | `𝔽_p²`; `ℤ/p²`; sign `𝔽₃` inflated to `C₄` | proper line `⟨(1,0)⟩`; proper `pℤ/p²`; submodules `{0, 𝔽₃}` before and after inflation | consistent | none |
| 11.5 inequalities | `ℤ_p`; `C_p`; `U = ⟨σ²⟩ ≤ C₄`, `p = 3` | `1 ≤ 2 ≤ 2`; `⊤ ≤ ⊤ ≤ ⊤ + 1 = ⊤`; index 2 prime to 3 and `cd_3 C₂ = 0 = cd_3 C₄` | consistent | none |
| 11.7 strict criterion | `ℤ_p`, `n = 1, 2`; `C_p` | `n = 1`: both sides false; `n = 2`: `H³(p^rℤ_p, ℤ) = 0`, both true; `C_p`: both false | iff holds | none |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p`, `p = 2, 3`; `V = G`; `ℤ_p × C_ℓ ⊇ ℤ_p`; `C_p ⊇ 1` | `H¹ = 0`, `#H² = p = p^{v_p(p)}`, carry class `p`; `1 = p^{v_p(1)}`; `1 = p^{v_p(ℓ)}`; `0 ≠ p`, excluded by `scd_p = ⊤` | hypotheses exact | R01 |
| 11.8 transfer | `ℤ_p ⊇ pℤ_p`; `W = pℤ_p ⊇ V = p²ℤ_p` | `Ver(1) = p`, `Ver(p) = p²`; `u_{G/V} = p²` of order `p²` in `p²ℤ_p/p⁴ℤ_p`, `i(u_{G/W}) = p·p² = p³` of order `p` | consistent | none |
| 12 `δ`-sign | `(m,n) = (2,1), (1,2)`; `(m,0)` with the unit | `mn + (m+1)n ≡ n`: `−1` at `(2,1)`, `+1` at `(1,2)`; `δx ⌣ 1 = δx` | convention pinned | none |
| 13.1 index two | `C₄ ⊇ ⟨σ²⟩`; `S₃ ⊇ C₂`; `C₂ ≀ C₂` | `b₁ = 0,1,1,0`; `res` and `cor` both onto in degree 1 for index 3; `res χ_U = 0`, `χ_U² ≠ 0` | consistent | none |
| 13.2 general norm (not statable) | `C₃ × C₂ ⊇ C₃`, `𝔽₃`; index one | `res N(a) = a² ≠ 0`; `N(2a) = N(2)N(a) = 4N(a) = N(a) ≠ 2N(a)`; `res(1 + cor a + Na) = 1 + 2a + a² = (1+a)²`; `N_G^G = id` | consistent | none |
| 13.2 `evensNorm` at `2fd255d9` | `U : OpenSubgroup G`, `[CompactSpace U]`, `[FiniteIndex]` | target degree `card (G ⧸ U) * n`; laws present: index one, naturality, single double coset, index-two agreement; absent: transitivity, multiplicativity, unit, expansion | README list exact | none |
| 13.3 `N(res y) = y² + χy` (headline) | `ℂ/ℝ`, `y = 0`; `𝔽₉/𝔽₃` | `N(0) = 0`; `H²(Ẑ, 𝔽₂) = 0` both sides | identity holds | R01 |

## Not verifiable

- **NSW** and **Serre, *Galois Cohomology***: settled as `uncertified`; cited by locator, not requested. The sample's NSW locators (1.2.5), (1.5.1), (1.5.6), (1.6.4), (1.3.7), (3.3.2)–(3.3.5), (3.6.1)–(3.6.4), (6.2.1)–(6.2.2) and Serre I §2.2 Prop. 8 are unverified against the text; their content was checked on the instances in the table.
- **Ribes–Zalesskii, Koch, Serre *Local Fields*, Brown**: Springer texts not in the sources cache, no legal copy found in earlier rounds; Thm. 6.10.5, Cor. 6.5.6(a), 7.9.6–7.9.7, Koch Thms. 3.9, 3.10, 3.16, Brown V (3.5), (3.6), (3.8) are unverified.
- **Evens 1963, Kahn 1984, Kozlowski 1984**: not in this round's sample; Evens was verified in the previous round from the AMS backfile; Kahn has no legal copy.
- **Main's pin:** the brief's Lean commands run only in this worktree, at `358314d4`. R01's two repair terms are justified by the elaborated signatures at the branch pin against the `2fd255d9` statements read side by side; I did not elaborate them there.

## Source issues

- none
