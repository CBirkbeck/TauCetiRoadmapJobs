# Review of SatisfiabilityComplexity (pull request #2521 at 044d483)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason of ownership and none of mathematics: the composition of polynomial-time stack machines and the output-length bound behind it (target 4.1) are also planned by the open roadmap CertifiedPermutationComputation (pull request #717, section 1.2), and neither text names the other. Every statement, Check and source locator that was tested came out correct, including the constants in the two width–size relations and all the small-instance values. There are two small corrections and two format notes, none blocking; two points are left for the human reviewers.

## R01 (P2) — The composition of polynomial-time machines in 4.1 has a second owner, CertifiedPermutationComputation 1.2, which this roadmap does not cite

Two roadmaps would each have the same construction built, and an implementer of either cannot tell which statement is the library's. The scope section here claims "polynomial-time computable functions on bit strings on Mathlib's machines, closure under composition" and says "The composition is therefore a target of this roadmap". The README of CertifiedPermutationComputation at the head of pull request #717 (`TauCetiRoadmap/CertifiedPermutationComputation/README.md`, lines 89–115, section "1.2 Output size and composition") plans the same three things for the same Mathlib type `Turing.TM2ComputableInPolyTime`: the bound "output length at most input length plus a constant times the number of steps", monotonicity of evaluation of polynomials with natural coefficients, and the composite machine with an explicit time polynomial. These are exactly the first bullet of 4.1 (`nonempty_tm2ComputableInPolyTime_comp`), its proof route and its length-bound bullet. Neither library pin has the construction (no `TM2` declaration in Tau Ceti; Mathlib's `Computability/TuringMachine/Computable.lean` stops at `idComputableInPolyTime`), so one of the two roadmaps must own it and the other cite it.

The smallest change: settle one owner and say so in "Scope and ownership" and in the *Needs:* line of 4.1. Either cite CertifiedPermutationComputation 1.2 for the composite machine and the output-length bound, keeping `nonempty_tm2ComputableInPolyTime_comp` here as its propositional form (and the remaining bullets of 4.1, which that roadmap does not state); or keep the construction here and say in one clause how this statement relates to that section, so that the other roadmap can cite 4.1. The pull request description would then name that roadmap among the boundaries.

## C01 — The subsumption lemma that 3.2 and 3.3 rely on must keep track of width and of the node count, which the cited statement of PropositionalSatisfiability 3.1 does not

In 3.2 ("which the subsumption lemma of PropositionalSatisfiability 3.1 absorbs", line 327) and in the *Needs:* lines of 3.2 and 3.3, the restricted derivation is repaired by the supplier's subsumption lemma. That lemma, as stated in PropositionalSatisfiability 3.1, is about `Derivable` only: if every clause of `S` has a subset in `T` and `C` is derivable from `S`, some subset of `C` is derivable from `T`. The arguments of 3.2 and 3.3 need more: the new derivation has width at most that of the old one, and, for 3.2, at most as many nodes. Both are true by the same induction (when the resolved literal is missing from one premise's subset, that premise alone is kept), but neither is a consequence of the cited statement. Adding to the list of 3.1 one bullet, "if every clause of `S` has a subset in `T` and `C` has a derivation from `S` of width at most `w` (a tree-like one with `s` nodes), then some subset of `C` has one from `T` of width at most `w` (with at most `s` nodes)", and pointing 3.2 and 3.3 at it, would close the gap.

## C02 — The first Check of 5.2 says the two constant reductions depend on non-codes lying outside `satLang`; they do not

In the Checks of 5.2 (line 630): "both depend on strings that are not codes being outside `satLang`". The constant functions with values `encodeCNF [[]]` and `encodeCNF []` take only codes as values. What they use is that `encodeCNF` is injective (5.1), so that the code of `[[]]` is the code of no satisfiable presentation, and that the empty formula is satisfiable. The convention on non-codes matters for the reduction of 5.3, where the README already says so. The sentence would be right as "both use the injectivity of `encodeCNF`: the code of `[[]]` is the code of no other presentation".

## N01 — Results named by author and year have no entry in the References

Aspvall–Plass–Tarjan 1979 (1.2), Lewis 1978 (2.2), Schaefer 1978 (1.3), Haken 1985 (3.4) and Cook and Levin (5.2) are credited in the text, but the References list only the four works that were read; a reader cannot find the others. A bibliographic line for each would do.

## N02 — The infinite counterexample of 1.3 would be easier to check with its one-line reason

