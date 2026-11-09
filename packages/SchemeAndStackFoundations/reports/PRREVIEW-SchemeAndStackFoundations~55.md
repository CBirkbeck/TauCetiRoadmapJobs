# Review of SchemeAndStackFoundations (pull request #1807 at 64a16e1)

**Verdict:** needs changes

This is an incremental re-review. Nothing in the folder has changed since e473a36:
- `git diff e473a36 64a16e1` touches only `TauCetiRoadmap/ComplexKahlerGeometry/` and `TauCetiRoadmap/TopologicalKTheory/README.md`.
- `README.md` and `Suggested.lean` are byte-identical to the previous head.
- The pins are unchanged: Mathlib 1b1ccf4b and Tau Ceti 2fd255d9.
- Main has moved to 8d9e0a0 but has not touched this folder or `lake-manifest.json`. On EnhancedDerivedSheaves and AbhyankarLemma, main changed only `PROGRESS.md` and `STATUS.md`.

None of the thirteen previous findings is repaired, and each one is restated below with the same number. Two corrections to the previous report:
- **R01:** the witness list is longer than the previous report gave. The first target of §4.13 and the 0AFS localization are also at the pins.
- **R13:** the previous witness misnamed line 88 of EnhancedDerivedSheaves' `Suggested.lean`, and the half about AbhyankarLemma is withdrawn. Details are under R13.

The gate still fails on the same seven rules with the same counts: tex 65, sorry-data 25, sorry-examples 101, imports 1, statement-hygiene 11, dropped 39, readme-ids-missing 15. The build passes, and the dependency check reports no problem.

## R01 (P2) — §4.13's regular-local-ring paragraph re-plans what the pinned libraries already prove

**Location.** README.md lines 5657–5718: "*Regular local rings: Serre's theorem and localization.* … Prove *IsRegularLocalRing.isCohenMacaulay* …". Also the `*Needs:*` line at 5746–5753, the Checks at 5762–5766 and the consumer lines 7481–7484. Line 5661 adds a build-order inversion: it calls this Layer-4 target "the local statement behind §0.17 `Ring.IsCohenMacaulay.of_isRegularRing`", a Layer-0 item.

**Claim.** About sixteen targets are owned here, from `IsRegularLocalRing.isCohenMacaulay` through `auslander_buchsbaum`, `isRegularLocalRing_tfae`, 0AFS and `isRegularRing_of_isRegularLocalRing`, together with a Koszul route for 00OA.

**Witness at the pins.**
- Tau Ceti `RingTheory/RegularLocalRing/CohenMacaulay.lean` 125: `TauCeti.IsRegularLocalRing.isCohenMacaulay` (00NQ).
- Tau Ceti `RingTheory/RegularLocalRing/Free.lean` 93: `free_of_isCohenMacaulay` (00NT).
- Tau Ceti `RingTheory/GlobalDimension.lean` 70 and 90: `globalDimension` and `globalDimension_le_iff_hasProjectiveDimensionLE`.
- Tau Ceti `RingTheory/RegularLocalRing/ProjectiveDimension.lean` 222, 392 and 441: `globalDimension_eq_ringKrullDim`, `isRegularLocalRing_tfae` and the instance `isRegularRing_of_isRegularLocalRing`.
- Tau Ceti `RingTheory/Depth/AuslanderBuchsbaum.lean` 148: `ModuleCat.projectiveDimension_add_depth_eq_depth`.
- 0AFS is Mathlib's field `IsRegularRing.isRegularLocalRing_localization` (`RingTheory/RegularLocalRing/Defs.lean` 94), applied through that instance.

The open roadmap PurityForFlatCohomology (README lines 442–458) independently cites these same facts as pinned Tau Ceti.

**Repair.**
1. Delete the paragraph's targets and the Koszul route.
2. Under `From Tau Ceti` and `From Mathlib`, cite the declarations above by name and file, with their hypotheses (`[Small.{v} R]`, nonzero `M`, `supportDim = ringKrullDim`).
3. Restate the three Checks as Checks of the cited declarations, or delete them.
4. Make lines 7481–7484 say that the consumers use these declarations through this roadmap's contract.

