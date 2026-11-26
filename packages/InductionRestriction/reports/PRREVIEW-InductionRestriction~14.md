# Review of InductionRestriction (pull request #3170 at 57376f9)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 21 changed lines since `87e7f72`. I checked the new §5.2 bullet against the pinned Tau Ceti and Mathlib: the translation action on `N`-subrepresentations and on isotypic components, its transitivity, its stabilizer and its equivariance. I also checked its Check, the new paragraph of the `Suggested.lean` docstring, the new supplier-contract names and the description. Every claim holds on `S₃ ⊵ A₃`, `C₄ ⊵ C₂` and `S₄ ⊵ V₄`, every cited declaration exists at the pin with the hypotheses §5.2 has, and a probe that packages the action and states the three claims elaborates. Accepted, with two small corrections and one format note, none blocking. The two small corrections are that the *Needs:* line leaves out the pinned lemmas that do most of the work, and that the description's general sentence about `Suggested.lean` does not hold for this folder. For the human reviewers there is one fact: the sources of §5.2 are not legally readable, though the changed text cites neither of them.

## C01 — The *Needs:* line of the new §5.2 bullet leaves out the two pinned lemmas that carry the stabilizer and equivariance claims, and the one step that is not at the pin

An implementer who reads the *Needs:* line (README line 756) would think the stabilizer claim goes through `Representation.mem_inertia_fdRepOf_toRepresentation_iff`. They would also find no input at all for the equivariance claim. Tau Ceti has more direct inputs for both:

- `Representation.conjSubrepIsotypicComponent_eq_iff` (`RepresentationTheory/Induction/Clifford/Orbit/Index.lean` line 345) says that the components of the translates by `g` and `h` agree exactly when `g⁻¹h` lies in the inertia group. With `h = 1` and `conjSubrep_one`, that gives the stabilizer claim in a single chain of rewrites. I proved it that way at the pins.
- `Representation.isotypicComponentsEquivQuotientInertia_conjSubrepIsotypicComponent` (same file, line 309) sends the component of the translate by `h` to the coset of `h`. That is the equivariance computation.

What neither lemma gives, and nothing at the pin states, is that `ρ(g)` carries the isotypic component of `τ` onto that of `conjSubrep ρ g τ`. This step is also what makes the action on components well defined. Adding the two lemmas to the *Needs:* line, and naming this translation step as part of the target, would show an implementer exactly what is new.

## C02 — The description's general sentence about `Suggested.lean` does not hold for this folder

The description says that "Planned Prop-valued statements are declared with `sorry` in the folder's `Suggested.lean`". This folder declares none of its three new Prop-valued claims (transitivity, stabilizer, equivariance). Its `Suggested.lean` gains only a docstring paragraph, which says the action is data and is not stated. Leaving them out is right: none of them is a headline, and the stabilizer claim follows in one step from a pinned lemma (C01). The InductionRestriction bullet of the description could end "`Suggested.lean`: no declaration; a docstring paragraph names the action and its laws".

## N01 — Four of the new names lack their namespace, and two names the bullet uses are missing from the contracts

In the Layer 5 line of the Tau Ceti contracts (lines 1524–1525), `conjSubrep_one`, `conjSubrep_conjSubrep`, `isAtom_conjSubrep_iff` and `isotypicComponents_eq_range` appear without `TauCeti.Representation.`. The first two also appear that way in the bullet itself (lines 750–751). Separately, the contracts list neither `TauCeti.Representation.conjSubrep` nor Mathlib's `MulAction.orbitEquivQuotientStabilizer` (`GroupTheory/GroupAction/Quotient.lean` line 169), although the new bullet uses both.

<details><summary>What was checked</summary>

