# Review of InductionRestriction (pull request #3170 at 198459f)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 11 lines changed since `f17d28c`, all in the §5.2 bullet on the action of `G` on isotypic components and its line of the Tau Ceti contracts, together with a first check of the title and description against this head. The repair names the translation step first and adds the two pinned lemmas for the stabilizer and the equivariance; the step is true on every instance computed (including one of multiplicity two), both lemmas exist at the pins with the hypotheses of §5.2, and the description now describes this folder correctly. Accepted, with no small correction and one format note carried over, not blocking; one fact is left for the human reviewers.

## N01 — Four names in the Layer 5 contracts lack their namespace, and two names the §5.2 bullet uses are not in the contracts

In the Layer 5 line of the Tau Ceti contracts (README line 1529), `conjSubrep_one`, `conjSubrep_conjSubrep`, `isAtom_conjSubrep_iff` and `isotypicComponents_eq_range` stand without `TauCeti.Representation.`; the first two also in the bullet (lines 750–751). The contracts list neither `TauCeti.Representation.conjSubrep` nor Mathlib's `MulAction.orbitEquivQuotientStabilizer`, both used by the bullet (lines 748 and 758).

## Previous findings

The previous report had no finding (R); its two small corrections and its format note are accounted for here.

- C01 — repaired: "Prove first that `ρ(g)` carries the isotypic component of a simple `N`-subrepresentation `τ` onto that of `conjSubrep ρ g τ`"; the *Needs:* line now names both pinned lemmas, for the stabilizer and for the equivariance.
- C02 — repaired: the description now says "In InductionRestriction and ClassifyingSpaces the addition is stated in the README only", and this folder's bullet ends "`Suggested.lean`: no declaration; a docstring paragraph says the action is data and names its laws".
- N01 — not repaired: "`TauCeti.Representation.conjSubrepOrderIso`, `conjSubrep_one`, `conjSubrep_conjSubrep`, `isAtom_conjSubrep_iff`, `isotypicComponents_eq_range`" (contracts, line 1529); written again as N01 above.

<details><summary>What was checked</summary>

The worker's automatic checks all passed at this head. The dependency check, run again, reads 93 roadmaps and 1054 supplier edges and reports 0 problems: no supplier of this roadmap is later in the merge order and no two roadmaps cite each other. `Suggested.lean` is unchanged since `f17d28c` and elaborates with 13 `sorry` warnings and nothing else; no declaration was added, removed or altered, so no one-tactic probe applies.

The two names the repair adds were opened at the pins and resolve under the namespace the README gives (`Representation.`, with `[Field k] [Group G]`, `N` normal, `[FiniteDimensional k V]`, `[ρ.IsIrreducible]`, no finiteness of `G`). A probe file at the pins proves from them, with no error and no `sorry`: the component of the translate by `g` equals that of `σ` exactly when `g` lies in the inertia group of `σ` (three rewrites), and the indexing sends the component of the translate by `gh` to `g · [h]` (two rewrites and `rfl`).

The title and description against this head: sixteen folders are listed and sixteen change; the pin `2fd255d` is the pinned Tau Ceti; the folder's change against the base is 23 README lines and a 5-line docstring paragraph, with no heading, layer or declaration added or removed, as the InductionRestriction bullet and the general paragraph say; the stated order with the other open pull request that changes this roadmap (this one first) agrees with what the two heads do, and they merge cleanly. No sentence about this folder is contradicted by the head and no change to it is left unstated.

No file changes outside the folders the pull request names; the family index files directly in `TauCetiRoadmap/RepresentationTheory/` are unchanged. The README at the merge base against this head: insertions only, 12 layer ids kept with their titles.

