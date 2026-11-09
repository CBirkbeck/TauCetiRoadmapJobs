# Review of GlobalQuadraticForms (pull request #1215 at 7fd8d8c)

**Verdict:** needs changes

This is an incremental re-review of 8 changed lines since `f0ebef6`.

**What changed in this folder.** Commit `41af5ecd` changes two passages of
`TauCetiRoadmap/GlobalQuadraticForms/README.md`:
- The section map line for the old §4.4 is renamed from "the real symbol" to "the archimedean
  symbol" (lines 75–78). It now also resolves the complex-place clause to
  `TauCeti.hilbertSymbol_completion_eq_one_of_isComplex`.
- The "Symbols" bullet of the Tau Ceti supplier contract adds the same name (lines 285–286).

This closes the remark of the previous review: main's §4.4 complex-place clause had no map line.
The repair is correct (rows M1–M6 below). It introduces no new problem.

**Other changes.**
- Commit `12aa8f12` makes a two-word grammar fix in `TauCetiRoadmap/ClassFieldTheory/README.md`.
- Commit `7fd8d8ca` revises `TauCetiRoadmap/QuadraticFormInvariants/`.
- Neither touches a name or section this roadmap consumes. `Suggested.lean` is unchanged.

**Open findings.** The two P3 findings of the previous review concern the pull request as a whole.
Neither is repaired. No repair report marks either one not actionable.

## R01 (P3) — The conflicting revision #1200 of this roadmap is still open, and no order is stated

