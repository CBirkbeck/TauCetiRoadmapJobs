# Review of QuadraticFormInvariants (pull request #617 at 3442338)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/QuadraticFormInvariants/` at `3442338`. Against main, the pull request changes 5 lines of the folder: the README contract paragraph at lines 700–705, two imports, and the matching paragraph of the `Suggested.lean` docstring. Every passage of the folder was reviewed, changed or not. The folder still fails the gate. Five findings are blocking: two P1 and three P2.

The main fact behind most findings: the pinned Tau Ceti (`2fd255d`) already proves almost everything this roadmap commissions. That includes the outstanding item the README names. Yet `Suggested.lean` restates that material with `sorry`, sometimes on `sorry`'d carriers.

## R01 (P1) — `squareClass_finite` lost its local-field binders and asserts a false instance

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:973`, `instance squareClass_finite [Invertible (2 : K)] : Finite (Kˣ ⧸ Subgroup.square Kˣ) := sorry`, inside `section LocalField`.

**Claim.** The declaration is meant to say that a nonarchimedean local field has finitely many square classes. Its body is `sorry` and mentions no section variable, so it keeps only `[Field K]`.

**Witness.** `#check @TauCetiRoadmap.QuadraticFormInvariants.squareClass_finite` elaborates to `∀ (K : Type u_1) [Field K] [Invertible 2], Finite (Kˣ ⧸ Subgroup.square Kˣ)`. Take `K = ℚ`: for distinct primes `p, q` the product `pq` is not a square, so the classes of all primes are distinct and the quotient is infinite. The instance is global. `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` and `Completed/OrthogonalSpinGroups/Suggested.lean` import this module, so instance search inherits the false statement there.

**Repair.** Delete the instance. Finiteness is a consequence of Tau Ceti's `TauCeti.card_squareClasses` (`TauCeti/NumberTheory/LocalField/PowerSubgroup/Basic.lean:390`); the README can cite that. If a finiteness statement is kept, make it a `theorem` with `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` written in its own signature. Re-run the `#check`: it must show the three local-field binders, and the `ℚ` instance must no longer typecheck.

## R02 (P1) — `sorry`'d data, and some 65 declarations stated on `sorry`'d carriers

**Location.** The gate's `sorry-data` list: `cliffordHomI2` (`Suggested.lean:824`), `cliffordHomI2Bar` (866), `squareClass_finite` (973), `kummerSquareClassEquiv` (1571), `resHUnits` (1621), `cocycleOfSplitting` (1837), `TwoCocycle.comap` (1864), `brauerCohomologyEquiv` (2355) and `brauer2EquivH2` (2360).

There is a second, unflagged source. `cup11` (1512) is defined as `cup (f2Pairing …) 1 1 x y`, and the Profinite Cohomology roadmap's `cup` is `noncomputable def cup … := sorry` (`TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:3868`).

**Claim.** Every statement through `cup11`, `sw2`/`sw2Class`, `galoisEvens2`, `brauerCohomologyEquiv` or `brauer2EquivH2` is a statement about `sorryAx`. That covers the cup-norm theorem (2464), the `w₂` identities, the Evens-norm values (3725–3763) and the relative Stiefel–Whitney formula (3794). Such statements can be neither proved nor refuted as mathematics.

**Witness.** In a scratch copy, `exact TauCeti.cup_kummerClass_eq_zero_iff a b` against `cup_kummerClass_eq_zero_iff` fails with a type mismatch. The two Kummer classes agree definitionally (`example : kummerClass a = TauCeti.kummerClass a := rfl` succeeds). The mismatch is that `cup11` is Profinite Cohomology's `sorry`'d `cup`, not Tau Ceti's `trivialF2TopPairing … |>.cup 1 1`. By the elaborated types, 65 declarations mention one of these carriers.

**Repair.** Delete the nine `sorry`'d definitions and every declaration stated through them or through `cup11`. Each object exists at the pin under the same name: `TauCeti.cliffordHomI2` and `TauCeti.cliffordHomI2Bar` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Clifford.lean:142, 187`), `TauCeti.kummerSquareClassEquiv` (`TauCeti/FieldTheory/GaloisCohomology/MuTwo/Basic.lean:668`), `TauCeti.brauerCohomologyEquiv` (`TauCeti/Algebra/CrossedProduct/CupProduct.lean`), and `TauCeti.h2MuToUnits` (`MuTwo/BrauerTorsion.lean:62`). Cite them in the README. A `Suggested.lean` statement that must remain in the cohomological layers uses Tau Ceti's `trivialF2TopPairing` cup and imports only `TauCeti.*`. Test: the `exact` above then succeeds or the declaration is gone.

## R03 (P2) — The completion audit is false at the pin and is process narrative

**Location.** `README.md:33–150`: "**Audit status: incomplete. This roadmap remains active.** … The roadmap must remain active until that square is proved". Also `README.md:784–832`, the three "mandatory earlier stages", and line 146: "The repository dependency pin remains `a91d3aafa8cd…`".

