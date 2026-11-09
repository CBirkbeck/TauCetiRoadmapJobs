# Review of ProfiniteCohomology (pull request #616 at 3781da8)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ProfiniteCohomology/` at `3781da8`. The folder changed by 339 lines since `fc1a80a`, and nothing outside it changed. Of the previous findings:
- R02, R04, R05 and R06 are repaired.
- R03 is repaired in 3.2 but stale elsewhere; that remainder is R05 below.
- R01 (pin lag) is not repaired. The reply's reason for leaving it does not hold, so it is re-raised as R01 below. It is now larger, because several of this round's new citations exist only at main's Tau Ceti pin.

The full pass finds the same defect as the previous R02 in four further sections, one of them sampled (R02 below). It also adds six P3 findings.

## R01 (P2) — 37 cited names are absent at the branch's Tau Ceti pin, and at main's pin two `sorry`s restate proved theorems

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:34`–`:36`: "states … the headline theorems of the roadmap that the pinned libraries do not yet prove". The same claim recurs at `:44`–`:51` and `:78`–`:83`.
- `README.md:37`–`:38`: "it states the headline theorems that the pinned libraries do not yet prove (Layer 11's universe independence …)". Also `:629`–`:630`.

**Claim:** `lake-manifest.json` on this branch still pins Tau Ceti `358314d4`. At that pin, 37 names that the folder cites as existing have no declaration. All 37 exist at main's pin `2fd255d9`.
1. **The 22 names of the previous round, plus one it missed** (`Subgroup.quotientSubgroupOfEquivMap`, `README.md:3078`):
   - the class-module package (`TauCeti.abelianizationProPClass_generates` and eight companions, `:2953`–`:3133`);
   - the Evens package (`TauCeti.galoisEvens_galoisRes`, `galoisEvens_add`, `galoisRes_galoisEvens`, `galoisEvens_embedding_independent`, and the three `evensNormIndexTwo_*` identities, `:225`, `:3408`–`:3410`);
   - `DiscreteShortExact.delta_conjNormalMap` (`:3037`);
   - `TauCeti.coindFunctor_preservesMonomorphisms` and `coindFunctor_preservesEpimorphisms` (`:1770`);
   - `Subgroup.quotientOpenSubgroup` (`:611`), and `OpenSubgroup.indexTwoDelta_eq_cup_character` and `OpenSubgroup.exact_cup_res_of_index_two` (`:3434`–`:3435`).
2. **Fourteen names this repair added:**
   - 4.3 (`:1298`–`:1307`): `TauCeti.ContCohomology.explicitH0Functor`, `explicitH1Functor`, `explicitH2Functor`, `explicitH0FunctorIsoContinuousCohomology`, the three `explicitH*Functor_preservesFilteredColimits`, and `TauCeti.SmoothDiscreteTopRep.isColimitContinuousCohomologyFGSubrepresentationCocone`;
   - 7.2 (`:1836`–`:1845`): `explicitShapiro0_relativeTrace_corestriction`, `explicitShapiroMap1/2_relativeTrace_corestriction` and `TauCeti.DiscreteCoind.relativeTrace`;
   - Layer 12 (`:3323`–`:3326`): `DiscreteShortExact.delta_cup_left` and `delta_cup_right`.
3. **Seven module paths with no file at the branch pin** (`:583`–`:590`): `Shapiro/Corestriction`, `Coefficients/FilteredColimits`, `Coefficients/FinitelyGenerated`, `Cup/ConnectingMap/AllDegrees`, `ClassModule/PGroup`, `ClassModule/CoprimeRestriction` and `ClassModule/Sylow`.

At main's pin all of these resolve. There, though, `Suggested.lean:308` and `:567` state with `sorry` the conclusions of `TauCeti.abelianizationProPClass_generates` (`ClassModule/Sylow.lean:156`) and `TauCeti.galoisEvens_galoisRes` (`GaloisCohomology/EvensNorm.lean:143`). The binders and conclusions match side by side. This contradicts `:34`–`:36` and `README.md:37`–`:38`. So the folder is wrong at either pin.

**Why the reply's reason fails.** The reply says the merge of `origin/main` "rewrites `lake-manifest.json` and resolves conflicts in ten other roadmap folders, so it is made on the branch as a whole and not by an edit of this folder." That is not what the merge does:
- `git merge-tree --write-tree --name-only HEAD origin/main` reports exactly two conflicts, `TauCetiRoadmap/ProfiniteCohomology/README.md` and `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`.
- `lake-manifest.json` merges cleanly, because the branch never changed it.
- The ten-folder conflict is with #1187, a different pull request, not with main.

So the merge is resolved entirely inside this folder. It is also the only way to clear GitHub's `mergeable: CONFLICTING` on this pull request.

**Witness:**
- A declaration index of Tau Ceti `358314d4` contains none of the 37 names; the index of `2fd255d9` contains all of them.
- `ContCohomology/CohomologicalDimension/ClassModule/` at `358314d4` holds only `Basic`, `ChangeOfGroup`, `Cyclic`, `Inflation` and `Transfer`.
- All 26 `TauCeti.*` imports of `Suggested.lean` exist at `2fd255d9`.

**Repair:** Merge `origin/main` into the branch and resolve the two conflicts with this branch's text. Then:
- replace the `sorry` at `Suggested.lean:314` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`;
- replace the `sorry` at `:573` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`;
- rewrite `:78`–`:83` so that both are "theorems proved by" the Tau Ceti theorems;
- keep both names, since `Completed/LocalGaloisGroups/Suggested.lean` and Quadratic Form Invariants read them;
- re-run the gate with the build, expecting `sorry` only at `:274` and `:282`.

## R02 (P2) — 1.6, 8.2, 8.3 and 8.6 plan as uncited prose targets results the branch's own pin proves

**Location:**
- 1.6, `README.md:873`–`:875`: "`map φ f 0` commutes with `ContinuousCohomology.zeroIso` and the induced map on invariants".
- 8.2, `:1971`–`:1982`; 8.3, `:1988`–`:1993`; 8.6, `:2057`–`:2060`: "Build it once … with `β ∘ β = 0` and `β (x ⌣ y) = β x ⌣ y + x ⌣ β y`".
- 9.8, `:2297`–`:2302`, has the same defect.

**Claim:** These sections are written as work to do, and they cite no declaration. By `:629`–`:630` ("Unqualified prose targets … are the remaining work"), they are remaining work, yet the remaining-target list at `:50`–`:58` omits them. Tau Ceti `358314d4` already proves them, and `README.md` names none of the declarations below; a search for each name finds no match. This is the defect the previous R02 repaired in other sections, contrary to `:57`: "a qualified Mathlib or Tau Ceti declaration is consumed …, not replanned".

**Witness:** At `358314d4`, under `ContCohomology/` unless stated:
- 1.6: `DegreeZero.lean:131`, `TauCeti.ContinuousCohomology.map_comp_zeroIso_hom`. Its docstring states exactly 1.6.
- 8.2: `Cup/Product.lean:854`–`:1235`, `explicitCup_assoc000`, …, `explicitCup_assoc101`, the ten shapes 8.2 lists, and their `_mul` forms.
- 8.3: `Cup/Product.lean:642`, `explicitCup00_comm`; the cochain-level `(0,1)` case; `cup11_add_cup11_flip_mem_B2`; `explicitCup11_eq_neg_flip`; `explicitCup11_comm_of_neg_eq_self` (`:805`).
- 8.6:
  - `Bockstein/Basic.lean:92`, `explicitBockstein1`, and `:135`, `explicitBockstein1_eq_explicitCup11_self`;
  - `Bockstein/AllDegrees.lean:114`, `cyclicBockstein`, and `:174`, `cyclicBockstein_comp_cyclicBockstein`;
  - the derivation rule is `cyclicBockstein_cup` (`Bockstein/Leibniz.lean:398`), at `2fd255d9` only.
- 9.8: `FieldTheory/GaloisCohomology/MuTwo/KummerCharacter.lean:145` (`TauCeti.kummerCharacter`) and `:169` (`TauCeti.kummerClass_eq_homClass`), with the cup forms in `MuTwo/Cup.lean`.

**Repair:**
- In each of the five sections, replace the target wording with "Tau Ceti has the theorem as …", naming the declarations above and their files, as 10.6 already does.
- Add `DegreeZero`, `Bockstein/Basic`, `Bockstein/AllDegrees` and `MuTwo/KummerCharacter` to "From Tau Ceti" (`:568`–`:590`). Add `Bockstein/Leibniz` too once R01's merge is made; until then, list 8.6's derivation rule at `:50`–`:58`.
- The declarations then also serve as the locators that 1.6 and 8.6 now lack.
- Test of the repair: every section that still reads as a target is either named at `:50`–`:58`, or has no declaration at the pin.

## R03 (P3) — 4.3's first Check rests on a false claim about abelian homomorphisms

**Location:** `README.md:1317`–`:1318`: "every homomorphism `ℤ_p → ℚ_p/ℤ_p` being continuous because its image of `1` has finite order".

**Claim:** Not every homomorphism `ℤ_p → ℚ_p/ℤ_p` is continuous. The roadmap's own Worked example at `:3681`–`:3683` makes the same distinction for `ℚ`. The value `H¹(ℤ_p, ℚ_p/ℤ_p) = ℚ_p/ℤ_p` is right; the stated reason is wrong.

**Witness:** Choose `b ∈ ℤ_p ∖ ℚ` and a ℚ-basis of `ℚ_p` containing `1` and `b`. Let `λ` be the coordinate at `b`, and let `f(x) = λ(x)/p mod ℤ_p`. Then `f(1) = 0` but `f(b) = 1/p ≠ 0`. A continuous `f` with `f(1) = 0` vanishes on the dense `ℤ`, and hence everywhere.

**Repair:** Replace the clause with: "every `x ∈ ℚ_p/ℤ_p` has order some `pᵏ`, so `1 ↦ x` extends to the continuous homomorphism `ℤ_p → ℤ_p/pᵏℤ_p → ℚ_p/ℤ_p`, and evaluation at `1` identifies the continuous homomorphisms with `ℚ_p/ℤ_p`."

## R04 (P3) — The remaining-target list omits two targets that neither pin implements

**Location:**
- `README.md:50`: "The remaining targets, which the pinned Tau Ceti does not implement, are …".
- `:1274`–`:1276`: "Layer 3 proves that the explicit and canonical transitions agree wherever the small-universe comparison is available".
- `:3693`: "`H²(Ẑ, ℤ) ≅ ℚ/ℤ` is the part built here".

**Claim:** Neither the agreement of `explicitFiniteQuotientTransition1` with `finiteLevelTransition`, nor `H²(Ẑ, ℤ) ≅ ℚ/ℤ`, is a declaration at `358314d4` or at `2fd255d9`. Both are therefore targets, but `:50`–`:58` omits them. `:629`–`:630` defines the remaining work differently from `:50`.

**Witness:**
- At either pin, no Tau Ceti file mentions both `explicitFiniteQuotientTransition` and `finiteLevelTransition`.
- `Topology/Algebra/Group/Profinite/ZHat/` has `TauCeti.zHat.h1EquivZMod` (`CohomologicalDimension.lean:105`) and `H²`-vanishing for torsion coefficients (`subsingleton_continuousCohomology_two_of_isAddTorsion`, `:177`; at `2fd255d9` also `subsingleton_continuousCohomology_two_of_divisible`), but nothing for `H²(Ẑ, ℤ)`.

**Repair:**
- Add both items to `:50`–`:58`, with 4.2 and the Worked example `Hⁱ(Ẑ, -)` as their locations.
- Rewrite `:629`–`:630` as "The remaining work is the list in Scope and ownership".

## R05 (P3) — "Profinite" wording left over from before the 3.2 repair

**Location:**
- `README.md:67`–`:68`: "The comparison isomorphisms: explicit against canonical for profinite groups".
- `:288`: "Profiniteness enters for the canonical comparison (Layer 3)".
- `:1175`: "carrying the same profiniteness hypotheses as the comparison itself".

**Claim:** 3.2 now states the comparison for every topological group in degrees 0 and 1, for locally compact `G` in degree 2, and for compact `G` in `TopModuleCat`. These three passages still say profinite. The transport lemmas carry `[CompactSpace G]`, not total disconnectedness.

**Witness:** `ContCohomology/CohomologyComparison.lean:101` (degree 1, no hypothesis), `:203` (`[LocallyCompactSpace G]`), and `:318` (`[CompactSpace G]`, the section containing `explicitIso_map`, `explicitIso_res` and `explicitIso_coeffMap` at `:365`–`:400`).

**Repair:**
- `:67`–`:68`: "explicit against canonical, in degrees `0, 1` for every topological group and in degree `2` for locally compact groups".
- `:288`: "Compactness enters for the categorical form of the comparison (3.3)".
- `:1175`: "carrying the hypotheses of the comparison they transport (`[CompactSpace G]`)".

## R06 (P3) — 7.2 understates the hypotheses of the Shapiro–corestriction theorems it cites

**Location:** `README.md:1838`–`:1839`: "for compact `G` and subgroups `V ≤ U` with `V` of finite index in `U`, and open in `U` in degrees one and two".

**Claim:** The cited theorems carry more than compactness of `G`:
- in degrees one and two, `[CompactSpace U]`;
- in degree two, also `[TotallyDisconnectedSpace G]`, which only degrees zero and one `omit`.

**Witness:** `ContCohomology/Shapiro/Corestriction.lean` at `2fd255d9`:
- `:44`–`:45`: `variable … [CompactSpace G] [TotallyDisconnectedSpace G]`;
- `:118`: `variable [CompactSpace U]`;
- `:84` and `:141`: `omit [TotallyDisconnectedSpace G] in`;
- `:199` (degree two): no `omit`.

**Repair:** "for profinite `G` in degree two and compact `G` in degrees zero and one, and subgroups `V ≤ U` with `U` compact (closed), `V` of finite index in `U`, and `V` open in `U` in degrees one and two".

## R07 (P3) — 18 names this pull request drops are cited by four roadmaps on main, with no old → new list

**Location:** `README.md:3762`–`:3815` (Downstream consumers) lists only the names that consumer code reads.

**Claim:** Main's `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` declares the following names, and this pull request drops all of them:

`cd_p_le_of_isClosed`, `shapiroIso`, `kummerIso`, `exists_openSubgroup_res_eq_zero_of_res_eq_zero`, `cup_gradedComm`, `corestriction_comp_res`, `cd_p_le_scd_p`, `cd_p_eq_of_index_not_dvd`, `ofDiscreteModule_isSmoothDiscrete`, `ofDiscreteModuleRes`, `longExact_exact`, `isPPrimaryTorsion_continuousCohomology`, `infl`, `cup_infl`, `corestriction_mackey`, `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent` and `H1ConjInvariants`.

The READMEs or docstrings of ClassFieldTheory, Completed/ProfiniteProPGroups, Completed/LocalFieldsRamification and Completed/LocalGaloisGroups cite them as `ProfiniteCohomology.<name>`. Those citations break at the merge.

**Witness:**
- `TauCetiRoadmap/ClassFieldTheory/README.md:1294` cites `ProfiniteCohomology.cd_p_le_of_isClosed`, which is declared at main's `ProfiniteCohomology/Suggested.lean:3126` and absent from this head.
- `Completed/ProfiniteProPGroups/README.md:1262` cites `ProfiniteCohomology.cd_p_le_iff_finite_pPrimary`, declared at main's `:3097`.

**Repair:** Under Downstream consumers, add one line per dropped name giving its replacement, for example:
- `ProfiniteCohomology.cd_p_le_of_isClosed` → `TauCeti.cohomologicalDimensionAt_le_of_isClosed`;
- `shapiroIso` → `TauCeti.ContinuousCohomology.shapiroIso`;
- `corestriction_comp_res` → `TauCeti.ContinuousCohomology.res_comp_corestriction`;
- `cd_p_le_scd_p` → `TauCeti.cohomologicalDimensionAt_le_strictCohomologicalDimensionAt`;
- `H1ConjInvariants` → `TauCeti.ContCohomology.H1ConjInvariants`;
- and so on for all 18.

## R08 (P3) — Milne (0.1.6) is a finite-group statement, cited for profinite inflation

**Location:**
- `README.md:2003`–`:2004`: "inflation: `inf (a ⌣ b) = inf a ⌣ inf b` … (NSW (1.5.3)(iii), Milne (0.1.6))".
- `:3881`–`:3882`: "the continuous-cochain conventions (p. 2), cup-product properties (0.1.1)-(0.1.6)".

**Claim:** Milne's (0.1.1)–(0.1.6) list the properties of the cup product on Tate cohomology of a **finite** group. They do not support the statement for a profinite or arbitrary topological `G` as 8.4 states it. NSW (1.5.3)(iii) is the locator at the stated generality.

**Witness:** MilneADT line 251 ("When G is finite, there are Tate cohomology groups"), lines 291–294 (the cup product on those groups) and line 301 ((0.1.6)).

**Repair:** Write "Milne (0.1.6), for finite `G`" at `:2004`. At `:3882`, describe (0.1.1)–(0.1.6) as "cup-product properties for finite groups".

## Previous findings

- **R01 (pin lag): not repaired.** The pin is still `358314d4`. The reply's reason is answered in R01 above, now with 37 names.
- **R02 (results listed as remaining): repaired.** The list at `:50`–`:58` is rewritten, and every item the review named is now cited by name:
  - 7.1: `Coinduced/Adjunction.lean:93`, `:157` and `:206`, compact `G` and any subgroup, with the forward map `m ↦ (g ↦ f (g • m))` as `smoothDiscreteResCoindHomEquiv_apply` (`:135`) states it;
  - 7.2 and 7.3: `Shapiro/Naturality.lean`, `Coinduced/Induced.lean:158`, and `Shapiro/Induced.lean:86`, which carries `[TotallyDisconnectedSpace G]` as "for profinite `G`" says;
  - Layer 6: `Corestriction/Basic.lean:513` and `Corestriction/Naturality.lean:71`;
  - 10.1: `FiniteQuotient/Naturality.lean:327`;
  - 10.7: `Annihilation.lean:288` under `[LocallyCompactSpace G]`, and `Torsion.lean:125` and `:134` under `[CompactSpace G] [DiscreteTopology X.V]`;
  - 11.4: `CohomologicalDimension/Simple.lean:136` (compact `G`, `[Fact p.Prime]`) and `:68` (locally compact); `TauCeti/RepresentationTheory/Induction/Restriction.lean:79` and `:92`;
  - 8.4: `Cup/Restriction`, `Cup/Inflation` and `Cup/Naturality`.

  The 4.3, 7.2 and Layer 12 additions exist only at main's pin (R01), and the same defect remains in 1.6, 8.2, 8.3, 8.6 and 9.8 (R02).
- **R03 (3.2 generality): repaired in 3.2, partly elsewhere.**
  - 3.2 (`:1088`–`:1103`) matches `CohomologyComparison.lean:101`, `:203` and `:318`, and `ContinuousCohomologyIso.lean:165`.
  - The "may be added" sentence is gone.
  - The aliases lost the extra binders: `#check @explicitH2IsoContinuousCohomology` shows `[CompactSpace G]` only, and `explicitFiniteQuotientComparison2` shows neither binder.
  - The stale wording elsewhere is R05.
