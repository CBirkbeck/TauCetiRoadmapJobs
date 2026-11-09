# Review of QuadraticFormInvariants (pull request #1411 at 303ce50)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/QuadraticFormInvariants/` has 0 changed lines since `cded4a2`. The two commits since then touch only `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`. So the work here was:

- re-resolving every ClassFieldTheory citation this roadmap makes;
- re-running the gate, the elaboration and the dependency check;
- re-checking each previous witness at the pins.

No previous finding is repaired. One previous witness was wrong: R05's claim that five Tau Ceti names do not exist. R05 is restated below at P3 with a corrected witness. Findings keep their previous numbers.

## R01 (P1) — `instance squareClass_finite` lost its local-field binders and is false on ℚ

- **Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:973`: "instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) := sorry". It sits inside `section LocalField`, and its type mentions none of that section's local-field `variable`s.
- **Claim.** It elaborates to `∀ (K : Type u_1) [Field K] [Invertible 2], Finite (Kˣ ⧸ Subgroup.square Kˣ)`. That is false for ℚ, and it is a global instance in a module imported by GlobalQuadraticForms, IntegralLattices and Completed/OrthogonalSpinGroups.
- **Witness.** Re-run at this head (scratch file importing the module): `#synth Finite (ℚˣ ⧸ Subgroup.square ℚˣ)` prints `TauCetiRoadmap.QuadraticFormInvariants.squareClass_finite ℚ`. The classes of 2, 3, 5, 7 are pairwise distinct.
- **Repair.** Delete lines 970–974. No consumer uses the instance, and the local count is Tau Ceti's: `TauCeti.card_squareClass_of_odd` (`NumberTheory/LocalField/SquareClass.lean:139`). With the instance deleted, the `#synth` on ℚ fails (tested last round).

## R02 (P2) — Eight more `sorry`'d data declarations (gate `sorry-data`)

- **Location.** `Suggested.lean`, each with body `sorry`: 824 `cliffordHomI2`, 866 `cliffordHomI2Bar`, 1571 `kummerSquareClassEquiv`, 1621 `resHUnits`, 1837 `cocycleOfSplitting`, 1864 `TwoCocycle.comap`, 2355 `brauerCohomologyEquiv` and 2360 `brauer2EquivH2`.
- **Claim.** Sorry'd data is excluded. Each declaration restates a constructed Tau Ceti definition, so the theorems about it are about an opaque copy.
- **Witness.** Gate at this head: `sorry-data` = 9, the eight above plus R01. At the pin: `TwoCocycle.comap` is at `Algebra/CrossedProduct/Basic.lean:201` and `brauerCohomologyEquiv` at `Comparison.lean:274`. `galoisResUnits` is at `GaloisCohomology/UnitsRestriction.lean:62`.
- **Repair.** Delete the eight declarations and the theorems stated about them. Cite the Tau Ceti declarations in the README's supplier section.

## R03 (P2) — 51 `set_option` lines (gate `set_option`)

- **Location.** `Suggested.lean` 1983–2333, 2364–2389, 2415–2436 and 3554: "set_option maxHeartbeats 1000000 in" and "set_option synthInstance.maxHeartbeats 400000 in".
- **Claim.** Every `set_option` is forbidden. The affected declarations restate Tau Ceti's inflation and comparison API.
- **Witness.** Gate at this head: `set_option` = 51. Pinned `Algebra/CrossedProduct/Inflation.lean` has `TwoCocycle.inflate`, `finiteLevelZ2` and `exists_galoisCocycle_inflateClass`. `Comparison.lean` has `brauerCohomologyEquiv_unique`.
- **Repair.** Delete the declarations at 1960–2345, 2364–2446 and 3554–3570. Do not restate them under the default options.

## R04 (P2) — README cites two ClassFieldTheory lemmas that this pull request deletes

- **Location.** `README.md:703–704`: "`ClassFieldTheory.muNRepCoeffDictionary` is its identity, with `muNRepCoeffDictionary_continuous` and `muNRepCoeffDictionary_equivariant`".
- **Claim.** These are supplier citations of declarations that do not exist at this head, and no old → new mapping is given.
- **Witness.** On main, ClassFieldTheory `Suggested.lean:789` and `:793` declare them. At this head that file keeps only `abbrev muNRepCoeffDictionary` (`:345`), whose docstring now points to `kummerCoeffEquivMuNRep_smul`. Neither lemma appears in its README or its Lean file.
- **Repair.** Cite Tau Ceti's `TauCeti.ClassFieldTheory.continuous_kummerCoeffEquivMuNRep` (`NumberTheory/ClassFieldTheory/MuNRep.lean:154`) and `kummerCoeffEquivMuNRep_smul` (`:165`). Change the docstring at `Suggested.lean:2526` the same way.

