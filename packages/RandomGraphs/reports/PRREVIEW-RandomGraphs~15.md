# Review of RandomGraphs (pull request #1223 at 0c208ea)

**Verdict:** accepted

**Summary.** Accepted: the full pass over every layer and every declaration found no false, vacuous or unsupported statement, no upward or cyclic supply, and `Suggested.lean` elaborates with `sorry` as its only warning. All four small corrections and all four format notes of the previous review are repaired at this head. There is one small correction (a sentence about how SaturationAndQuantifierElimination relates to the quantifier-elimination definitions) and two format notes, none blocking. Left to the human reviewers: the requirement that the two decision maps be executable definitions, the link to a third-party copy of Fagin's paper, the provenance repository, and the four sources whose texts could not be read.

## C01 — SaturationAndQuantifierElimination does not take its quantifier-elimination definitions from this roadmap; it states them itself

Under "Downstream consumers" (README line 1560) the text says of the open roadmap SaturationAndQuantifierElimination that "its quantifier-elimination definitions are those owned here". A reader who opens that roadmap to follow the citation finds none: at its head its Layer 2.1 (its README lines 219–220) states `Theory.IsQFEquivalent` and `Theory.HasQuantifierElimination` as its own items, its scope paragraph assigns Layers 2.1–2.2 to "the Mathlib quantifier elimination series … Tau Ceti builds 2.1–2.2 in its shape", its `Suggested.lean` (lines 142–147) declares local copies, and its section "From RandomGraphs" consumes only the formula coding of §5.2. So the two definitions and the reduction to finite variable types have two stated owners. This roadmap is the earlier of the two and may not cite the later one, so its ownership sentence in "Scope and ownership" (line 1578) is the right one and nothing is owed here beyond accuracy.

The smallest change: "The open roadmap SaturationAndQuantifierElimination consumes the effective coding of first-order formulas of 5.2; it also states the two theory-level quantifier-elimination definitions (its Layer 2.1), which are owned here."

## N01 — The two quantifier-elimination definitions stand under the Layer 4 section comment of `Suggested.lean`

`Language.Theory.IsQFEquivalent` and `Language.Theory.HasQuantifierElimination` (lines 250, 256) come before the comment "Finite-rank agreement and genuine QE targets (Layer 5)" (line 260); the README states them in 5.2.

## N02 — "Any type of free variables" in a docstring, `{α : Type}` in the definition

The docstring of `radoAxioms_hasQuantifierElimination` (`Suggested.lean:503–505`) says "for formulas in any type of free variables"; `HasQuantifierElimination` (line 258) quantifies over `{α : Type}`, universe `0` only. "Any type in `Type`" would match.

## Previous findings

- C01 (ownership of `IsQFEquivalent`, `HasQuantifierElimination` and the finite-variable reduction not stated) — repaired: "Scope and ownership" (lines 1578–1580) now lists "the theory-level definitions `Language.Theory.IsQFEquivalent` and `Language.Theory.HasQuantifierElimination` with the reduction to finite variable types", and "Downstream consumers" names SaturationAndQuantifierElimination and AxKochenErshov as consumers of the §5.2 coding. One clause of the new sentence is this round's C01.
- C02 (measurability of the Rado isomorphism class restated in 9.1) — repaired: line 1129 reads "The isomorphism class of `R` is measurable (CountableStructureSpaces, Worked examples, item 4, through its extension-axiom description)"; the item is on main (CountableStructureSpaces README lines 931–935).
- C03 (three API-level declarations) — repaired: `foRank_eq_zero_iff_isQF`, `satisfies_triangleSentence` and `satisfies_noIsolatedSentence` now carry "Sanity check of … not a headline target" in their docstrings (`Suggested.lean:273, 960, 966`).
- C04 (diameter of `K₁`) — repaired: line 1104 reads "a complete graph on at least two vertices has diameter `1`".
- N01 (scope pointing downward) — repaired: "Every layer above is required" (line 1568), "specified above" (line 1571).
- N02 (six undeclared names in 5.2) — repaired: line 633 "(proposed names; `Suggested.lean` states their existence consequences, not these declarations)" and the fenced block's comment "Proposed signatures, not declared in Suggested.lean".
- N03 (section order of `Suggested.lean`) — repaired: Layer 0; 1–3; 4; 5; 6–7; 8; 8.2; 9; 10; 11 (lines 56, 100, 140, 260, 534, 671, 732, 772, 879, 932). N01 above is what remains.
- N04 (`toStructure_ofStructure` under the wrong file) — repaired: the supplier row (line 1603) adds `ModelTheory/RelationalConfiguration/Structure.lean` and marks the declaration "(in `Structure.lean`)".

