# Review of GlobalQuadraticForms (pull request #1215 at c1d130b)

**Verdict:** needs changes

This is an incremental re-review of 51 changed lines since `b5b3cde`.

**What changed in this folder.** Commit `c1d130b8` changes only `TauCetiRoadmap/GlobalQuadraticForms/README.md` (+31/−20), in four places:
- The Localization bullet of the Tau Ceti contract (lines 224–240) no longer lists `Classification.lean`, `QuadraticForm.formClass_atFinitePlace` or `QuadraticForm.formClass_atRealPlace`.
- The "Form classes, hyperbolicity and Witt rings" bullet (lines 388–413) adds `QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass` and `QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass`.
- The `ℚ(√5)` real-place Check of 4.1 (lines 559–567) is reworded. This is the repair of the previous R03.
- The 8.2 route (lines 1096–1105) and its *Needs:* line (lines 1121–1129) now build the global form `m · H` as `TauCeti.presentedForm p` and cite the two new lemmas.

`Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged since `b5b3cde`, and the pins are main's.

The previous R03 is repaired. The changed 8.2 route is complete at the pins: I elaborated it as a Lean `example`, with 6.3 taken as a hypothesis. The new contract citations exist at the pin with the stated hypotheses. The two P3 findings about the pull request as a whole are still not repaired. No repair report marks either one not actionable. Both are restated below, with their witnesses updated to this head.

## R01 (P3) — The conflicting revision #1200 of this roadmap is still open, and no order is stated

**Location.** The pull-request description (title "ClassFieldTheory: correct hypotheses, conductors and lifting"), together with `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` as a whole.

**Claim.** Not repaired. This was R01 at `c4ff4fc`, `7498694`, `293f615`, `f0ebef6`, `7fd8d8c` and `b5b3cde`.
- This pull request rewrites GlobalQuadraticForms, but its description still names only ClassFieldTheory.
- #1200 ("Fix rank-four discriminant sign comparison") has moved from `3219a96` to `8fe49f4` and still changes the same two files.
- The two branches keep repairing the same text in parallel. This round's commit makes the same two repairs as #1200's last two commits, worded slightly differently:
  - `3219a96`: "8.2 cites the pinned nsmul_hyperbolicClass localization lemmas and the presented form";
  - `8fe49f4`: "Localization contract no longer lists Classification.lean".
- The two heads still differ in substance. In #1200's `Suggested.lean`:
  - line 132 declares `equivalent_of_locallyEquivalent`;
  - line 147 states 8.3 with `[Invertible (2 : K)]`;
  - line 8 imports `Witt.BaseChange` instead of `WittLocalization`.

  This head has none of these. #1200's manifest pins Tau Ceti `358314d` and Mathlib `f6090c7`, while this head pins main's `2fd255d` and `1b1ccf4`.

**Witness.**
- `git merge-tree --write-tree HEAD 8fe49f4` reports "CONFLICT (content)" in `README.md` and in `Suggested.lean`.
- `git merge-base --is-ancestor` fails in both directions.
- `git diff --stat HEAD 8fe49f4 -- TauCetiRoadmap/GlobalQuadraticForms` prints 240 changed lines in the README and 45 in `Suggested.lean`.

**Repair.** State in the description that this pull request revises GlobalQuadraticForms and supersedes #1200, then close #1200. If anything of #1200 is wanted, carry it over first: its 8.4 declaration, for example, would need deciding against this head's docstring, which says 8.4 "is not stated separately". If both pull requests are kept, state which merges first and rebase the other on it. Test: after the repair, `roadmaps overlaps GlobalQuadraticForms` lists no other open pull request that changes this roadmap.

## R02 (P3) — A change outside the folders this pull request is named for

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`: 112 changed lines (62 insertions, 50 deletions), from commit `1abcd32c` ("ClassFieldTheory: review repairs with consumers kept building").

