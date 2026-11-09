# Review of GlobalQuadraticForms (pull request #1215 at 293f615)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/GlobalQuadraticForms/` has not changed since
`7498694`: the diff of the folder is empty. The only file this head changes is
`TauCetiRoadmap/ClassFieldTheory/README.md`, which belongs to the pull request's own
ClassFieldTheory folder. Both findings of the previous review are still open. Both are P3, and both
concern the pull request as a whole rather than the mathematics of this folder. The gate, the
elaboration and the dependency check pass.

## R01 (P3) — The conflicting revision #1200 of this roadmap is still open, and no order is stated

**Location.** The pull-request description (title "ClassFieldTheory: correct hypotheses,
conductors and lifting"); `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` as
a whole.

**Claim.** Not repaired. This was R01 at `c4ff4fc` and at `7498694`, and no repair report marks it
not actionable.
- This pull request rewrites GlobalQuadraticForms, but its description still names only
  ClassFieldTheory.
- #1200 ("Fix rank-four discriminant sign comparison") changes the same two files.
- Since the last review, #1200's head has moved from `f028c07` to `5cb0012`.
- The two heads still conflict. Neither is an ancestor of the other, and the folder differs
  between them by 352 insertions and 166 deletions.
- #1200's fix, the rank-four real-place remark, is already at 7.2 here (README lines 924–926). So
  this pull request supersedes #1200.

**Witness.** `roadmaps overlaps GlobalQuadraticForms`: "#1200 and #1215 conflict in `README.md`,
`Suggested.lean`". #1200 at `5cb0012` declares `equivalent_of_locallyEquivalent`
(`Suggested.lean:133`) and `injective_wittRing_baseChange_places [Invertible (2 : K)]` (line 148).
This head declares neither.

**Repair.** State in the description that this pull request revises GlobalQuadraticForms and
supersedes #1200, whose rank-four fix is at 7.2, lines 924–926 here, and close #1200. If both are
kept, state which merges first and rebase the other on it. Test: after the repair,
`roadmaps overlaps GlobalQuadraticForms` lists no other open pull request that changes this
roadmap.

## R02 (P3) — A change outside the folders this pull request is named for

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`: 112 changed lines (62 insertions, 50
deletions), from commit `1abcd32c` ("ClassFieldTheory: review repairs with consumers kept
building").

**Claim.** Not repaired. This was R02 at `c4ff4fc` and at `7498694`.
- The folders named as this pull request's own are ClassFieldTheory, QuadraticFormInvariants and
  GlobalQuadraticForms.
- The open-PR index now lists LocalGaloisGroups among #1215's roadmaps. Neither the description
  nor this review's brief names it, so the edit gets no review of its own.
- The gate's `outside-folder` check does not catch it, because it reports only `TauCetiRoadmap/`
  folders.

**Witness.** `git diff --stat origin/main...HEAD`, with the three named folders excluded, prints
`Completed/LocalGaloisGroups/Suggested.lean | 112`. For example, `ClassFieldTheory.artinMap K x`
becomes `TauCeti.ClassFieldTheory.artinMap K x`. Commit `1abcd32c` is on this head and not on
`origin/main`.

**Repair.** Name `Completed/LocalGaloisGroups` in the description as a folder this pull request
changes: a consumer updated so that it keeps building after the ClassFieldTheory renames. It then
gets its own review. The alternative is to drop the edit and keep the ClassFieldTheory names that
file imports. Test: the same `git diff --stat` then lists nothing, or only folders the description
names.

## Previous findings

- R01 — not repaired: the description still names only ClassFieldTheory. #1200 (head `5cb0012`)
  still changes `README.md` and `Suggested.lean` of this folder and conflicts with `293f615`, and
  no order is stated.
- R02 — not repaired: `git diff --stat origin/main...HEAD` outside the three named folders still
  lists `Completed/LocalGaloisGroups/Suggested.lean | 112` (commit `1abcd32c`). The description
  does not name that folder.

## Verified sound

**Change set.**
- `git diff --stat 7498694 HEAD` lists only `TauCetiRoadmap/ClassFieldTheory/README.md` (+141/−28).
- `lake-manifest.json`, `lean-toolchain` and this folder are unchanged, so the pins are the ones the
  previous review read.
- The ClassFieldTheory change does three things:
  - adds Layer 13 inputs for the principal ideal theorem (the comparison of idele and ideal
    extension);
  - adds Mathlib inputs to the supplier list;
  - adds Milne locators (III Thm 5.1, VIII Thm 4.2, VII Thm 7.1, V Ex. 5.4).
- None of this touches what this roadmap consumes. GlobalQuadraticForms cites the Tau Ceti
  declarations directly:
  - `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap` (README lines 152, 310,
    430, 592);
  - `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion` (lines 153, 314, 498,
    616, 626).
- ClassFieldTheory still says at this head that GlobalQuadraticForms owns Hasse–Minkowski (lines
  200 and 246). Its Downstream consumers paragraph (line 2189) still says that §4.2 consumes the
  Layer 10 first inequality and §4.3 the Layer 13 quadratic Hasse norm theorem. Both agree with
  4.2 and 4.3 here.
- QuadraticFormInvariants (lines 87–89, 2686) still hands Hasse–Minkowski to this roadmap.

**Gate and supply direction.**
- The worker's gate at `293f615` reports "Every check passed", including the targeted build.
- I re-ran it myself. Its only failing lines are `outside-folder` lines for five files of
  ClassFieldTheory and QuadraticFormInvariants, which are the pull request's own folders, so they
  are not findings.
- The dependency check prints exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`: no UPWARD
  or CYCLE line.
- `roadmaps resolve` (`citations.md`) finds no unresolved cross-roadmap citation and no unresolved
  Lean name.

**Lean.**
- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` gives exactly 8 warnings, all
  "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- I elaborated `#check @name` for all 8 declarations in one scratch file, with `pp.universes`
  shown. The results are the previous review's:
  - `K : Type u_1` throughout, with `V : Type u_2` and `W : Type u_3` in independent universes.
  - `[FiniteDimensional K V]` and `[FiniteDimensional K W]` are present wherever `V` or `W` occurs.
  - `QuadraticMap.Nondegenerate` hypotheses are explicit, and `Ne a 0` appears only in
    `represents_iff_locallyRepresents`.
  - `exists_globalForm_of_isAdmissible` concludes `∃ Q, ∃ hQ, Q.globalInvariants hQ = I` in
    universe `u_1`.
  - `injective_wittRing_baseChange_places` is `Function.Injective (TauCeti.WittRing.globalToLocal K)`
    with no `Invertible 2` binder.
  - No section binder is lost.
- Neither the file nor the pins have changed, so the previous review's results carry over:
  - the one-tactic probe (`first | simp | rfl | infer_instance | (constructor <;> simp)`, which
    closes none of the 8);
  - the 156 dotted README names, which resolve at the pins;
  - the 59 Tau Ceti paths, which exist.
- Headlines: 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3 are stated. They include the Summary's end
  theorems. 8.4 is the reverse direction of 6.3, and 8.2 follows from 8.3; the module docstring
  says both.

**Ownership, at this index (458 open heads).**
- `roadmaps grep --lean-only 'namespace TauCetiRoadmap\.GlobalQuadraticForms'` finds only main,
  #1200 and #1215.
- `theorem .*hasse_?minkowski` and `isSquare_of_isSquare_unitAtFinitePlace` match only those three
  copies of this roadmap. No other roadmap declares these names or owns these objects.
- Overlaps: the README cites no id that an open pull request drops, and no id that only an open
  revision defines.

**Seeded sample.**
- All the sampled targets are untouched text. The previous review verified their Milne locators
  (printed page = PDF page − 9).
- I re-read the cited statements in `milne-cft` and found each one where the README cites it:
  - Thm 1.1 at line 10384;
  - Thm 3.1, the Hasse norm theorem, at line 10629;
  - Thm 3.5 at line 10686;
  - Thm 6.3, Hasse–Minkowski, at line 11619;
  - Thm 6.10 at line 11745;
  - Thm 6.12 at line 11792.
- The README flags no locator as unverified.

**Adversarial table.** The diff changes no statement. Every row is carried from the previous review
(`7498694`), whose values hold at `293f615`. I recomputed the rows marked † by hand this round.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Discriminant convention | `H`, `⟨1,1⟩` | Plain `[−1]`, `[1]`; signed `[1]`, `[−1]` | Distinguished |
| Hasse convention | `H` over `ℝ` | `i<j`: `(1,−1)=1`; `i≤j`: `(1,1)(1,−1)(−1,−1)=−1` | Distinguished |
| Real Hasse `(−1)^(q(q−1)/2)` | `q=0..4` | `1,1,−1,−1,1`; rank 4, `d=[1]`: `q∈{0,2,4}` give `1,−1,1` | `(4,0)`, `(0,4)` collide; rank ≤ 3 separated |
| 4.1 transport | `ℚ(i)`, conjugation | `2+i ≡ 4` mod `(2−i)`, a square there; `σ(2+i)=2−i` square at `(2+i)` | Places follow `σ` |
| 4.1, 71:19a | `b=−1`, `S={3}`, `T={∞}`, `a=−3` | `ℝ`: `−1`; `3`: `(−1/3)=−1`; `2`: `ε(−3)=0`, so `1` | Holds |
| 4.1, 71:19a | `S={5}` | `−1=2²` in `ℚ₅` | Nonsquare hypothesis needed |
| 4.1, 71:19 | `S={2}`, `T={∞}`; `S={3}`, `T=∅` | `(−1,−1)=−1` exactly at `2`, `∞`; odd count | Holds; parity excluded |
| 4.2 | `ℚ(i)`, `a=−1` | `−1=i²`, square at every `v` | Both true |
| 4.2 | `ℚ`, `a=−7` | Square in `ℚ₂`; nonsquare at `3` and every `p` with `(p/7)=−1` | Hypothesis fails; conclusion false |
| 4.2, exponent | `16`, `n=8` | `(−1/p)(2/p)(−2/p)=1`, so `16` is an 8th power in every `ℚ_p`, `p` odd; `√2∉ℚ` | 8th-power analogue false |
| 4.3 | `d=5`, `a=−1` | `2²−5·1²=−1` | Both true |
| 4.3 | `d=3`, `a=−1` | `(3,−1)₃=(−1/3)=−1` | Both false |
| 5.1 binary | `⟨1,−2⟩` over `ℚ`; over `ℚ(√2)` | Not isotropic in `ℚ₃`; `(√2)²−2=0` | Both false; both true |
| 5.1 ternary | `⟨1,1,−7⟩` | `(−1,7)₇=−1`, `(−1,7)₂=−1`, `ℝ`: `1` | Both false |
| 5.1 ternary | `⟨1,1,−5⟩` | `1+4−5=0` | Both true |
| 5.5 | Rank 0, rank 1 | Anisotropic over `K` and every `K_v` | Both false |
| 5.5 | `⟨1,1,1,−7⟩` | `⟨1,1,1⟩` misses exactly the class `−1 ≡ 7` in `ℚ₂` | Both false |
| 5.5 | `⟨1,1,1,−1⟩` | `1+0+0−1=0` | Both true |
| 5.5 route | `U=⟨1,1⟩`, `W=⟨1,−1,1⟩` | `x=(1,0)`: `b=1`, `W(0,1,0)=−1`; `x=0` gives singular `⟨0⟩ ⊥ W` | `U(x)≠0` needed |
| 6.1 | `⟨1,1,1⟩`, `a=7`; `a=3` | `7` missed at `ℚ₂`; `1+1+1=3` | Both false; both true |
| 6.1 | `a=0` | Zero vector on both sides | Both true; `a≠0` serves the route |
| 6.2 | `⟨1,7⟩` into `⟨1,1,1⟩` | `⟨7⟩` not represented at `ℚ₂` | Both false |
| 6.2 | `⟨1,2⟩` into `⟨1,1,1⟩` | `e₁ ↦ 1`, `(0,1,1) ↦ 2`, orthogonal | Both true |
| 6.2 Check | `⟨c⟩` into `H` | `((1+c)²−(1−c)²)/4=c` | Holds |
| 6.3 | `⟨1,3⟩` vs `⟨1,1⟩`; `⟨1,1⟩` vs `⟨2,2⟩` | `[3]≠[1]` at `ℚ₃`; `(x+y)²+(x−y)²=2x²+2y²` | Both false; both true |
| 7.2 | `ℚ`, `n=2`, `d=[−1]`, `U_v=H` | All `s_v=1`; real `q=1` gives `1`; product `1` | `V=H` |
| 7.2 Check | `⟨−1,−1,−1⟩` | `s₂=(−1,−1)₂³=−1`, real `(−1)^3=−1`; product `1` | Hypotheses hold |
| 7.3 † | `(2,[1], s=−1 at 2, 3)` | `⟨3,3⟩`: `d=[9]=[1]`; `s=(3,3)=(3,−1)`: `(−1/3)=−1` at 3, `(−1)^{ε(3)ε(−1)}=−1` at 2, `1` at `ℝ` | Admissible, realized |
| 7.3 | Zero record; rank 1, `s=−1` at two places | Rank `0`; `isAdmissible_rankOne_iff_eq_empty` | Not admissible |
| 7.3 route | `ℚ(√5)` record | Reduction returns a form with record `I` | Reaches `I` |
| 7.4 / 8.1 | `⟨3,3⟩` vs `⟨1,1⟩` | `s₂, s₃` differ; `3` is not a sum of two squares | Records differ; not isometric |
| 8.1 † | `⟨1,2,2⟩` vs `⟨1,1,1⟩` | `d=[4]=[1]`; `s=(2,2)=(2,−1)=1` since `−1=1²−2·1²`; index `3` both; `2y²+2z²=(y+z)²+(y−z)²` | Equal records; isometric |
| 8.1 | Two zero forms; zero vs `⟨1⟩` | Ranks `0,0`; `0,1` | Both true; both false |
| 8.2 † | `⟨1,1,−3,−3⟩` | `d=[1]`, signature `(2,2)`; `s=(−3,−1)`: `−1` at 3, `1` at 2; `s(2H)=(−1,−1)`: `1` at 3, `−1` at 2 | Not hyperbolic |
| 8.2 | `⟨1,−1,2,−2⟩` | `d=[4]=[1]=d(2H)` | Hyperbolic |
| 8.3 | Class of `⟨1,1,−3,−3⟩`; class of `H` | Nonzero at `ℚ₂`, `ℚ₃`; zero everywhere | Image nonzero; image zero |
| 8.3, complex places | — | Vanishing at one `v` forces even dimension, all of `W(ℂ)=ℤ/2` | Complex places add nothing |
| 8.4 | `⟨1,2,2⟩`, `⟨1,1,1⟩` | Same local invariants | Isometric |
| Worked example | `ℚ(√5)`, `⟨1,θ,θ⟩` | `d=[1]`; indices `3`, `1`; real Hasse `1`, `−1`; `−1` only above `2`; product `1` | Matches |

**Remarks on untouched text.** These are not findings, and no change is asked for.
- `roadmaps overlaps` still lists "GlobalQuadraticForms Layer 3", cited by MetaplecticAutomorphicForms
  (#1063 lines 51, 1627, 1828), as an id this pull request drops.
  - The section and name map (README lines 53–75) sends Layer 3 to
    `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants`, `GlobalFormInvariants.IsAdmissible`
    and `QuadraticForm.globalInvariants`.
  - The previous review accepted that map. The tool does not read it as an old → new mapping.
- The previous review's five Milne source issues stand. I found no new ones, so they are not
  repeated below.

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, is settled as `uncertified` (paywalled, cited by its
  locator). I could not read 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1.
  - They are the only locators for 4.1 item 3, 5.5, 6.1, 6.2, 6.3, 7.3 and 8.1, and co-locators
    for 4.2 and 7.2.
  - Milne independently supports 4.2 (Thm 1.1), 5.5 (Thm 3.5(b)), 6.1 (Cor. 3.6), 6.3 and 8.4
    (Thm 6.3), and 7.2 and 7.3 (Thm 6.12), all read in `milne-cft`.
- Serre, *A Course in Arithmetic*, is settled as `uncertified`: Ch. III §1.2 Thm 1, §2.2 Thm 3,
  Ch. IV §2.1 and §3.2 Thm 8. The `i < j` Hasse convention attributed to Serre is confirmed through
  `milne-cft` line 11677 (Remark 6.6).
- Ownership against open pull requests was checked with `roadmaps grep` over all 458 open heads,
  not by reading each sibling checkout.

## Source issues

- none