**Claim.** The section says Tau Ceti does not prove the upward-`ULift` naturality square. It gives the exact equation required (lines 86–90), "together with its continuous-cohomology form". It then commissions stage 2 to build that square.

**Witness.** The pinned Tau Ceti proves both:
- `TauCeti.brauerExplicitH2Equiv_uliftEquiv` (`TauCeti/Algebra/CrossedProduct/BaseChange/ULift.lean:205`) has exactly the equation of lines 86–90.
- `TauCeti.brauerCohomologyEquiv_uliftEquiv` (`:228`) is the continuous form.

There is no `sorry` in `TauCeti/Algebra/CrossedProduct/`. The pin in `lake-manifest.json` is `2fd255d`, not `a91d3aa`. The section also cites TauCeti#22016, #22020 and #22022 and four commit hashes.

**Repair.** Delete lines 33–150, the stage programme at 784–832 and the "audited native revision" clauses at 780, 819 and 2691. In their place, under *Scope and ownership → Already in the library*, list `brauerExplicitH2Equiv_uliftEquiv`, `brauerExplicitH2Equiv_symm_unitsH2Congr`, `brauerCohomologyEquiv_uliftEquiv` and `brauerCohomologyEquiv_symm_unitsContinuousH2Congr` with that file.

## R04 (P2) — The README commissions, as remaining or "frozen here" milestones, theorems the pinned Tau Ceti proves

**Location.** The milestones marked as built here or remaining, and the "frozen here because the supplier exports no signature" rows:
- `README.md:997` (contiguous bases, "**Built here**");
- 1091 (degenerate Witt decomposition);
- 1346 and 1440 (`W(ℝ) ≅ ℤ`, "built here");
- 1546–1576 (`cliffordHomI2`, `cliffordHomI2Bar`);
- 841–876 ("What remains");
- 673, 676, 1719, 1727 and 1741 (`card_squareClass_of_dyadic`, the graded pieces, `exists_unramified_class`, `unramified_class_unique`).

**Claim.** These are presented as work this roadmap still owns, but each is at the pin.

**Witness.** Each declaration below was opened at the pin:
- `Module.Basis.reflTransGen_isOrtho_isContiguous` (`TauCeti/LinearAlgebra/QuadraticForm/Diagonal/Contiguous/Connected.lean:70`, citing Serre IV Thm 5);
- `exists_equivalent_zero_radical_wittDecomposition` (`Witt/Degenerate.lean:50`);
- `TauCeti.WittRing.equivInt` (`Witt/Signature.lean:114`);
- `TauCeti.cliffordHomI2`, `fundamentalI3InI2`, `cliffordHomI2Bar` (`Witt/Clifford.lean:142, 176, 187`);
- `TauCeti.card_squareClasses : #(Kˣ/(Kˣ)²) = 4 · #𝓀[K]^{v_K(2)}` for every local field with `2 ≠ 0` (`PowerSubgroup/Basic.lean:390`);
- `TauCeti.exists_unramified_class` (`NumberTheory/LocalField/QuadraticForm/UnramifiedClass.lean:206`, with `Δ ≡ 1 mod 4` in addition);
- `unitFiltrationGradedZeroEquivResidueFieldUnits` (`UnitFiltration/Basic.lean:250`) and `unitFiltrationGradedSuccEquivResidueField` (`UnitFiltration/Graded.lean:246`);
- the cup-norm theorem and its four siblings (`MuTwo/CupNorm.lean:103–132`);
- Kahn's formula `sw2Class_formClass_traceTransfer_smul_sq` (`StiefelWhitney/QuadraticExtension.lean:249`) and its diagonal corollary (`:268`);
- `galoisEvens2_kummerClass_eq_pullback` (`MuTwo/EvensNorm.lean:119`).

**Repair.** Rewrite *Scope and ownership* in the form `Completed/LocalFieldsRamification/README.md` takes in this pull request. Under *Already in the library*, give each milestone with its exact Tau Ceti declaration, and delete each one as a target. Under *Owned here*, keep only what a search at the pin does not find. I did not find Lam V.3.21 (classification in dimension `≤ 3` by `d` and `s`) under any name I tried; the author should confirm. If nothing remains, the README says so, and `Suggested.lean` states nothing, with its docstring saying why.

## R05 (P2) — 51 `set_option` overrides in `Suggested.lean`

**Location.** Gate `set_option (51)`: `Suggested.lean:1983, 2001–2002, 2023–2024, …, 2169`, for example `set_option maxHeartbeats 1000000 in` before `brauerCohomologyEquiv_crossedProductClass`.

**Claim.** `set_option` is forbidden, and the Principles make it blocking.

**Witness.** The gate's list. All of them sit on Layer 7B statements about the `sorry`'d `brauerCohomologyEquiv` (R02).

**Repair.** Delete them with the Layer 7B declarations (R02, R04). A statement that is kept must elaborate under the default limits.

