# Review of GraphicalModelsAndConditionalIndependence (pull request #2660 at 4d18205)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated result was recomputed by exhaustive or sampled exact arithmetic on the definitions exactly as `Suggested.lean` writes them (the chain rule and intersection with overlapping sets, agreement with the vector form of conditional independence, the undirected implications, Hammersley–Clifford on positive laws, Moussouris' law, d-separation against moral separation, the three directed properties), and every Evans locator was read at its page; nothing failed. There are two small corrections and three format notes, none blocking. Left to a human: all 26 locators point to one set of unpublished lecture notes, and the refereed sources are named without locators.

## C01 — Moussouris' law, the Pearl–Paz implication and the local Markov property carry no locator, and the References entry for them gives only names and years

A reader who wants the statement of 3.3, of the positive-law converse in 2.4, or of the local property of 2.2 in print cannot find it from the text: "(Moussouris, 1974)" in 3.3 (line 361), "Pearl and Paz" in 2.4 (line 287) and "the one of Lauritzen's book" in 2.2 (line 234) lead to a References entry (lines 605–612) with no title, journal, section or page. The mathematics does not depend on it: Moussouris' law was verified here by direct computation (globally Markov for the four-cycle; each of its eight zero configurations agrees on each of the nine complete sets with a configuration of positive mass), and pairwise ⇒ global for positive laws follows from 3.1 and 2.3, both of which have locators.

The smallest change is a full bibliographic entry for each of the three works and, where a text can be read, a theorem or example number at the claim. If none can be read, saying so in the References entry in one clause ("cited by name; statement verified independently") tells the reader what the attribution rests on.

## C02 — The relation of `Separates` to the separators of GraphConnectivityAndFlows is stated in 2.1 only, and neither the scope section nor the pull-request description mentions that roadmap

2.1 (lines 210–213) says that `Separates` is the set-to-set separator convention of GraphConnectivityAndFlows (its conventions on paths and separators, and its 1.2) for simple graphs; that roadmap is on main and its convention reads as cited (a separator may meet `A ∪ B`, and every vertex of `A ∩ B` lies in every separator). But "Scope and ownership" lists "separation" among what this roadmap owns and names boundaries with three other roadmaps, not this one, and the description's "Suppliers and boundaries" paragraph omits it too. A reader of either place would take separation to be defined here independently.

One bullet under "Boundaries with other roadmaps" would do: GraphConnectivityAndFlows owns separators, path families and Menger duality for multigraphs and arrow families; this roadmap keeps only the predicate on `SimpleGraph` walks needed to state the Markov properties, with the same overlap convention. The same sentence can be added to the description.

## N01 — Four sentences date the text by the state of other roadmaps

"(an open roadmap)" (line 36), "(on main)" (line 210) and "(an open roadmap, not on main)" (lines 547 and 555) will be wrong once those roadmaps merge. Naming the roadmap and its section is enough.

## N02 — `List.IsChain` is listed under "From Mathlib" but is declared in Batteries

It is `List.IsChain` of `Batteries/Data/List/Basic.lean`; Mathlib's `Mathlib/Data/List/Chain.lean` only adds lemmas. The name resolves under `import Mathlib`, so nothing breaks; the contract line could name the file.

## N03 — Layer 3 has one title in the README and another in the Lean file

