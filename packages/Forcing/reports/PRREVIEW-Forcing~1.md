# Review of Forcing (pull request #2998 at 2fe4929)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: the measure algebra of a finite measure space, which Layer 8 constructs and claims to own, is already owned by VonNeumannAlgebras on main, so it must be cited there and only the new part (completeness, ccc, the random-forcing use) kept here. No stated result was found false: every statement of `Suggested.lean` and every Check was recomputed, and 22 source locators agree with the texts. There are four small corrections and three format notes, none blocking, and two points for the human reviewers (the Apache-2.0 repository the Lean prototypes draw on, and the unpublished lecture notes among the main sources).

## R01 (P2) — The measure algebra of a finite measure space has two owners: Layer 8 here and Layer 2 of VonNeumannAlgebras on main

An implementer of Layer 8 would build a second quotient of measurable sets by null sets beside the one main already plans, and two consumers would then meet two carriers for one object.

Layer 8, "Measure algebra and random forcing", item 1 (README line 494) says: "For a finite measure space, construct the Boolean algebra of measurable sets modulo almost-everywhere equality", and the supplier contracts (line 660) say "Layer 8 owns the measure algebra, its complete Boolean structure". On main, `TauCetiRoadmap/VonNeumannAlgebras/README.md` line 648 (Layer 2, the paragraph after V2.RectangularL2) has: "For finite measures develop the measure algebra modulo null sets with metric `μ(A△B)`", and line 782 consumes it as "the finite measure algebra above"; the open BochnerSpaces roadmap already cites it as "VonNeumannAlgebras V2's finite measure algebra". A roadmap on main is earlier than every open one, and VonNeumannAlgebras precedes this roadmap in the merge order. Mathlib's `MeasureTheory.MeasuredSets` (`Mathlib/MeasureTheory/Measure/MeasuredSets.lean`, line 42) is the native carrier before the quotient and is not named either.

The smallest change: in item 1, cite VonNeumannAlgebras Layer 2 for the measure algebra of a finite measure modulo null sets and its Boolean operations, and keep as this roadmap's own what main does not state: the descended strictly positive measure, Dedekind completeness by essential suprema with the countable-subfamily reduction, and ccc. Change the ownership sentence of "From Mathlib measure theory and probability" to match, add a "From TauCetiRoadmap.VonNeumannAlgebras" contract naming Layer 2, and add the supplier to the Dependencies line of Layer 8. If the quotient planned there is not meant to carry the Boolean-algebra structure this layer needs, say in one clause what this roadmap adds to it.

## C01 — Hamkins–Seabold §8 asserts the correspondence of generic filters, not the formula comparison it is cited for

In the References table (line 690) the row for the Layer 6 poset/Boolean formula comparison reads "Asserted as well known at the start of Hamkins–Seabold §8". At that place (HamkinsSeabold line 935–937, p. 19) the source says that forcing with `P` and with its completion are equivalent because generic filters on one generate generic filters on the other; it does not state `p ⊩ φ ↔ i(p) ≤ ⟦φ⟧`. A reader looking for the formula comparison there finds the filter statement. Since the row already calls the comparison a derived target, it is enough to say that the source asserts the generic-filter correspondence there and that the formula comparison is derived here.

## C02 — `DenseOrderEmbedding.genericFor_map_iff` holds by unfolding the definitions

With `H = e.mapSet G`, "`H` meets `D`" unfolds to `∃ q ∈ D, ∃ p ∈ G, e p ≤ q`, and "`G` meets `e.pullTest D`" unfolds to `∃ p ∈ G, ∃ q ∈ D, e p ≤ q`: the two sides differ by the order of two existential quantifiers. On a copy of the file the statement closes by rewriting with the hypothesis, unfolding `GenericFor`, `mapSet`, `pullTest`, and swapping the quantifiers; neither density of the range nor the order-embedding property is used. As a target it asks an implementer for nothing. If it is kept as a sanity check that `pullTest` is the right pullback, mark it as one; if transport of genericity for dense tests is meant (Layer 0 item 4), state that `e.pullTest D` is dense whenever `D` is, which does use `dense_range`.

## C03 — `principalLower` restates Mathlib's `LowerSet.Iic`

