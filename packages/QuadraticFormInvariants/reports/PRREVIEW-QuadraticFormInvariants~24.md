# Review of QuadraticFormInvariants (pull request #1411 at cded4a2)

**Verdict:** needs changes

This pull request changes `TauCetiRoadmap/QuadraticFormInvariants/` by two import lines (`Suggested.lean` 35–36). As instructed, this is a full review of the folder at `cded4a2`. Findings are numbered most severe first.

## R01 (P1) — `instance squareClass_finite` lost its local-field binders and is false on ℚ

- **Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:973`: "instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) := sorry", inside `section LocalField`, whose `variable [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` the type never mentions.
- **Claim.** An `instance` keeps only the section variables its type mentions. It elaborates to `∀ (K : Type u_1) [Field K] [Invertible 2], Finite (Kˣ ⧸ Subgroup.square Kˣ)`. That is false for ℚ, and because it is a global, sorry-backed instance, every importer gets it. Three roadmaps import this module at this head: GlobalQuadraticForms, IntegralLattices and Completed/OrthogonalSpinGroups.
- **Witness.** A scratch file importing this module: `#synth Finite (ℚˣ ⧸ Subgroup.square ℚˣ)` returns `TauCetiRoadmap.QuadraticFormInvariants.squareClass_finite ℚ`. The classes of 2, 3, 5, 7, … are pairwise distinct in `ℚˣ/(ℚˣ)²`.
- **Repair.** Delete the instance and its docstring (lines 970–974). No consumer uses it, and the local count is Tau Ceti's (`TauCeti.card_squareClass_of_odd`, `NumberTheory/LocalField/SquareClass.lean`; the dyadic count via `NumberTheory/LocalField/SquareClasses.lean`). Tested on a copy: with it deleted the file elaborates, and the appended `#synth` on ℚ fails to synthesize. Restating the binders explicitly in the signature also removes the false instance (tested), but it triggers the overlapping-instances linter, so deletion is the clean fix.

## R02 (P2) — Eight more `sorry`'d data declarations (gate `sorry-data`)

- **Location.** `Suggested.lean` 824 `cliffordHomI2`, 866 `cliffordHomI2Bar`, 1571 `kummerSquareClassEquiv`, 1621 `resHUnits`, 1837 `cocycleOfSplitting`, 1864 `TwoCocycle.comap`, 2355 `brauerCohomologyEquiv`, 2360 `brauer2EquivH2`; each body is `sorry`.
- **Claim.** Sorry'd data is excluded by the principles. Each of these also restates a constructed definition at the pinned Tau Ceti, so the theorems stated about them are about an opaque copy.
- **Witness.** Pinned Tau Ceti has the following. `cliffordHomI2` and `cliffordHomI2Bar` are in `Witt/Clifford.lean`. `kummerSquareClassEquiv` is in `MuTwo/Basic.lean`. `galoisResUnits` is at `GaloisCohomology/UnitsRestriction.lean:62`. `cocycleOfSplitting` is in `CrossedProduct/Splitting/Basic.lean`, and `TwoCocycle.comap` at `CrossedProduct/Basic.lean:201`. `brauerCohomologyEquiv` is at `Comparison.lean:274`, and `brauer2EquivH2` is in `TwoTorsion.lean`.
- **Repair.** Delete these eight declarations and the theorems stated about them. None is among the eleven names consumers import (R07). Cite the Tau Ceti declarations in the README's supplier section.

## R03 (P2) — 51 `set_option` lines (gate `set_option`)

- **Location.** `Suggested.lean` 1983–2333, 2364–2389, 2415–2436 and 3554: "set_option maxHeartbeats 1000000 in" and "set_option synthInstance.maxHeartbeats 400000 in".
- **Claim.** Every `set_option` is forbidden. All the affected declarations restate Tau Ceti's inflation and comparison API.
- **Witness.** `TwoCocycle.inflate`, `TwoCocycle.inflate_comap`, `finiteLevelZ2`, `finiteLevelClass`, `GaloisCocycle.inflateClass` and `exists_galoisCocycle_inflateClass` are in `Algebra/CrossedProduct/Inflation.lean`. `brauerCohomologyEquiv_crossedProductClass` and `brauerCohomologyEquiv_unique` are in `Comparison.lean`, `brauerCohomologyEquiv_quaternionClass` in `CupProduct.lean`, and `galoisEvens2_kummerClass_eq_pullback` in `MuTwo/EvensNorm.lean`.
- **Repair.** Delete the declarations at 1960–2345 and 2364–2446, and the one at 3554–3570 (padding, R07). That removes every `set_option`. Do not restate them under defaults.

## R04 (P2) — README cites two ClassFieldTheory lemmas that this pull request deletes

- **Location.** `README.md:703–704`: "`ClassFieldTheory.muNRepCoeffDictionary` is its identity, with `muNRepCoeffDictionary_continuous` and `muNRepCoeffDictionary_equivariant`".
- **Claim.** These are supplier citations of declarations that do not exist at this head. This pull request's ClassFieldTheory revision drops them, and no old → new mapping is given.
- **Witness.** On main, ClassFieldTheory `Suggested.lean:789` and `:793` declare them. At this head, ClassFieldTheory `Suggested.lean:423` keeps only the abbrev `muNRepCoeffDictionary := TauCeti.ClassFieldTheory.kummerCoeffEquivMuNRep n F`, and neither lemma appears in its README or Lean.
- **Repair.** Cite Tau Ceti's `TauCeti.ClassFieldTheory.continuous_kummerCoeffEquivMuNRep` (`NumberTheory/ClassFieldTheory/MuNRep.lean:154`) and `TauCeti.ClassFieldTheory.kummerCoeffEquivMuNRep_smul` (`:165`), and change the docstring at `Suggested.lean:2526` the same way.

## R05 (P2) — The 6C "alternative early norm-index construction" cites five Tau Ceti declarations that do not exist

- **Location.** `README.md:1986–1988`: "Install TauCeti.algebraicExtensionValuativeRel, algebraicExtensionNormedFieldTopology, finiteExtension_isNonarchimedeanLocalField and algebraicExtension_valuativeExtension … Apply the already proved TauCeti.index_normGroup_of_isCyclic".
- **Claim.** The proof route's inputs are presented as pinned declarations ("already proved"), but none of the five exists at the pinned Tau Ceti or Mathlib. So the route has unowned inputs. The milestone it serves, norm index two, is already pinned under another name. The three paragraphs are also unformatted run-on text with missing spaces ("Layer2", "classical6D", "6E/7B").
- **Witness.** A search of the pinned `TauCeti/` and `Mathlib/` trees for each of the five names finds no declaration. The pinned index theorem is `TauCeti.quadraticNormSubgroup_index_eq_two_of_not_isSquare` (`NumberTheory/LocalField/QuadraticForm/Bimultiplicativity.lean:82`).
- **Repair.** Delete lines 1986–1990. Item 4 of 6C (line 2035) then cites `quadraticNormSubgroup_index_eq_two_of_not_isSquare`. Rewrite 3305–3310 ("Layer 6 first consumes6A …") as one sentence ordering 6A, 6B, 6C, 6D, 6E.

## R06 (P2) — 6E's second milestone rests on a mixed-characteristic-only supplier, but Layer 6 includes equal characteristic

- **Location.** `README.md:2259–2262`: "under the identification `Br(K)[2] ≅ H²(G_K, μ₂)` of Layer 7B, `h2MuEquivZMod_mixed` carries the division class to the nonzero element of `ZMod 2`". Also the prerequisite lines 2014–2016 and 2243–2244, and the contract rows 685 and 687.
- **Claim.** Layer 6's scope (1602–1605) includes "local fields of positive odd characteristic". For such `K` the normalization named here is not defined, so the milestone has no supplier on part of its stated scope. The Lean bridge `hilbertSymbol_eq_cohomological` (2554) avoids this by taking an arbitrary `tr`. The README and the Lean therefore differ in generality.
- **Witness.** ClassFieldTheory at this head, `Suggested.lean:493–496`: `h2MuEquivZMod_mixed` requires `[Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]`. For `K = 𝔽₃((t))`, `Br(K)[2] ≅ ℤ/2` holds, but no supplier term exists.
- **Repair.** State milestone 2 through ClassFieldTheory Layer 5's `invMap` (head `Suggested.lean:486`, defined for every `IsNonarchimedeanLocalField`), which sends `[D]` to `1/2`. Keep `h2MuEquivZMod_mixed` as the mixed-characteristic reading. Do the same for `tateDualityPairing_perfect_mixed` in the 6C prerequisites, or restrict those milestones to finite extensions of `ℚ_p` and say so in the scope.

## R07 (P3) — `Suggested.lean` is an API catalogue that restates the pinned library; every headline is already proved at the pins

- **Location.** All of `Suggested.lean` (3875 lines: 189 theorems, 93 defs/abbrevs, 41 `example`s, structures and instances).
- **Claim.** 169 of 285 named declarations have a same-named declaration in the matching pinned Tau Ceti directories (quadratic forms, quaternions, crossed products, Galois cohomology, local fields). The README's headline theorems are all sorry-free at the pinned Tau Ceti:
  - the four-fold criterion, `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae` (`Algebra/Quaternion/SplittingCriterion.lean:156`);
  - the local classification, `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` (`NumberTheory/LocalField/QuadraticForm/Classification.lean:132`);
  - Kahn's degree-2 formula, `sw2Class_formClass_traceTransfer_smul_sq` (`FieldTheory/QuadraticForm/StiefelWhitney/QuadraticExtension.lean:249`), with degree 1 at `sw1Class_traceTransfer_mk_rankOne` (`StiefelWhitney/Transfer.lean:137`);
  - `brauerCohomologyEquiv` (`Comparison.lean:274`);
  - `cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`);
  - `hilbertSymbol_eq_cohomological` (`MuTwo/LocalSymbol.lean:191`);
  - `hilbertSymbol_productFormula` (`NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`);
  - `galoisEvens2_kummerClass` (`StiefelWhitney/Evens/Kummer/Value.lean:220`);
  - `brauer2EquivH2_cliffordInvariant` (`StiefelWhitney/Clifford.lean:96`);
  - `hilbertSymbol_mul_right` (`Bimultiplicativity.lean:97`);
  - `not_anisotropic_of_five_le_rank` (`Isotropy.lean:284`).

  A sorried restatement of a proved theorem is padding. The module docstring does not say that the headlines are proved at the pins. Some restatements are also narrower than the pin. `hilbertSymbol_padicTwo` (1398) takes `α β : ℕ`, while Tau Ceti's (`PadicTwo.lean:180`) takes `ℤ`: `(1/2, 5)_{ℚ₂} = −1` is outside the Lean statement. `hilbertSymbol_unramified` (1218) carries the conclusion in its hypothesis `hu` once `TauCeti.hilbertSymbol_def` is unfolded. `hilbertSymbol_productFormula` (2580) mentions no object of this roadmap.