## R02 (P2) — Suggested.lean and the README API redeclare objects the pinned Tau Ceti provides

**Location.** Suggested.lean lines 16–17 ("Key definitions and headline theorems of the roadmap on Mathlib's schemes and Tau Ceti's carriers"). The redeclared carriers include:
- `IsNormalScheme` (935)
- `IsAlgebraicSpace` (1056)
- `IsThickening` (1978)
- `IsModification` (2152)
- `Ring.IsNagata` (251)
- `IsGRing` (291)

The README's §§0.10, 0.17, 0.30 and 4.13 do the same.

**Witness, re-opened at Tau Ceti 2fd255d9.**
- `class IsNormalScheme`: `AlgebraicGeometry/Scheme/Normal.lean` 84.
- `class IsThickening`: `Morphisms/Thickening.lean` 69.
- `class IsModification`: `Morphisms/Modification/Basic.lean` 53.
- `structure IsAlgebraicSpace`: `AlgebraicSpace/Basic.lean` 195.
- `structure RatEquivFamily`: `Chow/Basic.lean` 112.
- `class IsNagata`: `RingTheory/Nagata.lean` 65.
- `class IsGRing`: `RegularLocalRing/GRing.lean` 57.
- `def IsPseudoCoherentOver`: `Algebra/Module/PseudoCoherent/Basic.lean` 89.

**Repair.**
1. Delete each redeclared definition and its API from Suggested.lean, and state the headlines on the pinned carriers.
2. List each one under `From Tau Ceti` with its name and file.
3. Keep in the layers only what is absent at the pin.

## R03 (P2) — AbundanceStatement is cited as a supplier

**Location.** README.md lines 440–443, for example "| AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.9's characteristic-zero divisor/curve degree". The same citation recurs at 767, 3448, 4727, 5652, 5731, 5737, 6623 and 7207.

**Witness.** Main at 8d9e0a0 has no AbundanceStatement folder, and none under `Completed/`. AbundanceStatement is on the brief's list of roadmaps never to cite as suppliers. The gate's `dropped` rule flags all 39 occurrences.

**Repair.**
1. Delete the four table rows and the nine supplier sentences.
2. State the four characteristic-zero facts that §5.9–§5.10 need as targets here, each with hypotheses and a locator: Hartshorne or Fulton, and Kleiman for Nakai–Moishezon.

## R04 (P2) — sorry'd data in Suggested.lean

**Location.**
- `def` and `instance` bodies at Suggested.lean lines 550 (`def absoluteFrobenius (X : Scheme.{u}) (hX : SchemeCharP X p) : X ⟶ X :=`), 653, 710, 729, 744, 1115, 1539, 1541, 1552, 1568, 1582, 1649, 2053, 2073, 2112, 2164, 2442, 2530, 2532 and 2534.
- `sorry` structure fields at lines 47, 78, 84, 87, 107 and 120.

**Witness.** The gate's `sorry-data` rule fails 25 times. Theorems are stated on these definitions, for example on `derivedHomPresheaf`, `Scheme.formalCompletion` and `RatEquiv`.

**Repair.** Give each definition a real body on a pinned carrier, or delete it and keep its README target with the intended signature. Every theorem that mentions a deleted definition is either deleted with it or restated on the pinned carrier.

## R05 (P3) — admitted examples

**Location.** Suggested.lean has 101 declarations of the form `example … := by sorry`; the first is at line 81. README line 284 promises "some Checks as `example`s".

**Witness.** The gate's `sorry-examples` rule fails 101 times.

**Repair.** Delete every admitted example, and delete the promise at README line 284. The README's Checks keep the statements.

## R06 (P3) — another roadmap's module is imported