`principalLower p` is defined as `⟨Set.Iic p, …⟩`, which is `LowerSet.Iic p` of the pinned Mathlib (used at `Mathlib/Order/UpperLower/Closure.lean`, line 237). A reader cannot tell whether a different object is intended, and the library's lemmas about `LowerSet.Iic` do not apply to the copy. Define `regularCondition p` as `Heyting.Regular.toRegular (LowerSet.Iic p)` and drop the helper.

## C04 — "the source's `ForcesFormula`" in Layer 4 item 4 refers to a source the text has not yet named

Line 250 says formula forcing ranges over `N` "(as the source's `ForcesFormula` does)". No source has been introduced at that point; the repository meant is named only in "Scope and ownership" (line 604), and `ForcesFormula`, like `MaterialGround.truth_lemma_maximal` and `InternalForcingPresentation` there, is in code font although `Suggested.lean` declares none of them. Name the repository at line 250 ("as `ForcesFormula` of `cameronfreer/forcing` does"), so that a reader does not search this roadmap or the pinned libraries for the name.

## N01 — Imports of `Suggested.lean`

The file opens with `module` and ten `public import Mathlib.<submodule>` lines; the house form is the single line `import Mathlib`.

## N02 — Layer items are numbered list items, cited two ways

The targets of each layer are list items (`1.`, `2.`, …), which the README cites as "Layer 6 item 2" and the Lean docstring of `PName.val_relabel` as "README §6.2". Headings `### k.n` would give each target one citable id; at the least, use one of the two forms throughout.

## N03 — The module docstring does not say which headline theorems are not stated, and why

