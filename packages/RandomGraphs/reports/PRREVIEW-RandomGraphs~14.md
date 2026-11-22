# Review of RandomGraphs (pull request #1223 at bcde5d4)

**Verdict:** accepted

**Summary.** Accepted: the full pass found no false, vacuous or unsupported statement, no upward or cyclic supply, and `Suggested.lean` elaborates with `sorry` as its only warning. There are four small corrections (two ownership sentences against CountableStructureSpaces and the open SaturationAndQuantifierElimination, three API-level declarations in the acceptance file, one degenerate case in an example) and four format notes, none blocking. Three questions are left to the human reviewers: the requirement that the two decision maps be executable definitions, the link to a third-party copy of Fagin's paper, and the four sources whose texts could not be read.

## C01 — `IsQFEquivalent`, `HasQuantifierElimination` and the reduction to finite variable types are also stated by the open roadmap SaturationAndQuantifierElimination, and this roadmap does not say that it owns them

A reader of the two roadmaps cannot tell who builds the two definitions. Here the closing paragraphs of the supplier contracts (README line 1636) say they "are built in Tau Ceti now", with "the reduction to finite variable types" (line 1649), and `Suggested.lean:269,275` declares them. SaturationAndQuantifierElimination, at the head of its open pull request, states the same two definitions and `hasQuantifierElimination_iff_finite_isQFEquivalent` as its own Layer 2.1 (its README lines 220–233) and consumes from this roadmap only the coding of §5.2 (its section "From RandomGraphs"). This roadmap is the earlier of the two and cannot cite the later one, so it is the owner, and the citation is owed by the other roadmap.

The smallest change here: add the two definitions and the finite-variable reduction to the list of owned objects in "Scope and ownership" (line 1569), and name SaturationAndQuantifierElimination under "Downstream consumers" (line 1556) as consuming the formula coding of 5.2, which that paragraph does not mention.

## C02 — The measurability of the Rado isomorphism class, asked for in 9.1, is already stated by CountableStructureSpaces

In 9.1 (line 1127) the text says "Prove measurability of this particular isomorphism class by its extension-axiom description." CountableStructureSpaces on main states this in its Worked examples, item 4 (its README lines 931–935): the isomorphism class of any fixed countable graph is Borel, and for the Rado graph it is the model class of the simple-graph and extension axioms, a Gδ set. An implementer would prove it twice. Replace the sentence by a citation, for example: "The isomorphism class of `R` is measurable (CountableStructureSpaces, Worked examples, item 4, through its extension-axiom description)."

## C03 — Three declarations of `Suggested.lean` are API bridges, not headline theorems

`foRank_eq_zero_iff_isQF` (line 126) is the rank-zero boundary case of the rank definition, and `satisfies_triangleSentence` and `satisfies_noIsolatedSentence` (lines 961, 967) say that two sentences mean what their names say; the Checks of Layer 11 (README lines 1428–1439) compute the same equivalences on `K₂`, `K₃`, `K₄`, `Fin 0`, `K₁`. None closes in one tactic (I tried `simp` with the definitions unfolded and `rfl` on a copy), so they are not empty, but as acceptance tests they ask for nothing the headline limits `sparse_triangle_sentence_limit` and `productGraphon_noIsolated_limit` do not already force. If they are kept as sanity checks of the three definitions, say so in their docstrings; otherwise the README already carries the statements.

## C04 — "A finite complete graph has diameter 1" fails on one vertex

In the Examples of Layer 8 (line 1102): "a finite complete graph has diameter `1` and fails `EP_{≤1}`". With Mathlib's `diam`, `K₁` has diameter `0` (and still fails `EP_{≤1}`), so the sentence holds only from two vertices on. Write "a complete graph on at least two vertices".

## N01 — "Scope and ownership" still points downward

Lines 1563–1566 say "Every layer below is required" and "the binomial models specified below"; the layers now stand above that section.

## N02 — Six names in code font in 5.2 are declared nowhere

`radoQE`, `decideRado`, `computable_radoQE`, `radoQE_spec`, `computable_decideRado` and `decideRado_spec` (lines 632–655) are proposed names: `Suggested.lean` declares none of them. Say "a map we call …", or mark the fenced block as proposed signatures.

## N03 — The section comments of `Suggested.lean` are not in README layer order

They run Layers 1–3; 0, 5; 4; 5; 6–7; 8; 8.2; 9; 10; 8, 11 (lines 56, 96, 159, 279, 534, 671, 732, 772, 879, 932).

## N04 — One supplier declaration is listed under the wrong file

The supplier row for the configuration events (line 1595) lists `RelationalConfiguration.toStructure_ofStructure` with `ModelTheory/RelationalConfiguration/ModelsOf.lean`; at the pin it is in `ModelTheory/RelationalConfiguration/Structure.lean` (line 58).

