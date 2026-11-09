# Review of ProfiniteCohomology (pull request #616 at 0cff68e)

**Verdict:** needs changes

This is a full review of the head the previous review (r17) read. The folder has 0 changed lines since then, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty. I re-ran the whole pass: gate, dependency check, elaboration, signatures, the padding probe, a namespace-aware name audit, the fifteen seeded targets, the adversarial table, ownership and overlaps. The pass found no new defect. The one finding is the pin lag, re-raised as R01. It cannot be repaired by editing the folder alone, so it is held for a human.

## R01 (P2) — The folder cites Tau Ceti at main's pin `2fd255d9`, but the branch pins `358314d4`; 71 cited names do not exist at the pin, and the branch conflicts with main

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/README.md:467`–`:478`: "cited as they are at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` … At those revisions two statements that `Suggested.lean` carries with `sorry` … are theorems of Tau Ceti".
- `README.md:37`–`:39` ("the headline theorems that the pinned libraries do not yet prove (Layer 11's universe independence …)") and `:50`.
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:34`–`:52`, `:59`–`:67` and `:76`–`:85`; the `sorry`s at `:316` and `:575`.

**Claim.** The branch's `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`. Main (`3090489`) pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`. The branch is 256 commits behind main, and Tau Ceti `2fd255d9` is 12,446 commits after `358314d4`. The folder describes Tau Ceti as it is at `2fd255d9`, so it is wrong at either pin:
- **At its own pin** it cites declarations and files that do not exist. I built fully qualified declaration lists, namespaces included, from both Tau Ceti commits. Of the 691 qualified README names under `TauCeti.`, `OpenSubgroup.`, `Subgroup.` and the like, 71 exist only at `2fd255d9`. Six of them were missed by the last-component count of earlier rounds:
  - `TauCeti.IsSmoothDiscrete.pi`, `.quotient` and `.subrepresentation` (1.2);
  - `TauCeti.ContinuousCohomology.conjMap`;
  - `Subgroup.quotientOpenSubgroup` and `Subgroup.quotientSubgroupOfEquivMap`. At the pin these live in `TauCeti/Topology/Algebra/Group/Quotient/Basic.lean:193` and `:253`, under `namespace TauCeti`.

  31 backticked `.lean` paths (30 distinct files) also exist only at `2fd255d9`. Examples are `ContCohomology/Conjugation/Basic.lean` (2.4; the pin has `ContCohomology/Conjugation.lean`), `SmoothDiscrete/Products.lean` (1.2), `Coefficients/FilteredColimits.lean` (4.3), `ExactCochains/Basic.lean` (10.3), the five `Evens/Norm/*.lean` (13.2) and `ClassModule/Sylow.lean` (11.8). The `Suggested.lean` docstring cites `TauCeti.subsingleton_h1_abelianizationProP` (`:47`) and `OpenSubgroup.evensNorm` (`:66`), and neither exists at the pin.
- **At main's pin** `Suggested.lean` states two proved theorems with `sorry`. Under the brief's padding test each then closes with one library term. The README says so (`:471`–`:478`), but the file cannot close them at this pin.
- **The pull request cannot merge as it stands.** `git merge-tree --write-tree HEAD origin/main` reports content conflicts in both files of this folder. Main changed them in a891cd19, the pin bump to `2fd255d9`.

**Witness.** At `358314d4`, `git grep` finds neither `abelianizationProPClass_generates` nor `galoisEvens_galoisRes`. At `2fd255d9` they are `ClassModule/Sylow.lean:156` (`(hp : p.Prime) (h : scd ≤ 2) (hV)`) and `GaloisCohomology/EvensNorm.lean:143` (`(hL : finrank K L = 2) (y)`).

**Why the reply's reason does not settle it.** The reply to H01 says the repair needs a merge that only the author or an operator may make. That is right about who acts. It does not make the folder ready for final approval:
- the folder text is false at the pin the branch builds against;
- the branch does not merge with main.

