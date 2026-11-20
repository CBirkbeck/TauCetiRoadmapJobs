# Review of SpectralGraphBounds (pull request #2722 at a2d53c0)

**Verdict:** accepted

**Summary.** Accepted: every stated bound was recomputed by hand and by an independent exhaustive computation on small graphs, every Check value was recomputed, and no statement, Check or route step was found false; `Suggested.lean` elaborates with `sorry` as its only warning and states every headline. There are no findings, no small corrections and three format notes. Neither cited text (Brouwer–Haemers, Quenell) could be read through a legal channel in this review, so the source locators, the wording comparison and the comparison with the monograph's contents are unverified and are left to the human reviewers.

## N01 — The scope section does not name StronglyRegularAndMooreGraphs or MatchingPolynomial, which both name this roadmap

The route of 5.2 (line 477) proves the vertex count `n ≤ 1 + d(1 + (d − 1) + ⋯ + (d − 1)^(D − 1))` inline; the open roadmap StronglyRegularAndMooreGraphs states the same count as a target in its 3.1 (for degrees at most `k`), and its 1.3 refers to 1.4 here. Neither is a supplier, and the inline proof is right as things stand; a line in "Scope and ownership" saying so, beside the five neighbours already listed, would let a reader see the two counts are the same fact. MatchingPolynomial (its scope section) likewise names the Alon–Boppana bound here.

## N02 — Phrases that date the text

"(on main)", "(an open roadmap, not on main)" and "an open roadmap of another author" in "Scope and ownership" (lines 534–557) and "Section 1.2 (on main)" in the supplier contracts (line 628) describe the state of other pull requests on one day. "RandomMatrices 1.2" and "GraphColouring 1.1" alone say the same and stay true.

## N03 — Four layer comments of `Suggested.lean` carry other titles than the README's layers

The Lean file has "Layer 2: colourings", "Layer 3: independent sets", "Layer 4: edge distribution" and "Layer 5: lower bounds from the diameter"; the README has "the chromatic number", "the independence number", "edge distribution in regular graphs" and "the second eigenvalue and the diameter". One title per layer would do.

## Questions for the author

