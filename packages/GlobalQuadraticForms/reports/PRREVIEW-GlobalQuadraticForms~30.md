# Review of GlobalQuadraticForms (pull request #1215 at f0ebef6)

**Verdict:** needs changes

This is an incremental re-review of 37 changed lines since `293f615`.

**What changed in this folder.** Commit `d587e530` rewords the section and name map in
`TauCetiRoadmap/GlobalQuadraticForms/README.md`, lines 53–82. Each line now says which Tau Ceti
declarations its id resolves to.
- The repair is correct. Every name resolves at the pin, every "in `Type`" mark matches the
  declaration, and the old numbering it maps is main's.
- `roadmaps overlaps` now reads the map as an old → new mapping. It no longer lists "Layer 3" as an
  id this pull request drops, so the remark of the previous review is closed.

**Other changes.** Commit `f0ebef6e` changes only `TauCetiRoadmap/ClassFieldTheory/README.md`. It does
not touch anything this roadmap consumes.

**Open findings.** Both P3 findings of the previous review concern the pull request as a whole, and
neither is repaired. No repair report marks either one not actionable.

## R01 (P3) — The conflicting revision #1200 of this roadmap is still open, and no order is stated

**Location.** The pull-request description (title "ClassFieldTheory: correct hypotheses,
conductors and lifting"); `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` as
a whole.

**Claim.** Not repaired. This was R01 at `c4ff4fc`, `7498694` and `293f615`.
- This pull request rewrites GlobalQuadraticForms, but its description still names only
  ClassFieldTheory.
- #1200 ("Fix rank-four discriminant sign comparison", head `5cb0012`) changes the same two files.
- The two heads still conflict.
- #1200's latest commit makes the same map repairs as this pull request ("Type-only map lines
  marked, … isAdmissible_globalInvariants mapped"). The two branches now carry the same repairs in
  parallel.
- #1200's fix, the rank-four real-place remark, is already at 7.2 here (README lines 927–929).

**Witness.** `git merge-tree --write-tree f0ebef6 5cb0012` reports "CONFLICT (content)" in
`README.md` and in `Suggested.lean`. Neither head is an ancestor of the other. #1200 declares
`equivalent_of_locallyEquivalent` (`Suggested.lean:132`) and
`injective_wittRing_baseChange_places [Invertible (2 : K)]` (line 147); this head has neither.

**Repair.** State in the description that this pull request revises GlobalQuadraticForms and
supersedes #1200, whose rank-four fix is at 7.2, lines 927–929 here, and close #1200. If both are
kept, state which merges first and rebase the other on it. Test: after the repair,
`roadmaps overlaps GlobalQuadraticForms` lists no other open pull request that changes this
roadmap.

## R02 (P3) — A change outside the folders this pull request is named for

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`: 112 changed lines (62 insertions, 50
deletions), from commit `1abcd32c` ("ClassFieldTheory: review repairs with consumers kept
building").

**Claim.** Not repaired. This was R02 at `c4ff4fc`, `7498694` and `293f615`.
- This review's brief names three folders as the pull request's own: ClassFieldTheory,
  QuadraticFormInvariants and GlobalQuadraticForms.
- The open-PR index lists LocalGaloisGroups among #1215's roadmaps, but neither the description
  nor the brief names it. So the edit gets no review of its own.
- The gate's `outside-folder` check reports only `TauCetiRoadmap/` folders, so it does not flag
  this file.

**Witness.** With the three named folders excluded, `git diff --stat origin/main...HEAD` prints
`Completed/LocalGaloisGroups/Suggested.lean | 112`. Commit `1abcd32c` is on this head and not on
`origin/main`.

**Repair.** Either keep the edit or drop it:
- Keep it: name `Completed/LocalGaloisGroups` in the description as a folder this pull request
  changes, a consumer updated to keep building after the ClassFieldTheory renames. It then gets a
  review of its own.
- Drop it: revert the edit and keep the ClassFieldTheory names that file imports.

Test: the same `git diff --stat` then lists nothing, or only folders the description names.

## Previous findings

- R01 — not repaired: the description still names only ClassFieldTheory. #1200 (head `5cb0012`)
  still changes `README.md` and `Suggested.lean` of this folder, still conflicts with `f0ebef6`,
  and no order is stated.
- R02 — not repaired: `git diff --stat origin/main...HEAD` outside the three named folders still
  lists `Completed/LocalGaloisGroups/Suggested.lean | 112` (commit `1abcd32c`), and the
  description does not name that folder.

## Verified sound

**Change set.**
- `git diff --stat 293f615 HEAD` lists two files:
  - `TauCetiRoadmap/GlobalQuadraticForms/README.md` (+20/−17);
  - `TauCetiRoadmap/ClassFieldTheory/README.md` (+32/−11).
- `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged. The Tau Ceti pin is
  `2fd255d`.

**The changed map lines (README 53–82).** I opened each named declaration at the pinned Tau Ceti.
All paths are under `TauCeti/NumberTheory/`.

| Map line | Declaration at the pin | `K` binder |
|---|---|---|
| Layer 0 | `QuadraticForm/Global/Localization.lean:90, 96, 105` (`atFinitePlace`, `atRealPlace`, `atComplexEmbedding`) | `Type u` (line 80) |
| Layer 0 | `QuadraticForm/Global/Predicates.lean:51, 85, 66, 147` (the four predicates) | `Type u` (line 45) |
| Layer 0 | `QuadraticForm/Global/ComplexPlaces.lean:66` | `Type u` (line 59) |
| Layer 1 | `QuadraticForm/Global/Signature.lean:84, 89, 343` | `Type u` (line 74) |
| Layer 2 | `QuadraticForm/Global/FiniteHasse.lean:79` | `Type u` (line 72) |
| Layer 2 | `QuadraticForm/Global/HasseSupport.lean:39` | `Type*` (line 34) |
| Layer 2 | `QuadraticForm/Global/Classification.lean:116` | `Type u` (line 81) |
| Layer 3 | `QuadraticForm/Global/Invariants.lean:90` (`GlobalFormInvariants`) and `:178` (`IsAdmissible`, seven fields) | `Type*` (line 83) |
| Layer 3 | `QuadraticForm/Global/FormInvariants.lean:77, 165` | `Type u` (line 71) |
| Layer 3 | `QuadraticForm/Global/ProductFormula.lean:117`, hypothesis `1 ≤ Module.finrank K V` | `Type` (line 100) |
| 4.4, product formula | `ProductFormula.lean:67` | `Type` (line 61) |
| 4.4, real symbol | `HilbertSymbol/Archimedean.lean:59`, over `ℝˣ` | — |
| 4.4, real symbol | `QuadraticForm/Global/ArchimedeanSymbol.lean:102` | `Type*` (line 95) |
| 4.4, 71:19a | `QuadraticForm/Global/SignPrescription.lean:154` | `Type` (line 72) |
| 4.4, 71:19 | `SignPrescription.lean:191` | `Type` (line 72) |
| 4.4, Hasse product | `ProductFormula.lean:107` | `Type` (line 100) |

- Exactly the five lines marked "in `Type`" are the `Type`-only declarations. Every unmarked line
  is universe-polymorphic.
- 4.1 item 3 (README lines 476–510) states each of those five for number fields in every universe,
  under the same names. So the map's sentence "for those, the statement in every universe is 4.1,
  item 3" holds.
- The Conventions paragraph (line 103) and the supplier-contract paragraph (lines 153–165) count
  the same eight `Type` inputs.

**Old numbering.** On main (`3090489`), `TauCetiRoadmap/GlobalQuadraticForms/README.md` has:
- §3.1, the invariant carrier (line 327);
- §3.2, admissibility (line 342);
- §3.3, the invariants of a global form are admissible (line 365);
- §4.4, Hilbert sign prescription and the Hasse product (line 443). Its contents are the localized
  product formula, the archimedean symbol, 71:19a, 71:19 and the Hasse product of one form.

The map sends 3.1, 3.2 and 3.3 to the right declarations. It gives a line to every item of old
§4.4 except the complex-place clause (see the remarks).

**Consumers of these ids** (`roadmaps grep`, 458 open heads and main). Each lands on a map line:
- GL2AutomorphicRepresentationsAndTransfer cites §4.4 `exists_hilbertSymbol_eq_neg_one_iff_pair`
  (README lines 408, 2265, 2275). It lands on the "pair" line, which names that former name.
- QuaternionArithmetic cites §4.4 for the product formula and sign prescription (lines 281, 619).
- GeometryOfNumbersAndQuadraticArithmeticPartII cites §4.4 (line 565).
- MetaplecticAutomorphicForms cites Layer 3 (line 1627) and Layer 4 (lines 428, 572). Layer 4
  still exists here.

`roadmaps overlaps GlobalQuadraticForms` lists no dropped id in either direction and no id that
only an open revision defines.

**ClassFieldTheory change.** It adds a former-section table and says that the idele–ideal
comparison is a supporting open target. GlobalQuadraticForms consumes
`TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap` and
`TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion` directly, and neither is
touched. ClassFieldTheory README line 203 (GlobalQuadraticForms owns Hasse–Minkowski) and line 2210
(§4.2 and §4.3 are the consumers) still agree with 4.2 and 4.3 here.

**Gate and supply direction.**
- The worker's gate at `f0ebef6` reports "Every check passed", including the targeted build.
- My own run fails only on `outside-folder=5`. The five files are in the pull request's own
  ClassFieldTheory and QuadraticFormInvariants folders, so these are not findings. Every other
  count is 0.
- The dependency check prints exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no
  UPWARD or CYCLE line.
- `roadmaps resolve` finds no unresolved citation and no unresolved Lean name.

**Lean.**
- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` gives exactly 8 warnings, all
  "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- I elaborated `#check @name` for all 8 declarations in one scratch file, with `pp.universes`.
  The results are those of the previous review, and nothing changed:
  - `K : Type u_1`, with `V` and `W` in independent universes;
  - `[FiniteDimensional K V]` and `[FiniteDimensional K W]` wherever `V` or `W` occurs;
  - explicit `QuadraticMap.Nondegenerate` hypotheses;
  - `Ne a 0` only in `represents_iff_locallyRepresents`;
  - `exists_globalForm_of_isAdmissible` concludes `∃ Q, ∃ hQ, Q.globalInvariants hQ = I`;
  - `injective_wittRing_baseChange_places` has no `Invertible 2` binder;
  - no section binder is lost.
- The file and the pins are unchanged, so the earlier one-tactic probe (none of the 8 closes) and
  the headline list carry over. 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3 are stated; 8.2 and 8.4
  are named in the docstring.

**Ownership.**
- `roadmaps grep --lean-only` for `namespace TauCetiRoadmap.GlobalQuadraticForms` and for the five
  headline theorem names finds only main, #1200 and #1215.
- No other roadmap declares these names or owns these objects.

**Seeded sample.** No sampled target is in the changed lines.
- The map cites 4.1 item 3, which I read in full (lines 476–510).
- I re-read five Milne statements in `milne-cft` and found each where the README cites it:
  - Thm 1.1 at line 10384;
  - Thm 3.1 at line 10629;
  - Thm 3.5 at line 10686;
  - Thm 6.3 at line 11619;
  - Thm 6.12 at line 11792.
- The README flags no locator as unverified.

**Adversarial table.** Rows 1–38 cover statements the diff leaves untouched. Each is carried from
the previous review (`PRREVIEW-GlobalQuadraticForms~28`, at `293f615`), whose values hold at
`f0ebef6`. Rows N1–N7 are new and test the claims the changed map lines make. N4 and N5 recompute
that review's 71:19a and 71:19 rows against the declarations the map now names.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| N1 | Map: "in `Type`" lines | `K` binders at the pin | `ProductFormula.lean:61, 100` and `SignPrescription.lean:72` read `{K : Type}`; the five marked lines name exactly these files' declarations | Marks correct |
| N2 | Map: unmarked lines | `K` binders at the pin | Seven files read `Type u` (Localization, Predicates, ComplexPlaces, Signature, FiniteHasse, Classification, FormInvariants); three read `Type*` (Invariants, HasseSupport, ArchimedeanSymbol); `hilbertSymbol_real` is over `ℝˣ` | Polymorphic, as stated |
| N3 | Map 4.4, real symbol | `ℝ`: `(−1,−1)`; `(−1,2)` | `−1 = x² + y²` has no solution, so `−1`; `2 = 1² + 1²`, so `1`. `hilbertSymbol_real` gives `−1` iff both are negative | Matches old §4.4's real clause |
| N4 | Map 4.4, 71:19a | `ℚ`, `b = −1`, `S = {3}`, `T = {∞}` | `−1` is a nonsquare mod 3 and negative at `∞`; `#S + #T = 2`. `a = −3`: `ℝ` gives `−1`; at 3, `(3,−1)₃ = (−1/3) = −1`; at 2, `ε(−3)ε(−1) = 0·1`, so `1` | Hypotheses and pattern hold |
| N5 | Map 4.4, 71:19 | `S = {2}`, `T = {∞}` | `(−1,−1)` is `−1` exactly at 2 and `∞` | Holds |
| N6 | Map 4.4, Hasse product | `⟨−1,−1⟩` over `ℚ` | `s_v = (−1,−1)_v`: `−1` at 2 and `∞`, `1` elsewhere; product `1` | Holds |
| N7 | Map Layer 3, positive rank | Zero form | Rank `0` fails `IsAdmissible.one_le_rank`, so `hn : 1 ≤ finrank` is needed | "of positive rank" is correct |
| 1 | Discriminant convention | `H`, `⟨1,1⟩` | Plain `[−1]`, `[1]`; signed `[1]`, `[−1]` | Distinguished |
| 2 | Hasse convention | `H` over `ℝ` | `i<j`: `(1,−1) = 1`; `i≤j`: `(1,1)(1,−1)(−1,−1) = −1` | Distinguished |
| 3 | Real Hasse `(−1)^(q(q−1)/2)` | `q = 0..4` | `1, 1, −1, −1, 1`; rank 4, `d = [1]`: `q ∈ {0,2,4}` gives `1, −1, 1` | `(4,0)` and `(0,4)` collide; rank ≤ 3 separated |
| 4 | 4.1 transport | `ℚ(i)`, conjugation | `2+i ≡ 4` mod `(2−i)`, a square there; `σ(2+i) = 2−i` is a square at `(2+i)` | Places follow `σ` |
| 5 | 4.1, 71:19a | `S = {5}` | `−1 = 2²` in `ℚ₅` | Nonsquare hypothesis needed |
| 6 | 4.1, 71:19 | `S = {3}`, `T = ∅` | Odd count | Parity hypothesis excludes it |
| 7 | 4.2 | `ℚ(i)`, `a = −1` | `−1 = i²`, a square at every `v` | Both true |
| 8 | 4.2 | `ℚ`, `a = −7` | Square in `ℚ₂`; nonsquare at 3 and at every `p` with `(p/7) = −1` | Hypothesis fails; conclusion false |
| 9 | 4.2, exponent | `16`, `n = 8` | `(−1/p)(2/p)(−2/p) = 1`, so 16 is an 8th power in every `ℚ_p`, `p` odd; `√2 ∉ ℚ` | 8th-power analogue false |
| 10 | 4.3 | `d = 5`, `a = −1` | `2² − 5·1² = −1` | Both true |
| 11 | 4.3 | `d = 3`, `a = −1` | `(3,−1)₃ = (−1/3) = −1` | Both false |
| 12 | 5.1 binary | `⟨1,−2⟩` over `ℚ`; over `ℚ(√2)` | Not isotropic in `ℚ₃`; `(√2)² − 2 = 0` | Both false; both true |
| 13 | 5.1 ternary | `⟨1,1,−7⟩` | `(−1,7)₇ = −1`, `(−1,7)₂ = −1`, `ℝ`: `1` | Both false |
| 14 | 5.1 ternary | `⟨1,1,−5⟩` | `1 + 4 − 5 = 0` | Both true |
| 15 | 5.5 | Rank 0, rank 1 | Anisotropic over `K` and over every `K_v` | Both false |
| 16 | 5.5 | `⟨1,1,1,−7⟩` | `⟨1,1,1⟩` misses exactly the class `−1 ≡ 7` in `ℚ₂` | Both false |
| 17 | 5.5 | `⟨1,1,1,−1⟩` | `1 + 0 + 0 − 1 = 0` | Both true |
| 18 | 5.5 route | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `x = (1,0)`: `b = 1`, `W(0,1,0) = −1`; `x = 0` gives the singular `⟨0⟩ ⊥ W` | `U(x) ≠ 0` needed |
| 19 | 6.1 | `⟨1,1,1⟩`, `a = 7`; `a = 3` | 7 is missed at `ℚ₂`; `1 + 1 + 1 = 3` | Both false; both true |
| 20 | 6.1 | `a = 0` | Zero vector on both sides | Both true; `a ≠ 0` serves the route |
| 21 | 6.2 | `⟨1,7⟩` into `⟨1,1,1⟩` | `⟨7⟩` not represented at `ℚ₂` | Both false |
| 22 | 6.2 | `⟨1,2⟩` into `⟨1,1,1⟩` | `e₁ ↦ 1`, `(0,1,1) ↦ 2`, orthogonal | Both true |
| 23 | 6.2 Check | `⟨c⟩` into `H` | `((1+c)² − (1−c)²)/4 = c` | Holds |
| 24 | 6.3 | `⟨1,3⟩` vs `⟨1,1⟩`; `⟨1,1⟩` vs `⟨2,2⟩` | `[3] ≠ [1]` at `ℚ₃`; `(x+y)² + (x−y)² = 2x² + 2y²` | Both false; both true |
| 25 | 7.2 | `ℚ`, `n = 2`, `d = [−1]`, `U_v = H` | All `s_v = 1`; real `q = 1` gives `1`; product `1` | `V = H` |
| 26 | 7.2 Check | `⟨−1,−1,−1⟩` | `s₂ = (−1,−1)₂³ = −1`, real `(−1)³ = −1`; product `1` | Hypotheses hold |
| 27 | 7.3 | `(2, [1], s = −1 at 2 and 3)` | `⟨3,3⟩`: `d = [9] = [1]`; `s = (3,3) = (3,−1)`: `−1` at 3, `−1` at 2, `1` at `ℝ` | Admissible, realized |
| 28 | 7.3 | Zero record; rank 1 with `s = −1` at two places | Rank `0`; `isAdmissible_rankOne_iff_eq_empty` | Not admissible |
| 29 | 7.3 route | `ℚ(√5)` record | The reduction returns a form with record `I` | Reaches `I` |
| 30 | 7.4 / 8.1 | `⟨3,3⟩` vs `⟨1,1⟩` | `s₂` and `s₃` differ; 3 is not a sum of two squares | Records differ; not isometric |
| 31 | 8.1 | `⟨1,2,2⟩` vs `⟨1,1,1⟩` | `d = [4] = [1]`; `s = (2,2) = (2,−1) = 1`, since `−1 = 1² − 2·1²`; index 3 for both; `2y² + 2z² = (y+z)² + (y−z)²` | Equal records; isometric |
| 32 | 8.1 | Two zero forms; zero vs `⟨1⟩` | Ranks `0, 0`; `0, 1` | Both true; both false |
| 33 | 8.2 | `⟨1,1,−3,−3⟩` | `d = [1]`, signature `(2,2)`; `s = (−3,−1)`: `−1` at 3, `1` at 2; `s(2H) = (−1,−1)`: `1` at 3, `−1` at 2 | Not hyperbolic |
| 34 | 8.2 | `⟨1,−1,2,−2⟩` | `d = [4] = [1] = d(2H)` | Hyperbolic |
| 35 | 8.3 | Class of `⟨1,1,−3,−3⟩`; class of `H` | Nonzero at `ℚ₂` and `ℚ₃`; zero everywhere | Image nonzero; image zero |
| 36 | 8.3, complex places | — | Vanishing at one `v` forces even dimension, which is all of `W(ℂ) = ℤ/2` | Complex places add nothing |
| 37 | 8.4 | `⟨1,2,2⟩`, `⟨1,1,1⟩` | Same local invariants | Isometric |
| 38 | Worked example | `ℚ(√5)`, `⟨1,θ,θ⟩` | `d = [1]`; indices 3 and 1; real Hasse `1` and `−1`; `−1` only above 2; product `1` | Matches |

**Remarks on untouched text.** These are not findings, and no change is asked for.
- Main's §4.4 also said that the symbol is `1` at a complex place, and no map line covers that
  clause. It is trivial, since every element of `ℂ` is a square. No consumer cites it, and the
  products over places here run over finite and real places only.
- Main's §4.1 (vector weak approximation) and §4.5 (openness) now have different content or are
  absent. `roadmaps overlaps` finds no roadmap that cites either.
- The Milne source issues recorded by earlier rounds stand. I found no new ones.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is settled as `uncertified` (paywalled, cited by its
  locator). I could not read 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a or 72:1.
  - The map lines cite 71:19 and 71:19a only through 4.1 item 3.
  - Milne independently supports 4.2 (Thm 1.1), 5.5 (Thm 3.5(b)), 6.3 and 8.4 (Thm 6.3), and 7.2
    and 7.3 (Thm 6.12), all read in `milne-cft`.
- Serre, *A Course in Arithmetic*, is settled as `uncertified`.
- I checked ownership against open pull requests with `roadmaps grep` over all 458 open heads, not
  by reading each sibling checkout.

## Source issues

- none