## Verified sound

| Statement | Instances tried | Left / computed | Right / claimed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 0.1 transport | swap of `K₂`; `K₁ ↪ K₂` with `∃y Adj(x₀,y)` | swap is an automorphism; formula F at `K₁`, T at image | embeddings preserve QF only | true | none |
| 0.2 pattern law, `binomialRandom_map_comap` | one present, one absent pair; empty pattern; `p = 0, 1`; `Fin 2 ↪ Fin 3` | `p(1−p)`, `1/4` at `½`; 1; 0, 0; edge mass `p` both sides | same | true | none |
| 0.3 `Satisfies`, `sentenceProbability`, joint measurability | `∃x∃y Adj` at `n = 0,1,2`; `∀x ⊥` at `n = 0, 1`; event on `ℕ` | 0, 0, `p`; 1, 0; countable union of cylinders | same | true | none |
| Layer 1 strong AP | sets of size ≤ 1, ≤ `m`; two edges at a root | AP by injecting the smaller extension; strong AP needs `m + 1` points; free amalgam on 3 vertices | same | true | none |
| 2.1 chains and requests | constant chain `R ⊔ K₁`, class of finite graphs; `Fin 0 ⊂ Fin 1 ⊂ …` | infinite stage embeds in no finite graph: all requests vacuous; limit not ultrahomogeneous; limit `ℕ` | excluded by stage membership | consistent | none |
| 2.2 `exists_isFraisseLimit_of_isFraisse` | empty language, sets of size ≤ 0, ≤ 2 | limits with 0 and 2 elements, countable | no `Nonempty`/`Infinite` in conclusion | true | none |
| Layer 3 rooted theorems | `A = M` finite, `a_M = id`; `(ℚ,<)`, `0↦0, 1↦2` | forces `e = a_N`; `x ↦ 2x` | same | true | none |
| 4.1 `IsExtensionWitness`, `HasExtensionUpTo`, `hasExtensionProperty_iff` | `Fin 0`, `K₁`, `K₂`, 4-cycle; supplier definition | budget 0: F, T; `K₁` budget 1 F; C₄ budget 1 T, 2 F (adjacent pair, 0 common neighbours); supplier asks `z ∉ t` only | same; looplessness gives `z ∉ s` | true | none |
| 4.1 `satisfies_extensionSentence` | `r = s = 0`; `(1,0)`, `(0,1)` on `K₁`; `(2,0)` on C₄ | `∃z ⊤`; F, F; F | nonempty; F, F; F | true | none |
| 4.2 Rado presentation, `isFraisseLimit_radoGraph` | pairs (0,1), (0,2), (1,3), (1,1); request `{0}`, `{1}` | bits 1, 0, 1, diagonal; `5 = 101₂` adjacent to 0, not 1 | edge, nonedge, edge, none; witness 5 | true | none |
| 5.1 `foRank`, `satisfies_iff_of_extension`, `formula_iff_of_extension` | `d = 0`: `K₁`, `K₂`; `∀x∃y Adj`; `m = 2, q = 1`; `m = 0, q = 1` | rank-1 sentences see only nonemptiness; `∃x∃y Adj` (rank 2) F, T; rank 2; budget 2; budget 0 | sharp at `d = 0`; budget `m + q − 1` | true | none |
| 5.2 `radoAxioms`, completeness, categoricity, `radoAxioms_models_iff` | Rado, countable edgeless, `K₁`; `∀x∃y Adj`, `∃x Adj(x,x)` | model; fails `E_{1,0}` twice; T, F in `R` | same | true | none |
| 5.2 QE definitions and Checks | `∃y Adj(x₀,y)` mod `T_R`, mod simple graphs; unsatisfiable theory | `⊤`; QF formulas in `x₀` constant on `K₁`, `K₂` while formula is F, T; all `⊥` | same | true | C01 (ownership sentence), N02 |
| 5.2 coding, `computable_boundedCode` | `⊥` at `n`; imp, all, rel, equal head symbols | tag `n+2`; tags 0, 1; relation symbol; term: five distinct heads, so case analysis is well defined | same | true | none |
| 5.2 `typesWith_…_eq_singleton`, primeness | `m = 0`; pairs (0,0), (0,1), (0,2) of `R` | one 0-type (complete theory); three distinct diagrams | singleton; three types | true | none |
| 5.3 `radoAxiomsUpTo_models_iff` | `d = 0`, `d = 1`, `∀x∃y Adj` | `K₁` models budget 0, fails the sentence (rank 2 > 1); follows from `E_{1,0}` | allowed; holds | true | none |
| 6 `extensionError`, `extension_failure_le` | `B₀(0,p)`, `B₀(1,p)`, `B₁(3,½)`, `B₁(4,½)`, `B₂(4,½)`; `Fin 3` | 1, 0, 3/2, 1, 29/2; budget 1 impossible (odd degree sum) | same; `1 ≤ 3/2` | true; `n − t` truncation harmless (`C(n,t) = 0`) | none |
| 6 `extensionError_le_exp`, witness law | `d=1, n=4, p=½`; `p = 0`; `n = d`; two candidates, `q = ¼` | `1 ≤ 16e^(−3/2) ≈ 3.57`; RHS `(d+1)2^d n^d`; `1 ≤ e⁰`; 9/16, 6/16, 1/16 | holds; same masses | true | none |
| 7.1 `sentenceProbability_error`, `firstOrder_zero_one`, finite models | `∃x∃y Adj`; `n = d = 0` | `1 − (1−p)^C(n,2) → 1`; `|·| ≤ 1 = B₀(0)` | Rado truth 1 | true | none |
| 7.2 varying parameters | `δ_n = 1/3`; `1/log(n+2)`; `a = 1/(2d)` | `δ^d ≥ n^(−1/2)` eventually: `(n−d)n^(−1/2) − d log(n+2) → ∞` | all-rank ⇒ every fixed-`d` condition | true | none |
| 7.3 joint stabilization (headline) | no joint law | summable `B_d` and `measure_limsup_atTop_eq_zero` (no independence) | a.s. eventual agreement per `d` | true | none |
| 8.1 rooted limits | `ψ = Adj(x₀,x₁)`, `H = K₂`, edgeless; `p = 0` | 1, 0; mixture `p`; `0/0 = 0` | same | true | none |
| 8.2 graph properties | `K_n`, `n ≥ 2`; `k = 0, 2`; deletion of `< k` vertices | diam 1, fails `EP_{≤1}`; empty set is a 0-clique; request of size `2 + (k−1)` gives a common neighbour outside | diam = 2 needs a nonedge; budget `k + 1` | true | none |
| 9.1 `ae_isomorphic_rado` | `p = ½`, `N` candidates | `(1 − 2^(−m−n))^N → 0` | probability 1 | true; cameron2013 lines 36–53 | none |
| 9.2 graphon bound and example | `W = 1/4 + xy/2` | edge 3/8; two edges at a vertex `∫(1/4+x/4)² = 7/48 ≠ 9/64` | same; `Σ C(n,t) 2^t (1−ε^t)^(n−t)` | true | none |
| 9.3 invariant events, mixture | half-empty/half-complete, "an edge exists" | `½·0 + ½·1` | 1/2 | true | none |
| 9.4 `windowEdgeDensity`, singularity | Rado at `n = 3`; `n = 0, 1`; `p = 0, q = 1` | 2/3; `0/0 = 0`; masses 1, 0 | same | true | none |
| 10 infinitary sentences | `Θ_R` on `Fin 0`, `K₁`; `Θ_even` at `n = 0..3`, on `ℕ` | F, F; 1, 0, 1, 0; F | same | true | none |
| 11.1 Poisson criterion | `λ = 0`, Bernoulli(1/n); `E a^(T_n)` | moments 1, 1/n, 0; TV `1/n`; `a^C(n,3) p^C(n,2) → ∞` | `→ δ₀`; no exponential moment bound | true | none |
| 11.2 sparse triangles | `c = 0, 1`; Erdős–Rényi normalization; `K₄` | `C(n,3)p³ → c³/6`; `(2c′)³/6`, `c′ = c/2`; 4 triangles, 24 ordered | `c³/6`; `1 − e^(−1/6) ≈ 0.1535` | true; Erdős–Rényi text line 1139 (p. 34) | none |
| 11.3 product graphon | `n = 0..3`; `k = 0,1,2`; `n ≥ 2k` | `2(1−2^(−n))`: 0, 1, 3/2, 7/4; limits 1, 2, 4; `∏(1−x_i y) ≤ 1 − y Σx_i/k`, exponent `(n−k)/n ≥ ½` | same; `e^(−2) ≈ 0.1353` | true | none |