The worker's automatic checks all passed. The dependency check confirms that every supplier a roadmap cites comes earlier in the merge order and that no two roadmaps supply each other. It read 119 roadmaps and 1379 supplier edges and found no problem, so this roadmap has no upward supplier and no cycle. `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else. The change adds no declaration and alters none, so no one-tactic probe was needed. A separate probe file at the pins tested the new §5.2 bullet as written:
- it defines `G →* (Subrepresentation ≃o Subrepresentation)` with value `conjSubrepOrderIso ρ g`, with a real body and no `sorry`;
- it proves the stabilizer statement in component form from `conjSubrepIsotypicComponent_eq_iff`;
- it states the translation step and the equivariance against `isotypicComponentsEquivQuotientInertia` and left multiplication on `G ⧸ T`. Both elaborate with `sorry` only.

The README at the merge base was compared with this head. The diff only inserts lines: 12 layer ids keep their titles, and nothing is removed, renumbered or reduced to names. No file outside the pull request's named folders changes, and the family index of `TauCetiRoadmap/RepresentationTheory/` is unchanged. The other open pull request that changes this roadmap adds §6.2 and touches neither §5.2 nor the Layer 5 contract line. The two heads merge cleanly, and the description orders them.

Of the seeded sample, only the §5.2 target falls in changed text. The other sampled targets lie in untouched text that the change does not affect.

Previous findings: the previous review of this folder was of another pull request's change. It was accepted and left no open finding, small correction or format note.
</details>

## Verified sound

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §5.2 action on `N`-subrepresentations | `conjSubrep_conjSubrep` (Basic.lean 156), `RelIso.mul_apply` | `g·(h·σ) = ρ(g)ρ(h)σ = (gh)·σ`; `1·σ = σ` (line 152); probe hom elaborates, no `sorry` | left action, as stated | none |
| §5.2 action, degenerate `N` | `N = G`; `N = 1` | `N = G`: `conjSubrep_eq_self_of_mem`, trivial action. `N = 1`: one component (all of `W`), inertia `G`, `|G ⧸ T| = 1` | holds | none |
| §5.2 transitivity | `S₄ ⊵ V₄`, standard 3-dim `W` over `ℂ` | `Res = χ₁ ⊕ χ₂ ⊕ χ₃`; `S₄/V₄ ≅ S₃` permutes the 3 nontrivial characters transitively | holds | none |
| §5.2 stabilizer = inertia | same `S₄ ⊵ V₄` | stabilizer of `χ₁` = preimage of a `C₂` = `D₄`, order 8; `[S₄:D₄] = 3` components; agrees with the §5.3 Check | holds | none |
| §5.2 stabilizer, Lean reading | probe, `conjSubrepIsotypicComponent_eq_iff` (Index.lean 345) with `h = 1` | component of `conjSubrep ρ g σ` = component of `σ` ↔ `g ∈ inertia (FDRep.of σ.toRepresentation)`; proved | holds over every field | C01 |
| §5.2 equivariance | `e(comp(h·σ)) = [h]` (Index.lean 309); `S₄ ⊵ V₄`, 3-cycle `c` | `e(g·comp(h·σ)) = [gh] = g·[h]`; `c` cycles 3 components and 3 cosets of non-normal `D₄` | holds, given translation step | C01 |
| §5.2 "is `orbitEquivQuotientStabilizer`" | base point `c_σ` | `e(c_σ) = [1]` by `conjSubrep_one`; equivariant bijection of transitive sets fixed by base point | holds up to `quotientEquivOfEq` | none |
| §5.2 new Check | `S₃ ⊵ A₃` over `ℂ`, 2-dim `W` | 3-cycle eigenvalues `ω, ω²`; `τcτ⁻¹ = c⁻¹` so `ρ(τ)` swaps eigenlines; `T = A₃`, `|G/T| = 2`, `2 = 1·2·1` | Check true; excludes trivial action | none |
| §5.2 action over non-split `k` | `S₃ ⊵ A₃` over `ℚ`; `C₄ ⊵ C₂` over `ℚ` | `ℚ`: `Res_{A₃}` simple, one component, `T = S₃`; `C₄`: `2·sign`, one component, `T = G` | consistent with §5.2–5.3 Checks | none |
| Headline §5.2 (cited by the bullet) | `S₃ ⊵ A₃` over `ℂ` | `Res W ≅ λ ⊕ λ²`, `e = 1`, `[G:T] = 2`, `finrank W = 2` | holds | none |
| `Suggested.lean` docstring sentence | Basic.lean lines 152, 156 | `TauCeti.Representation.conjSubrep_one`, `.conjSubrep_conjSubrep` exist with the stated laws; file elaborates, 13 `sorry` | true | none |
| Contract: new Tau Ceti names | Basic.lean 178, 201; Orbit/Basic.lean 149; Orbit/Index.lean 107, 297 | `[Field k] [Group G]`, `N` normal; `[ρ.IsIrreducible]`; `[FiniteDimensional k V]`, `k`, `V` one universe; no finiteness of `G` | match §5.2's hypotheses | N01 |