**Location.** The pull-request description (title "ClassFieldTheory: correct hypotheses,
conductors and lifting"); `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` as
a whole.

**Claim.** Not repaired. This was R01 at `c4ff4fc`, `7498694`, `293f615` and `f0ebef6`.
- This pull request rewrites GlobalQuadraticForms, but its description still names only
  ClassFieldTheory.
- #1200 ("Fix rank-four discriminant sign comparison") has moved to head `9c4d328` and still
  changes the same two files.
- The two branches keep making parallel repairs:
  - #1200's map still reads "4.4, the real symbol" (its README line 76) and lacks this head's
    complex-place clause.
  - Its Suggested.lean still differs here (see the witness).

**Witness.**
- `git merge-tree --write-tree HEAD 9c4d328` reports "CONFLICT (content)" in `README.md` and in
  `Suggested.lean`. Neither head is an ancestor of the other.
- At `9c4d328`, `Suggested.lean:132` declares `equivalent_of_locallyEquivalent`, and line 147 has
  `[Invertible (2 : K)]`. This head has neither.

**Repair.** State in the description that this pull request revises GlobalQuadraticForms and
supersedes #1200, then close #1200. #1200's rank-four fix is already at 7.2 here. If both pull
requests are kept, state which merges first and rebase the other on it. Test: after the repair,
`roadmaps overlaps GlobalQuadraticForms` lists no other open pull request that changes this
roadmap.

## R02 (P3) — A change outside the folders this pull request is named for

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`: 112 changed lines (62 insertions, 50
deletions), from commit `1abcd32c` ("ClassFieldTheory: review repairs with consumers kept
building").

**Claim.** Not repaired. This was R02 at `c4ff4fc`, `7498694`, `293f615` and `f0ebef6`.
- This review's brief names three folders as the pull request's own: ClassFieldTheory,
  QuadraticFormInvariants and GlobalQuadraticForms.
- The open-PR index lists LocalGaloisGroups among #1215's roadmaps, but neither the description
  nor the brief names it. So the edit gets no review of its own.
- The gate's `outside-folder` check reports only `TauCetiRoadmap/` folders, so it does not flag
  this file.

**Witness.** With the three named folders excluded, `git diff --stat origin/main...HEAD` at
`7fd8d8c` still prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.** Either keep the edit or drop it:
- Keep it: name `Completed/LocalGaloisGroups` in the description as a folder this pull request
  changes, a consumer updated to keep building after the ClassFieldTheory renames. It then gets a
  review of its own.
- Drop it: revert the edit and keep the ClassFieldTheory names that file imports.

Test: the same `git diff --stat` then lists nothing, or only folders the description names.

## Previous findings

- R01 — not repaired: the description still names only ClassFieldTheory. #1200 (now at `9c4d328`)
  still changes `README.md` and `Suggested.lean` here. It still conflicts with `7fd8d8c`, and no
  order is stated.
- R02 — not repaired: `git diff --stat origin/main...HEAD` outside the three named folders still
  lists `Completed/LocalGaloisGroups/Suggested.lean | 112`, and the description does not name it.

## Verified sound

**Change set.**
- `git diff --stat f0ebef6 HEAD` lists four files:
  - `TauCetiRoadmap/GlobalQuadraticForms/README.md` (+6/−2);
  - `TauCetiRoadmap/ClassFieldTheory/README.md` (+3/−3);
  - `TauCetiRoadmap/QuadraticFormInvariants/README.md`;
  - `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`.
- This folder's `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged.

**The new name at the pin.**
- `TauCeti.hilbertSymbol_completion_eq_one_of_isComplex` is at
  `TauCeti/NumberTheory/QuadraticForm/Global/ArchimedeanSymbol.lean:167`. Its binders come from
  line 95.
- Elaborated with `#check @`, its type is: for `{K : Type u_1} [Field K] {w : InfinitePlace K}`,
  `w.IsComplex → ∀ a c : w.Completionˣ, hilbertSymbol a c = 1`.
- Its proof transports along Mathlib's `InfinitePlace.Completion.ringEquivComplexOfIsComplex`
  (`Mathlib/NumberTheory/NumberField/Completion/InfinitePlace.lean:311`) to
  `TauCeti.hilbertSymbol_eq_one_of_isAlgClosed` (`TauCeti/NumberTheory/HilbertSymbol/IsAlgClosed.lean:36`).
- The symbol is `TauCeti.hilbertSymbol` (`TauCeti/NumberTheory/HilbertSymbol/Basic.lean:47`): `1`
  exactly when `b = x² − a y²` is solvable.

**What the changed lines claim.**
- The declaration is universe-polymorphic and needs only `[Field K]`. So the map line correctly
  carries no "in `Type`" mark.
- The Conventions count of eight `Type` inputs (line 103) is unaffected.
- So is the supplier-contract paragraph (lines 153–165).
- `ArchimedeanSymbol.lean` is among the files the Symbols bullet lists (line 282).
- The map line now matches the content of main's old §4.4, "The archimedean symbol" (main `3090489`,
  §4.4 starting at line 443, its paragraph at lines 463–464). That paragraph gives the real-place
  value and says the symbol is always `1` at a complex place. Both halves now have a map line.

**Text that depends on the change.**
- README line 1190 says that Classical Arithmetic Completion consumes "Layer 4's real symbol",
  which the map resolves. That still holds through the real-place clause of the renamed line.
- Classical Arithmetic Completion on main reads only the real value from Global Quadratic
  Forms 4.4 (its README lines 589, 783 and 793). It takes the complex value from Class Field
  Theory's `infiniteArtinAt`.
- `roadmaps grep` finds no roadmap on main or at an open head that cites "4.4, the real symbol" by
  that label, apart from #1200's own copy of this README.
- `roadmaps grep` for the new name finds only this README, lines 77 and 285.

**Gate and supply direction.**
- The worker's gate at `7fd8d8c` reports "Every check passed", including the targeted build.
- My own run fails only on `outside-folder=5`. The five files are in the pull request's own
  ClassFieldTheory and QuadraticFormInvariants folders, so these are not findings. Every other
  count is 0.
- The dependency check prints exactly `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`, with no
  UPWARD or CYCLE line.
- `roadmaps resolve` finds no unresolved cross-roadmap citation and no unresolved Lean name. It did
  not check names outside TauCetiRoadmap, so I checked the new name by hand, as above.
- `roadmaps overlaps`:
  - no dropped id in either direction;
  - no id that only an open revision defines;
  - #1200 as the only other pull request that changes this roadmap (R01).