In the last Check of 1.3 (line 171), "every clause satisfied by all of them contains a positive literal" is true because the assignment that is true exactly on the variables of the clause belongs to the set; the all-false assignment suggests the opposite at first sight. A clause saying so would help.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `encard_derivable_le` | n = 0, 1; all clauses of width ≤ 2; width 3 | `1+2n+n(2n−1) = 2n²+n+1`; n=0 gives 1 = `{∅}`; n=1 gives 4, all derivable; width-3 resolvent has 4 literals | true, bound attained | none |
| 1.2 `Implies`, criterion | `{{x}}`, `{{x},{¬x}}`, `{∅}`, `{{x,y},{¬x,y},{¬y}}`, tautology `{x,¬x}`, eight 3-clauses | pairs `(¬x,x)`; `(¬x,x),(x,¬x)`; none; five pairs as listed, chains `¬y→x→y`, `y→¬y`; loops only; no pairs | both directions hold; `∅ ∉ S` and width needed | none |
| 1.2 entailment bullet | `b = a`, `b = ¬a`, general | reflexive chain; reduces to unit case; new edge `¬a→a` splits a chain `¬b→b` into `a→b` | true | none |
| 1.3 majority | `M = {100,010,001}`, `M = ∅`, `V` empty, `V = ℕ` finite support | models of 2-clauses: `000,100,010,001` (4); `{∅}`; two sets; constant `true` satisfies every clause true on `M` | true; finiteness needed | N02 |
| 1.3 footnote (Chen) | Chen06 lines 118–122, 155–157 | majority preserves every 2-clause, Section 1, footnote 2 | locator correct | none |
| 2.1 Horn converse | `M = {10,01}`, `M = ∅`, `P = ∅` in the sketch | Horn models `00,10,01`; `{∅}`; negative clause on `∅` is `∅` | true | none |
| 2.2 `Clause.rename`, Lewis | `{{x,y}}`, `{{x,y,z},{¬x,¬y,¬z}}`, `{(v,true),(v,false)}`, example `S` | Horn for 3 of 4 renamings = the 3 models; six 2-clauses unsatisfiable; map injective, one positive; only model `x↦1,y↦0` | iff holds both ways; convention pinned | none |
| 3.1 widths and tree sizes | four 2-clauses; eight 3-clauses; `{∅,{x,y,z}}` | computed: 7 nodes, width 2; 15 nodes, width 3; width-0 refutation | Checks correct | none |
| 3.2 `widthDerivable_of_treeDerivable` | `s = 1`; `s ≤ 2^(b+1)−1` induction; K4 parity formula | `Nat.log 2 1 = 0`; smaller subtree ≤ `2^b − 1`; computed 16 clauses, width 4, 55 nodes, `4 ≤ 3+5` | floor form true; BSW99 lines 246–261 | C01 |
| 3.3 `widthDerivable_of_isDerivation` | `S = 1`; `n = 0`; `d ≥ 2n`; `{{x},{¬x}}`; corollary | `d = 0`; bound `width F`; trivial via width `≤ 2n`; `⌈√(2 ln 3)⌉ = 2`; `a^d ≥ e^{d²/2n} ≥ S`; `(w−wF−2)²/(8n) ≤ ln S` | constant 2 correct; BSW99 lines 262–275 | C01 |
| 3.4 pigeonhole bound | `n = 0`, `n = 1`, `n+1 = 31, 32`, `pigeonhole 3 2` | `[∅]` has length 1 < 1.035; 5 ≥ 1.072; 2.928, 3.031; computed 9 clauses, width 2, 21 nodes | true as indexed (`m = n+1 ≥ 2`); BKPS02 lines 505–506, 538–543, 566 | none |
| 4.1 composition, `IsPolyTime` | infinite `βΓ`; `k₀ = k₁`; identity machine | hypothesis empty (input alphabet is a `Fintype`); output ≤ input + c·time; `idComputer` halts in 1 step | true; Mathlib declarations as described | R01 |
| 4.2 `delim`, `pair` | `pair [] []`, `pair [true] [false]`, `[]`, `[true]` | `[false]`; `[true,true,false,false]`; neither is a pair (length of `delim` is odd, `delim [] = [false]`) | prefix-free, injective | none |
| 4.3 `InP`, `InNP`, reductions | `L = ∅`, all strings; `p = 0`; long `w` with `f x ∉ M` | constants; `R` = all pairs over `L`; bound `p.comp q` needs the length test in the new `R` | definitions and both theorems as in AroraBarak07 lines 1970–1975, 2015–2019, 2094–2100, 2128–2131 | none |
| 5.1 codes | `[]`, `[[]]`, `[[(0,true)]]`, the length-24 example, strings of length ≤ 10, lists of zeros | `[false]`; `[true,false,false]`; six bits as stated; `1+18+5 = 24`; computed 31 codes of 2047; `0,1,2,5,26,677` | correct | none |
| 5.2 `satLang_inNP`, Cook–Levin | certificate length; constant reductions | `1 + Σ(3+2·size v)` over distinct variables ≤ code length; `[[]]` code not in `satLang` by injectivity | AroraBarak07 lines 2188–2206, 2255–2264 | C02 |
| 5.3 reduction to width 3 | `[]`, `[[]]`, `[[(0,true)]]` | size 1; `and fls tru` size 3, six Tseitin clauses, unsatisfiable; size `1+2m+t+r = 4` with variables of size 0 | agrees with PropositionalSatisfiability 2.1, 2.3; AroraBarak07 lines 2356–2364 | none |
| 5.4 tractable fragments | `kSatLang 0`, a satisfiable 3-clause | `{encodeCNF []}`; in `satLang`, not in `kSatLang 2` | consistent with 1.1, 1.2 and the supplier's 3.4, 4.1 | none |
| 5.5 `satisfiable_iff_exists_isIndepSet` | empty formula, `{∅}`, `{{x,y},{¬x},{¬y}}`, four 2-clauses, `{x,¬x}` | `s = ∅`; no occurrence, card 1 unreachable; path on 4 vertices, maximum 2 < 3; 4 positive occurrences without complementary pair | both directions hold; AroraBarak07 lines 2408–2415 uses another graph, as the README says | none |

