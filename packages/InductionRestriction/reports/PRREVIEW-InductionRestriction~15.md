# Review of InductionRestriction (pull request #3170 at f17d28c)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 21 changed lines since `87e7f72`. I checked the new §5.2 bullet (the translation action of `G` on `N`-subrepresentations and on the isotypic components of `Res_N W`, its transitivity, its stabilizer, the equivariance of the indexing by `G ⧸ T`, and its Check), the new paragraph of the `Suggested.lean` docstring, the six names added to the Tau Ceti contracts and the description. The mathematics holds on `S₃ ⊵ A₃` (over `ℂ` and over `ℚ`), `S₄ ⊵ V₄` and the two degenerate normal subgroups, every cited declaration exists at the pins with hypotheses §5.2 has, and a probe at the pins proves the action laws, the stabilizer statement and the equivariance on translates. Accepted, with two small corrections and one format note, none blocking; the folder is unchanged since the previous review, so its three remarks stand as written there. One fact is left for the human reviewers.

## C01 — The *Needs:* line of the new §5.2 bullet omits the two pinned lemmas that carry the stabilizer and equivariance claims, and does not name the one step that is new

An implementer reading the *Needs:* line (README line 756) is sent to `Representation.mem_inertia_fdRepOf_toRepresentation_iff` for the stabilizer and finds no input for the equivariance. The pin has direct inputs for both in `RepresentationTheory/Induction/Clifford/Orbit/Index.lean`: `Representation.conjSubrepIsotypicComponent_eq_iff` (line 345: the components of the translates by `g` and `h` agree exactly when `g⁻¹h` lies in the inertia group) and `Representation.isotypicComponentsEquivQuotientInertia_conjSubrepIsotypicComponent` (line 309: the component of the translate by `g` goes to the coset of `g`). With them I proved at the pins, in two rewrites each, that the component of the translate by `g` equals that of `σ` exactly when `g` is in the inertia group, and that the indexing sends the translate by `gh` to `g · [h]`.

What nothing at the pin states is that `ρ(g)` carries the isotypic component of `τ` onto that of `conjSubrep ρ g τ`; that step is also what makes `g · c = ρ(g)(c)` well defined on components. Adding the two lemmas to the *Needs:* line and naming this step as the target would show exactly what remains to be done.

## C02 — The description's general sentence about `Suggested.lean` does not hold for this folder

The description says "Planned Prop-valued statements are declared with `sorry` in the folder's `Suggested.lean`", and names DynamicalDegreesOfRationalMaps as the one folder whose statements are in the README only. This folder declares none of its three new Prop-valued claims (transitivity, stabilizer, equivariance): its `Suggested.lean` gains a docstring paragraph and no declaration. Leaving them out is sound, since none is a headline and two follow in a line from pinned lemmas (C01). The InductionRestriction bullet of the description could end "`Suggested.lean`: no declaration; a docstring paragraph names the action and its laws".

## N01 — Four new names in the contracts lack their namespace, and two names the bullet uses are not in the contracts

In the Layer 5 line of the Tau Ceti contracts (README lines 1524–1525), `conjSubrep_one`, `conjSubrep_conjSubrep`, `isAtom_conjSubrep_iff` and `isotypicComponents_eq_range` stand without `TauCeti.Representation.`; the first two also in the bullet (lines 750–751). The contracts list neither `TauCeti.Representation.conjSubrep` nor Mathlib's `MulAction.orbitEquivQuotientStabilizer`, both used by the bullet.

<details><summary>What was checked</summary>

The worker's automatic checks all passed. The dependency check, run again, reads 112 roadmaps and 1287 supplier edges and reports no problem: no roadmap this one names as a supplier comes later in the merge order, and no two cite each other. `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else; the change adds, removes and alters no declaration, so no one-tactic probe applies. A probe file at the pins, with `[FiniteDimensional k V]` as §5.2 has, defines the action `G →* (Subrepresentation ≃o Subrepresentation)` with value `conjSubrepOrderIso ρ g` from `conjSubrep_one` and `conjSubrep_conjSubrep`, and proves the stabilizer statement and the equivariance on translates; it elaborates with no error and no `sorry`.