- The Brouwer–Haemers locators give result numbers and printed pages of the file of 1 February 2011 on the first author's page. Do the result numbers agree with the Springer edition of 2012 (the page numbers presumably do not)? I could not read either version, so I could not compare; if they differ, a note on the numbering in the References would help a reader who holds the book.
- 4.1 cites the expander mixing lemma as Proposition 4.3.2, pp. 68–69, and says the source's hypothesis is on the eigenvalues other than the degree. I could not open the text to confirm the number or the hypothesis; the statement as written here (hypothesis by index) is verified independently below.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 definitions, trace identities, Checks | `K₁`; `K_(1,4)`; `C₅`; Petersen; edgeless | `K₁`: λ₁=λₙ=0. Star: 2,0,0,0,−2. `C₅`: sum 0, squares 4+(3−√5)+(3+√5)=10. Petersen 3,1⁵,(−2)⁴ | true | none |
| 1.2 `2|E| ≤ nλ₁`, equality iff regular, `λ₁ ≤ Δ` | all 1099 labelled graphs on 1–5 vertices; star; triangle+isolated vertex | no failure; star 8/5 ≤ 2 ≤ 4; triangle+vertex: 6 < 4·2, λ₁=Δ=2, not regular | true, iff both directions | none |
| 1.3 `|λᵢ| ≤ λ₁`, monotone in edges | 1099 graphs; `K₄`→`K₄−e`; triangle→`P₃` | no failure; 3→2.5616=(1+√17)/2; λ₂: −1→0 (only λ₁ monotone) | true | none |
| 1.4 multiplicity of `d` = components | all regular graphs on ≤5 vertices incl. `d=0`; `2K₄`; empty type | counts agree; `2K₄`: 3,3,(−1)⁶, 2 components; empty type 0=0 | true | none |
| 2.1 Wilf, `⌊λ₁⌋₊+1` colours | 1099 graphs; `K₁`; odd cycles; star; Petersen | no failure; `K₁`: 1 colour; star 3 ≥ χ=2; Petersen 4 ≥ 3 | true | none |
| 2.2 sum form, every `k` from χ to `n` | 1099 graphs, each `k`; `K₄−e`, `k=3`; `K₂`, `k=3` | no failure; `K₄−e`: 2.5616−1−1.5616=0; `K₂`,`k=3>n`: 1+1−1=1>0, so `k ≤ n` needed | true | none |
| 2.2 `λ₁+(k−1)λₙ ≤ 0`, every colourable `k` | 1099 graphs, `k` up to `n+3`; octahedron; `C₅`; edgeless | no failure; octahedron 4,0³,(−2)²: 4+2(−2)=0; `C₅`: 1+4/(1+√5)=√5; edgeless 0 | true | none |
| 3.1 inertia bounds | 1099 graphs; star; Petersen; `K₁`; empty type | no failure; star α=4, 4 nonneg, 4 nonpos; Petersen 6 and 4, α=4; empty 0 ≤ 0 | true | none |
| 3.2 ratio bound `α(d−λₙ) ≤ n(−λₙ)` | regular graphs ≤5 vertices; Petersen; Kneser(7,3); `K_(3,3)`; `C₅`; `d=0`; star | no failure; 4·5=10·2; Kneser degree 4, λₙ=−3, 35·3/7=15; `C₅` gives √5; star 24>10 | true; regularity needed | none |
| 3.2 equality clause | every independent set of every regular graph ≤5 vertices; `s=0`; `s=n`; Petersen | no failure; from `Ax=λₙx`: count = s(d−λₙ)/n = −λₙ; `s=0` forces λₙ=0, edgeless; Petersen 2 | true | none |
| 4.1 expander mixing lemma | all pairs `S,T` in regular graphs ≤5 vertices; `n=0,1`; Petersen; `Kₙ`; `2K₄` | no failure; `n≤1`: 0 ≤ 0; Petersen 4.8=4.8; `Kₙ` (n−1)/n both sides; `2K₄`: 6 vs 2 (β=1), 6 (β=3) | true by index | none |
| 5.1 Quenell | `Q₄`, `Q₆`; prisms over `C₁₀,C₁₆,C₂₄`; necklaces of `K₄−e` (24–56 vertices), all admissible `i` | `Q₄`: 2>1.732; prism₁₀: 2.618>2 (D=6); prism₂₄ `i=3`: 2.732>1.414; necklace₁₄ `i=5`: 2.783>1.414; 18 instances, no failure | true on instances | none |
| 5.1 route: balls, packing | tree recurrence for `k=3..7`, `ρ=1..11`; packing by hand | 55 cases: λ in (2√(k−1)cos(π/(ρ+2)), 2√(k−1)), σ decreasing, σ(ρ+1)=0; centres 2r apart, balls radius r−1 disjoint, no edge | route sound | none |
| 5.2 Alon–Boppana | disconnected; `K_(d+1)`; Petersen; `d ≤ 2` remark | `d−2√(d−1)=(√(d−1)−1)²≥0`; `K_(d+1)`: λ₂=−1; 1+3·3=10; `Cₙ`: 2cos(2π/n)→2; matching `n≥4`: λ₂=1 | true; `N` depends on `d, ε` | none |
| Lean signatures against README | 19 elaborated types | binders `Nonempty`, `DecidableRel`, `hkn`, `hd`, index `≠ 0`, nat quotient `diam/(2i)` as in README | agree | none |
| Suppliers | RandomMatrices 1.2; GeometricTopology 4.4.5 | both on main: 1.2 has Cauchy interlacing as a target; 4.4.5 owns the weighted matrix-tree identity | resolved | none |

