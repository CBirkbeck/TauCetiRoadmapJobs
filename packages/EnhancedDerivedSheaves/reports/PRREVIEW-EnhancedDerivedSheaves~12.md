# Review of EnhancedDerivedSheaves (pull request #1630 at cfbfa9c)

**Verdict:** needs changes

This is a full review of the folder at `cfbfa9c`. That is the head r11 read: the change set since r11 is empty, and so is the diff outside the folder. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` and `Suggested.lean:N` mean the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`, and Tau Ceti paths are relative to the library root at the pin.

The mathematics checks out: every Check and worked example I recomputed holds (table below). Three findings block. Two are about duplication: Tau Ceti at the pin already has about twenty declarations that the README still plans as targets, and three of them are restated in `Suggested.lean`. The third is a predicate that this PR and #1891 both plan to build.

## R01 (P2) — Targets of E0, E1.1, E2.5 and E2.6 re-plan declarations the pinned Tau Ceti has

Location: `README:289`: "states the three comparisons the library lacks: the simplicial enrichment of a dg category, the homotopy-coherent nerve comparison and the stable sign comparison". `README:26`: "which that library does not cover … the sheaf version is built here by sheafification".

Claim: these are open targets of this roadmap, and the library lacks them.

Witness: `#check` at the pin elaborates each Tau Ceti name in the table below. For example, `TauCeti.DGSimplicialCategory` (`CategoryTheory/DG/Simplicial.lean:51`) has hom `cochainToSSet (dgHomComplex …)` (`hom_eq`), unit the constant simplex at the identity (`eId_eq_const`), and a `KanComplex` instance on every mapping object (`:91`).

| README target (line) | At the Tau Ceti pin | File |
| --- | --- | --- |
| *fullEnhancedSubcategory*, *_inclusion*, *_vertices* (227–229); Checks 233–235 | `SSet.fullEnhancedSubcategory`, `SSet.hasLiftingProperty_fullEnhancedSubcategory_ι` with the inner-fibration and `Quasicategory` instances, `SSet.fullEnhancedSubcategory.verticesEquiv`; Checks: `fullEnhancedSubcategory_top`, `_bot`, `CategoryTheory.ObjectProperty.nerveFullSubcategoryIso` | `AlgebraicTopology/Quasicategory/FullSubcategory.lean` |
| *IsWeaklyContractibleSSet* (243); Check 249 | `SSet.IsWeaklyContractible` (the same constant-maps definition); `IsWeaklyContractible Δ[n]`, `IsWeaklyContractible.nonempty` | `AlgebraicTopology/SimplicialSet/WeaklyContractible.lean` |
| *HasSmallSpaceModel*, *IsLocallySmall*, *smallMappingSpace*, *smallMappingSpace_compare* (274–276); Checks 281–283 | `TauCeti.SmallSpaceModel`, `TauCeti.HasSmallSpaceModel`, `SSet.IsLocallySmall`, `SSet.smallMappingSpace`, `SSet.smallMappingSpaceModel`; `CategoryTheory.nerve.isLocallySmall_iff`, `TauCeti.hasSmallSpaceModel_nerveCodiscrete` | `AlgebraicTopology/SimplicialSet/SmallModel.lean`, `AlgebraicTopology/Quasicategory/LocallySmall.lean` |
| *dgSimplicialCategory*, *_hom*, *_unit* (324–326) | `TauCeti.DGSimplicialCategory`, `.hom_eq`, `.eId_eq_const`, `.eComp_eq`, Kan instance | `CategoryTheory/DG/Simplicial.lean` |
| *IsKappaFiltered* (378); Checks 384–386 | `SSet.IsCardinalFiltered`; `SSet.isCardinalFiltered_of_isTerminal`, `SSet.not_isCardinalFiltered_nerve_discrete`, `SSet.isCardinalFiltered_nerve_iff` | `AlgebraicTopology/SimplicialSet/CardinalFiltered.lean` |
| *SheafOfModules.sliceFree*, *sliceFree_homEquiv*, *sliceFree_isSeparating*, *sliceFree_flat* (614–616) | `SheafOfModules.freeYonedaFunctor`, `SheafOfModules.freeYonedaEquiv`, `SheafOfModules.isSeparating_freeYonedaFunctor`, `SheafOfModules.preservesFiniteLimits_tensorLeft_freeYonedaFunctor_obj` | `Algebra/Category/ModuleCat/Sheaf/Free/Yoneda.lean`, `…/Sheaf/TensorProduct/Flat.lean` |
| *projective_sections_exact* (2342) | `CategoryTheory.Sheaf.preservesEpimorphisms_sheafCompose_comp_coyoneda_obj` | `CategoryTheory/Sites/Projective.lean` |
| *IsLocallyWeaklyContractible*, *.cover*, *.detect_epi* (2354–2356); Check 2360 | `TauCeti.Topos.IsLocallyWeaklyContractible`, `.exists_effectiveEpi_sigmaDesc`, `.epi_iff_exists_lift`, `TauCeti.Topos.isLocallyWeaklyContractible_type` | `CategoryTheory/Topos/LocallyWeaklyContractible.lean` |
| *Hypercover*, *Hypercover.matching_epi*, *Hypercover.oneHypercover* (2382–2384); Checks 2388–2390 | `CategoryTheory.SimplicialObject.IsHypercover`, `.epi_matchingMap`, `IsHypercover.oneHypercover`; `isHypercover_const_terminal`, `isHypercover_cechNerveTerminalFrom`, `not_isHypercover_const_bool` | `AlgebraicTopology/SimplicialObject/Hypercover.lean`, `CategoryTheory/Sites/Hypercover/Simplicial.lean` |