## R05 (P3) — The 6C "alternative early norm-index construction" is unformatted run-on text

- **Location.** `README.md:1986–1990`: "Install TauCeti.algebraicExtensionValuativeRel, algebraicExtensionNormedFieldTopology, … Apply the already proved TauCeti.index_normGroup_of_isCyclic … a separate selected native supplier … The full6B defect … programme remains owned here". Also 3305–3310: "Layer 6 first consumes6A … the6C table outputs".
- **Claim.** These paragraphs have no code spans and are missing spaces ("Layer2", "classical6D", "basis(1,s)", "pair(x,y)"). They also use process wording ("already proved", "selected native supplier", "programme"). The norm-index milestone they serve is also pinned under another name.
- **Correction to the previous review.** The route's inputs do exist at the pin, so the P2 "unowned inputs" claim is withdrawn:
  - `TauCeti.algebraicExtensionValuativeRel` (`NumberTheory/LocalField/AlgebraicExtension/Basic.lean:130`);
  - `algebraicExtensionNormedFieldTopology` (`:86`);
  - `algebraicExtension_valuativeExtension` (`:147`);
  - `finiteExtension_isNonarchimedeanLocalField` (`FiniteExtension/Basic.lean:54`);
  - `index_normGroup_of_isCyclic` (`Brauer/LocalH2Bound.lean:70`, index equals `finrank K L`).
- **Witness.** `README.md:1988` has no backticks and reads "of Layer2", "classical part of6C", "precede6D without6E/7B".
- **Repair.** Rewrite 1986–1990 as one short proof-route paragraph in house style. Put the five names in backticks with their files and fix the spaces. Drop "already proved", "selected native supplier" and "programme". Say that item 4 of 6C (line 2035) is also pinned as `TauCeti.quadraticNormSubgroup_index_eq_two_of_not_isSquare` (`Bimultiplicativity.lean:82`). Rewrite 3305–3310 as one sentence ordering 6A to 6E.

## R06 (P2) — 6E's second milestone rests on a mixed-characteristic-only supplier, but Layer 6 includes equal characteristic

- **Location.** `README.md:2259–2261`: "under the identification `Br(K)[2] ≅ H²(G_K, μ₂)` of Layer 7B, `h2MuEquivZMod_mixed` carries the division class to the nonzero element of `ZMod 2`". Also the prerequisites at 2014–2016 and 2243–2244, and contract rows 685 and 687.
- **Claim.** Layer 6's scope (1602–1605) includes "local fields of positive odd characteristic". The supplier named here is not defined there, so the milestone has no supplier on part of its stated scope.
- **Witness.** ClassFieldTheory at this head, `Suggested.lean:415–418`: `h2MuEquivZMod_mixed` still requires `[Algebra ℚ_[p] F] [Module.Finite ℚ_[p] F]`. The field `𝔽₃((t))` has characteristic 3, so it has no `ℚ_[3]`-algebra structure. `invMap` (`:408`) needs only `IsNonarchimedeanLocalField`.
- **Repair.** State milestone 2 through ClassFieldTheory Layer 5's `invMap`, which sends `[D]` to `1/2`. Keep `h2MuEquivZMod_mixed` as the mixed-characteristic reading. Do the same for `tateDualityPairing_perfect_mixed` in the 6C prerequisites, or restrict these milestones to finite extensions of `ℚ_p` in the scope.

## R07 (P3) — `Suggested.lean` is an API catalogue that restates the pinned library

- **Location.** All of `Suggested.lean`: 3875 lines with 136 `sorry`s.
- **Claim.** Every headline is sorry-free at the pinned Tau Ceti, and many declarations are one-tactic restatements. Examples: the four-fold criterion `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`; the local classification `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq`; `cup_kummerClass_eq_zero_iff`; `hilbertSymbol_productFormula`.
- **Witness.** Re-run at this head: the scratch file `probe/R07.lean` imports this module and exits 0 with no messages. In it, seven sorried theorems each close by one `exact` of a pinned lemma: `hilbertSymbol_congr_sq`, `_neg_self`, `_comm`, `_self`, `_mul`, `exists_hilbertSymbol_eq_neg_one` and `hilbertSymbol_unramified`.
- **Repair.** Keep only what consumers import, delete every other declaration, and keep their statements as README targets. Consumers import `hilbertSymbol`, `hilbertSign`, `localHasse`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_neg_self`, `exists_hilbertSymbol_eq_neg_one`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` and `hasseInvariant_eq_localHasse`; keep `quaternionClass` and `hasseInvariant` with them. Prove the kept theorems by their Tau Ceti counterparts. Name each headline's pinned declaration in the module docstring.