- Source locators checked against the text: 0 of 22 (neither text readable; see below).
- Library declarations opened at the pins: 42 (36 Mathlib, 6 Tau Ceti), each with the file the README names; for example `Matrix.IsHermitian.eigenvalues₀` (`Mathlib/Analysis/Matrix/Spectrum.lean:60`), `SimpleGraph.diam` (`Mathlib/Combinatorics/SimpleGraph/Diam.lean:265`, `0` when not connected), `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251`). Neither library states any of the 16 theorems; no adjacency-eigenvalue bound exists at either pin.
- Cross-roadmap citations resolved: 2 suppliers on main (above); 5 neighbours named in the scope section are open roadmaps and not suppliers.
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/SpectralGraphBounds/Suggested.lean`: 16 `declaration uses sorry` warnings, nothing else. One-tactic probe (`simp` in place of each `sorry`): closes none of the 16.
- Headlines of the README (largest eigenvalue, Perron–Frobenius bounds, multiplicity of the degree, Wilf, Hoffman twice, Cvetković twice, ratio bound and equality clause, mixing lemma, Quenell, Alon–Boppana): all 16 stated; no stand-in, no sorried data, no `set_option`, single `import Mathlib`.
- Pull request text read against the head: no sentence contradicted; nothing outside the folder is changed.
- Automatic checks: all passed.

Overlap check: read StronglyRegularAndMooreGraphs, GraphColouring, MatchingPolynomial (and PerfectAndChordalGraphs, KernelsAndSpectralMethods); no object is owned twice. The Moore vertex count is a target of StronglyRegularAndMooreGraphs 3.1 and only a route step here (N01); the multiplicity of the degree is owned here (1.4) and referred to by StronglyRegularAndMooreGraphs 1.3.

Source independence: 0 passages compared with 0 sources (neither text could be read); largest share Brouwer–Haemers, 17 of 22 locators; contents compared only through the README's own locator numbers (Layer 1 ↔ §§1.3, 3.1, 3.2; Layer 2 ↔ §3.6; Layer 3 ↔ §3.5; Layer 4 ↔ §4.3; Layer 5 ↔ §4.1 and Quenell): not a run of sections in order, but the source's contents page was not read.

Research link: the Alon–Boppana bound (Alon 1986) via Quenell's diameter bound (Quenell 1996), the expander mixing lemma (Alon and Chung 1988) and Hoffman's bounds (Hoffman 1970) are the standard inputs to expander and Ramanujan-graph theory (Friedman's theorem, Ramanujan constructions), which the README's scope section names as the continuation; rests on the README.

## Not verifiable

- Brouwer–Haemers, *Spectra of Graphs* (all 17 locators: Propositions 1.3.1, 1.3.2, 1.3.8, Theorem 2.5.1, Propositions 3.1.1, 3.1.2, 3.2.1, Theorems 3.5.1, 3.5.2, Proposition 3.6.1, Theorem 3.6.2, Proposition 3.6.3, Propositions 4.1.1, 4.3.2): the sources service refused the file on the first author's page (the address names no author) and the published book is behind a paywall.
- Quenell, Pacific J. Math. 176 (1996) (Lemmas 4.1–4.3, Theorems 5.2, 6.1, 6.2): the publisher's host is in no licence class the service knows, and the Project Euclid copy answered with an access block.
- Whether the roadmap's wording is independent of the two texts, and whether its statements extend the sources exactly as the description says (Hoffman for every `k`, Wilf without connectedness, the mixing lemma by index).

## Source issues

- none

## For the human reviewers

- **Not tested.** Brouwer–Haemers carries 17 of the README's 22 locators; its text and contents page were not read, so wording and arrangement were not checked against it (README References, lines 636–641).
- **Licence.** The README cites the monograph file of 1 February 2011 on the first author's page (`win.tue.nl/~aeb/2WF02/spectra.pdf`); the sources service could not classify that host as an author's page.
- **Licence.** Quenell's paper is cited as open on `msp.org`; the service lists that host in no licence class.