- Source locators in the changed text: 0 (the bullet adds none); §5.2's locators are not legally readable (below).
- Library declarations opened at the pins: 13 in Tau Ceti (`Induction/Clifford/Basic.lean` 114, 152, 156, 178, 191, 201; `Clifford/Orbit/Basic.lean` 149, 205; `Clifford/Orbit/Index.lean` 107, 297, 309, 345; `Induction/Inertia.lean` 94). 3 in Mathlib (`GroupTheory/GroupAction/Quotient.lean` 82, 169; `RingTheory/SimpleModule/Isotypic.lean` 185).
- Cross-roadmap citations resolved: the change adds none. ArithmeticGaloisRepresentations on main cites `Representation.conjSubrep` as a library declaration only.
- Overlap check: read FiniteGroupInvariants, GlaubermanZStar, CohomologyOfGroups (open) and ModularCharactersAndBlocksPartII, ModularInduction, CharacterTheory (main). Nothing is shared. ModularCharactersAndBlocksPartII and FiniteGroupInvariants consume Clifford theory and `TauCeti.inertia` from this roadmap. The owner of the action on components is InductionRestriction §5.2.
- Elaboration: `Suggested.lean` gives 13 `sorry` warnings only. The §5.2 probe gives 3 `sorry` warnings (translation step, membership in the probe's action on components, equivariance) and proves the action hom and the stabilizer statement.
- Order of suppliers: the dependency check read 119 roadmaps and 1379 supplier edges and found no upward supplier and no cycle.
- README at the merge base against this head: 21 lines inserted and none deleted; 12 layer ids kept with their subjects.

Source independence: changed passages only. 0 passages were compared with a source text, because the changed passages cite no source and their wording is built on Tau Ceti declaration names. Largest share of locators: Serre GTM 42, 11 of the 36 mentions of Serre, Isaacs, Curtis–Reiner, Mackey and Weibel in the layers. Arrangement not compared: no layer is added, removed or reordered.

Research link: Layer 5 is Clifford theory over every field (Curtis–Reiner 1981 §11; Isaacs 1976 Ch. 6), and Layer 7 covers Schur multipliers and universal central extensions (Isaacs 1976 Ch. 11; Weibel 2013 Ch. III §5). ModularCharactersAndBlocksPartII (block theory) and StableHomotopyKTheory consume them. This rests on the README's overview and references.

## Not verifiable

- §5.2's locators, Curtis–Reiner *Methods of Representation Theory* Vol. I §11 (Wiley 1981) and Isaacs *Character Theory of Finite Groups* Ch. 6 (Academic Press 1976; AMS Chelsea): commercial books, and the roadmap's manifest records no legal copy of either. The mathematics of the new bullet was verified independently.

Automatic checks set aside as false positives: eight Lean names that the citation resolver found nowhere. Six are names of §7.1 and one is a name of §2.1, all declared in this roadmap's `Suggested.lean`; the eighth is the roadmap's own namespace. Also set aside is a signature lead that the commutator subgroup of the free group in §7.1 lost a `[Group G]` binder, which it does not need. All of these are in untouched text.

## Source issues

- none

## For the human reviewers

- Not tested: Serre GTM 42, the source with the largest share of the locators, was not read. The changed passages cite no source and no layer moved, so neither the wording nor the arrangement was compared with it.