Seeded sample: none of the sampled targets lies in the changed passages (§5.2 itself is unchanged in its statements of Clifford's theorem; §5.3 does not depend on the bullet).
</details>

## Verified sound

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §5.2 new step: `ρ(g)` carries the component of `τ` onto that of `conjSubrep ρ g τ` | `S₃ ⊵ A₃` over `ℂ`, 2-dim `W`, `g` a transposition | components are the `ω`- and `ω²`-eigenlines of a 3-cycle `c`; `gcg⁻¹ = c⁻¹`, so `ρ(g)` sends the `ω`-line to the `ω²`-line, which is the translate | holds | none |
| same, multiplicity `e > 1` | `Q₈ ⊵ {±1}` over `ℂ`, 2-dim `W` | `Res = 2·sgn`; one component `W`, strictly larger than any simple `τ`; `ρ(g)W = W` = component of `ρ(g)τ`; `T = G`; `2 = 2·1·1` | holds; a claim "onto the translate" would fail here | none |
| same, non-splitting field and degenerate `N` | `S₃ ⊵ A₃` over `ℚ`; `N = G`; `N = 1` | `ℚ`: `Res` simple, one component, fixed by all `g`. `N = G`: translate of `τ` is `τ`. `N = 1`: one component `W` | holds | none |
| same, definition at the pin | `TauCeti.Representation.conjSubrep` (Clifford/Basic.lean 114) | carrier is `σ.toSubmodule.map (ρ g)`: the image under `ρ(g)`, so "translate" in the README is the pinned object | agrees | none |
| §5.2 stabilizer, via the added `conjSubrepIsotypicComponent_eq_iff` (Clifford/Orbit/Index.lean 345) | `h = 1` in the lemma; `S₄ ⊵ V₄`, standard `W` | probe: `comp(g·σ) = comp(σ) ↔ g ∈ inertia σ`, proved; `S₄`: stabilizer of a character line is `D₄`, index 3 = number of components | holds | none |
| §5.2 equivariance, via the added lemma (Index.lean 309) | translates by `gh`; `S₄ ⊵ V₄`, 3-cycle | probe: `e(comp(gh·σ)) = [gh] = g·[h]`, proved; 3-cycle cycles the 3 components and the 3 cosets of `D₄` | holds given the new step | none |
| §5.2 Check (unchanged, cited by the changed text) | `S₃ ⊵ A₃` over `ℂ` | `T = A₃`, `|G ⧸ T| = 2`, `2 = 1·2·1`; a trivial action would give `T = S₃` and one coset | true | none |

The rows for untouched statements stand as in the previous review, of `f17d28c`.

- Source locators in the changed text: 0 (the changed passages cite no source).
- Library declarations opened at the pins: 11 in Tau Ceti (`Induction/Clifford/Basic.lean` 114 and the laws, order isomorphism and atom lemma there; `Clifford/Orbit/Basic.lean` 149, 205, 215; `Clifford/Orbit/Index.lean` 107, 297, 309, 345) and 1 in Mathlib (`MulAction.orbitEquivQuotientStabilizer`), each also resolved by `#check`.
- Cross-roadmap citations resolved: the change adds none; none of this README's is unresolved on main or at an open head.
- Overlap check: read FiniteGroupInvariants, GlaubermanZStar, CohomologyOfGroups (open) and ModularCharactersAndBlocksPartII, ModularInduction, CharacterTheory (main), as the previous review did; nothing shared. The 11 changed lines name no object another roadmap states.
- Elaboration: `Suggested.lean` 13 `sorry` warnings only; the probe no message.
- Dependency check output: `depcheck: 93 roadmaps, 1054 edges, 0 problem(s)`.
- Leads looked at and dropped: eight README names reported as found nowhere are this roadmap's own declarations (§7.1, §2.1) or its namespace; one reported lost binder is a `[Group G]` the type does not need. All in untouched text.
- README at the merge base against this head: insertions only; 12 layer ids kept with their subjects.

Source independence: changed passages only; 0 passages compared with a source text, since the changed passages cite no source and are worded on Tau Ceti declaration names; largest share Serre GTM 42, 12 of 40 mentions of Serre, Isaacs, Curtis–Reiner, Mackey and Weibel; arrangement not compared (no layer added, removed or reordered).

Research link: Layer 5 is Clifford theory over arbitrary fields (Curtis–Reiner 1981, §11; Isaacs 1976, Ch. 6) and Layer 7 universal central extensions and Schur multipliers (Weibel 2013, Ch. III §5); block theory in ModularCharactersAndBlocksPartII consumes the Clifford correspondence. Rests on the README's overview and references.

## Not verifiable

- The locators of §5.2's untouched text (Curtis–Reiner, *Methods of Representation Theory* Vol. I, §11; Isaacs, *Character Theory of Finite Groups*, Ch. 6): commercial books with no legal copy recorded for this roadmap. The changed text cites neither; its mathematics was verified by computation and at the pins.

## Source issues

- none

## For the human reviewers

- Not tested: Serre GTM 42, the source with the largest share of the locators, was not read. The changed passages cite no source and no layer moved, so neither wording nor arrangement was compared with it.
