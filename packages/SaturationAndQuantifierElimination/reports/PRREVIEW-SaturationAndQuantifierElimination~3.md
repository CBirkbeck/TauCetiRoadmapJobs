# Review of SaturationAndQuantifierElimination (pull request #2866 at 4136cfd)

**Verdict:** needs changes

**Summary.** Changes are needed: the four findings of the previous review stand, since this head changes only the two sentences about LogicAndDefinabilityInNumberTheory, and those two sentences are correct. The Lean definition of model completeness still admits empty models, which makes two theorems false, and that definition now has a consumer that asks for nonempty models; the two cardinality bounds of 0.3 are still false as written; the effective coding of formulas and the chain lemma for direct limits still have a second owner. There are four small corrections and five format notes, none blocking. The humans who approve should know that only Robinson–Zakon could be read, and that the merge order has this roadmap after its new consumer.

## R01 (P1) — `IsModelComplete` quantifies over empty models, so "quantifier elimination implies model completeness" and Robinson's universal test are false as stated in Lean

An implementer cannot prove `HasQuantifierElimination.isModelComplete` or `isModelComplete_iff_forall_isUniversal` (`Suggested.lean` lines 204 and 189): both fail for `T = Language.order.dlo`. The consumer this head names makes it more pressing: LogicAndDefinabilityInNumberTheory §4.31 and its supplier contract take 2.5 "with models of a theory nonempty", which the Lean definition does not give.

The definition (line 183) takes all `M N` with `[M ⊨ T] [N ⊨ T]` and no `Nonempty`. No axiom of Mathlib's `dlo` asserts existence (`Mathlib/ModelTheory/Order.lean:188`), so `Fin 0` is a model; the empty map into `ℚ` is an embedding; `∃ x, ⊤` holds in `ℚ` and not in `Fin 0`. I elaborated a proof of `¬ IsModelComplete Language.order.dlo` against the pins again at this head; it depends on `propext`, `Classical.choice` and `Quot.sound` only. On the other side, `⇔[T]` is `T ⊨ᵇ φ.iff ψ`, which quantifies over `Theory.ModelType` (`Mathlib/ModelTheory/Satisfiability.lean:279`), whose carriers are nonempty (`Mathlib/ModelTheory/Bundled.lean:78`), so `dlo` does eliminate quantifiers in the file's sense and every formula is `dlo`-equivalent to a universal one. The README's convention is right; only the Lean departs from it.

Smallest change: add `[Nonempty M] [Nonempty N]` to the binders of `IsModelComplete` and to the right-hand side of `isModelComplete_iff_forall_isExistential`, as `IsModelComplete.isComplete` and the saturated extension test already do. A Check in 2.5 would pin it: the empty order is a model of `dlo` in Mathlib's sense, and model completeness must not see it.

## R02 (P2) — Both cardinality bounds in 0.3 are false as written: the first for finite structures, the second for languages larger than `κ`

"a structure of cardinality at most `2^λ` has a `λ⁺`-saturated elementary extension of cardinality `2^λ`" (README line 130): a finite structure has no proper elementary extension, so the one-point structure has no elementary extension of cardinality `2^λ`. Say "an infinite structure", or "of cardinality at most `2^λ`" for the extension.

"For every infinite `κ`, `M` has a `κ⁺`-saturated elementary extension of cardinality at most `#M ^ κ`" (line 132) stands in a roadmap "for an arbitrary first-order language". Take `M = ℕ` with a unary predicate for every subset and `κ = ℵ₀`. Each ultrafilter on `ℕ` is a finitely satisfiable set of formulas over `∅`, distinct ultrafilters are incompatible, and an `ℵ₁`-saturated extension realizes them all, so it has at least `2^(2^ℵ₀)` elements, more than `ℵ₀^ℵ₀ = 2^ℵ₀`. Add the hypothesis `#L ≤ κ` (or a countable language). I could not read either cited text, so I do not say which hypothesis each source carries.

## R03 (P2) — The effective coding of first-order formulas for a general language has two owners