## R06 (P3) — `Suggested.lean` is an API catalogue; its headlines and most lemmas close with one Tau Ceti lemma

**Location.** The whole file: 349 declarations (188 theorems, 41 examples, 90 definitions), 136 `sorry`s.

**Witness (one-tactic probe in a scratch copy).** Each of these closes with one library lemma:
- `quaternionClass_symm` (563): `TauCeti.BrauerGroup.quaternionClass_comm`
- `quaternionClass_sq` (570): `TauCeti.BrauerGroup.quaternionClass_sq`
- `quaternionClass_mul` (578): `TauCeti.BrauerGroup.quaternionClass_mul`
- `quaternionClass_one_sub` (596): `TauCeti.BrauerGroup.quaternionClass_one_sub`
- `hilbertSymbol_comm` (1212): `TauCeti.hilbertSymbol_comm`
- `hilbertSymbol_congr_sq` (1192): `TauCeti.hilbertSymbol_congr_sq`
- `hilbertSymbol_neg_self` (1198): `TauCeti.hilbertSymbol_neg_self`
- `hilbertSymbol_self` (1242): `TauCeti.hilbertSymbol_self`
- `hilbertSymbol_mul` (1235): `TauCeti.hilbertSymbol_mul_right two_ne_zero`
- `exists_hilbertSymbol_eq_neg_one` (1302): `TauCeti.exists_hilbertSymbol_eq_neg_one two_ne_zero`
- `h2MuToUnits_injective` (1592): `TauCeti.h2MuToUnits_injective`
- `card_squareClass_of_dyadic` (996): `rw [square_eq_range_powMonoidHom, TauCeti.card_squareClasses h2]; rfl`

`hilbertSymbol_unramified` (1218) closes by `simp only [hilbertSymbol, TauCeti.hilbertSymbol_def, hu]`: its hypothesis `hu` is the conclusion unfolded.

There are also 23 `abbrev`s, most of them aliases `:= TauCeti.…`, the `export TauCeti (RegularFormClass formClass)`, and six `rfl` comparisons (`pinE1_eq_native` and its siblings). Thirty-one proved `example`s mirror consumed facts, for example `example (x : ℍ[ℝ]) (hx : x ≠ 0) : IsUnit x := hx.isUnit` (3864). The README's headlines are all proved at the pin:
- the four-fold criterion: `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`;
- the local classification: `RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` in `LocalField/QuadraticForm/Classification.lean`;
- Kahn's formula: see R04.

So none of them belongs in the file.

**Repair.** Delete these declarations from `Suggested.lean`. The README keeps each statement, citing the Tau Ceti name. `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` and `Completed/OrthogonalSpinGroups/Suggested.lean` import this module, so they move to the Tau Ceti names first, as the open GlobalQuadraticForms head already does in its README line 77.

## R07 (P3) — Imports of three roadmap modules, two of them changed by this pull request

**Location.** `Suggested.lean:2–4`: `import TauCetiRoadmap.ProfiniteCohomology.Suggested`, `import Completed.LocalFieldsRamification.Suggested`, `import TauCetiRoadmap.ClassFieldTheory.Suggested`.

**Witness.** Gate `imports (1)`. Class Field Theory and Local Fields Ramification are rewritten by this same pull request. The first import is what brings in the `sorry`'d `cup` (R02).

**Repair.** Keep `import Mathlib` and the individual `TauCeti.*` modules only. The names now taken through these modules have Tau Ceti originals: `TauCeti.ClassFieldTheory.localSymbol`, `TauCeti.hilbertSymbol_eq_cohomological` (`MuTwo/LocalSymbol.lean:191`) and `TauCeti.unitFiltration`.

## R08 (P3) — Ten admitted `example`s

**Location.** Gate `sorry-examples`: `Suggested.lean:1413, 1418, 1423, 1436, 1441, 2776, 2788, 2816, 2824, 3832`.

**Repair.** Delete them. Their content, the ℚ₂ values and the `(2) ∪ (5)` acceptance, stays as README Checks. I recomputed these values in the table below.

## R09 (P3) — The README is not in house shape: no Checks, no *Needs:* lines, no per-layer Examples or Dependencies, TeX

**Location.** `README.md` contains 0 `**Checks.**` lists, 0 `*Needs:*` lines and 0 `### Examples` or `### Dependencies` headings. Its headings are `## Scope`, `## Standing hypotheses and conventions`, `## What this roadmap consumes`, `## The build, in layers` / `### Layer k`, and there is no `## Downstream consumers`. Gate `tex (14)` hits lines such as 1279 `(−1)^{mn}` and 2378 `χ_{L/K}`. Lines 1987–1991 are one unformatted paragraph with run-together tokens ("Layer2", "of6C", "can precede6D") and unquoted Lean names.