## R08 (P3) — Ten admitted `example`s (gate `sorry-examples`)

- **Location.** `Suggested.lean` 1413, 1418, 1423, 1436, 1441, 2776, 2788, 2816, 2824 and 3832, each `:= sorry`.
- **Claim.** An admitted example tests nothing, and these compute small values, which is padding.
- **Witness.** Gate at this head: `sorry-examples` = 10. The ℚ₂ values are pinned in `hilbertSymbol_padicTwoSquareClassRep` (`NumberTheory/LocalField/QuadraticForm/PadicTwo.lean:430`).
- **Repair.** Delete the ten examples. The README's worked examples keep them.

## R09 (P3) — `Suggested.lean` imports other roadmaps' modules (gate `imports`)

- **Location.** `Suggested.lean:2–4`: "import TauCetiRoadmap.ProfiniteCohomology.Suggested", "import Completed.LocalFieldsRamification.Suggested", "import TauCetiRoadmap.ClassFieldTheory.Suggested".
- **Claim.** Only `import Mathlib` and `TauCeti.*` modules are allowed. This coupling is also why this pull request edits the folder at all (lines 35–36).
- **Witness.** Gate at this head: `imports` = 1. `git diff origin/main...HEAD` on the folder is exactly two added `TauCeti.*` import lines.
- **Repair.** Replace lines 2–4 by the `TauCeti.*` modules the kept declarations need. State the bridges on `TauCeti.ClassFieldTheory.*` carriers.

## R10 (P3) — Two linter warnings besides `sorry` (gate `build`)

- **Location.** `Suggested.lean:3334:77` and `3335:16`, inside `pinDiagonalLift_mul`.
- **Claim.** `sorry` must be the only warning.
- **Witness.** `lake env lean` at this head exits 0 with 136 `sorry` warnings and "Unused tactic linter: `<;>` can be removed" at both positions.
- **Repair.** Delete the lemma, which restates Tau Ceti's `pinDiagonalLift_mul` (R07).

## R11 (P3) — Process narrative, including status claims that are false at the pins

- **Location.** `README.md:33–150` ("Audit status: incomplete. This roadmap remains active."). Also TauCeti#22016, #22020 and #22022 (101–103, 779); "landed" (167, 481, 602, 3168, 3324); the "ledger" (3440, 3444); "B11a" (`Suggested.lean` 405, 1211).
- **Claim.** Roadmaps are timeless. The audit's claims are false at the pins: the "outstanding" ULift square (86–95), the pin at 146, and `ClassFieldTheory.brCongr` (93), which exists neither on main nor at this head.
- **Witness.** The pinned Tau Ceti proves the square as `brauerExplicitH2Equiv_uliftEquiv` (`Algebra/CrossedProduct/BaseChange/ULift.lean:205`) and `brauerCohomologyEquiv_uliftEquiv` (`:228`). `lake-manifest.json` pins Tau Ceti `2fd255d9…`, not `a91d3aaf…`.
- **Repair.** Delete lines 33–150, and reword the other passages without pull-request numbers, "audited" or "landed". Keep the "Native interfaces and remaining comparisons" stages 1–2, which K2SymbolsBrauer cites. State them as the two pinned theorems.

## R12 (P3) — Stray file `NativeCompletion.md` (gate `stray-files`)

- **Location.** `TauCetiRoadmap/QuadraticFormInvariants/NativeCompletion.md`, referenced from `README.md` 112–125.
- **Claim.** A roadmap folder holds only roadmap files.
- **Witness.** Gate at this head: "NativeCompletion.md: not a roadmap file".
- **Repair.** Delete it; sources are the README's references. Delete the table at 110–127 with R11.

## R13 (P3) — Wrong layer locators for the ClassFieldTheory supplier