Each definition matches the README's prose. For example, `SSet.IsLocallySmall.{u} X` asks every `Hom^R_X(x, y)` to have a `u`-small Kan model, which is `README:274`. `IsHypercover` asks `U₀ → ⊤` and every matching map into the augmented coskeleton to be epimorphisms, which is `README:2382`. The README's Checks are already proved there as the lemmas listed in the table.

Repair:
- Delete these targets and their *Provide* lines.
- Add one "From Tau Ceti" bullet per file above, listing the names.
- Rewrite each paragraph as a consumed result, in the style of the first five paragraphs of E1.6, keeping its Checks with the library names.
- In the *Needs:* lines, replace each italic name by the library name:
  - *fullEnhancedSubcategory* (`README:374`, `:938`, `:2224`, `:2669`)
  - *IsWeaklyContractibleSSet* (`:1235`)
  - *IsLocallySmall* and *IsKappaFiltered* (`:401`)
  - *dgSimplicialCategory* (`:346`)
  - *sliceFree* and *sliceFree_isSeparating* (`:680`, `:711`)
  - *projective_sections_exact* (`:2376`, `:2378`)
  - *IsLocallyWeaklyContractible* (`:2367`, `:2378`, `:2476`, `:2484`)
  - *Hypercover* (`:2404`, `:2474`)
- Keep only what the library lacks:
  - *IsFinal* and its theorems, *representableSpaceFunctor*, *HasKappaFilteredColimits* and the later E0.8 targets;
  - the coherent-nerve comparison and the sign comparison;
  - *sheafComplexDG*, *IsLocallyWeaklyContractible.compactlyGenerated*, and E2.6 from *cartesianDerivedSystem* on.
- Correct the sentences that call the library lacking:
  - `README:9`: drop full subcategories, universe-small mapping models and cardinal filteredness from what E0 owns;
  - `README:26`;
  - `README:289`: two comparisons, not three;
  - `README:326` and `README:616`;
  - the consumed list in the `Suggested.lean` module docstring (`:31`–`:39`).

Tested: every Tau Ceti name in the table elaborates by `#check @` at the pin, in a scratch file that imports `Mathlib` and the listed modules.

## R02 (P2) — E1.7 and three `Suggested.lean` declarations restate Tau Ceti's saturated-lattice library

Location: `Suggested.lean:226`–`258`, `def valuationSaturationMap`, `def IsValuationSaturated` and `theorem valuationSaturated_finite_free`. `README:894`–`924`, E1.7, which plans BS17 Lemma 6.14 as a target.

Claim: the roadmap defines the saturation map and predicate, and proves finite freeness of bounded saturated lattices.

Witness:
- `example : @valuationSaturationMap = @TauCeti.valuationSaturationMap := by funext …; ext x a; rfl` elaborates. The analogous equality for `IsValuationSaturated` closes by `simp only`.
- `TauCeti.exists_basis_of_isValuationSaturated` (`Analysis/Normed/Field/SaturatedLattice.lean:349`) is BS17 Lemma 6.14 with weaker hypotheses. It assumes `SphericallyCompleteSpace` (sequences of balls, not chains) and no `CompleteSpace`.

The other E1.7 Checks are also already in Tau Ceti:
- `TauCeti.isValuationSaturated_top`, `isValuationSaturated_bot_iff` and `isValuationSaturated_ideal_span_singleton_iff` (`README:907`);
- `isValuationSaturated_integer_span_singleton` (`:908`);
- `exists_eq_span_singleton_of_isValuationSaturated` (`:909`);
- `not_isValuationSaturated_maximalIdeal_integer` (`:910`, `:919`).

