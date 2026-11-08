# Review of SchemeAndStackFoundations (pull request #1807 at e473a36)

**Verdict:** needs changes

This is an incremental re-review. The folder has 0 changed lines since 70140e6: `git diff 70140e6 HEAD` touches only `TauCetiRoadmap/CharacteristicClasses/` and `TauCetiRoadmap/ClassifyingSpaces/`. `Suggested.lean` and `README.md` are byte-identical to the previous head, and so are the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9). Main has not touched the folder or `lake-manifest.json` since the merge base. As a result, none of the thirteen previous findings is repaired, and each one is restated below with the same number.

One correction to the previous report: R01 and R11 said that the Mathlib name `projective_iff_hasProjectiveDimensionLE_zero` (README line 5700) does not exist at the pin. That was wrong. It is declared at `Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean` line 158, next to `projective_iff_hasProjectiveDimensionLT_one` at line 151. That sub-claim is withdrawn; everything else in R01 and R11 stands.

The gate still fails on the same seven rules (tex 65, sorry-data 25, sorry-examples 101, imports 1, statement-hygiene 11, dropped 39, readme-ids-missing 15). The build passes, and the dependency check reports no problem.

## R01 (P2) — §4.13's regular-local-ring paragraph re-plans what the pinned Tau Ceti already proves

Location: README.md lines 5657–5718, starting "*Regular local rings: Serre's theorem and localization.* Let `(R, 𝔪, κ)` be a Noetherian local ring. Prove *IsRegularLocalRing.isCohenMacaulay* …", together with the `*Needs:*` line 5746–5753 and Downstream lines 7481–7484.

Claim: the paragraph states sixteen targets as owned here, from `IsRegularLocalRing.isCohenMacaulay` and `globalDimension` through `auslander_buchsbaum`, `isRegularLocalRing_tfae` and `isRegularRing_of_isRegularLocalRing`, plus a Koszul proof route for 00OA.

Witness: the pinned Tau Ceti already has them.
- `RingTheory/GlobalDimension.lean`: `globalDimension` (70), `globalDimension_le_iff_hasProjectiveDimensionLE` (90).
- `RingTheory/RegularLocalRing/ProjectiveDimension.lean`: `globalDimension_eq_ringKrullDim` (222), `isRegularLocalRing_tfae` (392), instance `isRegularRing_of_isRegularLocalRing` (441).
- `RingTheory/Depth/AuslanderBuchsbaum.lean`: `ModuleCat.projectiveDimension_add_depth_eq_depth` (148).

The full list, with file and line, is in the previous report's R01 and is unchanged at this pin. The build-order inversion also remains: line 5662 calls this Layer-4 target "the local statement behind §0.17 `Ring.IsCohenMacaulay.of_isRegularRing`", which is a Layer-0 item.

Repair:
- Delete the paragraph's targets and the Koszul route.
- Under `## Exact supplier contracts`, `From Tau Ceti`, cite the pinned declarations by name and file, with their hypotheses (`[Small.{v} R]`, `[Nontrivial M]`, `supportDim = ringKrullDim`).
- Turn the three Checks at lines 5762–5766 into Checks of the cited declarations, or delete them.
- Make lines 7481–7484 say that the consumers use these Tau Ceti declarations through this roadmap's contract.

## R02 (P2) — Suggested.lean and the README API redeclare objects the pinned Tau Ceti provides

Location: Suggested.lean lines 57–64, 177–218, 244–317, 550–797, 935–1016, 1035–1070, 1978–1983, 2152–2170 and 2428–2467; README §0.10, §0.17 (1138–1250), §0.30 and §4.13.

Claim: Suggested.lean lines 16–17 say these are the roadmap's own key definitions "on Mathlib's schemes and Tau Ceti's carriers".

Witness, at Tau Ceti 2fd255d9:
- `class IsNormalScheme` is at `AlgebraicGeometry/Scheme/Normal.lean` line 84, and Suggested.lean redeclares it.
- `IsRegular`, `IsThickening`, `IsModification`, `IsAlgebraicSpace`, `RatEquivFamily`, `Ring.IsNagata`, `IsGRing`, the henselization of a pair, iterated relative Frobenius and `IsPseudoCoherentOver` are all at the pin; the previous report's R02 gives every file and line.
- Tau Ceti's depth and Cohen–Macaulay API (`RingTheory/CohenMacaulay/Basic.lean` 67) covers what README §0.17 defines as its own.