**Claim.** Not repaired. This was R02 at `c4ff4fc`, `7498694`, `293f615`, `f0ebef6`, `7fd8d8c` and `b5b3cde`.
- This review's brief names three folders as the pull request's own: ClassFieldTheory, QuadraticFormInvariants and GlobalQuadraticForms.
- The open-PR index lists #1215 as "LocalGaloisGroups, ClassFieldTheory, GlobalQuadraticForms, QuadraticFormInvariants", but neither the description nor the brief names LocalGaloisGroups. That edit therefore gets no review of its own.
- The gate's `outside-folder` check reports only `TauCetiRoadmap/` folders, so it does not flag this file.

**Witness.** At `c1d130b`, with the three named folders excluded, `git diff --stat origin/main...HEAD` prints `Completed/LocalGaloisGroups/Suggested.lean | 112 ++++…---`.

**Repair.** Either keep the edit or drop it:
- Keep it: name `Completed/LocalGaloisGroups` in the description as a folder this pull request changes, as a consumer updated to keep building after the ClassFieldTheory renames. It then gets a review of its own.
- Drop it: revert the edit and keep the ClassFieldTheory names that file imports.

Test: the same `git diff --stat` then lists nothing, or only folders the description names.

## Previous findings

- R01 — not repaired: the description still names only ClassFieldTheory. #1200, now at `8fe49f4`, still changes `README.md` and `Suggested.lean` here and conflicts with `c1d130b` in both. No order is stated.
- R02 — not repaired: `git diff --stat origin/main...HEAD` outside the three named folders still lists `Completed/LocalGaloisGroups/Suggested.lean | 112`, and the description does not name it.
- R03 — repaired: README:560–563 now reads "sends `θ` to the image of `σθ` under the real embedding of `w'`, which is `1 - (1 + √5)/2 = (1 - √5)/2`". It then gives the absolute value separately, as the positive `(√5 - 1)/2`. Both values are correct (rows E1 and E2).

## Verified sound

**Change set.**
- `git diff --stat b5b3cde HEAD` lists one file, `TauCetiRoadmap/GlobalQuadraticForms/README.md` (+31/−20).
- `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty.

**The Localization bullet (lines 224–240).** I located all 19 names it still cites at the pin, each in one of the four files it now lists:
- `Localization.lean`: lines 43, 67, 90, 96, 105, 169, 177, 198, 207, 265 and 278;
- `Operations.lean`: lines 41, 53, 180, 188, 212 and 222;
- `Discriminant.lean:42`;
- `CompletionTower.lean:217`.

None of them is in `Global/Classification.lean`, so dropping that file is correct. The two dropped lemmas still exist at the pin (`Classification.lean:87`, `Localization.lean:230`), but the README no longer names them anywhere: grep finds 0 occurrences. So no citation is left dangling. `Classification.lean` is still listed, correctly, in the bullets at lines 264, 270, 332 and 374, for other names.

**The new contract citations (lines 398–401).** I elaborated them with `#check @` at the pin:
- `QuadraticForm.formClass_atFinitePlace_eq_nsmul_hyperbolicClass` (`Global/Hyperbolicity.lean:139`) has binders `[Field K] [NumberField K]` and the hypothesis `h : formClass Q hQ = m • hyperbolicClass K`. Its conclusion is that the class of `Q.atFinitePlace v` is `m • hyperbolicClass (v.adicCompletion K)` at every `v`.
- `QuadraticForm.formClass_atRealPlace_eq_nsmul_hyperbolicClass` (`Hyperbolicity.lean:79`) has binders `[Field K] [Invertible (2 : K)]` and the same hypothesis. Its conclusion is `m • hyperbolicClass ℝ` at every `w : {w // w.IsReal}`.
- The README's gloss ("a regular form whose class over `K` is `m` times the hyperbolic class has `m` times the hyperbolic class at every finite place and, along the real embedding, at every real place") is exact.
- The `Invertible 2` instance is Mathlib's `invertibleTwo` (`Algebra/CharP/Invertible.lean:125`, for a `DivisionSemiring` of `CharZero`), as Conventions line 112 says.
- Both lemmas are universe-polymorphic (`K : Type u_1`), so the count of eight `Type`-only inputs (lines 155–167) stands.
- `Hyperbolicity.lean` and `RegularFormClass/Basic.lean` are both in the bullet's file list (lines 389–390).
- `TauCeti.nondegenerate_presentedForm` (`RegularFormClass/Basic.lean:145`, `[Invertible (2 : K)]`) and `TauCeti.formClass_presentedForm` (`Basic.lean:703`, conclusion `formClass (presentedForm p) _ = ⟦p⟧`) are as the route uses them.