- **R04 (locators): repaired.**
  - 3.2 cites NSW (1.2.2) (`:1080`) and 3.3 cites `TauCeti.discreteTopology_continuousCohomology` (`CompactDiscrete.lean:195`).
  - 4.3 and 10.2 cite NSW (1.5.1) and Serre I §2.2 Prop. 8.
  - 10.2 now states `[CompactSpace G]` and the two `UnivLE` bounds of `FilteredColimits.lean:368`.
- **R05 (Hilbert 90 names): repaired** at `:474`–`:476` and `:2224`–`:2225`. Mathlib `GroupCohomology/Hilbert90.lean:107` is `instance H1ofAutOnUnitsUnique` inside `namespace groupCohomology` (`:55`).
- **R06 (out-of-scope line): repaired** at `:107`–`:109`. This is consistent with ProfiniteCohomologyPartII owning the all-degree inhomogeneous cochain algebra.

## Verified sound

**Scope and gate.**
- The worktree is clean at `3781da8`, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty.
- My gate run reports every check at `0` and `OK`; the worker's run with the targeted build reports `build=0`.
- `gh pr view 616` reports `mergeable: CONFLICTING`. `git merge-tree` against main conflicts only in the folder's two files (R01).

**Dependency check:**

```text
depcheck: 239 roadmaps, 2320 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- The only roadmap supplier is RepresentationTheory/InductionRestriction on main. Its sections "What Mathlib already has (consume)" (`README.md:101`) and "Layer 0: the functorial core -- transitivity and the projection formula" (`:213`) exist as cited at `:617`–`:618`.

**Elaboration, signatures and the padding probe.**
- `lake env lean …/Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:274`, `:282`, `:308` and `:567`.
- A scratch copy with `#check @` for 46 declarations elaborates. The file has no `variable` block, so every type carries its own binders. The types match the README: for example `abelianizationProPClass_generates` takes `[Fact p.Prime] … [CompactSpace G] [TotallyDisconnectedSpace G] (hG : scd_p p G ≤ 2)`.
- One-tactic probe at the branch pin:
  - `rfl` fails on both universe theorems ("`cohomologicalDimensionAt.{u, u} p G` is not definitionally equal to … `.{0, u}`"), and `simp` makes no progress;
  - `simp` makes no progress on `:308` and leaves `:567` unsolved.