- **Location.** `README.md:685` "| 2--3 |", 686 and 687 "| 3 |", 688 "| 5 |", and the prerequisites at 2014 and 2243 ("[Class Field Theory, Layers 2--3]").
- **Claim.** `muNRep`, `h2MuEquivZMod_mixed`, `kummerClass`, `kummerCupPairing`, `localSymbol` and `tateDualityPairing_perfect_mixed` are in ClassFieldTheory Layer 5. The Hilbert invariants and `hilbertProductFormula` are in Layer 14.
- **Witness.** ClassFieldTheory README at this head: "## Layer 5: local coefficients, the Brauer group, the local invariant, and duality" (913), with `localSymbol` at 1018 and `tateDualityPairing_perfect_mixed` at 1105. "## Layer 14: Hilbert reciprocity" is at 2302, with `finiteHilbertInvariantAt` at 2306.
- **Repair.** Change "2--3" and "3" to "5", and "5" to "14", in those six places.

## R14 (P3) — Wrong Tau Ceti names for the roundness of Pfister forms

- **Location.** `README.md:1422–1423`: "`TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`, `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`".
- **Claim.** Neither name exists at the pin.
- **Witness.** A search of the pinned trees finds neither name. The pinned statements are `Witt/Round.lean:44` `oneFoldPfister_smul_equivalent_iff` and `:61` `twoFoldPfister_smul_equivalent_iff`.
- **Repair.** Cite those two names, using the reverse direction of each `iff` for roundness.

## R15 (P3) — Eleven supplier names written unqualified (gate `readme-ids-missing`)

- **Location.** `README.md` 90, 528, 541, 676, 776, 780, 1037, 1191, 1283–1284, 1327 and 1658.
- **Claim.** Each name exists at a supplier, but a bare backticked name claims a declaration of this roadmap.
- **Witness.** Gate at this head: 11 names. Re-resolved at the pins:
  - `RegularFormClass.discr_baseChange` at `RegularFormClass/BaseChange.lean:437`;
  - `signedDiscr_add`, `signedDiscr_mul` and `signedDiscr_mk_rankOne_mul` at `Discriminant.lean:310`, `321` and `329`;
  - `hilbertSymbol_mul_right` at `Bimultiplicativity.lean:97`;
  - `map_norm_unitFiltration_zero` at LocalFieldsRamification `Suggested.lean:857`.
- **Repair.** Qualify each name, for example `TauCeti.RegularFormClass.signedDiscr_add` and `LocalFieldsRamification.map_norm_unitFiltration_zero`.

## R16 (P3) — The README does not follow the roadmap shape

- **Location.** Headings `## Scope` (170), `## What this roadmap consumes` (399), `## The build, in layers` (897) and `## Ownership and coordination` (3379).
- **Claim.** The house shape needs an API list and at least three discriminating Checks for every definition, and `*Needs:*` lines and dependencies for every layer.
- **Witness.** `grep -c 'Needs:\|Checks' README.md` returns 0. `hilbertSymbol`, `localHasse`, `quadraticDefect` and `sw1Class` have no Checks.
- **Repair.** Restructure into the house headings, with `### k.n` subsections, `*Needs:*` lines, `### Examples`, `### Dependencies` and `## Downstream consumers`. Turn the existing worked values into `**Checks.**`, for example `(2,5)_{ℚ₂} = −1`.

## R17 (P3) — No stated order against #1797 and #1187, which both change this folder

- **Location.** The description's merge-order paragraph: "This PR → #1410 … → #1474 … #617 and #1215 amend the same roadmap: whichever of the three merges first, the other two are rebased onto it".
- **Claim.** #1797 and #1187 conflict with this head in `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`, and no order is stated for either.
- **Witness.** `scratch/overlaps.md` reports that #1411 and #1797 conflict in QuadraticFormInvariants' `Suggested.lean`, and that #1187 conflicts in the same file.
- **Repair.** State in the description which merges first, for example "rebased onto #1797; the two-line import edit is dropped if the rebased file no longer imports ClassFieldTheory's module". Say the same for #1187.

## R18 (P3) — Edit outside the pull request's folders

