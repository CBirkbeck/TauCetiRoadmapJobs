# Review of SchemeAndStackFoundations (pull request #1807 at cabeb14)

**Verdict:** needs changes

This is an incremental re-review: nothing in the folder has changed since 64a16e1.
- `git diff 64a16e1 cabeb14 -- TauCetiRoadmap/SchemeAndStackFoundations` is empty. The 14 files changed since then are in AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, ClassifyingSpaces, GeneralizedCohomology, ReductiveGroups and RigidAnalyticGeometry.
- The pins are unchanged: Mathlib 1b1ccf4b and Tau Ceti 2fd255d9.
- Main has moved to 01daf25. It touched only `PROGRESS.md` and `STATUS.md` in this folder, and nothing in EnhancedDerivedSheaves or AbhyankarLemma since 8d9e0a0.

None of the thirteen previous findings is repaired. Each is restated with its number, and three of them are corrected:
- **R04:** the previous list of "structure fields" was wrong. Lines 47, 78, 84, 87, 107 and 120 are theorem and example proofs. The five remaining sorry-data hits are lines 2536, 2542, 2549, 2562 and 2569.
- **R09:** two of the fifteen names lie outside §0.30, and one of them is Mathlib's.
- **R02:** three more redeclared carriers exist at the Tau Ceti pin.

The gate fails on the same seven rules with the same counts as before. The build, the elaboration and the dependency check pass.

## R01 (P2) — §4.13's regular-local-ring paragraph re-plans what the pinned libraries already prove

**Location.** README.md lines 5657–5718, "*Regular local rings: Serre's theorem and localization.* … Prove *IsRegularLocalRing.isCohenMacaulay* …". Also:
- the `*Needs:*` line at 5746–5753;
- the Checks at 5762–5766;
- the consumer lines 7481–7484;
- line 5661, which calls this Layer-4 target "the local statement behind §0.17 `Ring.IsCohenMacaulay.of_isRegularRing`", a Layer-0 item.

**Claim.** About sixteen targets are owned here, from `IsRegularLocalRing.isCohenMacaulay` through `auslander_buchsbaum`, `isRegularLocalRing_tfae`, 0AFS and `isRegularRing_of_isRegularLocalRing`, together with a Koszul route for 00OA.

**Witness, re-opened at the pins this round.**
- Tau Ceti `RingTheory/RegularLocalRing/CohenMacaulay.lean` 125 (`isCohenMacaulay`).
- `RegularLocalRing/Free.lean` 93 (`free_of_isCohenMacaulay`).
- `GlobalDimension.lean` 70 and 90.
- `RegularLocalRing/ProjectiveDimension.lean` 222, 392 and 441.
- `Depth/AuslanderBuchsbaum.lean` 148.
- Mathlib `RingTheory/RegularLocalRing/Defs.lean` 94, the field `IsRegularRing.isRegularLocalRing_localization`.

**Repair.**
1. Delete the paragraph's targets and the Koszul route.
2. Under `From Tau Ceti` and `From Mathlib`, cite these declarations by name and file, with their hypotheses (`[Small.{v} R]`, nonzero `M`, `supportDim = ringKrullDim`).
3. Restate the three Checks against the cited declarations, or delete them.
4. Make lines 7481–7484 say that LocalPurity, PurityOfBranchLocus and AbhyankarLemma receive these declarations through this roadmap's contract.

## R02 (P2) — Suggested.lean and the README redeclare carriers the pinned Tau Ceti provides

**Location.** Suggested.lean 16–17, "Key definitions and headline theorems of the roadmap on Mathlib's schemes and Tau Ceti's carriers". The redeclarations:
- `class IsNormalScheme` (935)
- `def IsAlgebraicSpace` (1056)
- `class IsThickening` (1978)
- `class IsModification` (2152)
- `def Ring.IsNagata` (251)
- `def IsGRing` (291)
- `Excellence.GeometricallyRegular` (276), `RegularAlgebraMap` (282) and `regularLocus` (287)

The README does the same, among other places in §§0.10, 0.17, 0.20, 0.21, 0.30 and 4.13.