- At main's pin, `:308` and `:567` close with one Tau Ceti term (R01).
- Neither pin has a universe-comparison theorem for the dimension invariants. Tau Ceti uses `cohomologicalDimensionAt.{0}` separately in `NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:71`, which confirms that the 11.2 headline is not padding.
- The one-term aliases are the names consumers on main read. Deleting them broke main's builds in an earlier round, so I do not raise them, as the previous review did not.

**Name audit.**
- I extracted the backticked `TauCeti.*` tokens from both files (525) and matched them against declaration indexes of both pins.
- At `358314d4`, everything resolves except two namespaces, one prefix (`TauCeti.TopPairing.resolutionCupPairing_`) and the 26 names of R01.
- Among the other dotted and unqualified tokens, R01's eleven are absent. The rest are module names, notation, `to_additive` names, or this file's own `WreathC2.sectionTable`. At the Mathlib pin, `AddCommGroup.primaryComponent` is at `GroupTheory/Torsion.lean:450` (to_additive) and `IsAddTorsion` is that file's additive `IsMulTorsion` (`:56`).

**Library declarations opened at the branch pin** (beyond those listed under Previous findings):
- Mathlib `f6090c70`:
  - `TopRepEquivActionTop` (`RepresentationTheory/Continuous/TopRep.lean:213`);
  - `continuousSMul_iff_stabilizer_isOpen` (`Topology/Algebra/MulAction.lean:285`);
  - `exist_openNormalSubgroup_sub_open_nhds_of_one` and `ProfiniteGrp.closedSubgroup_eq_sInf_open` (`ClopenNhdofOne.lean:47`, `:64`);
  - `ContinuousCohomology.zeroIso` (`ContCohomology/LowDegree.lean:84`).
