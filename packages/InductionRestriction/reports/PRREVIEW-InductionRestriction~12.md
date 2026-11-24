# Review of InductionRestriction (pull request #3027 at 644c332)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 46 changed lines since `74a09b7`. I checked the new §6.2 (Brauer's theorem in degree zero), the lines that cite it and the README at the merge base. The statement and its route are correct on C₂, S₃ and Q₈ and the statement elaborates at the pins, but the section is stated over ℂ only. Layer 6's Brauer theorem, both Tau Ceti inputs and, by the README's own parenthesis, Deligne's statement all hold over wider fields (one finding). There are also two small corrections and one format note, none blocking; Deligne's paper is behind a paywall and was not read, which is left to the human reviewers.

## R01 (P2) — §6.2 states Brauer's theorem in degree zero over ℂ only, although every input it uses, and by the README's own account its source, give it over a wider class of fields

Formalised as written, §6.2 is a theorem about `FDRep ℂ G`. A consumer working over another algebraically closed field of characteristic zero, such as `ℚ̄_ℓ` for ℓ-adic representations, could not apply it. It would also be narrower than the Layer 6 Brauer theorem it refines.

The section opens "Let `G` be finite and work over `ℂ` (Deligne states it over every field containing the roots of unity of order the exponent of `G`)" (README line 952). The Layer 6 preamble (line 842) puts the induction theorems over an algebraically closed field of characteristic zero. The two inputs the route names carry exactly `[IsAlgClosed k] [CharZero k]` at the pin: `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` (`RepresentationTheory/Induction/Brauer/Induction.lean`, line 82) and `FDRep.exists_character_eq_indClassFun_of_isNilpotent` (`RepresentationTheory/Induction/Monomial.lean`, line 81). No step of the route uses anything particular to ℂ. The pull request's description also says that each section it adds to a general roadmap is stated in the generality of its source, and it names no exception for this one.

The smallest change is: "Let `G` be finite and `k` an algebraically closed field of characteristic zero (`ℂ`, for instance)", with `V : FDRep k G`, `finrank k V` and `χ : H →* kˣ`. In that form the statement elaborates at the pins with the same declarations. If Deligne's hypothesis is the one the parenthesis gives, his wider form follows in one sentence: for a field `K` of characteristic zero containing the `e`-th roots of unity, apply the theorem over an algebraic closure. The linear characters of subgroups take values in `μ_e ⊂ K`, and `K → K̄` is injective, so the identity holds in `K`. The author could state that form as well, or keep the parenthesis as a remark. BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a, stated over ℂ, stays a corollary either way.

## C01 — Two library pointers in §6.2 lead somewhere other than they say

The route (line 966) says "Mathlib `Rep.ofQuotient` for the inflation". At the pin, `Rep.ofQuotient` (`Mathlib/RepresentationTheory/Rep/Res.lean`, line 149) runs the other way: it takes a representation of `G` that is trivial on a normal subgroup `S` to a representation of `G ⧸ S`. Inflation is restriction along the quotient map, `Rep.res (QuotientGroup.mk' Z)`, and `Rep.resOfQuotientIso` (line 154) identifies the two. Suggested wording: "(Mathlib `Rep.res (QuotientGroup.mk' Z)` for the inflation, and `Rep.ofQuotient` with `Rep.resOfQuotientIso` to recognise a representation trivial on `Z` as an inflation)".

The *Needs:* line (lines 967–968) attributes "the elementary-subgroup predicates with their closure under subgroups" to Layer 6, but Layer 6 does not state closure under subgroups. Tau Ceti has it as `TauCeti.IsElementary.subgroup` (`GroupTheory/Elementary.lean`, line 391). Would name it there and beside `TauCeti.IsElementary.isNilpotent` in the From Tau Ceti contract.

## C02 — The description does not mention that this roadmap gains a section

The description says that "49 existing roadmaps receive 196 sections" without listing them, and it names InductionRestriction nowhere. A reader of the description cannot tell that this roadmap on `main` gains §6.2, a reference and two supplier declarations. Text that would be right: "InductionRestriction gains §6.2, Brauer's theorem in degree zero (Deligne 1973, Proposition 1.5), with Deligne's paper in its references and `TauCeti.IsElementary.isNilpotent` and `FDRep.exists_character_eq_indClassFun_of_isNilpotent` in its supplier contracts. BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a is now its corollary. No section of InductionRestriction is removed or renumbered, and its `Suggested.lean` is unchanged."