- **Location.** `Completed/LocalGaloisGroups/Suggested.lean` 326 and 485, which wrap two ClassFieldTheory calls in `⟨…⟩`.
- **Claim.** The brief names this pull request's folders as QuadraticFormInvariants, ClassFieldTheory and IntegralLattices. The description now adds Completed/LocalGaloisGroups, but the edit still exists only to absorb a supplier signature change.
- **Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuadraticFormInvariants' ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/IntegralLattices'` lists `Completed/LocalGaloisGroups/Suggested.lean | 4`.
- **Repair.** Keep ClassFieldTheory's `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` `Nonempty`-valued, as on main. Otherwise, move the adaptation into its own pull request.

## R19 (P3) — Four cited works have no manifest entry

- **Location.** `README.md:3331` (Lam, "PRIMARY"), 3365 (Gille–Szamuely), 3376 (Grove) and 3348 (O'Meara 1955).
- **Claim.** Every cited work is recorded in `sources.toml`.
- **Witness.** `packages/QuadraticFormInvariants/sources.toml` has eleven ids (`kahn1984` … `ekm2008`), none of them Lam, Gille–Szamuely, Grove or O'Meara 1955.
- **Repair.** Add the four with their locators, recorded as `uncertified` where only a paywalled copy exists.

## Previous findings

- R01 — not repaired: `Suggested.lean:973` "instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) := sorry"; `#synth` on ℚ still finds it.
- R02 — not repaired: the eight `sorry` bodies at 824, 866, 1571, 1621, 1837, 1864, 2355 and 2360 are unchanged (gate `sorry-data` = 9).
- R03 — not repaired: "set_option maxHeartbeats 1000000 in" and "set_option synthInstance.maxHeartbeats 400000 in" (gate `set_option` = 51).
- R04 — not repaired: `README.md:703` "with `muNRepCoeffDictionary_continuous` and `muNRepCoeffDictionary_equivariant`"; neither is declared in ClassFieldTheory at this head.
- R05 — not repaired (text unchanged). Its P2 basis was an error of the previous review: the five names exist at pin `2fd255d`. The formatting defect remains at P3: `README.md:1988` "Apply the already proved TauCeti.index_normGroup_of_isCyclic … Layer2 …".
- R06 — not repaired: `README.md:2260` "`h2MuEquivZMod_mixed` carries the division class to the nonzero element of `ZMod 2`"; the supplier still requires `[Algebra ℚ_[p] F]`.
- R07 — not repaired: `Suggested.lean` is still 3875 lines; seven sorried theorems close by one `exact` (re-run).
- R08 — not repaired: `Suggested.lean:1413` "example : ¬ ∃ x y : ℚ_[2], x ^ 2 + y ^ 2 = -1 := sorry", and nine more.
- R09 — not repaired: `Suggested.lean:2` "import TauCetiRoadmap.ProfiniteCohomology.Suggested", and lines 3–4.
- R10 — not repaired: `Suggested.lean:3334:77` and `3335:16`, "Unused tactic linter: `<;>` can be removed".
- R11 — not repaired: `README.md:35` "**Audit status: incomplete. This roadmap remains active.**".
- R12 — not repaired: `NativeCompletion.md` is still tracked in the folder.
- R13 — not repaired: `README.md:685` "| Layers 6E and 7C, the local invariant normalization | 2--3 |".
- R14 — not repaired: `README.md:1422` "`TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`".
- R15 — not repaired: the gate's `readme-ids-missing` = 11, with the same names.
- R16 — not repaired: `README.md:170` "## Scope"; no `*Needs:*` line or `**Checks.**` list.
- R17 — not repaired: the description's merge-order paragraph names #1410, #1474, #617 and #1215 only.
- R18 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean:326` "⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩".
- R19 — not repaired: `sources.toml` still lists eleven ids, without Lam, Gille–Szamuely, Grove or O'Meara 1955.

## Verified sound

**Scope of the change.** `git diff --stat cded4a2..HEAD` lists only `TauCetiRoadmap/ClassFieldTheory/README.md` (317 lines) and `Suggested.lean` (106 lines). `lake-manifest.json` is unchanged, so the pins are Tau Ceti `2fd255d`, matching the checkout's HEAD, and Mathlib `1b1ccf4`. The ClassFieldTheory changes are:

- dropping the Tau Ceti name catalogue from its module docstring;
- a new route in the docstring of `algebraMap_vle_algebraMap_iff_of_finite_padic`;
- qualifying names in its README;
- a new Layer 13 text.

Its layer headings are unchanged: Layer 5 at README 913 and Layer 14 at 2302.

**ClassFieldTheory citations re-resolved at this head.** 17 of 19 cited names are declared in `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`:

- `absoluteGaloisGroupComparison` (327), `muNRep` (334), `muNRepCoeffDictionary` (345) and `kummerClass` (370);
- `kummerClass_eq_kummerCocycleClass` (383), `invMap` (408), `h2MuEquivZMod_mixed` (415) and `h2FpEquivZMod_of_mu` (426);
- `kummerCupPairing` (439), `kummerCupPairing_bil` (452), `localSymbol` (463) and `tateDualityPairing` (532);
- `tateDualityPairing_perfect_mixed` (540);
- `finiteHilbertInvariantAt` (947), `infiniteHilbertInvariantAt` (953), `finiteHilbertSupport` (958) and `hilbertProductFormula` (964);
- `H` (307).

The two misses are R04's. ClassFieldTheory README 158–163, 2327–2328 and 2394–2395 still give the direction `ClassFieldTheory → QuadraticFormInvariants` and leave the norm-equation and quaternion presentations here, consistent with this README at 572–576 and 1993–2003. The worker's four citation leads are:

- `absoluteGaloisGroupComparison` and `muNRepCoeffDictionary`: false leads (ClassFieldTheory abbreviations at 327 and 345);
- the two roundness names: real misses (R14).

**Gate.** The worker's gate fails, and every failure is covered: `set_option` 51 (R03), `sorry-data` 9 (R01, R02), `sorry-examples` 10 (R08), `imports` 1 (R09), `readme-ids-missing` 11 (R15), `stray-files` 1 (R12) and `build` 2 (R10). My run without the build gives the same counts, except `outside-folder` 3: ClassFieldTheory README and Lean, and IntegralLattices, all this pull request's own folders. Neither run lists `Completed/LocalGaloisGroups` (R18), which `git diff` does. The 14 `tex` hits are false positives, as before: they sit in indented `text` fences, or line 593 continues a code span. `PROGRESS.md` and `STATUS.md` are not stray: 125 roadmaps on main carry both, and the content README (lines 185–190) documents them.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2330 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. This roadmap is on main and not in the merge order. Its suppliers (LocalFieldsRamification, ProfiniteCohomology, ClassFieldTheory, SemisimpleAlgebras, Multiquadratic) are on main.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 75 s, with 136 `sorry` warnings and the two linter warnings of R10. Its ClassFieldTheory imports elaborate against this head's rebuilt module.

**Signatures.** `#check @` of `squareClass_finite`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` and `hasseInvariant_eq_localHasse` was run at this head. Only `squareClass_finite` has lost binders (R01). The other three keep `IsNonarchimedeanLocalField`, `Invertible 2` and `NumberField` as the README states. The full 285-name audit of the previous round stands; neither the file nor the pins changed.