## Previous findings

- R01 (the executable-definition requirement of 5.2 and its six undeclared names) — not repaired: line 657 still reads "This roadmap requires both maps as explicit executable Lean definitions". It makes no stated result false; the names are N02 and the requirement itself is put to the human reviewers below.
- R02 (three boundary and Check-mirroring declarations) — not repaired: `Suggested.lean:126,961,967`. Now C03.
- R03 (no Check on served extension requests; API as paragraphs) — partly repaired: the Examples of Layer 2 (lines 339–344) now give the constant chain `R ⊔ K₁`, which every request is served on vacuously and which the stage-membership condition excludes. The "API:" paragraphs (lines 179, 473, 576, 876) are shape and are not raised.
- R04 (Lean section order) — not repaired: now N03.

## Verified sound

| Statement | Instances tried | Left / computed | Right / claimed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 2.2 `exists_isFraisseLimit_of_isFraisse` | sets of size ≤ 0, ≤ 2 in the empty language | limits `Fin 0`, `Fin 2`; both countable, ultrahomogeneous | finite and empty limits allowed; no `Nonempty`, `Infinite` | true; Mathlib `IsFraisseLimit` needs the two countability instances present | none |
| 2.1 stage membership | constant chain `R ⊔ K₁`, class of finite graphs | no embedding into a finite graph: every request vacuous; limit not ultrahomogeneous | criterion excludes it (stages not finite) | consistent | none |
| 3 rooted embedding | `A = M` finite, `a_M = id`; `(ℚ,<)`, `0↦0, 1↦2` | `e = a_N`; `x ↦ 2x` extends | as stated | true | none |
| 4.1 `hasExtensionProperty_iff`; supplier predicate | `K₁`, 4-cycle, `Fin 0` | supplier asks `z ∉ t` only; adjacency forces `z ∉ s`; C₄: adjacent pair has 0 common neighbours | budget 1 holds, 2 fails on C₄; `Fin 0` fails budget 0 | true | none |
| 4.1 `satisfies_extensionSentence` | `r = s = 0`; `(1,0)`, `(0,1)` on `K₁` | `∃z ⊤`; F; F (witness must differ from the listed vertex) | nonempty; F; F | true | none |
| 4.2 Rado presentation | pairs (0,1), (0,2), (1,3), (1,1); request `{0}`,`{1}` | bits: 1, 0, 1, diagonal; 5 = 101₂ adjacent to 0, not to 1 | edge, nonedge, edge, none; witness 5 | true | none |
| 4.2 / 5.2 Cameron locators | Fact 1 and remark; Thm 3; Prop 11; Thm 6 | cameron2013 lines 31, 51–52, 309–318, 342–354, 395–407: pages 1, 2, 8, 9, 10 | same pages; `N^(m+n)` bound at `p = 1/2` | supports the text | none |
| 5.1 `satisfies_iff_of_extension` | `d = 0`: `K₁`, `K₂`, `Fin 0`; rank 1 and 2 | rank-1 sentences depend only on nonemptiness; `∃x∃y Adj`: F on `K₁`, T on `K₂` | agreement up to rank `d+1 = 1`, sharp | true | none |
| 5.1 `formula_iff_of_extension` | `m = 2, q = 1` | last round extends over `m+q−1 = 2` points | budget `m+q−1` | true | none |
| 5.2 `radoAxioms_models_iff`, completeness, categoricity | `∀x∃y Adj`, `∃x Adj(x,x)` | T, F in `R`; no finite model (`K₁` fails `E_{1,0}`) | same | true | none |
| 5.2 QE definitions | `∃y Adj(x₀,y)` mod `T_R` and mod simple graphs; inconsistent theory | `⊤`; no QF equivalent (`K₁` vs `K₂`: F, T; QF in one variable constant); all `⊥` | same | true | C01 (ownership) |
| 5.2 coding Checks | `⊥` at `n`; `x₀ = x₀` over `Fin 1`, `Fin 2` | Mathlib `listEncode`: tag `n+2`; `[inl ⟨0,t⟩, inl ⟨0,t⟩]`, variable coded by value | codes differ in `n`; equal across contexts | true | none |
| 5.2 `typesWith_…_eq_singleton` | `m = 0`; pairs (0,0), (0,1), (0,2) | one 0-type (complete theory); three diagrams | singleton; three types | true | none |
| 5.3 `radoAxiomsUpTo_models_iff` | `d = 0`, `d = 1`, `∀x∃y Adj` (rank 2) | `K₁ ⊨` budget 0, fails sentence; follows from `E_{1,0}` at budget 1 | allowed by bound `d+1 = 1`; holds at `d = 1` | true | none |
| 6 `extensionError` | `B₀(0,p)`, `B₀(1,p)`, `B₁(3,½)`, `B₁(4,½)`, `B₂(4,½)` | 1, 0, 3/2, 1, 29/2 | 1, 0, 3/2, 1, 29/2 | true; `n − t` truncation harmless (`C(n,t) = 0`) | none |
| 6 `extensionError_le_exp` | `d=1, n=4, p=½`; `n = d`, `p = 1` | 1 ≤ 16e^(−3/2) ≈ 3.57; term `0⁰ = 1 ≤ e⁰` | holds | true | none |
| 6 witness law | `p=½, r=s=1`, two candidates | masses 9/16, 6/16, 1/16, 0 | same | true | none |
| 7.1 `sentenceProbability_error`, `firstOrder_zero_one` | `∃x∃y Adj`: `n = 0,1,2`; `p = 0`, `d = 1` | 0, 0, `p`; `1−(1−p)^C(n,2) → 1`; `B₁(n,0) ≥ n ≥ 1` | limit 1 = Rado truth; bound trivially true at `p = 0` | true | none |
| 7.2 varying parameters | `δ_n = 1/3`; `1/log(n+2)`; `δ^d = C log n / n` | `n^a δ_n → ∞`; fixed-`d` condition holds for `C > d` | all-rank ⇔ `δ_n ≥ n^(−ε)` eventually; weaker than Thm 9.1.3's | true (source text unread) | none |
| 7.3 joint stabilization | no joint law assumed | summable `B_d` and first Borel–Cantelli (`measure_limsup_atTop_eq_zero`, no independence) | a.s. eventual agreement per `d` | true | none |
| 8.1 rooted limits | `ψ = Adj(x₀,x₁)`, `H = K₂`, edgeless; `p = 0` | 1, 0; mixture `p·1 + (1−p)·0 = p`; `0/0 = 0` | same | true | none |
| 8.2 graph properties | `EP_{≤2}`; `K₁`, `K₂` | common neighbour ⇒ diam ≤ 2; `K₂` diam 1, `K₁` diam 0 | "complete graph has diameter 1" | false at `K₁` only | C04 |
| 9.1 `ae_isomorphic_rado` | `p = ½`, request sizes `m, n`, `N` candidates | `(1 − 2^(−m−n))^N → 0` | probability 1 | true; cameron2013 lines 36–53 | C02 (measurability sentence) |
| 9.2 graphon bound and example | `W = 1/4 + xy/2` | edge 3/8; two edges at a vertex `∫(1/4+x/4)² = 7/48 ≠ 9/64` | same; bound `Σ C(n,t) 2^t (1−ε^t)^(n−t)` | true | none |
| 9.3 invariant events | half-empty/half-complete mixture, "an edge exists" | ½·0 + ½·1 = 1/2 | 1/2 | true | none |
| 9.4 `windowEdgeDensity`, singularity | Rado at `n = 3`; `n = 0, 1`; `p=0, q=1` | edges {0,1}, {1,2}: 2/3; 0/0 = 0; masses 1, 0 | same | true | none |
| 10 infinitary sentences | `Θ_R` on `Fin 0`, `K₁`; `Θ_even` at `n = 0..3`, on `ℕ` | F, F; 1, 0, 1, 0; F | same | true | none |
| 11.1 Poisson criterion | `λ = 0`, Bernoulli(1/n) | moments 1, 1/n, 0, …; TV distance 1/n | → δ₀ | true | none |
| 11.2 sparse triangles | `c = 0, 1`; Erdős–Rényi normalization | mean `C(n,3)p³ → c³/6`; `(2c′)³/6` with `c′ = c/2` | `c³/6`; limit `1 − e^(−1/6) ≈ 0.1535` | true; erdosrenyi1960 line 1139 (p. 34) | none |
| 11.3 product graphon | `n = 0..3`; `k = 0,1,2` | `E Z_n = 2(1−2^(−n))`: 0, 1, 3/2, 7/4; moments → 1, 2, 4; `∏(1−x_i y) ≤ 1 − yΣx_i/k` | same; limit `e^(−2)` | true | none |
| Layer 1 strong amalgamation | sets of size ≤ 1; two edges at a root | AP holds, strong AP fails; free amalgam on 3 vertices | same | true | none |