Neither depends on anything outside this pull request. The finding is held, with the re-raise line, so that the roadmap goes to a human rather than to another repair round limited to the folder.

**Repair** (for the author or an operator):
1. Merge `origin/main` into the branch, keeping this branch's text in `TauCetiRoadmap/ProfiniteCohomology/README.md` and `Suggested.lean`.
2. Close the two `sorry`s, adjusting the explicit arguments to the merged signatures:
   - at `Suggested.lean:316`: `TauCeti.abelianizationProPClass_generates Fact.out hG hV`;
   - at `:575`: `TauCeti.galoisEvens_galoisRes K L σ hdeg y`.

   I could not elaborate at `2fd255d9`. The conclusions agree term for term with `:313`–`:315` and `:572`–`:574`, up to the coercion `(galoisRes K L σ 1).hom y` against `galoisRes K L σ 1 y`.
3. Rewrite `README.md:37`–`:39`, `:50` and `:467`–`:478`, and `Suggested.lean:34`–`:52` and `:76`–`:85`, so that the two universe theorems of 11.2 are the only `sorry`s and every name cited is the pin's.
   - At the new pin `OpenSubgroup.evensNorm` exists, so re-read `Suggested.lean:59`–`:67` against `README.md:58`–`:60`.
   - Those lines list the `𝔽₂` laws (transitivity, multiplicativity, the expansion) as remaining targets. Either say there why they are not headlines, or state those that are.
4. Re-run the gate with the targeted build. Also elaborate `Completed/LocalGaloisGroups/Suggested.lean` and `Completed/ProfiniteProPGroups/Suggested.lean`, which import this module and are outside the targeted build.
5. Update the pull-request description. It still describes `CohomologyUniverseComparison.lean`, `DimensionNormalization.lean`, "19 explicit admitted construction/proof targets" and Tau Ceti `a91d3aaf`, none of which is at this head.

## Previous findings

- **R01 (r17): not repaired.** The head is unchanged (0 changed lines), and `lake-manifest.json` still pins Tau Ceti `358314d4`. Raised again above with a stricter recount: 71 names (r17 counted 65) and 31 paths.

## Verified sound

**Gate, build, dependency check.**
- My gate run (`gate … ProfiniteCohomology --base origin/main`): every check `0`, `OK`. The worker's gate, with the targeted build of this module, ClassFieldTheory and QuadraticFormInvariants, also reports `build=0 OK`.
- Dependency check:

```text
depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The roadmap is on main and is not listed in `ORDER.txt`. Its one supplier roadmap, `RepresentationTheory/InductionRestriction`, is on main.
- `lake env lean` on `Suggested.lean`: exit 0 in 22 s, with exactly four `declaration uses sorry` warnings, at `:276`, `:284`, `:310` and `:569`.

**Signatures, padding probe, consumers.**
- I appended a `#check @` for each of the 56 declarations to a scratch copy, under `pp.universes`, and elaborated it once. Every declaration keeps the binders its README statement names:
  - `explicitH2IsoContinuousCohomology` carries `[CompactSpace G]` alone, `explicitFiniteQuotientComparison2` carries no compactness, and `explicitFiniteQuotientColimit2` carries both classes, as `README.md:4067`–`:4070` says.
  - `abelianizationProPClass_generates.{u_1}` has `[Fact (Nat.Prime p)] … [CompactSpace G] [TotallyDisconnectedSpace G] (scd_p p G ≤ 2) (V) [V.Normal] (hV : IsOpen ↑V)`.
  - The universe theorems read `cohomologicalDimensionAt.{u_1,u_1} p G = cohomologicalDimensionAt.{0,u_1} p G`, and likewise for the strict invariant. Neither has a profiniteness or `Type 0` binder, as 11.2 says.