**Witness at Tau Ceti 2fd255d9.** The first eight were re-opened this round; the last three are new:
- `class IsNormalScheme`: `AlgebraicGeometry/Scheme/Normal.lean` 84.
- `class IsThickening`: `Morphisms/Thickening.lean` 69.
- `class IsModification`: `Morphisms/Modification/Basic.lean` 53.
- `structure IsAlgebraicSpace`: `AlgebraicSpace/Basic.lean` 195.
- `structure RatEquivFamily`: `Chow/Basic.lean` 112.
- `class IsNagata`: `RingTheory/Nagata.lean` 65.
- `class TauCeti.Excellence.IsGRing`: `RegularLocalRing/GRing.lean` 57.
- `def IsPseudoCoherentOver`: `Algebra/Module/PseudoCoherent/Basic.lean` 89.
- New: `class TauCeti.Excellence.GeometricallyRegular` (`RegularLocalRing/GeometricallyRegular.lean` 70), `class TauCeti.Excellence.RegularAlgebraMap` (`RegularAlgebraMap.lean` 54) and `def TauCeti.Excellence.regularLocus` (`Locus.lean` 61).

RigidAnalyticGeometry, at this head, already consumes `TauCeti.Excellence.IsGRing` and `TauCeti.Excellence.regularLocus` directly (README lines 184–186 and 553).

**Repair.**
1. Delete each redeclared definition and its API from Suggested.lean, and state the headlines on the pinned carriers.
2. List each carrier under `From Tau Ceti` with its name and file.
3. Keep in the layers only what is absent at the pin; `IsJ2` and `IsQuasiExcellentRing` are absent, for example.

## R03 (P2) — AbundanceStatement is cited as a supplier

**Location.** README.md 440–443, for example "| AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.9's characteristic-zero divisor/curve degree". The same supplier citation recurs at 767, 3448, 4727, 5652, 5731, 5737, 6623, 7207, 7219, 7271–7276, 7282, 7292, 7299, 7310, 7327, 7443 and 7474.

**Witness.** AbundanceStatement is on the brief's list of roadmaps that are never cited as suppliers. It is not on main at 01daf25: there is no folder for it under `TauCetiRoadmap/` or `Completed/`. It exists only as the open new-roadmap pull request #545. The gate's `dropped` rule flags 39 occurrences.

**Repair.**
1. Delete the four table rows and every supplier sentence listed above.
2. State here, as targets with hypotheses and locators, the characteristic-zero facts that §§5.9–5.10 take from it: the divisor/curve degree bridge, the numerical Cartier quotient, finite generation and the Nakai–Moishezon criterion. Cite Hartshorne V.1, Fulton 1998 §19.1 and Kleiman for Nakai–Moishezon.

## R04 (P2) — sorry'd data in Suggested.lean

**Location.** The gate's 25 `sorry-data` hits, listed here in full:
- 550, `def absoluteFrobenius (X : Scheme.{u}) (hX : SchemeCharP X p) : X ⟶ X :=`
- 653, 710, 729, 744, 1115
- the local instances at 1539 and 1541
- 1552, 1568, 1582, 1649, 2053, 2073, 2112, 2164, 2442
- the local instances at 2530, 2532, 2534 and 2536
- 2542 (`finitelyPresentedExact`), 2549 (`finiteLocallyFreeExact`), 2562 (`K0.det`) and 2569 (`K0.toG0`), whose proof fields are `by sorry`

**Correction.** The previous report's "structure fields at lines 47, 78, 84, 87, 107 and 120" are not data. Line 47 is the proof of `Proj.isPullback_baseChange`, line 78 the proof of `isPseudoCoherentSheaf_iff_affineOpens`, and the other four are bodies of admitted examples.

**Witness.** A scan of every `def`, `abbrev`, `instance`, `structure` and `class` body finds `sorry` in exactly these 25 declarations. Theorems are stated on them, for example on `derivedHomPresheaf`, `Scheme.formalCompletion`, `RatEquiv`, `G0` and `K0`.

**Repair.**
- Give each definition a real body on a pinned carrier, or delete it and keep its README target with the intended signature.
- Delete every theorem that mentions a deleted definition, or restate it on the pinned carrier.

## R05 (P3) — admitted examples