Repair:
- Delete each redeclared definition and its API from Suggested.lean, and state the headlines on the pinned carriers.
- Move each one to `From Tau Ceti` in the README, with its exact name and file.
- Keep in the layers only what is absent at the pin.

## R03 (P2) — AbundanceStatement is cited as a supplier but is neither on main nor citable

Location: README.md lines 440–443, for example "| AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.9's characteristic-zero divisor/curve degree …". The same citation recurs at lines 767, 3448, 4727, 5652, 5731, 5737, 6623 and 7207.

Witness: main (54fc140) has neither `TauCetiRoadmap/AbundanceStatement` nor `Completed/AbundanceStatement`. AbundanceStatement is on the brief's list of roadmaps never to cite as suppliers, and the gate's `dropped` rule flags all 39 occurrences.

Repair:
- Delete the four table rows and the nine "supplied by" sentences.
- State the four characteristic-zero facts that §5.9–§5.10 need as targets here, each with its hypotheses and a locator (Hartshorne or Fulton, and Kleiman for Nakai–Moishezon), or cite a roadmap on main that owns them.

## R04 (P2) — sorry'd data in Suggested.lean

Location: Suggested.lean lines 550 (`def absoluteFrobenius … : X ⟶ X :=`), 653, 710, 729, 744, 1115, 1539, 1541, 1552, 1568, 1582, 1649, 2053, 2073, 2112, 2164, 2442, 2530, 2532 and 2534, plus the `sorry` structure fields at lines 47, 78, 84, 87, 107 and 120.

Witness: the gate rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`" fails 25 times. Theorems later in the file are stated on these definitions, for example on `derivedHomPresheaf`, `Scheme.formalCompletion` and `RatEquiv`.

Repair: give each definition a real body on a pinned carrier, or delete it and state its README target with the intended signature. Any theorem that mentions a deleted definition goes with it or is restated on the pinned carrier.

## R05 (P3) — admitted examples

Location: Suggested.lean has 101 `example … := by sorry` declarations; the first are at lines 81, 83, 85, 88, 89 and 91. README line 284 promises "some Checks as `example`s".

Witness: the gate rule "every `example` is proved" fails 101 times.

Repair: delete every admitted example, and the promise at README line 284. The README's `**Checks.**` bullets keep the statements.

## R06 (P3) — a second roadmap's module is imported

Location: Suggested.lean line 2, `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.

Witness: the gate's `imports` rule fails on this line, because only `Mathlib` and `TauCeti.*` imports are allowed.

Repair: drop the import. Either state the Layer-3 norm and degree statements on Tau Ceti's `LineBundleClass` and `Scheme.Modules` carriers, or name them in the module docstring as not statable.

## R07 (P3) — statement hygiene (11 gate hits)

Location:
- Suggested.lean lines 219, 1378, 1387 and 1960 conclude `Nonempty (… ≃ …)`.
- Lines 646, 1535, 1898, 2297 and 2480–2481 put `letI` in a signature.
- Line 2598 has `[Fintype k]` beside `[Field k]` in `weil_bound`.

Repair, as the gate names it:
- State the canonical map and `IsIso` of it, and keep `Nonempty` only in a `nonempty_*` corollary.
- Replace each `letI` with an instance binder.
- Use `[Finite k]` with `Nat.card k` in `weil_bound`.

## R08 (P3) — TeX-only syntax in §0.29 (65 gate hits)

Location: README.md lines 1788, 1862, 1874–1877, 1883, 1887, 1890, 1902, 1916, 1929, 1933 and 1942–1943, for example "`= X^{(p/S)} = X ×_{S,F_S} S`, with projections π₁ to X and π₂ to S".

Repair: write the subscripts and superscripts in Unicode, or put each formula in a code span.

## R09 (P3) — backticked own names that Suggested.lean does not declare (15 gate hits)

Location: the README names `IsNormalScheme.isIntegrallyClosed_of_isAffineOpen`, `IsNormalScheme.of_isOpenImmersion`, `isNormalScheme_Spec_iff`, `isNormalScheme_iff_forall_affineOpens`, `IsNormalScheme.of_isRegular`, `codimensionOneMap_comp`, `ramificationIdxAt_pos` and eight more (§0.30).