- One-tactic probe on each `sorry` (`first | rfl | (simp; done) | exact rfl | decide | norm_num`, and `exact ⟨rfl, rfl⟩` or `infer_instance` where they typecheck): all four fail, so none is padding. The universe goals stay as `cohomologicalDimensionAt p G = cohomologicalDimensionAt p G` with different universe arguments.
- The theorems proved by one Tau Ceti term (`galoisSubgroup_index`, `cup_add_left`, `cup_coeffMap`, `inhomogeneousCochain2_d_eq_zero`, `cochainClass_inhomogeneousCochain2_eq_of_coboundary`, `wreathD16Cocycle_isCocycle`, `continuous_wreathD16Cocycle_indexTwoInd`, `galoisRes_eq_zero_iff`) are the consumer interface that four importers on main read, which earlier rounds settled.
- I tested whether `degreeCast` duplicates the pinned `TauCeti.ContinuousCohomology.degreeCast` (`ContCohomology/DegreeCast.lean:68`). It does not, in effect. Tau Ceti's definition is not exposed to importing modules, and `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1204` closes `localSymbol_kummerClass_mul` by unfolding the cast. A scratch copy with the cast routed through Tau Ceti's declaration fails exactly there ("definitions were not unfolded because their definition is not exposed"). The roadmap's own short definition is therefore justified.
- `Completed/LocalGaloisGroups/Suggested.lean` and `Completed/ProfiniteProPGroups/Suggested.lean` elaborate against this head with exit 0. The only non-`sorry` message is an unused-section-variable lint in the former, at `:521`.

**The seeded sample, against the pins** (Tau Ceti `358314d4` and Mathlib `f6090c70` unless stated otherwise).
- **0.3.** `TauCeti.exists_continuous_section` (`Topology/Algebra/Group/Profinite/Section.lean:230`) needs `[CompactSpace G] [TotallyDisconnectedSpace G]` and closed `H`, and gives `s (mk 1) = 1`. `exists_continuous_section_of_le` (`:257`) needs only `H` closed, so the README's "closed `K ≤ H`" is narrower, which is fine. `ContinuousMap.exists_extension_of_discrete` (`Topology/Separation/Profinite.lean:163`) needs a compact, T2, totally disconnected `X` and a nonempty discrete `Y`, as stated. The Ribes–Zalesskii locator is under Not verifiable.
- **1.4.** Mathlib `ContinuousCohomology.map (φ : H →ₜ* G) (f : res φ X ⟶ Y) n : continuousCohomology n X ⟶ continuousCohomology n Y` (`RepresentationTheory/Homological/ContCohomology/Functoriality.lean:148`), with `cochainsMap` (`:103`), `cocyclesMap` (`:129`), `map_id` (`:158`) and `map_comp` (`:163`). The direction matches the README.
- **2.2.** `explicitMap0_id` and `explicitMap0_comp` are at `ContCohomology/LowDegree.lean:374` and `:382`. `explicitMap1_id`, `explicitMap1_comp`, `explicitMap2_id` and `explicitMap2_comp` are at `ExplicitFunctoriality.lean:370`, `:386`, `:517` and `:531`.
- **2.4.** `explicitConj1` (`ContCohomology/Conjugation.lean:141`) takes a normal `N`, so the README's "closed normal" is narrower, which is fine. `inverseConjugationHomotopy2_spec` is at `:207` and `explicitConj1_eq_id_of_mem` at `:299`. The cited file path is main's (R01). Milne's Prop. 0.15 is verified below.
- **3.3.** `TauCeti.discreteTopology_continuousCohomology` (`CompactDiscrete.lean:195`) has `[CompactSpace G]` and `[DiscreteTopology X.V]` from the variables at `:54`–`:55`, as stated.
- **3.4.** `explicitIso_map` (`CohomologyComparison.lean:365`) carries `[CompactSpace H]` within the section `[CompactSpace G]` (`:318`). `explicitIso_res` (`:384`) carries `[CompactSpace S]`, and `explicitIso_coeffMap` is at `:400`. `explicitIso_infl` (`Inflation/Comparison.lean:130`) carries `[CompactSpace G]` from `:124`. None carries total disconnectedness, as stated.
- **6.6.**
  - Mathlib's `GroupHomology/Functoriality.lean:26`–`:27` does use "corestriction" for the covariant map on homology, so the naming collision is real.
  - `TauCeti.ContinuousCohomology.corestriction` is at `Corestriction/AllDegrees.lean:100`.
  - The normalization `cor ∘ res = index` is recomputed in the table.