- **Witness.** One-tactic probe (scratch, importing this module plus `MuTwo.CupNorm` and `MuTwo.BrauerTorsion`, exit 0, no messages). Twelve sorried theorems each close by a single `exact` of the pinned lemma: `hilbertSymbol_congr_sq`, `_neg_self`, `_comm`, `_self`, `_mul` (`hilbertSymbol_mul_right (Invertible.ne_zero 2)`), `exists_hilbertSymbol_eq_neg_one`, `hilbertSymbol_unramified`, `quaternionClass_mul`, `_sq`, `_one_sub`, `isUniformizer_iff_exists_irreducible`, `h2MuToUnits_injective`.
- **Repair.** Delete every declaration except the eleven names that consumers at this head import: `hilbertSymbol`, `hilbertSign`, `localHasse`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_neg_self`, `exists_hilbertSymbol_eq_neg_one`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` and `hasseInvariant_eq_localHasse` (used by GlobalQuadraticForms, IntegralLattices and Completed/OrthogonalSpinGroups). Keep also `quaternionClass` and `hasseInvariant`, which `hasseInvariant_eq_localHasse` mentions. Give each kept theorem a proof by its Tau Ceti counterpart, as the probe does, instead of `sorry`. The README keeps every statement as a target. The module docstring names the pinned Tau Ceti declaration of each headline. Open pull requests #1215 and #1797 already carry 296–298-line versions of this file in this direction (R17).