**Sibling folders.**
- This README cites Class Field Theory and Quadratic Form Invariants only through Tau Ceti
  declarations:
  - `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`;
  - `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion`;
  - the Tau Ceti Hilbert-symbol names.
- The Quadratic Form Invariants change rewords its account of
  `TauCeti.hilbertSymbol_eq_hilbertSign_kummerBrauerClass`. This README uses neither that name nor
  `hilbertSymbol_eq_cohomological` (grep: no match).
- Class Field Theory README lines 203 and 2210 still say that GlobalQuadraticForms owns
  Hasse–Minkowski and that 4.2 and 4.3 are its consumers.

**Lean.**
- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` gives exactly 8 warnings, all
  "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- I elaborated one scratch file with `#check @` for all 8 declarations and for the four map names
  of 4.4 (`hilbertSymbol_completion_eq_one_of_isComplex`, `hilbertSymbol_real`,
  `hilbertSymbol_unitAtRealPlace_eq_neg_one_iff`, `hilbertSymbol_productFormula`). I used
  `pp.universes`. The 8 types are those of the previous review:
  - `K : Type u_1`, with `V` and `W` in independent universes;
  - `FiniteDimensional` wherever `V` or `W` occurs;
  - explicit `QuadraticMap.Nondegenerate` hypotheses;
  - `Ne a 0` only in `represents_iff_locallyRepresents`;
  - no `Invertible 2` binder on `injective_wittRing_baseChange_places`;
  - no lost section binder.
  Nothing changed.
- The same scratch file elaborates an `example`: at a complex place, the symbol of the images of
  any `a, b ∈ Kˣ` in `K_w` is `1`, by the new name. So the map line covers global units.
- The file and the pins are unchanged, so the earlier results carry over:
  - The one-tactic probe closes none of the 8 declarations.
  - The headline list is the same: 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3 are stated, and 8.2
    and 8.4 are named in the docstring.

**Ownership.**
- `roadmaps grep --lean-only` for `namespace TauCetiRoadmap.GlobalQuadraticForms` finds only main,
  #1200 and #1215.
- The change cites a Tau Ceti declaration and creates no object of its own.

**Seeded sample.** No sampled target (4.1–8.4) is in the changed lines.
- I re-read the five Milne statements in `milne-cft` and found each where the README cites it:
  - Thm 1.1 at line 10384;
  - Thm 3.1 at line 10629;
  - Thm 3.5 at line 10686;
  - Thm 6.3 at line 11619;
  - Thm 6.12 at line 11792.
- The README flags no locator as unverified.

**Adversarial table.**
- Rows M1–M6 are new. They test the changed map line and supplier-contract line.
- Rows N1–N7 and 1–38 cover statements the diff leaves untouched. Each is carried from the previous
  review (`PRREVIEW-GlobalQuadraticForms~30`, at `f0ebef6`), whose values hold at `7fd8d8c`.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| M1 | Map 4.4, complex clause | `ℚ(i)`, its complex place, `a = b = −1` | Over `K_w ≅ ℂ`, `−1 = x² − (−1)y²` at `x = i, y = 0`, so `1`; the declaration gives `1` | Holds |