Repair:
- Delete the three declarations from `Suggested.lean`.
- In its module docstring, move "finite freeness of bounded saturated valuation lattices" from the statable headlines to the consumed list, as `TauCeti.exists_basis_of_isValuationSaturated`.
- Rewrite E1.7 as a consumed-results paragraph that cites `TauCeti.valuationSaturationMap`, `TauCeti.IsValuationSaturated` and `TauCeti.exists_basis_of_isValuationSaturated`. Use these names at `README:896`, `:898`, `:914` and `:924`.
- Add a "From Tau Ceti" bullet for `RingTheory/Valuation/SaturatedModule.lean` and `Analysis/Normed/Field/SaturatedLattice.lean`.

Tested: the two equality probes and `#check @TauCeti.exists_basis_of_isValuationSaturated` elaborate at the pin.

## R03 (P2) — `MonoidalCategory.IsInvertible` is planned here and in EtaleCohomologyFoundations (#1891)

Location:
- `README:571`: "**Invertible objects** (`MonoidalCategory.IsInvertible`)".
- `Suggested.lean:168`: `class MonoidalCategory.IsInvertible`.
- `README:11`, the scope: "invertible objects of monoidal categories (Section 0.3)".

Claim: this roadmap owns invertible objects of a monoidal category.

Witness: `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1823`–`1824` at #1891 (`39f37e1`) reads: "invertible when tensoring with it is an equivalence (the predicate MonoidalCategory.IsInvertible, built here)". Neither main nor the pinned libraries have the predicate. This PR adds it, in `55f598b`.

The object has two owners. This roadmap must be the one: #1891's own supplier table (its `README:67`; `README:42` on main) consumes EnhancedDerivedSheaves §§0.1–0.4. Making EtaleCohomologyFoundations the owner would create a cycle.

Repair:
- Keep the predicate in Section 0.3.
- Under `## Downstream consumers` add a bullet such as "Section 0.3 (invertible objects of monoidal categories): `EtaleCohomologyFoundations` §F.5".
- Say in the pull-request description that EtaleCohomologyFoundations §F.5 cites `MonoidalCategory.IsInvertible` of EnhancedDerivedSheaves §0.3 rather than building it. That edit is made in #1891.

## R04 (P3) — Roadmaps are cited for carriers that the pinned Tau Ceti has

Location:
- `README:217`, E0.1, "Supplied by `BordismFormalGroups` F6.5 … the simplicial join, slice quasicategories … and right mapping Kan spaces"; also E0.3 (cores, `:225`) and E0.7 (Cartesian edges, `:362`).
- `README:27`, `:177` and `:2354`: qcqs objects of a topos from "`AdicSpacesPartII` §R0.19.10".
- `README:521`: "import `DerivedDeRham.derivedLimit` from `DerivedModuleAlgebra`, §1.1".
- `README:741`–`757`: the module derived Hom from DerivedModuleAlgebra §1.1.1.
- `Suggested.lean:44`: the E0 headlines "lack the supplied coherent mapping-space framework (right mapping spaces, …".

Claim: these carriers come only from those roadmaps.

Witness: each of these elaborates at the pin.
- `SSet.join` (`AlgebraicTopology/SimplicialSet/Join/Basic.lean`).
- `SSet.slice` with its universal property `SSet.slice.homEquiv` (`SimplicialSet/Slice.lean`).
- `SSet.rightMappingSpace` (`Quasicategory/RightMappingSpace.lean:89`), on which `TauCeti.dgNerve.rightMappingSpaceIso` is built.
- `SSet.core` (`Quasicategory/Core.lean`).
- `SSet.Edge.IsCartesian` and `SSet.CartesianFibration` (`Quasicategory/Cartesian.lean`).
- `TauCeti.Topos.IsQuasicompact` and `TauCeti.Topos.IsQuasiseparated` (`CategoryTheory/Topos/Quasicompact.lean`).
- `TauCeti.ModuleTower.derivedLimit : D(ModuleTower R) ⥤ D(ModuleCat R)` (`Algebra/Category/ModuleCat/Tower/DerivedLimit.lean`).
- `TauCeti.derivedHom` with `derivedHomHomologyLinearEquiv : Hⁿ RHom(L, M) ≃ (L ⟶ M⟦n⟧)` (`Algebra/Homology/DerivedCategory/DerivedHom.lean`).