## R08 (P3) — Ten admitted `example`s (gate `sorry-examples`)

- **Location.** `Suggested.lean` 1413, 1418, 1423, 1436, 1441, 2776, 2788, 2816, 2824 and 3832, each `:= sorry`.
- **Claim.** An admitted example tests nothing. These compute small values, for example `(−1,−1)_{ℚ₂} = −1` and `⟨1,1,1,1⟩` anisotropic over `ℚ₂`, which is padding in any case.
- **Witness.** Gate: "every `example` is proved: an admitted example tests nothing". The ℚ₂ values are pinned in `hilbertSymbol_padicTwoSquareClassRep` (`NumberTheory/LocalField/QuadraticForm/PadicTwo.lean:430`) and `NumberTheory/LocalField/Quaternion/Examples.lean`.
- **Repair.** Delete the ten examples. The README's worked examples (3202–3254) keep them.

## R09 (P3) — `Suggested.lean` imports other roadmaps' modules (gate `imports`)

- **Location.** `Suggested.lean:2–4`: "import TauCetiRoadmap.ProfiniteCohomology.Suggested", "import Completed.LocalFieldsRamification.Suggested", "import TauCetiRoadmap.ClassFieldTheory.Suggested".
- **Claim.** Only `import Mathlib` and `TauCeti.*` modules are allowed. This coupling is also why this pull request must edit the folder at all. It adds `TauCeti.FieldTheory.Trace` and `TauCeti.RingTheory.Norm.Quadratic` (35–36) because ClassFieldTheory's module stopped re-exporting them.
- **Witness.** `git diff origin/main...HEAD -- TauCetiRoadmap/QuadraticFormInvariants` is exactly those two import lines. Tau Ceti's own `hilbertSymbol_eq_cohomological` states the bridge on `TauCeti.ClassFieldTheory.localSymbol` and `kummerCupPairing` without any roadmap module.
- **Repair.** Replace lines 2–4 by the `TauCeti.*` modules that the kept declarations (R07) need. State the bridges on the Tau Ceti carriers, `TauCeti.ClassFieldTheory.*` and `TauCeti.trivialF2TopPairing`.

## R10 (P3) — Two linter warnings besides `sorry` (gate `build`)

- **Location.** `Suggested.lean:3334:77` and `3335:16`, inside the proved `pinDiagonalLift_mul`: "rcases hZ b' with rfl | rfl <;>" and "(simp … only [↓reduceIte, one_mul, mul_one] <;>".
- **Claim.** `sorry` must be the only warning.
- **Witness.** `lake env lean` exits 0 with 136 `sorry` warnings and "Unused tactic linter: `<;>` can be removed" at those two positions. The lemma restates Tau Ceti's `pinDiagonalLift_mul` (`LinearAlgebra/Matrix/PinPlusPlane/Basic.lean`).
- **Repair.** Delete the lemma (R07). Dropping the two `<;>` would also silence the warnings, but the lemma itself is padding.

## R11 (P3) — Process narrative, including status claims that are false at the pins