- **8.3.**
  - All nine names exist in `Cup/Product.lean`, at `:642`, `:663`, `:671`, `:694`, `:719`, `:745`, `:775`, `:790` and `:805`.
  - `cup11_add_cup11_flip_eq_d1` states exactly the homotopy `d¹ (g ↦ −μ (a g) (b g))` that the README gives. I recomputed it by hand; see the table.
- **8.7.**
  - `TauCeti.homAction` is at `Topology/Algebra/GroupAction/InternalHom/Basic.lean:165`, `InternalHom.evalPairing` at `:350` and `evalPairing_equivariant` at `:497`.
  - `explicitDualityPairing02`, `11` and `20` are at `Cup/Duality/Basic.lean:155`, `:190` and `:203`, with their naturality at `:289`, `:325` and `:349`.
  - `ofDiscreteModulePairing` is at `Cup/Graded/Basic.lean:166`.
- **9.4.**
  - Mathlib `InfiniteGalois.fixedField_fixingSubgroup` is at `FieldTheory/Galois/Infinite.lean:85`, `IntermediateFieldEquivClosedSubgroup` at `:196`, `normalAutEquivQuotient` at `:228` and `isOpen_and_normal_iff_finite_and_isGalois` at `:288`, all under `[IsGalois k K]`.
  - Tau Ceti `galoisOpenNormalSubgroup` and `exists_galoisOpenNormalSubgroup_eq` are at `FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:345` and `:362`; the latter concludes `∃ E, FiniteDimensional K E ∧ IsGalois K E ∧ … = U`.
  - `quotientFixingSubgroupEquiv` (`FieldTheory/Galois/Quotient.lean:78`) needs `[Normal F M]` and `[Normal F E]` (`:51`, `:58`).
- **9.5.** `TauCeti.subsingleton_H1_additive_units` (`FieldTheory/GaloisCohomology/Hilbert90.lean:186`) needs only `[IsGalois K L]` and the discrete-topology instances. `TauCeti.hilbert90` is at `:245`.
- **9.8.**
  - In `MuTwo/Basic.lean`: `mu2_smul_eq_self` (`:163`), `kummerCoeffIsoTrivialF2` (`:266`), `kummerClass` (`:353`), `kummerCocycleModTwo` (`:397`), `kummerCocycleModTwo_apply` (`:432`) and `kummerSquareClassEquiv` (`:666`).
  - In `MuTwo/KummerCharacter.lean`: `kummerCharacter` (`:145`) and `kummerClass_eq_homClass` (`:169`). In `MuTwo/Cup.lean`: `kummerCup` (`:56`) and `kummerCup_comm` (`:89`).
  - All are under `[Invertible (2 : K)]` (`Basic.lean:170`, `Cup.lean:52`), equivalent to the README's `IsUnit (2 : K)`.
- **11.3.**
  - `isPPrimaryTorsion_resolutionX` (`CohomologicalDimension/Basic.lean:94`), `isPPrimaryTorsion_homogeneousCochains` (`:102`) and `isPPrimaryTorsion_continuousCohomology` (`:110`) have only `[CompactSpace G]` and `[DiscreteTopology X.V]` (`:89`–`:90`), so "it uses only compactness" is right.
  - `IsPPrimaryTorsion.continuousMap` is at `Topology/Algebra/Group/Torsion.lean:74`, `TauCeti.IsPPrimaryTorsion` at `GroupTheory/Torsion.lean:204` and `ofDiscreteModule_V` at `SmoothDiscrete/Basic.lean:227`.
  - Mathlib's `primaryComponent` is `{g | ∃ k, p ^ k • g = 0}` (`GroupTheory/Torsion.lean:268`–`:269`, `:450`), as the README reads it.