**Probes.** `probe/R01.lean` (`#synth`, result above) and `probe/R07.lean` (seven `exact` closures, exit 0).

**Pinned declarations opened this round** (Tau Ceti unless noted):

- `NumberTheory/HilbertSymbol/Basic.lean:102, 147, 251`;
- `NumberTheory/HilbertSymbol/NormSubgroup.lean:224`;
- `NumberTheory/LocalField/QuadraticForm/Bimultiplicativity.lean:82, 97, 155`;
- `NumberTheory/LocalField/QuadraticForm/UnramifiedClass.lean:263`;
- `NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`;
- `NumberTheory/LocalField/AlgebraicExtension/Basic.lean:86, 130, 147`;
- `NumberTheory/LocalField/FiniteExtension/Basic.lean:54`;
- `NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean:62–75`;
- `NumberTheory/ClassFieldTheory/MuNRep.lean:154, 165`;
- `Algebra/CrossedProduct/BaseChange/ULift.lean:205, 228`;
- `LinearAlgebra/QuadraticForm/Witt/Round.lean:44, 61`;
- `RegularFormClass/BaseChange.lean:437`;
- `RegularFormClass/Discriminant.lean:310, 321, 329`;
- `FieldTheory/Trace.lean:78`;
- `FieldTheory/IntermediateField/Quadratic.lean:113`;
- `Algebra/Quaternion/AlgEquiv.lean:150`;
- `StiefelWhitney/Transfer.lean:137`;
- `CrossedProduct/BaseChange/Naturality.lean:51`;
- `NumberTheory/LocalField/SquareClass.lean:139`;
- LocalFieldsRamification `Suggested.lean:857` (roadmap on main).

**Consumers.** GlobalQuadraticForms, IntegralLattices and Completed/OrthogonalSpinGroups import this module. Between them they use the eleven names listed in R07, and none changed since `cded4a2`.