The docstring calls the file "suggested signatures for some of its definitions and targets"; the forcing theorem, ZFC preservation, the formula comparison, the worked forcings and the factorization are named only in the closing comment, without the carrier each lacks (the material ground and its forcing relation, the ground-name domain). Moving that sentence into the module docstring with the missing carriers would tell a reader at once what the file tests. The external Knaster property of `Fn(I, 2)` (Layer 8, Cohen item 1) would be statable with one short definition, if a further headline is wanted.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `maximalAntichain_iff` | `P = ∅`; `p ∈ A`; `p ∉ A` | `∅` maximal and vacuously predense; `p ∈ A` compatible with itself; `A ∪ {p}` not antichain gives a compatible `q ∈ A` | true |
| `exists_genericFor` | `𝒟 = ∅`; countable `𝒟` | principal filter of `p`; dual of `Order.idealOfCofinals` (`Mathlib/Order/Ideal.lean` 590) | true, not in Mathlib for `PFilter` |
| `DenseOrderEmbedding.compatible_iff` | `r ≤ e p, e q` | density gives `e p' ≤ r`, embedding gives `p' ≤ p, q` | true |
| `exists_mapFilter`, `exists_pullFilter` | two members; `hloc` | `p₃ ≤ p₁, p₂` in `G` gives `e p₃` below both; `e p₃ ≤ q ≤ e p₁` gives `p₃ ≤ p₁`; `mapSet (e⁻¹H) = H` both inclusions | true |
| `genericFor_map_iff` | unfold both sides | `∃ q ∈ D, ∃ p ∈ G, e p ≤ q` on each side | true by unfolding (C02) |
| `complement_filter_denseOpen` | `q, r ≤ a` incompatible | both in `G` would have a common lower bound in `G`; so one lies in `Gᶜ` | true |
| `sigmaLinked_isKnaster`, Knaster ⇒ ccc | uncountable `A`, cover `Aₙ` | some `A ∩ Aₙ` uncountable and linked; an uncountable antichain has two compatible members | true |
| `ccc_denseOrderEmbedding_iff` | antichain `B ⊆ Q` | choose `e p_b ≤ b`; `p_b = p_b'` would make `b, b'` compatible | true both ways |
| `countablyClosed_isCountablyDistributive`; `countablyDistributive_denseOrderEmbedding_iff` | `Eₙ = ↓e(Dₙ)`, `Dₙ = e⁻¹Eₙ` | `e p'' ≤ q ≤ e pₙ` gives `p'' ≤ pₙ ∈ Dₙ`; preimage of dense open is dense open | true both ways |
| Layer 7 Check, `ℕ` with larger stronger | tails `{m ≥ n}` | dense open, intersection `∅`; all conditions compatible; quotient one point; generic filter is `ℕ` | not distributive, no new sets: converse needs separativity, as stated |
| `regularCondition_le_iff`, `regularCondition_ne_bot` | `¬¬Iic q` | `= {x | SepLE x q}`; contains `q`; `SepLE p p` holds; `SepLE` transitive | true |
| `regular_has_lubs` | `S = ∅`; general | `⊥`; `toRegular (sSup ↑S)` via `Heyting.Regular.gi` (`Regular.lean` 184); no complete instance at pin | true, not in Mathlib |
| `CompletionMap.le_iff_sepLE`, `injective_of_separative` | `e p ≰ e q` | density gives `e r ≤ e p ⊓ (e q)ᶜ`, `r' ≤ r, p` with `r' ⊥ q`; trivial `B` forces `P = ∅` | true |
| `exists_regular_completionMap` | compat, density | `i p ⊓ i q = {x | SepLE x p ∧ SepLE x q}`, nonempty iff compatible; `p ∈ b` gives `i p ≤ ¬¬b = b` | true |
| `PName.val_relabel` and its docstring | separative `P`; `G` meeting `{r ≤ q} ∪ {r ⊥ q}` | `e⁻¹U_G = {q | ∃ p ∈ G, SepLE p q}`; equals `G` in both cases | proved; docstring true |
| Layer 6 Checks | two atoms of `𝒫{0,1}`; `{p,q,r₀,r₁}`; `Fn(ℕ,2)` with `sₙ` | preimage of `{⊤}` is `∅`; is `{p,q}`, no common lower bound inside; `sₙ ⊥ sₘ` for `n ≠ m`, so neither `b` nor `¬b` in `U_G` | all true |
| Layer 6 item 2 comparison | `⊥`, `→`, `∀`, empty `D` | `e p ≤ ⊥` never; `e p ⊓ a ≰ b` gives `r ≤ p` forcing `φ` not `ψ`; `⨅` over image of `N`; empty meet `⊤` | consistent for arbitrary `N` |
| Layer 6 item 5 | regular cut `b` | `p ∈ b ⇒ i(p) ≤ ¬¬b = b`; `i(p) ≤ b ⇒ p ∈ b` | `b = {p | i(p) ≤ b}` true |
| `BName.eqVal_self`, `eqVal_trans`, `memVal`, `truth` | one child; zero weight | `w ⇨ (w ⊓ ⊤) = ⊤`; zero-weight child contributes `⊤` to meets, `⊥` to joins | match Hamkins–Seabold p. 2 recursion |
| Layer 0 Checks | `ℕ`, `ℤ`, negative integers in `ℤ` | `{0}` coinitial, `{1}` predense not coinitial; `↑n` misses `Iio n`; `↑0` misses the dense subset | true |
| Layer 2 Checks | `P = ∅`, one point | `LowerSet ∅` has one element; two-element algebra | true |
| Layer 7 item 4 converse (Eskew 2.7) | antichains `A_α ⊆ D_α` | `q ⊩ p_α ∈ Ġ` gives `q ≤* p_α`, separativity gives `q ≤ p_α`; antisymmetry unused | true as stated |
| Layer 8 measure algebra (R01) | countable subalgebra of Cantor measure algebra | remove `Cₙ ⊆ Aₙ` of measure `< 2⁻ⁿ⁻²`: positive set below no `Aₙ` | "need not be dense" true; carrier owned on main |
| Layer 8 Cohen, collapse | finite `I`; `κ = ω` | total function is an atom, so atomlessness needs infinite `I` as stated; `<ω`-closure trivial | true |

