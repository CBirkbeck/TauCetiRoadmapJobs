# Review of InductionRestriction (pull request #3027 at 45a4865)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 81 changed lines since `74a09b7`. I checked the new §6.2 (Brauer's theorem in degree zero, now over every field of characteristic zero containing a primitive root of unity of order the exponent), its route, its two Checks, the lines of the overview, Layer 6, the scope and the supplier contracts that cite it, the README at the merge base, and the description. The earlier finding and both earlier small corrections are repaired; the statement and both Checks hold on the trivial group, `C₃`, `S₃` and `Q₈`, and every library declaration it names exists at the pins with the stated hypotheses. Accepted, with no finding, no small correction and no format note. Deligne's paper is behind a paywall, so its locator and field hypothesis are left to the human reviewers.

<details><summary>What was checked</summary>

The worker's automatic checks all passed. The check that every supplier comes earlier in the merge order and that no roadmaps cite each other in a cycle read 131 roadmaps and 1464 citations and reported `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`. `Suggested.lean`, which the pull request does not change, elaborates with 13 `sorry` warnings and nothing else; a probe of the §6.2 statement over a field `k` of characteristic zero with a primitive root of unity of order `Monoid.exponent G` elaborates at the pins with `sorry` only. The README at the merge base was compared with the head: all 12 layer ids keep their subjects, §6.2 is a new id, and the deleted lines are rewrapped or extended sentences. The family index of `TauCetiRoadmap/RepresentationTheory/` is unchanged, and no file outside the pull request's named folders changes. The seeded-sample target in the changed text is §6.2; the other sampled targets lie in untouched text the change does not affect. The description's sentences about this roadmap (it gains §6.2 over the stated fields, 10.0a of BaseChangeAndGaloisRepresentationsForUnitaryGroups is its corollary, nothing is removed or renumbered, no supplier is gained, `Suggested.lean` is unchanged) agree with the head.

## Previous findings

- R01 — repaired: §6.2 now opens "Let `G` be finite, `e` its exponent, and `k` a field of characteristic zero containing a primitive `e`-th root of unity", with `V : FDRep k G`, `finrank k V` and `χ : H →* kˣ`, and the route adds the descent from an algebraic closure.
- C01 — repaired: the route now reads "the inflation is Mathlib's `Rep.res` along `QuotientGroup.mk' Z`", and the *Needs:* line names `TauCeti.IsElementary.subgroup`, which is also in the Tau Ceti contract.
- C02 — repaired: the description now says "InductionRestriction gains §6.2, Brauer's theorem in degree zero (Deligne 1973, Proposition 1.5), over every field of characteristic zero containing a primitive root of unity of order the exponent of the group".
- N01 — repaired: §6.2 has two Checks, the `S₃` computation and the negative control over `ℚ`.

## Not verifiable

- Deligne 1973, Proposition 1.5 and Scholie 1.6, p. 510 (§6.2 and its reference entry): the chapter in Springer LNM 349 (DOI 10.1007/BFb0066719) is behind a paywall and the source is recorded as cited by its locator without the text. The locator, "with `H` elementary" and the attribution "Deligne's form" are unverified against the text; the mathematics of §6.2 was verified independently.

Automatic checks set aside as false positives: eight Lean names in the README that the citation resolver found nowhere (six names of §7.1 and one of §2.1 are declared in this roadmap's `Suggested.lean`, and the eighth is the roadmap's own namespace); and a signature lead that the commutator subgroup of the free group in §7.1 lost a `[Group G]` binder (a free group is a group for any index type). All are in untouched text.
</details>