- Source locators checked against the text: 9 in cameron2013 (pages 1, 2, 3, 6, 7, 8, 9, 10) and 1 in erdosrenyi1960 (Theorem 3a, p. 34; its mean formula is OCR-damaged but shows `(2c)^k` over `2k`).
- Library declarations opened at the pins: 34 (Mathlib `ModelTheory/DirectLimit.lean:317`, `Fraisse.lean:118,202`, `FinitelyGenerated.lean:241`, `PartialEquiv.lean:476,499`, `Order.lean:524,532`, `Encoding.lean:163`, `BorelCantelli.lean:62`, `BinomialRandomGraph/Defs.lean:50–91`; Tau Ceti `ExtensionProperty.lean:51,64,95,102`, `Scott/RandomGraph.lean:99,127,174,192`, `Scott/AtomicDiagram.lean:67,84`, `BackAndForth/Game/Finite.lean:77`, `Karp.lean:217,269`, `Infinitary/QuantifierRank.lean:208`, `VertexConnectivity.lean:217`, `Relational/Ergodic.lean:116`, the sampling and mixture lemmas).
- Cross-roadmap citations resolved on main: CountableStructureSpaces (Layers 0 and 2, both declarations present), FreeGroupsAndLimitGroups §3.1, GraphConnectivityAndFlows, StandardDistributions, InfinitaryLogic, DenseGraphLimits, Exchangeability; 0 unresolved.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the folder.
- Elaboration: exit 0, 75 `sorry` warnings, no other message; the description's count (75) and pins (Lean v4.36.0-rc2) agree. One-tactic probe on a copy: none of the probed statements closes.
- Elaborated signatures compared with the README: the seven graphon theorems keep `[IsProbabilityMeasure μ]` as an instance binder; no declaration lost a hypothesis.
- Pull request text against the head: adds a roadmap, 3 files in the folder, headline list, suppliers and validation sentences agree with the head; nothing to correct.
- Headline theorems (README summary): the zero–one law, the rank-uniform error bound and joint stabilization, Fraïssé existence with rooted comparison; all stated in `Suggested.lean`, none through a stand-in.

