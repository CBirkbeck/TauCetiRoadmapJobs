# Review of SaturationAndQuantifierElimination (pull request #2866 at e8a5d7e)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the four findings of the previous review (nonempty models in `IsModelComplete`, the two cardinality bounds of 0.3, the owner of the formula coding, the owner of the chain lemma), and a full pass over every statement found nothing false. There are two small corrections and four format notes, none blocking. Only Robinson–Zakon could be read; the humans who approve should know that the Tent–Ziegler, Marker and Chang–Keisler locators are unchecked against the texts, and that the merge order lists a consumer of this roadmap before it.

## C01 — 4.2 codes sequents "through `boundedCode`", but the calculus has formulas over `ℕ` and the coding is for formulas over `Fin m`

An implementer of 4.2 has to invent the coding of a sequent before the stated target (a `Primcodable` coding of derivations, with computable end sequent and cut rank) means anything. The conventions give `boundedCode : L.BoundedFormula (Fin m) n → ℕ` and code a sentence as a formula over `Fin 0`. SequentCalculusAndCutElimination's sequents are pairs of `Finset (L.Formula ℕ)` (its Conventions, "Sequents"), eigenvariables are natural numbers, and its completeness for theories reads a sentence as a formula over `ℕ` by `Formula.relabel Empty.elim` (its §2.4). So neither a formula inside a derivation nor the sequent `T₀ ⇒ φ` is in the domain of `boundedCode` as typed.

RandomGraphs §5.2 says its contexts are coded by value, so that codes are uniform in `m`. One sentence in 4.1 or 4.2 would close the gap: a formula over `ℕ` is coded as the same formula over `Fin m` for any `m` above its free variables, the code not depending on `m`; or the coding of `L.Formula ℕ` is named as a target of 4.1.

## C02 — Robinson–Zakon's regularly discrete groups are defined by primes only

In 3.3 (line 341) the `ℤ`-groups, defined with a condition for every `n > 0`, are said to be Robinson–Zakon's regularly discrete groups (Def. 3.3(iii)). That definition (RobinsonZakon1960 lines 412–413) asks for index `p` only for every prime `p`. The two agree, by induction on the factorization of `n` (`x = ϖᵏ·yᵖ` and `y = ϖˡ·zᵠ` give `x = ϖᵏ⁺ᵖˡ·zᵖᵠ`), but a reader who opens the source sees another definition. Add the clause, for example "(their condition is for primes, which gives every `n`)".

## N01 — The Check on dense linear orders in Layer 2 computes nothing

"Dense linear orders without endpoints: quantifier elimination agrees with the Mathlib series" (line 290) names no value that a wrong definition would get wrong. A testing form: over `dlo`, `∃ z, x < z ∧ z < y` is equivalent to `x < y`, while over the theory of `(ℤ, <)` it is not quantifier-free (the Check above it).

## N02 — References lists a locator and three works that the text never cites

Tent–Ziegler "Def. 5.2.7" is listed as cited and appears nowhere in the layers; Keisler 1964, Presburger 1929 and Robinson 1956 carry no locator ("Presburger" in 3.3 is a bare name). Either cite them at the statements they support or drop the "Cited:" entry.

## N03 — Mathlib pull-request numbers in the supplier contracts

"The series mathlib4#41112–#41116" (line 493) will not be true for a reader a year on; the file name `Mathlib/ModelTheory/QuantifierElimination.lean` and the declaration names, which the same paragraph gives, say the same without a number.

## N04 — The two declaration names cited from InfinitaryModelExistence §2.4 are on main only