**Repair.** Restructure into the house headings, as in the Local Fields Ramification and Class Field Theory READMEs of this pull request. Put the TeX-style exponents into code spans. Re-flow 1987–1991 into the sublayer's milestone list. After R04 little will remain; whatever remains gets `*Needs:*` lines and at least three Checks per definition.

## R10 (P3) — Backticked names that are neither this roadmap's nor exist under the name given

**Location.** Gate `readme-ids-missing (11)`: `brauerCohomologyEquiv_baseChange`, `discr_baseChange`, `discr_one_elem_eq_of_sq_algebraMap`, `finrank_adjoin_simple_eq_two_of_sq_mem_notMem`, `hilbertSymbol_mul_right`, `map_ker_reₗ_of_algEquiv`, `map_norm_unitFiltration_zero`, `signedDiscr_add`, `signedDiscr_mk_rankOne_mul`, `signedDiscr_mul`, `sw1Class_traceTransfer_mk_rankOne`. Also `README.md:1423–1424`: `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`, `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`.

**Witness.** The eleven are Tau Ceti's, for example `TauCeti/Algebra/CrossedProduct/BaseChange/Naturality.lean:51`, or Local Fields Ramification's (`map_norm_unitFiltration_zero`, listed at LFR `README.md:617`). They are written unprefixed. The two Pfister names do not exist at the pin; the theorems are `TauCeti.oneFoldPfister_smul_equivalent_iff` and `TauCeti.twoFoldPfister_smul_equivalent_iff` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Round.lean:44, 61`).

**Repair.** Qualify each name (`TauCeti.…`, `LocalFieldsRamification.…`). Replace the two Pfister names with the `_iff` theorems.

## R11 (P3) — Class Field Theory is cited by the wrong layers

**Location.** `README.md:685–688`, the supplier-layer column: "2--3" for `H`, `muNRep`, `h2MuEquivZMod_mixed`; "3" for `kummerClass`, `kummerCupPairing`, `localSymbol` and `tateDualityPairing_perfect_mixed`; "5" for `hilbertProductFormula`. Also 2015 and 2244: "[Class Field Theory, Layers 2--3]".

**Witness.** At this head, and on main, Class Field Theory's Layer 2 is class formations and Layer 3 is Tate's theorem (`TauCetiRoadmap/ClassFieldTheory/README.md:388, 408`). The local symbol, invariant and duality are its Layer 5 (`:459`; the cohomological Hilbert symbol at `:477`). Hilbert reciprocity is its Layer 14 (`:888`).

**Repair.** Cite Layer 5 for the first three rows and Layer 14 for the fourth, or cite the names through Class Field Theory's *Consumers, and the names they import* table (`:92–110`).

## R12 (P3) — Local Fields Ramification is cited by former layer numbers and removed milestone names

**Location.** `README.md:665–677` and `1646–1660`: supplier layers 0–3, milestones *Graded pieces*, *Existence and uniqueness* and "the non-vacuity milestone".

**Witness.** This pull request renumbers Local Fields Ramification: its Layer 1 is now lower breaks and Layer 2 is Hasse–Arf (`Completed/LocalFieldsRamification/README.md:367, 476`). The old numbers resolve only through its *Former layer numbers* table (`:274–286`). The three milestone names are no longer headings.

**Repair.** Since this pull request changes both roadmaps, cite the current sections or the *Names imported by other roadmaps* list (`:591`), or cite Tau Ceti directly (R04).

## R13 (P3) — Two wrong internal cross-references in 6C

**Location.** `README.md:2102`, "nondegeneracy is item 7", and 2126, "which is item 7 read on this basis".

**Witness.** In the list at 2025–2140, item 6 is *Nondegeneracy* (2043) and item 7 is *The local Hasse invariant* (2046).

**Repair.** Change both to item 6.

## R14 (P3) — Two other open pull requests rewrite this folder, with no stated order

**Location.** Overlap leads, checked at their heads. #1797 and #1215 replace this folder with a house-shaped README of about 2,700 lines and a 296–298-line `Suggested.lean` that imports only `TauCeti.*`. Their heads conflict with this one in `README.md` and `Suggested.lean`. #1187 also conflicts in `Suggested.lean`.

**Witness.** `roadmaps show QuadraticFormInvariants --pr 1797 --file Suggested.lean` begins with `import Mathlib` followed by `import TauCeti.Algebra.Quaternion.BrauerClass`. This head imports the three roadmap modules. The description names only #1410 as merging first.

**Repair.** State the order in the description. The natural one: this pull request drops its 5-line QFI edit, or rebases it onto whichever of #1797 and #1215 merges first. In that version the edit is a one-line wording change to the `muNRepCoeffDictionary` sentence.

## R15 (P3) — Changes outside the folders this review was told are the pull request's own

**Location.** Gate `outside-folder (5)`: `Completed/LocalFieldsRamification/{COMPLETION.md,README.md,Suggested.lean}` and `Completed/LocalGaloisGroups/{README.md,Suggested.lean}`.

**Witness.** `git diff --stat origin/main...HEAD` excluding this folder, Class Field Theory and Integral Lattices lists these five files: 958 insertions and 3,167 deletions. The title, "fix(LocalFieldsRamification): …", shows they are the subject of the pull request, but the review brief does not declare them.

**Repair.** Declare `Completed/LocalFieldsRamification/` and `Completed/LocalGaloisGroups/` as the pull request's own folders in its roadmap metadata, so that they get reviews of their own, or move them to a separate pull request.

## R16 (P3) — Stray file `NativeCompletion.md`, linked from the README

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/NativeCompletion.md` (182 lines); README links at 112, 113, 118, 119 and 124–127.