- Source locators checked against the text: 9 in cameron2013 (Fact 1 and (∗) p. 1, proof and remark p. 2, Proposition 6 p. 6, Proposition 9 p. 7, Theorem 3 p. 8, Proposition 11 and `σ_{m,n}` p. 9, Theorem 6 with the `N^(m+n)` bound p. 10; its text, lines 26–53, 235, 292, 309–318, 342–354, 395–407) and 1 in Erdős–Rényi (Theorem 3a, p. 34; its text, line 1139). Spencer's section pages (1.3 p. 17, 2.3 p. 31, 9.1.2 p. 122) agree with its public contents page.
- Library declarations opened at the pins: Tau Ceti `Combinatorics/SimpleGraph/ExtensionProperty.lean:51, 56, 64, 93, 102`, `ModelTheory/Scott/RandomGraph.lean:99, 127, 174, 192`, `Connectivity/VertexConnectivity.lean:217`, `DenseGraphLimits/Sampling/Finite.lean:372`, `Sampling/Infinite.lean:287`, `Sampling/AlmostSure/Basic.lean:62`, `ExchangeableGraphLaw/Relational/Ergodic.lean:116`, `Infinite/Mixture.lean:81`; Mathlib `ModelTheory/FinitelyGenerated.lean:241`, `Fraisse.lean:410`, `Order.lean:524`, `Graph.lean:53–98`, `BinomialRandomGraph/Defs.lean:50–71`, `OuterMeasure/BorelCantelli.lean:62`. Neither library has a Fraïssé existence theorem, a quantifier-elimination predicate, a first-order natural rank, or a factorial-moment Poisson limit (`Probability/Distributions/Poisson/FactorialMoments.lean` computes moments of Poisson laws only).
- Cross-roadmap citations resolved on main: CountableStructureSpaces (Layer 0 and Layer 2 names; Worked examples item 4), FreeGroupsAndLimitGroups §3.1, GraphConnectivityAndFlows, StandardDistributions, InfinitaryLogic, DenseGraphLimits, Exchangeability; 0 unresolved.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the folder.
- Elaboration: exit 0, 75 `sorry` warnings, no other message; the description's count and pins (Lean v4.36.0-rc2, Mathlib `1b1ccf4b0`, Tau Ceti `2fd255d99`) agree with the manifest. One-tactic probe of nine statements against the built module (the three sanity checks, `hasExtensionProperty_iff`, `HasExtensionProperty.infinite`, `radoAxioms_isComplete`, the two finite-carrier infinitary probabilities, `E_{0,0}`): none closes.
- Elaborated signatures compared with the README for all 112 declarations: the seven graphon theorems keep `[IsProbabilityMeasure μ]`; no declaration lost a hypothesis; nothing changed.
- Headline theorems (README summary): the zero–one law (`firstOrder_zero_one`), the rank-uniform error bound (`sentenceProbability_error`) and joint stabilization (`ae_eventually_all_bounded_rank`), Fraïssé existence and rooted comparison; all stated, none through a stand-in.
- Pull request text against the head: adds a roadmap (3 files, all in the folder); headline list, suppliers, validation sentences and the last revision line agree with the head; nothing to correct.