- Source locators checked against the text: 22 (Karagila 2.20, 2.22, 3.5, 3.7, 3.20, 3.22, 4.1–4.3, 4.14, 4.16, 4.17, 5.3–5.6, 6.1 with its Remark, 6.4, 6.6, 6.9; Eskew 2.7; Hamkins–Seabold Lemmas 1, 2, 10, Theorems 3, 40, 41, §8; Fremlin 322A–D, 322G, 551C, 551K, 552A, 562B–C), all present at the stated places.
- Library declarations opened at the pin: `IsCoinitial` (`Order/Bounds/Defs.lean` 23, dual of `IsCofinal` at 65), `Order.idealOfCofinals` (`Order/Ideal.lean` 590), `Heyting.Regular.toRegular` and `gi` (`Order/Heyting/Regular.lean` 171, 184; Boolean algebra at 199, no complete instance), `IsMaxAntichain` (`Order/Antichain.lean` 390–416), `Measure.infinitePi` (`Probability/ProductMeasure.lean`), `MeasuredSets` (`MeasureTheory/Measure/MeasuredSets.lean` 42), `LowerSet.Iic`, the five `SetTheory/ZFC` modules and `ModelTheory/Quotients.lean`. No forcing, Rasiowa–Sikorski for `PFilter`, Boolean-valued or Δ-system declaration at the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations: the README cites no roadmap by section; none to resolve.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/Forcing/Suggested.lean` at the pins: 19 `sorry` warnings and nothing else; no sorry'd data, no `set_option`. Elaborated types of all 52 declarations compared with the README: no needed binder lost.
- One-tactic probe on a copy of the file, nine sorried theorems: only `genericFor_map_iff` closes (by unfolding).
- No change outside `TauCetiRoadmap/Forcing/`; the description's counts (19 admitted, one proved) and pins (Lean v4.36.0-rc2, Mathlib 1b1ccf4b0, Tau Ceti 2fd255d99) agree with the head.
- Ownership against open pull requests was checked by object search over all open heads and main (Rasiowa, Boolean-valued, generic filter, measure algebra, Borel code, Δ-system, Boolean completion, Cohen, Knaster/ccc, and this file's declaration names).

Overlap check: read InfinitaryLogic, CountableStructureSpaces, InfinitaryModelExistence (main), RandomGraphs, HanfNumbers, ModalLogicCompleteness (open), and VonNeumannAlgebras and BorelEquivalenceRelations (main); nothing shared with the first six; the finite measure algebra is shared with VonNeumannAlgebras, its owner (R01).

Source independence: 27 passages compared with 6 sources (22 locators and 5 further prose passages), none shared; largest share Karagila, 21 of about 43 locators; contents compared with Karagila: independent (Layers 4–5 ↔ Ch. 2, Layer 7 ↔ §3.1, §3.3, Ch. 4, Layer 8 ↔ Ch. 3, Layer 9 ↔ Ch. 5–6: order differs and Layers 0–3 and 6 have no counterpart).

Research link: The forcing theorem, ZFC preservation and the Cohen model of ¬CH are the prerequisites of independence results; Layers 3 and 6 are the setting of Hamkins–Seabold (2012) on Boolean ultrapowers and of Han–van Doorn (2019); rests on the README's references and the Hamkins–Seabold text.

## Not verifiable

- The README's and the description's claims about `cameronfreer/forcing` at `5d77761d` (`MaterialGround.truth_lemma_maximal`, `InternalForcingPresentation`, `ForcesFormula`, which axioms its extension satisfies): the repository's file list was readable, its code search returned nothing without a login, and the declarations were not opened.
- Kunen, Jech and Bell are listed without locators and were not read; no statement rests on them alone.
- Flypitch, its Lean 4 port, the `boolean-valued-analysis` repository and the two AFP entries were not opened; they are cited as related work only.
- Library near-match search by docstring was unavailable (the service timed out); the pinned sources were searched by object instead.

Automatic checks set aside as false positives: the lead that `PName.val`, `PName.relabel` and `PName.val_relabel` lost the `Preorder` binder (they are order-free by design, and the file omits it on purpose); the lead that `PName.val_relabel` is found nowhere (the roadmap's own `Suggested.lean` declares it).

## Source issues

- **Gap** in Karagila at Theorem 4.16, printed page 22–23: the source says a forcing is κ-distributive exactly when it adds no short sequences of ground elements, for any forcing notion; it should be assume the order separative for the converse (the reversed order on ℕ is a counterexample), as only the informal Remark after Definition 1.2 suggests; affects a stated result.

## For the human reviewers

- Licence: `TauCetiRoadmap/Forcing/Suggested.lean` lines 22–23 say its order and genericity prototypes draw on the Apache-2.0 repository `cameronfreer/forcing`, owned by the pull request's author; the declarations were not compared with that repository's code.
- Scope: the locators rest mainly on unpublished lecture notes on their authors' pages (Karagila, 21 locators; Eskew, 1) and a 2012 arXiv manuscript (Hamkins–Seabold); the refereed textbooks (Kunen, Jech, Bell) are listed without locators.