- **Location.** `README.md:33–150` ("## Completion audit (2026-10-28)", "Audit status: incomplete. This roadmap remains active."). Also 101–103 and 779 (TauCeti#22016, #22020, #22022); "audited native revision" (818, 2690); "landed" (167, 481, 602, 3168, 3324); "private migration and provenance ledger" (3440, 3444). In `Suggested.lean`: "`gq2`'s B11a" (405) and "B11a's orientation" (1211).
- **Claim.** Roadmaps are timeless; the README guidance and the policy class forbid dated audits, pull-request numbers, commit hashes and pipeline jargon. The audit's two factual claims are also false at this head: the outstanding square (86–95), and the pin (146).
- **Witness.** Pinned Tau Ceti proves the "outstanding" equation as `brauerExplicitH2Equiv_uliftEquiv` (`Algebra/CrossedProduct/BaseChange/ULift.lean:205`), with the continuous form `brauerCohomologyEquiv_uliftEquiv` (`:229`). `lake-manifest.json` pins Tau Ceti `2fd255d9…`, not `a91d3aaf…` (README 146).
- **Repair.** Delete lines 33–150. Reword the other passages timelessly ("Tau Ceti's … in `<file>`") without pull-request numbers, "audited" or "landed". Delete the ledger sentences, and replace "B11a"/"gq2" with the cited roadmap and section. Keep the "Native interfaces and remaining comparisons" heading and its stages 1–2, which K2SymbolsBrauer (README line 10) cites. State them as the pinned `brauerExplicitH2Equiv_uliftEquiv` and `brauerCohomologyEquiv_uliftEquiv`.

## R12 (P3) — Stray file `NativeCompletion.md` (gate `stray-files`)

- **Location.** `TauCetiRoadmap/QuadraticFormInvariants/NativeCompletion.md`, referenced from `README.md` 112, 113, 118, 119 and 125.
- **Claim.** A roadmap folder holds only the roadmap files. The README points readers to it for "checked interfaces".
- **Witness.** Gate: "NativeCompletion.md: not a roadmap file".
- **Repair.** Delete it; sources are the README's references. Delete the table at 110–127 with R11.

## R13 (P3) — Wrong layer locators for the ClassFieldTheory supplier

- **Location.** `README.md:685` "| Layers 6E and 7C, the local invariant normalization | 2--3 |", 686 and 687 "| 3 |", 688 "| 5 |", 2014 "[Class Field Theory, Layers 2--3]" and 2243.
- **Claim.** `H`, `muNRep`, `h2MuEquivZMod_mixed`, `kummerClass`, `kummerCupPairing`, `localSymbol` and `tateDualityPairing_perfect_mixed` are in ClassFieldTheory Layer 5. `finiteHilbertInvariantAt` and `hilbertProductFormula` are in Layer 14. This holds both on main and at this head.
- **Witness.** ClassFieldTheory at this head: "## Layer 5: local coefficients, the Brauer group, the local invariant, and duality" (README 911), with `localSymbol` at 1016–1024. "## Layer 14: Hilbert reciprocity" is at 2211, with `finiteHilbertInvariantAt` at 2215. On main they are at 920 and 1872.
- **Repair.** Change "2--3" and "3" to "5", and "5" to "14", in those six places.

## R14 (P3) — Wrong Tau Ceti names for the roundness of Pfister forms

- **Location.** `README.md:1422–1423`: "`TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`, `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`".
- **Claim.** Neither name exists at the pin. The pinned statements are `iff`s.
- **Witness.** `LinearAlgebra/QuadraticForm/Witt/Round.lean:44` `oneFoldPfister_smul_equivalent_iff` and `:61` `twoFoldPfister_smul_equivalent_iff`, over any commutative ring.
- **Repair.** Cite those two names, and the reverse direction of each `iff` for roundness.

## R15 (P3) — Eleven supplier names written unqualified, so the gate reads them as this roadmap's own (gate `readme-ids-missing`)

- **Location.** `README.md` 90, 528, 541, 676, 776, 780, 1037, 1191, 1283–1284, 1658, 1327.
- **Claim.** Each name exists at a supplier, but bare backticks claim a declaration of this roadmap.
- **Witness.** The pinned locations are:
  - `RegularFormClass.discr_baseChange`: `RegularFormClass/BaseChange.lean:437`;
  - `signedDiscr_add`, `signedDiscr_mul` and `signedDiscr_mk_rankOne_mul`: `RegularFormClass/Discriminant.lean:310`, `321` and `329`;
  - `discr_one_elem_eq_of_sq_algebraMap`: `FieldTheory/Trace.lean:78`;
  - `IntermediateField.finrank_adjoin_simple_eq_two_of_sq_mem_notMem`: `IntermediateField/Quadratic.lean:113`;
  - `hilbertSymbol_mul_right`: `Bimultiplicativity.lean:97`;
  - `map_ker_reₗ_of_algEquiv`: `Quaternion/AlgEquiv.lean:150`;
  - `sw1Class_traceTransfer_mk_rankOne`: `StiefelWhitney/Transfer.lean:137`;
  - `brauerCohomologyEquiv_baseChange`: `CrossedProduct/BaseChange/Naturality.lean:51`;
  - `map_norm_unitFiltration_zero`: LocalFieldsRamification `Suggested.lean`.
- **Repair.** Qualify each, for example `TauCeti.RegularFormClass.signedDiscr_add` and `LocalFieldsRamification.map_norm_unitFiltration_zero`. Line 90 goes with R11.

## R16 (P3) — The README does not follow the roadmap shape

- **Location.** Headings `## Scope` (170), `## What this roadmap consumes` (399), `## The build, in layers` (897) with `### Layer k` (919–2797), and `## Ownership and coordination` (3379). There are no `**Checks.**` lists, no `*Needs:*` lines, no per-layer `### Examples`/`### Dependencies`, and no `## Downstream consumers`.
- **Claim.** Every definition needs an API list and at least three discriminating Checks, and every layer its dependencies, in the house shape. "Basic API" bullets mix constructors, examples and edge cases instead.
- **Witness.** `grep -c 'Needs:\|Checks' README.md` returns 0. `hilbertSymbol`, `localHasse`, `quadraticDefect`, `sw1Class` and `scharlauTransfer` have no Checks block.
- **Repair.** Restructure into `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n`, `*Needs:*` lines, `### Examples` and `### Dependencies`, and `## Downstream consumers` (GlobalQuadraticForms, IntegralLattices, OrthogonalSpinGroups, K2SymbolsBrauer). Turn the existing edge cases and worked values into `**Checks.**`. For example, for `hilbertSymbol`: `(2,5)_{ℚ₂} = −1`; `(−1,−1)_{ℚ_p} = +1` for odd `p`; and the ℚ non-bimultiplicativity at `(−1, 3·7)`.

## R17 (P3) — No stated order against #1797 and #1187, which both change this folder

- **Location.** The pull request description's merge-order paragraph names #617 and #1215 only.
- **Claim.** #1797 and #1187 conflict with this head in `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`. #1797 (296 lines) and #1215 (298 lines) rewrite the file this head keeps at 3875 lines plus two imports.
- **Witness.** `scratch/overlaps.md`: "#1411 and #1797 conflict in … `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`". #1187 conflicts in the same file. `roadmaps show QuadraticFormInvariants --pr 1797 --file Suggested.lean` gives 296 lines.
- **Repair.** State in the description which merges first. For example, rebase this pull request onto #1797, drop the two-line edit if the rebased file no longer imports ClassFieldTheory's module, and say the same for #1187.

## R18 (P3) — Edit outside the pull request's folders (gate `outside-folder`)

- **Location.** `Completed/LocalGaloisGroups/Suggested.lean` 326 and 485, which wrap two ClassFieldTheory calls in `⟨…⟩`.
- **Claim.** This pull request's folders are ClassFieldTheory, IntegralLattices and QuadraticFormInvariants. A fourth folder edited to absorb a supplier signature change is an outside edit.
- **Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuadraticFormInvariants' ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/IntegralLattices'` lists `Completed/LocalGaloisGroups/Suggested.lean | 4`.
- **Repair.** Keep ClassFieldTheory's `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` at their main shapes (`Nonempty`-valued) so the consumer is untouched. Otherwise move the adaptation into its own pull request on that folder.

## R19 (P3) — Four cited works have no manifest entry

- **Location.** `README.md:3331` (Lam, "PRIMARY"), 3365 (Gille–Szamuely, "reference of record for Layers 5 and 7"), 3376 (Grove) and 3348 (O'Meara 1955).
- **Claim.** Every cited work is recorded in `sources.toml`. These four are absent, so their locators carry no status.
- **Witness.** The `sources.toml` ids are `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985` and `ekm2008`. There is no entry for Lam, Gille–Szamuely, Grove or O'Meara 1955.
- **Repair.** Add the four with their locators (Lam V.3.17–3.21, III.2.7, III.2.11, I.5.1–I.5.2, VII §1; Gille–Szamuely 1.1.9, 1.5.2, 4.4, 4.7). Record them as `uncertified` where only a paywalled copy exists.

## Verified sound

**Gate.** The worker's gate fails, with `set_option` 51, `tex` 14, `sorry-data` 9, `sorry-examples` 10, `imports` 1, `readme-ids-missing` 11, `stray-files` 1, `outside-folder` 1 and `build` 2. Every one of these is covered by a finding above except `tex`. My own run of the gate reproduces the same counts. Its `outside-folder` count is 4 because it also lists ClassFieldTheory and IntegralLattices, which are this pull request's own folders. The 14 `tex` hits are false positives under the stated rule ("outside code spans and code blocks"). Lines 1278, 1280, 1520, 1842, 1860, 1870, 2077, 2377, 2972, 2973 and 3113 sit inside indented `text` fences within list items. Line 593 is the second line of a code span that opens on 592.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2331 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. This roadmap is on main and not in the merge order. Its suppliers are LocalFieldsRamification, ProfiniteCohomology, ClassFieldTheory, SemisimpleAlgebras and Multiquadratic, all on main.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 38 s, with 136 `sorry` warnings and the two linter warnings of R10.

**Signatures.** `#check @` of all 285 named declarations, in one scratch file, exits 0. The binder audit found one problem: `squareClass_finite` (R01) lost its local binders. `IsQuadraticDefect` dropped `[IsNonarchimedeanLocalField K]`, which is harmless because it needs only `ValuativeRel`. All 27 theorems of 6A–6D keep `IsNonarchimedeanLocalField`. Elaborated types were compared with the README for the headline statements: `relativeStiefelWhitney_quadraticExtension`, `galoisEvens2_kummerClass` and its three corollaries, `cliffordInvariant_eq`, `hilbertSymbol_of_odd`, `exists_of_realization`, `hasseInvariant_eq_localHasse` and `hilbertSymbol_eq_cohomological`.

**Probes.** The R07 padding probe and the R01 repair test are recorded with their findings.

**Cross-roadmap citations resolved.**
- LocalFieldsRamification (main): all 33 contract names exist in `Completed/LocalFieldsRamification/Suggested.lean`. The layers are correct: Layer 0 at README 72, Layer 1 at 281, Layer 2 at 576, *Graded pieces* at 320, *Existence and uniqueness* at 638.
- ProfiniteCohomology (main): all 98 contract names exist in its `Suggested.lean`.
- SemisimpleAlgebras (main): `tensorProduct_isSimpleRing` (`Suggested.lean:132`), `tensorOp_algEquiv_matrix` (143), and `IsSplittingField` (187) in Layers 4 and 6.
- ClassFieldTheory (this head): 17 of 19 names exist; R04 covers the other two.
- The worker's four citation leads: `absoluteGaloisGroupComparison` and `muNRepCoeffDictionary` exist at ClassFieldTheory head `Suggested.lean:405` and `:423`, so those leads are false. The roundness names are real misses (R14).

**Ownership.** Searched open roadmap pull requests and main for owners of the Hilbert symbol, the cup-norm criterion and the norm-residue symbol. K2SymbolsBrauer (#1302) README line 10 and K2SymbolsBrauerPartII (#1432) README lines 13 and 104 cite this roadmap's §§6C, 6E and 7B, and the "Native interfaces" stages 1–2, as owner. QuadraticFormInvariantsPartII (#1834) takes exactly this roadmap's three exclusions. No second owner was found.

**Seeded sample.**
1. "Audit status: incomplete …": false at the pin (R11).
2. "From the local-fields-ramification roadmap": all rows resolve.
3. "From the class-field-theory roadmap": two dropped ids (R04) and wrong layers (R13).
4. "From the profinite-cohomology roadmap": all rows resolve.
5. "The Hilbert symbol is this roadmap's, in both halves": consistent with ClassFieldTheory (no norm-equation symbol there) and with K2SymbolsBrauerPartII. The pinned implementation is `TauCeti.hilbertSymbol` (`NumberTheory/HilbertSymbol/Basic.lean:47`).
6. "Compatibility with the cup product": recomputed in table row 19. Correct, given Q(K) = Br(K)[2].
7. "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion": no competing owner; pinned as `TauCeti.cup_kummerClass_eq_zero_iff` over any field with 2 invertible (`MuTwo/CupNorm.lean:103`), matching the stated generality. Its locators are under Not verifiable.

**Sources read.**
- `kahn1984` line 55 (Théorème 2: the total class of a transferred form), lines 763–765 (Lemme II.2.1, printed p. 241: the value of the norm, with the two trace cases exactly as README 2972–2973), and lines 1044–1058 (Prop. II.3.5: rank one, quadratic extension).
- `serre1984cmh` lines 560–562 (Théorème 1′, printed p. 668: `w₂(Q_{E,α}) = e*_α s'_n + (2)(d_E)`, with the source's remark that the discriminant of `E` enters). This matches README 3061–3063.

**Pinned declarations opened.** All in Tau Ceti unless noted:
- `NumberTheory/HilbertSymbol/Basic.lean:47, 251`;
- `Bimultiplicativity.lean:82, 97, 155`;
- `Classification.lean:132`;
- `Algebra/Quaternion/SplittingCriterion.lean:156`;
- `MuTwo/LocalSymbol.lean:180–199`;
- `MuTwo/CupNorm.lean:103`;
- `StiefelWhitney/QuadraticExtension.lean:240–275`;
- `CrossedProduct/BaseChange/ULift.lean:200–240`;
- `Witt/Round.lean:44, 61`;
- `PadicTwo.lean:180, 430`;
- `UnramifiedClass.lean` (`hilbertSymbol_unramified`, `exists_unramified_class`);
- `Ramification/Dictionary.lean` (`unramified_class_unique`);
- `Realization.lean` (`exists_of_realization`);
- `NumberTheory/ClassFieldTheory/MuNRep.lean:150–165`;
- `Isotropy.lean:284`;
- `NumberTheory/LocalField/SquareClasses.lean:100–125`;
- Mathlib `Algebra/QuadraticAlgebra/NormDeterminant.lean:30`.

**Adversarial table.**

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | `squareClass_finite` (Lean 973) | `K = ℚ` | instance found by `#synth`; `[2],[3],[5],[7]` distinct since `3/2, 5/2, 7/3` are not squares → infinite | false | R01 |
| 2 | ℚ₂ Gram matrix (README 2117–2124) | basis `−1, 2, 5` | `(−1,−1)`: `ε(7)²=1` → −1; `(−1,2)`: `ω(7)=0` → +1; `(−1,5)`: `ε(7)ε(5)=0` → +1; `(2,2)`: `ω(1)+ω(1)=0` → +1; `(2,5)`: `ω(5)=1` → −1; `(5,5)`: `ε(5)²=0` → +1 | matches | none |
| 3 | `serreEps`, `serreOmega` (Lean 1379–1386) | `u ≡ 1,3,5,7 (8)` | `(u−1)/2 = 0,1,2,3` → `0,1,0,1`; `(u²−1)/8 = 0,1,3,6` → `0,1,1,0`; definitions give the same | matches | none |
| 4 | `hilbertSymbol_padicTwo` (Lean 1398, `α β : ℕ`) | `a = 1/2, b = 5` | true value `(1/2,5) = (2,5) = −1`; `1/2 ≠ 2^α u` for `α : ℕ`, so the statement is silent; pin takes `α : ℤ` | narrower than README and pin | R07 |
| 5 | odd closed formula (README 2065–2077) | `ℚ₃, π = 3`; `ℚ₅, π = 5` | `(3,3)₃ = (3,−1)₃ = (−1|3) = −1 = (−1)^{(3−1)/2}`; `(5,5)₅ = (−1|5) = +1 = (−1)^2` | matches | none |
| 6 | isotropy, rank 3 (README 2193) | `⟨1,1,1⟩`, `⟨1,1,−1⟩` over ℚ₂ | first: `s = 1`, `(−1,−d) = (−1,−1) = −1` → anisotropic; second: `d = −1`, `s = 1`, `(−1,1) = 1` → isotropic at `(1,0,1)` | matches | none |
| 7 | rank 4 and the unique anisotropic quaternary (README 2194, 2204) | `⟨1,1,1,1⟩` over ℚ₂, ℚ₃ | `d = 1, s = 1`; `(−1,−1)₂ = −1 ≠ s` → anisotropic; `(−1,−1)₃ = 1 = s` → isotropic | matches | none |
| 8 | realization (README 2185–2189; Lean 1321) | `(2,[−1],−1)`, `(2,[1],−1)`, `(1,[3],1)` over ℚ₂ | `⟨a,−a⟩` has `s = (a,−a) = 1`, so the first is excluded; `⟨−1,−1⟩`: `d = 1, s = −1`; `⟨3⟩` | matches | none |
| 9 | Lam V.3.20, `cliffordInvariant_eq` (README 1542; Lean 779) | `n = 0..4` | ℕ exponents `0,0,0,1,3` vs ℤ `1,0,0,1,3`; at `n = 0` the factor is `(−1,1) = 1`; `n = 3`: `C₀ = (−ab,−bc) = s·(−1,abc)·(−1,−1)` by bilinear expansion; `n = 4`, `⟨1,1,1,1⟩/ℝ`: `c = (−1,−1)`, and `Cl₄,₀ ≅ M₂(ℍ)` | matches; ℕ junk harmless | none |
| 10 | I² reduction (README 1544) | `m = 1..5` | `C(2m+1,4) = 0,5,35,126,330` → parity `0,1,1,0,0`; `m(m−1)/2` → `0,1,1,0,0`; `(−1,(−1)^m)^{(2m−1)(m−1)} = 1` | matches | none |
| 11 | `cliffordInvariant_append_of_mem_I2` (Lean 794) | in I²: `q = r = ⟨1,−1⟩`; outside: `q = r = ⟨1,1⟩/ℝ` | `c(⟨1,−1,1,−1⟩) = (−1,−1)·(−1,−1) = 1 = c(q)c(r)`; `c(⟨1,1,1,1⟩) = (−1,−1) ≠ 1 = c(⟨1,1⟩)²` | hypotheses needed, as stated | none |
| 12 | O'Meara's symbol (README 282) | general | `∏_{i≤j} = s·∏(aᵢ,aᵢ) = s·∏(aᵢ,−1) = s·(d,−1)` | matches | none |
| 13 | Kahn II.2.1 (README 2972; Lean 3725) | `ℚ₂(i)`, `a = 1+2i` | `Tr = 2`, `N = 5`, `−dN = 5`: `(2)∪(5)+(2)∪(−1) = (2)∪(5) ≠ 0`; candidate `+(−1)∪(−1)` gives `0` | matches; sign pinned | none |
| 14 | `N^{Ev}((1+t√d))` (README 2977) | general `t` | `(2)∪(−d(1−dt²)) + (2)∪(d) = (2)∪(−1) + (2)∪(1−dt²) = (2)∪(1−dt²)` | matches | none |
| 15 | Kahn, degree 2 (README 3113; Lean 3794) | `ℚ₂(i)`, `a = 1+2i`; `a = i` | LHS `(2)∪(5)`; RHS `(2)∪(−1) + (2)∪(5) + (−1)∪(5) = 0 + (2)∪(5) + 0`; at `a = i`: LHS `w₂⟨1,−1⟩ = 0`, RHS `(2)∪(−1)·2 + (−1)∪(1) = 0` | matches | none |
| 16 | Kahn, degree 1 | `a = 1+2i` | LHS `d⟨2, −2/5⟩ = −4/5 ≡ −5`; RHS `(−1)+(5) = (−5)` | matches | none |
| 17 | `res N x = x ∪ σx` (README 2375) | `x = (a)` | over `L`, `(d) = 0`: `res = (s)∪(−aσa)` with `s = a+σa`; Steinberg at `a/s` gives `(a)∪(σa) = (s)∪(−aσa)` | matches | none |
| 18 | `hilbertSymbol_unramified` (Lean 1218) | `ℚ₃`, `Δ = 2`, `b = 3` | `(2,3)₃ = −1 = (−1)^{v(3)}`; `hu` is the goal after `hilbertSymbol_def`; one `exact` closes it | vacuous restatement | R07 |
| 19 | 6E, compatibility with the cup (README 2277) | ℚ₂: `(−1)∪(−1)`, `(2)∪(−1)` | `ε∘ι⁻¹` gives `(−1,−1)₂ = −1` (cup ≠ 0) and `(2,−1)₂ = +1` (cup = 0) | matches | none |
| 20 | 6E, milestone 2 (README 2259) | `K = 𝔽₃((t))` | `Br(K)[2] ≅ ℤ/2` holds, but `h2MuEquivZMod_mixed` needs `[Algebra ℚ_[p] K]`, so it is undefined here | unsupplied on part of the scope | R06 |
| 21 | cup-norm theorem (README 2658; Lean 2464) | `a = 1`; `b = c²`; ℝ with `a = b = −1` | `b = ((b+1)/2)² − ((b−1)/2)²` and `(1) = 0`; `(c,0)` and `(b) = 0`; `−1 = x²+y²` has no real solution and `(−1)∪(−1) ≠ 0` in `H²(ℝ) ≅ ℤ/2` | matches | none |
| 22 | non-bimultiplicativity over ℚ (README 2160) | `a = −1`; `3, 7, 21` | none of `3, 7, 21` is a sum of two rational squares, so all three symbols are `−1` and `(−1)(−1) ≠ −1` | counterexample valid | none |
| 23 | defect non-multiplicativity (README 1976) | ℚ₂ | `δ(−1) = 1`, `δ(5) = 2`; `−5 ≡ 3 (8)` → `δ(−5) = 1 ≠ 3` | matches | none |
| 24 | case 3 conductor `2e−d+1` (README 1936–1956) | ℚ₂: `a = −1`, `a = 3` | exponent `2 = v₂(−4)` and `v₂(12) = 2`; `1+4ℤ₂ ⊆ N`, `3 ∉ N` | matches | none |
| 25 | unramified `ℚ₂(√5)` (README 3241) | `e = 1, f = 2, q = 4` | `4·4¹ = 16 = 2^{2+2}` square classes; 8 unit classes | matches | none |
| 26 | `hasseInvariant_eq_localHasse` (Lean 1360) | ℚ₂, `w = (−1,−1)` | `[(−1,−1)] = [D]`, `ε[D] = −1`; `localHasse = (−1,−1)₂ = −1` | matches | none |
| 27 | `hilbertSymbol_productFormula` (Lean 2580) | ℚ, `a = b = −1` | at 2: `−1`; at odd `p`: `+1`; at ℝ: `−1` → product `+1` | true; mentions no QFI object | R07 |
| 28 | `I⁰` not generated by `⟨1⟩` (README 1395) | `⟨2⟩` in `W(ℚ)` | `±n⟨1⟩` has signature `±n`, which forces `n = 1`, but `⟨2⟩ ≇ ⟨1⟩` since `2 ∉ ℚ²` | matches | none |
| 29 | chain theorem in rank 1 (README 992) | `⟨1⟩, ⟨4⟩` over ℚ | isometric via `x ↦ x/2`; a chain on `Fin 1` is equality and `1 ≠ 4` | matches | none |

## Not verifiable

- **Lam, *Introduction to Quadratic Forms over Fields* (AMS GSM 67, 2005).** Cited as PRIMARY: I.5.1–I.5.2, III.2.7, III.2.11, V.3.17–3.21, the Wall caution p. 120, VII §1. It is not in `sources.toml` and is paywalled (AMS), so I could not read it. The V.3.20 exponents and the I² reduction were recomputed instead (table rows 9–11).
- **Gille–Szamuely, *Central Simple Algebras and Galois Cohomology* (CUP, 2nd ed. 2017).** 1.1.9, 1.5.2, 4.4, 4.7, including the 7C cup-norm locator. Not in the manifest; paywalled (CUP).
- **Manifest `uncertified` texts, cited by locator only.** `serre1979lf` (X; XIV §2 Prop. 4–5); `serre1973cia` (II §3.3, III Thm 1–2, IV Thm 5–7, Prop 6; values recomputed in rows 2–8); `omeara1963` (63:1, 63:2, 63:11–13, 63:16–23); `scharlau1985`; `milnor1970`.
- **Grove (AMS GSM 39, 2002) and O'Meara 1955.** Not in the manifest; no legal open copy was searched for.
- **Certified texts not in the sample, not opened.** `kozlowski1984` Thm 1.1, `evens1963`, `guillot2010`, `ekm2008` II §7.

## Source issues

- none