README: "Layer 3: the Hammersley–Clifford theorem"; `Suggested.lean` line 112: "Layer 3: the Hammersley–Clifford theorem and its failure without positivity".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 margin, `CondIndep` | three fair bits; two copies of a bit; `{v} ⊥ {v} | ∅` | `1/2·1/8 = 1/4·1/4`; `1·1/2 ≠ 1/2·1/2`; forces each value mass 0 or total | Checks true; wrong variant without `p(x_S)` gives 1/8 vs 1/16 | none |
| 1.2 `condIndep_iff_condIndepFun` | vector form over all value triples, incl. inconsistent ones; 404 laws on 2×2×2, 200 on 2×3×2, all `A, B, S` overlapping | 205,824 and 102,400 triples; 141,951 and 69,754 true; 0 disagreements with margin form | agrees; empty `X v` excluded by probability measure | none |
| 1.3 `condIndep_union_iff` | all 6,561 laws in `{0,1,2}^8` on three bits, all 4,096 `(A,B,D,S)`; sizes (1,2,3); four bits structured | 26,873,856 instances, 9,048 nontrivial true, 0 failures; further 25.8M instances, 0 failures | iff holds both ways, no disjointness | none |
| 1.3 Check (parity) | `X1 = X2 + X3` | `1·1/4 = 1/2·1/2`; `1·1/4 ≠ 1/2·1/4`; `1/2·1/4 ≠ 1/4·1/4` | Check true | none |
| 1.4 `condIndep_union_of_pos` | all positive laws `{1,2,3}^8`, `B ∩ D = ∅`, `A` overlapping; sizes (2,1,2,3) | 5,917,404 instances with both hypotheses, 0 failures; fails for some positive law with `B ∩ D ≠ ∅` and for some non-positive law | true; both hypotheses needed | none |
| 1.4 Checks | three copies of a bit; law (2,1,1,2) with `B = D` | `1·1/2 ≠ 1/2·1/2`; `6·2 = 12 ≠ 3·3 = 9` | Checks true | none |
| 2.1 `Separates` | `A ∩ B ≠ ∅`; edgeless graph; four-vertex Check graph | length-0 walk forces `A ∩ B ⊆ S`; `{3}` separates `{1,2}` from `{4}` | matches Evans Def. 4.3 and the on-main separator convention | C02 |
| 2.2 three Markov properties | Evans Ex. 4.12 law; four copies on two edges | (pairwise, local, global) = (T, F, F) and (T, T, F) | both Checks true | none |
| 2.3 `Factorizes.isGlobalMarkov` | products of clique potentials with zeros, all 64 graphs on four vertices, sizes (2,2,2,2) and (2,3,1,2) | 384 and 192 laws, 0 failures | true without positivity | none |
| 2.4 global ⇒ local ⇒ pairwise | all 0/1 laws on three bits × 8 graphs; 80 laws × 64 graphs on four | 2,048 pairs: (T,T,T) 722, (F,F,F) 1,286, (F,F,T) 40; 5,120 pairs: no (T,F,·) or (·,T,F) | implications hold; converses fail with zeros | none |
| 3.1 `factorizes_of_isPairwiseMarkov` | positive laws `{1,2,4}^8` × 8 graphs, Möbius interaction terms | 52,488 pairs, 8,022 pairwise Markov; pairwise ⇔ interactions vanish off complete sets in all | true on sample; path Check true | none |
| 3.2 `markovProperties_tfae_of_pos` | positive laws `{1,2}^8` × 8 graphs; 60 product laws × 64 graphs | (T,T,T) 426 / (F,F,F) 1,622; 903 / 2,937; no mixed pattern | equivalence holds; Check laws give (F,F,F) and (T,·,T) | none |
| 3.3 `moussourisLaw`, both theorems | `Monotone ∨ Antitone` on `Fin 4 → Bool`; all disjoint separated triples of `cycleGraph 4` | support 8; four separations `{i} | {i±1} | {i+2}`; global = true; all 8 zero configurations covered on all 9 complete sets | globally Markov, not factorizing | C01 |
| 4.1 acyclic, parents, ancestors | `1 → 2 → 3`; two-cycle; loop | `desc 1 = {1,2,3}`, `anc {3} = {1,2,3}`; two-cycle: `anc {1} = {1,2}` | Checks true; `TransGen` excludes loops | none |
| 4.2 `DagFactorizes`, local property | empty digraph; chain; two looped vertices | product laws only; `{3} ⊥ {1} | {2}`; loops make local property trivial | Checks true | none |
| 4.3 `dSeparated_iff_separates_moralGraphOn` | literal `IsOpenPath` on all 25 DAGs on 3, all 543 on 4, 250 random on 5 vertices; all `A, B, C` with `C` disjoint from both | 3,125 + 339,375 + 781,250 triples (1,525 + 200,367 + 525,250 with `A ∩ B ≠ ∅`), 0 mismatches; 144 mismatches on cyclic digraphs; mismatches when `C` meets `A ∪ B` | true as stated; both hypotheses needed | none |
| 4.3 Checks | collider with descendant; cyclic `1→2, 2→3, 3→2` | d-sep given `∅` true, given `{4}` false; cyclic: d-sep true, moral separation false, `anc {1,3}` = all | Checks true | none |
| 4.4 `dagFactorizes_tfae` | all 6,560 nonzero laws `{0,1,2}^8` × 25 DAGs; kernel laws with zeros on four vertices, sizes (2,2,2,2), (2,3,1,2) | 164,000 pairs: (T,T,T) 52,410, (F,F,F) 111,590; 2,400 and 1,000 pairs, no mixed pattern | equivalence without positivity; empty `X v` excluded by total mass 1 | none |
| 4.4 Check law | parity collider with copy | all three properties true; `{1} ⊥ {2} | ∅` true, given `{4}` false | Check true | none |

