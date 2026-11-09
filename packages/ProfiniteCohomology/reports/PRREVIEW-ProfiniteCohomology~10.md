# Review of ProfiniteCohomology (pull request #616 at fc1a80a)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ProfiniteCohomology/` at `fc1a80a`, the same head the previous review read; nothing in the folder or outside it has changed since. The previous R01 (pin lag) is still open; the author agrees with it but says it cannot be repaired inside the folder. I re-raise it below with a larger count and say why that reason fails. The previous R02 (merge order against #1187) is repaired by the reply. The full pass adds one new blocking finding, R02: the README lists as remaining work six results that the branch's own pinned Tau Ceti already proves. It also adds four P3 findings.

## R01 (P2) — 22 cited names are absent at the branch's Tau Ceti pin, and at main's pin two `sorry`s restate proved theorems

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:38`: "Most headline theorems of the roadmap are already proved at the Tau Ceti pin". The same claim recurs at `:44`–`:47` and `:78`–`:83`.
- `README.md:186`: "Every backticked entry in the declaration column is a Lean identifier at the pins". The same claim recurs at `:37`–`:38` and `:615`–`:616`.

**Claim:** `lake-manifest.json` on this branch pins Tau Ceti `358314d4`. At that pin, 22 names the folder cites as existing have no declaration, so the folder describes a pin it does not use. Each of them exists at main's pin `2fd255d9`:
- the class-module package: `TauCeti.abelianizationProPClass_generates` (README `:221`, `:2796`, `:3033`; Lean `:47`, `:80`), `subsingleton_h1_abelianizationProP` and its `_of_isPGroup` and `_map` forms, `abelianizationProPClass_generates_of_isPGroup`, `explicitRes2_abelianizationProPClass_generates`, `abelianizationProPRes1_injective`, `abelianizationProPRes2_injective` and `abelianizationProP_pow_bijective` (`:2794`–`:2974`). Also the files `ClassModule/PGroup`, `CoprimeRestriction` and `Sylow` named at `:577`–`:578` and `:2791`;
- the Evens package: `TauCeti.galoisEvens_galoisRes`, `galoisEvens_add`, `galoisRes_galoisEvens` and `galoisEvens_embedding_independent` (`:219`, `:3468`–`:3473`; Lean `:83`), and `TauCeti.ContCohomology.evensNormIndexTwo_polarization`, `evensNormIndexTwo_trivialF2ResMap` and `trivialF2ResMap_evensNormIndexTwo` (`:3245`–`:3247`);
- `TauCeti.ContCohomology.DiscreteShortExact.delta_conjNormalMap` (`:2878`), and `TauCeti.coindFunctor_preservesMonomorphisms` and `coindFunctor_preservesEpimorphisms` (`:1686`);
- three names without the `TauCeti.` prefix, which the previous count of 19 did not cover: `Subgroup.quotientOpenSubgroup` (`:597`; the branch pin has it as `TauCeti.quotientOpenSubgroup`), `OpenSubgroup.indexTwoDelta_eq_cup_character` (`:3271`) and `OpenSubgroup.exact_cup_res_of_index_two` (`:3272`).

Moving to main's pin does not settle it on its own. There, `Suggested.lean:304` and `:563` state with `sorry` the conclusions of Tau Ceti's `abelianizationProPClass_generates` (`ClassModule/Sylow.lean:156`) and `galoisEvens_galoisRes` (`GaloisCohomology/EvensNorm.lean:143`). That contradicts the file's own contract at `:34`–`:36`: "the headline theorems of the roadmap that the pinned libraries do not yet prove".

**Why the reply's reason fails.** The reply at `fc1a80a` says: "Agreed, but it cannot be repaired inside the folder at this head. The repair is the merge of `origin/main` into the branch." That reason fails on three counts:
1. A merge of main is within a repair round. This branch already contains one, `2464b0cc` ("Merge remote-tracking branch 'origin/main' into HEAD").
2. The merge is needed whatever happens to this finding: `gh pr view 616` reports `mergeable: CONFLICTING`.
3. Route 2 of the earlier R01 repairs everything inside the folder at the current pin.

**Witness:** At `358314d4`, a declaration index of the pinned sources finds none of the 22 names; at `2fd255d9` all 22 resolve. `ClassModule/` at `358314d4` has only `Basic`, `ChangeOfGroup`, `Cyclic`, `Inflation`, `Transfer`. Elaboration warns `sorry` at `:270`, `:278`, `:304`, `:563`.

**Repair:** Merge `origin/main`, as the reply itself proposes. This also clears the conflict. Then:
- keep this branch's text for `README.md` and `Suggested.lean`;
- replace the `sorry` at `Suggested.lean:310` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`;
- replace the `sorry` at `:569` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`;
- rewrite `:78`–`:83` so that these two are "theorems proved by" the Tau Ceti theorems of the same names;
- re-run the gate with the build, expecting `sorry` only at `:270` and `:278`.

Keep both names, because `Completed/LocalGaloisGroups/Suggested.lean:1914` applies `abelianizationProPClass_generates`. If the merge is not made, use Route 2:
- restate the class module (11.8) and the Evens identities (13.1, 13.3) as targets;
- remove the 22 names from the locations above;
- say at `Suggested.lean:78`–`:83` and at `README.md:37`–`:38` and `:615`–`:616` that four sorried theorems remain.

## R02 (P2) — Six results listed as remaining work are proved at the branch's own Tau Ceti pin

**Location:** `README.md:50`–`:51`: "The remaining targets are the universe comparison, continuous Frobenius reciprocity and its transport laws, coefficient and connecting-map compatibilities, simple-module dévissage, and the general Evens norm." The per-layer "what remains" sentences say the same at:
- `:1499`–`:1501` (Layer 6);
- `:1691`–`:1694` (Layer 7);
- `:2268`–`:2269` (10.1);
- `:2688`–`:2693` (11.4, item 3).

**Claim:** The README plans as targets, and calls remaining, results that Tau Ceti `358314d4` (this branch's pin) already proves. Main's pin proves them too. All but the dévissage file existed even at the earlier pin `a91d3aaf`. The README cites none of their declarations, which goes against its own rule at `:52`–`:53` ("a qualified Mathlib or Tau Ceti declaration is consumed …, not replanned"). This folder's own `PROGRESS.md:59` records the first two items as landed.
1. **Continuous Frobenius reciprocity**, 7.1's `Hom_G(M, Coind_H^G A) ≃ Hom_H(res M, A)`: `TauCeti.smoothDiscreteResCoindHomEquiv`, `TauCeti.smoothDiscreteResCoindAdjunction` and `TauCeti.coindFunctor_isRightAdjoint`. The equivalence is additive and natural in both arguments, for any subgroup of a compact group.
2. **`Ind_H^G A ≅ Coind_H^G A` for open `H`, with the induced-module Shapiro lemma** (7.3): `TauCeti.topologicalIndCoindIso`, `TauCeti.ContinuousCohomology.inducedShapiroIso` and `inducedShapiroMap_naturality`.
3. **Naturality and restriction compatibility of the explicit Shapiro maps** (7.2): `TauCeti.ContCohomology.explicitShapiro0_pullback`, `explicitShapiroMap1_pullback` and `explicitShapiroMap2_pullback`.
4. **The simple-module dévissage**, 11.4 item 3, including the independence of `U`: `TauCeti.cohomologicalDimensionAt_le_iff_forall_isIrreducible` (an `↔`, for compact `G`), `TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_of_forall_isIrreducible`, and for independence `Representation.isIrreducible_ofQuotient_iff` and `Rep.simple_ofQuotient_iff`.
5. **Class-level naturality of `explicitCor1` and `explicitCor2` in coefficient maps** (Layer 6): `TauCeti.ContCohomology.explicitCor1_explicitMap1_id` and `explicitCor2_explicitMap2_id`.
6. **Coefficient naturality of the all-degree finite-quotient system** (10.1): `TauCeti.ContCohomology.continuousFiniteQuotientSystemMap`, `continuousFiniteQuotientTransition_naturality` and `continuousFiniteQuotientComparison_naturality`.

Three further sections state, as unattributed targets, results the pin proves:
- 10.7: `TauCeti.ContinuousCohomology.index_nsmul_eq_zero_of_res_eq_zero`, `isAddTorsion_continuousCohomology` and `subsingleton_continuousCohomology_of_module_rat`;
- 8.4 items 1–3: `Cup/Restriction.lean`, `Cup/Inflation.lean` and `Cup/Naturality.lean`, for example `TauCeti.ContCohomology.explicitRes2_explicitCup11`;
- 3.3: `TauCeti.discreteTopology_continuousCohomology`.

**Witness:** At `358314d4`, under `TauCeti/RepresentationTheory/Homological/ContCohomology/`:
- `Coinduced/Adjunction.lean:93,157,206`;
- `Coinduced/Induced.lean:158`;
- `Shapiro/Induced.lean:86`;
- `Shapiro/Naturality.lean:42,60,80`;
- `CohomologicalDimension/Simple.lean:136`;
- `Corestriction/Basic.lean:513`;
- `Corestriction/Naturality.lean:71`;
- `FiniteQuotient/Naturality.lean:170,327`.

The README mentions none of these declarations.

**Repair:**
- At each location, replace the planned target with the pinned declarations by name and file, in the form 10.6 already uses: "Tau Ceti has the theorem as `…`".
- Add them to "From Tau Ceti" (`:548`–`:598`).
- Shorten the list at `:50`–`:51` to items the pin lacks. Examples are Layer 12's connecting-map compatibility of the graded cup (`:3158`–`:3165`; `Cup/` at the pin has no such theorem), 4.3's explicit coefficient colimits, the universe comparison and the general Evens norm.
- Test of the repair: after it, `grep -n 'What remains'` should match no item that a pinned declaration discharges.

## R03 (P3) — 3.2 states the comparison more narrowly than the pin proves it, and makes the generalization optional

**Location:** `README.md:1074`–`:1077`: "Accordingly this milestone is stated for **profinite `G`** … A locally compact Hausdorff generalization may be added only when the exact Mathlib theorem and all its hypotheses are named in the statement." Also `Suggested.lean:175`–`:179` and `README.md:3601`–`:3602` ("with that declaration's hypotheses").

**Claim:** The pinned comparisons are more general than 3.2 states them:
- degree one, as an additive equivalence, for every topological group with discrete coefficients;
- degree two for locally compact `G`;
- the `TopModuleCat` isomorphisms for compact `G`, with no total disconnectedness.

"May be added" makes the generalization optional, which the house rules forbid. The README's own scope sentence at `:102`–`:103` ("exactly where currying is an equivalence") claims the locally compact range. The alias `explicitH2IsoContinuousCohomology` adds `[TotallyDisconnectedSpace G]`, and `explicitFiniteQuotientComparison2` adds `[CompactSpace G] [TotallyDisconnectedSpace G]`. Tau Ceti's declarations need neither, so `:3601`–`:3602` is false for both aliases.

**Witness:** In `ContCohomology/CohomologyComparison.lean`:
- `:101`–`:134`: `explicitH1AddEquivContinuousCohomology` under `[IsTopologicalGroup G]` only;
- `:203`, `:232`: `[LocallyCompactSpace G]` for degree two;
- `:318`, `:327`, `:414`: only `[CompactSpace G]`.

`FiniteQuotient/Colimit.lean:226`–`:371` gives the cocone with no compactness.

**Repair:**
- State 3.2 at the pinned generality: degree one for every topological group, degree two for `[LocallyCompactSpace G]` (the hypothesis of `ContinuousMap.uncurry`), and the `TopModuleCat` forms for `[CompactSpace G]`. Name the three Tau Ceti declarations, and delete the "may be added" sentence.
- Either drop the extra binders from the two aliases or say at `:3601` that they carry them.
- Check: for `G = ℚ_p` (locally compact, not compact) with trivial `𝔽_p`, the degree-two comparison now applies, and the old text excluded it.

## R04 (P3) — Four seeded targets have no source locator, and 10.2 omits its hypotheses

**Location:** 3.2 (`README.md:1064`–`:1092`), 3.3 (`:1094`–`:1111`), 4.3 (`:1240`–`:1248`) and 10.2 (`:2273`–`:2280`). For 10.2: "prove `TauCeti.ContinuousCohomology.continuousCohomology_preservesFilteredColimits`". For 4.3, `:1167`: "apart from its coefficient colimits".

**Claim:** None of the four states a source locator. 10.2 also omits the two hypotheses of the pinned theorem: compactness of `G`, mentioned only in the *Needs:* line, and the bound on the size of the index category. 4.3 is a target the pin lacks (`:1167`), but the remaining-target list at `:50`–`:51` omits it.

**Witness:**
- `ContCohomology/FilteredColimits.lean:368` takes `[CompactSpace G] [UnivLE.{w', u}] [UnivLE.{w, u}]`.
- `README.md:3653`–`:3658` already lists NSW (1.2.2) (the inhomogeneous translation) and (1.5.1) (cohomology of a limit).
- `:3677` lists Serre, *Galois Cohomology* I §2.2 Prop. 8.

**Repair:**
- 3.2: cite NSW (1.2.2) and I §2.
- 4.3 and 10.2: cite NSW (1.5.1) and Serre, *Galois Cohomology* I §2.2 Prop. 8, at the constant group.
- 3.3: cite the Tau Ceti theorem `TauCeti.discreteTopology_continuousCohomology` (`ContCohomology/CompactDiscrete.lean:195`), since no textbook states it.
- Write 10.2's statement as "for compact `G` and filtered index categories in a universe at most that of `G`".
- Add 4.3 to the remaining-target list.

## R05 (P3) — Hilbert 90 declarations misattributed or misnamed

**Location:** `README.md:468`–`:469`, under "From Mathlib": "`Hilbert90.lean` (`H1ofAutOnUnitsUnique`, `TauCeti.hilbert90`)". Also `:2102`: "the pin's finite-level `groupCohomology.hilbert90` (`H1ofAutOnUnitsUnique`)".

**Claim:** `TauCeti.hilbert90` is a Tau Ceti theorem, not part of Mathlib's `Hilbert90.lean`. `groupCohomology.hilbert90` is not a declaration at the pinned Mathlib.

**Witness:** Pinned Mathlib `RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107` has `noncomputable instance H1ofAutOnUnitsUnique`; Mathlib contains no declaration named `hilbert90`. `TauCeti.hilbert90` is at `FieldTheory/GaloisCohomology/Hilbert90.lean:245`.

**Repair:**
- Delete `TauCeti.hilbert90` from the Mathlib bullet at `:469`; 9.5 and "From Tau Ceti" already cite it.
- Write `:2102` as "the pin's finite-level Hilbert 90, the instance `groupCohomology.H1ofAutOnUnitsUnique`".

## R06 (P3) — The out-of-scope line on all-degree inhomogeneous cochains reads as claiming them for profinite groups

**Location:** `README.md:102`–`:103`: "All-degree explicit inhomogeneous cochains `C(Gⁿ, M)` for groups that are not profinite. Layer 3 gives the inhomogeneous description exactly where currying is an equivalence."

**Claim:** Excluding these cochains only "for groups that are not profinite" puts them in scope for profinite groups. No layer builds them there: Layer 3 compares only degrees `i ≤ 2` (`:1084`). The open ProfiniteCohomologyPartII owns "the strict continuous inhomogeneous cochain algebra of a profinite group … its comparison with continuous cohomology". As written, the boundary gives that object two readings of ownership.

**Witness:** ProfiniteCohomologyPartII at its open head, `README.md:35`–`:37` and `:310` ("0.1 The continuous inhomogeneous cochain algebra"). This README's Layer 3 statement at `:1084` is "for i ≤ 2".

**Repair:** Replace the bullet with: "All-degree explicit inhomogeneous cochains `C(Gⁿ, M)`, for every group: Layer 3 compares the explicit and canonical models in degrees `0, 1, 2` only."

## Previous findings

- **R01 (pin lag): not repaired.** The folder is unchanged and the pin is still `358314d4`. The reply agrees ("Agreed, but it cannot be repaired inside the folder at this head"). Written again as R01, now with 22 names.
- **R02 (order against #1187): repaired.** The reply at `fc1a80a` states "Order: 1. This pull request merges first, after it has merged `origin/main` (H01)." That is the one-sentence order the previous repair asked for, given in the worker's reply. #1187 is still open and `CONFLICTING`; that is now covered by the stated order.

## Verified sound

**Scope and gate.**
- The worktree is clean at `fc1a80a2`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty.
- My run of the gate reports every key `0` and `OK`, from `set_option` to `stray-files`.
- The worker's run with the targeted build reports `build=0`.
- The folder's other files are `PROGRESS.md` and `STATUS.md`, which are machine-written and allowed by the repository README, and `metadata.toml`.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The only roadmap supplier is RepresentationTheory/InductionRestriction, on main. Its sections "What Mathlib already has (consume)" (`README.md:101`) and "Layer 0: the functorial core -- transitivity and the projection formula" (`:213`) exist as cited at `README.md:603`–`:604`.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly four `declaration uses sorry` warnings, at `:270`, `:278`, `:304` and `:563`.
- A scratch copy with `#check @` for all 56 declarations elaborates with no error.
- The file has no `variable` or `include` block, only `universe u v`, so no binder can be dropped. Every elaborated type carries its own hypotheses.
- The two universe theorems elaborate as `TauCeti.cohomologicalDimensionAt.{u_1, u_1} p G = TauCeti.cohomologicalDimensionAt.{0, u_1} p G`, and the same for `strictCohomologicalDimensionAt`.
- `@continuousCohomology.{u_1,u_2,u_3}` takes `TopRep.{max u_2 u_3}`. The third parameter differs between the two sides, which explains the non-definitional equality.

**One-tactic probe** (scratch copy):
- `rfl` on `:270` and `:278` fails with "is not definitionally equal", and `simp` makes no progress;
- `simp` fails on `:304` and on `:563`;
- no library lemma at `358314d4` matches either statement, because the names are absent (R01).

None of the four `sorry`s is padding at the branch pin.

**Name audit.**
- I extracted 518 backticked `TauCeti.*` tokens from both files and matched them against a declaration index of the pinned Tau Ceti sources.
- At the branch pin, 473 resolve. Of the rest, 25 are module paths (all 26 imports of `Suggested.lean` exist), 1 is a prefix (`TauCeti.TopPairing.resolutionCupPairing_`), and 19 are absent (R01).
- I checked 128 further dotted tokens against Mathlib and Tau Ceti. Three more are absent at the branch pin (R01). The rest are `to_additive` names (`AddCommGroup.primaryComponent`, `AddCommGroup.mem_primaryComponent`), file names, or this roadmap's own `WreathC2.sectionTable` (`Suggested.lean:458`), plus `groupCohomology.hilbert90` (R05).
- At main's pin, all names resolve except the prefix.

**Consumers.**
- Four files on main import this module: `ClassFieldTheory`, `QuadraticFormInvariants`, `Completed/LocalGaloisGroups` and `Completed/ProfiniteProPGroups`.
- The first two are in the worker's targeted build, which passed.
- For the two Completed files, I checked every code use statically:
  - `LocalGaloisGroups/Suggested.lean:1320` and `:1910`–`:1915` use `abelianizationProP`, `abelianizationProPClass`, `H2` and `abelianizationProPClass_generates p G hG V hV`, which match `Suggested.lean:288`, `:295`, `:151` and `:304`;
  - `ProfiniteProPGroups/Suggested.lean:3671` uses `cd_p`;
  - other mentions there (`infl`, `cup_infl`) are in docstrings only.

**Library declarations opened at the pins.**

Mathlib `f6090c70`:
- `TopRep` is a structure (`RepresentationTheory/Continuous/TopRep.lean:31`), with `ρ : ContRepresentation` and no continuity in the group variable. This supports 1.2.
- `TopRepEquivActionTop` (`:213`), `invariants` (`:230`) and `invariantsFunctor` (`:234`).
- `continuousCohomology` (`ContCohomology/Basic.lean:131`) and `homogeneousCochains` (`:113`); `zeroIso` (`LowDegree.lean:84`).
- `resolutionMap`, `cochainsMap`, `cocyclesMap`, `map`, `map_id` and `map_comp` (`Functoriality.lean:50`, `:103`, `:129`, `:148`, `:158`, `:163`).
- The "corestriction" naming collision in `GroupHomology/Functoriality.lean:26`–`:27`, which supports 6.6.
- `H1ofAutOnUnitsUnique` (`GroupCohomology/Hilbert90.lean:107`).

Tau Ceti `358314d4`:
- `CohomologicalDimensionLE` and `StrictCohomologicalDimensionLE` (`CohomologicalDimension/Basic.lean:131`, `:139`), over `M : Type (max u v)`, matching 11.1;
- `exists_openSubgroup_le_res_eq_zero` (`ClosedSubgroup.lean:213`, smooth discrete `X`, closed `H`), matching 10.6;
- `continuousCohomology_preservesFilteredColimits` (`FilteredColimits.lean:368`);
- `subsingleton_H1_additive_units` (`FieldTheory/GaloisCohomology/Hilbert90.lean:186`, any Galois `L/K`) and `hilbert90` (`:245`), matching 9.5;
- `finite_induction_of_exists_addSubgroup` (`Devissage.lean:56`);
- the comparisons of `CohomologyComparison.lean` and the declarations of R02.

**Seeded sample.**
- **0.3:** `TauCeti.exists_continuous_section` and `_of_le` and `ContinuousMap.exists_extension_of_discrete` resolve. Ribes–Zalesskii Prop. 2.2.2 is not readable (see "Not verifiable").
- **1.1:** verified against the Mathlib declarations above.
- **3.2:** comparison declarations verified. Generality is R03; the missing locator is R04.
- **3.3:** discreteness verified (`CompactDiscrete.lean:195`). The missing locator is R04.
- **4.3:** the target is not in Tau Ceti. The missing locator is R04.
- **5.5:** `TauCeti.ContCohomology.transgression`, `fiveTerm_exact_H1N` and `fiveTerm_exact_H2Q` resolve, with compactness in `Transgression.lean:456`. The NSW, Ribes–Zalesskii and Koch locators are not readable.
- **6.3, 6.4:** the Tau Ceti names resolve, and the `S₃` Mackey numbers recompute (table). NSW (1.5.6) and (1.5.7) are not readable.
- **6.6:** verified (Mathlib collision above).
- **8.3:** the cochain-level failure and the class-level identity recompute (table). NSW (1.4.4) and Brown V (3.6) are not readable.
- **8.4:** Milne (0.1.6) is verified: inflation commutes with cup, MilneADT line 301, with (0.1.5) restriction at line 300. The unattributed Tau Ceti declarations are R02.
- **9.5:** Tau Ceti declarations verified, citing NSW (6.2.1) in their own docstrings. The name errors are R05.
- **10.2:** hypotheses as in R04.
- **10.6:** route and hypotheses match `ClosedSubgroup.lean:213`.
- **11.4:** items 1 and 2 resolve. Item 3 is proved at the pin (R02).
- **Other Milne locators:** Prop. 0.15 (inner conjugation acts trivially, MilneADT line 542), Remark 0.11 (`M_*` with `(ga)(x) = a(xg)`, line 449) and Remark 0.10 (`Ext` colimits, line 445) all read as cited.

**Overlaps and ownership.**
- `scratch/overlaps.md`, checked: no cited id is dropped by an open pull request; no id is defined only by an open revision; this pull request drops no id others cite. #1187 is the conflicting head, settled by the stated order.
- `roadmaps grep` for "Evens norm", "multiplicative transfer", "continuous Frobenius reciprocity", "Hilbert 90", "strict cohomological dimension" and "five-term" finds consumers and revisions, plus ProfiniteCohomologyPartII (R06). It finds no second owner of this roadmap's objects. #999's Hilbert 90 concerns other objects.
- ProfiniteCohomologyPartII declares `gap:char-p-galois-h2-vanishing` on this roadmap's Layer 9. That is a consumer's declared gap, which the intake announces, and not a finding here.

**Headline theorems** (from the README) and where each stands:
1. The comparison isomorphisms (Layer 3): proved at the pin and cited.
2. The colimit theorem NSW (1.2.5) (4, 10.1): proved and cited.
3. The long exact and five-term sequences (5, 10.3): proved and cited.
4. Shapiro's lemma in every degree and dimension shifting (10.4): proved and cited.
5. All-degree corestriction with `cor ∘ res` and Mackey (10.5): proved and cited.
6. The graded cup with associativity, graded commutativity and projection formula (12): proved and cited.
7. Hilbert 90 and Kummer theory (9): proved and cited.
8. Dimension theory (11.4–11.7): proved, and partly uncited (R02).
9. Universe independence (11.2): stated at `:270`, `:278`. Not padding.
10. NSW (3.6.4) (11.8): stated with `sorry` at `:304`; proved only at main's pin (R01).
11. Evens identity 5 at a quadratic extension (13.3): stated with `sorry` at `:563`; proved only at main's pin (R01).
12. The general Evens norm (13.2): not statable. It is named in the module docstring `:58`–`:65`, which says the cohomological norm is a construction. Correct.

No statable headline is absent.

**Padding.** Eight theorems close with one library term:
- `galoisSubgroup_index` (`:238`), `cup_add_left` (`:355`), `cup_coeffMap` (`:366`);
- `inhomogeneousCochain2_d_eq_zero` (`:409`), `cochainClass_inhomogeneousCochain2_eq_of_coboundary` (`:420`);
- `wreathD16Cocycle_isCocycle` (`:489`), `continuous_wreathD16Cocycle_indexTwoInd` (`:504`), `galoisRes_eq_zero_iff` (`:574`).

Most abbreviations are aliases of this kind as well. All of them are names that roadmaps on main read through this module (README `:3599`–`:3644`). Deleting them breaks main's `ClassFieldTheory` and `QuadraticFormInvariants` builds, as PRREVIEW-ProfiniteCohomology~5 found. I do not raise them. Whether that exception to the acceptance-test shape stands is the human's decision.

**Adversarial table** (values computed here; "both sides" means the two sides of the statement, or the statement and its wrong model):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 continuous section | `ℤ_p → ℤ/p`, representatives `0…p−1`, `p = 2`; `ℝ → ℝ/ℤ`; empty closed set to the empty target | `s(1) + s(1) = 2 ≠ s(0) = 0`, so continuous but not homomorphic; no continuous section of the circle; one extension to a point, zero to `∅` | consistent | none |
| 1.1 carrier, degree 0 | `G = 1`, `ℤ`; `C₂` on `𝔽₃`, trivial and sign | `H⁰ = ℤ` with `1 ↦ 1`; `#H⁰ = 3` and `1` | consistent | none |
| 1.5 inflation | `C₂ → C₄`, nonzero `𝔽₂` character | values at `1, σ, σ², σ³` are `0, 1, 0, 1` | consistent | none |
| 3.2 degree-1 chain correspondence | `C₂`, `𝔽₂`, `c = id` character | `f(1,s) = 1`, `f(s,1) = s·c(s) = 1`, `f(1,1) = f(s,s) = 0`; `f(1, g)` returns `(0, 1)` | correct, but stated narrower than the pin | R03 |
| 3.3 discreteness | `∏ℕ C₂`, `𝔽₂`; `C₂` | `k` evaluations cut `⊕ℕ 𝔽₂` to codimension `≤ k`, so a nonzero character survives; both models have `#H¹ = 2` for `C₂` | consistent; no locator | R04 |
| 4.3 coefficient colimits | `ℤ_p`, `ℚ_p/ℤ_p = colim p⁻ᵏℤ/ℤ`; discrete `⊕ℕ ℤ` into `⊕ℕ ℤ/p` | `H¹ = ℚ_p/ℤ_p = colim ℤ/pᵏ`; reduction mod `p` lies in no finite stage, so compactness is needed | consistent; no locator | R04 |
| 5.5 five-term | `C₂ ⊂ C₄`; `C₃ ⊂ C₉` with `f(i) = ⌊i/3⌋`; `C₂ ⊂ C₂ × C₂` | `res(parity)(σ²) = 0`, so `tg` is injective; `d¹f(2,1) = 0 − 1 + 0 = 2 = −carry(2,1)`; split case `tg = 0` | consistent, sign pinned | none |
| 6.1 transversal word | `C₄ ⊇ C₂`, `t = {1, s}` | `ℓ_U(s) = s · t(sU) = s²`; `ℓ_{sU}(s) = 1` | consistent | none |
| 6.3 `cor¹(res f) = (G:U)f + d⁰c` | `C₂ ⊇ 1`, sign `ℤ`, `f(s) = a` | left side `0`; right side `2a + (−a − a) = 0`; with `− d⁰c` it would be `4a ≠ 0` | sign pinned | none |
| 6.4 Mackey | `S₃`, `U = V = ⟨(12)⟩`, `H⁰(ℤ)` | double cosets of sizes `2, 4`; Mackey subgroups `V, 1`; right side `1 + 2 = 3 = (G:U)`; single cosets give 3 summands; `V ∩ U` every time gives `1 + 1` | consistent | none |
| 8.3 graded commutativity | `C₂ × C₂ = ⟨a, b⟩`, `𝔽₂`, characters `x, y` | `(x⌣y)(a,b) = 1`, `(y⌣x)(a,b) = 0`, so the cochains differ; `c = xy` gives `dc(a,b) = 0 − 1 + 0 = 1 = (x⌣y + y⌣x)(a,b)` | class-level only, as stated | none |
| 8.4 projection formula | `C₂ ⊇ 1`, degree `(0,0)`, `ℤ` | `cor(res a · b) = 2ab = a · cor b` | consistent; Tau Ceti declarations uncited | R02 |
| 9.5 Hilbert 90 | `ℂ/ℝ` | `ker N = S¹`, and every `z ∈ S¹` is `w/w̄` with `w² = z`, so `H¹ = 0` | consistent | R05 (names) |
| 10.2 filtered colimits | `ℤ_p`, `ℚ_p/ℤ_p` | `H¹(ℤ_p, colim) = ℚ_p/ℤ_p = colim H¹`; the pinned theorem needs `CompactSpace` and `UnivLE` | hypotheses missing from the README | R04 |
| 10.4 dimension shift | `C₂`, sign `ℤ` | `H²(ℤ_sign) = M^G/NM = 0 = H¹(ℤ)`; `H³(ℤ_sign) = ker N/(s−1)M = ℤ/2 = H²(ℤ)` | consistent | none |
| 10.6 closed-subgroup descent | `ℤ_p ⊇ 0`, `𝔽_p`, `x` = reduction mod `p`; `𝔽₂ ↪ 𝔽₂[C₂]` | `res₀ x = 0` and `x(pa) = 0` on `pℤ_p`; `H¹(C₂, 𝔽₂[C₂]) = 0` kills `H¹(C₂, 𝔽₂) = 𝔽₂` | consistent | none |
| 11.1 checks | `G = 1`, `ℤ_p`, `C_p` | `cd = scd = 0`; `cd_p = 1` and `scd_p = 2` (`H²(ℤ_p, ℤ)(p) = ℚ_p/ℤ_p`); `⊤ + 1 = ⊤` | consistent | none |
| 11.2 universe equality (headline) | `G = 1`, `ℤ_p`, `C_p`; `u = 0` and general `u` | `0 = 0`, `1 = 1`, `⊤ = ⊤`; at `u = 0` a single term; general `u`: `rfl` fails | true, not padding | none |
| 11.4 simple modules | `𝔽_p²` and `ℤ/p²` with trivial action; sign `𝔽₃` on `C₂` inflated to `C₄` | proper line `⟨(1,0)⟩`; proper `pℤ/p²`; submodules `{0, 𝔽₃}` before and after inflation | consistent; proved at the pin | R02 |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p`, `p = 2, 3`; `V = G`; `ℤ_p × C_ℓ ⊇ ℤ_p`; `C_p ⊇ 1`; `ℤ_p² ⊇ pG` | `#H² = p = p^{v_p(p)}`; `1 = p⁰`; `1 = p^{v_p(ℓ)}`; `0 ≠ p`, excluded by `scd_p = ⊤`; `p⁴ ≠ p²` with `scd = 3` | hypotheses exact | R01 |
| 13.1 index two | `C₄ ⊇ ⟨σ²⟩`, `α ≠ 0`; `S₃ ⊇ C₂`; `C₄` | `b₁ = 0, 1, 1, 0`, `b₁(σ²) = 1 ≠ 0 = 2b₁(σ)`; `res` and `cor` bijective on `𝔽₂`, so the sequence is not exact at `H¹(U)`; `χ² = 0` in `𝔽₂[χ,u]/χ²` | consistent | none |
| 13.2 general norm (not statable) | `C₃ × C₂ ⊇ C₃`, `𝔽₃` | `res N(a) = a² ≠ 0`; `N(2a) = 4N(a) = N(a) ≠ 2N(a)`; `res(1 + cor a + Na) = 1 + 2a + a² = (1+a)²` | consistent | none |
| 13.3 `N(res y) = y² + χy` (headline) | `ℂ/ℝ` with `y = χ, 0`; `𝔽₉/𝔽₃`; `D₈ ⊇` Klein group, `y = χ_U` | `N(0) = 0 = χ² + χ²`; `H²(Ẑ, 𝔽₂) = 0` on both sides; wrong model `y²` gives `x² + y² ≠ 0` in `𝔽₂[x,y,w]/(xy)` | identity holds | R01 |
| 7.1 Frobenius reciprocity (R02) | `H = G` | `Coind_G^G A ≅ A`, so both hom sets are `Hom_G(M, A)`; the pinned `smoothDiscreteResCoindHomEquiv` has exactly this shape | proved at the pin | R02 |

## Not verifiable

- **Neukirch–Schmidt–Wingberg**, *Cohomology of Number Fields*, 2nd ed.
  - A. Schmidt's page offers the book as a PDF free for non-commercial use (Version 2.3, May 2020). The sources service, given that PDF's URL, returned only the landing page, so I could not read the text.
  - The NSW locators are therefore unverified: (1.2.2), (1.2.5), (1.3.2), (1.4.x), (1.5.1)–(1.5.7), (1.6.1), (1.6.4) with the p. 61 footnote, (1.6.7), (3.3.1)–(3.3.5), (3.3.11), (3.6.1)–(3.6.4) and (6.2.1).
  - I checked their mathematical content on the instances in the table and against the pinned declarations, several of which cite the same numbers.
  - A human could add the author-hosted PDF to the manifest.
- **Ribes–Zalesskii, Koch, Serre (*Galois Cohomology* and *Local Fields*) and Brown.** These are Springer texts. They are not in the sources cache, earlier rounds found no legal copy through the sources service, and I found no author-hosted copy. Ribes–Zalesskii Prop. 2.2.2 (0.3) and Cor. 7.2.5(a) (5.5), Koch Thm. 3.14 and 3.10, Serre *Local Fields* VII §7 Prop. 6, and Brown V (3.6) and (3.8) are unverified.
- **Main's pin.** The brief's Lean commands run only in this worktree, which is built at `358314d4`. R01's two repair terms are justified by comparing binders and conclusions at `2fd255d9` (`Sylow.lean:156`, `EvensNorm.lean:143`); I did not elaborate them.
- **The two Completed importers** are not in the worker's targeted build, and the brief's commands do not cover building them. Their uses of this module were checked statically (see "Consumers").

## Source issues

- none