**Location.** Suggested.lean line 2, `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.

**Witness.** The gate's `imports` rule fails on this line.

**Repair.** Drop the import. State the Layer-3 norm and degree statements on Tau Ceti's `LineBundleClass` and `Scheme.Modules`, or name them in the module docstring as not statable.

## R07 (P3) — statement hygiene (11 gate hits)

**Location.**
- Lines 219, 1378, 1387 and 1960 conclude `Nonempty (… ≃ …)`.
- Lines 646, 1535, 1898, 2297, 2480 and 2481 put `letI` in a signature.
- Line 2598, `weil_bound`, has `[Fintype k]` beside `[Field k]`.

**Repair.**
- State the canonical map and `IsIso` of it, and keep `Nonempty` only in a `nonempty_*` corollary.
- Replace each `letI` with an instance binder.
- In `weil_bound`, use `[Finite k]` with `Nat.card k`.

## R08 (P3) — TeX-only syntax in §0.29 (65 gate hits)

**Location.** README.md lines 1788, 1862, 1874–1877, 1883, 1887, 1890, 1902, 1916, 1929, 1933 and 1942–1943, for example "= X^{(p/S)} = X ×_{S,F_S} S, with projections π₁ to X and π₂ to S".

**Repair.** Write the subscripts and superscripts in Unicode, or put each formula in a code span.

## R09 (P3) — backticked own names that Suggested.lean does not declare (15 gate hits)

**Location.** README §0.30, which names:
- `IsNormalScheme.isIntegrallyClosed_of_isAffineOpen`, `IsNormalScheme.of_isOpenImmersion`, `isNormalScheme_Spec_iff` and `isNormalScheme_iff_forall_affineOpens`;
- `IsNormalScheme.of_isRegular`;
- `codimensionOneMap_comp`, `ramificationIdxAt_pos` and eight more.

**Witness.** The first four are at Tau Ceti `AlgebraicGeometry/Scheme/Normal.lean` lines 195, 100, 181 and 153. `IsRegular.isNormal` is an instance at `Scheme/Regular/Scheme.lean` 175.

**Repair.**
- Cite the four as `From Tau Ceti`.
- `IsNormalScheme.of_isRegular` cites `IsRegular.isNormal`.
- State the rest in prose.

## R10 (P3) — padding: five declarations close by `rfl`

**Location.** Suggested.lean lines:
- 393, `universalHomeomorphismEtaleEquivalence_functor`
- 569, `absoluteFrobenius_base`
- 691, `iteratedSchemeFrobenius_zero`
- 695, `iteratedSchemeFrobenius_succ`
- 791, `qPowerFrobenius_eq_iterated`

**Witness.** The one-tactic probe was re-run this round on a scratch copy, with `first | rfl | infer_instance | decide | (simp; done)`. `rfl` closes all five, and every other alternative is reported as never executed. The copy elaborates with 224 `sorry` warnings instead of 229. Each declaration restates a defining equation.

**Repair.** Delete the five from Suggested.lean. The README keeps them as API bullets.

## R11 (P3) — locators

- **Lines 3641–3643** cite "(Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A)" for `smoothGroup_fppf_etale_comparison`. Repair: cite Grothendieck, *Le groupe de Brauer III*, Théorème 11.7, and record it in `sources.toml`.
- **Line 887** cites both unibranch statements to "Stacks, Lemma 15.108.5". Repair: cite 0BQ0 (Lemma 15.108.3) for the henselization statement.
- **Line 1531** gives "Theorems 59.45.1–59.45.2 (04DZ)", but Theorem 59.45.1 is 0BTY. Repair: give both tags.

## R12 (P3) — conflicting open heads with no stated order

**Location.** The pull request's merge-order paragraph: "No open pull request must merge before this one."

**Witness.** The overlap report lists two pull requests by another author that revise this folder and conflict with this one in `TauCetiRoadmap/SchemeAndStackFoundations/README.md`:
- #1276, head dc479b5;
- #1656, head 1bfff38.

Neither is named. #1854's copy of README.md and Suggested.lean is identical to this head, apart from the tool's header line. #1808 is stacked after this pull request and is named in the description.

**Repair.** Name #1276 and #1656 in the merge-order paragraph and say which pull request is rebased on which.

## R13 (P3) — the EnhancedDerivedSheaves consumer sentence is not supported

**Location.** README.md lines 5713–5715: "EnhancedDerivedSheaves E1.6 consumes *isRegularLocalRing_of_projectiveDimension_residueField* and *globalDimension_le_iff_hasProjectiveDimensionLE*".

**Witness, on main at 8d9e0a0.** EnhancedDerivedSheaves owns the first name itself: README line 693, `Suggested.lean` line 94. Neither of its files mentions `globalDimension_le_iff_hasProjectiveDimensionLE`. From §4.13 it takes only `IsRegular.isCohenMacaulay` (README line 716).

**Corrections to the previous report.** Line 88 of EnhancedDerivedSheaves' `Suggested.lean` is `isRegularRing_projectiveDimension_le`, its 00OE bound; it is not the global-dimension comparison. The AbhyankarLemma half of the previous finding is withdrawn. At this head, PurityOfBranchLocus §0.3 (lines 139–151) forwards 0AFS from §4.13 and names AbhyankarLemma §3.3 as its consumer, so line 7482 is supported.

**Repair.** Replace the EnhancedDerivedSheaves clause with what that roadmap actually consumes (`IsRegular.isCohenMacaulay`), or delete it. Together with R01, point it at the Tau Ceti declarations.

## Previous findings

- R01 — not repaired: line 5658, "Prove *IsRegularLocalRing.isCohenMacaulay*: a regular local ring of dimension `d` has depth `d`, by induction on a regular system of parameters". The 00OA route at 5696–5711 is unchanged.
- R02 — not repaired: Suggested.lean 16–17, "Key definitions and headline theorems of the roadmap on Mathlib's schemes and Tau Ceti's carriers"; `class IsNormalScheme` is still at line 935.
- R03 — not repaired: line 440, "| AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) |".
- R04 — not repaired: line 550, `def absoluteFrobenius (X : Scheme.{u}) (hX : SchemeCharP X p) : X ⟶ X :=`; 25 gate hits.
- R05 — not repaired: line 81, `example (A : Type u) [CommRing A] (n : ℕ) :` … `by sorry`; 101 gate hits.
- R06 — not repaired: line 2, `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.
- R07 — not repaired: line 2598, `theorem weil_bound (k : Type u) [Field k] [Fintype k]`; 11 gate hits.
- R08 — not repaired: line 1874, "= X^{(p/S)} = X ×_{S,F_S} S"; 65 gate hits.
- R09 — not repaired: the same 15 names, `IsNormalScheme.of_isOpenImmersion`, `isNormalScheme_Spec_iff`, …, are undeclared.
- R10 — not repaired: line 569, `theorem absoluteFrobenius_base … := sorry`, and the other four; `rfl` closes all five.
- R11 — not repaired: lines 3641–3643, "Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A"; lines 887 and 1531 are unchanged.
- R12 — not repaired: "No open pull request must merge before this one."; #1276 and #1656 are still unnamed.
- R13 — not repaired: lines 5713–5715, "EnhancedDerivedSheaves E1.6 consumes … *globalDimension_le_iff_hasProjectiveDimensionLE*". Its AbhyankarLemma half is withdrawn.