| M2 | Complex versus real clause (wrong model: the real formula at every infinite place) | `(−1, −1)` | Over `ℝ`, `−1 = x² + y²` has no solution, so `−1`; over `ℂ`, `1` | The two clauses differ, so the separate line is needed |
| M3 | Degenerate case: no complex place | `ℚ` | `InfinitePlace ℚ` has one place, real; `IsComplex` fails, so the clause is vacuous and the real clause covers `ℚ` | Consistent |
| M4 | Main's all-places product versus the finite-and-real product of `hilbertSymbol_productFormula` | `ℚ(i)`, `(−1, −1)` | `−1 = i²` is a square at every place, so every finite symbol is `1`; there is no real place; the complex factor is `1` (M1); both products are `1` | Agree, as the complex line requires |
| M5 | Universe mark | Binder of the new name | `{K : Type u_1} [Field K]` (`ArchimedeanSymbol.lean:95`) | Polymorphic; no "in `Type`" mark is right |
| M6 | Supplier contract, Symbols bullet | File of the new name | `ArchimedeanSymbol.lean:167`, listed on README line 282 | Correct file |
| N1 | Map: "in `Type`" lines | `K` binders at the pin | `ProductFormula.lean:61, 100` and `SignPrescription.lean:72` read `{K : Type}` | Marks correct |
| N2 | Map: unmarked lines | `K` binders at the pin | Seven files `Type u`, three `Type*`; `hilbertSymbol_real` over `ℝˣ` | Polymorphic |
| N3 | Map 4.4, real clause | `ℝ`: `(−1,−1)`; `(−1,2)` | `−1 = x² + y²` unsolvable, so `−1`; `2 = 1² + 1²`, so `1` | Matches main's real clause |
| N4 | Map 4.4, 71:19a | `ℚ`, `b = −1`, `S = {3}`, `T = {∞}`, `a = −3` | `ℝ`: `−1`; at 3: `(−1/3) = −1`; at 2: `1` | Holds |
| N5 | Map 4.4, 71:19 | `S = {2}`, `T = {∞}` | `(−1,−1)` is `−1` exactly at 2 and `∞` | Holds |
| N6 | Map 4.4, Hasse product | `⟨−1,−1⟩` over `ℚ` | `−1` at 2 and `∞`, `1` elsewhere; product `1` | Holds |
| N7 | Map Layer 3, positive rank | Zero form | Rank `0` fails `IsAdmissible.one_le_rank` | Hypothesis needed |
| 1 | Discriminant convention | `H`, `⟨1,1⟩` | Plain `[−1]`, `[1]`; signed `[1]`, `[−1]` | Distinguished |
| 2 | Hasse convention | `H` over `ℝ` | `i<j`: `1`; `i≤j`: `−1` | Distinguished |
| 3 | Real Hasse `(−1)^(q(q−1)/2)` | `q = 0..4` | `1, 1, −1, −1, 1` | Rank ≤ 3 separated |
| 4 | 4.1 transport | `ℚ(i)`, conjugation | `2+i ≡ 4` mod `(2−i)`; `σ(2+i)` square at `(2+i)` | Places follow `σ` |
| 5 | 4.1, 71:19a | `S = {5}` | `−1 = 2²` in `ℚ₅` | Nonsquare hypothesis needed |
| 6 | 4.1, 71:19 | `S = {3}`, `T = ∅` | Odd count | Parity hypothesis excludes it |
| 7 | 4.2 | `ℚ(i)`, `a = −1` | `−1 = i²` | Both true |
| 8 | 4.2 | `ℚ`, `a = −7` | Square in `ℚ₂`; nonsquare at 3 | Hypothesis fails; conclusion false |
| 9 | 4.2, exponent | `16`, `n = 8` | 8th power in every odd `ℚ_p`; `√2 ∉ ℚ` | 8th-power analogue false |
| 10 | 4.3 | `d = 5`, `a = −1` | `2² − 5·1² = −1` | Both true |
| 11 | 4.3 | `d = 3`, `a = −1` | `(3,−1)₃ = −1` | Both false |
| 12 | 5.1 binary | `⟨1,−2⟩` over `ℚ`; `ℚ(√2)` | Anisotropic at `ℚ₃`; `(√2)² − 2 = 0` | False; true |
| 13 | 5.1 ternary | `⟨1,1,−7⟩` | `(−1,7)₇ = −1`, `(−1,7)₂ = −1` | Both false |
| 14 | 5.1 ternary | `⟨1,1,−5⟩` | `1 + 4 − 5 = 0` | Both true |
| 15 | 5.5 | Rank 0, 1 | Anisotropic everywhere | Both false |
| 16 | 5.5 | `⟨1,1,1,−7⟩` | `⟨1,1,1⟩` misses `7` in `ℚ₂` | Both false |
| 17 | 5.5 | `⟨1,1,1,−1⟩` | `1 − 1 = 0` | Both true |
| 18 | 5.5 route | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `x = 0` gives singular `⟨0⟩ ⊥ W` | `U(x) ≠ 0` needed |
| 19 | 6.1 | `⟨1,1,1⟩`, `a = 7`; `a = 3` | 7 missed at `ℚ₂`; `1+1+1 = 3` | False; true |
| 20 | 6.1 | `a = 0` | Zero vector | Both true |
| 21 | 6.2 | `⟨1,7⟩` into `⟨1,1,1⟩` | `⟨7⟩` missed at `ℚ₂` | Both false |
| 22 | 6.2 | `⟨1,2⟩` into `⟨1,1,1⟩` | `e₁ ↦ 1`, `(0,1,1) ↦ 2` | Both true |
| 23 | 6.2 Check | `⟨c⟩` into `H` | `((1+c)² − (1−c)²)/4 = c` | Holds |
| 24 | 6.3 | `⟨1,3⟩` vs `⟨1,1⟩`; `⟨1,1⟩` vs `⟨2,2⟩` | `[3] ≠ [1]` at `ℚ₃`; `(x+y)² + (x−y)²` | False; true |
| 25 | 7.2 | `ℚ`, `n = 2`, `d = [−1]`, `U_v = H` | All `s_v = 1`; product `1` | `V = H` |
| 26 | 7.2 Check | `⟨−1,−1,−1⟩` | `s₂ = −1`, real `−1`; product `1` | Holds |
| 27 | 7.3 | `(2, [1], s = −1 at 2, 3)` | `⟨3,3⟩` realizes it | Admissible, realized |
| 28 | 7.3 | Zero record; rank 1, two `−1` | Rank `0`; `isAdmissible_rankOne_iff_eq_empty` | Not admissible |
| 29 | 7.3 route | `ℚ(√5)` record | Reduction returns record `I` | Reaches `I` |
| 30 | 7.4 / 8.1 | `⟨3,3⟩` vs `⟨1,1⟩` | `s₂, s₃` differ | Not isometric |
| 31 | 8.1 | `⟨1,2,2⟩` vs `⟨1,1,1⟩` | `d = [1]`, `s = 1`, index 3 both | Isometric |
| 32 | 8.1 | Zero forms; zero vs `⟨1⟩` | Ranks `0,0`; `0,1` | True; false |
| 33 | 8.2 | `⟨1,1,−3,−3⟩` | `s` differs from `s(2H)` at 2 and 3 | Not hyperbolic |
| 34 | 8.2 | `⟨1,−1,2,−2⟩` | `d = [1] = d(2H)` | Hyperbolic |
| 35 | 8.3 | `⟨1,1,−3,−3⟩`; `H` | Nonzero at `ℚ₂, ℚ₃`; zero | Nonzero; zero |
| 36 | 8.3, complex places | `W(ℂ) = ℤ/2` | Even dimension forced elsewhere | Add nothing |
| 37 | 8.4 | `⟨1,2,2⟩`, `⟨1,1,1⟩` | Same local invariants | Isometric |
| 38 | Worked example | `ℚ(√5)`, `⟨1,θ,θ⟩` | `d = [1]`; indices 3, 1; product `1` | Matches |

**Remarks on untouched text.** These are not findings, and no change is asked for.
- Main's §4.1 (vector weak approximation) and §4.5 (openness) now have different content or are
  absent. `roadmaps overlaps` finds no roadmap that cites either.
- The Milne source issues recorded by earlier rounds stand. I found no new ones.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is settled as `uncertified` (paywalled, cited by its
  locator). I could not read 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a or 72:1. The changed
  lines cite no O'Meara locator.
- Serre, *A Course in Arithmetic*, is settled as `uncertified`.
- I checked ownership against open pull requests with `roadmaps grep` over all 458 open heads, not
  by reading each sibling checkout.

## Source issues

- none
