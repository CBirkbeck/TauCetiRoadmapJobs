# Review of ProfiniteCohomology (pull request #616 at c3ef204)

**Verdict:** needs changes

This is the head the previous review read: `TauCetiRoadmap/ProfiniteCohomology/` has 0 changed lines since `c3ef204`, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty. The previous review had one finding, R01 (pin lag). It is not repaired: the folder is unchanged, and the reply (H01) accepts the facts but says the repair is a merge the repair worker may not make. I still hold R01 and re-raise it below with recounted numbers. The reason it needs a human is given there. The full pass found four new P3 findings (R02–R05). All four can be fixed by editing the folder.

## R01 (P2) — 63 cited Tau Ceti names and 21 cited module files do not exist at the branch's pin; at main's pin, two `sorry`s restate proved theorems

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:33`–`:36`: "the headline theorems of the roadmap that the pinned libraries do not yet prove, each with `sorry`". Also `:44`–`:51`, `:76`–`:83`, and the `sorry`s at `:315` and `:574`.
- `README.md:37`–`:38`, `:50`–`:60` and `:590`–`:603`.
- Citations made at main's pin in 4.3 (`:1368`–`:1379`), Layer 6 (`:1672`–`:1677`), 11.8 (`:3133`–`:3145`), 13.2 (`:3744`–`:3763`) and Worked examples (`:3899`–`:3961`).

**Claim:** `lake-manifest.json` on this branch pins Tau Ceti `358314d4`, while main (`a94a93c`) pins `2fd255d9`. The folder cites Tau Ceti as it is at `2fd255d9`.

I recounted at this head by matching the README's 681 backticked qualified names against a declaration index of each pin. 63 Tau Ceti names have no declaration at `358314d4`, and all 63 have one at `2fd255d9`. Among them:
- `TauCeti.abelianizationProPClass_generates`, `TauCeti.galoisEvens_galoisRes`, `TauCeti.galoisRes_galoisEvens` and `TauCeti.galoisEvens_add`;
- `OpenSubgroup.evensNorm` and its 10 companions, with `OpenSubgroup.indexTwoDelta_eq_cup_character` and `OpenSubgroup.exact_cup_res_of_index_two`;
- `TauCeti.ContCohomology.explicitH0Functor_preservesFilteredColimits` and `TauCeti.SmoothDiscreteTopRep.isColimitContinuousCohomologyFGSubrepresentationCocone` (4.3);
- `TauCeti.ContinuousCohomology.res_comp_conjMap` and the three `explicitMap*_explicitRes*_of_conj` (Layer 6);
- `TauCeti.cyclicBockstein_cup`, and the eight `TauCeti.zHat.*` names of Worked examples.

I checked 24 cited module files. Of these, 21 exist only at `2fd255d9`: `Coefficients/FilteredColimits`, `Coefficients/FinitelyGenerated`, `SmoothDiscrete/Products`, `SmoothDiscrete/Subquotients`, the four `Conjugation/*`, `Evens/Norm/Basic`, `ClassModule/Sylow`, `ClassModule/CoprimeRestriction`, `Bockstein/Leibniz`, `Cup/TrivialF2/CyclicTwo`, `Shapiro/Corestriction`, `GaloisCohomology/FiniteField`, `MuTwo/Real`, `MuTwo/Rational`, and the four `ZHat/*` files. The class-module subfolder `ClassModule/PGroup/` (a directory) is also absent at `358314d4`.

At `2fd255d9` the statements at `Suggested.lean:309` and `:568` are proved theorems: `TauCeti.abelianizationProPClass_generates` (`ClassModule/Sylow.lean:156`–`:160`) and `TauCeti.galoisEvens_galoisRes` (`GaloisCohomology/EvensNorm.lean:143`–`:149`). Once the branch takes that pin, the two `sorry`s restate proved theorems and the docstring's "do not yet prove" is false. So the folder is wrong at either pin.

**Why the reply does not settle it:** The reply is right that the repair starts with merging `origin/main`, which rewrites `lake-manifest.json`, and that the repair worker may not make that merge. That settles who must act, not whether the folder is correct. At its own pin the folder cites declarations that do not exist, and the pull request cannot merge without this merge anyway:
- `gh pr view 616` reports `CONFLICTING`;
- `git merge-tree --write-tree --name-only HEAD origin/main` lists only this folder's `README.md` and `Suggested.lean`.

The finding is held so that the roadmap goes to the author or an operator. It is this review's only blocking finding.

**Witness:** At `358314d4` no file declares `abelianizationProPClass_generates`, and `CohomologicalDimension/ClassModule/` holds only `Basic`, `ChangeOfGroup`, `Cyclic/`, `Inflation` and `Transfer/`. At `2fd255d9`, `Sylow.lean:156` declares `theorem abelianizationProPClass_generates (hp : p.Prime) (h : strictCohomologicalDimensionAt.{u} p G ≤ 2) (hV : IsOpen …)`.

**Repair:** The author or an operator does this, not the folder's repair worker:
1. Merge `origin/main` into the branch, keeping this branch's text in the two conflicting files.
2. Replace the `sorry` at `Suggested.lean:315` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`, and the one at `:574` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`.
3. Rewrite `:33`–`:36` and `:76`–`:83` so that the two universe theorems (`:275`, `:283`) are the only `sorry`s.
4. Re-run the gate with the build.
5. Update the pull-request description. It still describes `CohomologyUniverseComparison.lean`, `DimensionNormalization.lean`, "19 admitted targets" and Tau Ceti `a91d3aaf`, none of which is at this head.

What I checked for this repair: every `TauCeti.*` name used in the code of the branch's `Suggested.lean`, and all 26 of its `TauCeti.*` imports, exist at `2fd255d9`. I did not elaborate the file at main's pin (see Not verifiable).

## R02 (P3) — Layer 6 cites the conjugation–corestriction theorems without their profiniteness hypothesis, and the 6.5 target has no locator

**Location:**
- `README.md:1679`–`:1685`: "`TauCeti.ContinuousCohomology.map_comp_corestriction_of_conj` and `TauCeti.ContCohomology.explicitCor2_explicitMap2_of_conj` … for a discrete continuous `G`-module, open finite-index `U`, `V = gUg⁻¹`, the pair … equals corestriction from `U`."
- `:1775`–`:1777`: "with their full discrete-coefficient hypotheses".
- The 6.5 target paragraph, `:1777`–`:1785`.

**Claim:**
- Layer 6 is stated for a topological group `G` with an open `U` and a finite quotient (`:1638`–`:1641`). Both cited theorems additionally need `G` profinite, and the README does not say so.
- The degree-one target of 6.5, a remaining target, carries no source locator and no route. The brief requires one for every target.

**Witness:** `Corestriction/Conjugation.lean:88`–`:89` (`map_comp_corestriction_of_conj`, `:192`) and `:404`–`:405` (`explicitCor2_explicitMap2_of_conj`, `:415`) at `358314d4` both read `variable … [CompactSpace G] [TotallyDisconnectedSpace G]`. Discrete `G = ℤ`, `U = 2ℤ` meets the README's stated hypotheses, but neither theorem applies to it.

**Repair:**
- At `:1684`, write "for a profinite `G` (`[CompactSpace G] [TotallyDisconnectedSpace G]`), a discrete continuous `G`-module, …".
- At `:1777`, write "with their profiniteness and discrete-coefficient hypotheses".
- In 6.5, either give a locator for the invariance of corestriction under conjugation, or say, as 3.3 does, that no textbook locator is used and give the route. The route I checked: with the transversal `t_V(xV) = t_U(xgU) g⁻¹` one gets `ℓ^V_{xV}(γ) = g ℓ^U_{xgU}(γ) g⁻¹`. The two degree-one cochains then agree term by term, and `explicitCor1_changeTransversal` removes the choice. This route needs no compactness, so the degree-one target can keep its general hypotheses.

## R03 (P3) — 1.7 plans an `R`-linear instance on `continuousCochainsFunctor` that neither pin has and the remaining-target list omits

**Location:** `README.md:928`–`:935`: "use the `φ = id` cases to equip `…continuousCochainsFunctor` and `…continuousCohomologyFunctor` with additive and `R`-linear functor instances … Tau Ceti has them as … `continuousCochainsFunctor_additive`". The remaining-target list is `:50`–`:59`.

**Claim:** Three of the four instances exist; the `Linear R` instance on the cochain functor does not. It is not on the list at `:50`–`:59`, which claims to name every target the pin lacks.

**Witness:** At `358314d4`, `Additive.lean` has `continuousCohomologyFunctor_additive` (`:222`), `continuousCohomologyFunctor_linear` (`:321`) and `continuousCochainsFunctor_additive` (`:347`), and no other instance on `continuousCochainsFunctor`. At `2fd255d9` the same holds (`:409`).

**Repair:** Do one of the following:
- add "the `R`-linear functor instance on `TauCeti.ContinuousCohomology.continuousCochainsFunctor` (1.7), from `cochainsMap_smul`" to the list at `:50`–`:59`; or
- narrow `:928`–`:929` to "additive functor instances on both functors and an `R`-linear instance on `continuousCohomologyFunctor`".

## R04 (P3) — Three layer dependencies point the wrong way or are missing

**Location and claim:**
1. `README.md:1443` gives Layer 4 the line "*Needs:* The canonical colimit contract of Layer 10." But Layer 10 needs Layer 4 (`:2533`, and 10.1's *Needs:* at `:2576`: "Layer 4 finite-quotient system and descent"). That is a coarse 4 ↔ 10 cycle. Layer 4's own Dependencies (`:1464`) say "Layers 2 and 3". Line 4.4 (`:1406`–`:1407`) also states the colimit description for every `i ≥ 1`, which is 10.1's.
2. `:1534`–`:1536` calls `explicitIso_delta0` and `explicitIso_delta1` "milestones of this layer" (Layer 5). But the table at `:266` and 10.3 (`:2618`–`:2619`) place them in Layer 10, where `DiscreteShortExact.delta` first exists.
3. Layer 13's input line (`:3555`) and Dependencies (`:3874`) list only Layers 10 and 12. 13.3's *Needs:* (`:3862`) uses "Layer 9's Galois group and coefficients", and Layer 9 is not reached through Layers 10 and 12. The dependency closure of 12 and 10 is {0, 1, 2, 3, 4, 5, 6, 7, 8, 10}.

**Witness:** The layer lines quoted above. The transitive closure was computed from the eleven "This roadmap:" lines.

**Repair:**
1. Delete `:1443` (4.2's direct route needs nothing from Layer 10). In 4.4, write "for `i = 1, 2` (4.2); every degree is 10.1".
2. At `:1536`, write "which are milestones of Layer 10 (10.3) and not of the consumer's".
3. Add Layer 9 to `:3555` and `:3874`.

## R05 (P3) — Empty section heading

**Location:** `README.md:166`: "### Boundaries with neighboring roadmaps", followed directly by "### With the representation theory family" (`:168`) at the same level.

**Claim:** The heading has no body, and the three `###` sections after it are its siblings, not its children.

**Witness:** Lines 166–168. It is the only same-level heading pair with nothing between them in the README.

**Repair:** Delete `:166`, or merge it into `:168` as "### Boundary with the representation theory family".

## Verified sound

**Gate and build.**
- My gate run, `gate … ProfiniteCohomology --base origin/main`: every check `0`, `OK`. The worker's run with the targeted build: `build=0`, `OK`.
- `lake env lean` on `Suggested.lean`: exit 0 in 39 s, with exactly four `declaration uses sorry` warnings, at `:275`, `:283`, `:309` and `:568`.

**Dependency check.**

```text
depcheck: 235 roadmaps, 2258 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The only roadmap supplier is `RepresentationTheory/InductionRestriction`, which is on main. Its cited sections exist there: "What Mathlib already has (consume)" at `:101` and Layer 0 at `:213`.

**Signatures and padding probe.**
- I put a `#check @` for each of the 56 declarations in a scratch copy, together with a one-tactic probe (`first | rfl | simp | infer_instance | decide | norm_num`) in place of each `sorry`, and elaborated it once.
- No `variable` block exists, and every type carries its own binders. They match the README:
  - `abelianizationProPClass_generates`: `[Fact p.Prime] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : scd_p p G ≤ 2) (V) [V.Normal] (hV : IsOpen ↑V)`;
  - `explicitH2IsoContinuousCohomology`: `[CompactSpace G]` only;
  - `explicitFiniteQuotientColimit2`: both compactness classes;
  - the universe theorems: `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]` only, as 11.2 says.
- All four probes fail. Both universe goals print as `cohomologicalDimensionAt p G = cohomologicalDimensionAt p G` (universes hidden) and stay unsolved. `:309` and `:568` are left with their full goals. None of the four is padding.
- The proved one-term theorems (`galoisSubgroup_index`, `cup_add_left`, `cup_coeffMap`, `inhomogeneousCochain2_d_eq_zero`, `cochainClass_inhomogeneousCochain2_eq_of_coboundary`, `wreathD16Cocycle_isCocycle`, `continuous_wreathD16Cocycle_indexTwoInd`, `galoisRes_eq_zero_iff`) are not padding in the brief's sense. Four roadmaps on main import this module and use these names: `QuadraticFormInvariants`, `ClassFieldTheory`, `Completed/ProfiniteProPGroups` and `Completed/LocalGaloisGroups`. Deleting them breaks those builds.
- `WreathC2.sectionTable` agrees with `TauCeti.wreathSection_apply` (`DihedralSixteen.lean:350`–`:358`) on all 8 coordinate triples.

**Library declarations opened at the branch pin `358314d4`** (Mathlib `f6090c70`):
- **0.3:** `exists_continuous_section` and `exists_continuous_section_of_le` (`Profinite/Section.lean:230`, `:257`, both under `[CompactSpace G] [TotallyDisconnectedSpace G]`); `ContinuousMap.exists_extension_of_discrete [Nonempty Y]` (`Separation/Profinite.lean:163`); `exists_openSubgroup_le_res_eq_zero` (`ClosedSubgroup.lean:213`).
- **1.1:** Mathlib's `structure TopRep` with `V : Type w` (`TopRep.lean:31`) and `TopRepEquivActionTop` (`:213`). `continuousCohomology n A` is defined as `(homogeneousCochains A).homology n`, with `d_succ = coind₁ι − coind₁Functor.map (d n)` (`ContCohomology/Basic.lean`), which is the recursion 11.2's route uses.
- **1.7:** `cochainsMap_add`, `cocyclesMap_add`, `map_zero`, `map_add`, and `cochainsMap_smul`, `cocyclesMap_smul`, `map_smul` under `[CommRing R]` (`Additive.lean:94`–`:177`). Mathlib's `Additive`/`Linear` instances on `invariantsFunctor` and `coind₁Functor` (`TopRep.lean:238`–`:254`), as 1.7 says.
- **3.2:** the variables at `CohomologyComparison.lean:101` (any topological group), `explicitH1AddEquivContinuousCohomology` (`:134`), `[LocallyCompactSpace G]` (`:203`) for `explicitH2AddEquivContinuousCohomology` (`:232`), and `[CompactSpace G]` (`:318`) for the two `Iso`s (`:327`, `:414`). `explicitH0IsoContinuousCohomology` (`ContinuousCohomologyIso.lean:165`). The three `cochainEquiv`s and six lemmas are in `CochainComparison.lean`. `DiscreteH1`/`DiscreteH2` are in `LowDegree.lean`, and `discreteTopology_continuousCohomology` in `CompactDiscrete.lean`.
- **5.5:** all 17 named declarations, in `FiveTerm.lean`, `Transgression.lean` and `Inflation/Basic.lean`.
- **6.1:** `lWord` is defined as `(t u)⁻¹ * γ * t (γ⁻¹ • u)` (`GroupTheory/TransversalWord.lean:71`); `transversal_mul_lWord` (`:80`), `lWord_mul_lWord` (`:92`), `lWord_mem` (`:134`); `continuous_lWord (hU : IsOpen …)` (`Topology/…/TransversalWord.lean:45`).
- **8.1, 8.2, 8.4:** the six cups (`Cup/Product.lean:232`–`:595`); ten `explicitCup_assoc*` and ten `_mul` theorems, all in `Cup/Product.lean`; the six `explicitRes*`, `explicitInfl*`, `explicitMap*` and `explicitCoeff*` cup theorems; `explicitCup_projection` with five shapes.
- **9.1:** `AbsoluteGaloisGroup := Gal(SeparableClosure K/K)` (`AbsoluteGaloisGroup/Basic.lean:312`); `absoluteGaloisGroupRestrictEquiv : Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K` (`:325`), compatible with the action by `coe_absoluteGaloisGroupRestrictEquiv_apply` (`:338`). Mathlib `TotallySeparatedSpace Gal(L/K)` (`KrullTopology.lean:224`) and `CompactSpace Gal(K/k)` for Galois `K/k` (`Galois/Profinite.lean:329`).
- **9.5:** `subsingleton_H1_additive_units [IsGalois K L]` (`Hilbert90.lean:186`), which is the first step for any Galois `L/K`; `hilbert90` (`:245`, canonical `H¹` at `UnitsCoeff K` is zero).
- **10.4:** `shapiroCochainMap`, `shapiroMap` and the three `explicitH*_shapiroMap` (`Shapiro/Canonical.lean`; `[CompactSpace G]` at `:251`, `[LocallyCompactSpace U]` at `:268`); `isIso_shapiroMap`, `quasiIso_shapiroCochainMap`, `shapiroIso`, `shapiroIso_hom` and the `TopRep` forms (`Shapiro/AllDegrees.lean`); `coindAcyclic` (`Coinduced/Acyclic.lean`); `coindShortExact` and `CoindQuotient` (`Coinduced/Quotient.lean`); `transIsoBot` (`Coinduced/Transitivity.lean`); `restrictScalarsIntIso`; `dimensionShiftIso` (`DimensionShifting/Basic.lean`).
- **11.2:** `CohomologicalDimensionLE` quantifies over `M : Type (max u v)` (`CohomologicalDimension/Basic.lean:131`), as do `StrictCohomologicalDimensionLE` (`:139`), `cohomologicalDimensionAt` (`:146`) and `strictCohomologicalDimensionAt` (`:151`). `leastENatBound` is at `Data/ENat/LeastBound.lean:39`, and Mathlib's `moduleCatLeftHomologyData` at `ShortComplex/ModuleCat.lean:102`.
- **6.5 (R02):** `Corestriction/Conjugation.lean:88`–`:89`, `:192`, `:404`–`:415`. No `explicitCor1*_of_conj` exists at either pin.

**At `2fd255d9`** (main's Tau Ceti):
- `Conjugation/Restriction.lean:42`–`:45` and `:68`–`:72` (any subgroups `U`, `V` with `κ v = g⁻¹ v g`), and `Conjugation/AllDegrees.lean:284` (`res_comp_conjMap [LocallyCompactSpace G]`). Both match Layer 6.
- `Coefficients/FilteredColimits.lean:62`–`:302`: the three functors, their isomorphisms (degree two under `[LocallyCompactSpace G]`), and preservation under `[CompactSpace G]`, as 4.3 says.
- `Coefficients/FinitelyGenerated.lean:212`.

**Cross-roadmap citations resolved on main (`a94a93c`):**
- ClassFieldTheory "Layer 6: the local class formation and finite local reciprocity" (`:1220`);
- Completed/LocalGaloisGroups "Exact supplier contracts" (`:97`), Layer 7 (`:654`) and Step 3 (`:723`);
- Completed/ProfiniteProPGroups Layers 5, 6 and 7 (`:885`, `:1246`, `:1440`);
- QuadraticFormInvariants "Layer 9: transfer and the relative Stiefel-Whitney formula" (`:2797`);
- RepresentationTheory/InductionRestriction, as above.

The four importers of this module on main are the four that Downstream consumers lists.

**Overlaps and ownership.**
- `scratch/overlaps.md`: no cited id is dropped, none is defined only by an open revision, and no id this pull request drops is cited elsewhere; the old → new list at `:4044`–`:4076` covers 18 names.
- #1187 is the conflicting head. It is `OPEN` and `CONFLICTING`, its Tau Ceti pin `ab00ba392` is older than main's, and the order between the two was stated in an earlier reply.
- ProfiniteCohomologyPartII (open) owns Massey products and the all-degree inhomogeneous cochain algebra. This roadmap places that algebra out of scope at `:112`–`:114`, so there is no overlap.
- AnabelianGeometryAndNonabelianChabauty §0.19 compares its nonabelian `H¹` with `explicitFiniteQuotientTransition1`. That is not 4.2's agreement with `finiteLevelTransition`.
- `roadmaps grep` for the Evens norm, the universe comparison and the 4.2 transitions found no second owner of the remaining targets of `:50`–`:59`.

**Sources.** MilneADT is in the sources cache. Line 251 places Tate groups at finite `G`, and lines 291–302 give (0.1.1)–(0.1.6) for a bilinear `G`-equivariant pairing, with (0.1.6) `Inf(x ⌣ y) = Inf x ⌣ Inf y`. This matches 8.4's "Milne (0.1.6) for finite `G`". Lines 242–245 give the continuous-cochain convention on printed p. 2, as References says.

**Seeded sample** (the values are in the table):
- **0.3:** Tau Ceti's section, its `_of_le` form and the extension lemma exist with profinite hypotheses; the Checks recompute. Ribes–Zalesskii Prop. 2.2.2 is not readable.
- **1.1:** the carrier and functor facts are confirmed at the pin.
- **1.7:** the laws exist; one instance is missing (R03).
- **3.2:** the generality matches the four declarations; the chain formulas and the differentials recompute; NSW (1.2.2) is uncertified.
- **4.3:** the cited package exists only at `2fd255d9` (R01), with the stated hypotheses; NSW (1.5.1) and Serre GC I §2.2 Prop. 8 are uncertified.
- **5.5:** the 17 names resolve; the `C₃ ⊂ C₉` sign recomputes; NSW (1.6.7), Ribes–Zalesskii Cor. 7.2.5(a) and Koch Thm. 3.14 are not readable.
- **6.1:** the definition and cocycle law match `TransversalWord.lean`.
- **6.5:** see R02.
- **8.1, 8.2, 8.4:** the names exist; there are 10 associativity instances; Milne (0.1.6) is verified; NSW and Brown are not readable.
- **9.1, 9.5:** confirmed; NSW (6.2.1) is uncertified.
- **10.4:** confirmed; NSW (1.6.4) and (1.3.7) are uncertified.
- **11.2:** the statement and route names resolve; the probe shows it is not definitional.

**Headline theorems.**
1. The comparisons, finite-quotient colimit, exact sequences, all-degree Shapiro and corestriction, graded cup, Hilbert 90, Kummer, and the ordinary and strict dimension criteria are proved at the pin and cited.
2. The universe independence (11.2) is stated at `:275` and `:283`.
3. NSW (3.6.4) (11.8) is stated at `:309`; it is proved at `2fd255d9` only (R01).
4. Evens identity 5 for `L/K` (13.3) is stated at `:568`; it is proved at `2fd255d9` only (R01).
5. The general Evens norm (13.2) is not statable at the pins, and the docstring at `:58`–`:66` says why. `OpenSubgroup.evensNorm` is `𝔽₂`-only, so stating laws for it would be a stand-in.

No headline that is statable at the pins is missing.

**Adversarial table** (values computed here):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 continuous section | `ℤ_p → ℤ/p`, representatives `0..p−1`; `ℝ → ℝ/ℤ`; empty closed subspace | `s(p−1)+s(1) = p ≠ 0 = s(0)`, so the section is continuous but not a homomorphism; a homomorphic section `ℤ/p → ℤ_p` is `0` (torsion into torsion-free); an injective continuous map `S¹ → ℝ` is impossible; extensions to one point: 1, to `∅`: 0 | consistent | none |
| 1.1 carrier | `G = 1`, `ℤ`; `C₂` on `𝔽₃`, trivial and sign; `X = 0` | `H⁰ = ℤ`, class `1`; `#H⁰ = 3`, sign `#H⁰ = #{0} = 1`; `0` | consistent | none |
| 1.7 additivity | `G = 1`, `f = g = id_ℤ`, `n = 0`; `r = 3` | `map(f+g)(1) = 2 = 1+1`; `map 0 (1) = 0`; `map(3f)(1) = 3`; linear instance on cochain functor: absent at both pins | laws hold | R03 |
| 3.2 generality | `ℚ_p`; `⊕ℕ𝔽₂ ⊂ ∏ℕ𝔽₂`; `G = 1` | `ℚ_p` locally compact, not compact; `⊕ℕ𝔽₂` dense and not closed, hence not locally compact, with continuous characters `⊕ℕ𝔽₂` (countable) against all characters `∏ℕ𝔽₂`; `f(1,1) = 1•c(1)` | consistent | none |
| 3.2 chain formulas | homogeneous `f(g₀,g₁) = g₀ c(g₀⁻¹g₁)`, degree 2 `c(g,h) = f(1,g,gh)` | `f(hg₀,hg₁) = h f(g₀,g₁)`; `df(1,g) = g m − m = d⁰m(g)`; `df(1,g,gh) = g c(h) − c(gh) + c(g) = d¹c(g,h)` | conventions match | none |
| 4.3 coefficient colimits | `ℤ_p`, `X_k = p⁻ᵏℤ_p/ℤ_p`; `⊕ℕℤ`; `λ` the `b`-coordinate | stages `ℤ/pᵏ` with colimit `ℚ_p/ℤ_p = H¹`; `x ↦ λ(x)/p` gives `f(1) = 0`, `f(b) = 1/p ≠ 0`; `(ℤ/pᵏ)^ℕ` has colimit the bounded sequences, while `(p⁻ᵏ)_k ∈ (ℚ_p/ℤ_p)^ℕ` | consistent | none |
| 5.5 transgression | `C₂ ⊂ C₄`, `𝔽₂`; `C₃ ⊂ C₉`, `f(i) = ⌊i/3⌋`; split `C₂ ⊂ C₂²`; `N = G` | inflation `H¹(C₂) → H¹(C₄)` is onto, so `res = 0` and `tg: 𝔽₂ ↪ 𝔽₂`; `d¹f(2,1) = f(1) − f(3) + f(2) = 0 − 1 + 0 = 2 = −carry(2,1)`; `tg = 0`; `H²(1) = 0` | sign pinned | none |
| 6.1 transversal word | `C₄ ⊇ C₂`, `t = {1,s}`; `U = G`; `S₃ ⊇ 1` | `ℓ_U(s) = s·t(s³U) = s·s = s²`; `ℓ = γ`; `u⁻¹γγ⁻¹u = 1`; cocycle law `ℓ_u(γ)ℓ_{γ⁻¹u}(η) = ℓ_u(γη)` expands to the identity | consistent | none |
| 6.5 conjugation/corestriction | `S₃`, `U = ⟨(12)⟩`, `g = (13)`, `V = ⟨(23)⟩`; degree 1 in general | degree 0: both routes `1 ↦ 3`; degree 2: `res∘cor x = x + cor₁res₁x = x ≠ 0`; degree 1: with `t_V(xV) = t_U(xgU)g⁻¹`, `ℓ^V = gℓ^U g⁻¹` and the terms agree; cited theorems need compact, totally disconnected `G`, while discrete `G = ℤ` falls outside them | statement true; contract hypotheses missing | R02 |
| 8.1 six shapes | `G = 1`; `C₂`, `𝔽₂`; zero pairing | `(2,3) ↦ 6`; `(χ⌣χ)(s,s) = 1`, the generator of `H²(C₂,𝔽₂)`; zero pairing gives `0` | consistent | none |
| 8.2 associativity | `(0,1,1)`, `(1,0,1)` on cochains; count | both sides `μ₂(μ₁(x,y g), g z h) = ν₂(x, ν₁(y g, g z h))`; `(1,0,1)` uses `g ν₁(y, z h) = ν₁(g y, g z h)`; triples with sum `≤ 2`: `1 + 3 + 6 = 10` | consistent | none |
| 8.4 compatibilities | `C₂ ⊇ 1`, `(0,0)`, `ℤ`; Milne finite `G` | `cor(res a · b) = 2ab = a · cor b`; (0.1.6) at MilneADT lines 291–301 | consistent | none |
| 9.1 Galois group | `ℂ`; `ℝ`; `𝔽_p(t)` | `#G = 1`; `#G = 2`, `i ↦ −i`; `t^{1/p}` fixed by `Aut(K̄/K)` | consistent | none |
| 9.5 Hilbert 90 | `L = K`; `ℂ/ℝ` | `H¹(1) = 0`; unit-circle `z = e^{iθ} = w/w̄` with `w = e^{iθ/2}`, so `H¹ = 0` | consistent | none |
| 10.4 Shapiro and shifts | `C₂`, `H = 1`, `𝔽₂`; sign `ℤ` on `C₂`, `i = 1, 2` | degree-0 cochains of orders `4` against `2`, so the complexes are not isomorphic; `H²(ℤ_sign) = 0 ≅ H¹(ℤ) = 0`; `H³(ℤ_sign) = ℤ/2 ≅ H²(ℤ) = ℤ/2` | consistent | none |
| 11.2 universe equality (headline) | `G = 1`, `ℤ_p`, `C_p`; `u = 0`; general `u` | `0 = 0`, `1 = 1`, `⊤ = ⊤`; at `u = 0`, `rfl`; probe at general `u`: `rfl`/`simp` fail | true, not padding | none |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p` at `p = 2, 3`; `V = G`; `ℤ_p × C_ℓ ⊇ ℤ_p`; `C_p ⊇ 1`; `ℤ_p² ⊇ pℤ_p²` | `H¹ = 0`, `#H² = p = p^{v_p(p)}`, carry class generates; `1 = p⁰`; `H² = ℤ_p/ℓ = 0 = p^{v_p(ℓ)}`, with `scd_p = 2`; `0 ≠ p` but `scd_p = ⊤` (excluded); `#H²((ℤ/p)², ℤ_p²) = p⁴ ≠ p²` with `scd_p = 3` | hypotheses exact | R01 |
| 11.8 transfer | `ℤ_p ⊇ pℤ_p`; `W = pℤ_p ⊇ V = p²ℤ_p` | `Ver(1) = p`, `Ver(p) = p²`; `i(u_{G/W}) = p·p² = p³`, of order `p` in `p²ℤ_p/p⁴ℤ_p` | consistent | none |
| 13.1 index-two sequence | `S₃ ⊇ C₂`; `C₄ ⊇ C₂` | res and cor both onto `𝔽₂` in degree 1, so the sequence is not exact at `H¹(U)`; `u ↦ x² ≠ 0` and `χ² = 0` in `H²(C₄,𝔽₂)` | consistent | none |
| 13.2 general norm (not statable) | `C₃ × C₂ ⊇ C₃`, `𝔽₃`, `a ∈ H²(C₃)` | `res N(a) = a⌣a ≠ 0` in `H⁴(C₃,𝔽₃)`; `N(2) = 4 = 1`, so `N(2a) = N(a) ≠ 2N(a)`; `res(1 + cor a + N a) = 1 + 2a + a² = (1+a)²` | consistent | none |
| 13.3 identity 5 (headline) | `ℂ/ℝ`, `y = 0, x`; `𝔽₉/𝔽₃` | `res y ∈ H¹(G_ℂ) = 0`, `N(0) = 0`; right side `x² + x² = 0`; `H²(Ẑ,𝔽₂) = 0` on both sides | holds | R01 |
| Layer edges | `"This roadmap:"` lines of Layers 0–13 | 4 → 10 (`:1443`) and 10 → 4 (`:2533`); closure of {10, 12} omits 9 while 13.3 needs 9 | coarse cycle and missing edge | R04 |

## Not verifiable

- **NSW** and **Serre, *Galois Cohomology***: settled as `uncertified`, and cited by locator. The sample's NSW locators (1.2.2), (1.5.1), (1.5.3), (1.4.2), (1.6.4), (1.6.7), (1.3.7) and (6.2.1), and Serre I §2.2 Prop. 8, are unchecked against the text. Their content was checked on the instances in the table.
- **Ribes–Zalesskii, Koch, Serre *Local Fields*, Brown**: these Springer texts are not in the sources cache, and earlier rounds found no legal copy. Ribes–Zalesskii Prop. 2.2.2, Cor. 7.2.5(a), 7.9.6–7.9.7 and Thm. 6.10.5, Koch Thm. 3.14, and Brown V (3.5) and (3.8) are unchecked.
- **Elaboration at main's pin**: this brief's Lean commands run only in this worktree, at `358314d4`. R01's repair terms rest on the elaborated signatures here, read side by side with the `2fd255d9` statements.

## Source issues

- none
