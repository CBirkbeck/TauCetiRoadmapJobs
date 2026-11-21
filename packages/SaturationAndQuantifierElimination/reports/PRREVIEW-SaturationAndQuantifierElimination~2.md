# Review of SaturationAndQuantifierElimination (pull request #2866 at c428876)

**Verdict:** needs changes

**Summary.** Changes are needed: four findings. The definition of model completeness in `Suggested.lean` admits empty models, which makes two of its theorems false (dense linear orders are a counterexample, checked in Lean); the two cardinality bounds of 0.3 are false as written (finite structures, large languages); and two objects have a second owner (the effective coding of formulas, the elementary chain lemma for direct limits). There are four small corrections and four format notes, none blocking. The humans who approve should know that only Robinson–Zakon could be read; the Tent–Ziegler, Marker and Chang–Keisler locators were not checked against the texts.

## R01 (P1) — `IsModelComplete` quantifies over empty models, so "quantifier elimination implies model completeness" and Robinson's universal test are false as stated in Lean

An implementer cannot prove `HasQuantifierElimination.isModelComplete` or `isModelComplete_iff_forall_isUniversal` (`Suggested.lean` lines 189 and 204): both fail for `T = Language.order.dlo`.

The definition (line 183) takes all `M N` with `[M ⊨ T] [N ⊨ T]` and no `Nonempty`. No axiom of Mathlib's `dlo` asserts existence (`Mathlib/ModelTheory/Order.lean:188`), so the empty order is a model; the empty map into `ℚ` is an embedding; the sentence `∃ x, ⊤` holds in `ℚ` and not in the empty order. I elaborated a proof of `¬ IsModelComplete Language.order.dlo` against the pins, with no `sorry`. On the other side, `⇔[T]` and `T ⊨ᵇ φ` quantify over `Theory.ModelType`, whose carriers are nonempty (`Mathlib/ModelTheory/Bundled.lean:78`, `Satisfiability.lean:279`), so `dlo` does eliminate quantifiers in the file's sense (the README's own Check in Layer 2; sentences by `dlo_isComplete`, `Order.lean:549`) and every formula is `dlo`-equivalent to a universal one. The README's convention ("models … as in `Theory.ModelType`") is right; only the Lean departs from it.

Smallest change: add `[Nonempty M] [Nonempty N]` to the binders of `IsModelComplete` and to the right-hand side of `isModelComplete_iff_forall_isExistential`, as `IsModelComplete.isComplete` and the saturated extension test already do. A Check in 2.5 would pin it: the empty order is a model of `dlo` in Mathlib's sense, and model completeness must not see it.

## R02 (P2) — Both cardinality bounds in 0.3 are false as written: the first for finite structures, the second for languages larger than `κ`

"a structure of cardinality at most `2^λ` has a `λ⁺`-saturated elementary extension of cardinality `2^λ`" (README line 130): a finite structure has no proper elementary extension, so the one-point structure has no elementary extension of cardinality `2^λ`. Say "an infinite structure", or "of cardinality at most `2^λ`" for the extension.

"For every infinite `κ`, `M` has a `κ⁺`-saturated elementary extension of cardinality at most `#M ^ κ`" (line 132) is stated in a roadmap "for an arbitrary first-order language". Take `M = ℕ` with a unary predicate for every subset and `κ = ℵ₀`. Each ultrafilter on `ℕ` is a finitely satisfiable set of formulas over `∅`, distinct ultrafilters are incompatible, and an `ℵ₁`-saturated extension realizes them all, so it has at least `2^(2^ℵ₀)` elements, more than `ℵ₀^ℵ₀ = 2^ℵ₀`. Add the hypothesis `#L ≤ κ` (or a countable language). I could not read either cited text, so I do not say which hypothesis each source carries.

## R03 (P2) — The effective coding of first-order formulas for a general language has two owners

Layer 4.1 and the scope paragraph ("the effective coding of formulas and derivations") own `Primcodable` codings of terms and formulas for an effective language, with primitive recursive constructors. The open roadmap RandomGraphs (pull request #1223, a new roadmap by another author) owns the same object: its §5.2 builds "the effective coding of first-order formulas … for a general language `L`" on `BoundedFormula.listEncode` with computable constructors and decoding (its README line 764), and its paragraph "Ownership of the formula coding" (line 1602) says that no other roadmap states one for a general language. The two also differ in convention (a `Primcodable` instance here, explicit code maps there), so an implementer would build the coding twice.

Smallest change: cite RandomGraphs §5.2 for the coding of terms and formulas and keep in 4.1 only what it lacks (sentences and theories as coded sets, the substitution `inst`, the coding of `LKDerivation`); or state in one clause how the coding here differs and agree the owner with that roadmap. Either way the scope paragraph should name it.

## R04 (P2) — The elementary chain lemma for `DirectLimit` is already a target of InfinitaryModelExistence on main

0.3 says "The chain lemma is itself a target here, stated for Mathlib's `DirectLimit` of a directed system of elementary embeddings" (line 128). InfinitaryModelExistence §2.4 on main states it for every fragment `A` of `L_{ω₁ω}`: for a directed system of `A`-elementary embeddings the maps into Mathlib's `DirectLimit` are `A`-elementary (README line 366, the item on cocones). The images of first-order formulas are closed under components, hence a fragment in Tau Ceti's sense (`TauCeti/ModelTheory/Infinitary/Fragment.lean:69`), so the first-order lemma is its instance. The directed-union form is already in the pinned Tau Ceti (`aElementary_iSup`, `TauCeti/ModelTheory/ModelExistence/DirectedUnion.lean:56`).

Smallest change: cite InfinitaryModelExistence §2.4 in 0.3 and in the supplier contracts, and keep here only the first-order corollary: an `ElementaryEmbedding` is the same as an embedding that is `A`-elementary for the fragment of first-order formulas.

## C01 — The second proof of elementary equivalence in 1.3 works only for relational languages

1.3 says that Tau Ceti's `PotentialIso.infEquivAt` and `InfEquivAt.elementarilyEquivalent` give a second proof of `M ≅[L] N`. At the pin `PotentialIso.infEquivAt` assumes `[L.IsRelational]` (`TauCeti/ModelTheory/BackAndForth/Karp.lean`, the `variable` at line 148 and the theorem at line 287), while Layer 1 is for every language; Layer 3's language has function symbols. Say "for relational languages". The comparison theorem `IsBackAndForth.potentialIso` itself holds in general.

## C02 — `IsSaturated.mono` asks an implementer for nothing

It closes with the term `fun A hA => hM A (hA.trans_le h)` (elaborated at the pins). The README already lists monotonicity as an API bullet of 0.1; the Lean statement could go, or be marked as a sanity check.

## C03 — Keisler's theorem in Lean forces the index set into the universe of the factors

`isSaturated_aleph_one_product` has `{ι : Type w}` and `M : ι → Type w`, while 0.4 allows any index set; an ultrapower over `ℕ` of structures in a higher universe is not an instance. A separate universe for `ι`, with the conclusion at `Cardinal.{max _ w}`, states what 0.4 says.

## C04 — PadicallyClosedFields is named as a consumer and exists nowhere

The summary and "Downstream consumers" say that PadicallyClosedFields "uses" Layers 2 and 4. No roadmap of that name is on main or in an open pull request, so a reader who looks for it finds nothing. Say that it is a planned roadmap, or name only AxKochenErshov.

## N01 — Proposed names in code font that nothing declares

The four criteria of 2.2 other than `hasQuantifierElimination_iff_ex_isQFEquivalent_of_isQF`, and `Theory.orderedAbelianGroup`, `Theory.doag`, `Theory.zGroup`, read as declarations of `Suggested.lean` and are not. Say that they are proposed names (or, for 2.2, the names of the Mathlib series).

## N02 — Pull-request numbers and dated sentences in the README and docstrings

"mathlib4#41112–#41116", "Tau Ceti builds them now … when the series lands", "which is not on main" will not be true for a reader a year on. The Mathlib file `Mathlib/ModelTheory/QuantifierElimination.lean` and the declaration names say the same without a date.

## N03 — Lean form

The Presburger theorem carries `letI` in its signature (a named local instance for `Multiplicative ℤ`, as for `orderedGroupStructure`, avoids it); `IsSaturated.mono` and `HasQuantifierElimination.isModelComplete` have no docstring; the uniqueness theorem is labelled 0.5 and stands in 0.2; the import of `TauCeti.ModelTheory.BackAndForth.Karp` is unused.

## N04 — `IsZGroup` is already a Mathlib name for another notion

`IsZGroup` in Mathlib (`Mathlib/GroupTheory/SpecificGroups/ZGroup.lean`) is "every Sylow subgroup is cyclic". The roadmap's namespace keeps the two apart for now; a name such as `IsPresburgerGroup`, or a namespace under ordered groups, would keep them apart in the library.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 `IsSaturated` | `(ℕ,<)`, `(ℚ,<)`, `(ℝ,<)`, finite `M` | `(ℕ,<)`: type "≥ n predecessors" unrealized; `ℚ`, `ℝ`: `{n < x}` over `ℕ` unrealized; finite: no proper elementary extension | Checks true; definition separates |
| 0.1 `n`-types for `κ ≥ ℵ₀` | `n = 0`, `κ = 1` | `n = 0`: the unique type, realized; `κ = 1` gives no parameters, so induction fails | hypothesis needed, present |
| 0.2 universality, uniqueness | finite `N`, `κ` finite | finite elementarily equivalent structures isomorphic; Lean lifts `Cardinal.{max w w'}` on both sides | true; `[Infinite M]` harmless |
| 0.3 existence | finite `M`; `κ` finite | finite `M` is its own saturated extension; chain of regular length `≥ κ` bounds every `A`, `#A < κ` | first bullet true |
| 0.3 size bounds | one-point `M`; `ℕ` with all unary predicates, `κ = ℵ₀` | `1 ≠ 2^λ`; `≥ 2^(2^ℵ₀) > 2^ℵ₀` | false: R02 |
| 0.4 Keisler | principal ultrafilter; `ι = ℕ` | principal: ultrapower `≅ (ℕ,<)`, not saturated; `¬ CountableInterFilter` is countable incompleteness | true; universe: C03 |
| 1.1 `IsBackAndForth` | `M = ∅`, `N ≠ ∅`; `ℚ → ℝ` finite maps | back fails (`cod ≅ dom = ∅`); density gives forth and back | definition right |
| 1.2 preservation | `ℤ` vs `ℤ ⊕ₗ ℤ` | elementarily equivalent, no family (bounded intervals finite vs infinite) | true; converse fails as the Check says |
| 1.3 `potentialIso` | restriction to `closure ∅`, to `A ⊔ closure {m}` | both finitely generated and in the family | true; second proof: C01 |
| 2.2 one-quantifier criterion | `α = Empty`, no constants; infinite `α` | sentences reduce to `⊤/⊥`; finitely many variables, relabel | true both ways |
| 2.3 saturated extension test | `L = ∅`, `T = ∅`, `N` one point, `M` two points | extension of `{m₁}` to `{m₁,m₂}` fails; pure sets have no elimination | hypothesis fails where conclusion fails |
| 2.4 completeness from elimination | no constants, `A = ∅` | quantifier-free sentence has one value in `A`, `M`, `N` | true |
| 2.5 `IsModelComplete`, Robinson | `T = dlo`, `M = ∅`, `N = ℚ` | `∃x ⊤`: true in `ℚ`, false in `∅`; right-hand sides hold for `dlo` | false in Lean: R01 |
| 2.5 existential form | empty `M` on both sides | both sides fail together | true |
| 2.6 prime model | `P` nonempty | hypothesis of the stronger definition | true |
| 2.7 model companions | definition against the Check of `2ℤ ⊂ ℤ` | least element `2` maps to non-least | Check true |
| 3.1 language and theory | `Multiplicative ℚ`, `Multiplicative ℤ` | structures elaborate from `structureOfGroup` and `orderStructure` | sound |
| 3.2 divisible groups | `ℚ`, `ℝ`, trivial group | trivial excluded by `Nontrivial`; `RootableBy` gives `n`-th roots for `n ≥ 1` | true |
| 3.3 `IsZGroup` | `ℤ`, `ℤ ×ₗ ℤ`, `ℚ ×ₗ ℤ`, `ℚ`, trivial | yes; no (`(1,0)`, `n = 2`; index 4); yes, non-archimedean; no; no | definition right |
| 3.3 index claim | `ϖᵏ = δⁿ`, `0 < k < n` | `δ ≥ ϖ`, `δⁿ ≥ ϖⁿ > ϖᵏ` | true |
| 3.3 Presburger elimination | `D₀`, even integers | `D₀(x) ↔ x = 1`; evens need `D₂` | true |
| 3.4 definable sets | `xᵏ ≤ c`, `c = ϖʲδᵏ` | `↔ x ≤ δ`; `Dₙ(xᵏt)` a union of cosets of `Γⁿ` | true |
| 4.3 decidability | Mathlib `IsComplete` | includes satisfiable, so exactly one of `φ`, `∼φ` | true |
| 4.4 examples | one-point structure with `Pₙ` | `∃x Pₙ(x) ↔ n ∈ S` | Check true |

- Source locators checked against the text: 3 (RobinsonZakon1960 lines 408–413, 525–526, 597), all correct; 22 not readable.
- Library declarations opened at the pin: 31 (Mathlib `ModelTheory/Bundled.lean:78`, `Satisfiability.lean:101, 279, 386, 425`, `Order.lean:188, 549`, `Ultraproducts.lean:146, 154`, `PartialEquiv.lean:245, 376, 380`, `Computability/RE.lean:157, 225`, `Arithmetic/Presburger/Definability.lean:147, 153`, `Algebra/Field/IsAlgClosed.lean:164`; Tau Ceti `BackAndForth/PotentialIso.lean:44`, `Karp.lean:111, 148, 287, 328`, `DiscreteOrder.lean:300, 315`, `Algebra/Group/Basic.lean:206, 309`).
- Cross-roadmap citations resolved: 5 into SequentCalculusAndCutElimination at the head of #2724 (`LKDerivation`, `cutRank`, `LKDerivation.sound`, `inst`, `models_iff_exists_cutRank_eq_zero`), all present; RealAlgebraicGeometry, InfinitaryLogic, CountableModelCounting, InfinitaryModelExistence present on main.
- Mathlib series: #41112–#41116 are open and carry the names used in 2.1–2.2.
- Dependency check: `depcheck: 172 roadmaps, 2000 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; `#check @name` compared with the README for all 33 declarations; no lost binder. One-tactic probe: `IsSaturated.mono` closes; counterexample to model completeness of `dlo` elaborated.

Overlap check: read AxKochenErshov, SequentCalculusAndCutElimination, RandomGraphs, HanfNumbers, LogicAndDefinabilityInNumberTheory, InfinitaryLogic, InfinitaryModelExistence, CountableStructureSpaces; the effective coding of formulas is shared with RandomGraphs (owner: RandomGraphs §5.2), the chain lemma with InfinitaryModelExistence (owner: its §2.4); nothing else shared.

Source independence: 3 passages compared with 1 source, none shared; largest share Tent–Ziegler, 11 of 25 locators, text and contents not readable; by its locators Layer 0 draws on its §§2.1, 2.2, 4.3, 5.2, 6.1, Layer 2 on §3.2, Layers 1, 3, 4 on none: no one-to-one run.

Research link: Layers 0–3 are the toolkit of the Ax–Kochen–Ershov principle and of Macintyre's p-adic elimination, as the open AxKochenErshov roadmap uses them; Layer 3 states Robinson–Zakon 1960, Thms 4.4 and 4.7. Rests on the README summary and RobinsonZakon1960.

## Not verifiable

- Tent–Ziegler 2012 (Thm. 2.1.4, Cor. 2.2.9, Lem. 3.2.2, 3.2.4, Thm. 3.2.5, Lem. 3.2.7, Def. 3.2.8, Thm. 3.2.9, Lem. 4.3.3, 5.2.8, 6.1.2): no legal copy found; the publisher's page is closed.
- Marker 2002 (Prop. 3.1.14, 3.1.15, Cor. 3.1.17, 3.1.21, Exercises 3.4.10, 3.4.12, Thm. 4.3.12, Lem. 4.3.17, Thm. 4.3.20, Exercise 4.5.37): no legal copy found.
- Chang–Keisler 1990, §6.1, and Keisler 1964: paywalled; the README itself flags the first as unchecked.
- Presburger 1929 and Robinson 1956: not found; the README flags the first as unchecked.
- So the locators of the sampled targets 0.2, 0.3, 0.4, 2.2, 2.5, 2.7, 3.2 and 3.4 are unverified against the texts; their mathematics was checked independently (table above).

Automatic checks set aside as false positives: the Tau Ceti theorem on `ℤ` and `ℤ ⊕ₗ ℤ` named in the Check of Layer 1 was read as a declaration this roadmap claims; it is a library declaration (`TauCeti/ModelTheory/BackAndForth/DiscreteOrder.lean:300`).

## Source issues

- none

## For the human reviewers

- Not tested: Tent–Ziegler has the largest share of the locators (11 of 25) and could not be read; wording and arrangement were not compared with it, nor with Marker (10 locators). Layer 2 draws on its §3.2 throughout.
- Licence: `IsQFEquivalent`, `HasQuantifierElimination` and the criterion of 2.2 in `Suggested.lean` take names and statements from the open Mathlib pull request #41113, file `Mathlib/ModelTheory/QuantifierElimination.lean` (not in the pinned Mathlib).
- Layer 4 depends on SequentCalculusAndCutElimination, which is an open pull request (#2724) by another author; the description says this pull request merges after it.