0.3 and the supplier contracts cite `aElementary_of_cocone` and `aElementary_directLimit_of`. They are in §2.4 on main; the open revision of that roadmap keeps §2.4 and the statement ("Cocones", for Mathlib's `DirectLimit`) and no longer names them. The section citation is enough and survives either way.

## Previous findings

- R01 (empty models in `IsModelComplete`) — repaired: `Suggested.lean` lines 181–182 read `[M ⊨ T] [N ⊨ T] [Nonempty M] [Nonempty N] (f : M ↪[L] N)`, the embedding form of Robinson's test has the same binders (line 197), and 2.5 has the Check on the empty model of `dlo` (README lines 291–293).
- R02 (cardinality bounds of 0.3) — repaired: "for an infinite cardinal `λ ≥ #L` … of cardinality at most `2^λ`" and "For every infinite `κ ≥ #L`", with the counterexample for a large language (lines 140–145).
- R03 (two owners of the formula coding) — repaired: 4.1 takes the coding from RandomGraphs §5.2 and keeps only what it adds; the scope paragraph names RandomGraphs as owner (lines 462–463).
- R04 (chain lemma) — repaired: 0.3 cites InfinitaryModelExistence §2.4 and keeps only the bridge between `ElementaryEmbedding` and `AElementary` for the first-order image fragment (lines 134–139).
- C01–C04 and N01, N03–N05 of the previous review are applied (relational languages in 1.3; `IsSaturated.mono` gone; a separate universe for the index set in Keisler's theorem; PadicallyClosedFields called planned; proposed names marked; `IsPresburgerGroup`). N02 is applied in part (N03 above).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 `IsSaturated`, Checks | `(ℕ,<)`, `(ℚ,<)`, `(ℝ,<)`, finite `M`, `n = 0` | `ℕ`: type "≥ n predecessors" unrealized; `ℚ`: `{n < x}` over `ℕ` unrealized, cuts over finite sets realized; `n = 0`: unique 0-type | true |
| 0.2 universality (Lean and README) | finite `κ`; universes `w`, `w'` | finite `κ`: `N ≡ M`, `#N ≤ κ` forces `N ≅ M`; lifts land in `Cardinal.{max w w'}` both sides | true |
| 0.2 uniqueness (Lean) | `M` infinite, `#M = #N` | both sides `#M`-saturated; back-and-forth of length `#M` | true |
| 0.3 existence | chain length regular `μ ≥ κ`; `N : Type (max u v w)` | `#A < κ ≤ μ = cf μ` puts `A` in one stage | true |
| 0.3 size bounds | `#M = 1`, `#M = n`, `M` infinite; `ℕ` with all unary predicates | `1^κ = 1` (M itself); `(2^λ)^λ = 2^λ`; `(#M^κ)^κ = #M^κ`, `κ⁺ ≤ 2^κ`; large language: `2^(2^ℵ₀) > ℵ₀^ℵ₀` | true with `#L` bound |
| 0.4 Keisler (Lean and README) | principal `U` on `ℕ`; nonprincipal on `ℕ`; `ι : Type w'` | principal: ultrapower `≅ (ℕ,<)`, not saturated; conclusion at `Cardinal.{max w' w}`, carrier `Type (max w' w)` | true |
| 1.1 `IsBackAndForth` | `M` empty, `N` nonempty; both empty; `ℚ → ℝ` finite maps | empty/nonempty: back fails, no family; both empty: `{⊥}`; `ℚ,ℝ`: forth and back by density | determines object |
| 1.2 preservation, 1.3 comparison | `ℤ` vs `ℤ ⊕ₗ ℤ`; `PotentialIso` at pin | pin: nonempty set of `FGEquiv` with forth and back; restriction to `closure(C ∪ {m})` gives forth | true |
| 2.1 `HasQuantifierElimination`, 2.2 criterion | `α = Empty`, no constants; `dlo`; `(ℤ,<)` | `∃x ⊤ ⇔ ⊤` over nonempty models; `(0,1)`,`(0,2)` same qf type, differ on "no `z` between" | true |
| 2.3 saturated extension test | `A = ⊥` empty; universe `max u v` | qf witness passes to `ℵ₀`-saturated `N' ≽ N` and back; `N'` in `Type (max u v)` by 0.3 | true, converse too |
| 2.4 completeness from QE | empty common substructure, 0-ary relations | embeddings preserve 0-ary relations, so a qf sentence has one value in `A`, `M`, `N` | true |
| 2.5 `IsModelComplete`, Robinson | `dlo`, `Fin 0 ↪ ℚ`; `2ℤ ↪ ℤ`; `α = Empty` | empty model now excluded; `2ℤ`: least element `> 1` not preserved; `⊥` universal via qf | true |
| 2.6 prime-model completeness | `P ↪ M` elementary | `M ≡ P` for every model; satisfiable by `P` | true |
| 2.7 model companions | two companions `T₁`, `T₂` | alternating chain, union models both | true |
| 3.1 language, 3.2 divisible groups | `ℚ`, `ℝ`, trivial group | trivial group excluded by `Nontrivial`; Lean pair (QE of `Th(ℚ)`, all models `≡`) equals QE of the axioms | true |
| 3.3 `IsPresburgerGroup`, iff | `ℤ`, `ℤ ×ₗ ℤ`, `ℚ ×ₗ ℤ`, trivial, `n = 1` | `ℤ×ₗℤ`: index 4 at `n = 2`; `ℚ×ₗℤ`: `(q,m) = k(0,1) + n(q/n,(m−k)/n)`; `ϖᵏ = δⁿ`, `0<k<n` gives `δⁿ ≥ ϖⁿ > ϖᵏ` | true |
| 3.3 Presburger QE (Lean) | `ϖ = ofAdd 1`, `D₀` | `D₀(x) ↔ x = 1`; `Dₙ` is `∃ y, yⁿ = x` | true |
| 3.4 definable sets | `{x : xᵏ ≤ b}`, `Dₙ(xᵏa)` | `b = ϖʲδᵏ`: set is `x ≤ δ`; `Dₙ(xᵏa)` a union of cosets of `Γⁿ` | true |
| 4.1–4.2 codings | supplier types | `boundedCode` over `Fin m`; sequents `Finset (L.Formula ℕ)` | C01 |
| 4.3 complete r.e. ⇒ decidable | complement of consequence codes | non-sentence codes ∪ codes of `φ` with `T ⊨ ∼φ`, both r.e. | true |
| 4.4 examples, Checks | one-point structure with `Pₙ` iff `n ∈ S` | `∃x Pₙ(x)` in theory iff `n ∈ S`; `∼φ` is Mathlib `φ.imp ⊥` | true |
| 3.3 against Robinson–Zakon | Def. 3.3(iii), Thms 4.4, 4.7 | source: discrete and index `p` for primes; axioms complete; all elementarily equivalent | supported; C02 |

- Source locators checked against the text: 3 (RobinsonZakon1960 lines 408–413, 525–526, 597); the 22 others could not be read.
- Library declarations opened at the pin: 27 (Mathlib `ModelTheory/Ultraproducts.lean:146, 154`, `Satisfiability.lean:101, 241, 425`, `Types.lean:59, 187`, `PartialEquiv.lean:245, 380`, `Order.lean:163, 188, 201, 209`, `Complexity.lean:331, 343`, `Syntax.lean:739`, `Arithmetic/Presburger/Definability.lean:147, 153`, `Algebra/Field/IsAlgClosed.lean:83, 164`, `Computability/RE.lean:225`, `Order/Filter/CountableInter.lean:42`, `GroupTheory/Divisible.lean:108`; Tau Ceti `ModelTheory/Algebra/Group/Basic.lean:55, 103, 206, 309`, `BackAndForth/PotentialIso.lean:44`, `Karp.lean:111, 148, 287, 328`, `DiscreteOrder.lean:300, 315`, `ModelExistence/AElementary.lean:66`, `DirectedUnion.lean:56`). No `IsSaturated`, model completeness or quantifier elimination in either library.
- Cross-roadmap citations resolved: InfinitaryModelExistence §1.2, §2.1, §2.4 on main (lines 275–310, 319–328, 360–368) and at its open revision; RandomGraphs §5.2 and its ownership paragraph at its open head; SequentCalculusAndCutElimination Conventions, §1.1, §1.2, §2.4 at its open head; LogicAndDefinabilityInNumberTheory §4.31 at its open head; RealAlgebraicGeometry (Completed, Layer 6).
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (20 sorried theorems). The 33 elaborated signatures were compared with the README; none lost a binder.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `infer_instance`, `intros; rfl`, `constructor <;> intro h <;> exact h`): none of the 20 theorems closes; no padding.
- Headlines: saturated extensions, universality, uniqueness, Keisler, back-and-forth preservation, the saturated extension test, Robinson's test, divisible groups, the `ℤ`-group equivalence and Presburger elimination are stated; decidability (Layer 4) is named in the module docstring as not statable (`boundedCode` and `LKDerivation` are not at the pins).
- The pull request's text: title and description read against this head; nothing contradicted or left out. No file outside the folder is changed.

Overlap check: read AxKochenErshov, RandomGraphs, SequentCalculusAndCutElimination, HanfNumbers, InfinitaryModelExistence (main and its open revision), InfinitaryLogic, CountableStructureSpaces, LogicAndDefinabilityInNumberTheory; the formula coding is RandomGraphs' (§5.2), the chain lemma InfinitaryModelExistence's (§2.4), the calculus SequentCalculusAndCutElimination's, existential closure as a named predicate LogicAndDefinabilityInNumberTheory's (§4.31), each cited here; model completeness, saturation and the ordered-group theories are owned here only; nothing else shared.

Source independence: 6 passages compared with 1 source (RobinsonZakon1960: the definition and three bullets of 3.3, the Check on `ℚ ×ₗ ℤ`, the docstring of `IsPresburgerGroup`), none shared beyond three words; largest share Tent–Ziegler, 11 of 25 locators, text not readable; contents compared with Tent–Ziegler at chapter level from the publisher's page (Layer 0 draws on Ch. 2, 4, 5, 6, Layer 2 on Ch. 3, Layers 1, 3, 4 on none): independent; its section titles and Marker's text were not readable.

Research link: Layers 0–3 are the toolkit of the Ax–Kochen–Ershov principle and Macintyre's p-adic elimination (README summary; the open AxKochenErshov roadmap consumes them). Layer 3 states Robinson–Zakon 1960, Thms 4.4 and 4.7; Layer 0.4 is Keisler 1964. Rests on the README and RobinsonZakon1960.

## Not verifiable

- Tent–Ziegler 2012 (Thm. 2.1.4, Cor. 2.2.9, Lem. 3.2.2, 3.2.4, Thm. 3.2.5, Lem. 3.2.7, Def. 3.2.8, Thm. 3.2.9, Lem. 4.3.3, 5.2.8, 6.1.2): the sources service found no legal copy (publisher page only). Sampled targets 0.3, 2.4, 2.7 rest on it.
- Marker 2002 (Prop. 3.1.14, 3.1.15, Cor. 3.1.17, 3.1.21, Exercises 3.4.10, 3.4.12, Thm. 4.3.12, Lem. 4.3.17, Thm. 4.3.20, Exercise 4.5.37): no legal copy found. Sampled targets 0.3, 2.6, 3.2, 3.3 rest on it.
- Chang–Keisler 1990, §6.1 (sampled target 0.4): no legal copy found. Keisler 1964: paywalled.
- Presburger 1929 and Robinson 1956: not looked for (no locator is attached to either).
- The mathematics of every sampled target was checked independently (table above); sampled targets 1.1, 2.1, 3.1, 3.4 and 4.1–4.4 carry no source locator of their own.

Automatic checks set aside as false positives: the Tau Ceti theorem on `ℤ` and `ℤ ⊕ₗ ℤ` named in the Check of Layer 1 was read as a declaration this roadmap claims, and it is a library declaration; the four criteria named in 2.2 were read the same way, and 2.2 says in words that they are the names of the Mathlib series and that only one is stated in the Lean file.

## Source issues

- none

## For the human reviewers

- Not tested: Tent–Ziegler has the largest share of the locators (11 of 25) and could not be read; wording and section-level arrangement were not compared with it, nor with Marker (10 locators). Layer 2 draws on its §3.2.
- Licence: `IsQFEquivalent`, `HasQuantifierElimination` and the criterion of 2.2 in `Suggested.lean` take names and statements from an open Mathlib pull-request series (file `Mathlib/ModelTheory/QuantifierElimination.lean`, not in the pinned Mathlib).
- Layer 4 depends on RandomGraphs and SequentCalculusAndCutElimination, both open pull requests by other authors; the description says this pull request merges after them.
- Merge order: LogicAndDefinabilityInNumberTheory (open) cites §2.5 here as a supplier, yet the merge order lists it before this roadmap. This roadmap consumes nothing from it.