## N01 — §6.2 has no Check

Would add one that a reader can compute. On `S₃`, with values listed on the classes of `1`, the transpositions and the 3-cycles, the standard character gives `χ − 2 = (0, −2, −3)`. This equals `Ind_{A₃}(ω − 1) + Ind_{⟨(1 2)⟩}(sign − 1) = (0, 0, −3) + (0, −2, 0)`. For the route's first step, Brauer's expression of the trivial character is `1 = Ind_{⟨(1 2)⟩} 1 − Ind_{A₃} ω = (3, 1, 0) − (2, 0, −1)`. `Q₈` would also exercise the induction through the centre.

<details><summary>What was checked</summary>

The worker's automatic checks all passed. The check that every supplier a roadmap cites comes earlier in the merge order, and that no roadmaps cite each other in a cycle, read 131 roadmaps and 1464 citations between them and found no problem: this roadmap cites no later roadmap and is in no cycle. `Suggested.lean`, which this pull request does not change, elaborates with 13 `sorry` warnings and nothing else. The README at the merge base was compared with the head: every layer id keeps its subject, §6.2 is a new id, and the six deleted lines are rewrapped text. No file outside the pull request's named folders changes. No earlier review of this pull request exists for this folder. The seeded-sample target in the changed text is §6.2; the other sampled targets are untouched by the change.

Not verifiable:
- Deligne 1973, Proposition 1.5 and Scholie 1.6, p. 510 (§6.2 and its reference entry): the chapter in Springer LNM 349 (DOI 10.1007/BFb0066719) is behind a paywall. The IAS page of Deligne's publications refused access (HTTP 403). Numdam has only the 1969–70 Séminaire Delange–Pisot–Poitou exposé of a similar title (exp. 19 bis), and its text has no section on Brauer's theorem. The locator, "with `H` elementary" and the field hypothesis attributed to Deligne are therefore unverified.

Automatic checks set aside as false positives: eight Lean names in the README that the citation resolver found nowhere (six names of §7.1 and one of §2.1 are declared in this roadmap's `Suggested.lean`, and the eighth is the roadmap's own namespace). Also a signature lead saying that the commutator subgroup of the free group in §7.1 lost a `[Group G]` binder (a free group is a group for any index type). All of these are in untouched text.
</details>

## Verified sound

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §6.2 | `G = 1`, `V = ℂⁿ`; `V = 0` | `χ − n = 0`, the empty combination | holds | none |
| §6.2 | `C₂`, `V = sign` | `χ − 1 = (0, −2) = Ind_{C₂}^{C₂}(sign − 1)` | holds | none |
| §6.2 | `S₃`, standard `V` | `(0,−2,−3) = Ind_{A₃}(ω−1) (0,0,−3) + Ind_{⟨(12)⟩}(sign−1) (0,−2,0)` | holds | N01 |
| §6.2, inflation step | `Q₈` (2-elementary), 2-dim `V` | `(0,−4,−2,−2,−2) = Ind_{⟨i⟩}(λ−1) (0,−4,−2,0,0) + (ε_i∘π − 1) (0,0,0,−2,−2)` | holds | none |
| §6.2, "subgroup contains the centre" | `ρ = Ind_H^E χ` irreducible | `χ` extends to `HZ`; `ρ ⊆ Ind_{HZ}`, so `[E:HZ] ≥ [E:H]`, `Z ≤ H`; `Q₈`: `−1 ∈ ⟨i⟩` | holds | none |
| §6.2, Brauer reduction | `S₃`, trivial character | `1 = (3,1,0) − (2,0,−1)`; `θ·Res ρ` has degree `θ(1)·0 = 0` | holds | none |
| §6.2, generality | `k = ℚ̄`, `ℚ̄_ℓ` | both inputs need only `[IsAlgClosed k] [CharZero k]`; section fixed to ℂ; `k`-form elaborates | narrower than its inputs | R01 |
| §6.2, Lean reading | probe on `Subgroup.indClassFun`, `IsElementary ↥H`, `H →* ℂˣ` | elaborates, `sorry` warning only | statable | none |
| §6.2, field remark | `K = ℚ(ζ_e)` | `K` splits `G`; linear characters of subgroups lie in `μ_e ⊂ K`; identity descends from `K̄` | true; source unread | none |
| §6.2 needs `IsElementary.isNilpotent` | `GroupTheory/Elementary.lean` 441 | `[Finite G]`, `IsElementary G → Group.IsNilpotent G` | matches contract | none |
| §6.2 needs monomiality | `Induction/Monomial.lean` 81 | `IsAlgClosed`, `CharZero`, finite nilpotent, `W` simple ⇒ `χ_W = indClassFun χ` | matches contract | none |
| §6.2 route `Rep.ofQuotient` | `Rep/Res.lean` 149 | `Rep k G` trivial on `S` → `Rep k (G ⧸ S)`: descent | misnamed as inflation | C01 |
| §6.2 needs closure under subgroups | Layer 6 text; `Elementary.lean` 391 | Layer 6 silent; Tau Ceti `IsElementary.subgroup` | misplaced pointer | C01 |
| Headline §5.2 | `S₃ ⊵ A₃`, standard `W`, over ℂ and ℚ | ℂ: `ω ⊕ ω²`, `e = 1`, `[G:T] = 2`; ℚ: restriction simple of dim 2, `T = G` | holds (untouched) | none |
| Headline §5.3 | `S₃`, `V = ω` of `A₃` | `T = A₃`; `Ind ω` = standard, the only simple over `ω`: 1 ↔ 1 | holds (untouched) | none |
| Headline §7.1 | `A₅` | `[F,F]/[F,R] ≅ SL₂(𝔽₅)`, order 120, kernel `ℤ/2 = H₂(A₅, ℤ)` | holds (untouched) | none |
| Headline §7.5 | `Q₈`, `N = Z`, `V` faithful | `[Q₈,Q₈] = Z`, so no linear extension; class `≠ 0` in `H²(V₄, ℂˣ) ≅ ℤ/2` | holds (untouched) | none |

