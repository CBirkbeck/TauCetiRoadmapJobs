# Review of ModularCharactersAndBlocksPartII (pull request #2411 at 765678c)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 121 lines changed since `f198e03`, and the one finding of the previous review is repaired. The ordinary characters of a block, the defect of a block and the Brauer correspondent are now cited from the base (its §4.2, §6.2 and §§6.2, 7.1), which states each of them on main, and no statement changed. There are no small corrections and no format notes; three points are left for the human reviewers.

## Previous findings

- R01 — repaired: the scope section no longer lists the three objects as owned; lines 1671–1675 say they "are the base's … none of the three is a second notion", and §§6.1, 6.3, 6.4 cite base §4.2, §6.2, §§6.2, 7.1 instead of defining.
- C01 — repaired: the description now says "No supplier gap is declared: §2.5 proves … that `χ(1)/θ(1)` divides `|G : N|`", with the two steps named.
- C02 — repaired: the description now says "All are on main" for the four cited roadmaps, and names the base's open revision as naming the same three objects.
- N01 — repaired: §1.2 (line 234) and the reference list (line 1932) give "Lemma 3 … pp. 1471–1472".

The repair introduced no new problem. The citations it adds resolve on main: base §4.2 states, for every complete discrete valuation ring of characteristic zero whose fraction field contains a primitive `e`-th root of unity, that each irreducible `K[G]`-module lies in exactly one block, the one whose idempotent acts on it as the identity (the bullet `exists_blockIdempotent_iff_centralCharacter_congr`, base README lines 825–829); base §6.2 defines `IsDefectGroup` (line 1012) and states that `Br_D(e_B)` is a block idempotent of `k[N_G(D)]` with defect group `D`, each arising from exactly one `B` (lines 1084–1087); base §7.1 gives `Br_P(e_B) = Σ_{b^G = B} e_b` (lines 1186–1188). The description's sentence that the citations hold before and after the base's revision merges is right: that revision (#2534) keeps the three objects in §4.2 and §6.2 under the names `blockCharacters`, `blockDefect`, `brauerCorrespondent`.

The question of the previous report (whether part of the change of system of §6.1 follows from the base's revision) concerns untouched text and is not repeated.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §6.1, `blockCharacters e_B = Irr(B)` of base §4.2 | `S₃`, `p = 2`, `O = ℤ₂[ζ₃]`: `(1+r+r²)/3`, `(2−r−r²)/3`; `b = 0` | traces on `1, sgn, std`: `1, 1, (2−1−1)/3 = 0`; `0, 0, (4+1+1)/3 = 2`; base Check gives `{1, sgn}`, `{std}`; `b = 0`: empty | agrees with the base's partition | none |
| §6.1, `IsDefectGroup` against base §6.2 | `S₃`, `p = 2`, `e = 1+r+r²`, `e = r+r²`; `C₃`, `p = 2` | coefficient of `e` on `C_G(⟨t⟩) = {1, t}`: `1 ≠ 0`, and `0`; base: `Br_{⟨t⟩}` gives `1` and `0`; `C₃` excluded as not a `2`-group in both | same predicate | none |
| §6.3, the defect `d(B)` as the exponent of `|D|` | `S₃`, `p = 2`: `B₀` and `{std}`; `p = 3` | `|⟨t⟩| = 2¹`, `a − d = 0`, heights of `1, sgn`: `0, 0`; `d = 0`, `ν(2) − 1 = 0`; `d = 1 = a`, degrees `1, 1, 2` height `0` | well defined by conjugacy (base §6.2) | none |
| §6.4, the Brauer correspondent `e_{b'} = Br_D(e_B)` | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1`; conjugate `D` | `N_G(D) = D`, `Br_D(1+r+r²) = 1`, the one block of `k[D]`; `Br_1 = id`, `b' = B`; `Br_{gDg⁻¹}(e_B) = g Br_D(e_B) g⁻¹` | equals the base's block, and `b'^G = B` by base §7.1 with `H = N_G(D)` | none |
| §1.2, Glauberman's Lemma 3 (a)–(c) | locator only | statement opens at glauberman line 287 (p. 1471), parts (a)–(c) at lines 292–296 (p. 1472); Lemma 2 at line 266 (p. 1471) | pages as now printed | none |

The rows for the untouched statements stand as in the previous review, of `f198e03`; the diff changes prose and docstrings only, and no Lean statement.

- Source locators checked against the text: 2 (glauberman, Lemma 2 and Lemma 3), both at the stated pages; the seeded sample falls in the changed passages only at §6.1, whose source locators did not change.
- Cross-roadmap citations resolved on main: base §4.2 (README lines 811–829), §6.2 (lines 1010–1087), §7.1 (lines 1178–1203), and the base declarations `exists_blockIdempotent_iff_centralCharacter_congr` (`Suggested.lean` line 198), `IsDefectGroup` (line 252), `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero`, `brauer_first_main`. The base's open revision was read at its head for the three objects (its README lines 701–704, 995–1006, 1389–1391).
- Automatic checks at this head: all passed. Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`. No file changed outside the folder.
- `lake env lean` on `Suggested.lean`: 16 `sorry` warnings and nothing else. The 20 elaborated types are those of the previous review (the diff touches the module docstring and the docstring of `blockCharacters` only); the file has no `variable` line.
- Headlines and padding: unchanged, 16 theorems and 4 definitions; the one-tactic probe of the previous review stands, since no statement changed.
- No gap is declared; none is used.

Overlap check: read ModularCharactersAndBlocks (main and its open revision #2534), GlaubermanZStar, LocalFiniteGroupTheory, OddOrderTheorem, CharacterTheory. The ordinary characters of a block, the defect of a block and the Brauer correspondent: owner the base, cited here (R01 repaired); `blockCharacters` and `IsDefectGroup` are restated in this roadmap's own namespace so that the headlines can be stated. Blocks, defect groups, covering and domination by normal `p`-subgroups: the base (cited). Glauberman's lemma is shared with LocalFiniteGroupTheory, which may not be cited: see the human reviewers' section. Nothing else shared.

Source independence: changed passages only; 1 passage compared with 1 source (§1.2 against glauberman lines 287–298), none shared; the other changed passages cite the base roadmap and no source. Largest share martinez, 41 of 103 locators; no layer was added, removed or reordered, so the comparison of contents stands as in the previous review: independent.

Research link: Layer 9 states the height zero and Alperin–McKay conjectures, proved by Kessar–Malle 2013, Malle–Navarro–Schaeffer Fry–Tiep 2024 and Ruhstorfer 2025, as predicates with their normal-defect instances; §5.2 states the degree-divisibility of Hartley–Turull 1994 and Geck 2020. Rests on README §§5.2, 9.1–9.2, mnst line 55 and geck line 30.

## Not verifiable

- isaacs, navarro-1998, navarro-2018, feit: uncertified, cited by locator only; no changed passage rests on them.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (line 725): the source says height zero characters are those whose degree's `p`-part equals the numerical defect `d(B)`; it should be those whose degree's `p`-part equals `p^{a−d(B)}`; affects nothing.

## For the human reviewers

- Scope and licence: the largest share of locators (41 of 103) goes to martinez, unpublished course notes (Firenze 2024) read from the author's university page; the main results are also cited to reynolds, sambale and navarro-1998.
- The board's plan still lists `gap:clifford-multiplicity-dvd-index` against InductionRestriction Layer 7, while README §2.5 (c) plans that statement. If the gap stays announced, InductionRestriction may plan a second copy.
- LocalFiniteGroupTheory (open, on the list of roadmaps never cited as suppliers) plans Glauberman's lemma (its README lines 18 and 192); §1.2 here states and proves the same lemma.
