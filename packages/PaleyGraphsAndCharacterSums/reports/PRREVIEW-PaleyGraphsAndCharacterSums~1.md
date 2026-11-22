# Review of PaleyGraphsAndCharacterSums (pull request #2962 at 9278994)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed (strong-regularity parameters, the Gauss-sum sign, the sorted spectrum, the Hoffman and mixing-lemma arithmetic, the pattern count and its threshold, the tournament case), every source locator was read at its page, and every supplier section and library name resolves. There are no small corrections and two format notes, neither blocking. Two points are left for the human reviewers (unpublished versions among the sources, and four statements that carry a route but no literature locator).

## N01 — The page range given for Brouwer–Haemers §13.6 is one page early

In the References, "§13.6, pp. 186–187": in the authors' version the section on the `p`-ranks of Paley graphs begins and ends on p. 187 (p. 186 holds the end of §13.4 and §13.5; §13.7 opens p. 188). The pointer serves only the out-of-scope sentence on `p`-ranks. "§13.6, p. 187" would be exact.

## N02 — The scope could name the owner of the general bounded extension property

The scope paragraph leaves "the bounded extension property of general graphs" outside without saying where it lives. The open roadmap RandomGraphs defines it in its 4.1 (a witness outside `U ∪ V` for every request with `|U| + |V| ≤ d`), with the same budget convention as 4.2 and 4.4 here, so the two agree as written. A clause naming RandomGraphs 4.1 as its owner would help a reader; no statement changes, and no dependency is needed since 4.2 defines no predicate.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 definition, `paleyGraph` | `𝔽₅`, `𝔽₉`, `𝔽₁₃`, `𝔽₃`, `𝔽₇`, `𝔽₄` | squares `{1,4}`; `{±1,±i}` gives the rook graph; `{1,3,4,9,10,12}`; `K₃`, `K₇`, `K₄` for `q ≢ 1 (mod 4)` | agrees; wrong variant (unsymmetrised) excluded by the `𝔽₃` Check |
| 1.2 `paleyGraph_isSRGWith` | `q = 5, 9, 13, 17, 25, 29, 37, 41, 49, 53, 61, 81`; `𝔽₃` | degree, λ, μ computed: `(2,0,1)`, `(4,1,2)`, `(6,2,3)`, `(8,3,4)`, `(12,5,6)`, …, `(40,19,20)`; route count `(q−3−2η)/4`; `K₃` degree 2 ≠ 1 | holds; hypothesis needed |
| 1.3 `exists_iso_compl_mul` | `𝔽₅`, `c = 2`; `𝔽₇`, `c = 3` | `{0,1} ↦ {0,2}` non-edge, `{0,2} ↦ {0,4}` edge; `K₇` complement edgeless; edges `5`, `18` | holds; hypothesis needed |
| 1.4 `exists_iso_apply_eq_apply_eq` | `𝔽₉`; `𝔽₇`; characteristic 2 | 36 ordered arcs, 36 maps `x ↦ sx + b`; complete graphs for `q ≢ 1 (mod 4)`, so any permutation works | holds for every finite field |
| 2.1 `adjMatrix_mulVec_stdAddChar`, `paleySign` | `q = 5, 9, 13, …, 61, 25, 49, 81`; `p = 25, f = 1`; `𝔽₃` | Gauss sum computed: `√q` for primes, `3`, `−5`, `7`, `−9`; equals `paleySign p f · √q` each time; eigenvalues `1, −2` (`q = 9`), `−3, 2` (`q = 25`) | holds; primality and `q ≡ 1 (mod 4)` needed |
| 2.2 `adjEigenvalues_paleyGraph` | `q = 5, 9`; `𝔽₃` | `2f√q = (q−1)√q − 0`, so `f = g = (q−1)/2`; sums `0`, squares `10`, `36`; `K₃` has `2 ≠ 1` at index 0 | holds |
| 3.1 square-root bound | `q = 5, …, 61`; `𝔽₇` | Hoffman: `q(√q+1)/(q+√q) = √q`; ω by search `2,3,3,3,5,4,4,5,7,5,5`; `K₇`: `7 > √7` | holds |
| 3.2 square orders | `q = 9, 25, 49`; `𝔽₄` | ω `= 3, 5, 7`; `(q−1)/2 = (m−1)(m+1)/2`, `m` odd; `K₄`: `4 ≠ 2` | holds |
| 3.3 edge distribution | `S = T = F`; `q = 9`, `S = T = 𝔽₃`; `𝔽₇` | `β√(st) + st/(2q) ≤ (√q+2)√(st)/2`; `q/2 ≤ (√q+2)q/2`; `3/2 ≤ 15/2`; `17.5 > 16.26` | holds; hypothesis needed |
| 4.1 `abs_two_pow_mul_card_sub_le` | all `A`, `|A| ≤ 3`, all signs, `q = 5, 7, 9, 11, 13`; `|A| ≤ 2`, `q = 3, 25, 27`; `n = 0, 1`; `ε = 0`; `𝔽₄` | `∑ C(n,t)(t−1) = n2ⁿ⁻¹ − 2ⁿ + 1`; no violation found; `n = 0`: `0 ≤ 0`; `n = 1`: `1 ≤ 1`; `ε = 0`: `q > 1` | holds; bound attained at `n = 1` |
| 4.2 `exists_adj_forall_of_card_le` | `n = 0, 1`; 2-e.c. for `q = 5, 9, 13, 17, 25`; 3-e.c. for `q = 17, …, 113` | `2^m N ≥ √q(√q − M + 1) − M > 0` when `√q > M = m2^(m−1)`; search: `P₅` not 2-e.c., `P₉`–`P₂₅` are; `P₁₇`, `P₂₅` not 3-e.c., `P₂₉`–`P₁₁₃` are | holds; threshold not sharp, as stated |
| 4.3 `nonempty_embedding_paleyGraph` | `q = 5, n = 1`; `q = 17, n = 2`; empty `W` | `5 > 1`, `17 > 16`; step `j ≤ n` uses budget `j`; `ω(P₅) = 2` so `K₃` does not embed | holds |
| 4.4 `paleyTournament` and its extension property | `T₃`, `T₇`, `T₁₁`, `T₁₉`, `T₂₃`, `T₂₇`, `T₃₁`; `q = 17`; characteristic 2 | `T₃`: 1 yes, 2 no; `T₇`: 2 yes, 3 no; `T₁₁`: 2 yes; `T₁₉`–`T₃₁`: 3 yes; `n²4^(n−1) ≥ n` | holds for every finite field |
| N01 | Brouwer–Haemers text | §13.6 heading and its last line both on the page headed 187 | page range off by one |

