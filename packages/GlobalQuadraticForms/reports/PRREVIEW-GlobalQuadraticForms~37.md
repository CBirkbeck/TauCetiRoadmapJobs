# Review of GlobalQuadraticForms (pull request #1215 at 693a416)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since `c1d130b`.

**What changed.**
- `git diff --stat c1d130b HEAD` lists one file, `TauCetiRoadmap/ClassFieldTheory/README.md` (+3).
- Nothing in `TauCetiRoadmap/GlobalQuadraticForms/` changed, and neither did `lake-manifest.json` or `lean-toolchain`.
- The pull-request description has been rewritten. It now has a **Folders** paragraph and a tool-generated merge-order block. Those two passages are what repair the two P3 findings of the previous report.

No finding remains.

## Previous findings

- R01 — repaired: the description now says "This pull request revises three roadmaps on main: ClassFieldTheory, GlobalQuadraticForms and QuadraticFormInvariants" and "#1200 also revises GlobalQuadraticForms. It is rebased onto this revision". The merge-order block reads "`GlobalQuadraticForms`: **this pull request** → #1200".
- R02 — repaired: the description now says "It also edits `Completed/LocalGaloisGroups/Suggested.lean`. That file imports ClassFieldTheory's `Suggested.lean` and uses `cyclotomicCharacter_artinMap`, so it has to follow this revision." The merge-order block lists `LocalGaloisGroups` as a shared folder.

## Verified sound

**R01: the conflicting revision #1200.**
- `roadmaps list` shows #1200 ("Fix rank-four discriminant sign comparison") still open at `8fe49f4`.
- `git merge-tree --write-tree HEAD 8fe49f4` still reports "CONFLICT (content)" in `README.md` and in `Suggested.lean`.
- `git merge-base --is-ancestor` fails in both directions.
- `git diff --stat HEAD 8fe49f4 -- TauCetiRoadmap/GlobalQuadraticForms` prints 240 changed lines in the README and 45 in `Suggested.lean`. These are the same numbers as at `c1d130b`.

The brief's rule is that a conflicting head is P3 only when no order is stated. An order is now stated twice, in the author's prose and in the merge-order block:
- this pull request merges first;
- #1200 is rebased onto it and keeps only what this head lacks.

This is the second repair the previous R01 offered ("state which merges first and rebase the other on it"). The description also names GlobalQuadraticForms as a roadmap the pull request revises, which the previous R01 found missing.

**R02: the edit to `Completed/LocalGaloisGroups/Suggested.lean`.**
- `git diff --stat origin/main...HEAD`, with the three named folders excluded, still lists only `Completed/LocalGaloisGroups/Suggested.lean | 112` (62+/50−). That file is unchanged since `c1d130b`.
- The description now declares the edit and its reason. This is the "keep it" repair of the previous R02. This review's brief does not name that folder, so I read the edit myself.

The edit only follows this revision:
- `Completed/LocalGaloisGroups/Suggested.lean` line 12 imports `TauCetiRoadmap.ClassFieldTheory.Suggested`.
- Most hunks repoint references from roadmap names to Tau Ceti names. Examples: `ClassFieldTheory.artinMap` becomes `TauCeti.ClassFieldTheory.artinMap`, `kummerEquiv_mixed` becomes `kummerEquivOfCharZero`, and `h2FpEquivZMod_of_mu` becomes `h2EquivZModOfMuNRepIso`.
- The other changes are one new Tau Ceti import, one `omit … in`, and docstrings.

I found a declaration at the pinned Tau Ceti for every name the edit introduces:
- `Local/ArtinMap.lean:114` (`artinMap`, in `namespace TauCeti.ClassFieldTheory`, line 102);
- `MuNRep.lean:130`, `:137`, `:189`, `:358` and `:409`;
- `Brauer/RootsOfUnity.lean:145` and `:156`;
- `Local/Symbol.lean:207` and `:257`;
- `Local/ExplicitCyclotomicSymbol/ArtinMap.lean:294`;
- `Local/Cyclotomic.lean:364`;
- `FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:252`;
- `RepresentationTheory/Homological/TateCohomology/PrimaryComponent.lean:81`.