Overlap check: read SaturationAndQuantifierElimination, HanfNumbers, InfinitaryModelExistence, InfinitaryLogic, CountableStructureSpaces, CountableStructureSpacesPartII (also PoissonApproximation, which excludes the factorial-moment method). `IsQFEquivalent`, `HasQuantifierElimination` and the finite-variable reduction: shared with SaturationAndQuantifierElimination, owner RandomGraphs as the earlier roadmap (C01). Measurability of the Rado isomorphism class and the graph events: owner CountableStructureSpaces (C02; the events are already cited). The effective formula coding: owner RandomGraphs, cited by SaturationAndQuantifierElimination. Nothing else shared.

Source independence: 6 passages compared with 2 sources (cameron2013, erdosrenyi1960), none shared; largest shares of the 49 page locators are Cameron and Spencer, about 15 and 12; contents compared with cameron2013 (sections 1.1–1.8): independent, the layers follow the dependency order Fraïssé → Rado → rank and QE → witness counts → limit laws. Spencer's, Hodges's, Bollobás's and Fagin's texts could not be read.

Research link: the principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin zero–one law (Fagin 1976; Cameron 2013, Theorem 6), with Spencer's (2001) dense varying-parameter laws, Fraïssé's theorem as in Hodges (1993) and the Erdős–Rényi (1960) and Bollobás (2001) Poisson limits as boundary cases; rests on the README and on cameron2013, erdosrenyi1960.

## Not verifiable

- spencer2001 (Theorems 0.1.2, 0.1.5, 2.2.3, 2.3.1–2.3.2, 9.1.3–9.1.4, Definition 2.3): Springer book, paywalled; the DOI resolves to no open copy.
- hodges1993 (Theorems 7.1.2, 7.1.7, Lemmas 7.1.3–7.1.6) and bollobas2001 (Theorems 1.21–1.22, 4.1, Corollary 4.9): Cambridge books, no open copy at the DOI.
- fagin1976 (Theorems 1–2, Corollaries 3, 5): the DOI is paywalled; the copy the README links is on a third party's course page and was not read.

Automatic checks set aside as false positives: the lead that seven graphon theorems lost a probability-measure binder (the binder is in each elaborated type), and the lead that four backticked names occur nowhere in the libraries (they are this file's own declarations).

## Source issues

- none

## For the human reviewers

- **Scope (policy).** `TauCetiRoadmap/RandomGraphs/README.md:657–661` requires the quantifier-elimination and decision maps as explicit executable Lean definitions, beyond the two existence theorems `Suggested.lean` states; whether a roadmap may require an implementation is yours to decide.
- **Licence.** `TauCetiRoadmap/RandomGraphs/README.md:1661` links Fagin's 1976 JSL paper to a copy on another person's university course page, not the publisher or an author's page.
- **Licence.** `TauCetiRoadmap/RandomGraphs/Suggested.lean:65,78,87` carry the names of the author's own repository `cameronfreer/computable-model-theory`, listed as provenance at README lines 1539–1548; its licence was not read in this round.
- **Not tested.** Spencer (about 12 of 49 page locators), Hodges, Bollobás and Fagin could not be read: their locators and wording were not compared; only Cameron and Erdős–Rényi were.