Layer 4.1 and the scope paragraph ("the effective coding of formulas and derivations", line 417) own `Primcodable` codings of terms and formulas for an effective language. The open roadmap RandomGraphs (a new roadmap by another author) owns the same object: its §5.2 builds the effective coding of first-order formulas for a general language on `BoundedFormula.listEncode`, and its paragraph "Ownership of the formula coding" (its README line 1601) claims the general coding. The conventions differ (a `Primcodable` instance here, explicit code maps there), so an implementer would build the coding twice.

Smallest change: cite RandomGraphs §5.2 for the coding of terms and formulas and keep in 4.1 only what it lacks (sentences and theories as coded sets, the substitution `inst`, the coding of `LKDerivation`); or state in one clause how the coding here differs and agree the owner with that roadmap. Either way the scope paragraph should name it.

## R04 (P2) — The elementary chain lemma for `DirectLimit` is already a target of InfinitaryModelExistence on main

0.3 says "The chain lemma is itself a target here, stated for Mathlib's `DirectLimit` of a directed system of elementary embeddings" (line 128). InfinitaryModelExistence §2.4 on main states it for every fragment `A` of `L_{ω₁ω}`: for a directed system of `A`-elementary embeddings the maps into Mathlib's `DirectLimit` are `A`-elementary (its README lines 366–368, the item on cocones). The first-order formulas form a fragment, so the first-order lemma is its instance; the directed-union form is already in the pinned Tau Ceti (`aElementary_iSup`, `TauCeti/ModelTheory/ModelExistence/DirectedUnion.lean`).

Smallest change: cite InfinitaryModelExistence §2.4 in 0.3 and in the supplier contracts, and keep here only the first-order corollary: an `ElementaryEmbedding` is the same as an embedding that is `A`-elementary for the fragment of first-order formulas.

## C01 — The second proof of elementary equivalence in 1.3 works only for relational languages

1.3 says that Tau Ceti's `PotentialIso.infEquivAt` and `InfEquivAt.elementarilyEquivalent` give a second proof of `M ≅[L] N`. At the pin `PotentialIso.infEquivAt` assumes `[L.IsRelational]` (`TauCeti/ModelTheory/BackAndForth/Karp.lean`, the `variable` at line 148 and the theorem at line 287), while Layer 1 is for every language and Layer 3's language has function symbols. Say "for relational languages".

## C02 — `IsSaturated.mono` asks an implementer for nothing

It closes with the term `fun A hA => hM A (hA.trans_le h)` (elaborated at the pins at this head). The README already lists monotonicity as an API bullet of 0.1; the Lean statement could go, or be marked as a sanity check.

## C03 — Keisler's theorem in Lean forces the index set into the universe of the factors

`isSaturated_aleph_one_product` has `{ι : Type w}` and `M : ι → Type w`, while 0.4 allows any index set; an ultrapower over `ℕ` of structures in a higher universe is not an instance. A separate universe for `ι`, with the conclusion at `Cardinal.{max _ w}`, states what 0.4 says.

## C04 — PadicallyClosedFields is named as a consumer and exists nowhere

The summary and "Downstream consumers" say that PadicallyClosedFields "uses" Layers 2 and 4. No roadmap of that name is on main or in an open pull request (only this roadmap and AxKochenErshov mention it), so a reader who looks for it finds nothing. Say that it is a planned roadmap, or name only the consumers that exist.

## N01 — Proposed names in code font that nothing declares

The four criteria of 2.2 other than `hasQuantifierElimination_iff_ex_isQFEquivalent_of_isQF`, and `Theory.orderedAbelianGroup`, `Theory.doag`, `Theory.zGroup`, read as declarations of `Suggested.lean` and are not. Say that they are proposed names (or, for 2.2, the names of the Mathlib series).

## N02 — Pull-request numbers and dated sentences in the README and docstrings

"mathlib4#41112–#41116", "Tau Ceti builds them now … when the series lands", "which is not on main" will not be true for a reader a year on. The Mathlib file `Mathlib/ModelTheory/QuantifierElimination.lean` and the declaration names say the same without a date.