`cyclotomicCharacter_artinMap` is declared at `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:81` at this head.

I did not build `Completed/LocalGaloisGroups`, because that command is outside this review's brief. Its build rests on the repository CI.

**The change outside the folder since `c1d130b`.**
- The three added rows of the ClassFieldTheory README table of names used elsewhere (lines 288, 294 and 305) are about `TateCohomology.primaryComponent_tateCohomology_eq_bot`, `absoluteGaloisGroupExtend` and `TauCetiRoadmap.ClassFieldTheory.WeilGroup`.
- A grep of this roadmap's README and `Suggested.lean` finds none of the three names, so the change touches nothing cited here.
- The three Tau Ceti declarations they point to exist at the pin:
  - `PrimaryComponent.lean:81`;
  - `FiniteExtension.lean:252`;
  - `ClassFieldTheory/WeilGroup/Basic.lean:181` (`def WeilGroup : Type u`).
- ClassFieldTheory's statements about this roadmap are unchanged:
  - its README line 203 says that GlobalQuadraticForms owns Hasse–Minkowski;
  - its README line 2213 says that §4.2 consumes `finrank_le_index_range_ideleClassNormMap` and §4.3 consumes `exists_sq_sub_mul_sq_iff_forall_completion`.
- Both of those Tau Ceti theorems are at the pin: `Global/IdeleClass/FirstInequality.lean:108` and `Global/HasseNorm/Quadratic.lean:45`.
- This README cites them at lines 157–158, 322, 326, 514, 624, 651 and 661.

**The gate.**
- The worker's gate at `693a416` reports "Every check passed", including the targeted build.
- My own run (`gate … --base origin/main`) fails only on `outside-folder=5`. The five files are `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`, `TauCetiRoadmap/QuadraticFormInvariants/NativeCompletion.md`, `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`. They are in the pull request's own folders, so they are not findings.
- Every other count is 0, including `set_option`, `sorry-data`, `statement-hygiene`, `imports`, `stray-files` and `depcheck`.

**The dependency check.** Its output is exactly `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. GlobalQuadraticForms is on main (`origin/main:TauCetiRoadmap/GlobalQuadraticForms/README.md` is a blob), so it is earlier than every open roadmap.

**The elaboration.**
- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` exits 0.
- It gives exactly 8 warnings, all "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- The file is unchanged, so the following carry over from the previous report:
  - the elaborated signatures (no lost section binder, and `FiniteDimensional` wherever `V` or `W` occurs);
  - the one-tactic probe, which closes none of the 8 declarations;
  - the headline list: 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3 stated, and 8.4 named in the docstring as the reverse direction of 6.3.