Repair:
- Add these names to "From Tau Ceti", with their files.
- Point the cited passages at them.
- Keep the roadmap citations only for what the library lacks: for example the Kan property and rigidification of right mapping spaces, and categorical equivalences.
- Remove "right mapping spaces" from the gap list at `Suggested.lean:44`.

## R05 (P3) — The description says the change is README-only and states no order with #1330

Location: the pull-request description (`scratch/pull-request.md`, data): "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)". Its revision line names only #1701.

Claim: the description tells the approver how this change relates to main and to the other open pull requests.

Witness:
- `git diff --stat origin/main...HEAD` changes 535 lines of `Suggested.lean`.
- `roadmaps list` shows #1330 open (draft, `856fe7a`). `roadmaps overlaps` reports that #1330 conflicts with this head in `README.md` and `Suggested.lean`. #1330 still imports `TauCetiRoadmap.PurityOfBranchLocus.Suggested`.

Carried from r11 R01 (r10 R03, r9 R03, r8 R02, r7 R08). The repair reports answered it but did not mark it as not actionable.

Repair, in the description only:
- Say that `Suggested.lean` is rewritten (module form, the Tau Ceti import, the headline set) and that no roadmap imports it.
- Say that this head supersedes #1330, which is to be closed or rebased on it.
- Add the #1891 sentence of R03.

## R06 (P3) — The definitional-order paragraph states a symmetric monoidal equivalence for an arbitrary ring

Location: `README:42`: "The enhanced derived category of a ring or of a ringed site … The spectral description, `D(R) ≃ Mod_{HR}(Sp)` as symmetric monoidal presentable stable ∞-categories, is a theorem …".

Claim: the symmetric monoidal spectral description holds for the rings of the preceding sentence. Section 0.1 allows noncommutative rings (`README:431`).

Witness:
- HA Theorem 7.1.2.13 (`112b145a` line 46530, p. 1212) assumes R commutative.
- HA Remark 7.1.1.16 (line 46277, p. 1206) gives only `D(A) ≃ LMod_R`, with no monoidal structure.
- The target itself says "For every commutative ring R" (`README:1936`).

Repair: begin the sentence with "For a commutative ring R, the spectral description …". Cite Theorem 7.1.2.13 for the symmetric monoidal equivalence and Remark 7.1.1.16 for the underlying equivalence. Tested: this matches both HA passages and the target at `README:1936`.

## R07 (P3) — A Check of the intrinsic Tor bound tests the zero ring, which the hypotheses exclude

Location: `README:876`: "For the zero quotient R = 0, `dim R = ⊥ ≤ 0`; both modules and every Tor object are zero."

Claim: R = 0 is a permitted degenerate case of `perfect_torDimension_le_two_mul_dim`.

Witness: the theorem assumes `[CharP R p]` with `[Fact p.Prime]` (`Suggested.lean:211`), and the prose says "a perfect ring of characteristic p". In the zero ring every `(n : R)` vanishes, so `CharP R p` forces `p ∣ 1`, that is `p = 1`. So the Check tests no instance.

Repair: delete that sentence, and keep "taking M = 0 or N = 0 likewise gives zero in every degree" as the degenerate Check. Alternatively, say that R = 0 is excluded by the characteristic.

## R08 (P3) — The Stacks locator convention does not match the numbers used

Location: `README:80`: "Stacks locators give the chapter, the result number within the chapter PDF, the tag and the chapter-PDF page". Used at `README:447`, for example: "Stacks, Injectives, Theorem 19.12.6, tag 079P".

Claim: the numbers are those printed in the chapter PDF.

Witness: the Injectives chapter PDF prints "Theorem 12.6.079P" (`8042e600` line 883, p. 19), and Cohomology on Sites prints "Lemma 17.11" (`f1af633f` line 1342). The README uses book numbers (19.12.6, 21.17.11) throughout.

Repair: change the sentence to "the result number in the book (chapter.section.result; the chapter PDF prints it without the chapter number), the tag and the chapter-PDF page".

## Previous findings

