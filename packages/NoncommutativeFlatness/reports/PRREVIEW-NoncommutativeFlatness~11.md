# Review of NoncommutativeFlatness (pull request #2618 at 3c52168)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 15 lines changed since `2ec47ed`: the change only removes dated wording from three README passages (step 1 of 4.3, the refactor list of the downstream section, the Scope paragraph on finitely presented functors), which repairs two of the three format notes of the previous review and alters no statement. One format note remains, not blocking, and the four points for the human reviewers stand.

## N01 — `letI` in two theorem statements

`isMoritaEquivalent_tfae` (`Suggested.lean` lines 1144–1150) and `BalancedTor.outerSMulCommClass` (lines 1273–1274) bring module structures into scope with `letI` inside the statement; a named instance argument reads and applies more easily.

## Previous findings

The previous review, of `2ec47ed`, had no finding; its format notes are accounted for here.

- N01 (`letI` in two statements) — not repaired: both statements unchanged (N01 above).
- N02 (dated wording in Scope and in the refactor list) — repaired: "whose single-representable predicate is `IsFinitelyPresentedFunctor`. 0.1 extends it to categories without finite biproducts"; the refactor bullet no longer mentions Tau Ceti `main`.
- N03 ("not independently audited" in step 1 of 4.3) — repaired: "the extension to product-closed sets and the written Noetherian argument are this roadmap's): let `I ⊆ S` be closed under composition".

The repairs introduced no new problem: the three passages lose words only, and every statement, locator and citation in them reads as before.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Scope: ArtinAlgebras §1.1 owns the single-representable `IsFinitelyPresentedFunctor` | ArtinAlgebras on main, README §1.1 (line 351) and `Suggested.lean` line 142 | heading "1.1 The category `mod C`" exists; predicate declared there on `Cᵒᵖ ⥤ AddCommGrpCat` | citation resolves; shortened sentence still true | none |
| Scope: the two predicates agree with finite biproducts, differ on one-object categories | `C` with biproducts; `C = SingleObj ℤ`, `F = ℤ²` | `⊕ Hom(-, Xᵢ) ≅ Hom(-, ⊕Xᵢ)`; `ℤ²/2ℤ²` has 4 elements, a quotient of `ℤ` mod 2 has at most 2 | agree; `ℤ²` is not cyclic; named target `isFinitelyPresentedFunctor_iff_exists_single` is declared (line 102) | none |
| 4.3 step 1, `Module.End.exists_prod_eq_zero_of_isNilpotent` (cited by the changed sentence) | `M = 0`; `I = ∅`; `I = {E₁₂} ⊆ M₂(k)`; `I = {E₁₂, E₂₁}` | `n = 0` (`1 = 0`); `n = 1` vacuous; `n = 2`, `E₁₂² = 0`; excluded: `E₁₂E₂₁ = E₁₁ ∉ I`, not nilpotent | true; statement (lines 2140–2144) carries both closure and nil hypotheses | none |
| Refactor bullet from 0.1 | prose before and after the change | same refactor (finite sums via morphism matrices, single-representable form under biproducts); only the parenthesis on the library's state removed | no statement changed | none |

The rows for untouched statements stand as in the previous review, of `2ec47ed`.

- Source locators checked against the text: 0 new; the change touches no locator, and no target of the seeded sample falls in the changed passages.
- Library declarations opened: `IsFinitelyPresentedFunctor` is absent from the pinned Tau Ceti (searched the whole library at the pin), so the README's own definition (`Suggested.lean` line 87) duplicates nothing there; the removed sentence about the library past the pin is no longer asserted.
- Cross-roadmap citations resolved: 1 (ArtinAlgebras §1.1, on main).
- Elaboration of `Suggested.lean` at the pins: exit 0, no error, 202 `sorry` warnings and nothing else; no `set_option`; no definition whose data is `sorry`.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder; no private path in the folder.
- Title and description against the head: 2,254 lines and 202 `sorry` warnings agree; layers, sections and suppliers unchanged; the description's remark that ArtinAlgebras §1.1's predicate is in Tau Ceti past the pin is no longer repeated by the README but is not contradicted by it.
- Headline theorems: unchanged by the diff; all stated, as in the previous review.

Overlap check: read ArtinAlgebras (main) §1.1 again for the changed Scope paragraph; QuiverRepresentations and PrestableInfinityCategories (open) as read in the previous review; owners stand as there (`mod C` and Krull–Schmidt categories — ArtinAlgebras §§1.1, 0.2, cited; `Tor ≅ Tor'` — SpectralSequencesAndConvergencePartII §4.1, cited); no other open pull request changes this roadmap and no cited id is dropped.

Source independence: changed passages only; 3 changed passages compared with 0 sources, because the change only deletes words and adds no prose of its own; largest share Mitchell, 14 locators, as counted in the earlier reviews; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: The headline targets are Bass's Theorem P (Bass 1960) with its categorical form (Simson 1977, Harada 1973), Crawley-Boevey's representation theorem (1994) and Auslander's global-dimension theorems (1955); the README names flat-dominant dimension (Hoshino 1989, Xi 2021) as a user. Rests on the README and on Bass and Auslander read at their locators.

## Not verifiable

- [Fisher-Nil] and [Small], and the other sources left unread by the previous reviews, remain unread; the change touches none of their locators.
- The description's "`check_roadmap_topics.py` passes", its "separate local Lean probes" and its count of 307 declarations were not rerun.

Automatic checks set aside as false positives: four names reported as undeclared are two Tau Ceti declarations that exist at the pin, a lemma of Tau Ceti's balanced tensor product, and the notation `Tor_0`; eight reports of TeX syntax are inside code spans that wrap over a line break; the subsection "Layer 4 checks" is read as a layer heading; the Prop-valued instances and the `sorry` proof fields of definitions with real data are not `sorry` data.

## Source issues

- none

## For the human reviewers

- **Scope.** Clause 4″ of the categorical Theorem P (right simple subobjects and orthogonal idempotents, 4.5) is, in the README's words, this roadmap's own extension of Bass's clause (7); no refereed source states it.
- **Scope.** `Module.End.exists_prod_eq_zero_of_isNilpotent` (4.3) is stated for product-closed nil sets; the README (lines 1063–1066) says the sources print it for nil subrings and nil one-sided ideals and that the extension and the Noetherian argument are its own.
- **Scope.** The README plans changes to existing Tau Ceti declarations "without shims" (`IsSuperfluous`, `globalDimension`, `IsSemiperfectRing`, and ArtinAlgebras §1.1's `IsFinitelyPresentedFunctor`; lines 175, 732, 869, 1285–1297).
- **Not tested.** Mitchell, *Rings with several objects*, has the largest share of locators (14); neither its text nor its contents page could be read, so wording and arrangement were not compared with it.