- Tau Ceti `358314d4`:
  - `IsPPrimaryTorsion` (`GroupTheory/Torsion.lean:204`) and `CohomologicalDimensionLE`/`StrictCohomologicalDimensionLE` (`CohomologicalDimension/Basic.lean:131`, `:139`), matching the 11.1 headers verbatim, coefficients in `Type (max u v)`;
  - `explicitH0IsoContinuousCohomology` (`ContinuousCohomologyIso.lean:165`, any topological group, in `TopModuleCat ℤ`);
  - `explicitMap0/1/2` with `_id` and `_comp` (`LowDegree.lean:343`–`:382`, `ExplicitFunctoriality.lean:370`–`:531`), for 2.2;
  - `explicitCup00`–`explicitCup20` (`Cup/Product.lean`), for 8.1.
- Tau Ceti `2fd255d9`: `Coefficients/FilteredColimits.lean:276`–`:302`, under `[CompactSpace G] [UnivLE.{w', u}] [UnivLE.{w, u}]`, with no total disconnectedness, as 4.3 says.

**Consumers.**
- The worker's targeted build compiled ClassFieldTheory and QuadraticFormInvariants against this head.
- The changed alias binders (R03 of the previous round) are compatible: both pass `G M` explicitly.

**Overlaps and ownership.**
- In `scratch/overlaps.md`, no cited id is dropped or defined only by an open revision. #1187 is the conflicting head, settled by the order stated in an earlier reply.
- `roadmaps grep` for "universe_eq|extra coefficient universe" finds only this roadmap, plus Completed/ProfiniteProPGroups using `cohomologicalDimensionAt.{0}` as a consumer.
- For "Evens norm|multiplicative transfer", it finds QuadraticFormInvariants (#617) consuming 13.1 and 13.3 by name.
- No second owner of this roadmap's objects. Ownership of the all-degree inhomogeneous algebra by ProfiniteCohomologyPartII is consistent with `:107`–`:109`.

**Sources.**
- **MilneADT** (author-hosted ADTnot.pdf, in the sources cache):
  - (0.1.6) is at line 301, with the scope issue in R08;
  - Remark 0.11 (`M_*` with `(ga)(x) = a(xg)`) at line 449 matches 7.1;
  - Remark 0.10 is at line 445;
  - Prop. 0.15 (conjugation by an element of `G` acts as the identity) at line 542 matches 2.4.
- **Evens 1963** (AMS backfile, publisher-open):
  - the norm with coefficients in a commutative `G`-ring and the multiplication `x₁a₁ ⋯ x_l a_l` are on p. 60 (Evens1963 lines 223–228), within "§5, pp. 59–60";
  - Props. 1–4 are on pp. 60–62 (lines 249, 274, 301, 313);
  - Thm. 1, for a commutative `G`-ring and `χ ∈ H^{2r}`, is on p. 63 (line 345).

  All 13.2 locators match.

**Seeded sample.**
- **0.1:** the Mathlib and Tau Ceti inputs resolve; the Checks recompute (table).
- **0.3:** the Tau Ceti sections and the extension lemma resolve; Ribes–Zalesskii is not readable.
- **1.1:** verified against the Mathlib declarations above.
- **1.6:** true, and already Tau Ceti's (R02).
- **2.2:** cited through `explicitMap1` and its degree-0/2 siblings, which exist with their laws.
- **4.3:** the statement is correct, the first Check's justification is false (R03), and the citations exist at main's pin only (R01).
- **6.3:** the normalisation recomputes on two instances (table). NSW (1.5.7), (1.5.2), Serre *Local Fields* VII §7 Prop. 6 and Koch Thm. 3.10 are not readable.
- **8.1:** the six declarations exist; the Checks recompute.
- **8.2 and 8.3:** correct, and Tau Ceti's (R02). Brown V (3.5) and (3.6) are not readable.
- **8.4:** NSW (1.5.3) is not readable; Milne (0.1.6) is R08; the Tau Ceti citations resolve.
- **8.6:** correct, and Tau Ceti's (R02); it has no source locator.
- **11.1:** the headers match Tau Ceti verbatim; NSW (3.3.1) is not readable.
- **11.4:** the three reductions resolve with the stated hypotheses; NSW (3.3.2) and Koch Def. 5.1 are not readable.
- **11.7:** both Tau Ceti theorems resolve, and the `≤` form against NSW (3.3.4)'s "if `cd_p G = n` …" form is argued correctly.
- **13.1:** the Tau Ceti declarations resolve (except R01's names) and the Checks recompute; Kahn is not readable.

**Headline theorems.**
1. The comparisons (Layer 3), the finite-quotient colimit (4, 10.1), the long exact and five-term sequences (5, 10.3), Shapiro and dimension shifting (10.4), all-degree corestriction and Mackey (10.5), the graded cup (12), and Hilbert 90 and Kummer (9) are proved at the pin and cited.
2. Universe independence (11.2) is stated at `:274` and `:282`. It is not padding.
3. NSW (3.6.4) (11.8) is stated at `:308`; it is proved at main's pin only (R01).
4. Evens identity 5 for `L/K` (13.3) is stated at `:567`; it is proved at main's pin only (R01).
5. The general Evens norm (13.2) is not statable, and the module docstring at `:58`–`:65` says why (no cohomological norm map, only `Subgroup.tensorInductionFunctor`). That is correct.

No statable headline is absent.

**Adversarial table** (values computed here; "both sides" means the two sides of the statement, or the statement against its wrong model):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 openness | sign `C₂` on `𝔽₃`; trivial `ℤ_p` on `𝔽_p` | `Stab(1) = {1}` (sign) vs `C₂` (trivial); kernel `{1}` open; `M^{C₂} = 0`, `M^{1} = 𝔽₃`, union `𝔽₃`; kernel `ℤ_p`, quotient of order 1 | consistent | none |
| 0.3 continuous section | `ℤ_p → ℤ/p`, `p = 2`; `ℝ → ℝ/ℤ`; empty closed set | `s(1)+s(1) = 2 ≠ 0 = s(0)`, so not a homomorphism; no continuous section of the circle; 1 extension to a point, 0 to `∅` | consistent | none |
| 1.1 carrier, degree 0 | `G = 1`, `ℤ`; `C₂` on `𝔽₃`, trivial and sign | `H⁰ = ℤ`, `1 ↦ 1`; `#H⁰ = 3` and `1` | consistent | none |
| 1.6 degree 0 (`map_comp_zeroIso_hom`) | `φ: 1 ↪ C₂`, sign `𝔽₃`; `φ = id`, trivial `𝔽₃`, `f = ×2` | `0 → 𝔽₃` on both paths; `1 ↦ 2` on both paths, and `−f` would give `1 ↦ 1` | true, already Tau Ceti's | R02 |
| 2.2 compatible pairs | `C₄ → C₂` then `C₂ = ⟨σ²⟩ ↪ C₄`, `𝔽₂` | `χ∘π` has values `0,1,0,1`; restricted to `⟨σ²⟩` it is `0`, which equals the pullback along the composite `σ² ↦ 1` | composition law consistent | none |
| 3.2 degrees 1, 2 | `⊕ℕ 𝔽₂ ⊂ ∏ℕ 𝔽₂`; `ℚ_p` | continuous characters `⊕ℕ 𝔽₂` vs abstract `∏ℕ 𝔽₂`; `ℚ_p` locally compact, not compact | matches `CohomologyComparison.lean:101`, `:203`, `:318` | R05 (wording elsewhere) |
| 3.3 discreteness | `∏ℕ C₂`, `𝔽₂`; `C₂` | `k` evaluations leave codimension `≤ k`, so 0 is not isolated pointwise; `#H¹ = 2` on both sides for `C₂` | consistent | none |
| 4.3 coefficient colimits | `ℤ_p`, `colim p⁻ᵏℤ_p/ℤ_p`; `⊕ℕ ℤ` | `H¹ = ℤ/pᵏ` at each stage, colimit `ℚ_p/ℤ_p = H¹(ℤ_p, ℚ_p/ℤ_p)`; `(ℤ/pᵏ)^ℕ` has colimit the bounded sequences `≠ (ℚ_p/ℤ_p)^ℕ`; the witness `f(1) = 0`, `f(b) = 1/p` | values correct, justification false | R03 |
| 4.2 transitions agree; Worked `H²(Ẑ, ℤ)` | `0→ℤ→ℚ→ℚ/ℤ→0` on `Ẑ` | `H^{1,2}(Ẑ, ℚ) = 0`, so `H²(Ẑ, ℤ) ≅ H¹(Ẑ, ℚ/ℤ) = ℚ/ℤ` | true, but not at either pin and not listed | R04 |
| 6.3 `cor¹(res f) = (G:U)f + d⁰c` | `C₂ ⊇ 1`, sign `ℤ`, `f(s) = a`; `C₄ ⊇ ⟨σ²⟩`, trivial `ℤ/4`, `f(σᵏ) = ka` | (a) left side `0`, right side `2a − 2a = 0`; with `−d⁰c` it would be `4a`. (b) `ℓ_U(σ) = σ²`, `ℓ_{σU}(σ) = 1`: `f(σ²) + f(1) = 2a = 2f(σ)` | sign pinned | none |
| 6.4 Mackey | `S₃`, `U = V = ⟨(12)⟩`, `H⁰(ℤ)` | double cosets of sizes 2 and 4; `V ∩ (13)V(13) = 1`; `1 + 2 = 3 = (G:U)` | consistent | none |
| 7.2 Shapiro and corestriction | binders at `2fd255d9` | degree 0: compact `G`; degree 1: plus `CompactSpace U`; degree 2: plus `TotallyDisconnectedSpace G` | README understates them | R06 |
| 8.1 six shapes | `C₂`, `𝔽₂`; `G = 1` | `(χ⌣χ)(s,s) = 1`, the class of the `C₄` extension; `(2,3) ↦ 6`; the zero pairing gives 0 | consistent | none |
| 8.2 associativity `(0,1,1)` | `C₂`, `𝔽₂` ring, `x = 1`, `y = z = χ` | both sides `μ(1, χ(g)·χ(h))`, `= 1` at `(s,s)` | holds on cochains; Tau Ceti's | R02 |
| 8.3 graded commutativity `(1,1)` | `C₂×C₂ = ⟨a,b⟩`, `𝔽₂`, characters `x, y` | `(x⌣y)(a,b) = 1`, `(y⌣x)(a,b) = 0`; `c = xy`: `dc(a,b) = 0 − 1 + 0 = 1` | classes agree, cochains differ; Tau Ceti's | R02 |
| 8.4 projection formula | `C₂ ⊇ 1`, `(0,0)`, `ℤ` | `cor(res a · b) = 2ab = a · cor b` | consistent | R08 (locator) |
| 8.6 Bockstein | `C₂`, `𝔽₂`, `ℤ/4` lift `c(s) = 1` | `dc(s,s) = 1 − 0 + 1 = 2 ↦ 1 = χ²(s,s)`; `β(χ²) = χ³ + χ³ = 0`; `β(1) = 0` | consistent; Tau Ceti's | R02 |
| 10.2 filtered colimits | `⊕ℕ ℤ`; `ℤ_p` | `(p⁻ᵏ)_k` of unbounded order is not in the colimit; `colim ℤ/pᵏ = ℚ_p/ℤ_p` | consistent; hypotheses match `:368` | none |
| 11.1 invariants | `G = 1`, `ℤ_p`, `C_p` | `cd = scd = 0`; `cd_p = 1`, `scd_p = 2` since `H²(ℤ_p, ℤ)(p) = ℚ_p/ℤ_p`; `⊤`, and `⊤ + 1 = ⊤` | consistent | none |
| 11.2 universe equality (headline) | `G = 1`, `ℤ_p`, `C_p`; `u = 0` | `0 = 0`, `1 = 1`, `⊤ = ⊤`; one term at `u = 0`; `rfl` fails for general `u` | true, not padding | none |
| 11.4 simple modules | `𝔽_p²`; `ℤ/p²`; sign `𝔽₃` on `C₂` inflated to `C₄` | proper line `⟨(1,0)⟩`; proper `pℤ/p²`; submodules `{0, 𝔽₃}` before and after inflation | consistent | none |
| 11.7 strict criterion | `ℤ_p`, `n = 1, 2`; `C_p` | `n = 1`: `scd ≤ 1` false and `H²(p^rℤ_p, ℤ)(p) ≠ 0`, both false; `n = 2`: `H³ = 0`, both true; `C_p`: both false | iff holds | none |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p`, `p = 2, 3`; `V = G`; `ℤ_p × C_ℓ ⊇ ℤ_p`; `C_p ⊇ 1` | `#H² = p = p^{v_p(p)}`; `1`; `1 = p^{v_p(ℓ)}`; `0 ≠ p`, excluded by `scd_p = ⊤` | hypotheses exact | R01 |
| 13.1 index two | `C₄ ⊇ ⟨σ²⟩`, `α ≠ 0`; `S₃ ⊇ C₂`; `C₂ ≀ C₂` | `b₁ = 0,1,1,0`, `b_s = 0,0,1,1`; `res N(α) = α² ≠ 0`, so `N(α) ≠ 0` (`C₈`); `res` and `cor` both onto in degree 1 for `S₃`; `res χ_U = 0`, `χ_U² ≠ 0` in `𝔽₂[x,y,w]/(xy)` | consistent | none |
| 13.1 Check on `Ind α` | `C₂ ⊂ C₄`, sign `α` | rotation by 90°, `det = 1`; `Ver(σ) = σ²`, so `cor α = d`; `w₁ = d + d = 0` | consistent | none |
| 13.2 general norm (not statable) | `C₃ × C₂ ⊇ C₃`, `𝔽₃` | `res N(a) = a² ≠ 0`; `N(2a) = 4N(a) = N(a) ≠ 2N(a)` | consistent | none |
| 13.3 `N(res y) = y² + χy` (headline) | `ℂ/ℝ`, `y = χ` and `y = 0`; `𝔽₉/𝔽₃` | `N(0) = 0 = χ² + χ²`; `0 = 0`; `H²(Ẑ, 𝔽₂) = 0` on both sides | identity holds | R01 |

## Not verifiable

- **NSW** and **Serre, *Galois Cohomology***: settled as `uncertified` in the manifest. They are cited by locator, and I did not request them again. The NSW and Serre GC locators of the sample, (1.2.2), (1.5.1)–(1.5.7), (3.3.1)–(3.3.4) and I §2.2 Prop. 8, are unverified against the text. Their content was checked on the instances in the table.
- **Ribes–Zalesskii, Koch, Serre *Local Fields*, Brown**: Springer texts, not in the sources cache, with no legal copy found in earlier rounds. So Prop. 2.2.2 (0.3), Thm. 3.10 and *Local Fields* VII §7 Prop. 6 (6.3), Brown V (3.5), (3.6) and (3.8) (8.2–8.4), and Koch Def. 5.1 (11.4) are unverified.
- **Kahn 1984** (13.1, th. I.4.2): the sources service, given author, title and year, found no legal source.
- **Kozlowski 1984** (13.2): not sampled, and not fetched.
- The manifest records only NSW and SerreGC. MilneADT and Evens1963 were read from the sources cache and a scratch probe; this review edits no manifest.
- **Main's pin:** the brief's Lean commands run only in this worktree, at `358314d4`. R01's two repair terms are justified by comparing binders and conclusions at `2fd255d9`; I did not elaborate them there.

## Source issues

- none