Overlap check: read SaturationAndQuantifierElimination, HanfNumbers, InfinitaryModelExistence, CountableModelCounting, QuasirandomGraphs, InfinitaryLogic, CountableStructureSpaces, CountableStructureSpacesPartII (also AxKochenErshov, PoissonApproximation, Forcing). `IsQFEquivalent`, `HasQuantifierElimination` and the finite-variable reduction: shared with SaturationAndQuantifierElimination, owner RandomGraphs as the earlier roadmap; the citation is owed there (C01). The effective formula coding: owner RandomGraphs, cited by SaturationAndQuantifierElimination and AxKochenErshov. Graph events and measurability of the Rado class: owner CountableStructureSpaces, cited here. QuasirandomGraphs excludes first-order zero–one laws; Forcing's coding is internal to a ground model. Nothing else shared.

Source independence: 7 passages compared with 2 sources (cameron2013, Erdős–Rényi 1960), none shared beyond forced phrases of at most 6 words; largest share cameron2013, 8 of 24 page locators in the layers (Spencer 5, Hodges 4); contents compared with cameron2013 (sections 1.1–1.8) and with Spencer's contents page: independent, the layers run Fraïssé → Rado → rank and QE → witness counts → limit laws → graphons → Poisson, forced by the *Needs* lines of Layers 4–7. The texts of Spencer, Hodges, Bollobás and Fagin could not be read.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (Fagin 1976; Cameron 2013, Theorem 6), with Spencer's (2001) dense varying-parameter laws, Fraïssé's theorem as in Hodges (1993) and the Erdős–Rényi (1960) and Bollobás (2001) Poisson limits as boundary cases; rests on the README and on the Cameron and Erdős–Rényi texts.