**Repair.** Delete the file; sources are the README's references. Remove the links with the audit section (R03).

## R17 (P3) — Two linter warnings besides `sorry`

**Location.** `Suggested.lean:3334:77` and `3335:16`: "Unused tactic linter: `<;>` can be removed", in `pinDiagonalLift_mul`. The module compiles: `lake env lean` exits 0. The gate's `build` check fails only on these two warnings.

**Repair.** Remove the two redundant `<;>`, or delete the declaration with R06: `pinDiagonalLift_mul` is a proved finite computation, which is padding.

## R18 (P3) — Cited works missing from the manifest, and targets without locators

**Location.** The README cites many works that have no `sources.toml` entry:
- Lam, *Introduction to Quadratic Forms over Fields*: I.2.3, I.3.4–5, I.4.1–9, I.5.1–2, I.7, II.1, III.2.2/2.7/2.11, III.4.2, V.3.4, V.3.12, V.3.16–21, pp. 119–120, VII §1, X;
- Gille–Szamuely: 1.1.9, 1.5.2, 4.4, 4.7;
- Grove, Delzant and Fröhlich.

"Compatibility with the cup product" (2278) and "The Hilbert symbol is this roadmap's, in both halves" (1994) carry no locator.

**Repair.** Add one manifest entry per work, with its locators. For Lam and Gille–Szamuely, record a status (`uncertified` if paywalled). Give each target a locator, or cite the Tau Ceti theorem that proves it (R04).

## R19 (P3) — "Canonical owner of the Kummer-cup/norm-equation criterion" overlaps Class Field Theory's Layer 5

**Location.** `README.md:2644`: "**This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion.**"

**Witness.** Class Field Theory, in this pull request, lists "the cohomological Hilbert symbol … the norm criterion" as its Layer 5 (`TauCetiRoadmap/ClassFieldTheory/README.md:56–58`). Its Tau Ceti row records `TauCeti.ClassFieldTheory.localSymbol_eq_zero_iff_mem_normGroup` (`:295`). That theorem is stated for any field containing `μ_n` ("`K` need not be a local field", `TauCeti/NumberTheory/ClassFieldTheory/Local/CyclicClass.lean`). At `n = 2`, `ζ = −1`, it is this sublayer's statement in `μ₂` coefficients.