## N03 — Lean form

The Presburger theorem carries `letI` in its signature (a named local instance for `Multiplicative ℤ`, as for `orderedGroupStructure`, avoids it); `IsSaturated.mono` and `HasQuantifierElimination.isModelComplete` have no docstring; the uniqueness theorem is labelled 0.5 and stands in 0.2; the import of `TauCeti.ModelTheory.BackAndForth.Karp` is unused.

## N04 — `IsZGroup` is already a Mathlib name for another notion

`IsZGroup` in Mathlib (`Mathlib/GroupTheory/SpecificGroups/ZGroup.lean`) is "every Sylow subgroup is cyclic". A name such as `IsPresburgerGroup`, or a namespace under ordered groups, would keep the two apart in the library.

## N05 — "if it adopts it" describes a use the consumer does not make

In "Downstream consumers" (line 410), Layer 0.4 is offered to LogicAndDefinabilityInNumberTheory "if it adopts it". At its head that roadmap's transfer theorems cite only Mathlib's Łoś theorem (`Ultraproduct.sentence_realize`), not saturation. The sentence could be dropped, or say that the transfer theorems there need Łoś only.

## Previous findings

- R01 — not repaired: line 183 still reads `∀ (M N : Type (max u v)) [L.Structure M] [L.Structure N] [M ⊨ T] [N ⊨ T] (f : M ↪[L] N)`, with no `Nonempty`; the counterexample elaborates again.
- R02 — not repaired: lines 130–133 are unchanged: "a structure of cardinality at most `2^λ` has a `λ⁺`-saturated elementary extension of cardinality `2^λ`"; "For every infinite `κ` … at most `#M ^ κ`".
- R03 — not repaired: 4.1 and the scope paragraph (line 417, "the effective coding of formulas and derivations") are unchanged and do not name RandomGraphs.
- R04 — not repaired: line 128 still reads "The chain lemma is itself a target here, stated for Mathlib's `DirectLimit` of a directed system of elementary embeddings."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.5 `IsModelComplete`, universal test, elimination ⇒ model complete (Lean) | `T = dlo`, `M = Fin 0`, `N = ℚ`, `φ = ∃x ⊤` | `φ` true in `ℚ`, false in `Fin 0`; `¬ IsModelComplete dlo` elaborated, no `sorryAx`; right-hand sides hold over nonempty models | false in Lean: R01 |
| 2.5 Robinson's test as the consumer takes it (changed lines 409–410) | LogicAndDefinabilityInNumberTheory §4.31, its contract | consumer: nonempty models, three equivalent forms (elementary, existentially closed, existential equivalents); README 2.5 lists the same three plus universal | citation true; Lean side: R01 |
| Existential closure, owner (changed lines 436–438) | empty language, `T = ∅`, `∀x ⊥`, empty into one-point structure | consumer's own Check: equivalent to `⊥` over nonempty models, true in `∅`, false in one point; named predicate declared only there, inline here in 2.5 | one owner each |
| 0.3 size bounds | one-point `M`; `ℕ` with all unary predicates, `κ = ℵ₀` | `1 ≠ 2^λ`; `≥ 2^(2^ℵ₀) > 2^ℵ₀ = ℵ₀^ℵ₀` | false: R02 |
| 0.1 monotonicity (Lean) | one-term probe | `fun A hA => hM A (hA.trans_le h)` closes it | C02 |

The rows of the untouched statements stand as in the previous review, of `c428876`.