Repair:
- The four names that exist at the Tau Ceti pin become `From Tau Ceti` citations.
- `IsNormalScheme.of_isRegular` cites the pinned instance `IsRegular.isNormal`.
- The rest are stated in prose.

## R10 (P3) — padding: five declarations close by one tactic

Location: Suggested.lean lines 393 (`universalHomeomorphismEtaleEquivalence_functor`), 569 (`absoluteFrobenius_base`), 691 (`iteratedSchemeFrobenius_zero`), 695 (`iteratedSchemeFrobenius_succ`) and 791 (`qPowerFrobenius_eq_iterated`).

Witness: these lines are unchanged since the previous one-tactic probe (`first | rfl | infer_instance | decide | (simp; done)`), which closed exactly these five. Each restates a defining equation.

Repair: delete them from Suggested.lean; the README keeps them as API bullets.

## R11 (P3) — locators

- README.md 3641–3643 cites "(Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A)" for `smoothGroup_fppf_etale_comparison`. Repair: cite Grothendieck, *Le groupe de Brauer III*, Théorème 11.7, and record it in `sources.toml`.
- README.md 885–887 cites both unibranch statements to "Stacks, Lemma 15.108.5". Repair: cite 0BQ0 (Lemma 15.108.3) for the henselization statement.
- README.md 1531 gives "Theorems 59.45.1–59.45.2 (04DZ)", but Theorem 59.45.1 is 0BTY. Repair: give both tags.