- **11.7.** `strictCohomologicalDimensionAt_le_of_isClosed` (`CohomologicalDimension/ClosedSubgroup.lean:108`) and `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` (`IntegralCriterion.lean:305`, with `(hp : p.Prime)`) both sit under `[CompactSpace G] [TotallyDisconnectedSpace G]` (`:63`–`:64`, `:70`–`:71`). The criterion's integral coefficients are `TopRep.of (ContRepresentation.trivial ℤ U (ULift ℤ))`, which is "`ℤ` with the trivial action".
- **13.1.** I recomputed every Check (table). Kahn's Théorème I.4.2 is verified below. Six of the cited names exist only at main's pin (R01): `OpenSubgroup.evensConj_eq_trivialF2Map`, `indexTwoDelta_eq_cup_character`, `exact_cup_res_of_index_two`, and the three `evensNormIndexTwo_*` transports.

**Sources read.**
- `MilneADT` line 542–548 (p. 11): Prop. 0.15. For a `G`-module `M` and an element of `G`, the conjugation pair is compatible and acts as the identity on every `Hʳ`. This is 2.4's "inner automorphisms act trivially".
- Kahn, Invent. Math. 78 (1984), the author's copy, p. 239: Théorème I.4.2. For `H` of index two in a discrete `G` and a real representation of `H`, the total Stiefel–Whitney class of the induced representation is a sum of norms of the modified classes times powers of `d`. At rank one this is the formula `w(Ind) = N(1 + a) + d` that 13.1's first two Checks evaluate. The locator "th. I.4.2" is right.

**Name audit.** Besides the 71 names of R01, none of the 691 qualified README names is missing at both pins. The only hits are the namespace tokens `TauCeti.ContCohomology` and `TauCeti.ContinuousCohomology`. All 200 path tokens resolve at the pins or at `2fd255d9`, except the brace pattern `ProfiniteGrp/{Basic,Limits,Completion}.lean`, whose three files exist at the Mathlib pin.

**The dropped-name map** (`README.md:4117`–`:4172`), against main.
- Main's `ProfiniteCohomology/Suggested.lean` declares 521 names, and this head drops 467 of them. The four consumer READMEs on main cite 119 (name, roadmap) pairs among them.
- Every cited name that is neither mapped nor declared at this head under the same name exists as a Tau Ceti or Mathlib declaration of that name, except three Evens-transport names that exist only at `2fd255d9` (R01): `galoisEvens_add`, `galoisRes_galoisEvens` and `galoisEvens_embedding_independent`, cited at `QuadraticFormInvariants/README.md:741`.
- `cd` appears in the consumers only as prose notation.
- `scratch/citations.md`'s 16 "found nowhere" names are the left-hand sides of this map, plus `WreathC2.sectionTable`, which `Suggested.lean:464` declares.

**Cross-roadmap citations, on main `3090489`.**
- Supplier: `RepresentationTheory/InductionRestriction`, "What Mathlib already has (consume)" (`:101`) and Layer 0 (`:213`).
- Consumers:
  - ClassFieldTheory Layer 6 (`:1220`), with `scd_p_absoluteGaloisGroup_eq_two` (`Suggested.lean:1912`);
  - QuadraticFormInvariants Layer 9 (`:2797`);
  - Completed/LocalGaloisGroups "Exact supplier contracts" (`:97`) and Layer 7 Step 3 (`:723`);
  - Completed/ProfiniteProPGroups Layers 5–7 (`:885`, `:1246`, `:1440`).

