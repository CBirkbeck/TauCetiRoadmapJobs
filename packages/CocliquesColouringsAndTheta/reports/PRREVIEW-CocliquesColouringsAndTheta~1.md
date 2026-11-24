# Review of CocliquesColouringsAndTheta (pull request #3068 at d272d0b)

**Verdict:** needs changes

**Summary.** Changes are needed for two reasons. The definition of a biclique partition in 2.2 lets two bicliques overlap on a non-edge, and with it the Graham–Pollak inequality as stated is false: the 6-cycle satisfies the definition with two bicliques and has three positive eigenvalues. The fractional chromatic number with its attainment and linear-programming duality (5.1–5.2) is also defined and proved, for the complement, in the open roadmap AsymptoticSpectra 2.3, and neither text cites the other. There are two small corrections and two format notes, none blocking; the locators into Godsil–Royle, Biggs and Knauer–Knauer could not be checked against the texts, which is left to the human reviewers.

## R01 (P1) — A biclique partition as defined in 2.2 may cover a non-edge twice, and the Graham–Pollak inequality then fails on the 6-cycle

The definition in 2.2 (README lines 208–209; `IsBicliquePartition`, `Suggested.lean` lines 278–280) asks that `u ∼ v` hold exactly when exactly one `k` joins `u` and `v`. A pair joined by two bicliques therefore only has to be nonadjacent, so the bicliques need not be subgraphs of `G`, and `A = Σ_k (a_k b_kᵀ + b_k a_kᵀ)` in the suggested proof is false for such a family. An implementer would be asked to prove `IsBicliquePartition.card_le`, which is false as stated.

The instance: on `cycleGraph 6` take `X 0 = {0, 2}`, `Y 0 = {1, 5}`, `X 1 = {2, 4}`, `Y 1 = {5, 3}`. The two bicliques join `01, 05, 21, 25` and `25, 23, 45, 43`; the pairs joined exactly once are `01, 12, 23, 34, 45, 50`, the edges of `C₆`, and the non-edge `25` is joined twice. So the definition holds with `m = 2` (I confirmed `IsBicliquePartition (cycleGraph 6) X Y` in Lean against the built module, by `decide` after unfolding), while `C₆` has eigenvalues `2, 1, 1, −1, −1, −2`: three positive and three negative, and `3 ≤ 2` is false. Brouwer–Haemers, Proposition 1.5.1 (p. 12), is about an edge decomposition, in which every biclique is a subgraph.

The smallest change: say separately that every pair joined by a biclique is adjacent and that every adjacent pair is joined by exactly one, for instance

    (∀ k, Disjoint (X k) (Y k)) ∧ (∀ k, ∀ u ∈ X k, ∀ v ∈ Y k, G.Adj u v) ∧
      ∀ u v, G.Adj u v → ∃! k, (u ∈ X k ∧ v ∈ Y k) ∨ (v ∈ X k ∧ u ∈ Y k)

with the same change in the prose of 2.2. For `G = ⊤` this is still the decomposition of LinearAlgebraMethodInCombinatorics 4.1. The two overlapping bicliques on `C₆` make a negative-control Check that the present Checks lack: the one on `K₃` only tests an edge covered twice.

## R02 (P2) — The fractional chromatic number and its duality have a second owner in AsymptoticSpectra 2.3

Sections 5.1 and 5.2 define `fractionalChromaticNumber` and prove that the infimum is attained and equals the fractional clique value by linear-programming duality, and "Scope and ownership" lists these as owned here. The open roadmap AsymptoticSpectra (its 2.3, README lines 471–482; `fracCliqueCover` and `fracCliqueCover_spec` in its `Suggested.lean`, lines 292–306) defines the infimum of the total weight of nonnegative weights on finite sets that vanish off the cliques and cover every vertex, notes that this is `χ_f(Gᶜ)`, and proves attainment and the same duality by the same route through ConvexAnalysisAndDuality 5.3. Since a clique of `G` is a coclique of `Gᶜ`, `fracCliqueCover G = fractionalChromaticNumber Gᶜ` on the nose, and `fracCliqueCover_spec` for `Gᶜ` is `exists_isFractionalColouring_sum_eq` without rationality together with `fractionalChromaticNumber_eq_sSup`. Neither README names the other, so the library would get the object and the theorem twice.