- Source locators checked against the text: 22 (AroraBarak07 13, BSW99 6, BKPS02 2, Chen06 1), all correct.
- Library declarations opened at the pin: `Turing.FinTM2`, `TM2OutputsInTime`, `TM2ComputableInPolyTime`, `idComputer`, `idComputableInPolyTime` (`Mathlib/Computability/TuringMachine/Computable.lean`, lines 130, 174, 199, 216), `Computability.encodeNat`, `decode_encodeNat` (`Mathlib/Computability/Encoding.lean`, lines 92, 126), `SimpleGraph.isClique_compl` (`Clique.lean` line 913), `SimpleGraph.isVertexCover_compl` (`VertexCover.lean` line 66).
- Cross-roadmap citations resolved at the head of the PropositionalSatisfiability pull request: sections 1.1, 1.2, 1.3, 2.1, 2.3, 3.1, 3.3, 3.4, 3.5, 4.1 and every name cited from them exist with the stated content; the twelve copied definitions agree with that roadmap's `Suggested.lean` character for character in their bodies.
- Elaboration of `TauCetiRoadmap/SatisfiabilityComplexity/Suggested.lean`: 17 warnings, all `sorry`; no error, no `set_option`, no sorry'd data, single `import Mathlib`. The elaborated types of all declarations were compared with the README statements: no binder lost, generality equal.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `infer_instance`, `trivial`): none of the 17 theorems closes.
- Automatic checks: all passed; dependency check output `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Headline theorems of the Summary (Aspvall–Plass–Tarjan; both width–size relations; the pigeonhole bound; SAT in NP, Cook–Levin, reduction to width 3, width 2 and Horn in P): all stated in `Suggested.lean`.
- Changes outside the folder: none.

Overlap check: read PropositionalSatisfiability (open, #2506), CertifiedPermutationComputation (open, #717), ComputabilityTheory (main); clause sets, resolution, Tseitin, Horn unit resolution and pigeonhole formulas: owner PropositionalSatisfiability, cited and not restated; composition of polynomial-time stack machines and the output-length bound: claimed by both CertifiedPermutationComputation 1.2 and this roadmap's 4.1 (R01); nothing shared with ComputabilityTheory.

Source independence: 7 passages compared with 4 sources (the proof plans of 3.2, 3.3, 3.4 and 5.2, the definitions of 4.3, the majority remark of 1.3, the reduction remark of 5.3), none shared; largest share AroraBarak07, 13 of 22 locators; contents compared with AroraBarak07 (chapters 1 and 2): independent, Layers 1 to 3 have no counterpart there and the order of Layers 4 and 5 is forced by their *Needs:* lines (4.1 → 4.2 → 4.3 → 5.1 → 5.2).

Research link: Layer 3 states the width–size relations of Ben-Sasson and Wigderson (1999) and the pigeonhole bound of Haken (1985) in the form of Beame, Karp, Pitassi and Saks (2002), the basic tools of resolution lower bounds; Layer 5 is the Cook–Levin theorem. Rests on the README's sources BSW99 and BKPS02 and its "Downstream consumers".

## Not verifiable

- Haken's original bound `2^(n/577)`: read only as quoted in BKPS02 line 566, which is how the README presents it.
- The attributions to Aspvall–Plass–Tarjan 1979, Lewis 1978 and Schaefer 1978: the README gives no locator and the texts were not opened; the statements themselves were checked directly.
- BSW99 was read through OCR: the displayed formulas for `d` and `a` in the proof of Theorem 3.2 (lines 264–272) are partly illegible; the fraction `d/(2n)` was reconstructed from the argument, not read.
- The numbering of the published Arora–Barak book was not compared; the README cites the January 2007 web draft, which is the text that was read.
- Ownership against the open pull requests was checked through the roadmap search over their heads; CertifiedPermutationComputation is not among the checkouts listed with a path and was read at its head through that search.

## Source issues

- none

## For the human reviewers

- **Licence.** The source with most locators, AroraBarak07, is the authors' January 2007 web draft; its title page (AroraBarak07 line 14) says it is not to be reproduced or distributed without permission. The README cites its numbering, not the published book's.
- **Scope.** Which roadmap owns the composition of polynomial-time stack machines (R01) is a decision between two open pull requests, #717 and this one; neither roadmap is in the merge order yet.
- **Scope.** `TauCetiRoadmap/SatisfiabilityComplexity/metadata.toml` records the topic `math.LO`; the sources are complexity theory and proof complexity.