**Repair.** Scope the sentence. This roadmap states the trivial-`𝔽₂` cup form (Tau Ceti's `cup_kummerClass_eq_zero_iff`, `MuTwo/CupNorm.lean:103`) and the comparison `localSymbol_eq_zero_iff_cup`. The `μ_n` norm criterion is Class Field Theory Layer 5's, and is cited.

## Verified sound

**Gate and build.**
- The worker's gate fails on `set_option` 51, `tex` 14, `sorry-data` 9, `sorry-examples` 10, `imports` 1, `readme-ids-missing` 11, `stray-files` 1, `outside-folder` 5 and `build` 2. Each is a finding above: R02, R05, R07–R10 and R15–R17.
- Dependency check, run as briefed: `depcheck: 239 roadmaps, 2331 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. All suppliers are on main.
- `lake env lean` on `Suggested.lean`: exit 0, 54.8 s, 136 `sorry` warnings and the two linter warnings of R17.

**Mechanical signature check.** I ran a scratch file of 289 `#check @…` lines, one per declaration name; three were docstring words and were discarded. I compared the local-field and defect declarations with the README:
- `IsUniformizer`, `dyadicLevel`, `card_squareClass_of_odd`, `card_squareClass_of_dyadic`, `exists_unramified_class`, `unramified_class_unique`, `nonempty_unitFiltrationGraded_*`, `quadraticDefect` and `existsUnique_isQuadraticDefect` all carry `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`.
- `squareClass_finite` does not (R01).
- The crossed-product instances keep `[FiniteDimensional K L] [IsGalois K L]`.

**One-tactic probes (scratch).**
- 13 closures: the 12 listed in R06 plus `hilbertSymbol_unramified`.
- `cup_kummerClass_eq_zero_iff` does not close, because `cup11` is the `sorry`'d cup (R02).
- `kummerClass = TauCeti.kummerClass` is `rfl`.

**Library declarations opened at the pin (Tau Ceti `2fd255d`).**
- `Algebra/CrossedProduct/BaseChange/ULift.lean:205, 216, 228, 238`
- `FieldTheory/GaloisCohomology/MuTwo/CupNorm.lean:73–155`; `LocalSymbol.lean:157, 169, 180, 191, 213`; `BrauerTorsion.lean:62, 91, 98`; `Basic.lean:191, 268, 355, 668`; `EvensNorm.lean:80, 119`
- `FieldTheory/QuadraticForm/StiefelWhitney/QuadraticExtension.lean:120–268`
- `Algebra/Quaternion/BrauerClass.lean:173–380`
- `LinearAlgebra/QuadraticForm/RegularFormClass/Hasse/Basic.lean:125–281`; `RegularFormClass/Clifford.lean:173–262`
- `Witt/Clifford.lean:142–187`; `Witt/Round.lean:44, 61`; `Witt/Signature.lean:114`; `Witt/Degenerate.lean:50`
- `Diagonal/Contiguous/Connected.lean:39, 70`
- `NumberTheory/HilbertSymbol/Basic.lean:47, 57, 102, 147, 251`; `HilbertSymbol/NormSubgroup.lean:224`
- `NumberTheory/LocalField/QuadraticForm/Bimultiplicativity.lean:97, 155`; `QuadraticForm/UnramifiedClass.lean:206`
- `NumberTheory/LocalField/PowerSubgroup/Basic.lean:382, 390`; `UnitFiltration/Basic.lean:250`; `UnitFiltration/Graded.lean:246`
- `NumberTheory/ClassFieldTheory/Local/CyclicClass.lean` (`localSymbol_eq_zero_iff_mem_normGroup`)

There is no `sorry` in `Algebra/CrossedProduct/`, `FieldTheory/GaloisCohomology/`, `FieldTheory/QuadraticForm/`, `NumberTheory/LocalField/QuadraticForm/` or `LinearAlgebra/QuadraticForm/`.

**Cross-roadmap citations resolved.**
- Class Field Theory at this head: `H` (`Suggested.lean:166`), `absoluteGaloisGroupComparison` (171), `muNRep` (177), `muNRepCoeffDictionary` (182). The last is `TauCeti.ClassFieldTheory.kummerCoeffEquivMuNRep`, as this pull request's edit of README 703 says. Also `kummerClass` (227), `kummerClass_eq_kummerCocycleClass` (234), `h2MuEquivZMod_mixed` (263), `kummerCupPairing` (291), `localSymbol` (306), `tateDualityPairing` (332), `finiteHilbertInvariantAt` (690), `infiniteHilbertInvariantAt` (696), `finiteHilbertSupport` (701) and `hilbertProductFormula` (706).
- The two citation-tool leads (`absoluteGaloisGroupComparison`, `muNRepCoeffDictionary`) therefore resolve.
- Every Local Fields Ramification name of the contract table appears in its *Names imported by other roadmaps* list at this head.
- Profinite Cohomology names resolve in its README layers: `trivialF2` (Layer 13), `corestriction_mackey` (Layer 10, :1649), `explicitCup11` (Layer 8, :1278) and `explicitFiniteQuotientColimit2` (Layer 4, :945).

**Ownership against open pull requests.**
- QuadraticFormInvariantsPartII (#1834, README 24–33) owns exactly this roadmap's three exclusions, so there is no overlap.
- GlobalQuadraticForms (#1200, README 76–79) cites this roadmap's results as Tau Ceti declarations.
- Class Field Theory's boundary paragraph (`README.md:84–87`) matches 1994–2004, apart from R19.

**Seeded sample (7 targets).**
1. "Audit status: incomplete…" (35): false at the pin (R03).
2. "From the local-fields-ramification roadmap" (652): names resolve; layers stale (R12); "frozen" rows already in Tau Ceti (R04).
3. "From the class-field-theory roadmap" (679): names resolve; layer column wrong (R11).
4. "From the profinite-cohomology roadmap" (718): names resolve; `cup` is `sorry`'d (R02).
5. "The Hilbert symbol is this roadmap's, in both halves" (1994): consistent with Class Field Theory 84–87, no locator (R18). Tau Ceti's `hilbertSymbol_eq_cohomological` holds for every field with `2` invertible; this roadmap's Lean version (2554) narrows it to local fields in `Type`.
6. "Compatibility with the cup product" (2278): mathematics verified (row 12 below), no locator (R18).
7. "canonical owner of the Kummer-cup/norm-equation criterion" (2644): its locators, Serre *Local Fields* XIV §2 Props 4–5 and Gille–Szamuely 4.7, are under Not verifiable; the ownership claim is R19.

The Kahn locators of Layer 9 were checked in the cached text:
- Lemme II.2.1 at kahn1984 line 763, printed p. 241, gives `N((a)) = (Tr a, −d N a) + (2, d)` for `Tr a ≠ 0` and `(2, d)` for `Tr a = 0`, as README 2973–2974 has it.
- Prop. II.3.5 at kahn1984 line 1044, printed p. 248, gives Théorème 2 for a quadratic extension and a rank-one form. Its degree-2 part, `(Tr a, −dNa) = (2, d) + N((a))` with `(d, Na) = 0` (lines 1049–1057), is README 3113–3114.

**Adversarial table.**

| # | Statement | Instances tried | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | 6C Gram matrix on `{−1, 2, 5}` (README 2118–2125) | ℚ₂ via Serre's formula | `(−1,−1)`: `ε(7)ε(7) = 1` → −1; `(−1,2)`: `0 + 0 + ω(7) = 0` → +1; `(−1,5)`: `ε(7)ε(5) = 0` → +1; `(2,2)`: `ω(1) = 0` → +1; `(2,5)`: `α ω(5) = 1` → −1; `(5,5)` → +1; det over `𝔽₂` = 1 | matches; nondegenerate |
| 2 | `hilbertSymbol_padicTwo` (Lean 1398) | `(a,b) = (2,5), (−1,−1), (5,5)` | exponents `1, 1, 0`, so `−1, −1, +1`; witness `5 = 5² − 5·2²` | correct |
| 3 | `hilbertSymbol_of_odd` (Lean 1278) | ℚ₃, `π = 3`, `a = b = 3` | `(3,3) = (3,−1) = (−1)^{(3−1)/2} = −1` / formula `(3,−1)^1 · 1 · 1 = −1` | correct |
| 4 | `exists_of_realization` (Lean 1321) | ℚ₂; `n = 1, 2` | `(1, d, −1)` excluded by `h₁`; `(2, [−1], −1)` excluded by `h₂`, since `⟨a,−a⟩` has `s = (a,−a) = +1`; `⟨−1,−1⟩` realizes `(2, [1], −1)`, as `d = 1`, `s = (−1,−1)₂ = −1` | correct |
| 5 | 6D isotropy, ranks 3 and 4 (README 2194–2195) | `⟨1,1,1⟩`, `⟨1,1,1,1⟩` over ℚ₂ and ℚ₃ | ℚ₂ rank 4: `d = 1`, `s = +1 ≠ (−1,−1)₂ = −1`, anisotropic; ℚ₃: `s = +1 = (−1,−1)₃`, isotropic (`1² + 1² ≡ −1 mod 3`); ℚ₂ rank 3: `s = +1 ≠ (−1,−d) = −1`, anisotropic | correct |
| 6 | Unit defects (README 1843, 1962, 1977) | ℚ₂, `e = 1` | `δ(5) = 2`, as `5 − ξ² ≡ 4 mod 8` for units `ξ`; `δ(−1) = 1`; `δ(−5) = 1` since `−5 ≡ 3 mod 8`, while multiplicativity would give `8ℤ₂`; `δ(5/4) = 2 − 2 = 0` (`5/4 − 1/4 = 1`) | correct; non-multiplicativity confirmed |
| 7 | `defectExponent_unit` (Lean 1122) | odd residue (`e = 0`); ℚ₂ | nonsquare unit: `δ = 0 = 2e`, second disjunct empty; ℚ₂: `δ(5) = 2 = 2e`, `δ(−1) = 1 = 2·0 + 1` with `0 < 1` | correct |
| 8 | `discr_traceTransfer`, Kahn's basis (README 2893–2911) | ℚ(√2), `a = 1 + √2`; `a = √2` | Gram on `(1, √2)`: `[[2,4],[4,4]]`, det `−8 ≡ −2` / `d·N a = 2·(−1) = −2`; trace zero: `[[0,4],[4,0]]`, det `−16 ≡ −1` / `2·(−2) = −4 ≡ −1` | correct |
| 9 | `galoisEvens2_kummerClass(_one_add)` (Lean 3725, 3753) | ℚ₂(i), `a = 1 + 2i` | `Tr = 2`, `N = 5`: `(2)∪(5) + (2)∪(−1) = (2)∪(5)` / `(2)∪(1 + 4) = (2)∪(5)`; `(2,5)₂ = −1`, so nonzero; SD₁₆ variant `(2)∪(5) + (−1)∪(−1) = 1 + 1 = 0` | consistent; the sign is pinned |
| 10 | Kahn formula, degrees 1 and 2 (Lean 3794) | ℚ₂(i), `a = 1 + 2i` | deg 1: `(2·(−2/5)) ≡ (−5)` / `(−1) + (5) = (−5)`; deg 2: `(2)∪(−2/5) = (2)∪(5)` / `(2)∪(−2) + (2)∪(5) + (−1)∪(5) = 0 + (2)∪(5) + 0` | both sides equal |
| 11 | Lam V.3.20 on `I²` (README 1543–1545) | `⟨⟨a,b⟩⟩`, `n = 4` | exponents `3, 5` odd, `d = 1`: `c = s·(−1,−1)`; `s(⟨1,−a,−b,ab⟩) = (−1,−1)(a,b)`, so `c = (a,b)`, matching step 2 and `m(m−1)/2 = 1` | consistent |
| 12 | 6E cup compatibility (README 2278–2283) | general | `ι[(a,b)] = (a)∪(b)`, `ε(hasseInvariant⟨a,b⟩) = ε[(a,b)] = (a,b)_K`, so `ε∘ι⁻¹((a)∪(b)) = (a,b)_K` | correct |
| 13 | `hasseInvariant_smul` (Lean 634) | `n = 2`; `n = 0` | `(λa, λb) = (λ,−1)(λ,ab)(a,b)` / `s·(λ,−1)^1·(λ,ab)^1`; `n = 0`: both `1` (the `n − 1` junk value is harmless) | correct |
| 14 | `hasseInvariant_append` (Lean 624) | `⟨a⟩ ⊥ ⟨b⟩` | `(a,b)` / `1·1·(a,b)` | correct |
| 15 | Signed discriminant of a sum (README 1279) | `m = n = 1` | `(m+n)(m+n−1)/2 − 0 − 0 = 1 = mn` | correct |
| 16 | `squareClass_finite` (Lean 973) | `K = ℚ` | elaborated `∀ K [Field K] [Invertible 2], Finite …` / ℚ has infinitely many classes | **false (R01)** |
| 17 | `card_squareClass_of_dyadic` (Lean 996) | ℚ₂; ℚ₂(√2); ℚ₂(√5) | `4·2 = 8`; `4·2² = 16`; `4·4 = 16` / `2^{N+2} = 8, 16, 16` | correct (and Tau Ceti's) |
| 18 | Local square theorem sharpness (README 1770) | ℚ₂ | `5 ∈ 1 + 4ℤ₂`, not a square (unit squares are `≡ 1 mod 8`); `1 + 8ℤ₂ ⊆ (ℚ₂ˣ)²` | correct |
| 19 | Failure of bimultiplicativity over ℚ (README 2161) | `a = −1` | 3, 7 and 21 are not sums of two squares, so a product of two non-norms is a non-norm | correct |
| 20 | Rank-one chain counterexample (README 993) | `⟨1⟩`, `⟨4⟩` over ℚ | `x ↦ 2x` carries `4x²` to `(2x)²`; a rank-one chain is equality | correct |
| 21 | Pin⁺ model (README 2985–3041) | explicit matrices | `e₁e₂ = [[0,1],[−1,0]] = −e₂e₁`; `t² = (2I)/2 = I`; `e₁t` is rotation by `π/4`, `(e₁t)⁴ = −I`; `e₁^a e₂^b e₁^{a'} e₂^{b'} = (−1)^{ba'} e₁^{a+a'} e₂^{b+b'}` | correct |
| 22 | `unitNorm_iff_integralBasis_families` (Lean 1152) | general degree-2 `L` | `N(X + Yω) = X² + TXY + NY²`; divide by the unit coordinate to get `u²(1 + Tt + Nt²)` or `u²(t² + Tt + N)`; converse `N(u(1 + tω))`, `N(u(t + ω))`; ramified control `(π + 1/2)² − 5/4 = 1 + π` | correct |
| 23 | 6C cross-references (README 2102, 2126) | item list 2025–2140 | "item 7" / nondegeneracy is item 6 | **wrong (R13)** |
| 24 | ULift square (README 86–90) | statement against pin | README equation / `brauerExplicitH2Equiv_uliftEquiv`, the same equation, proved | **claim "outstanding" false (R03)** |

## Not verifiable

- serre1979lf, *Local Fields*: X and XIV §2 Props 4–5. Settled as `uncertified`; no legal copy was read. Cited for 7B and 7C.
- serre1973cia, *A Course in Arithmetic*: III Thm 1–2, IV Thms 5–7, Prop. 6. `uncertified`. I recomputed the formulas (rows 1–5) but did not read the text.
- omeara1963 §63 (63:1, 63:2, 63:11–13, 63:17–23): `uncertified`.
- milnor1970 §4 and scharlau1985 (Ch. 2 §5, Ch. 5): `uncertified`.
- Lam, *Introduction to Quadratic Forms over Fields*: not in the manifest. It is an AMS monograph with no open copy I know of. All Lam locators, including the Wall "Caution" on p. 120, are unchecked.
- Gille–Szamuely, *Central Simple Algebras and Galois Cohomology*, 1.1.9, 1.5.2, 4.4 and 4.7: not in the manifest. Cambridge University Press, with no open copy.
- Grove, Delzant and Fröhlich: not in the manifest, and no locator given.
- The cached serre1984cmh (Théorème 1′), kozlowski1984 (Thm 1.1), evens1963 and guillot2010 were not reopened. Only their use through Kahn's own citation of Serre's Théorème 1′ (kahn1984 line 776) was seen.
- Whether Lam V.3.21 (classification in dimension `≤ 3`) is at the pin: not found by the names I searched (R04).

## Source issues

- none