The smallest change here: name AsymptoticSpectra 2.3 in "Scope and ownership" and settle the owner. Either cite its 2.3 for attainment and duality (through the complement) and keep as this roadmap's own what it adds (rationality, `n/α ≤ χ_f ≤ χ`, the vertex-transitive value, the Kneser characterisation), or keep 5.1–5.2 here as the general statements and say that AsymptoticSpectra 2.3 is their complement form, to be cited from there. Which of the two is for the authors to agree; the text has to state one.

## C01 — Two Brouwer–Haemers locators do not match the edition the References name

"Theorem 3.5.5a, p. 40" (1.1, and the docstring of `IsWeightedAdjMatrix.indepNum_le_of_posSemidef`) is not in the Springer text: there Theorem 3.5.5 on p. 40 is followed directly by §3.6 (authors' copy of the Springer text, lines 2011–2013). The statement and its one-line proof are in the authors' later online version, on its p. 48 (that version's text, lines 2118–2122). The References say the locators refer to the 2012 edition by printed page, so a reader looks for 3.5.5a there in vain; cite the online version for this one item. Also, Proposition 3.7.5 is stated on p. 44 and proved on p. 45, so "p. 45" in 6.1 would be "pp. 44–45".

## C02 — `contract_adj_iff` holds by unfolding the definition of `contract`

It closes with `simp [contract, SimpleGraph.fromRel_adj, Subtype.ext_iff, G.adj_comm, eq_comm]; tauto` on a copy of the file, so as a target it asks an implementer for nothing. If it is kept as a sanity check that the contraction has the intended neighbourhoods, mark it as one, or leave the statement to the README, where 3.1 already has it.

## N01 — The closing section comment of `Suggested.lean` has no declaration under it

"Library declarations consumed" (line 584) heads 45 `#check` lines and no declaration; the house form keeps section comments for the layers.

## N02 — The cycle formula of 3.2 also holds for `n = 2`

`cycleGraph 2` is `K₂`, with `C = t(t − 1) = (t − 1)² + (t − 1)`, so `2 ≤ n` would do; the negative control at `n = 1` is the right one. A clause saying that `n = 2` is also covered, or the weaker hypothesis, would be welcome.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 weighted inertia bound | Petersen `B = A`; `V` empty; `I` on `K₂` (not admissible) | `α = 4`, 6 nonneg., 4 nonpos.; `0 ≤ 0`; `I` has 0 nonpos. vs `α = 1` | holds; BH Thm 3.5.4 p. 39 read | none |
| 1.1 semidefinite bound | Petersen `B = A/2`, `c = 4`; coclique `C` | eigenvalues `0, 3/2, 0`; form `|C| − |C|²/c ≥ 0` | holds | C01 (locator) |
| 1.1 weighted ratio bound | Petersen; `B = 0`; `−A(K₂)` | `10·2/5 = 4 = α`; `s = b = 0` excluded; `s = b = −1` excluded | holds; `s < b` forces `s < 0`; BH Thm 3.5.5 p. 40 read | none |
| 1.2 clique–coclique | `C₅`; `K₃ □ K₃`; `K_{1,3}`; `V` empty | `4 ≤ 5`; `9 = 9`; `6 > 4` (not transitive); `0 ≤ 0` | holds | none |
| 2.1 equality in Wilf | `K₁`, `K₂`, `C₅`, Petersen, `K₃ ⊔ K₁` | `1 = 1+0`; `2 = 1+1`; `3 = 1+2`; `3 < 4`; `3 = 1+2`, disconnected | holds; BH Prop 3.6.1 p. 40 read | none |
| 2.2 biclique inequality | `C₆` with `{0,2}|{1,5}`, `{2,4}|{5,3}`; `C₅`; `K₄` | definition holds with `m = 2`, `n₊ = n₋ = 3`; `n₊ = 3 ≤ 3`; `n₋ = 3 ≤ 3` | false as stated | R01 |
| 3.1 deletion–contraction | `K₃` edge; `C₄` edge at `t = 2`; `P₃` non-edge | `t(t−1)² − t(t−1) = t(t−1)(t−2)`; `2 − 0 = 2`; fails without adjacency | holds | C02 (`contract_adj_iff`) |
| 3.2 standard graphs | `C₃`, `C₄`, `cycleGraph 1`, `cycleGraph 2`; `V` empty | `t(t−1)(t−2)`; `t⁴−4t³+6t²−3t`; `t` vs `0`; `t(t−1)` both sides; `1` | holds | N02 |
| 3.3 coefficients | `P₃`, `K₃`, `K₂ ⊕g K₁`, `V` empty, Petersen | `−2 = −m`; `−3 = −m`; `t³ − t²`, `c = 2`; `0 < 1`; `[t⁹] = −15` | holds | none |
| 4.1 cores | `C₆` onto `{0,1}`; `∅` in a nonempty graph; `G` empty vs `H` nonempty | retraction exists; no map to the empty type; both sides of the iff false | holds | none |
| 4.2 core of a transitive graph; no-homomorphism | `C₆ → K₂`; `C₅ → K₂`; `K₂ → K_{1,2}`; `V` empty | `2 ∣ 6`; `5/2 > 2`; `2 > 3/2` (target not transitive); `0 ∣ 0`, `0 ≤ …` | holds | none |
| 4.3 endomorphism monoids | trivial monoid, `C₂` | `End K₁` trivial; `End K₂ = {id, swap}`; `H →g H` is a monoid under composition (`RelHom.instMonoid`, `f * g = f.comp g` by `rfl`) | holds | none |
| 5.1–5.2 fractional colourings, attainment, duality | `C₅`; Petersen; `V` empty | `5/2` both programs; `5/2` by five stars; `0 = 0` | holds | R02 (owner) |
| 5.3 bounds, transitive value | `Kₙ`; `C₅`; `K_{1,3}`; `V` empty | `n`; `5/2 = 5/α`; `4/3 < 2`; `0 ≤ 0 ≤ 0` | holds | none |
| 5.4 Kneser characterisation | `C₅ → K(5,2)`; edgeless nonempty `G`; `V` empty; `v < 2r` | `5/2`; `v = r = 1` gives `1`; `v = 0, r = 1` gives `0`; stars still cover, `χ_f ≤ v/r` | holds | none |
| 6.1 edge-transitive regular | `C₅`, Petersen, `K_{1,3}` | `√5`; `4`; `ϑ = 3` vs `1.46` (not regular); `J + xA` minimised at `x = −n/(k−θₙ)` | holds; BH pp. 44–45 read | C01 (page) |
| 6.1 strongly regular | Petersen, `T(5)`, `Kₙ`, `mK_{k+1}`, `K_{3×3}`, Paley 13, `GQ(2,4)` | `4`; `5/2`; `1`; `m`; `3`; `√13`; `9`; identity `(k−r)(k−s) = μn` gives the entry sum | holds for every `IsSRGWith` with `k > 0` | none |
| 6.2 Haemers' rank bound | `GQ(2,4)` with `A − I`; `C₅`; `V` empty | rank `7`, `α = 6`, `ϑ = 9`; `η = 3 > √5`; `0 ≤ 0` | holds; BH p. 43, Thm 3.7.8 p. 45, p. 46 read | none |
| 6.3 strict vector chromatic number | `Kₙ`, `K₂` at `t = 1`, edgeless, `C₅`, `V` empty | `n`; `0 ≤ −1` fails; `1 = ϑ(Kₙ)`; `√5 < 3`; `1` vs `ϑ = 0` (hence `Nonempty`) | holds | none |
| 7.1 least eigenvalue of `K(v,k)` | the twelve pairs of the Check; `K(1,1)`; `K(v,0)` | `−1` (six), `−2`, `−3` (two), `−4` (two), `−6`; `0` vs `−1`; `0` vs `−1` | holds | none |
| 7.2 Kneser graphs are cores | `K(5,2)`; `K(6,3)`; `K(v,1)`, `v ≥ 3` | core; perfect matching, core `K₂`; `K_v` | holds; fibre argument uses `k < v` | none |
| 7.3 `χ_f` and `ϑ` of `K(v,k)` | `K(5,2)`, `K(7,3)`, `K(9,4)`, `K(6,3)`, `K(2,1)`, `K(5,3)` | `5/2`, `4`; `15`; `56`; `2`, `10`; `2`, `1`; `1 ≠ 5/3`, `10 ≠ 6` | holds | none |

- Source locators checked against the text: 10 (Brouwer–Haemers §3.5.1, Theorems 3.5.4, 3.5.5, 3.5.5a, Propositions 1.5.1, 3.6.1, 3.7.5, the remarks on p. 45, Haemers' bound p. 43 and Theorem 3.7.8, the examples p. 46); 8 match, 2 are C01.
- Library declarations opened at the pin: `Finset.erdos_ko_rado` (`Mathlib/Combinatorics/SetFamily/KruskalKatona.lean:346`), `Matrix.toLin_kronecker` (`Mathlib/LinearAlgebra/TensorProduct/Matrix.lean:51`), `Matrix.rank_submatrix_le` (`Mathlib/LinearAlgebra/Matrix/Rank.lean:298`), `Matrix.IsHermitian.eigenvalues₀_add_le` (`TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean:208`), `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251`), `Matrix.posSemidef_iff_eq_conjTranspose_mul_self` (`TauCeti/Analysis/Matrix/GramFactorization.lean:52`); the other 39 names of the supplier contracts elaborate under `#check` in the file.
- Duplication by object in the pinned Mathlib and Tau Ceti: no chromatic polynomial, fractional chromatic number, graph core, vector colouring, theta function or biclique partition; nothing to cite.
- Cross-roadmap citations resolved: 31 section citations into 12 roadmaps (ten at their open heads, two on main), all present with the cited content; the 16 copied supplier definitions and instances agree with the suppliers' `Suggested.lean` files verbatim.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration: the targeted build passes with `sorry` as the only warning; the elaborated types of the 59 declarations were compared with the README; the binders dropped are on definitions that do not need them, and every theorem keeps `Fintype`.
- One-tactic probe: `contract_adj_iff` closes by unfolding (C02); none of the other 33 theorems is a definition restated or a boundary case.
- Overlap check: read LovaszThetaFunction, GraphSymmetryAndCayleyGraphs, SpectralGraphBounds, GraphSpectra, AssociationSchemes, LinearAlgebraMethodInCombinatorics, GraphConnectivityAndFlows, SpanningTreesAndShortestPaths, and AsymptoticSpectra; shared: the fractional chromatic number with attainment and duality, with AsymptoticSpectra 2.3 (owner unsettled, R02); nothing else shared (Haemers' bound, `ϑ` of Kneser graphs and the equality case of Wilf's bound are each declared outside the scope of the roadmap that could have owned them).

Source independence: 9 passages compared with 1 source (Brouwer–Haemers), none shared beyond formulas; largest share Godsil–Royle, 28 of 60 locators; contents compared with Godsil–Royle by the section numbers the README cites only, since its text could not be read: Layers 4, 5 and 7 draw on its §§6.2, 6.13, 7.1–7.5, 7.8–7.9, 7.14 and 9.4 in an order of their own, and Layers 1, 2, 3 and 6 come from other books: independent as far as this shows.

Research link: the theta function and Haemers' bound are the two standard upper bounds on the Shannon capacity (Lovász 1979, Haemers 1979, as Brouwer–Haemers §3.7 give them); cores, fractional colourings and Kneser graphs are Godsil–Royle Chapters 6–7 (2001). Rests on the README's sources and the Brouwer–Haemers text.

## Not verifiable

- Godsil–Royle, *Algebraic Graph Theory* (28 locators: 1.2, Layers 4, 5 and 7): a Springer book with no open copy; not in the worker's sources cache. The statements were checked as mathematics, the theorem numbers and pages were not.
- Biggs, *Algebraic Graph Theory*, 2nd ed. (14 locators, Layer 3): a Cambridge University Press book with no open copy; not in the cache.
- Knauer–Knauer, *Algebraic Graph Theory*, 2nd ed. (2 locators, 4.3): a De Gruyter book with no open copy; not in the cache.
- Brouwer–Haemers was read in the authors' copy of the Springer text, whose running heads carry the printed page numbers, and in the authors' later online version; the printed book itself was not seen.

## Source issues

- **Misprint** in Brouwer–Haemers, *Spectra of Graphs* (authors' copy of the Springer text) at the proof of Theorem 3.5.1, p. 39: the source says interlacing bounds the eigenvalue of index `n − α − 1` above by `0`; it should be the eigenvalue of index `n − α + 1`; affects nothing; corrected in print at the same proof in the authors' online version.

## For the human reviewers

- **Not tested.** Godsil–Royle carries the largest share of the locators (28 of 60) and its text and table of contents could not be read: the wording and arrangement checks were not made against it, nor against Biggs or Knauer–Knauer.
- **Scope.** `Suggested.lean` carries verbatim local copies of 16 definitions and instances of seven suppliers that are still open pull requests (lines 44–209), as the sibling spectral-graph roadmaps do; whether that practice is accepted is yours to decide.