**The 8.2 route, checked in Lean.** One scratch file, elaborated with `lake env lean` from the worktree, has no errors. Besides the `#check @` lines above, it contains an `example` with:
- variables `K : Type u` (a number field), `V : Type v` (finite-dimensional), `Q` regular and `m : ℕ`;
- hypotheses that every finite localization has class `m • H_v` and every real one `m • H_ℝ` (the left side of `locally_formClass_eq_nsmul_hyperbolicClass_iff`), and 6.3 for `Q` against every `presentedForm p`;
- the conclusion `formClass Q hQ = m • hyperbolicClass K`.

The proof follows the README's steps in order:
1. `Quotient.exists_rep` gives `p`.
2. `formClass_presentedForm` gives the class of `presentedForm p`.
3. The two transfer lemmas, together with `formClass_eq_iff` at each completion, give `Q.LocallyEquivalent (presentedForm p)`. That is a conjunction over finite and real places (`Predicates.lean:147`).
4. 6.3 and `formClass_eq_iff` over `K` finish.

So the repaired route is complete given 6.3, and every lemma it cites is on its *Needs:* line. `TauCeti.presentedForm` itself is not on that line, but it comes with the two `presentedForm` lemmas from the same file. I do not count it as a missing input.

**Text that depends on the change.**
- 8.3 (lines 1138–1162) uses 8.2 only through "8.2 makes the form a sum of hyperbolic planes", which is unchanged.
- The Layer 8 Dependencies line ("Tau Ceti's Witt ring and hyperbolicity criteria") covers the new names.
- The 4.1 transport law (item 2, lines 459–463) still says "real embedding" throughout, and the reworded Check now matches it.

