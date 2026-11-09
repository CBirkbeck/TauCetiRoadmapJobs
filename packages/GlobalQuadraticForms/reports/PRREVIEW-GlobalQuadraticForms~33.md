# Review of GlobalQuadraticForms (pull request #1215 at b5b3cde)

**Verdict:** needs changes

This is an incremental re-review of 29 changed lines since `7fd8d8c`.

**What changed in this folder.** Commit `b5b3cde5` changes only `TauCetiRoadmap/GlobalQuadraticForms/README.md` (+26/−3), in three places:
- The Tau Ceti supplier contract, "Ideles and class field theory" bullet (lines 312–324), adds two files and two names: `TauCeti.Algebra.normUnits` and `TauCeti.GlobalNumberFields.ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top`.
- 4.1 gains a Check on the real-place correspondence over `ℚ(√5)` (lines 557–562).
- 4.2 gains a paragraph saying that steps 3 and 4 of its route are the new Tau Ceti theorem (lines 600–605). Its *Needs:* line names that theorem as an alternative input (lines 620–623).

`Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged. No file outside the folder changed since `7fd8d8c`.

The two citations are correct (rows C1–C6). The new Check computes the right indices and the right place (rows C7–C9, C11–C12), but one phrase in it gives the wrong sign under Mathlib's meaning (R03). The two P3 findings of the previous review concern the pull request as a whole, and neither is repaired. No repair report marks either one not actionable.

## R01 (P3) — The conflicting revision #1200 of this roadmap is still open, and no order is stated

**Location.** The pull-request description (title "ClassFieldTheory: correct hypotheses, conductors and lifting"); `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` as a whole.

**Claim.** Not repaired. This was R01 at `c4ff4fc`, `7498694`, `293f615`, `f0ebef6` and `7fd8d8c`.
- This pull request rewrites GlobalQuadraticForms, but its description still names only ClassFieldTheory.
- #1200 ("Fix rank-four discriminant sign comparison") has moved from `9c4d328` to `3219a96` and still changes the same two files.
- The two branches keep repairing the same text in parallel:
  - #1200 made both of this round's repairs too, worded differently: the `normUnits` citation (its README lines 311, 549, 569) and the `ℚ(√5)` real-place Check (lines 515–519).
  - #1200 has the 8.2 `nsmul_hyperbolicClass` citations (9 occurrences, from line 390), where this head has 3.
  - #1200 lacks `TauCeti.hilbertSymbol_completion_eq_one_of_isComplex`, which this head has.

**Witness.**
- `git merge-tree --write-tree HEAD 3219a96` reports "CONFLICT (content)" in `README.md` and in `Suggested.lean`. Neither head is an ancestor of the other.
- At `3219a96`, `Suggested.lean:132` declares `equivalent_of_locallyEquivalent`, and line 147 has `[Invertible (2 : K)]`. This head has neither.

**Repair.** State in the description that this pull request revises GlobalQuadraticForms and supersedes #1200, and close #1200. Before closing it, carry over its 8.2 citations if they are wanted. If both pull requests are kept, state which merges first and rebase the other on it. Test: after the repair, `roadmaps overlaps GlobalQuadraticForms` lists no other open pull request that changes this roadmap.

## R02 (P3) — A change outside the folders this pull request is named for

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`: 112 changed lines (62 insertions, 50 deletions), from commit `1abcd32c` ("ClassFieldTheory: review repairs with consumers kept building").

**Claim.** Not repaired. This was R02 at `c4ff4fc`, `7498694`, `293f615`, `f0ebef6` and `7fd8d8c`.
- This review's brief names three folders as the pull request's own: ClassFieldTheory, QuadraticFormInvariants and GlobalQuadraticForms.
- The open-PR index now lists #1215 as "LocalGaloisGroups, ClassFieldTheory, GlobalQuadraticForms, QuadraticFormInvariants". Neither the description nor the brief names LocalGaloisGroups, so that edit gets no review of its own.
- The gate's `outside-folder` check reports only `TauCetiRoadmap/` folders, so it does not flag this file.

**Witness.** With the three named folders excluded, `git diff --stat origin/main...HEAD` at `b5b3cde` prints `Completed/LocalGaloisGroups/Suggested.lean | 112 ++++…---`.