**Ownership.** The folder is unchanged. Its closest open neighbours are ProfiniteCohomology (#1187, #616), QuadraticFormInvariantsPartII (#1834), OrthogonalSpinGroups (#1181) and GlobalQuadraticForms (#1200). None is a new owner of the Hilbert symbol, the cup-norm criterion or the Hasse invariant. `scratch/overlaps.md` lists no dropped or revision-only ids.

**Seeded sample (re-checked where the ClassFieldTheory change reaches it).**

1. "Audit status: incomplete …" (35): false at the pin (R11).
2. "From the local-fields-ramification roadmap" (652): unchanged supplier, resolved last round.
3. "From the class-field-theory roadmap" (679): 17 of 19 names at this head (R04), with wrong layers (R13).
4. "From the profinite-cohomology roadmap" (717): unchanged supplier.
5. "The Hilbert symbol is this roadmap's, in both halves" (1993): consistent with ClassFieldTheory README 2327–2328 and 2394–2395 at this head.
6. "Compatibility with the cup product" (2277): values recomputed in row 31.
7. "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2643): no competing owner. Pinned as `TauCeti.cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`).

**Sources.** No locator changed, so no source was re-read this round. The previous round's readings of `kahn1984` lines 55, 763–765 and 1044–1058, and `serre1984cmh` lines 560–562, stand.

**Adversarial table.** Rows 1–29 are carried from the previous report (r24, at `cded4a2`), because no statement changed. Rows 30–35 were recomputed this round against the new ClassFieldTheory head.

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | `squareClass_finite` (Lean 973) | `K = ℚ` | r24 row 1 | false | R01 |
| 2 | ℚ₂ Gram matrix (README 2117–2124) | basis `−1, 2, 5` | r24 row 2 | matches | none |
| 3 | `serreEps`, `serreOmega` (Lean 1379–1386) | `u ≡ 1,3,5,7 (8)` | r24 row 3 | matches | none |
| 4 | `hilbertSymbol_padicTwo` (Lean 1398) | `a = 1/2, b = 5` | r24 row 4 | narrower than pin | R07 |
| 5 | odd closed formula (README 2065–2077) | ℚ₃, ℚ₅ | r24 row 5 | matches | none |
| 6 | isotropy, rank 3 (README 2193) | `⟨1,1,1⟩`, `⟨1,1,−1⟩` / ℚ₂ | r24 row 6 | matches | none |
| 7 | rank 4 (README 2194, 2204) | `⟨1,1,1,1⟩` / ℚ₂, ℚ₃ | r24 row 7 | matches | none |
| 8 | realization (README 2185–2189) | three triples / ℚ₂ | r24 row 8 | matches | none |
| 9 | `cliffordInvariant_eq` (Lean 779) | `n = 0..4` | r24 row 9 | matches | none |
| 10 | I² reduction (README 1544) | `m = 1..5` | r24 row 10 | matches | none |
| 11 | `cliffordInvariant_append_of_mem_I2` (Lean 794) | in and outside I² | r24 row 11 | hypotheses needed | none |
| 12 | O'Meara's symbol (README 282) | general | r24 row 12 | matches | none |
| 13 | Kahn II.2.1 (README 2972) | `ℚ₂(i)`, `a = 1+2i` | r24 row 13 | matches | none |
| 14 | `N^{Ev}((1+t√d))` (README 2977) | general `t` | r24 row 14 | matches | none |
| 15 | Kahn degree 2 (README 3113) | `a = 1+2i`, `a = i` | r24 row 15 | matches | none |
| 16 | Kahn degree 1 | `a = 1+2i` | r24 row 16 | matches | none |
| 17 | `res N x = x ∪ σx` (README 2375) | `x = (a)` | r24 row 17 | matches | none |
| 18 | `hilbertSymbol_unramified` (Lean 1218) | ℚ₃, `Δ = 2`, `b = 3` | r24 row 18 | vacuous restatement | R07 |
| 19 | 6E cup compatibility (README 2277) | ℚ₂ | r24 row 19 | matches | none |
| 20 | 6E milestone 2 (README 2259) | `𝔽₃((t))` | r24 row 20; rechecked in row 33 | unsupplied on part of scope | R06 |
| 21 | cup-norm theorem (README 2658) | `a = 1`; `b = c²`; ℝ | r24 row 21 | matches | none |
| 22 | non-bimultiplicativity over ℚ (README 2160) | `(−1, 3·7)` | r24 row 22 | valid | none |
| 23 | defect non-multiplicativity (README 1976) | ℚ₂ | r24 row 23 | matches | none |
| 24 | conductor `2e−d+1` (README 1936–1956) | ℚ₂ | r24 row 24 | matches | none |
| 25 | unramified `ℚ₂(√5)` (README 3241) | `e=1, f=2` | r24 row 25 | matches | none |
| 26 | `hasseInvariant_eq_localHasse` (Lean 1360) | ℚ₂ | r24 row 26 | matches | none |
| 27 | `hilbertSymbol_productFormula` (Lean 2580) | ℚ, `a = b = −1` | r24 row 27; rechecked in row 32 | true; mentions no QFI object | R07 |
| 28 | `I⁰` not generated by `⟨1⟩` (README 1395) | `⟨2⟩` in `W(ℚ)` | r24 row 28 | matches | none |
| 29 | chain theorem, rank 1 (README 992) | `⟨1⟩, ⟨4⟩` / ℚ | r24 row 29 | matches | none |
| 30 | `squareClass_finite` at this head | `K = ℚ` | `#synth` prints `squareClass_finite ℚ`; `3/2, 5/2, 7/3` are not rational squares, so `[2],[3],[5],[7]` are distinct and the quotient is infinite | false | R01 |
| 31 | `hilbertSymbol_eq_cohomological` (Lean 2554) against ClassFieldTheory `localSymbol` (463), `kummerCupPairing` (439), `kummerClass` (370) | ℚ₃, `ζ = −1`: `(−1,−1)`, `(3,−1)` | `−2 ≡ 1 (3)` is a square, so `−1 = 1² + (√−2)²` and `(−1,−1)₃ = +1`; the cup is 0 and `hilbertSign 0 = +1`. `(3,−1)₃ = (−1∣3) = −1`; the cup is nonzero and `hilbertSign 1 = −1` | matches | none |
| 32 | `hilbertSymbol_productFormula` against ClassFieldTheory `hilbertProductFormula` (964) | ℚ, `a = 2, b = 3` | at 2, `(−1)^{ω(3)} = −1` (`ω(3) = 1`); at 3, `(2∣3) = −1`; at ∞, `+1`; other primes `+1`. Product `(−1)(−1)(+1) = +1`; additive `1 + 1 = 0` in `ZMod 2` | matches | none |
| 33 | `h2MuEquivZMod_mixed` (ClassFieldTheory 415) in Layer 6's scope | `𝔽₃((t))`; ℚ₃ | `𝔽₃((t))`: a map from `ℚ_[3]` would send the unit `3` to `0`, so there is no instance and the term is undefined; `invMap` (408) is defined. ℚ₃: both are defined | unsupplied in equal characteristic | R06 |
| 34 | 6C alternative route (README 1988): `index_normGroup_of_isCyclic` | `L = ℚ₃(√−1)` | pin: `(normGroup K L).index = finrank K L`. `[L:K] = 2` gives index 2, matching the README's claim; it is unramified, so the norms are the classes of even valuation, index 2 | inputs exist; README correct on content | R05 (style only) |
| 35 | one-tactic probe | seven theorems of 6C | `exact TauCeti.hilbertSymbol_congr_sq …`, `_neg_self`, `_comm`, `_self`, `_mul_right (Invertible.ne_zero 2)`, `exists_hilbertSymbol_eq_neg_one`, `hilbertSymbol_unramified`; exit 0, no messages | padding | R07 |

## Not verifiable

- **Lam, *Introduction to Quadratic Forms over Fields* (AMS GSM 67, 2005).** I.5.1–I.5.2, III.2.7, III.2.11, V.3.17–3.21, VII §1. It is not in `sources.toml` and it is paywalled (AMS). The V.3.20 exponents were recomputed instead (r24, rows 9–11).
- **Gille–Szamuely, *Central Simple Algebras and Galois Cohomology* (CUP, 2nd ed. 2017).** 1.1.9, 1.5.2, 4.4, 4.7, including the 7C cup-norm locator. Not in the manifest; paywalled (CUP).
- **Manifest `uncertified` texts, cited by locator only:** `serre1979lf`, `serre1973cia`, `omeara1963`, `scharlau1985` and `milnor1970`.
- **Grove (AMS GSM 39, 2002) and O'Meara 1955.** Not in the manifest; no legal open copy was searched for.
- **Certified texts outside the sample, not opened:** `kozlowski1984`, `evens1963`, `guillot2010` and `ekm2008`.

## Source issues

- none