**Ownership and overlaps.**
- `roadmaps grep` for the multiplicative transfer and the Evens norm finds no other owner. QuadraticFormInvariants on main excludes "the Evens norm in every degree" (`:192`).
- ProfiniteCohomologyPartII (open) imports Layers 0–3, 5, 6 and 8–12. It owns the all-degree strict inhomogeneous cochain algebra, which this roadmap's Out of scope excludes, so the two do not overlap.
- No open roadmap states a universe comparison of `cohomologicalDimensionAt`. ClassFieldTheory at two open heads reads `strictCohomologicalDimensionAt.{0}`, the parameter that 11.2 compares to.
- ArithmeticGaloisRepresentations (open) builds tensor induction of continuous representations. 13.2's milestone 2 is tensor induction of a commutative `G`-ring with its multiplication, a different object, and this roadmap is on main.
- `scratch/overlaps.md`: no cited id is dropped, none is defined only by an open revision, and this pull request drops no id other roadmaps cite unmapped. #1187 (a Tau Ceti pin bump) is the conflicting head. The previous reviews record its order as stated in an earlier reply; I have not seen that reply. The merge in R01 changes the base #1187 conflicts with.

**Headline theorems.**
- From `README.md:37`–`:40`, the module docstring and Layers 11 and 13, the roadmap's headlines are:
  1. the universe independence of `cd_p` and `scd_p` (11.2), stated twice with `sorry`;
  2. NSW (3.6.4) in degree two (11.8) and Evens's identity 5 at a quadratic extension (13.3), stated with `sorry`; both are proved at main's pin (R01);
  3. the general Evens norm (13.2), which is not statable: the docstring names it and the missing carrier, the multiplicative transfer for a discrete commutative `G`-ring.
- The other headline results (comparisons, colimits, exact sequences, Shapiro, corestriction, cup product, Hilbert 90, Kummer, the dimension criteria) are cited by their pinned names.
- The remaining targets 1.7, 4.2, 6.5 and 10.1 are compatibility lemmas or an instance, not headlines, and are correctly not stated. Nothing in the file is padding by the probe.

