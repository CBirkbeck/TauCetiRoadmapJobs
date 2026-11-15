# Review of ModularCharactersAndBlocksPartII (pull request #2411 at 0c072e1)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README:517–519 now reads "the divisibility of the index of a central subgroup by the degree of an irreducible character, `χ(1) ∣ |H : Z|` for a finite group `H`, `χ ∈ Irr(H)` and `Z ≤ Z(H)` (isaacs Theorem 3.12)". The `plan.json` part is D01.
- R02 — repaired: the description now lists ModularCharactersAndBlocks Conventions and §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.3, 5.1, 6.1–6.3, 7.1–7.2, 8.1–8.2, IG.3.4, CharacterTheory, InductionRestriction Layers 1, 2, 5, 7, and declares `gap:clifford-multiplicity-dvd-index`.

## Deferred findings

- D01 — stands: the gap's `detail` in `packages/ModularCharactersAndBlocksPartII/design/plan.json` still reads "the divisibility of a degree by the index of a central subgroup (isaacs Theorem 3.12)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| README:517–519, `χ(1) ∣ \|H : Z\|` for `Z ≤ Z(H)` (isaacs Thm 3.12) | `Q₈`, `Z = Z(Q₈)`; `Q₈`, `Z = 1`; `S₃`, `Z = 1`; `H = 1`; `C₃` over `ℚ` | `2 ∣ 4`; `2 ∣ 8`; `2 ∣ 6`; `1 ∣ 1`; `ℚ`-irreducible degree `2 ∤ 1`, excluded by complex characters (README:183, 502–503) | holds | none |
| Wrong reading `\|H : Z\| ∣ χ(1)` (R01's witness) | `Q₈`, `Z = Z(Q₈)`, `χ₂` | `4 ∤ 2`; the repaired text and its formula both say `2 ∣ 4` | phrase and formula agree | none |
| Schur: projective degree divides the order (README:515–518) | `V₄`, degree-2 projective lifted to `Q₈` with `Z = Z(Q₈)`; `C₃` (trivial multiplier) | `2 ∣ \|Q₈ : Z\| = 4 = \|V₄\|`; every projective irreducible has degree `1 ∣ 3` | holds | none |
| Gap `needs`: `χ(1)/θ(1) ∣ \|G : N\|` (README:507–509) | `SL(2,3)`, `N = Q₈`; `S₃`, `N = C₃`; `Q₈`, `N = Z(Q₈)`, `θ` faithful; `N = G` | `3/1 ∣ 3`, `2/2 ∣ 3`; `2/1 ∣ 2`; `2/1 ∣ 4` (the 3.12 step, via `V₄`); `1 ∣ 1` | holds | none |
| §8.3 height formula, the gap's consumer (README:1684–1696) | `SL(2,3)`, `p = 2`, `D = Q₈ = N`, `T = G` | `a − d = 0`; degree 3 over linear `θ`: `ψ(1)/θ(1) = 3`, odd, `h = 0 = ν(1)`; degree 2 over `χ₂`: `h = 1 = ν(2)` | holds | none |

The rows for the untouched statements stand as in the previous review, of `c2e9927`.

- Gate at this head: every check `0`, `OK`. Depcheck: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`. No file changed outside the folder.
- `lake env lean` on `Suggested.lean` (byte-identical to `c2e9927`): 16 `sorry` warnings, nothing else. `#check @name` for all 20 declarations in a scratch copy: 20 types printed, the same as in the previous review.
- The diff adds no locator. It cites isaacs Theorem 3.12, which is uncertified and was not read. No new supplier and no new Lean name.
- Pins searched for the 3.12 divisibility (Tau Ceti and Mathlib `RepresentationTheory`): not present. Only `TauCeti.Representation.finrank_dvd_card` (`CharacterTable/Degree.lean`) exists, so the gap is still minimal.
- InductionRestriction Layer 7 on main (README:721–864) has the lifting of projective representations to a central extension and no degree divisibility, as the changed paragraph says. The gap slug is the same in `plan.json` and README:507.
- Isaacs 3.12 and 11.29 are stated by no roadmap on main or at an open head (`roadmaps grep`).
- `citations.md` lists four "found nowhere" names (`IsGlaubermanFamily.adjoin_range_eq`, `.exists_sign_of_isCyclic`, `.index_mul_degree_eq`, `.restrict_pairing_ne_zero`). All four are declarations of this `Suggested.lean`, and `#check` prints them.
- Description against the head: 16 theorems and 4 definitions (20 declarations, 16 `sorry`), and the Lean imports no roadmap. The cited base, CharacterTheory and InductionRestriction sections match the README's citations. README:1813 matches the GlaubermanZStar clause.

Overlap check: the closest-roadmap lists are unchanged since `c2e9927` (ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem, LocalFiniteGroupTheory, FiniteGroupInvariants; CharacterTheory, InductionRestriction, FiniteGroupExtensionSplitting), and their owners are as in the previous review. For the changed passage, InductionRestriction Layer 7 owns the central-extension lifting (cited). No roadmap owns Isaacs 3.12 or 11.29.

Source independence: changed passages only. 1 passage compared (README:515–520) with 0 readable sources: isaacs is uncertified. The changed clause is a formula with its hypotheses, which the mathematics forces. The arrangement was not compared again, because no layer was added, removed or reordered. The largest share of locators is still martinez, 44 of 117.

## Not verifiable

- isaacs (1976), Theorem 3.12 (the changed clause) and Corollary 11.29 (the gap): settled as uncertified, cited by locator only. Not corroborated in the ten cached sources.

## Source issues

- none

## For the human reviewers

- LocalFiniteGroupTheory (open draft, on the list of roadmaps never cited as suppliers) plans Glauberman's lemma and invariant cosets modulo a normal subgroup in its L3 (its README:18, 192). This roadmap's §1.2 states and proves the same objects.
- The largest share of locators (44 of 117) goes to martinez: unpublished course notes (Firenze 2024), read from the author's university page. The main results are also cited to reynolds, sambale and navarro-1998.