**Citations and overlaps.**
- `roadmaps resolve` (the worker's run) finds no unresolved citation or Lean name.
- `roadmaps overlaps`:
  - no id that an open pull request drops;
  - no id that only an open revision defines;
  - no dropped id cited elsewhere;
  - #1200 is the only other pull request changing this roadmap, now with a stated order.
- The closest open roadmaps in vocabulary are the QuadraticFormInvariants revisions #1411, #617 and #1187, QuadraticFormInvariantsPartII and GeometryOfNumbersAndQuadraticArithmeticPartII. Their overlap with this roadmap is unchanged, since this folder did not change.

**Seeded sample.** No sampled target falls in a changed passage. I still re-read three of the `milne-cft` locators that the sampled targets cite:
- 4.2, README line 584: Theorem 1.1 is at `milne-cft` line 10384, on the page whose printed number is 229 (line 10411).
- 4.3, README line 650: Theorem 3.1 (the Hasse norm theorem, for cyclic extensions) is at `milne-cft` line 10629, under the running head "234 Chapter VIII. Complements" (line 10604).
- 6.3, 8.1, 8.2 and 8.4, README lines 1042, 1094 and 1174: Theorem 6.3 (Hasse–Minkowski for equivalence) is at `milne-cft` line 11619, under the running head "252 Chapter VIII. Complements" (line 11607).

All three page numbers are correct. The previous R03 (the 4.1 real-place Check) stays repaired: README lines 559–563 are unchanged.

**Adversarial table.**
- No statement changed, so the table adds no row for a changed statement. Rows L1–L3 record the locator re-check above.
- Every other row is carried from the previous report (`PRREVIEW-GlobalQuadraticForms~35`, at `c1d130b`), marked "(~35)". That report carried rows C1–C12 from `~33`, and M1–M6, N1–N7 and 1–38 from `~32` and `~30`, at the same pins.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| L1 | 4.2 locator | `milne-cft` VIII Thm 1.1 | line 10384, footer `229` at line 10411 | p. 229 correct |
| L2 | 4.3 locator | `milne-cft` VIII Thm 3.1 | line 10629, head `234` at line 10604 | p. 234 correct |
| L3 | 6.3 / 8.1 / 8.2 / 8.4 locator | `milne-cft` VIII Thm 6.3 | line 11619, head `252` at line 11607 | p. 252 correct |
| E1 | 4.1 Check: embedding value (~35) | `φ = (1+√5)/2 ≈ 1.618` | `(w'.comap σ).embedding θ = 1 − φ = (1 − √5)/2 ≈ −0.618` | Other real place |
| E2 | 4.1 Check: absolute value (~35) | `comap_apply` | `w'(σθ) = ‖1 − φ‖ = (√5 − 1)/2 ≈ +0.618` | As stated |
| D1 | Localization bullet: file list (~35) | 19 names | All in `Localization`, `Operations`, `Discriminant`, `CompletionTower` | Exact |
| D2 | Dropped names (~35) | `formClass_atFinitePlace`, `formClass_atRealPlace` | 0 README occurrences | Nothing dangling |
| D3 | Contract: finite place (~35) | `Hyperbolicity.lean:139` | `m • H_K` gives `m • H_{K_v}` at every `v` | Matches |
| D4 | Contract: real place (~35) | `Hyperbolicity.lean:79` | `[Invertible 2]` by `invertibleTwo`; `m • H_ℝ` at every real `w` | Matches |
| D5 | 8.2 route in Lean (~35) | `K : Type u`, 6.3 as hypothesis | `Quotient.exists_rep`, `formClass_presentedForm`, D3, D4, `formClass_eq_iff`: no error | Complete |
| D6 | 8.2, `m = 2` (~35) | `⟨1,−1,2,−2⟩` over `ℚ` | rank `4`; `d = [1]`; `s_v = (−1,−1)_v`; index `2` | Hyperbolic |
| D7 | 8.2, `m = 0` (~35) | Zero form on `Fin 0 → ℚ` | class `0 = 0 • H` | Trivial |
| D8 | 8.2, negative control (~35) | `⟨1,1⟩` over `ℚ` | real index `2 ≠ 1` | Route does not start |
| D9 | 8.2 locators (~35) | `milne-cft` | Thm 6.3 line 11619 (p. 252); Prop 6.2 line 11574 (p. 251) | Correct |
| C1 | Contract: `normUnits` (~35, from ~33) | `ℚ(i)/ℚ`, `x = 2 + i` | `(2+i)(2−i) = 5` | Matches |
| C2 | Surjectivity in any universes (~35, from ~33) | `K : Type u`, `L : Type v` | `u_1`, `u_2` independent | Matches |
| C3 | 4.2 steps 3–4 (~35, from ~33) | cyclic `K(√a)` | index `1`, so `2 ≤ 1` is false | Holds |
| C4 | 4.2 step 2 (~35, from ~33) | `a = b²` in `K_v` | `K_v ⊗ E ≅ K_v × K_v`; `N(c,1) = c` | Range `⊤` |
| C5 | Negative control (~35, from ~33) | `ℚ`, `a = 2`, `v = 3` | `3` is not a norm from unramified `ℚ₃(√2)` | No finite `S` |
| C6 | `L = K` (~35, from ~33) | `finrank 1` | `1 ≤ 1` | Consistent |
| C7 | `σθ = 1 − θ` (~35, from ~33) | `θ² = θ + 1` | `(1−θ)² = 2 − θ = (1−θ) + 1` | Automorphism |
| C9 | 4.1 indices (~35, from ~33) | `Q = ⟨1,θ,θ⟩` | `σQ` at `w'`: 1; `Q` at `w'`: 3 | Follows `σ` |
| C11 | Inverse correspondence (~35, from ~33) | `σ` involutive | `w'.comap σ.symm` ill-typed when `K ≠ K'` | No change |
| C12 | `σQ` coefficients (~35, from ~33) | `K'` acts through `σ⁻¹` | `y₁² + (1−θ)y₂² + (1−θ)y₃²` | As stated |
| M1 | Map 4.4, complex (~35, from ~32) | `ℚ(i)`, `(−1,−1)` | `−1 = i² − (−1)·0²` gives `1` | Holds |
| M2 | Complex vs real (~35, from ~32) | `(−1,−1)` | `ℝ`: `−1`; `ℂ`: `1` | Separate line |
| M3 | No complex place (~35, from ~32) | `ℚ` | clause vacuous | Consistent |
| M4 | Product with complex factor (~35, from ~32) | `ℚ(i)` | all `1` | Agree |
| M5 | Universe mark (~35, from ~32) | `ArchimedeanSymbol.lean:95` | `Type u_1` | Polymorphic |
| M6 | Symbols bullet (~35, from ~32) | `ArchimedeanSymbol.lean:167` | listed | Correct file |
| N1 | "in `Type`" lines (~35, from ~30) | `K` binders | `{K : Type}` | Correct |
| N2 | Unmarked lines (~35, from ~30) | `K` binders | `Type u` / `Type*` | Polymorphic |
| N3 | 4.4 real clause (~35, from ~30) | `(−1,−1)`; `(−1,2)` | `−1`; `1` | Holds |
| N4 | 71:19a (~35, from ~30) | `b = −1`, `S = {3}`, `a = −3` | `−1, −1, 1` at `ℝ, 3, 2` | Holds |
| N5 | 71:19 (~35, from ~30) | `S = {2}`, `T = {∞}` | `(−1,−1)` is `−1` at 2 and `∞` | Holds |
| N6 | Hasse product (~35, from ~30) | `⟨−1,−1⟩` | product `1` | Holds |
| N7 | Positive rank (~35, from ~30) | Zero form | fails `1 ≤ rank` | Needed |
| 1 | Discriminant convention (~35, from ~30) | `H`, `⟨1,1⟩` | `[−1]`, `[1]` | Distinguished |
| 2 | Hasse convention (~35, from ~30) | `H` over `ℝ` | `i<j`: `1`; `i≤j`: `−1` | Distinguished |
| 3 | Real Hasse sign (~35, from ~30) | `q = 0..4` | `1, 1, −1, −1, 1` | Separated |
| 4 | 4.1 transport (~35, from ~30) | `ℚ(i)` | `2+i ≡ 4 mod (2−i)` | Follows `σ` |
| 5 | 4.1, 71:19a (~35, from ~30) | `S = {5}` | `−1 = 2²` in `ℚ₅` | Hypothesis needed |
| 6 | 4.1, 71:19 (~35, from ~30) | `S = {3}`, `T = ∅` | odd count | Parity needed |
| 7 | 4.2 (~35, from ~30) | `ℚ(i)`, `a = −1` | `−1 = i²` | Both true |
| 8 | 4.2 (~35, from ~30) | `ℚ`, `a = −7` | nonsquare at 3 | Hypothesis fails |
| 9 | 4.2 exponent (~35, from ~30) | `16`, `n = 8` | `√2 ∉ ℚ` | Analogue false |
| 10 | 4.3 (~35, from ~30) | `d = 5`, `a = −1` | `2² − 5 = −1` | Both true |
| 11 | 4.3 (~35, from ~30) | `d = 3`, `a = −1` | `(3,−1)₃ = −1` | Both false |
| 12 | 5.1 binary (~35, from ~30) | `⟨1,−2⟩` | anisotropic at `ℚ₃` | False |
| 13 | 5.1 ternary (~35, from ~30) | `⟨1,1,−7⟩` | `(−1,7)₇ = −1` | Both false |
| 14 | 5.1 ternary (~35, from ~30) | `⟨1,1,−5⟩` | `1 + 4 − 5 = 0` | Both true |
| 15 | 5.5 (~35, from ~30) | rank 0, 1 | anisotropic | Both false |
| 16 | 5.5 (~35, from ~30) | `⟨1,1,1,−7⟩` | misses 7 in `ℚ₂` | Both false |
| 17 | 5.5 (~35, from ~30) | `⟨1,1,1,−1⟩` | `1 − 1 = 0` | Both true |
| 18 | 5.5 route (~35, from ~30) | `U = ⟨1,1⟩` | `x = 0` singular | `U(x) ≠ 0` needed |
| 19 | 6.1 (~35, from ~30) | `⟨1,1,1⟩`, `a = 7`; `a = 3` | missed at `ℚ₂`; `1+1+1` | False; true |
| 20 | 6.1 (~35, from ~30) | `a = 0` | zero vector | Both true |
| 21 | 6.2 (~35, from ~30) | `⟨1,7⟩` into `⟨1,1,1⟩` | missed at `ℚ₂` | Both false |
| 22 | 6.2 (~35, from ~30) | `⟨1,2⟩` into `⟨1,1,1⟩` | `(0,1,1) ↦ 2` | Both true |
| 23 | 6.2 Check (~35, from ~30) | `⟨c⟩` into `H` | `((1+c)² − (1−c)²)/4 = c` | Holds |
| 24 | 6.3 (~35, from ~30) | `⟨1,3⟩` / `⟨1,1⟩` | `[3] ≠ [1]` at `ℚ₃` | False |
| 25 | 7.2 (~35, from ~30) | `n = 2`, `d = [−1]` | all `s_v = 1` | `V = H` |
| 26 | 7.2 Check (~35, from ~30) | `⟨−1,−1,−1⟩` | `s₂ = −1` | Holds |
| 27 | 7.3 (~35, from ~30) | `(2,[1],−1 at 2,3)` | `⟨3,3⟩` | Realized |
| 28 | 7.3 (~35, from ~30) | zero record | rank `0` | Not admissible |
| 29 | 7.3 route (~35, from ~30) | `ℚ(√5)` | returns `I` | Reaches `I` |
| 30 | 7.4 / 8.1 (~35, from ~30) | `⟨3,3⟩` / `⟨1,1⟩` | `s₂, s₃` differ | Not isometric |
| 31 | 8.1 (~35, from ~30) | `⟨1,2,2⟩` / `⟨1,1,1⟩` | same invariants | Isometric |
| 32 | 8.1 (~35, from ~30) | zero forms | ranks `0,0` | True |
| 33 | 8.2 (~35, from ~30) | `⟨1,1,−3,−3⟩` | `s` differs at 2, 3 | Not hyperbolic |
| 34 | 8.2 (~35, from ~30) | `⟨1,−1,2,−2⟩` | `d = [1]` | Hyperbolic |
| 35 | 8.3 (~35, from ~30) | `⟨1,1,−3,−3⟩`; `H` | nonzero; zero | As stated |
| 36 | 8.3 complex (~35, from ~30) | `W(ℂ) = ℤ/2` | even dimension | Adds nothing |
| 37 | 8.4 (~35, from ~30) | `⟨1,2,2⟩`, `⟨1,1,1⟩` | same invariants | Isometric |
| 38 | Worked example (~35, from ~30) | `ℚ(√5)`, `⟨1,θ,θ⟩` | indices 3, 1 | Matches |

**Ownership.** The change set creates no object in this folder. Ownership against the open pull requests was checked through `roadmaps overlaps`, as in the previous report.

**Remarks on untouched text.** These are not findings, and no change is asked for.
- The `Suggested.lean` docstring lists 8.2 neither among the stated headlines nor among the unstated ones. Earlier reviews passed this.
- The Milne source issues recorded by earlier rounds stand.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is settled as `uncertified` (paywalled, cited by its locator). No O'Meara locator changed.
- Serre, *A Course in Arithmetic*, is settled as `uncertified`. No Serre locator changed.
- I did not build `Completed/LocalGaloisGroups/Suggested.lean`, because that command is outside this review's brief. I checked its new names at the pin by declaration, as above.

## Source issues

- none