**Location.** Suggested.lean has 101 `example … := by sorry`, starting at line 81. README line 284 promises "some Checks as `example`s".

**Witness.** The gate's `sorry-examples` rule fails 101 times. Only the examples at 224 and 1267 are proved.

**Repair.** Delete every admitted example and the promise at line 284. The README's Checks keep the statements.

## R06 (P3) — another roadmap's module is imported

**Location.** Suggested.lean line 2, `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.

**Witness.** The gate's `imports` rule fails on this line. Lines 2534–2549 and 2562 use `TauCetiRoadmap.AlgebraicVectorBundles.isFiniteLocallyFree`, `FiniteLocallyFreeSheaf` and `determinantObj` from it.

**Repair.** Drop the import. Then either restate the Layer-5 `K0` and determinant statements on Tau Ceti's `LineBundleClass` and `Scheme.Modules`, or name them in the module docstring as not statable.

## R07 (P3) — statement hygiene (11 gate hits)

**Location.**
- Lines 219, 1378, 1387 and 1960 conclude `Nonempty (… ≃ …)`.
- Lines 646, 1535, 1898, 2297, 2480 and 2481 put `letI` in a signature.
- Line 2598, `theorem weil_bound (k : Type u) [Field k] [Fintype k]`.

**Repair.**
- State the canonical map and `IsIso` of it, and keep `Nonempty` only in a corollary named `nonempty_*`.
- Replace each `letI` with an instance binder.
- In `weil_bound`, use `[Finite k]` with `Nat.card k`.

## R08 (P3) — TeX-only syntax in §§0.28–0.29 (65 gate hits)

**Location.** README.md 1788, 1862, 1874–1877, 1883, 1887, 1890, 1902, 1916, 1929, 1933 and 1942–1943, for example "= X^{(p/S)} = X ×_{S,F_S} S, with projections π₁ to X and π₂ to S".

**Repair.** Put each formula in a code span, or write its subscripts and superscripts in Unicode.

## R09 (P3) — backticked own names that Suggested.lean does not declare (15 gate hits)

**Location.**
- Thirteen are in §0.30 (lines 1962–2019): `isNormalScheme_iff_forall_affineOpens`, `IsNormalScheme.of_isOpenImmersion`, `isNormalScheme_Spec_iff`, `IsNormalScheme.isIntegrallyClosed_of_isAffineOpen`, `IsNormalScheme.of_isRegular`, `codimensionOneMap_comp`, `codimensionOneMap_id`, `ramificationIdxAt_pos`, `ramificationIdxAt_eq_dvr` and four Check names.
- **Correction:** `isReduced_iff_R0_S1` is in §0.17 (line 1190), and `isReduced_of_isReduced_stalk` is in Scope and ownership (line 165).

**Witness.**
- Four of the §0.30 names are at Tau Ceti `AlgebraicGeometry/Scheme/Normal.lean` lines 153, 100, 181 and 195.
- `IsRegular.isNormal` is an instance at `Scheme/Regular/Scheme.lean` 175.
- Line 165 already attributes its name to Mathlib, which is `AlgebraicGeometry.isReduced_of_isReduced_stalk` (`AlgebraicGeometry/Properties.lean` 73). The checker does not resolve the unqualified form.

**Repair.**
- Cite the four Normal.lean names under `From Tau Ceti`, and make `IsNormalScheme.of_isRegular` a citation of `IsRegular.isNormal`.
- Write line 165's name with its `AlgebraicGeometry.` namespace.
- State the remaining names in prose.

## R10 (P3) — padding: five declarations close by `rfl`

**Location.** Suggested.lean:
- 393, `universalHomeomorphismEtaleEquivalence_functor`
- 569, `absoluteFrobenius_base`
- 691, `iteratedSchemeFrobenius_zero`
- 695, `iteratedSchemeFrobenius_succ`
- 791, `qPowerFrobenius_eq_iterated`

**Witness.** The probe was re-run this round on a scratch copy with the five `sorry` proofs replaced by `rfl`. The copy elaborates with exit 0 and no error, and the `sorry` warnings drop from 229 to 224. Each declaration restates a defining equation.

**Repair.** Delete the five from Suggested.lean. The README keeps them as API bullets.

## R11 (P3) — locators

- **Lines 3641–3643** cite "(Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A)" for `smoothGroup_fppf_etale_comparison`. Repair: cite Grothendieck, *Le groupe de Brauer III*, Théorème 11.7, and record it in `sources.toml`.
- **Line 887** cites both unibranch statements to "Stacks, Lemma 15.108.5". Repair: cite 0BQ0 (Lemma 15.108.3) for the henselization statement.
- **Line 1531** gives "Theorems 59.45.1–59.45.2 (04DZ)", but Theorem 59.45.1 is 0BTY. Repair: give both tags.

## R12 (P3) — conflicting open heads with no stated order

**Location.** The merge-order paragraph of the pull request description: "No open pull request must merge before this one."

**Witness.** Two pull requests by another author revise this folder and conflict with this one in `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, according to the overlap report re-read this round:
- #1276, now at head 3cc1013;
- #1656, at head 1bfff38.