(The previous report's fourth bullet, about `projective_iff_hasProjectiveDimensionLE_zero`, is withdrawn: the name exists at the pin.)

## R12 (P3) — conflicting open heads with no stated order

Location: the pull request's merge-order paragraph, "No open pull request must merge before this one. The stacked ModularCurves and SchemeAndStackFoundations move follows #1101 and this pull request."

Witness: the overlap report lists #1276 (heads at 7a1c656) and #1656 (e053553), both by another author and both revising this folder. Each conflicts with this pull request in `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, and neither is named. (#1854's copy of this README is identical to this head, so it brings no conflicting change here.)

Repair: name #1276 and #1656 in the merge-order paragraph and say which pull request is rebased on which.

## R13 (P3) — consumer sentences that the consumers do not support

Location: README.md lines 5713–5715, "EnhancedDerivedSheaves E1.6 consumes *isRegularLocalRing_of_projectiveDimension_residueField* and *globalDimension_le_iff_hasProjectiveDimensionLE*", and line 7482, "AbhyankarLemma §3.3 consume the regular-local-ring package of §4.13".

Witness: on main (54fc140), EnhancedDerivedSheaves declares both theorems itself (Suggested.lean lines 88 and 94). AbhyankarLemma README lines 80–81 take 0AFS from PurityOfBranchLocus §0.3, and from §4.13 only `IsRegular.isNormal` (line 78).

Repair: together with R01, say that these roadmaps use the pinned Tau Ceti declarations, or add EnhancedDerivedSheaves and AbhyankarLemma to this pull request and repoint them.

## Previous findings

- R01 — not repaired: README line 5658, "Prove *IsRegularLocalRing.isCohenMacaulay*: a regular local ring of dimension `d` has depth `d`, by induction on a regular system of parameters". The 00OA route at 5696–5711 is unchanged. (Its sub-claim about `projective_iff_hasProjectiveDimensionLE_zero` is withdrawn.)
- R02 — not repaired: Suggested.lean lines 16–17 still say "Key definitions and headline theorems of the roadmap on Mathlib's schemes and Tau Ceti's carriers", and `IsNormalScheme` (935–951) is still redeclared.
- R03 — not repaired: line 440, "| AbundanceStatement §4A / items 2–4 (Roktim Mascharak, [AbundanceStatement](../AbundanceStatement/README.md)) | §5.9's characteristic-zero divisor/curve degree".
- R04 — not repaired: Suggested.lean line 550, `def absoluteFrobenius (X : Scheme.{u}) (hX : SchemeCharP X p) : X ⟶ X :=` with `sorry` fields; the gate still counts 25 such hits.
- R05 — not repaired: line 81, `example (A : Type u) [CommRing A] (n : ℕ) :` … `by sorry`; 101 such examples.
- R06 — not repaired: line 2, `import TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.
- R07 — not repaired: line 2598, `theorem weil_bound (k : Type u) [Field k] [Fintype k]`; the gate still counts 11 hits.
- R08 — not repaired: line 1874, "`= X^{(p/S)} = X ×_{S,F_S} S`, with projections π₁ to X and π₂ to S"; the gate still counts 65 tex hits.
- R09 — not repaired: the same 15 names (`IsNormalScheme.of_isOpenImmersion`, `isNormalScheme_Spec_iff`, …) are still undeclared.
- R10 — not repaired: line 569, `theorem absoluteFrobenius_base (X : Scheme.{u}) (hX : SchemeCharP X p) :` and the other four, unchanged.
- R11 — not repaired: lines 3641–3643 still cite "Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A"; lines 887 and 1531 are unchanged. The fourth bullet is withdrawn as a reviewer error, not repaired by an edit.
- R12 — not repaired: "No open pull request must merge before this one." #1276 and #1656 still conflict in this README and are not named.
- R13 — not repaired: lines 5713–5715, "EnhancedDerivedSheaves E1.6 consumes *isRegularLocalRing_of_projectiveDimension_residueField* and *globalDimension_le_iff_hasProjectiveDimensionLE*".

## Verified sound

**Scope.**
- `git diff --stat 70140e6 HEAD -- TauCetiRoadmap/SchemeAndStackFoundations` is empty.
- Against main, the folder's change is still README.md only, +84/−9.
- `git diff --stat origin/main...HEAD` with the fourteen named folders excluded is empty, so no file outside the pull request's own folders changes.
- `lake-manifest.json` pins Mathlib 1b1ccf4b and Tau Ceti 2fd255d9, and `.lake/packages` are at those commits.

**Gate.**
- The gate re-run on this head reports the same seven failing rules and counts as the worker's.
- Its `outside-folder=21` lists only files under AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces and ComplexKahlerGeometry. These are folders of this pull request, as the brief says, which is why the worker's own gate run reports 0.
- `build=0` in the worker's run.

**Elaboration.** `lake env lean` on `Suggested.lean` from the worktree: exit 0 in 4 min 5 s, 229 `declaration uses sorry` warnings and no other warning or error, the same as at 70140e6. The `#check @name` comparison was not repeated, because R02 and R04 replace most of the carriers.

**Dependency check.** Output: `depcheck: 237 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Every ModularCurves id cited at this head (0B at lines 2428 and 4879, 0C, 0E, 4D) resolves on main, at ModularCurves README lines 688, 779, 839 and 1882.

**Overlaps.**
- Ids cited that an open pull request drops: none.
- Ids only an open revision defines: none.
- Ids this pull request drops that others cite: none.
- Open heads that change this folder: #1276 and #1656 (R12), #1808 (stacked after this pull request and named in the description), and #1854 (its copy of this README is byte-identical to this head; checked by `diff`).

**Library declarations opened at the pins.**
- Tau Ceti: `RingTheory/GlobalDimension.lean` 70 and 90; `RingTheory/RegularLocalRing/ProjectiveDimension.lean` 222, 392 and 441; `RingTheory/Depth/AuslanderBuchsbaum.lean` 148; `AlgebraicGeometry/Scheme/Normal.lean` 84.
- Mathlib: `CategoryTheory/Abelian/Projective/Dimension.lean` 151 and 158; `RingTheory/Regular/Free.lean` 35 (`Module.free_quotSMulTop_iff_free`).
- Cross-roadmap on main: EnhancedDerivedSheaves Suggested.lean 88 and 94, AbhyankarLemma README 78–81, ModularCurves README 688, 779, 839 and 1882.

**Seeded sample.** None of the seeded targets falls in a changed passage. They were opened anyway against the cached Stacks book (line numbers of its text) and the other cached sources; any defect found in this untouched text is listed below as a remark, not a finding.
- 0.16: 00NI Definition 10.105.1 (32516), 02IH (32520), 00NL (32526, Noetherian clause), 00NJ (32532), 0AUN (32546), 00NK (32567), 0AUP (32572), 00NM (32578), 02I6 Lemma 5.11.6 (7070). All match.
- 0.17: 00LI (28671), 0AUI (28687), 00LF (28162), 00LK (28695, nonzero `M`), 00N3 (32310), 0AAH (32434), 0AAG (32420), 0C6G (32369), 0AAI (32438), 0BUS (32380), 0AAF (32415), 0AAE (32401), 031P (40868, with its zero-module convention), 031Q (40879), 031R (40893), 0E9I (126805), 0DWR (204101), 0AVZ (192637), 00LX (28730), 0AV5 (59745, n = 1, 2), 0AV7 (59767, no finiteness), 0AV8 (59777, `M` finite), 0AUK (28787), 0337 (42020). All match.
- 0.23a: 04DZ, as in the previous report; R11 stands.
- 1.4: Definition 65.6.1 = 025Y (252169).
- 1.11: 03G9 (255790), 03M3 (256027).
- 1.15:
  - Stacks: 78.9.1 = 04TW (287961), 04TY (287980), 04SK (291783, with the coproduct hypothesis as stated), 03P8 (229140), Example 39.5.1 = 022U (169957).
  - Poonen (math.mit.edu/~poonen/papers/Qpoints.pdf, cached text): §5.12.4 (line 6440), Proposition 5.12.14 (6457), Warning 5.12.6 (6368, a right action `x·F(g)`; the README's left form is equivalent), Example 6.5.5 (7445), Proposition 6.5.9 (7482), Theorem 6.5.10 (7502), Remark 6.5.11 (7521).
- 1.19: 02ZW (322257), 03YJ (322406), 026O (322589), 03YO (322627), 04T2 (322802), 06N3 (337969).
- 1.23: 0432 (17597), 04S9 (5436), 04SZ (322726), 106.12.1 = 0DUG (346343), 0DUH, 0DUI, 0DUJ (346358–346384), section 0DUF (346337).
- 2.5: 03F3 (92363), section 0FKR (88753, Lemmas 20.30.1–2 = 0FKS, 0FKT), section 09SV (86470, Lemmas 20.12.3–6), 02UZ (87310), 0739 (93136, hypotheses as the README restates them), section 0737 (93129).
- 2.14: Morel–Voevodsky 1999 (morel-voevodsky):
  - Proposition 1.8 (line 1871, pp. 98–99).
  - Proposition 1.9 and Example 1.10 (1885, 1891, p. 99).
  - Definitions 1.12–1.13, Proposition 1.16 and Lemmas 1.17–1.18 (1921–1978, pp. 100–101).
- 2.16: as in the previous report.
- 3.5: 0BCY (128028), 0BCZ (128045), 0BD2 (128084, finite locally free of degree `d ≥ 1`, formation commutes with base change).
- 4.3: 06GS (312304), 06GT (312314), 06HW (312853), 06HX (312925), 06HY (312930), 06IG (313365), 06IH (313371), 0D3G (313672), 06J2 (314032), 06J4 (314080), 06J6 (314109), 06J7 (314114), 06J9 (314178), 06JA (314181), 06JI (314297, kernel killed by `m_{A'}`, free and transitive action of `T_F ⊗ I`). All match. See Source issues for 06J6.
- 5.8: section 42.66 = 02UO (183060: proper smooth `f`, the `R^i f_* E` locally free, `T_{X/Y}`), as the README describes it.

**Adversarial table.** Rows marked (r38) carry forward from the previous report unchanged, because their statements are untouched; the other rows were computed this round for the seeded targets and three headlines.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| (r38) §4.13 `globalDimension` | field; zero module | pd 0; pd ⊥; sup 0 | holds | cite pin (R01) |
| (r38) `isRegularLocalRing_iff_finite_globalDimension` | `k[ε]/ε²`; DVR | dim 0, spanFinrank 1, pd κ = ∞; regular, pd κ = 1 | both directions hold | cite pin |
| (r38) `auslander_buchsbaum` | `O`, `k` over DVR; `k` over field; `0` | 0+1=1; 1+0=1; 0+0=0; excluded by nonzero | holds | cite pin |
| (r38) 00OA, 00OB bounds | `k[ε]`, DVR, field | 1 ≤ ∞; 1 ≤ 1; 0 ≤ 0 | holds | cite pin |
| (r38) `exists_resolution_maximalCohenMacaulay` | `k[[x,y]]`, `M = k` | `d=2, e=0`, `K = R` | holds | cite pin |
| (r38) `free_of_quotSMulTop_free` | DVR, `M = k`, `x = π` | regularity fails, `k/πk` free, `k` not free | hypothesis needed | cite Mathlib |
| (r38) `free_of_isCohenMacaulay` | `k[[x,y]]`, `R/(y)` | depth 1 ≠ 2, not free | "maximal" needed | cite pin |
| (r38) `IsRegularLocalRing.isCohenMacaulay` | field, DVR, `k[ε]` | 0=0, 1=1; `k[ε]` CM not regular | direction right | cite pin |
| (r38) 0.2, 0.10, 0.11, 0.23a, 1.1, 1.12, 1.13, 1.16, 2.4, 2.10, 2.11, 2.16, 2.17, 4.7, 4.8 rows | as listed in the previous report | values as recorded there | hold | none (R11 locators) |
| 0.16 `IsCatenary` Checks | field; `ℤ`; zero ring | one prime, chains of length 0; `0 ⊂ (p)` length 1 for every `p`; no primes, vacuous | all three hold; Definition 10.105.1 agrees | none |
| 0.16 `test_dim_one_domain` via 00NM | `ℤ`; `k[t]` | local rings of dim 1 are domains with depth 1 = dim, so CM, so universally catenary | holds | none |
| 0.17 `depth_le_supportDim` | `κ` over DVR; `M = 0` | depth 0 ≤ dim 0; depth ⊤ vs dim ⊥ fails | "nonzero" is necessary and carried | none |
| 0.17 `cohenMacaulay_product_dimensions` | `k × k[t]`, `p = 0 × k[t]` | `R/p = k`, dim 0; no prime strictly inside `p`, height 0; 0 + 0 = 0 < 1 = dim R | local formula fails globally, as the Check says | none |
| 0.17 `depth_eq_add_of_flat.test_polynomial` | `R = k[x]_(x)`, `S = k[x,y]_(x,y)` | depth S = 2; depth R = 1; `S/xS = k[y]_(y)`, depth 1; 1 + 1 = 2 | holds (0337) | none |
| 0.17 `bijective_of_depth.test_maximal_ideal` | `𝔪 = (x,y) ⊂ k[x,y]` | pd 𝔪_𝔪 = 1, depth = 2 − 1 = 1; cokernel `k ≠ 0` | bound 2 sharp | none |
| 0.17 `test_plane_and_line` | `k[[x,y,z]]/(xz,yz)` | `(xz,yz) = (z) ∩ (x,y)`, both minimal: (S₁); at 𝔪 dim 2, depth 1 | (S₁) and not (S₂) | none |
| 1.11 `test_not_quasicoherent` | `j_! O_U`, `U = Spec ℤ[1/2]` | Γ(Spec ℤ) = 0 (supports not closed); Γ(U) = ℤ[1/2] ≠ 0 ⊗ ℤ[1/2] | not quasi-coherent | none |
| 1.15 torsor Checks | `s^p = t` over `k(t)`; fibre `t = 1`; trivial group on `ℙ¹`; `μ₂/ℚ` | degree p purely inseparable; section `s = 1`; point vs Pic = ℤ; `ℚ^×/ℚ^{×2}` (Pic ℚ = 0) | all hold | none |
| 1.15 Frobenius-twisted action | `G = 𝔾_a/𝔽_p` | `(g,x) ↦ (x + g^p, x)` has degree p, inseparable | not a torsor (Poonen Warning 5.12.6) | none |
| 1.19 / 1.23 DM and tame Checks | `Bμ_p/𝔽_p`; `B(ℤ/p)/𝔽_p`; `BG`, `G ≠ 1` over `k̄` | μ_p not étale, diagonal ramified, not DM; μ_p linearly reductive: tame; Maschke fails in char p: not tame; inertia nontrivial: no fine space, coarse `Spec k` | all hold | locator remark |
| 2.5 `noetherianSpace_vanishing` (headline) | point; `ℙ^d_k`; empty | H¹ = 0 at d = 0; H^d(O(−d−1)) = k ≠ 0 at p = d, not > d; dim ⊥, all H vanish | holds; strict `d < p` needed | none |
| 2.5 `test_infinite_discrete` | `ℕ` discrete | colim Γ = ⊕ℤ → Γ(colim) = ∏ℤ, not onto; terminal not quasi-compact | consistent with 0739 | none |
| 2.14 Nisnevich cd | `Spec k`; `Spec ℝ` | dim 0: H^q = 0, q > 0; `H²_ét(𝔾_m) = ℤ/2`, Nisnevich H² = 0 | holds | none |
| 3.5 norm Checks | `z ↦ z²` on `ℙ¹`; hyperelliptic genus g | Norm O(1) = O(1), Norm π*O(1) = O(2); `π_*O_C = O ⊕ O(−g−1)`, det O(−g−1) ≠ O = Norm O_C; `_det` at L = O: O ⊗ O(−g−1) = det | all hold | none |
| 4.3 subterminal functor | `Λ = k[[a,b]]`, `(ε,0)`, `(0,ε)` | fibre product `k[ε₁,ε₂]`, a, b ≠ 0: empty; factors inhabited: H1 fails; for `A' = A''`, `a` vanishes in `A'×_A A'` iff it does in `A'`: H4 holds | H1 fails, RS fails, H4 holds | none (source issue) |
| 4.3 `lifts_fake_action_rejected` | `ℤ/3`, `act(v,x) = v + 2x` | unique translator `v = y − 2x`; `act(0,1) = 2 ≠ 1` | not an action | none |
| 4.3 `not_H2_quotient` | `h_{k[[t]]}/(t ↦ −t)`, char ≠ 2 | `(1,1)` and `(1,−1)` in `F(k[ε]×_k k[ε])` both map to `(±1, ±1)` | θ not injective, H2 fails | none |
| 5.8 HRR and GRR Checks | `ℙ¹`, d = −2; `ℙ¹`, O(1); divisor D | `binom(d+1,1) = −1 = −h¹(O(−2))`; 2 = 1 + 1(1 − 0); `0 → O(−D) → O → i_*O_D`, `ch = 1 − e^{−D}` | hold (binom read as a polynomial) | none |
| `weil_bound` (headline) | `ℙ¹/𝔽_q`; `y²+y = x³+x` over `𝔽₂` | 0 ≤ 0; 5 points, \|5 − 3\| = 2 ≤ 2√2 | holds | R07 |
| `lineBundleClass_spec_equiv_pic` (headline) | `ℤ`; `ℤ[√−5]` | both trivial; both `ℤ/2` | holds; `Nonempty (≃)` is cardinality only | R07 |

**Remarks on untouched text** (no R-number, no change requested in this round):
- §1.23 cites Stacks Lemmas 106.12.2–106.12.3 for `finite_quotient_coarse`. Those lemmas only translate between moduli spaces of `[U/R]` and categorical quotients. The coarse clause is Definition 83.6.1 (04A2), and the claim that `Spec A^G` is a quotient for a finite group needs its own locator.
- §1.15 cites Poonen Theorem 6.5.10(i) for `torsorRepresentability`. That theorem is the scheme case, for affine `G` over a locally Noetherian base; the algebraic-space statement is carried by Remark 6.5.11 and 04SK.
- The module docstring of `Suggested.lean` (lines 13–18) does not have the required "<title>: target signatures" form, and it does not list which headlines are not statable.

**Ownership against open pull requests** was checked for the regular-local-ring chain in the previous round; that result (R13) is unchanged. It was not re-checked for the rest of main's text.

## Not verifiable

- de Jong 1996 (§4.20) and Hartshorne 1977 are settled as uncertified and were cited by locator only.
- Fulton 1998 (§5.8), Rydh's Keel–Mori manuscript, Conrad 2005, Abramovich–Olsson–Vistoli 2008 (§1.23), Gabber–Kelly and Voevodsky arXiv:0805.4578 (§2.14) were not opened; none of them is in the roadmap's manifest.
- Grothendieck, *Le groupe de Brauer III*, Théorème 11.7 (R11) was not fetched; the manifest has no key for it.
- The `stacks-project` manifest entry holds only the site's index page. The Stacks locators were read from the cached Stacks book PDF text, which is not a key of this roadmap's manifest.

## Source issues

- **Error** in stacks-project at Remark 90.16.5 (06J6), book p. 6567: the source says that condition (RS) for a set-valued functor is exactly Schlessinger's (H4). It should say that (RS) implies (H4), and that they agree in the presence of (H1)–(H3); §4.3's subterminal functor satisfies (H4) and fails (RS). Affects nothing.