The README at the merge base against this head: 16 lines inserted, none deleted; 12 layer ids kept with their titles; nothing removed, renumbered or reduced to names. No file changes outside the folders the pull request names, and the family index files directly in `TauCetiRoadmap/RepresentationTheory/` are unchanged. The other open pull request that changes this roadmap adds §6.2 (Brauer's theorem in degree zero) and does not touch §5.2 or the Layer 5 contract line; the heads merge cleanly and the description orders them (this pull request first).

Seeded sample: none of the sampled targets lies in changed or affected text (§5.2 is not among them; §5.1 and §5.3 are untouched and the bullet alters no statement they depend on).

Previous review (same folder text, accepted): no finding. Its two small corrections and one format note are not repaired, because the folder did not change; they are C01, C02 and N01 above, each checked again at this head.
</details>

## Verified sound

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §5.2 action on `N`-subrepresentations is a left action by order automorphisms | pin: `conjSubrep_one` (Clifford/Basic.lean 152), `conjSubrep_conjSubrep` (156), `conjSubrepOrderIso` (178) | `1·σ = σ`; `g·(h·σ) = (gh)·σ`; probe monoid hom elaborates, no `sorry` | holds | none |
| §5.2 action, degenerate `N` | `N = G`; `N = 1` | `N = G`: translate of `σ` is `σ`, one component, `T = G`. `N = 1`: one component `W`, inertia `G`, one coset | holds | none |
| §5.2 transitivity | `S₄ ⊵ V₄`, 3-dim standard `W` over `ℂ`; pin `isotypicComponents_eq_range` (Orbit/Basic.lean 149) | `Res = χ₁⊕χ₂⊕χ₃`; `S₄/V₄ ≅ S₃` permutes the three nontrivial characters transitively; components = range of translates | holds | none |
| §5.2 stabilizer = inertia | `S₄ ⊵ V₄`; probe from `conjSubrepIsotypicComponent_eq_iff` (Orbit/Index.lean 345), `h = 1` | stabilizer of `χ₁`-line = `D₄`, order 8, index 3 = number of components; probe: same component ↔ `g ∈ inertia`, proved | holds over every field | C01 |
| §5.2 equivariance for left multiplication on `G ⧸ T` | pin lemma Index.lean 309; `S₄ ⊵ V₄`, 3-cycle | `e(comp(gh·σ)) = [gh] = g·[h]`, proved in probe; 3-cycle cycles 3 components and 3 cosets of `D₄` | holds given translation step | C01 |
| §5.2 "is `MulAction.orbitEquivQuotientStabilizer`" | definition at Index.lean 297; Mathlib Quotient.lean 169 | pinned equivalence is built from `orbitEquivQuotientStabilizer` composed with `quotientEquivOfEq`; base point goes to `[1]` | holds up to the identification of stabilizer with inertia | none |
| §5.2 new Check | `S₃ ⊵ A₃` over `ℂ`, 2-dim `W` | 3-cycle `c` has eigenvalues `ω, ω²`; `τcτ⁻¹ = c⁻¹`, so `ρ(τ)` swaps eigenlines; `T = A₃`, `|G ⧸ T| = 2`; `2 = e·[G:T]·dim V = 1·2·1` | true; a trivial action would give `T = S₃` | none |
| §5.2 over a non-splitting field | `S₃ ⊵ A₃` over `ℚ` | `Res_{A₃} W` simple of dimension 2 (`ℚ(ω)`), one component, `T = S₃`, one coset; `2 = 1·1·2` | consistent with dimension formula | none |
| Headline: Clifford's theorem over every field (cited by the bullet) | `S₃ ⊵ A₃` over `ℂ` and `ℚ` | `ℂ`: `λ ⊕ λ²`, `e = 1`, 2 cosets. `ℚ`: one conjugate, `e = 1`, 1 coset | holds | none |
| `Suggested.lean` docstring paragraph | Clifford/Basic.lean 152, 156 | both laws exist under `TauCeti.Representation` with the stated content; file elaborates, 13 `sorry` | true | none |
| Contracts: six new Tau Ceti names | Basic.lean 152, 156, 178, 201; Orbit/Basic.lean 149; Orbit/Index.lean 107 | all exist; `[Field k] [Group G]`, `N` normal, `[ρ.IsIrreducible]`, `[FiniteDimensional k V]`; no finiteness of `G` | match §5.2 | N01 |

- Source locators in the changed text: 0 (the bullet cites no source).
- Library declarations opened at the pins: 12 in Tau Ceti (`Induction/Clifford/Basic.lean` 114, 152, 156, 178, 201; `Clifford/Orbit/Basic.lean` 149, 205; `Clifford/Orbit/Index.lean` 107, 297, 309, 335, 345) and 1 in Mathlib (`GroupTheory/GroupAction/Quotient.lean` 169).
- Cross-roadmap citations resolved: the change adds none. ArithmeticGaloisRepresentations on main names `Representation.conjSubrep` as a library declaration only.
- Overlap check: read FiniteGroupInvariants, GlaubermanZStar, CohomologyOfGroups (open) and ModularCharactersAndBlocksPartII, ModularInduction, CharacterTheory (main); nothing shared. ModularCharactersAndBlocksPartII consumes Clifford theory from this roadmap; no other roadmap, open or on main, states the action on components.
- Elaboration: `Suggested.lean` 13 `sorry` warnings only; the probe no warnings.
- Dependency check: 112 roadmaps, 1287 edges, 0 problems (no upward supplier, no cycle).
- README at the merge base against this head: insertions only; 12 layer ids kept with their subjects.

Source independence: changed passages only; 0 passages compared with a source text, since the changed passages cite no source and are worded on Tau Ceti declaration names; largest share Serre GTM 42, 12 of 40 mentions of Serre, Isaacs, Curtis–Reiner, Mackey and Weibel; arrangement not compared (no layer added, removed or reordered).

Research link: Layer 5 is Clifford theory over arbitrary fields (Curtis–Reiner 1981, §11; Isaacs 1976, Ch. 6) and Layer 7 universal central extensions and Schur multipliers (Weibel 2013, Ch. III §5); block theory in ModularCharactersAndBlocksPartII consumes the Clifford correspondence. Rests on the README's overview and references.

## Not verifiable

- The locators of §5.2's untouched text (Curtis–Reiner, *Methods of Representation Theory* Vol. I, §11; Isaacs, *Character Theory of Finite Groups*, Ch. 6): commercial books with no legal copy recorded for this roadmap. The changed text cites neither; its mathematics was verified by computation and at the pins.

Automatic checks set aside as false positives: eight Lean names the citation resolver found nowhere (six of §7.1 and one of §2.1 are declared in this roadmap's `Suggested.lean`; the eighth is the roadmap's own namespace); and a signature lead that the commutator subgroup of the free group in §7.1 lost a `[Group G]` binder, which its type does not need. All lie in untouched text.

## Source issues

- none

## For the human reviewers

- Not tested: Serre GTM 42, the source with the largest share of the locators, was not read. The changed passages cite no source and no layer moved, so neither wording nor arrangement was compared with it.