## Not verifiable

- Spencer 2001 (Theorems 0.1.2, 0.1.5, 2.2.3, 2.3.1–2.3.2, 9.1.3–9.1.4, Definition 2.3): Springer book, paywalled; only its public contents page was read.
- Hodges 1993 (Theorems 7.1.2, 7.1.7, Lemmas 7.1.3–7.1.6) and Bollobás 2001 (Theorems 1.21–1.22, 4.1, Corollary 4.9): Cambridge books, no open copy.
- Fagin 1976 (Theorems 1–2, Corollaries 3, 5): the DOI resolves to a paywalled publisher page; the copy the README links is on a third party's course page and was not read.

Automatic checks set aside as false positives: the lead that seven graphon theorems lost a probability-measure binder (the binder is in each elaborated type), and the lead that four backticked names occur nowhere in the libraries (they are this file's own declarations).

## Source issues

- none

## For the human reviewers

- **Scope (policy).** `TauCetiRoadmap/RandomGraphs/README.md:659–663` requires the quantifier-elimination and decision maps as explicit executable Lean definitions, beyond the existence theorems `Suggested.lean` states; whether a roadmap may require an implementation is yours to decide.
- **Licence.** `TauCetiRoadmap/RandomGraphs/README.md:1669` links Fagin's 1976 JSL paper to a copy on another person's university course page, not the publisher or an author's page.
- **Licence.** `TauCetiRoadmap/RandomGraphs/README.md:1539–1550` lists the author's repositories `cameronfreer/computable-model-theory` and `cameronfreer/vaught-conjecture-counterexample` as provenance; their licences were not read.
- **Not tested.** Spencer (5 of 24 page locators), Hodges (4), Bollobás (3) and Fagin (3) could not be read: their locators and wording were not compared; only Cameron and Erdős–Rényi were.
