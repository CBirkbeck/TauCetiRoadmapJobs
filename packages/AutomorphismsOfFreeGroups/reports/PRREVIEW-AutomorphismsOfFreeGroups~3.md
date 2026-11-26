# Review of AutomorphismsOfFreeGroups (pull request #3179 at f52ced6)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The 60 changed lines repair both small corrections of the previous review (the neighbours paragraph now says that the other roadmap states Nielsen generation, and the two statements that held by unfolding are gone from `Suggested.lean`) and name the five headline declarations in the README; no statement changed and the repairs introduced no new problem. One format note, not blocking. Left to the humans, as before: MappingClassGroupsAndCanonicalRepresentations (#2266) still proves and owns Nielsen generation at its head, so the single ownership stated here holds only once its §9.6 cites §1.4.

## N01 — §2.4 still has no source locator

The statements of §2.4 (inner automorphisms lie in `IA`, normality, the descent to `Out(F_n) → GL_n(ℤ)`; README lines 224–229) carry no locator. They are standard and were verified by computation in the first review; a textbook locator would complete the section.

## Previous findings

- C01 — repaired: README line 19 now reads "states, in §9.6, Nielsen generation of `Aut(F_N)`"; what remains is a change in #2266, not in this folder (for the human reviewers).
- C02 — repaired: `coe_autToGL` and `expSum_apply` are removed; the module docstring (lines 13–15) says `expSum_autMatrix` is proved because the definition of `autToGL` depends on it.
- N01 — not repaired: §2.4 (lines 224–229) has no locator; written again as N01.
- N02 — repaired: `nielsenSubgroup_eq_top`, `closure_shift_swap_invAt_mulRight_eq_top`, `expSum_autMatrix`, `autToGL_surjective` and `conj_mem_IA` are named at §1.4, §2.2, §2.3, §2.4; `coe_autToGL` no longer exists.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `expSum_autMatrix` (§2.2, README line 177; now the only form of the transformation formula) | `ι = Fin 2`, `γ = mulRight 0 1`, `w = g₀ g₁⁻¹`; `w = 1` | `γ w = g₀`, left side `(1, 0)`; `autMatrix γ` has columns `(1,1)`, `(0,1)`; `*ᵥ (1,−1) = (1, 0)`. `w = 1`: `0 = 0` | true; proof elaborates | none |
| `closure_shift_swap_invAt_mulRight_eq_top` against README lines 133–135 | name match; `N = 0` in Lean (`Fin 1`) | README `N ≥ 1` on `Fin N` equals Lean `N : ℕ` on `Fin (N + 1)`; for `Fin 1`: shift = swap = 1, `0 ≠ 1` false, closure `⟨invAt 0⟩ = Aut(ℤ)` | README and Lean agree | none |
| `autToGL` after removal of `coe_autToGL` | Checks of §2.2 | the coercion is `autMatrix` by construction (`MonoidHom.toHomUnits`); `autToGL (mulRight i j)`: column `i` is `e_i + e_j`, so `1 + E_{ji}` | Checks still evaluate as stated | none |
| §2.2 locator, breitner11 Definition 9 | breitner11 lines 228–235 | entry `(i, j)` counts `g_i` in `γ(g_j)`: the README's column convention | supported | none |
| §2.3 locator, breitner11 proof of Proposition 18 | breitner11 lines 392–393 | the proof asserts `B` surjective from preimages of a generating set of `GL_r(ℤ)` | supported | none |

The rows for the untouched statements stand as in the previous review, of `1b279a1`.

- Source locators checked against the text: 2 (breitner11 Definition 9, line 228; Proposition 18 and its proof, lines 388–396), both in the sampled and reflowed §2.2 and §2.3. The changed lines of §1.4 and §2.4 add names only; §1.1–§1.3 and §2.1 are untouched.
- Library declarations opened at the pin: `Equiv.Perm.closure_cycle_adjacent_swap` (`Mathlib/GroupTheory/Perm/Closure.lean:46`), as the reflowed §1.4 cites it.
- Cross-roadmap citations resolved: MappingClassGroupsAndCanonicalRepresentations §9.6 at the head of #2266 (`183aede`) still states the four-generator theorem as its own target (README lines 2335–2346) and lists it as owned (line 2926); it does not cite this roadmap.
- Dependency check output: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: four warnings, all `declaration uses sorry`, on theorems (lines 63, 69, 106, 114); no definition uses `sorry`.
- Elaborated types of the 12 declarations compared with the README: the four flagged as having lost `[Fintype ι]` (`invAt`, `mulRight`, `expSum`, `autMatrix`) do not need it; `mulRight` needs no `DecidableEq` either. Nothing changed.
- Headlines (Nielsen generation, its four-generator form, `B` and its surjectivity, inner automorphisms in `IA`) are all stated; the two not statable are named in the docstring. No `set_option`, no change outside the folder, imports unchanged.
- The pull request's title and description agree with this head; nothing they describe changed.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations (head of #2266), SurfaceGroupCharacterVarieties, FreeGroupsAndLimitGroups as in the previous rounds; shared object: Nielsen generation of `Aut(F_N)`, owner this roadmap (§1.3–§1.4), with #2266's §9.6 still to be changed to cite it. `OuterAut` is TeichmullerGeometry's.

Source independence: changed passages only: 2 passages compared with 1 source (breitner11 lines 228–235 and 388–396), none shared beyond the formula for the matrix entries; largest share lyndonSchupp77 and breitner11, 3 of 8 locators each; no layer was added, removed or reordered, so the arrangement was not compared again; lyndonSchupp77 could not be read.

Research link: §1.4 is Nielsen (1924); the representation `B` of Layer 2 is the map whose images of stabilizers Breitner (2012, Theorem 1) computes and which Schmithüsen (2004) uses for Veech groups of origamis; README *Downstream consumers* and breitner11 lines 22–39.

## Not verifiable

- lyndonSchupp77, Chapter I, Propositions 2.2, 2.5 and 4.1, and nielsen24: no legal copy, as in the previous rounds; untouched by this change.
- breitner11 was read in its arXiv version 2; that Definition 9 and Proposition 18 carry the same numbers in the published article was not checked.

## Source issues

- none

## For the human reviewers

- **Ownership.** README lines 19–22 and 263–265 claim Nielsen generation for this roadmap; #2266 (MappingClassGroupsAndCanonicalRepresentations) still proves it in §9.6 (lines 2335–2346) and lists it as owned (line 2926). #2266 must cite §1.4, and this roadmap precede it in the merge order.
- **Not tested.** lyndonSchupp77 has a joint largest share of the locators (3 of 8) and could not be read: wording and arrangement of §§1.3–1.4 were not compared with it.
- **Licence.** The description says the motivating results are "formalized in a standalone project on top of Mathlib and Tau Ceti"; that project was not located, so `Suggested.lean` was not compared with it.