**Repair.** Either keep the edit or drop it:
- Keep it: name `Completed/LocalGaloisGroups` in the description as a folder this pull request changes, as a consumer updated to keep building after the ClassFieldTheory renames. It then gets a review of its own.
- Drop it: revert the edit and keep the ClassFieldTheory names that file imports.

Test: the same `git diff --stat` then lists nothing, or only folders the description names.

## R03 (P3) — The new 4.1 Check calls an embedding value "the value of `w'`", which in Mathlib is an absolute value

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:558–559`: "The real embedding of `w'.comap σ` sends `θ` to the value of `w'` at `σθ`, which is `(1 - √5)/2`".

**Claim.** The Check exists to pin the real-place correspondence, so its computed value should be unambiguous. In Mathlib an infinite place is an absolute value: the value of `w'` at `σθ` is `w' (σθ) = ‖1 − φ‖ = (√5 − 1)/2`, which is positive. The number the Check needs is the image of `σθ` under the real embedding of `w'`, which is `(1 − √5)/2`. Read literally, the sentence states the wrong sign, and that sign is what identifies `w'.comap σ` as the other place. The surrounding text of 4.1 (item 2, lines 459–463) says "real embedding" throughout. #1200 has the same phrase at its line 516.

**Witness.** Mathlib `InfinitePlace.comap_apply` (`Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean:58`) gives `w'.comap σ θ = w' (σθ)`. `InfinitePlace.apply` (`…/InfinitePlace/Basic.lean:99`) makes this `‖1 − φ‖ ≈ 0.618`. `comap_embedding_of_isReal` (`Ramification.lean:90`) gives `(w'.comap σ).embedding θ = 1 − φ ≈ −0.618`.

**Repair.** Replace "sends `θ` to the value of `w'` at `σθ`, which is `(1 - √5)/2`" with "sends `θ` to the image of `σθ` under the real embedding of `w'`, which is `1 - (1 + √5)/2 = (1 - √5)/2`". Test on the same instance: `comap_embedding_of_isReal` gives `(w'.comap σ).embedding θ = w'.embedding (1 − θ) = 1 − φ = (1 − √5)/2`, which is the embedding of the place `θ ↦ (1 − √5)/2`. The rest of the Check is unchanged and correct (rows C8–C9).

## Previous findings

- R01 — not repaired: the description still names only ClassFieldTheory. #1200, now at `3219a96`, still changes `README.md` and `Suggested.lean` here and conflicts with `b5b3cde` in both. No order is stated.
- R02 — not repaired: `git diff --stat origin/main...HEAD` outside the three named folders still lists `Completed/LocalGaloisGroups/Suggested.lean | 112`, and the description does not name it.

## Verified sound

**Change set.**
- `git diff --stat 7fd8d8c HEAD` lists one file, `TauCetiRoadmap/GlobalQuadraticForms/README.md` (+26/−3).
- `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged, so the pins are those of the previous review.

**The two new Tau Ceti names at the pin.**
- `TauCeti.Algebra.normUnits` is at `TauCeti/RingTheory/Norm/Units.lean:52`, with binders from line 48: `(R : Type*) [CommRing R] {S : Type*} [Ring S] [Algebra R S]`. `Algebra.coe_normUnits` (line 57) says its value is `Algebra.norm R x`. This matches the README's "the algebra norm read as a homomorphism `Sˣ →* Rˣ` for an `R`-algebra `S`" (lines 318–319).
- `TauCeti.GlobalNumberFields.ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top` is at `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Surjective.lean:198`, with binders from line 177. Elaborated with `#check @` and `pp.universes`, its type is:
  - `{K : Type u_1} {L : Type u_2}`, both number fields, `[Algebra K L]`;
  - `S : Finset (HeightOneSpectrum (𝓞 K))`;
  - the hypothesis that for every `v ∉ S`, the range of `normUnits (v.adicCompletion K)` on `v.adicCompletion K ⊗[K] L` is `⊤`;
  - the conclusion `Function.Surjective (ideleClassNormMap K L)`.

  The README's "in any universes", "a finite set `S` of finite places" and "onto at every finite `v ∉ S`" are exact (lines 320–324 and 600–604).
- `TauCeti.GlobalNumberFields.ideleClassNormMap` is at `…/Ideles/Norm/Relative.lean:190`, with `(K L : Type*)` (line 81). `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap` (`…/ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:108`, binders lines 68 and 103) uses the same map, at `Type`, with `[IsGalois K L] [IsCyclic Gal(L/K)]`.
- The file list is correct. "`Surjective.lean`" resolves, like "`Range.lean`", in `NumberTheory/NumberField/Global/Ideles/Norm/`. `RingTheory/Norm/Units.lean` exists at the pin.

**A Lean check of the changed claims.** I elaborated one scratch file against the pins with `lake env lean`. It has no errors and contains:
- `#check @` of the four names above, with the types quoted;
- an `example` for `K L : Type`, `[IsGalois K L] [IsCyclic Gal(L/K)]` and the hypothesis `hS`, concluding `Module.finrank K L ≤ 1`. It is proved by rewriting the first inequality with `MonoidHom.range_eq_top.mpr` of the surjectivity and `Subgroup.index_top`. This is the README's "the declaration gives the surjectivity used in step 5 directly": for `E = K(√a)` it yields `2 ≤ 1`;
- an `example` with `K : Type u` and `L : Type v` applying the surjectivity theorem, which confirms "in any universes".

**Text that depends on the change.**
- Conventions (lines 103–107) and the supplier-contract preamble (lines 155–167) count eight Tau Ceti inputs stated in `Type`. The new names are universe-polymorphic, so the count of eight stands.
- The first inequality is still applied only to `K` in `Type` inside 4.2. Line 2210 of the ClassFieldTheory README ("GlobalQuadraticForms §4.2 consumes the first fundamental inequality of Layer 10") still holds.
- The 4.2 Lean statement (`Suggested.lean:53`) takes `S : Finset (HeightOneSpectrum (𝓞 K))`, the same carrier as the theorem's `S`, so step 2 feeds it directly.
- The 4.1 item-2 law (lines 459–463) sends `w'` to `w'.comap σ`, with the real embedding of `w'.comap σ` equal to that of `w'` composed with `σ`. The new Check computes exactly this.
- It also agrees with the Check before it, which gives indices `3` and `1` for `⟨1, θ, θ⟩` at the places `θ ↦ (1 ± √5)/2`.
- `roadmaps grep` for the surjectivity name finds only this README (lines 320, 601, 622) and #1200's copy.

**Gate and supply direction.**
- The worker's gate at `b5b3cde` reports "Every check passed", including the targeted build.
- My own run fails only on `outside-folder=5`. The five files are in the pull request's own ClassFieldTheory and QuadraticFormInvariants folders, so these are not findings. Every other count is 0.
- The dependency check prints exactly `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `roadmaps resolve` finds no unresolved cross-roadmap citation and no unresolved Lean name. It does not check names outside TauCetiRoadmap, so I checked the two new names at the pin by hand, as above.
- `roadmaps overlaps`:
  - no dropped id in either direction;
  - no id that only an open revision defines;
  - #1200 as the only other pull request that changes this roadmap (R01).

**Lean.**
- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` gives exactly 8 warnings, all "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- The elaborated types in the worker's signature listing equal those of the previous review: no lost section binder, `FiniteDimensional` wherever `V` or `W` occurs, and no `Invertible 2` binder on `injective_wittRing_baseChange_places`.
- The file is unchanged, so the earlier results carry over:
  - the one-tactic probe closes none of the 8 declarations;
  - the headline list is the same: 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3 are stated, and 8.2 and 8.4 are named in the docstring.

**Ownership and duplication.** The change cites two pinned Tau Ceti declarations and creates no object of its own. `roadmaps grep --lean-only` for `namespace TauCetiRoadmap.GlobalQuadraticForms` finds only main, #1200 and #1215. Steps 3 and 4 of the 4.2 route now cite the pinned theorem that proves them, so they are not planned twice.

**Seeded sample.** Of the sampled targets, only 4.1 (a new Check) and 4.2 (its route) fall in the changed lines.
- I re-read Milne's statement of 4.2 in `milne-cft`. VIII, Theorem 1.1 is at line 10384: an element that is an `n`-th power in `K_v` for almost all `v` is an `n`-th power, when `K` has a primitive `n`-th root of 1. That root is `−1` for `n = 2`, so it holds over every number field.
- The page is printed 229: the table of contents at line 89 puts VIII.1 there, and the running head "230" is at line 10413. Exercise 1.3, cited in the eighth-power Check, is at line 10397 on the same page.
- O'Meara 65:15 is `uncertified` (Not verifiable).
- The other sampled targets (4.3, 5.1, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.4) are untouched. Their checks in the previous reviews stand.

**Adversarial table.**
- Rows C1–C12 are new and test the changed passages.
- Rows M1–M6, N1–N7 and 1–38 are carried from the previous review (`PRREVIEW-GlobalQuadraticForms~32`, at `7fd8d8c`), which carried N1–N7 and 1–38 from `~30`. They cover statements the diff leaves untouched, at unchanged pins.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| C1 | Contract: `normUnits` | `ℚ(i)/ℚ`, `x = 2 + i` | Type `Sˣ →* Rˣ`, `R : Type u_1`, `S : Type u_2`; value `Algebra.norm`: `(2+i)(2−i) = 5` | Matches lines 318–319 |
| C2 | Contract: surjectivity "in any universes" | `K : Type u`, `L : Type v` | `#check`: `u_1`, `u_2` independent; the `example` elaborates | Matches |
| C3 | 4.2: steps 3–4 give the surjectivity used in step 5 | `K L : Type`, cyclic, `hS` | Both theorems use `ideleClassNormMap K L` (`Relative.lean:190`); range `⊤`, index `1`, so `finrank ≤ 1`; for `E = K(√a)`, `2 ≤ 1` | Holds (Lean `example`) |
| C4 | 4.2: step 2 is the hypothesis for `L = E` | `a = b²` in `K_v`, `b ≠ 0` | `K_v ⊗ E ≅ K_v[X]/(X² − b²) ≅ K_v × K_v` (`b ≠ −b`); `N(x, y) = xy`; `N(c, 1) = c` | Range `⊤` |
| C5 | Negative control for C4 | `ℚ`, `a = 2`, `v = 3` | `2` is a nonsquare mod 3; `ℚ₃(√2)` is unramified, so norms have even valuation and `3` is no norm | Fails at 3 and at every `p ≡ ±3 (mod 8)`: no finite `S`, as 4.2's Check says |
| C6 | Degenerate case `L = K` | `finrank 1` | `K_v ⊗_K K ≅ K_v`, norm the identity, onto; first inequality `1 ≤ 1` | No contradiction, as step 1 needs `a` nonsquare |
| C7 | 4.1 Check: `σθ = 1 − θ` | `θ² = θ + 1` | `(1−θ)² = 2 − θ = (1−θ) + 1` | `σ` is an automorphism |
| C8 | 4.1 Check: `w'.comap σ` | `φ ≈ 1.618`, `ψ ≈ −0.618` | `(w'.comap σ).embedding θ = w'.embedding (1−θ) = 1 − φ = ψ` (`comap_embedding_of_isReal`) | The other real place |
| C9 | 4.1 Check: indices | `Q = ⟨1,θ,θ⟩` | `σQ` at `w'`: `⟨1,ψ,ψ⟩`, index 1; `Q` at the `ψ`-place: 1; `Q` at `w'`: `⟨1,φ,φ⟩`, index 3 | Reindexing follows `σ`; the identity model (3) is excluded |
| C10 | 4.1 Check: the phrase "value of `w'` at `σθ`" | Mathlib `comap_apply`, `InfinitePlace.apply` | `w' (σθ) = ‖1 − φ‖ ≈ +0.618`; embedding value `≈ −0.618` | Opposite signs: R03 |
| C11 | Wrong model: the inverse correspondence | `σ` is an involution here | `σ⁻¹ = σ`, so the Check cannot separate them. For `K ≠ K'`, `w'.comap σ.symm` is ill-typed (`w' : InfinitePlace K'`), so `w' ↦ w'.comap σ` is the only type-correct reindexing | No change needed |
| C12 | 4.1 Check: `σQ` coefficients | `σQ = σ ∘ Q`, with `K'` acting through `σ⁻¹` | In coordinates `y_i = σ(x_i)`: `y₁² + (1−θ)y₂² + (1−θ)y₃²` | `⟨1, 1−θ, 1−θ⟩` as stated |
| M1 | Map 4.4, complex clause (~32) | `ℚ(i)`, `a = b = −1` | `−1 = i² − (−1)·0²`, so `1` | Holds |
| M2 | Complex versus real clause (~32) | `(−1, −1)` | `ℝ`: `−1`; `ℂ`: `1` | Separate line needed |
| M3 | No complex place (~32) | `ℚ` | `IsComplex` fails; clause vacuous | Consistent |
| M4 | Product with complex factor (~32) | `ℚ(i)`, `(−1, −1)` | All finite symbols `1`, complex `1` | Agree |
| M5 | Universe mark (~32) | `ArchimedeanSymbol.lean:95` | `{K : Type u_1} [Field K]` | Polymorphic |
| M6 | Symbols bullet (~32) | `ArchimedeanSymbol.lean:167` | Listed in the bullet | Correct file |
| N1 | Map: "in `Type`" lines (~30) | `K` binders | `ProductFormula.lean:61, 100`, `SignPrescription.lean:72`: `{K : Type}` | Marks correct |
| N2 | Map: unmarked lines (~30) | `K` binders | Seven files `Type u`, three `Type*` | Polymorphic |
| N3 | Map 4.4, real clause (~30) | `(−1,−1)`; `(−1,2)` | `−1`; `2 = 1² + 1²` gives `1` | Holds |
| N4 | Map 4.4, 71:19a (~30) | `b = −1`, `S = {3}`, `a = −3` | `ℝ`: `−1`; 3: `−1`; 2: `1` | Holds |
| N5 | Map 4.4, 71:19 (~30) | `S = {2}`, `T = {∞}` | `(−1,−1)` is `−1` at 2 and `∞` | Holds |
| N6 | Map 4.4, Hasse product (~30) | `⟨−1,−1⟩` | `−1` at 2 and `∞`; product `1` | Holds |
| N7 | Map Layer 3, positive rank (~30) | Zero form | Rank `0` fails `one_le_rank` | Hypothesis needed |
| 1 | Discriminant convention (~30) | `H`, `⟨1,1⟩` | Plain `[−1]`, `[1]`; signed `[1]`, `[−1]` | Distinguished |
| 2 | Hasse convention (~30) | `H` over `ℝ` | `i<j`: `1`; `i≤j`: `−1` | Distinguished |
| 3 | Real Hasse sign (~30) | `q = 0..4` | `1, 1, −1, −1, 1` | Rank ≤ 3 separated |
| 4 | 4.1 transport (~30) | `ℚ(i)`, conjugation | `2+i ≡ 4` mod `(2−i)` | Places follow `σ` |
| 5 | 4.1, 71:19a (~30) | `S = {5}` | `−1 = 2²` in `ℚ₅` | Nonsquare hypothesis needed |
| 6 | 4.1, 71:19 (~30) | `S = {3}`, `T = ∅` | Odd count | Parity needed |
| 7 | 4.2 (~30) | `ℚ(i)`, `a = −1` | `−1 = i²` | Both true |
| 8 | 4.2 (~30) | `ℚ`, `a = −7` | Square in `ℚ₂`; nonsquare at 3 | Hypothesis fails |
| 9 | 4.2 exponent (~30) | `16`, `n = 8` | 8th power at odd `p`; `√2 ∉ ℚ` | Analogue false |
| 10 | 4.3 (~30) | `d = 5`, `a = −1` | `2² − 5 = −1` | Both true |
| 11 | 4.3 (~30) | `d = 3`, `a = −1` | `(3,−1)₃ = −1` | Both false |
| 12 | 5.1 binary (~30) | `⟨1,−2⟩`; `ℚ(√2)` | Anisotropic at `ℚ₃`; isotropic | False; true |
| 13 | 5.1 ternary (~30) | `⟨1,1,−7⟩` | `(−1,7)₇ = (−1,7)₂ = −1` | Both false |
| 14 | 5.1 ternary (~30) | `⟨1,1,−5⟩` | `1 + 4 − 5 = 0` | Both true |
| 15 | 5.5 (~30) | Rank 0, 1 | Anisotropic everywhere | Both false |
| 16 | 5.5 (~30) | `⟨1,1,1,−7⟩` | `⟨1,1,1⟩` misses 7 in `ℚ₂` | Both false |
| 17 | 5.5 (~30) | `⟨1,1,1,−1⟩` | `1 − 1 = 0` | Both true |
| 18 | 5.5 route (~30) | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `x = 0` gives singular `⟨0⟩ ⊥ W` | `U(x) ≠ 0` needed |
| 19 | 6.1 (~30) | `⟨1,1,1⟩`, `a = 7`; `3` | Missed at `ℚ₂`; `1+1+1` | False; true |
| 20 | 6.1 (~30) | `a = 0` | Zero vector | Both true |
| 21 | 6.2 (~30) | `⟨1,7⟩` into `⟨1,1,1⟩` | `⟨7⟩` missed at `ℚ₂` | Both false |
| 22 | 6.2 (~30) | `⟨1,2⟩` into `⟨1,1,1⟩` | `(0,1,1) ↦ 2` | Both true |
| 23 | 6.2 Check (~30) | `⟨c⟩` into `H` | `((1+c)² − (1−c)²)/4 = c` | Holds |
| 24 | 6.3 (~30) | `⟨1,3⟩`/`⟨1,1⟩`; `⟨1,1⟩`/`⟨2,2⟩` | `[3] ≠ [1]` at `ℚ₃`; `(x+y)² + (x−y)²` | False; true |
| 25 | 7.2 (~30) | `n = 2`, `d = [−1]`, `U_v = H` | All `s_v = 1` | `V = H` |
| 26 | 7.2 Check (~30) | `⟨−1,−1,−1⟩` | `s₂ = −1`, real `−1` | Holds |
| 27 | 7.3 (~30) | `(2, [1], −1 at 2, 3)` | `⟨3,3⟩` | Realized |
| 28 | 7.3 (~30) | Zero record; rank 1, two `−1` | Rank `0`; `isAdmissible_rankOne_iff_eq_empty` | Not admissible |
| 29 | 7.3 route (~30) | `ℚ(√5)` record | Reduction returns `I` | Reaches `I` |
| 30 | 7.4 / 8.1 (~30) | `⟨3,3⟩`/`⟨1,1⟩` | `s₂, s₃` differ | Not isometric |
| 31 | 8.1 (~30) | `⟨1,2,2⟩`/`⟨1,1,1⟩` | `d = [1]`, `s = 1`, index 3 | Isometric |
| 32 | 8.1 (~30) | Zero forms; zero/`⟨1⟩` | Ranks `0,0`; `0,1` | True; false |
| 33 | 8.2 (~30) | `⟨1,1,−3,−3⟩` | `s` differs at 2 and 3 | Not hyperbolic |
| 34 | 8.2 (~30) | `⟨1,−1,2,−2⟩` | `d = [1]` | Hyperbolic |
| 35 | 8.3 (~30) | `⟨1,1,−3,−3⟩`; `H` | Nonzero at `ℚ₂, ℚ₃`; zero | As stated |
| 36 | 8.3, complex places (~30) | `W(ℂ) = ℤ/2` | Even dimension forced | Add nothing |
| 37 | 8.4 (~30) | `⟨1,2,2⟩`, `⟨1,1,1⟩` | Same invariants | Isometric |
| 38 | Worked example (~30) | `ℚ(√5)`, `⟨1,θ,θ⟩` | `d = [1]`; indices 3, 1 | Matches |

**Remarks on untouched text.** These are not findings, and no change is asked for.
- The finite-place Checks of 4.1 use complex conjugation on `ℚ(i)`, which is an involution, so they cannot separate `v ↦ σ v` from `v ↦ σ⁻¹ v`. As in row C11, typing excludes the inverse when `K ≠ K'`.
- The Milne source issues recorded by earlier rounds stand. I found no new ones.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is settled as `uncertified` (paywalled, cited by its locator). I could not read 65:15, the 4.2 locator in the touched section, nor 71:19 and 71:19a in 4.1. The changed lines add no O'Meara locator.
- Serre, *A Course in Arithmetic*, is settled as `uncertified`.
- I checked ownership against open pull requests with `roadmaps grep` over all 458 open heads, not by reading each sibling checkout.

## Source issues

- none