- Source locators of the changed text: 1 (Deligne 1973), unreadable. One related legal text was read (the Numdam exposé), and it does not contain the statement.
- Library declarations opened at the pins: Tau Ceti `GroupTheory/Elementary.lean` lines 131–147, 391 and 441; `Induction/Monomial.lean` line 81; `Induction/ClassFunction.lean` lines 194 and 466; `Induction/Brauer/Induction.lean` lines 82 and 127. Mathlib `Rep/Res.lean` lines 149 and 154, and `RepresentationTheory/Basic.lean` line 352. Mathlib has nothing on Brauer induction.
- Cross-roadmap citations resolved: BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a (head, line 139) cites §6.2 and states the weaker form, with `H` any subgroup. Searches of main and the 444 open heads found Brauer's theorem in degree zero only there and here.
- Overlap check: I read ArtinRepresentations, GlaubermanZStar and CohomologyOfGroups (open), and ModularCharactersAndBlocksPartII, ModularInduction and CharacterTheory (main). Nothing is shared: ArtinRepresentations and ModularInduction cite InductionRestriction Layer 6 and own no degree-zero statement, and the owner of §6.2 is InductionRestriction.
- Elaboration: `Suggested.lean` gives 13 `sorry` warnings only. The two §6.2 probes (over ℂ, and over an algebraically closed field of characteristic zero) elaborate with `sorry` only. No declaration was added, so no one-tactic probe was needed.
- README at the merge base against the head: 12 layer ids kept with their titles, one section added (§6.2), nothing removed or reduced to names.
- Order of suppliers: 131 roadmaps and 1464 citations between them read; no citation of a later roadmap and no cycle, for this roadmap or any other.

Source independence: changed passages only. I made no comparison with the cited source (Deligne 1973 unreadable). The §6.2 route shares its wording with BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a, the project's own text in the same pull request. The largest share of locators is Serre GTM 42, 11 of 40 source mentions. I did not compare the arrangement, since no layer is added, removed or reordered.

Research link: §6.2 is Deligne's degree-zero form of Brauer's induction theorem (Deligne 1973, Proposition 1.5). It is the input by which Langlands–Deligne local constants are inductive in degree zero, and BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a uses it. Layers 5 and 7 are Clifford theory and Schur multipliers (Isaacs 1976; Curtis–Reiner 1981). This rests on the README's references and that consumer.

## Source issues

- none

## For the human reviewers

- Not tested: Deligne 1973 (Springer LNM 349), the only source of the changed text, is behind a paywall. The wording of §6.2 was not compared with it, and its locator (Prop. 1.5, Scholie 1.6, p. 510) is unverified.
- Neither recorded decision applies to this folder: BaseChangeAndGaloisRepresentationsForUnitaryGroups 10.0a keeps its statement and cites §6.2 as its general form.