Their copies differ from this head in 4669 and 6022 diff lines respectively. #1854's copy of README.md is identical to this head. #1808 is stacked after this pull request and is named.

**Repair.** Name #1276 and #1656 in the merge-order paragraph, and say which is rebased on which.

## R13 (P3) — the EnhancedDerivedSheaves consumer sentence is not supported

**Location.** README.md 5713–5715, "EnhancedDerivedSheaves E1.6 consumes *isRegularLocalRing_of_projectiveDimension_residueField* and *globalDimension_le_iff_hasProjectiveDimensionLE*".

**Witness, on main at 01daf25 (unchanged since 8d9e0a0).**
- EnhancedDerivedSheaves owns the first name itself: README 693, `Suggested.lean` 94.
- Neither of its files mentions the second.
- From §4.13 it takes only `IsRegular.isCohenMacaulay` (README 716).

**Repair.** Replace the clause with what that roadmap actually consumes (`IsRegular.isCohenMacaulay`), or delete it. Together with R01, point it at the Tau Ceti declarations.

## Previous findings

- R01 — not repaired: line 5658, "Prove *IsRegularLocalRing.isCohenMacaulay*: a regular local ring of dimension `d` has depth `d`, by induction on a regular system of parameters"; the 00OA Koszul route at 5696–5711 is unchanged.
- R02 — not repaired: Suggested.lean 16–17, "Key definitions and headline theorems of the roadmap on Mathlib's schemes and Tau Ceti's carriers"; `class IsNormalScheme` is still at line 935.
- R03 — not repaired: line 440, "| AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) |"; 39 gate hits.
- R04 — not repaired: line 550, `def absoluteFrobenius (X : Scheme.{u}) (hX : SchemeCharP X p) : X ⟶ X :=`; 25 gate hits. The location is corrected above.
- R05 — not repaired: line 81, `example (A : Type u) [CommRing A] (n : ℕ) :` … `by sorry`; 101 gate hits.
- R06 — not repaired: line 2, `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.
- R07 — not repaired: line 2598, `theorem weil_bound (k : Type u) [Field k] [Fintype k]`; 11 gate hits.
- R08 — not repaired: line 1874, "= X^{(p/S)} = X ×_{S,F_S} S"; 65 gate hits.
- R09 — not repaired: the same 15 names are undeclared, for example `isNormalScheme_Spec_iff` at line 1964. The location is corrected above.
- R10 — not repaired: line 569, `(absoluteFrobenius p X hX).base = (𝟙 X : X ⟶ X).base := sorry`; `rfl` closes all five.
- R11 — not repaired: lines 3641–3643, "Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A"; lines 887 and 1531 are unchanged.
- R12 — not repaired: "No open pull request must merge before this one."; #1276 and #1656 are still unnamed.
- R13 — not repaired: lines 5713–5715, "EnhancedDerivedSheaves E1.6 consumes … *globalDimension_le_iff_hasProjectiveDimensionLE*".

## Verified sound

**Scope.**
- Against main, the pull request still changes only README.md in this folder (+84/−9 against the merge base eaf17b1).
- The brief's exclusion diff is empty: none of the pull request's 24 other files lies outside its own 13 other folders.
- `lake-manifest.json` matches main, and `.lake/packages` are checked out at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9.

**Gate.** The re-run on this head reports the worker's seven failing rules with identical counts: tex 65, sorry-data 25, sorry-examples 101, imports 1, statement-hygiene 11, dropped 39 and readme-ids-missing 15. Every other rule is 0, apart from `outside-folder=24`. That count is exactly the 24 files the pull request changes in its 13 other folders, which the brief names as its own.

**Elaboration.**
- `lake env lean` on Suggested.lean exits 0 in 2 min 13 s, with 229 `declaration uses sorry` warnings and no other diagnostic.
- A scratch copy with `#check @name` for all 223 named declarations elaborates with exit 0 and prints 223 signatures, with no errors.
- The elaborated types of `weil_bound` (binders `[Fintype k]`, `[IsProper]`, `[Smooth]`, `[GeometricallyIntegral]`, `topologicalKrullDim X = 1` and finite-dimensional `H¹(O_X)`), `Picard.lineBundleClass_spec_equiv_pic` and `Proj.isPullback_baseChange` match their README statements. No section variable is lost.