- Source locators checked against the text: the 22 citations of the layers (Bonato 11, Brouwer–Haemers 4, Zhao 4, Godsil 2, Spielman 1) and the §13.6 pointer; all support the statements as written, with the README's own restrictions ("for prime `q`", "without proof") accurate.
- Library declarations opened at the pin: 41 Mathlib names of the supplier contracts, 27 elaborated with `#check` against the built module and 14 opened by file and line (for instance `FiniteField.isSquare_neg_one_iff`, `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean` line 277; `jacobiSum_nontrivial_inv`, `Mathlib/NumberTheory/JacobiSum/Basic.lean` line 140; `Matrix.IsHermitian.eigenvalues₀_antitone`, `Mathlib/Analysis/Matrix/Spectrum.lean` line 63); `SimpleGraph.HasExtensionProperty`, `TauCeti/Combinatorics/SimpleGraph/ExtensionProperty.lean` line 51. No Paley graph in either library.
- Cross-roadmap citations resolved: CharacterSumsOverFiniteFields 0.1, 3.3, 4.7 on main (`stdAddChar` body identical; `gauss_quadChar_eq` and `weil_mulChar_sum_bound` as quoted); StronglyRegularAndMooreGraphs 1.2, 1.3, 1.4 and SpectralGraphBounds 1.1, 3.1, 3.2, 4.1 at their open heads (`adjEigenvalues` body identical; hypotheses as quoted).
- Dependency check: `depcheck: 168 roadmaps, 1959 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: `sorry` the only warning. Signatures: each elaborated type compared with its README statement; the nine `[DecidableEq F]` binders reported as dropped are deliberate `omit`s on statements that do not use it; nothing changed.
- One-tactic probe on a scratch copy (`simp`, `rfl`, `simp` with the definitions unfolded, `infer_instance`, `exact?`): none of the 12 theorems closes. All headline theorems of the README are stated; no stand-in.
- Pull-request text read against the head: declaration counts (12 theorems, 6 definitions), suppliers and locators agree with the files; no change outside the folder.
- Ownership against open pull requests: searched all open heads and main for Paley graphs, conference graphs, bounded extension and quasirandomness. RamseyNumbers uses the Paley colouring of `ℤ/17` in a Check and excludes Paley graphs as a subject.

Overlap check: read StronglyRegularAndMooreGraphs, SpectralGraphBounds, LovaszThetaFunction, LaplacianEigenvaluesOfGraphs, EquiangularLinesAndTwoGraphs, CharacterSumsOverFiniteFields, QuadraticCharactersAndReduction (scope sections), and RandomGraphs 4.1; nothing shared. The general bounded extension predicate is RandomGraphs's (N02); this roadmap defines none.

Source independence: 9 passages compared with 5 sources, none shared (the longest common run is the standard phrase for a correctly joined vertex, under ten words); largest share Bonato, 11 of 22 locators; contents compared with Bonato (sections 1 to 5: introduction, background, Paley graphs and variants, matrices and designs, finite geometry): independent, the four layers follow the dependency of the targets.

Research link: Paley graphs are the standard explicit quasirandom graphs (Chung–Graham–Wilson 1989) and the first explicit `n`-e.c. graphs (Blass–Exoo–Harary 1981, Bollobás–Thomason 1981; Graham–Spencer 1971 for tournaments), and explicit Ramsey-graph candidates; rests on Bonato §3, Zhao §3.1 and §3.3, Spielman §19.4, and the README's scope (Blokhuis, Hanson–Petridis).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Scope.** Two of the five sources are unpublished in the version cited: Godsil's lecture notes (2010, §10.2) and Spielman's incomplete draft (2 April 2025, §19.4). Each supports one or two locators; Brouwer–Haemers and Zhao state the same facts.
- **Scope.** Statements 3.2 and 4.1, and the constants of 3.3 and 4.4, carry a full route but no literature locator ("Proved here", "the constant is the route's"). I recomputed each route and tested the statements numerically for small `q`.
- **Licence.** All five texts were read from their authors' pages; Brouwer–Haemers is served from a host under A. E. Brouwer's initials, which I vouched for as his page.