- Source locators: 26 in the README, all to Evans2018; every one read at its page (Evans2018 lines 212–311, 694–812, 1254–1397, 2263–2301); all agree in number, page and hypotheses.
- Library declarations opened at the pins: 19 (among them `Mathlib/Probability/Independence/Conditional.lean:155, 442, 460, 467, 814`, `Mathlib/Probability/Kernel/CondDistrib.lean:75`, `Mathlib/Data/Nat/Choose/Sum.lean:210`, `Mathlib/Data/Finset/Pi.lean:163`, `Mathlib/Logic/Function/DependsOn.lean:67`, `TauCeti/Probability/Independence/Conditional.lean:261, 593`, `TauCeti/Combinatorics/Digraph/ArrowWalk.lean:132`); all exist as described. Neither library file states contraction or intersection.
- Cross-roadmap citations resolved: GraphConnectivityAndFlows (main; conventions and 1.2), MathematicalStatisticsHighDimensional (main; 7.3, 7.4), HiddenMarkovModels and StatisticalLearningTheory (open heads; Layer 1, "Beyond this roadmap"); all read as cited, none is a supplier.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no change outside the roadmap folder.
- Automatic checks: all passed. Elaboration: `sorry` the only warning (12). `#check`-level comparison of the 30 elaborated signatures with the README: no needed binder lost. One-tactic probe (`simp`, `rfl`, `exact?`) closes none of the 12 theorems.
- Headline theorems: all stated in `Suggested.lean`; none unstatable; no padding.
- Overlap check: read GraphConnectivityAndFlows, HiddenMarkovModels, StatisticalLearningTheory, MathematicalStatisticsHighDimensional, BernoulliPercolation; separators of two vertex sets: owner GraphConnectivityAndFlows (this roadmap keeps a one-line predicate on simple-graph walks and names the convention, see C02); nothing else shared.
- Source independence: 14 passages compared with 1 source, none shared beyond standard terms; largest share Evans2018, 26 of 26 locators; contents compared with Evans2018 (chapters 1–8): independent (Layer 1 ↔ part of ch. 2, Layer 2 ↔ ch. 4 §§1–3, Layer 3 mostly absent from it, Layer 4 ↔ ch. 6 with ch. 8 §3; order forced by the Needs lines of 2.3, 2.4, 3.1, 4.4).
- Research link: The headline targets are the Markov-property equivalences of Lauritzen (1996), Hammersley–Clifford (1971), Moussouris (1974), Pearl–Paz (1987) and Lauritzen–Dawid–Larsen–Leimer (1990), the basis of graphical-model statistics; rests on the README's References and Evans2018 line 802.

## Not verifiable

- Lauritzen (1996), Moussouris (1974), Pearl and Paz (1987): cited by name without locator; not openly readable, so the attributions were not checked against the texts (the statements were verified by computation instead).
- Ownership against open pull requests was checked through the roadmap search over the open heads only.

## Source issues

- **Misprint** in Evans2018 at Theorem 6.8, p. 35: the source says the moral graph of the ancestral subgraph with an unbalanced opening parenthesis; it should be the notation of Definition 6.7 with the parenthesis closed; affects nothing.

## For the human reviewers

- Licence/scope: all 26 locators are to Evans2018, unpublished Oxford lecture notes read from the author's departmental page, with no licence stated; the refereed sources are named without locators (README lines 602–612).
- Not tested: wording and arrangement were compared with Evans2018 only; Lauritzen (1996), the standard reference for the same material, could not be read.
- The description states that the roadmap was drafted and reviewed with AI; the author takes responsibility for the content.