**Adversarial table** (seeded sample, headlines, and the statements R01 touches; values computed in this review).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 section and extension | `ℤ_p → ℤ/p`, reps `0…p−1`; `H = K`, `H = G`; empty closed subspace | `s(0) = 0`, `s((p−1)+1) = 0 ≠ s(p−1) + s(1) = p`, so not a homomorphism, as required; a homomorphic section `ℤ/p → ℤ_p` is `0`; `H = G` gives `s(pt) = 1`; extensions into a one-point target: 1, into the empty target: 0 | hypotheses (profinite, closed, nonempty) all needed | none |
| 1.4 compatible pairs | `C₂`, trivial `ℤ`, `n = 0`; `f = ×2`, `g = ×3` | `map id f 0 : 1 ↦ 2`; `map_comp`: `1 ↦ 2 ↦ 6 = map id (f ≫ g) 0 (1)`; inclusion `S ↪ G` gives `H(G) ⟶ H(S)` (contravariant) | direction as at Mathlib `:148` | none |
| 2.2 explicit functoriality | `C₄ ↠ C₂`, then `1 ↪ C₄`, trivial `𝔽₂` | `χ ↦ (0,1,0,1) ↦ 0`, equal to the pullback along `1 → C₂`, which is `0`; identity pair: `χ ↦ χ` | composition order consistent | none |
| 2.4 conjugation | `S₃ ⊇ A₃`, trivial `𝔽₃` | `τ`: `f ↦ f(τ⁻¹nτ) = f(n⁻¹) = −f`; `g ∈ A₃`: `f ↦ f`; `H¹(A₃,𝔽₃)^{C₂} = 0 = H¹(S₃,𝔽₃) = Hom(S₃,𝔽₃)` | inner acts trivially; quotient action well defined | none |
| 3.3 category | `G = ∏ℕ C₂`, trivial `𝔽₂`; `G = C₂` | `n` evaluations impose `n` linear conditions on `⊕ℕ 𝔽₂`, leaving a nonzero common zero, so `0` is not isolated pointwise; `C₂`: both sides have 2 elements | discrete wrapper needed | none |
| 3.4 transport | `S = C₂ ⊂ C₄`, trivial `𝔽₂` | parity character `(0,1,0,1)` restricts to `0` on both sides; binders `[CompactSpace S]` and no total disconnectedness at `:384` | as stated | none |
| 6.6 `cor ∘ res = index` | `C₂ ⊇ 1`, `ℤ`, degree 0; reversed order at `S₃ ⊇ C₂` | `1 ↦ 1 ↦ 2 = (C₂ : 1)`; `res ∘ cor`: `1 ↦ 3 ↦ 3 = 1 + 2` (Mackey: double cosets of sizes 2 and 4) | order and direction as stated | none |
| 8.3 graded commutativity | `C₂×C₂`, trivial `𝔽₂`; sign `𝔽₃` on `C₂`; `C₃`, `𝔽₃` | `d¹c` for `c = −μ(a g)(b g)` expands to `μ(g·a h)(b g) + μ(a g)(g·b h)`; `(x⌣y)(a,b) = 1`, `(y⌣x)(a,b) = 0`, `d¹c(a,b) = 0−1+0 = 1`; `(m⌣b)(s) = 1 ≠ 2 = (b⌣m)(s)` for `m = 1`; `χ(h)² − (χ(g)+χ(h))² + χ(g)² = −2χ(g)χ(h) = χ(g)χ(h)` | homotopy and Checks correct | none |
| 8.7 duality pairings | `M = N = 𝔽₃`; sign source; `M = 0` | `(id, 1) ↦ 1`; `(−id)(−1) = 1`; all cups `0` | as stated | none |
| 9.4 dictionary | `𝔽_p`; `ℚ(∛2)`; `⋃ 𝔽_{p^{2^k}}`; `ℝ` | `U_{𝔽_{pⁿ}} = nẐ`, `2Ẑ ⊋ 4Ẑ`, `Ẑ/4Ẑ ≅ ℤ/4`; index 3, not normal; `⋂ 2ᵏẐ = 0 × ∏_{ℓ≠2} ℤ_ℓ`, quotient `ℤ₂`; stages `Hⁱ(1, ℝˣ)` and `Hⁱ(C₂, ℂˣ)` | bijective, inclusion-reversing | none |
| 9.5 Hilbert 90 | `ℂ/ℝ`, `z z̄ = 1` | `z ≠ −1`: `w = 1 + z`, `w/w̄ = (1+z)/(1+z⁻¹) = z`; `z = −1`: `w = i`, `i/(−i) = −1` | `H¹ = 0` | none |
| 9.8 mod 2 | `𝔽₃`, `n = 2`; `ℝ` | `𝔽₃ˣ/(𝔽₃ˣ)² = {±1} ≅ H¹(Ẑ, 𝔽₂) = 𝔽₂`; Frobenius maps `√−1` to `(√−1)³ = −√−1`, so the cocycle value is 1; `[−1] = χ` over `ℝ` | no `CharZero` needed | none |
| 11.3 `p`-primary | discrete `⊕ℕ ℤ`; `n = 0`; `p = 0, 1` | `H¹ = (ℚ_p/ℤ_p)^ℕ ∋ (p^{−k})`, killed by no `pᵏ`, so compactness is needed; `H⁰ ⊆ M`; `p = 0`: `0¹ • g = 0`, so the statement is trivial; `p = 1` forces `M = 0` | as stated | none |
| 11.7 strict criterion | `1`, `n = 0`; `ℤ_p`, `n = 1, 2`; `C_p` | both sides true; `scd = 2 > 1`, and `H²(p^rℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`, so both false; `H³ = H²(ℤ_p, ℚ/ℤ) = 0`, so both true; `cd = ⊤`, so both false | `≤` form holds for every `n` | none |
| 13.1 index-two form | `C₄ ⊇ C₂`, `s = σ`, `α ≠ 0`; `y = χ_U` on `C₂≀C₂`; `S₃ ⊇ C₂` | `b₁ = (0,1,1,0)`, `b_s = (0,0,1,1)`; `ν` rows `0000/0100/0011/0010`; `Σ_τ ν(τ,σ) = 1 ≠ 0` in `𝔽₂/N𝔽₂`, so the extension is `C₈`; `res χ_U = 0`, `χ_U² ≠ 0` (`H*(D₈) = 𝔽₂[x,y,w]/(xy)`); res and cor both onto at index 3 | Checks correct | none |
| 13.2 odd-characteristic Check | `C₃ × C₂ ⊇ C₃`, `𝔽₃` | `res N(a) = a·(c·a) = a² ≠ 0`; `N(2) = 2·2 = 1`, so `N(2a) = N(a) ≠ 2N(a)`; `res(1 + cor a + N a) = 1 + 2a + a² = (1+a)²` | non-additive, as stated | none |
| 12 sign of `δ` on the right | `(m,n) = (2,1)`, `(1,2)` | `mn + (m+1)n ≡ n`: `(−1)¹ = −1`, `(−1)² = +1` | excludes `(−1)^m`, `(−1)^{mn}` and the constant `−1` | none |
| 11.2 universe equality (headline) | `G = 1`; `C_p`; `u = 0` | `0 = 0`; `⊤ = ⊤`; at `u = 0` one term; at general `u` the probe's `rfl` fails between `.{u,u}` and `.{0,u}` | true, not padding | none |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p`; `ℤ_p ⊇ p²ℤ_p` via `W = pℤ_p`; `ℤ_p × ℤ/ℓ ⊇ ℤ_p`; `C_p ⊇ 1` | factor set `i + j − ((i+j) mod p) = p·carry`, class `p` in `pℤ_p/p²ℤ_p` of order `p`; `inf(carry_p) = p·carry_{p²}`, so `i(u_{G/W}) = p²·p·carry = p³`, of order `p` in `p²ℤ_p/p⁴ℤ_p`; `p^{v_p(ℓ)} = 1`; excluded since `scd = ⊤` | hypotheses exact | R01 (`sorry` proved at `2fd255d9`) |
| 13.3 identity 5 (headline) | cochain identity; `ℂ/ℝ`; `𝔽₉/𝔽₃` | `b₁ = y + y(s)χ_U = b_s`; `ν = b⌣b + χ_U⌣b`; with `c = y(s)`, `(y + cχ)² + χ(y + cχ) = y² + χy + (c² + c)χ² = y² + χy`; `ℂ/ℝ`: `N(0) = 0 = χ² + χ²`; `𝔽₉/𝔽₃`: both sides in `H²(Ẑ, 𝔽₂) = 0` | true | R01 (`sorry` proved at `2fd255d9`) |
| R01 revision paragraph | manifest; 4 `sorry`s; names and paths | manifest rev `358314d4 ≠ 2fd255d9`; 2 of 4 `sorry`s proved at `2fd255d9`, 0 of 4 at `358314d4`; 71 names and 31 paths only at `2fd255d9`; merge-tree conflicts: 2 files | false at the branch pin | R01 |

## Not verifiable

- **NSW and Serre, *Galois Cohomology*.** Both are settled as `uncertified` and cited by locator. The sampled locators not read against the text are:
  - NSW I §5 and (1.5.7) (6.6), (1.4.4) (8.3), (6.2.1) and (6.2.2) (9.5, 9.8), and (3.3.3)–(3.3.5) (11.7).
  - The mathematics of each was checked on the instances in the table.
- **Ribes–Zalesskii, *Profinite Groups*, Prop. 2.2.2** (0.3). It is not in the roadmap's manifest and not in the sources cache, and it is a paywalled book. Tau Ceti's `Section.lean:224` cites the same locator for the same statement.
- **Brown V (3.6), Koch Thm. 3.10, Serre *Local Fields* VII §7 Prop. 6** (6.6, 8.3). None is in the manifest or the cache, and all are paywalled books.
- **Kahn 1984** is not in this roadmap's manifest. I read the author's copy, which was already in the sources cache. The manifest should record it under its own key when the package is next edited.
- **Elaboration at `2fd255d9`.** The Lean commands of this review run only at the branch pin `358314d4`. I read the `2fd255d9` statements from the Tau Ceti git history, so the two replacement proofs in R01's repair are untested.

## Source issues

- none