**Gate and supply direction.**
- The worker's gate at `c1d130b` reports "Every check passed", including the targeted build.
- My own run of the gate fails only on `outside-folder=5`. The five files are in the pull request's own ClassFieldTheory and QuadraticFormInvariants folders, so they are not findings. Every other count is 0.
- The dependency check prints exactly `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `roadmaps resolve` (the worker's run) finds no unresolved citation. I checked the Tau Ceti names by hand, as above.
- `roadmaps overlaps`:
  - no dropped id in either direction;
  - no id that only an open revision defines;
  - #1200 is the only other pull request changing this roadmap (R01).

**Lean.**
- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` gives exactly 8 warnings, all "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- The file is unchanged, so the following carry over:
  - the elaborated signatures (the worker's listing: no lost section binder, and `FiniteDimensional` wherever `V` or `W` occurs);
  - the one-tactic probe, which closes none of the 8 declarations;
  - the headline list: 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3 stated, and 8.4 named in the docstring as the reverse direction of 6.3.

**Ownership and duplication.** The change creates no object. It cites four pinned Tau Ceti declarations in place of two others. Building `m · H` from a presentation reuses Tau Ceti's carrier instead of planning a new one.

**Seeded sample.** Of the sampled targets, only 4.1 (a Check) and 8.2 (its route and *Needs:* line) fall in the changed lines.
- I re-read 8.2's locators in `milne-cft`:
  - Theorem 6.3 (Hasse–Minkowski for equivalence of forms over a number field, for all primes `v`) is at `milne-cft` line 11619, on the page with running head "252" (line 11607).
  - Proposition 6.2 (Witt cancellation for isometric subspaces with nondegenerate `U`) is at line 11574, on the page with running head "251" (line 11558).

  Both page numbers in the README are correct. Milne's "all primes" includes the complex places, where two regular forms of the same rank are isometric, so the README's "every finite and every real place" loses nothing.
- 4.1's new wording adds no locator.
- The other sampled targets (4.2, 4.3, 5.1, 5.5, 6.1–6.3, 7.2–7.4, 8.1, 8.3, 8.4) are untouched, and the checks of the previous reviews stand.

**Adversarial table.**
- Rows E1–E2 and D1–D9 are new and test the changed passages.
- Rows C1–C7, C9, C11 and C12 are carried from the previous review (`PRREVIEW-GlobalQuadraticForms~33`, at `b5b3cde`). Rows C8 and C10 there tested the old Check wording and are replaced by E1 and E2.
- Rows M1–M6, N1–N7 and 1–38 are carried from `~33`, which carried them from `~32` and `~30`. They cover statements the diff leaves untouched, at unchanged pins.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| E1 | 4.1 Check: embedding value | `φ = (1+√5)/2 ≈ 1.618` | `comap_embedding_of_isReal`: `(w'.comap σ).embedding θ = w'.embedding (1 − θ) = 1 − φ = (1 − √5)/2 ≈ −0.618` | Stated so at line 561; it is the other real place |
| E2 | 4.1 Check: absolute value | `comap_apply` | `(w'.comap σ) θ = w' (σθ) = ‖1 − φ‖ = (√5 − 1)/2 ≈ +0.618` | Stated so at line 563, labelled as an absolute value |
| D1 | Localization bullet: file list | 19 names | All in `Localization`, `Operations`, `Discriminant`, `CompletionTower`; 0 in `Classification` | File list exact |
| D2 | Dropped names | `formClass_atFinitePlace`, `formClass_atRealPlace` | Exist at `Classification.lean:87`, `Localization.lean:230`; 0 README occurrences | Nothing dangling |
| D3 | New contract: finite place | `Hyperbolicity.lean:139` | `h : formClass Q hQ = m • H_K` gives `m • H_{K_v}` at every `v` | Matches lines 398–401 |
| D4 | New contract: real place | `Hyperbolicity.lean:79` | `[Invertible 2]` by `invertibleTwo` (`CharZero`); gives `m • H_ℝ` at every real `w` | Matches |
| D5 | 8.2 route in Lean | `K : Type u`, 6.3 as hypothesis | `Quotient.exists_rep`, `formClass_presentedForm`, D3, D4, `formClass_eq_iff`: no error | Route complete |
| D6 | 8.2, `m = 2` | `⟨1,−1,2,−2⟩` over `ℚ` | rank `4 = 2·2`; `d = [4] = [1] = 2·[−1]`; `s_v = (−1,2)(−1,−2)(2,−2) = (−1,−1)_v = (−1,−1)_v^{C(2,2)}`; index `2`; `p = ⟨1,−1,1,−1⟩` | Hyperbolic, as the Check says |
| D7 | 8.2, `m = 0` | Zero form on `Fin 0 → ℚ` | rank `0`; `p = ⟨0, Fin.elim0⟩`; class `0 = 0 • H` | Holds trivially |
| D8 | 8.2, negative control | `⟨1,1⟩` over `ℚ` | `m = 1` forced by rank; real index `2 ≠ 1`, so the right side of `locally_…_iff` fails | Route does not start; matches Check |
| D9 | 8.2 locators | `milne-cft` | Thm 6.3 line 11619 under head 252; Prop 6.2 line 11574 under head 251 | Correct |
| C1 | Contract: `normUnits` (~33) | `ℚ(i)/ℚ`, `x = 2 + i` | `Sˣ →* Rˣ`; `(2+i)(2−i) = 5` | Matches |
| C2 | Surjectivity in any universes (~33) | `K : Type u`, `L : Type v` | `u_1`, `u_2` independent | Matches |
| C3 | 4.2 steps 3–4 (~33) | `K L : Type`, cyclic | index `1`, `finrank ≤ 1`; for `K(√a)`, `2 ≤ 1` | Holds (Lean) |
| C4 | 4.2 step 2 (~33) | `a = b²` in `K_v` | `K_v ⊗ E ≅ K_v × K_v`; `N(c,1) = c` | Range `⊤` |
| C5 | Negative control (~33) | `ℚ`, `a = 2`, `v = 3` | `ℚ₃(√2)` unramified; `3` not a norm | No finite `S` |
| C6 | `L = K` (~33) | `finrank 1` | Norm the identity; `1 ≤ 1` | Consistent |
| C7 | `σθ = 1 − θ` (~33) | `θ² = θ + 1` | `(1−θ)² = 2 − θ = (1−θ) + 1` | Automorphism |
| C9 | 4.1 indices (~33) | `Q = ⟨1,θ,θ⟩` | `σQ` at `w'`: `⟨1,ψ,ψ⟩`, index 1; `Q` at `ψ`-place: 1; `Q` at `w'`: 3 | Follows `σ` |
| C11 | Inverse correspondence (~33) | `σ` involutive | `w'.comap σ.symm` ill-typed when `K ≠ K'` | No change |
| C12 | `σQ` coefficients (~33) | `K'` acts through `σ⁻¹` | `y₁² + (1−θ)y₂² + (1−θ)y₃²` | As stated |
| M1 | Map 4.4, complex (~32) | `ℚ(i)`, `(−1,−1)` | `−1 = i² − (−1)·0²` gives `1` | Holds |
| M2 | Complex vs real (~32) | `(−1,−1)` | `ℝ`: `−1`; `ℂ`: `1` | Separate line |
| M3 | No complex place (~32) | `ℚ` | Clause vacuous | Consistent |
| M4 | Product with complex factor (~32) | `ℚ(i)` | All `1` | Agree |
| M5 | Universe mark (~32) | `ArchimedeanSymbol.lean:95` | `Type u_1` | Polymorphic |
| M6 | Symbols bullet (~32) | `ArchimedeanSymbol.lean:167` | Listed | Correct file |
| N1 | "in `Type`" lines (~30) | `K` binders | `{K : Type}` | Correct |
| N2 | Unmarked lines (~30) | `K` binders | `Type u` / `Type*` | Polymorphic |
| N3 | 4.4 real clause (~30) | `(−1,−1)`; `(−1,2)` | `−1`; `1` | Holds |
| N4 | 71:19a (~30) | `b = −1`, `S = {3}`, `a = −3` | `−1, −1, 1` at `ℝ, 3, 2` | Holds |
| N5 | 71:19 (~30) | `S = {2}`, `T = {∞}` | `(−1,−1)` is `−1` at 2, `∞` | Holds |
| N6 | Hasse product (~30) | `⟨−1,−1⟩` | Product `1` | Holds |
| N7 | Positive rank (~30) | Zero form | Fails `1 ≤ rank` | Needed |
| 1 | Discriminant convention (~30) | `H`, `⟨1,1⟩` | Plain `[−1]`, `[1]` | Distinguished |
| 2 | Hasse convention (~30) | `H` over `ℝ` | `i<j`: `1`; `i≤j`: `−1` | Distinguished |
| 3 | Real Hasse sign (~30) | `q = 0..4` | `1, 1, −1, −1, 1` | Separated |
| 4 | 4.1 transport (~30) | `ℚ(i)` | `2+i ≡ 4 mod (2−i)` | Follows `σ` |
| 5 | 4.1, 71:19a (~30) | `S = {5}` | `−1 = 2²` in `ℚ₅` | Hypothesis needed |
| 6 | 4.1, 71:19 (~30) | `S = {3}`, `T = ∅` | Odd count | Parity needed |
| 7 | 4.2 (~30) | `ℚ(i)`, `a = −1` | `−1 = i²` | Both true |
| 8 | 4.2 (~30) | `ℚ`, `a = −7` | Nonsquare at 3 | Hypothesis fails |
| 9 | 4.2 exponent (~30) | `16`, `n = 8` | `√2 ∉ ℚ` | Analogue false |
| 10 | 4.3 (~30) | `d = 5`, `a = −1` | `2² − 5 = −1` | Both true |
| 11 | 4.3 (~30) | `d = 3`, `a = −1` | `(3,−1)₃ = −1` | Both false |
| 12 | 5.1 binary (~30) | `⟨1,−2⟩` | Anisotropic at `ℚ₃` | False |
| 13 | 5.1 ternary (~30) | `⟨1,1,−7⟩` | `(−1,7)₇ = −1` | Both false |
| 14 | 5.1 ternary (~30) | `⟨1,1,−5⟩` | `1 + 4 − 5 = 0` | Both true |
| 15 | 5.5 (~30) | Rank 0, 1 | Anisotropic | Both false |
| 16 | 5.5 (~30) | `⟨1,1,1,−7⟩` | Misses 7 in `ℚ₂` | Both false |
| 17 | 5.5 (~30) | `⟨1,1,1,−1⟩` | `1 − 1 = 0` | Both true |
| 18 | 5.5 route (~30) | `U = ⟨1,1⟩` | `x = 0` singular | `U(x) ≠ 0` needed |
| 19 | 6.1 (~30) | `⟨1,1,1⟩`, `a = 7`; `3` | Missed at `ℚ₂`; `1+1+1` | False; true |
| 20 | 6.1 (~30) | `a = 0` | Zero vector | Both true |
| 21 | 6.2 (~30) | `⟨1,7⟩` into `⟨1,1,1⟩` | Missed at `ℚ₂` | Both false |
| 22 | 6.2 (~30) | `⟨1,2⟩` into `⟨1,1,1⟩` | `(0,1,1) ↦ 2` | Both true |
| 23 | 6.2 Check (~30) | `⟨c⟩` into `H` | `((1+c)² − (1−c)²)/4 = c` | Holds |
| 24 | 6.3 (~30) | `⟨1,3⟩`/`⟨1,1⟩` | `[3] ≠ [1]` at `ℚ₃` | False |
| 25 | 7.2 (~30) | `n = 2`, `d = [−1]` | All `s_v = 1` | `V = H` |
| 26 | 7.2 Check (~30) | `⟨−1,−1,−1⟩` | `s₂ = −1` | Holds |
| 27 | 7.3 (~30) | `(2,[1],−1 at 2,3)` | `⟨3,3⟩` | Realized |
| 28 | 7.3 (~30) | Zero record | Rank `0` | Not admissible |
| 29 | 7.3 route (~30) | `ℚ(√5)` | Returns `I` | Reaches `I` |
| 30 | 7.4 / 8.1 (~30) | `⟨3,3⟩`/`⟨1,1⟩` | `s₂, s₃` differ | Not isometric |
| 31 | 8.1 (~30) | `⟨1,2,2⟩`/`⟨1,1,1⟩` | Same invariants | Isometric |
| 32 | 8.1 (~30) | Zero forms | Ranks `0,0` | True |
| 33 | 8.2 (~30) | `⟨1,1,−3,−3⟩` | `s` differs at 2, 3 | Not hyperbolic |
| 34 | 8.2 (~30) | `⟨1,−1,2,−2⟩` | `d = [1]` | Hyperbolic |
| 35 | 8.3 (~30) | `⟨1,1,−3,−3⟩`; `H` | Nonzero; zero | As stated |
| 36 | 8.3 complex (~30) | `W(ℂ) = ℤ/2` | Even dimension | Add nothing |
| 37 | 8.4 (~30) | `⟨1,2,2⟩`, `⟨1,1,1⟩` | Same invariants | Isometric |
| 38 | Worked example (~30) | `ℚ(√5)`, `⟨1,θ,θ⟩` | Indices 3, 1 | Matches |

**Remarks on untouched text.** These are not findings, and no change is asked for.
- The `Suggested.lean` docstring lists 8.2 neither among the stated headlines nor among the unstated ones. Earlier reviews passed this, and the file is unchanged.
- The Milne source issues recorded by earlier rounds stand. I found no new ones.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is settled as `uncertified` (paywalled, cited by its locator). The changed lines add no O'Meara locator.
- Serre, *A Course in Arithmetic*, is settled as `uncertified`.
- I checked ownership against open pull requests through `roadmaps overlaps` and `roadmaps grep` over the open heads, not by reading every sibling checkout. The change creates no new object.

## Source issues

- none