**Dependency check.** Output: `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The `roadmaps resolve` leads list no cross-roadmap citation that is found nowhere. The Lean-name leads are this roadmap's own names, and R09 covers the undeclared ones.

**Overlaps.**
- The overlap report finds no id cited here that an open pull request drops, no id that only an open revision defines, and no id this pull request drops that others cite.
- Among the closest roadmaps in vocabulary, #853 AlgebraicModuliForArithmeticGeometry was read this round (README lines 21–35, 153, 235–259, 324, 800 and 823–831). It consumes §§0.3, 1.23, 2.6, 4.12, 4.14 and 5.4 by section. It extends the projective bundle to quasi-coherent `E` and says how this differs, so it does not own an object of this roadmap.
- #1840, #1796, #1743 and #1754 carry forward from the previous report.

**Citations of this roadmap in the files changed since 64a16e1.**
- AlgebraicCurves README 74 and 2255 name this roadmap as a consumer of its function-field layers and §4.15 as the owner of stable-curve moduli. This README consumes AlgebraicCurves Layers 3, 4, 7, 8, 10 and 12 (line 5030), so the direction is the same and there is no cycle.
- RigidAnalyticGeometry README 134, 281, 373–385, 516, 551, 989, 1046, 1443 and 1541 consume §0.20 (Japanese rings, permanence) and §0.21 (G-rings, J-2, excellence, completion criteria). §0.21 contains `regular_map_completion` (reducedness and normality under regular maps, and `A → Â` regular for a local G-ring; Stacks 07QK, 0BFK, 0H7S, 0H7T) and the excellence permanence lemmas, so these citations resolve.
- LocalPurity (README 33–38, 71) and PurityOfBranchLocus (17, 33, 61, 136) are unchanged since 64a16e1 and consume §4.13 as line 7481 says.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `RegularLocalRing/CohenMacaulay.lean` 125
  - `Free.lean` 93
  - `GlobalDimension.lean` 70 and 90
  - `ProjectiveDimension.lean` 222, 392 and 441
  - `Depth/AuslanderBuchsbaum.lean` 148
  - `Scheme/Normal.lean` 84, 100, 153, 181 and 195
  - `Scheme/Regular/Scheme.lean` 175
  - `Thickening.lean` 69, `Modification/Basic.lean` 53, `AlgebraicSpace/Basic.lean` 195, `Chow/Basic.lean` 112
  - `Nagata.lean` 65, `GRing.lean` 52–57, `GeometricallyRegular.lean` 64–70, `RegularAlgebraMap.lean` 49–54, `Locus.lean` 55–61
  - `PseudoCoherent/Basic.lean` 89
- Mathlib:
  - `RingTheory/RegularLocalRing/Defs.lean` 92–97
  - `AlgebraicGeometry/Properties.lean` 73 and 287
  - `RingTheory/RamificationInertia/Ramification.lean` 54–57 (length-based `Ideal.ramificationIdx`) and 280 (`ramificationIdx_tower` with `[Module.Flat S T]`)
  - `AlgebraicGeometry/Morphisms/FormallyUnramified.lean` 54

**Cross-roadmap citations resolved.**
- On main at 01daf25: EnhancedDerivedSheaves README 25–26, 128–154, 693 and 716, and `Suggested.lean` 94.
- At this head: AlgebraicCurves, RigidAnalyticGeometry, LocalPurity and PurityOfBranchLocus, as above.
- At #853: AlgebraicModuliForArithmeticGeometry, as above.

**Seeded sample.** None of the fifteen seeded targets falls in a changed passage. They were opened anyway, as a record and not as findings.
- **Stacks numbering.** A script paired 57 "number (tag)" citations in §§0.3, 0.18, 0.30, 2.3, 2.10, 2.11, 2.16, 4.2, 4.5 and 4.9 against the cached Stacks book text (book.pdf, version ed88ff78). Every number agrees with its tag. The twelve pairs the script did not match on the first pass are grouped citations that end with the section's tag:
  - 0DDK = 59.100, 03PK = 59.28, 0A3J = 59.63, 03QN = 59.55, 0A2M = 59.67, 03RH = 59.68, 06G9 = 90.2, 02JE = 110.19;
  - titled theorems: 02OC is Theorem 30.20.5 (book line 125255) and 03H0 is Theorem 37.53.4 (158496);
  - a two-lemma pair: "Lemmas 27.11.3 and 27.11.5 (01N0, 01N1)" at README 576, book lines 111393 and 111420.
- **Content checks.**
  - §0.3: Lemma 27.11.6 (01N2, book line 111431).
  - §0.28: Lemma 26.17.6 (1) (01JU, 109567–109574) and Example 26.4.3 (01HM, 108256).
  - §2.3: 03AH, 03AI and 03AJ.
  - §2.16: Lemmas 59.67.11–12 (03RF, 03RG; 232939–232943) and Theorem 59.68.5 (03RM; 233016–233018).
  - §3.8: Lemma 39.6.3 (047I, 170069–170074).
  - §4.2: 06G9 (311794–311797), 06GC (311808), 06GD (311826–311828), 06GH (311909) and 06GW (312066).
  - §4.5: 07YG.
  - §4.9: Theorem 30.20.5 (125255–125262), which has the README's hypotheses (A Noetherian, f proper, F coherent).
  - §0.24, against `bhatt-scholze-2017`:
    - Definition 3.1 is at line 438 (p. 10).
    - Lemma 3.4 is stated at line 448 and proved on p. 11 (line 467).
    - Theorem 3.7 (line 500, p. 11) is the étale-site equivalence.
    - Proposition 3.13 is at line 563 (p. 13).
  - §3.8, against `milne-av`: Proposition 2.1 at line 3702 (printed p. 91) and Proposition 2.2 at line 3737 (printed p. 92).
- §4.14 (Nitsure 2005) and §4.20 (de Jong 1996, settled as uncertified) are listed under Not verifiable.

**Adversarial table.**
- Rows marked (r46) and (r55) are carried forward from the previous reports, because their statements are untouched.
- Rows marked (r66) were computed this round, for the sampled targets and the targets the findings touch.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| (r46) §4.13 `globalDimension` | field; zero module | pd 0; pd ⊥; sup 0 | holds | cite pin (R01) |
| (r46) `isRegularLocalRing_iff_finite_globalDimension` | `k[ε]/ε²`; DVR | dim 0, spanFinrank 1, pd κ = ∞; regular, pd κ = 1 | both directions hold | cite pin |
| (r46) `auslander_buchsbaum` | `O`, `k` over DVR; `k` over field; `0` | 0+1=1; 1+0=1; 0+0=0; zero excluded | holds | cite pin |
| (r46) 00OA, 00OB bounds | `k[ε]`, DVR, field | 1 ≤ ∞; 1 ≤ 1; 0 ≤ 0 | holds | cite pin |
| (r46) `free_of_isCohenMacaulay` | `k[[x,y]]`, `R/(y)` | depth 1 ≠ 2, not free | "maximal" needed; pin carries `supportDim = ringKrullDim` | cite pin |
| (r46) `IsRegularLocalRing.isCohenMacaulay` | field, DVR, `k[ε]` | 0=0, 1=1; `k[ε]` CM, not regular | direction right | cite pin |
| (r46) 0.2, 0.10, 0.11, 0.16, 0.17, 0.23a, 1.1, 1.11–1.13, 1.15, 1.16, 1.19, 1.23, 2.4, 2.5, 2.10, 2.11, 2.14, 2.16, 2.17, 3.5, 4.3, 4.7, 4.8, 5.8 rows | as listed in r46 | values as recorded there | hold | none beyond R11 |
| (r46) `weil_bound` (headline) | `ℙ¹/𝔽_q`; `y²+y = x³+x` over `𝔽₂` | 0 ≤ 0; 5 points, \|5 − 3\| = 2 ≤ 2√2 | holds | R07 |
| (r46) `lineBundleClass_spec_equiv_pic` (headline) | `ℤ`; `ℤ[√−5]` | both trivial; both `ℤ/2` | holds; `Nonempty (≃)` says only "same cardinality" | R07 |
| (r46) `noetherianSpace_vanishing` (headline) | point; `ℙ^d_k`; empty | H¹ = 0 at d = 0; H^d(O(−d−1)) = k ≠ 0 at p = d; dim ⊥, all vanish | holds; strict `d < p` needed | none |
| (r55) §0.6 `reflexive_extension_two_planes` | `k[x,y,z,w]/(xz,xw,yz,yw)` | depth exactly 1; `j_*O_U = k[z,w] × k[x,y]`, `(1,0)` not in image | depth hypothesis necessary | none |
| (r55) §2.11 `kummer_test_field` | `K = 𝔽_p(t)`, `n = p` | étale H¹(μ_p) = 0; fppf `K^×/K^{×p} ∋ [t] ≠ 0` | fppf needed | none |
| (r55) §4.12 `generic_flatness` | `Bl₀𝔸² → 𝔸²` | flat off 0; fibre dim 1 over 0 | holds | none |
| (r55) §5.11 table (iv) | genus g, q | `Γ₀² = −2gq`, `Δ₀² = −2g`, `Γ₀·Δ₀ = N − q − 1` | `(N−q−1)² ≤ 4g²q` | none |
| (r55) §5.11 `weilBound_test_sharp` | `y²+y = x³` over `𝔽₄` | 9 points; bound 4+1+2·1·2 = 9 | sharp | none |
| (r66) R10 probe | the five declarations | `rfl` closes 5/5; 229 → 224 warnings, 0 errors | padding | delete (R10) |
| (r66) §0.3 `Proj.isPullback_baseChange` | `A = R[x]` standard grading, `R' = R/I`; `R' = 0` | `Proj R[x] = Spec R`, base change `Spec R/I = Spec R ×_R Spec R/I`; both sides `∅` | holds | remark below |
| (r66) §0.30 `ramificationIdxAt`, `test_square` | `x ↦ x²` on `𝔸¹_k` | at 0: length `k[x]_(x)/(x²)` = 2; at 1, char ≠ 2: `x²−1 = (x−1)(x+1)`, length 1; char 2: `(x−1)²`, length 2 | "2 invertible" needed and present | none |
| (r66) §0.30 `ramificationIdxAt_pos` (README only) | rank-one valuation ring with value group ℚ, `f = 𝟙` | pin's length definition: `V/𝔪` has length 1 > 0 (the older `sSup` form would give 0, since 𝔪 = 𝔪²) | holds for finite `f` without Noetherian hypothesis | none |
| (r66) §0.30 `exists_regularSystem_of_quotient.test_parabola` | `k[x,y]_(x,y)` | `y − x² ∉ 𝔪²`, quotient ≅ `k[x]_(x)` regular; `y² − x³ ∈ 𝔪²`, cusp, not regular | holds | none |
| (r66) §2.3 `test_abelian_agrees`, `test_not_group` | `ℤ/2` on `(Spec ℝ)_ét`; `S₃` | `Hom(ℤ/2, ℤ/2)` has 2 elements; `(12)(13)` is a 3-cycle, of order 3 ∤ 2 | both hold | none |
| (r66) §2.16 `tsen_theorem`, `curve_Gm_cohomology` | `k(t)`; `𝔸¹`, `ℙ¹` over `k̄` | 59.67.12 gives vanishing for q ≥ 1 ⊇ the stated q ≥ 2; `Pic 𝔸¹ = 0`; `H¹(ℙ¹, 𝔾_m) = ℤ`, `H² = 0` (03RM) | hold | remark below |
| (r66) §3.8 Checks | `𝔾_m`; elliptic `E` | `Ω¹` free on `dt/t`; `Γ(E, Ω¹)` spanned by `dx/(2y + a₁x + a₃)`, dim 1 | hold | remark below |
| (r66) §4.2 `smallExtension_test_dual`, `dualNumber_pullback` | `k[ε] → k`; `k[x]/(x³) → k`; `k[ε] ×_k k[ε]` | `𝔪·(ε) = 0`; `𝔪·(x) = (x²) ≠ 0`, two small steps with kernels `(x²)`, `(x)`; cotangent dim 2 | hold | none |
| (r66) §4.5 `obstruction_hypersurface`, `not_unobstructed_hypersurface` | `t ↦ ε`; `(x,y) ↦ (ε,ε)` lifted to `k[ε]/(ε³)` | `t² ↦ ε² ≠ 0`; `xy ↦ ε² ≠ 0` | no lift, so `O ≠ 0` and obstructed | none |
| (r66) §4.5 `test_fake_theory_rejected`, `kernel_not_residue_vector_space` | `ε ↦ 2ε` over ℚ; `ℤ/8 → ℤ/2` | `ε²` scales by 4, `v = 4v ⇒ v = 0`; `2·2 = 4 ≠ 0` | both hold | none |
| (r66) §4.9 `formal_functions_test_affine`, `stein_test_finite` | `X = Spec A`; finite `f` | `H⁰ = M`, `M^∧ = lim M/IⁿM`, `H^{>0} = 0` on both sides; `Spec_Y f_*O_X = X` | hold; README base (Noetherian) is narrower than 03H0 (locally Noetherian) | none |

**Remarks on untouched text.** These carry no R-number and request no change in this round.
- §2.16 (README 3905) cites "Theorem 59.68.5 (03RH)". 03RH is the tag of Section 59.68; the theorem's own tag is 03RM. Section 59.68 fixes an algebraically closed field, so it does not contain the clause about a curve over a general `k` with its Galois action.
- §3.8 (README 5011) cites "Propositions 2.1, 2.2, p. 91". Proposition 2.2 is on printed p. 92 (`milne-av` line 3737) and assumes genus > 0; the genus-zero case is trivial.
- §0.3: `Proj.isPullback_baseChange` asserts that some square is a pullback, not that the canonical base-change maps form one.
- Suggested.lean 1772 and 1783 declare `_root_.IsAzumaya.*`, in Mathlib's namespace.
- The module docstring names no headline as not statable. Of the end theorems at README 16–23, Keel–Mori, coherent Grothendieck duality, the Picard torsors, Schlessinger's theorem, GRR and the Hodge index theorem have no Lean statement. The docstring also lacks the "<title>: target signatures" form.
- The remarks of the previous report stand: 0E2S/0E2T at line 4283; §0.6's normality hypothesis; `k/℘(k)` at §2.11; Milne AG11 missing from the manifest; §1.23's coarse clause; §1.15's Poonen 6.5.10(i).

## Not verifiable

- de Jong 1996 (§4.20) and Hartshorne 1977 are settled as uncertified and were cited by locator only.
- Nitsure 2005 (§4.14: Theorem 2.3 p. 11, Theorems 3.3–3.7 pp. 15–17, 4.3 p. 19, 5.1–5.3 p. 24) is not in the roadmap's manifest and was not opened. Its Checks were computed instead: `Hilb²(ℙ¹) = Sym²ℙ¹ = ℙ²`, `Hilb¹(X) = X`, and constant-rank Quot of `O^n` is the Grassmannian.
- These were not opened, and none is in the manifest: Fulton 1998, Rydh's Keel–Mori manuscript, Conrad 2005, Abramovich–Olsson–Vistoli 2008, Gabber–Kelly, Voevodsky arXiv:0805.4578, and Grothendieck, *Le groupe de Brauer III* (R11).
- The `stacks-project` manifest entry holds only the site's index page. The Stacks locators were read from the cached book.pdf text, which is not a key of this roadmap's manifest.

## Source issues

- none