- r11 R01 (the description) — not repaired. The head and the description are unchanged ("README only; no Lean change …", revision line naming only #1701). It is carried as R05.

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `cfbfa9cbfe08470d2c6ecd8c9c013127e0dc5f04`. The worktree is clean, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- The worker's gate is OK with every counter zero (`build=0`). My rerun (`gate … --base origin/main`, exit 0) prints the same counters, all zero, and `OK`; the build step is the worker's.
- The dependency check (`gate --depcheck … --movable`, exit 0) prints the line below. There is no UPWARD, CYCLE or `moved:` line. The roadmap is on main and not listed in `ORDER.txt`.

```text
depcheck: 238 roadmaps, 2368 edges, 0 problem(s)
```

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 with 11 warnings, all `declaration uses sorry`, at lines 91, 111, 138, 174, 186, 197, 209, 247, 277, 290 and 298.
- A scratch copy with `#check @` of all 19 declarations gives types that match their README statements. The 6 "looks dropped" leads of `scratch/signatures.md` are false: the binders `[Category A] [Abelian A] [IsGrothendieckAbelian A]` and `[Category C] [MonoidalCategory C]` are present under renamed universes, and nothing was changed.
- To elaborate the Tau Ceti witnesses I built 10 Tau Ceti modules with `lake build <module>` (6753 jobs, exit 0).

**Padding.** Each of the 11 sorried theorems was retried with `first | infer_instance | rfl | decide | simp | aesop`, and all 11 fail. `valuationSaturated_finite_free` is not one-tactic either, but it is a library theorem (R02).

**Library names.** All 308 backticked tokens of the README that look like Lean names were run through `#check @` at the pins, with `Mathlib` and 53 Tau Ceti modules imported (every built module that declares a cited name). 241 resolve. The other 67 are:
- roadmap names, module paths and the expressions `DerivedCategory.Q.map` and `X.Etale`;
- short forms whose full names resolve in a second file, for example `CategoryTheory.Functor.rightDerivedFunctorPlus`, `CategoryTheory.MorphismProperty.HasTwoOutOfThreeProperty` and `CategoryTheory.Triangulated.TStructure.eTruncGE`.

The roadmap's own 19 names, as before, are declared in `Suggested.lean`. Also checked:
- `IsRegularRing` extends `IsNoetherianRing` (Mathlib `RingTheory/RegularLocalRing/Defs.lean:93`), so the E1.6 headlines cannot be fed a non-Noetherian product of fields.
- `CommRing.Pic R := Shrink (Skeleton (SemimoduleCat R))ˣ` (`RingTheory/PicardGroup.lean:429`) matches `README:571`.
- `TauCeti.SheafOfModules.IsInvertible` is rank-one local freeness, a different notion, so the library does not already have `MonoidalCategory.IsInvertible`.

**Supplier citations resolved on main (`c58403c`).**
- SchemeAndStackFoundations:
  - §2.17: `IsReplete.derived_limits`, `IsReplete.derivedCategory_leftComplete`, `isReplete_of_locallyWeaklyContractible`;
  - §2.18: `DQCoh.affineEquiv`, `DQCoh.restrict`, `torIndependent_baseChange`;
  - §2.6: `qcoh_higherDirectImages`;
  - §2.5: `cohomology_filtered_colimits`;
  - §0.24: `Scheme.perfection`;
  - §4.12: `generic_flatness`, `flattening_by_blowup`;
  - §4.13: `IsRegular.isCohenMacaulay`;
  - and `Sheaf.derivedPushforward`, `Sheaf.higherDirectImage`, `leray_spectral_sequence`, `cech_to_cohomology`, `derivedPullback`, `totalDirectImage`.
- DerivedModuleAlgebra:
  - §0.I.1: `moduleKInjectiveReplacement`;
  - §1.1.1: `DerivedDeRham.moduleDerivedHom`;
  - §1.2: `DerivedDeRham.derivedCompleteness`;
  - §1.4: `DerivedDeRham.koszulCompletionTower`;
  - and `DerivedDeRham.derivedCompletion`, `.completionUnit`, `.derivedTensor`, `.derivedExteriorPower`, `.derivedLimit`, `Algebra.CotangentComplex` with `.resolutionIso`, `.transitivityTriangle`, `.regularQuotient`, and `test_derived_tensor_unbounded_flat`.
- PerfectoidSpaces: P0.14 `Almost.Algebra.isUnramified_iff_exists_idempotent` and `Almost.Algebra.IsFiniteEtale`; P7.16a `powerSeries_regular_field`.
- AdicSpacesPartII: R0.19.10 (README line 8005).
- BordismFormalGroups: F6.5 with the four sub-lane headings, lines 1546, 1823, 1944 and 2005.
- GeneralizedCohomology: G2 items 1–7 and G3 items 8–9.

**Sources: the seeded sample (0.1–0.4), read in the cache.**
- 0.1:
  - HA Definition 1.3.5.8 and Propositions 1.3.5.9 and 1.3.5.21 (`112b145a` lines 4739, 4743, 4874; pp. 125, 125, 129) define D(A) as the dg nerve of fibrant complexes and give stability, presentability, the t-structure and compatibility with filtered colimits.
  - Stacks, Injectives §12, with Theorem 12.6, tag 079P (`8042e600` line 883, p. 19).
- 0.2:
  - Cohomology on Sites, Lemma 17.11, tag 06YS (`f1af633f` line 1342, p. 31), §17 Flat resolutions and §19 Cohomology of unbounded complexes (line 1605).
  - Modules on Sites: 03EK (p. 33), Lemma 26.1, tag 0GMW (line 1580, p. 34), 04TT, Lemma 27.1, tag 03EM (p. 35), and Lemma 27.7, tag 03EP (p. 37) (`4da0acd5`).
  - HA Proposition 4.1.7.4 (p. 486).
- 0.3:
  - Cohomology on Sites §§17–18 and §35 (lines 1447, 3668).
  - HA Example 4.1.7.6 (p. 487).
  - Derived Categories §34, tag 08TB (`3d6c5169` line 5254, p. 105).
  - More on Algebra (`ab691797`): 07KW (Lemma 88.1, p. 231), 07KY (Lemma 88.10, p. 235), 091D (Lemma 89.1, p. 238), 091N (§93, p. 261), 091V (Lemma 93.10, p. 264), 0920 (Lemma 93.18), 0G1U (Lemma 93.20, p. 268) and 0923 (Lemma 95.2). Each supports the use made of it; for example, 0923 equates naive and derived completion exactly when the f-power torsion is bounded.
- 0.4:
  - Cohomology on Sites §18 Derived pullback and §19.
  - HA §1.3.4 Inverting Quasi-Isomorphisms.

**Other locators checked in the cache:**
- HA Remark 7.1.1.16 (p. 1206), Theorem 7.1.2.1 (p. 1206) and Theorem 7.1.2.13 (statement p. 1212), which the PR's new paragraph cites; Theorem 1.1.2.14 (p. 27), Propositions 1.1.3.4 and 1.1.4.1 (pp. 31, 33), and Construction 1.3.1.6 through Proposition 1.3.1.17 (pp. 81–85).
- BS17 (`b4d5a4e0`): Lemma 3.16 and Remark 3.17 (p. 14), Lemma 6.14 (p. 26), Lemma 11.10 (p. 42), Proposition 11.29 (p. 47), Proposition 11.31 (p. 48; its proof is the d + 1 bound of `perfect_projectiveDimension_le`), Remark 11.32 (p. 48), and Remark 11.33 and Corollary 11.35 (p. 49).
- BS-proet (`ae0960a2`): 23 results of §3, from Definition 3.1.1 (p. 16) to Lemma 3.5.7 (p. 25), each at the stated number and page. Example 3.1.4 is the presheaf-topos repleteness the parallel-arrow Check uses, and Example 3.3.4 is the `∏ ℤ_p`-sets topos of `README:676`.
- Cohomology on Sites tags 07A2, 06YT, 06YU, 0G7E, 06YY, 0D6D, 07A6, 0D6E, 0D6F, 0941, 0D6K, 0D6L, 0D6M, 0D6N and 0D6P, each at the stated page.

**Ownership and overlaps.**
- `roadmaps grep` for each headline object (`IsInvertible`, `IsDerivedComplete`, the étale `W.IsMonoidal`, `hasKInjectiveResolutions`/`hasDerivedCategory`, the Kunz converse, the saturated lattices) finds no second owner except #1891 (R03). CrystallineCohomology (#857) and DeformationAndDerivedPatchingAlgebra (#1034) cite this roadmap.
- HigherToposTheory (#1901, new, draft) claims presentability, Kan extensions and derived ∞-categories, and says that EnhancedDerivedSheaves takes them from it. This roadmap is on main and earlier, so that repair belongs to #1901 and asks nothing of this folder.
- #1187's copy of `Suggested.lean` equals main's.
- `scratch/overlaps.md` lists no dropped id and no id that only a revision defines. #1330 is R05.

**Adversarial computations.** These rows cover the sampled targets, the headlines and the targets of the findings. r8–r11's rows for the unchanged text are carried.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`Suggested.lean:91`) | `ModuleCat.{u} R`; the zero category | Tau Ceti's `HasKInjectiveResolutions (ModuleCat.{max v u} R)` is the same `Prop`, so there is no diamond; in the zero category every complex is 0 and K-injective; 079P gives termwise-injective K-injective resolutions; 6 probes fail | Pass |
| 2 | `locallySmall_localization_quasiIso` (`:111`) | `A = ModuleCat.{u} R` (`u' = u+1`, `v = w = u`) | gives `LocallySmall.{u}`; `standard` gives only `Type (u+1)`; trivial only when `w ≥ max u' v` | Pass |
| 3 | `hasDerivedCategory` (`:119`), Checks `README:454`–`455` | `ModuleCat.{u} R`; `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)` | `(K ⟶ L) : Type u` in both, against `Type (u+1)` under `standard` | Pass |
| 4 | `smallEtaleTopology_W_isMonoidal` (`:138`) | X = ∅; `Spec k`, k separably closed; `Spec k ⊔ Spec k` | ∅: every sheaf is 0, W is all maps, holds; `Spec k`: sheaves ≃ `ModuleCat Λ`; two points: presheaf tensor has X-sections `Λ⁴`, sheaf tensor `Λ²` | Pass |
| 5 | Koszul braiding, Check `README:490` | `K = [ℤ_X →id ℤ_X]` in degrees 0, 1 | unsigned swap: `τd(a⊗c) = c⊗da`, `dτ(a⊗c) = −c⊗da`, differing by `2c⊗da ≠ 0`; Koszul sign on `K¹⊗K¹` is −1 | Pass |
| 6 | `isInvertible_iff_isUnit_toSkeleton` (`:174`) | 𝟙; `ℤ/2` in `ModuleCat ℤ` | 𝟙: both sides true; `ℤ/2`: `tensorLeft` sends ℚ to 0, and `[ℤ/2]·[Y]` is 2-torsion, never `[ℤ]`: both false | Pass |
| 7 | `isRegular_of_frobenius_flat` (`:186`) | `𝔽_p[t]`; `𝔽_p[ε]/(ε²)`; R = 0 | `𝔽_p[t]`: free of rank p, regular; `𝔽_p[ε]/(ε²)`: Frobenius kills ε, not flat (`TauCeti.isReduced_of_flat_frobenius`), not regular; R = 0 excluded by `CharP R p` | Pass |
| 8 | `perfect_projectiveDimension_le` (`:197`) | `P₀ = R = 𝔽_p`; `P₀ = 𝔽_p[t]`, `R = P₀_perf`, `M = R/J_t` | d = 0: bound 1 ≥ 0; d = 1: `J_t` is flat, a countable union of free rank-one ideals and not finitely generated, so `pd J_t = 1` and `pd R/J_t = 2 = d + 1`: the bound is attained | Pass, sharp |
| 9 | `perfect_torDimension_le_two_mul_dim` (`:209`) | `R = (k[x,y]/(xy))_perf`, d = 1; `R = k` | `Tor₂(R/(x), R/(y)) = (y)/yJ ≅ k ≠ 0`, while the claim starts at `2d+1 = 3`; the resolution `0→J→R→R→R/(x)` gives `Tor_{≥3} = 0`; `R = k`: `Tor_{i+1} = 0` | Pass |
| 10 | `IsDerivedComplete` (`:270`) | R = ℤ, I = (p), M = `ℤ_p`, ℤ, `ℤ/p`, `ℤ[1/p]`; I = 0; I = ⊤ | `ℤ_p` T; ℤ F (`lim¹ = ℤ_p/ℤ`); `ℤ/p` T (the map is the identity); `ℤ[1/p]` F (`(p^{−n})` is in the kernel); I = 0: every M; I = ⊤: only M = 0 | Pass |
| 11 | `isDerivedComplete_iff_derivedCompleteness` (`:277`) | ℤ, `ℤ/p`, `ℤ[1/p]` | ℤ: F ⇔ `Hom(ℤ[1/p][−1], ℤ) = ℤ_p/ℤ ≠ 0`, F; `ℤ/p`: T ⇔ all Ext vanish, T; `ℤ[1/p]`: F ⇔ `Hom = ℤ[1/p] ≠ 0`, F; `hI` is not needed | Pass |
| 12 | `isAdicComplete_iff_derivedComplete_separated` (`:290`) | `ℤ_p`; ℤ; `M = coker ψ` (`README:2784`) | `ℤ_p` T/T; ℤ F/F; M: derived complete, not separated (`ē₀ = pᵏē_k`, and `ψ(b) = e₀` is impossible), F/F | Pass |
| 13 | `derivedCompleteModules_weakSerre` (`:298`) | `p : ℤ_p → ℤ_p`; I not finitely generated | kernel 0 and cokernel `𝔽_p`, both complete; the per-element six-term argument gives `lim = lim¹ = 0` without finite generation | Pass |
| 14 | `valuationSaturationMap`, `IsValuationSaturated`, `valuationSaturated_finite_free` | equality probe; r = 0 | both definitions are equal to Tau Ceti's; r = 0 gives `M = 0 ≅ V⁰`; Tau Ceti's theorem has weaker hypotheses | Duplicate (R02) |
| 15 | 0.1 Checks `README:441`–`442` | `A[1]`; `Cone(id)`; `Cone(0)` | `H⁻¹(A[1]) = A`; `Cone(0) = A[1] ⊕ A`; `Cone(id)` acyclic | Pass |
| 16 | 0.2 Check `README:474` | `I : Type u` copies of X | `⨿_I X → X` is étale with fibres of size `\|I\|`, so the iso classes are not `u`-small | Pass |
| 17 | 0.2 Check `README:503` | Λ = ℤ/4, `(ℤ/2)_X` | `Tor_i^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for all i, by the 2-periodic resolution | Pass |
| 18 | 0.3 Checks `README:518`, `:533` | `ℤ/n ⊗ᴸ ℤ/n`; `K_i = [ℤ → ℤ/ℓ^{i+1}]` | `Tor₁ = ℤ/n`; `H⁰(K_i) = ℓ^{i+1}ℤ` is not ML; `H¹(Rlim) = coker(ℤ → ℤ_ℓ) = ℤ_ℓ/ℤ` | Pass |
| 19 | 0.3 Check `README:577` | `Λ_X[1]` | `ε = (−1)^{1·1} = −1`, which differs from 1 when 2 ≠ 0 in Λ | Pass |
| 20 | Definitional order, `README:42` | noncommutative R | HA 7.1.1.16 gives `LMod_R`; 7.1.2.13 needs commutative R | R06 |
| 21 | E0.3, E0.6, E2.6 targets against Tau Ceti | the library lemmas | `fullEnhancedSubcategory_top` / `_bot` = Checks 233–234; `eId_eq_const` = *dgSimplicialCategory_unit*; `not_isHypercover_const_bool` = Check 2390 | R01 |
| 22 | E1.3 Check `README:662` | `Map(ℤ/p, ℤ/p[1])` | `π₀ = Ext¹ = ℤ/p`; `π₁ = H⁻¹ RHom = Hom = ℤ/p` | Pass |
| 23 | E1.9 Check `README:1182` | `B = k[t][ε]/(tε, ε²)`, `C = B/tB` | `g′*G = k` on both sides; `Tor₂^B(A, C) = Tor₁^B(k, C) = k` | Pass |
| 24 | E2.4 window, `README:2296`, `:2298` | `b ≡ 0`, m = 0 and m = −3 | N = 1 and N = 4; the obstruction degrees `m+n`, `m+n+1`, `m+n+2` match the triangle | Pass |
| 25 | E2:towers Check `README:1513` | `A = ℚ[t]`, `\|t\| = −2` | fibre tower `A[2(n+1)]`, each `H^k` eventually 0; transitions `t^{n+1} ≠ 0`; not stably pro-zero | Pass |
| 26 | E3.4 Check `README:1349` | free group, `h = ∅`, `g = 1` | the right mate `∅ → U(1)` exists, the reverse map `{*} → ∅` does not | Pass |
| 27 | E5:descent Check `README:1917` | `ℤ[a,b,c,d]/(ab+cd−1)` | the Jacobian `(b,a,d,c)` is the unit ideal; dimension 4; index ≤ 5; `(a,c) = (1)` | Pass |
| 28 | E5:animation Check `README:2001` | `WalkingReflexivePair`, comma at (one, one) | a script I wrote gives 13 objects, 40 non-identity arrows, 106 non-degenerate 2-simplices, `rank ∂₁ = 12`, `rank ∂₂ = 26`, `H₀ = ℚ` and `H₁ = ℚ²` | Pass |
| 29 | E5:animation Check `README:2078` | `k[2]` in cosimplicial degree 2 | `Tot = k[0]`, `Tot₁ = 0`; `b = 2`, so π₀ needs `r ≥ 3` | Pass |
| 30 | E1.7 Check `README:910` | `ℚ₃`, radius 1/2 | the open ball is 3V, and `Hom_V(3V, 3V) = V ≠ 3V` | Pass (Tau Ceti's) |
| 31 | Check `README:876` | R = 0 | `CharP 0 p` forces p = 1 | R07 |
| 32 | `IsInvertible` ownership | #1891, `README:1823`–`1824` | "built here" against `README:571` and `Suggested.lean:168` | R03 |

## Not verifiable

- None: every text consulted was read in the cache. Locators into HTT, Liu–Zheng, Nikolaus–Scholze, Mathew, Robalo, Ramzi, Efimov, Fargues–Scholze, Berkovich motives, Bhatt's two papers, Bhatt–Lurie, SAG and ECD are outside the seeded sample, are touched by no finding, and were not checked in this round.

## Source issues

- none