## Verified sound

**Scope.**
- `git diff --stat e473a36 HEAD -- TauCetiRoadmap/SchemeAndStackFoundations` is empty.
- Against main, the folder's change is README.md only, +84/−9.
- The brief's exclusion diff is empty, so nothing outside the pull request's own folders changes.
- `lake-manifest.json` pins Mathlib 1b1ccf4b and Tau Ceti 2fd255d9, and `.lake/packages` are checked out at those commits.

**Gate.**
- The re-run on this head reports the worker's seven failing rules with identical counts.
- Its `outside-folder=21` is exactly the 21 files the pull request changes in its 13 other folders.

**Elaboration.**
- `lake env lean` on Suggested.lean exits 0 in 62 s, with 229 `declaration uses sorry` warnings and no other diagnostic.
- A `#check @name` file of 225 declarations elaborates with exit 0 and no errors.
- The elaborated types of `weil_bound`, `lineBundleClass_spec_equiv_pic` and `SiteCohomology.noetherianSpace_vanishing` match their README statements. The binders of `weil_bound` are in scope: `[IsProper]`, `[Smooth]`, `[GeometricallyIntegral]`, `topologicalKrullDim X = 1` and finiteness of `H¹(O_X)`.

**Dependency check.** Output: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The `roadmaps resolve` leads list no cross-roadmap citation that is found nowhere. Its 288 Lean-name leads are this roadmap's own names (R09 covers the undeclared ones).