## Verified sound

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §6.2 | `G = 1` (`e = 1`, any `k` of characteristic 0), `V = kⁿ`; `V = 0` | `χ − n = 0`, the empty combination | holds | none |
| §6.2 | `C₃` over `ℚ(ζ₃)`, `V = ω` | `ω − 1 = Ind_{C₃}^{C₃}(ω − 1)`, one generator | holds | none |
| §6.2, first Check | `S₃`, `ψ = (2,0,−1)` | `Ind_{A₃}ω − Ind_{A₃}1 = (2,0,−1) − (2,0,2) = (0,0,−3)`; `Ind sign − Ind 1 = (3,−1,0) − (3,1,0) = (0,−2,0)`; sum `(0,−2,−3) = ψ − 2` | Check true | none |
| §6.2, second Check | `S₃` over `ℚ` | elementary subgroups `1`, three `C₂`, `A₃` (`S₃` not nilpotent); generators `0` or `(0,−2,0)`; `ψ − 2 = −3` on 3-cycles | Check true; hypothesis needed | none |
| §6.2, hypothesis | `C₃` over `ℚ`, `V` simple of dimension 2 | `χ − 2 = (0,−3,−3)`; only trivial linear characters of `1`, `C₃`, all generators `0` | fails without roots of unity, as stated | none |
| §6.2 over a non-closed `k` | `Q₈` over `ℚ(i)` (`e = 4`), 2-dimensional `V`, classes `1, −1, i, j, k` | `(0,−4,−2,−2,−2) = Ind_{⟨i⟩}(λ − 1) (0,−4,−2,0,0) + (ε − 1) (0,0,0,−2,−2)`, values in `ℚ(i)` | holds | none |
| §6.2, descent to `k` | `χ : H → k̄ˣ`, `H ≤ G` | `χ(h)^e = 1`; `μ_e(k̄) = ⟨image of ζ_e⟩`, order `e`; `k → k̄` injective; `indClassFun` is a coset sum with no division | step valid | none |
| §6.2, reduction to elementary groups | `1 = Σ nᵢ Ind_{Eᵢ} θᵢ` | `χ − d = Σ nᵢ Ind(θᵢ · Res(χ − d))`, each of degree `θᵢ(1) · 0 = 0`; `S₃`: `1 = (3,1,0) − (2,0,−1)` | step valid | none |
| §6.2, centre step | `ρ = Ind_H^E χ` irreducible, `E` nilpotent | `ρ − [E:H] = Ind_H(χ − 1) + (Ind_H 1 − [E:H])`; second term inflated from `E/Z` when `Z ≤ H`; `Q₈`: `−1 ∈ ⟨i⟩` | step valid | none |
| §6.2, Lean reading | probe with `IsPrimitiveRoot ζ (Monoid.exponent G)`, `IsElementary ↥H`, `H →* kˣ`, `Subgroup.indClassFun` | elaborates, `sorry` warning only | statable | none |
| Contract: `TauCeti.IsElementary.subgroup`, `.isNilpotent` | `GroupTheory/Elementary.lean` lines 391, 441 | `IsElementary G → ∀ K, IsElementary ↥K`; `[Finite G]`, `IsElementary G → Group.IsNilpotent G` | match | none |
| Contract: monomiality | `RepresentationTheory/Induction/Monomial.lean` line 81 | `[IsAlgClosed k] [CharZero k] [Finite G] [Group.IsNilpotent G]`, `W` simple, `χ_W = indClassFun H χ` | matches "algebraically closed, characteristic zero, `W` simple" | none |
| Contract: `FDRep.character_baseChange` | `RepresentationTheory/BaseChange.lean` line 329 | `{K L : Type u}`, character of `L ⊗ V` is `algebraMap K L ∘ V.character` | matches "both fields in one universe" | none |
| Contract: `Rep.res`, `QuotientGroup.mk'`, `AlgebraicClosure` | Mathlib `RepresentationTheory/Rep/Res.lean` line 43; `GroupTheory/QuotientGroup/Defs.lean` line 88; `FieldTheory/IsAlgClosed/AlgebraicClosure.lean` line 127 | restriction along `H →* G`; `G →* G ⧸ N`; `Type u` in the universe of `k` | exist as cited | none |
| Layer 6 Brauer theorem (cited by §6.2) | `Induction/Brauer/Induction.lean` lines 82, 127 | `[CharZero k] [IsAlgClosed k]`, lattice induced from elementary subgroups equals the virtual-character lattice | matches the route's first step | none |
| Headline §5.2 (untouched) | `S₃ ⊵ A₃`, 2-dimensional `W`, over `ℂ` and `ℚ` | `ℂ`: `ω ⊕ ω²`, `e = 1`, `[G:T] = 2`; `ℚ`: restriction simple, `T = G` | holds | none |
| Headline §5.3 (untouched) | `S₃`, `V = ω` of `A₃` | `T = A₃`; `Ind ω` is the only simple over `ω`: 1 ↔ 1 | holds | none |
| Headline §7.1 (untouched) | `A₅` | `[F,F]/[F,R]` of order 120, kernel `ℤ/2` | holds | none |
| Headline §7.5 (untouched) | `Q₈`, `N = Z`, faithful `V` | no linear extension; class nonzero in `H²(V₄, ℂˣ) ≅ ℤ/2` | holds | none |

- Source locators of the changed text: 1 (Deligne 1973), unreadable; 0 verified against a text.
- Library declarations opened at the pins: 6 in Tau Ceti (`GroupTheory/Elementary.lean` 131–144, 391, 441; `Induction/Monomial.lean` 81; `BaseChange.lean` 329; `Induction/ClassFunction.lean` 194; `Induction/Brauer/Induction.lean` 82, 127) and 3 in Mathlib (above).
- Cross-roadmap citations resolved: 1 consumer, BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a (line 140 at this head), which cites §6.2 as its general form and states the weaker complex form with `H` any subgroup. A search of main and the open heads finds the degree-zero theorem stated only there and here (ClassicalArithmeticCompletion uses it as a proof step and states nothing).
- Overlap check: read ArtinRepresentations, GlaubermanZStar, CohomologyOfGroups (open) and ModularCharactersAndBlocksPartII, ModularInduction, CharacterTheory (main); nothing shared: the owner of §6.2 is InductionRestriction.
- Elaboration: `Suggested.lean` gives 13 `sorry` warnings only; the §6.2 probe gives one `sorry` warning. No declaration was added or changed, so no one-tactic probe and no new `#check` comparison was needed.
- README at the merge base against the head: 12 layer ids kept with their titles, one section added (§6.2), nothing removed or reduced to names.
- Order of suppliers: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no citation of a later roadmap and no cycle.

Source independence: changed passages only; 0 passages compared with the 1 cited source (Deligne 1973 unreadable). The §6.2 route shares wording with BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a, the project's own text in the same pull request. Largest share of locators: Serre GTM 42, 11 of the 36 mentions of Serre, Isaacs, Curtis–Reiner, Deligne and Weibel in the layers (other sources not counted). Arrangement not compared: no layer is added, removed or reordered.

Research link: §6.2 is Deligne's degree-zero form of Brauer's induction theorem (Deligne 1973, Proposition 1.5), by which the Langlands–Deligne local constants are inductive in degree zero; BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a uses it. Layers 5 and 7 are Clifford theory and Schur multipliers (Isaacs 1976). Rests on the README's references and that consumer.

## Source issues

- none

## For the human reviewers

- Not tested: Deligne 1973 (Springer LNM 349), the only source of the changed text, is behind a paywall; §6.2's wording was not compared with it, and its locator (Proposition 1.5, Scholie 1.6, p. 510) and field hypothesis are unverified.
- Neither recorded decision applies to this folder: BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a keeps its statement and cites §6.2 as its general form.