- Source locators checked against the text: 0 at this head (no sampled target falls in the changed passages); the 3 Robinson–Zakon locators of the previous review stand.
- Library declarations opened at the pin: 9 (Mathlib `ModelTheory/Order.lean:188, 209, 213, 345, 549`, `Satisfiability.lean:279`, `Equivalence.lean:109`, `Bundled.lean:78`; Tau Ceti `BackAndForth/Karp.lean:148, 287`, `DiscreteOrder.lean:300, 315`).
- Cross-roadmap citations resolved: 2 new, into LogicAndDefinabilityInNumberTheory at the head of its open pull request (§4.31 at README line 1244, its scope line 1843 and its contract at line 1957), both true; RandomGraphs line 1601 and InfinitaryModelExistence lines 366–368 opened again.
- Dependency check: `depcheck: 172 roadmaps, 2000 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (21 declarations). The file did not change since `c428876`, so the comparison of the 33 elaborated signatures with the README stands.
- The pull request's text: title and description read against this head; the paragraph on LogicAndDefinabilityInNumberTheory already states the new consumer; nothing contradicted or left out.
- No file outside the folder is changed.

Overlap check: read AxKochenErshov, SequentCalculusAndCutElimination, RandomGraphs, HanfNumbers, LogicAndDefinabilityInNumberTheory, InfinitaryLogic, InfinitaryModelExistence, CountableStructureSpaces (the last seven as in the previous review; LogicAndDefinabilityInNumberTheory again at its head); the effective coding of formulas is shared with RandomGraphs (owner: RandomGraphs §5.2), the chain lemma with InfinitaryModelExistence (owner: its §2.4); model completeness and Robinson's test are owned here (2.5) and existential closure as a named predicate by LogicAndDefinabilityInNumberTheory §4.31, each stating so; nothing else shared.

Source independence: changed passages only: 2 passages compared with 0 sources (they cite another roadmap, no source), none shared; largest share Tent–Ziegler, 11 of 25 locators, text and contents not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 0–3 are the toolkit of the Ax–Kochen–Ershov principle and of Macintyre's p-adic elimination, as the open AxKochenErshov roadmap uses them; Layer 3 states Robinson–Zakon 1960, Thms 4.4 and 4.7. Rests on the README summary and RobinsonZakon1960.

## Not verifiable

- Tent–Ziegler 2012 (Thm. 2.1.4, Cor. 2.2.9, Lem. 3.2.2, 3.2.4, Thm. 3.2.5, Lem. 3.2.7, Def. 3.2.8, Thm. 3.2.9, Lem. 4.3.3, 5.2.8, 6.1.2): no legal copy found; not looked for again in this re-review.
- Marker 2002 (Prop. 3.1.14, 3.1.15, Cor. 3.1.17, 3.1.21, Exercises 3.4.10, 3.4.12, Thm. 4.3.12, Lem. 4.3.17, Thm. 4.3.20, Exercise 4.5.37): no legal copy found.
- Chang–Keisler 1990, §6.1, and Keisler 1964: paywalled; the pull request's description itself says the first was not checked.
- Presburger 1929 and Robinson 1956: not found.
- So the locators of the sampled targets 0.2, 0.3, 0.4, 2.2, 2.5, 2.7, 3.2 and 3.4 remain unverified against the texts; their mathematics was checked independently in the previous review.

Automatic checks set aside as false positives: the Tau Ceti theorem on `ℤ` and `ℤ ⊕ₗ ℤ` named in the Check of Layer 1 was read as a declaration this roadmap claims; it is a library declaration (`TauCeti/ModelTheory/BackAndForth/DiscreteOrder.lean:300`).

## Source issues

- none

## For the human reviewers

- Not tested: Tent–Ziegler has the largest share of the locators (11 of 25) and could not be read; wording and arrangement were not compared with it, nor with Marker (10 locators). Layer 2 draws on its §3.2 throughout.
- Licence: `IsQFEquivalent`, `HasQuantifierElimination` and the criterion of 2.2 in `Suggested.lean` take names and statements from the open Mathlib pull request #41113, file `Mathlib/ModelTheory/QuantifierElimination.lean` (not in the pinned Mathlib).
- Layer 4 depends on SequentCalculusAndCutElimination, an open pull request (#2724) by another author; the description says this pull request merges after it.
- Merge order: LogicAndDefinabilityInNumberTheory (open, #2276) now cites §2.5 here as a supplier (its README lines 1269, 1281, 1957), yet the merge order lists it before this roadmap. This roadmap consumes nothing from it.