**Overlaps.** The overlap report finds:
- no id cited here that an open pull request drops;
- no id that only an open revision defines;
- no id this pull request drops that others cite.

The closest roadmaps in vocabulary (#1840, #1796, #1754, #1743) consume this roadmap by section; none states one of its objects as its own.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `RegularLocalRing/CohenMacaulay.lean` 125
  - `RegularLocalRing/Free.lean` 73 and 93
  - `GlobalDimension.lean` 70 and 90
  - `RegularLocalRing/ProjectiveDimension.lean` 195, 222, 239, 392 and 441
  - `Depth/AuslanderBuchsbaum.lean` 148
  - `Scheme/Normal.lean` 84, 100, 153, 181 and 195
  - `Scheme/Regular/Scheme.lean` 175
  - the eight carrier files listed under R02
- Mathlib: `RingTheory/RegularLocalRing/Defs.lean` 93–97.

**Cross-roadmap citations resolved.**
- On main at 8d9e0a0:
  - EnhancedDerivedSheaves README 693 and 716, `Suggested.lean` 84–98;
  - AbhyankarLemma README 74–84.
- At this head: PurityOfBranchLocus README 139–151 and 248–256.
- At #1840: PurityForFlatCohomology README 126–134 and 442–461.

**Seeded sample.** None of the fifteen seeded targets falls in a changed passage. They were opened anyway, so the checks below are a record, not new findings.
- **Stacks numbering.** Every lemma, definition and proposition number cited in §§0.6, 0.7, 0.23, 0.27, 1.13, 2.11, 2.13, 2.14, 2.17, 2.20, 4.5, 4.12, 5.2, 5.3 and 5.11 agrees with its tag in the cached Stacks book text, apart from one remark below. Grouped citations end with the section's tag, for example "Lemmas 59.55.3–59.55.4 (03QN)", where 03QN is section 59.55.
- **Content checks.**
  - §0.6 against 0AVU, 0AY0, 0AY2, 0AY3, 0AY4, 0EBH, 0EBI and 0EBJ (book lines 127311–127400).
  - §2.11 against 03P8 (229140), 040N (229322), 040O (229344), 040Q (229385), 03PL (229288) and 0A3K (232352).
  - §4.12 against 052A (117622) and 0201 (124986).
  - §5.11 against Milne's AG chapter 11 (cached AG11.pdf text): Definition 11.12 (line 326, p. 9), Theorem 11.53, Corollary 11.54 and Example 11.55 (1461–1485, p. 37), and the Frobenius application (1488–1495, p. 38). The README's swap of F₁ and F₂ against Milne's `C₁ × pt` and `pt × C₂` is right: Milne gives `d₂ = 1` and `d₁ = deg f` for a graph.

**Adversarial table.** Rows marked (r46) carry forward from the previous report unchanged, because their statements are untouched. Rows marked (r55) were computed this round.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| (r46) §4.13 `globalDimension` | field; zero module | pd 0; pd ⊥; sup 0 | holds | cite pin (R01) |
| (r46) `isRegularLocalRing_iff_finite_globalDimension` | `k[ε]/ε²`; DVR | dim 0, spanFinrank 1, pd κ = ∞; regular, pd κ = 1 | both directions hold | cite pin |
| (r46) `auslander_buchsbaum` | `O`, `k` over DVR; `k` over field; `0` | 0+1=1; 1+0=1; 0+0=0; zero excluded | holds | cite pin |
| (r46) 00OA, 00OB bounds | `k[ε]`, DVR, field | 1 ≤ ∞; 1 ≤ 1; 0 ≤ 0 | holds | cite pin |
| (r46) `exists_resolution_maximalCohenMacaulay` | `k[[x,y]]`, `M = k` | `d=2, e=0`, `K = R` | holds | cite pin |
| (r46) `free_of_quotSMulTop_free` | DVR, `M = k`, `x = π` | regularity fails, `k/πk` free, `k` not free | hypothesis needed | cite Mathlib |
| (r46) `free_of_isCohenMacaulay` | `k[[x,y]]`, `R/(y)` | depth 1 ≠ 2, not free | "maximal" needed; pin carries `supportDim = ringKrullDim` | cite pin |
| (r46) `IsRegularLocalRing.isCohenMacaulay` | field, DVR, `k[ε]` | 0=0, 1=1; `k[ε]` CM, not regular | direction right | cite pin |
| (r46) 0.2, 0.10, 0.11, 0.16, 0.17, 0.23a, 1.1, 1.11, 1.12, 1.13, 1.15, 1.16, 1.19, 1.23, 2.4, 2.5, 2.10, 2.11, 2.14, 2.16, 2.17, 3.5, 4.3, 4.7, 4.8, 5.8 rows | as listed in the previous report | values as recorded there | hold | none beyond R11 |
| (r46) `weil_bound` (headline) | `ℙ¹/𝔽_q`; `y²+y = x³+x` over `𝔽₂` | 0 ≤ 0; 5 points, \|5 − 3\| = 2 ≤ 2√2 | holds | R07 |
| (r46) `lineBundleClass_spec_equiv_pic` (headline) | `ℤ`; `ℤ[√−5]` | both trivial; both `ℤ/2` | holds; `Nonempty (≃)` says only "same cardinality" | R07 |
| (r46) `noetherianSpace_vanishing` (headline) | point; `ℙ^d_k`; empty | H¹ = 0 at d = 0; H^d(O(−d−1)) = k ≠ 0 at p = d; dim ⊥, all vanish | holds; strict `d < p` needed | none |
| (r55) R10 probe | the five declarations | `rfl` closes 5/5; 229 → 224 sorry warnings | padding | delete (R10) |
| (r55) §0.6 `reflexive_extension_torsion_rejected` | `k[t] ⊕ k[t]/(t)` on `𝔸¹` | `Hom(k[t]/(t), k[t]) = 0`, so `F^∨∨ = k[t]`; `j_*(F\|D(t)) = k[t,t⁻¹]` | the two differ; torsion and the codimension-one origin both break extension | none |
| (r55) §0.6 `test_maximal_ideal` | `I = (x,y) ⊂ k[x,y]` | depth 2, so `Hom(I, A) = A`, `I^∨∨ = A ≠ I` | torsion free, not reflexive | none |
| (r55) §0.6 `reflexive_extension_two_planes` | `k[x,y,z,w]/(xz,xw,yz,yw)` | reduced: depth ≥ 1; punctured spectrum disconnected: depth ≤ 1; `j_*O_U = k[z,w] × k[x,y]`, and `(1,0)` is not in the image of `A` | depth hypothesis necessary | none |
| (r55) §0.6 `reflexive_extension_reducible` | `k[x,y,z,w]/(xw)` | hypersurface, CM of dim 3, depth 3 ≥ 2; `j_*O_U = O_X` | holds without integrality | none |
| (r55) §2.11 `kummer_test_field` | `K = 𝔽_p(t)`, `n = p` | étale `μ_p` trivial on reduced schemes: H¹_ét = 0; fppf `K^×/K^{×p} ∋ [t] ≠ 0` | fppf needed, as stated (040N, 040O) | none |
| (r55) §2.11 Artin–Schreier | `𝔽_p`; `𝔽̄_p`; affine, dim-d qcqs | `℘(𝔽_p) = 0`, H¹ = 𝔽_p = Hom(Ẑ, ℤ/p); `℘` onto, H¹ = 0; vanishing for q ≥ 2 and q ≥ d + 2 | matches 0A3K (1)–(2) | remark on notation |
| (r55) §4.12 `generic_flatness` | `Bl₀𝔸² → 𝔸²` | isomorphism over `𝔸² ∖ 0`, flat; fibre dimension 1 over 0, not flat there | dense open exists; integral `S` as in 052A | none |
| (r55) §4.12 `chow_lemma` "projective" | 0200 with 0201(1) | π is H-projective because `X′ → ℙⁿ_X` is a closed immersion | supported | none |
| (r55) §5.11 table (iv) | general `g`, `q` | `Γ₀² = q(2−2g) − 2q − 2q + 2q = −2gq`; `Δ₀² = (2−2g) − 2 − 2 + 2 = −2g`; `Γ₀·Δ₀ = N − 1 − 2q + q − 1 + 1 = N − q − 1` | Cauchy–Schwarz gives `(N−q−1)² ≤ 4g²q`; agrees with Milne def(Γ_π) = 2gq, def(Δ) = 2g | none |
| (r55) §5.11 (ii) adjunction | graph of `F`, degree `q` | `K_S·Γ = (1+q)(2g−2)`, so `Γ² = −q(2g−2)` | matches Milne (11) | none |
| (r55) §5.11 `weilBound_test_sharp` | `y² + y = x³` over `𝔽₄` (q = 2) | g = 1; affine points 2 + 3·2 = 8, plus ∞ gives 9; bound 4 + 1 + 2·1·2 = 9 | sharp; in general `q³ + 1 = q² + 1 + q(q−1)·q` | none |
| (r55) §5.11 `weilBound_test_genus_zero` | `ℙ¹/𝔽_q` | `(N − q − 1)² ≤ 0`, so N = q + 1 | holds | none |

**Remarks on untouched text.** These carry no R-number and request no change in this round.
- §2.20 (README line 4283) cites "Definition 48.28.1 (0E2S)". 0E2S is the tag of Section 48.28 (Stacks book line 197826); the definition is 0E2T (line 197836).
- §0.6 assumes `X` normal integral for `IsReflexive.dual` and the hull. Lemma 31.13.8 (0AY4), applied with `G = O_X`, needs only integral and locally Noetherian.
- §2.11's `artinSchreier_test_field` writes "`k/(x^p − x)k`". The group meant is `k/℘(k)`, with `℘(x) = x^p − x`, the image of the Artin–Schreier map, not a multiple of an element.
- §5.11's source, Milne 2024 (AG chapter 11), is listed in References but is not a key of the roadmap's manifest.
- The three remarks of the previous report stand:
  - §1.23 cites Stacks Lemmas 106.12.2–3 for the coarse clause.
  - §1.15 cites Poonen Theorem 6.5.10(i), which is the scheme case.
  - The module docstring does not have the "<title>: target signatures" form.

**Ownership against open pull requests** was re-checked for the regular-local-ring chain (R01, R13) and for the five roadmaps closest in vocabulary. The rest of main's text was not re-checked.

## Not verifiable

- de Jong 1996 and Hartshorne 1977 are settled as uncertified and were cited by locator only.
- These were not opened, and none is in the roadmap's manifest: Fulton 1998, Rydh's Keel–Mori manuscript, Conrad 2005, Abramovich–Olsson–Vistoli 2008, Gabber–Kelly, Voevodsky arXiv:0805.4578, and Grothendieck, *Le groupe de Brauer III* (R11).
- The `stacks-project` manifest entry holds only the site's index page. The Stacks locators were read from the cached Stacks book text, which is not a key of this roadmap's manifest.

## Source issues

- none
