# Review of ElectricalNetworksAndRandomWalks (pull request #2680 at f685f68)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated result was recomputed on degenerate instances (one vertex, two vertices with and without an edge, `a = z`, loops, disconnected networks, empty and overlapping sets) and every source locator was read at its place in Levin–Peres, Lyons–Peres (the edition of 19 August 2026) and Doyle–Snell; all agree with the text. There are one small correction and two format notes, none blocking. Foster's 1948 paper could not be read, and nothing is left for a human to decide beyond the final approval.

## C01 — The irreducibility bullet of 1.1 does not say in which sense the walk is irreducible, and 3.2 and 3.3 need it in the supplier's sense

In 1.1 (line 102) the walk of a connected network is called irreducible, with no definition and no citation. The commute time identity and Foster's theorem then apply MarkovChainsAndRenewal Layer 3, item 2, whose hypothesis is irreducibility as that roadmap defines it in its Layer 2, item 1 (every pair communicates, where `x` reaches `y` when some `p_n(x, y) > 0`). An implementer of 3.2 has to guess that the bullet of 1.1 is meant to deliver exactly that hypothesis.

Saying so closes the gap: in the bullet, "irreducible in the sense of MarkovChainsAndRenewal Layer 2, item 1", and that item added to the *Needs:* line of 1.1 and to the supplier contract beside Layer 3, item 2.

## N01 — "(an open roadmap, not on main)" is a statement about today

The phrase occurs five times in Scope and ownership (lines 524, 533, 538, 549, 552) and becomes false as those roadmaps merge. Naming the roadmap and section is enough; "this roadmap does not depend on that one" already carries the information.

## N02 — One line of `Suggested.lean` is 133 characters long

The signature of `eq_current_of_flowEnergy_eq` (line 179) wants a line break after the first hypothesis.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 weights, walk, reversibility | path 0–1–2; one vertex with loop 2; lazy path; weight-zero vertex | weights 1,2,1, `c_G` 4; loop: `c` 2, `c_G` 2; lazy: 2,4,2 and 8; `π(x)P(x,y) = c(x,y)/c_G` both ways, 0 = 0 at weight zero | holds | none |
| 1.2 maximum principle | one vertex, `B = V`; two isolated vertices `B = {x}`, `f = (0,5)`; `B = ∅` | one vertex: `f x ≤ f x`; isolated: 5 ≤ 0 fails, so connectivity needed; empty `B`: no witness | holds as stated | none |
| 1.2 Dirichlet problem | path with `c = 1, 2`, `φ = 0, 1` on ends | `f(1) = (1·0 + 2·1)/3 = 2/3` | holds | none |
| 1.3 harmonic hitting probabilities | unit path, `A = {2}`, `B = {0}`; `A = ∅`; `B = ∅`; weight-zero `x`; point of `A` | `f(1) = 1/2`; `A = ∅`: `f ≡ 0`; `B = ∅`: `P(hit A)`, first step; weight zero: sum is 0; at `2`: `1·(1/2 − 1) ≠ 0` | holds, fails on `A` as the Check says | none |
| 2.1 voltage, `effResistance` | `a = z`; one vertex; two vertices no edge; path `1, 2`; edge 3; triangle; disconnected | 0 by `simp`; `1 × 1` zero matrix, inverse 0; 3/2; 1/3; 2/3 (wrong variant `1/c(a,z)` gives 1); singular block, `R = 0` | holds | none |
| 2.1 `effResistance_eq_div` | `W = W z + (W a − W z) v / v a`; edge `az` plus isolated `w` | quotient `v a / 1 = v a`; disconnected: left 0, right 1, so connectivity needed | holds | none |
| 2.2 Dirichlet's principle | triangle `f = (1, 1/2, 0)`; `a = z`; edge plus isolated vertex | `1/4 + 1/4 + 1 = 3/2 = 1/R`; empty set; least energy 1 against `1/R = 0` | holds | none |
| 2.3 Thomson, uniqueness | triangle current 2/3, 1/3; path with flow across the non-edge; `a = z`; disconnected | `4/9 + 1/9 + 1/9 = 2/3`; energy 0 < 2 without support; divergences sum to 0 ≠ 1; energy 0 forces `θ = 0`, strength 0 ≠ 1, hypothesis empty | holds, also without connectivity for uniqueness | none |
| 2.4 Rayleigh | path to triangle; two vertices `c = 0`, `c' = 1`; `a = z` | 2 ≥ 2/3; `R = 0 < R' = 1` without connectivity; 0 ≤ 0 | holds | none |
| 2.5 symmetry, positivity, triangle | path; triangle; 4-cycle; `x = z`; `x = y`; disconnected | 2 = 1 + 1; 2/3 < 4/3; 3/4 and 1; `0 ≤ 2R`; equality; all 0 | holds | none |
| 2.6 Nash-Williams | path of `m` edges; 4-cycle; `a = z`; empty family; cut with a loop or non-edge added; `a, z, w` with edge `zw` | `m = m`; `1/2 + 1/2 = 1 = R`; only the empty family, `0 ≤ 0`; `0 ≤ R`; extra pairs only lower the left side; 1 > 0 without connectivity | holds | none |
| 3.1 escape probability | unit path; triangle; edge with loop at `a`; `a = z`; `K₄` | `1/(1·2) = 1/2`; `1/(2·2/3) = 3/4 = 1/2 + 1/4`; `1/(2·1) = 1/2`; left 1, right 0; `1/(3·1/2) = 2/3` | holds | none |
| 3.2 commute time | path `m = 2`; triangle; lazy path; `a = b`; one vertex; two isolated vertices; `K₄`; 4-cycle | `4 + 4 = 4·2`; `2 + 2 = 6·2/3`; `16 = 8·2`; 0 = 0; 0 = 0; `∞ ≠ 0`; `12·1/2 = 6`; `8·1 = 8` | holds | none |
| 3.3 Foster | triangle; tree; one vertex with loop; two isolated vertices; route | `6·2/3 = 4 = 2·2`; `2(n−1)`; 0 = 0; 0 ≠ 2; `2∑(c_G − c(x)) = 2(n−1)c_G` | holds | none |
| Scope: relation to the admissible-measure identity | parallel law | `cR = r/(ℓ+r)`; `∑ ℓ/(ℓ+r) = m − n + 1`, so `∑ cR = n − 1` | consistent | none |
| C01: irreducibility | supplier's Layer 2 item 1, Layer 3 item 2 | hypothesis there: every pair communicates; 1.1 gives positive-probability paths along edges | same notion, not named | C01 |

- Source locators checked against the text: 22 in Levin–Peres (for example `LPW line 6148`, `6289`, `6324`, `6406`, `6475`, `6500`, `6529`, `6671`, `6678`, `6862`, `6884`, `7656`), 14 in Lyons–Peres (`LP line 1668`, `1696`, `2368`, `2399`, `2449`, `3042`, `3927`, `3949`, `3952`, `6921`, `30670`), 4 in Doyle–Snell (`DS line 1410`, `1506`, `1694`); all agree in number, page and hypotheses.
- Library declarations opened at the pins: 24, among them `SimpleGraph.fromRel_adj` (`Mathlib/Combinatorics/SimpleGraph/Basic.lean:139`), `Matrix.nonsing_inv_apply_not_isUnit` and `Matrix.mul_nonsing_inv` (`NonsingularInverse.lean:173`, `209`), `Kernel.IsReversible` (`Probability/Kernel/Invariance.lean:58`), `hittingAfter` (`Probability/Process/HittingTime.lean:66`), `ENat.toENNReal` (`Mathlib/Basic/Real/ENatENNReal.lean:34`), `Finset.sum_mul_sq_le_sq_mul_sq` (`Algebra/Order/BigOperators/Ring/Finset.lean:171`), `Kernel.ofPMF` (`TauCeti/Probability/Kernel/PMF.lean:44`), `markovChainLaw` (`TauCeti/Probability/Process/MarkovChain.lean:161`), the Markov and strong Markov statements (`MarkovProperty.lean:131`, `StrongMarkov.lean:69`), `TauCeti.BoundedFlow.val_eq_arrowSum_sub` (`TauCeti/Combinatorics/Network/Flow.lean:165`).
- No effective resistance, voltage, commute time or harmonic function of a weighted graph exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: MarkovChainsAndRenewal Layer 3, item 2 (on main, README lines 239–242); GeometricTopology 4.4.5 (on main, line 3008); TropicalAndBerkovichArithmetic §6.6, ArakelovGeometryAndAbelianHeightsPartII §10.2, KernelsAndSpectralMethods 1.1, 1.2, 4.1, MarkovChainMixing 2.4, SpectralQuantumWalks (open heads); each says what the README reports.
- Dependency check: `depcheck: 196 roadmaps, 2156 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; the 30 elaborated signatures were compared with the README, and the binders reported as dropped (`[Fintype V]` on `graph`, `edgeCond`; `[DecidableEq V]` on `dirichletEnergy`, `IsUnitFlow`, `flowEnergy`) are not used by those declarations. None of the 15 theorems closes with `rfl`, `simp`, `simp` with the definitions unfolded or `infer_instance`; `effResistance a a = 0` does, and it is not a declared theorem.
- Pull request text: 15 theorems, 13 definitions, 2 structures, 1 instance, two Tau Ceti imports, the supplier and the boundaries all agree with the head.
- Overlap check: read MarkovChainsAndRenewal, MarkovChainMixing, GraphConnectivityAndFlows, KernelsAndSpectralMethods, TropicalAndBerkovichArithmetic §6.6, ArakelovGeometryAndAbelianHeightsPartII §10.2; the matrix `diag(c(x)) − (c(x, y))` is a carrier in both this roadmap and KernelsAndSpectralMethods 1.1, whose quadratic form, kernel and spectrum KernelsAndSpectralMethods owns and this roadmap states no target about; stationary laws and Kac's formula: MarkovChainsAndRenewal; effective resistance of a finite network with its variational principles and walk identities: this roadmap (the metric-graph resistance function is TropicalAndBerkovichArithmetic's); nothing else shared.

Source independence: 12 passages compared with 3 sources, none shared beyond statements of a dozen words; largest share LPW, 22 of 40 locators; contents compared with LPW Chapters 9 and 10: independent (Layer 1 draws on §§9.1–9.2, Layer 2 on parts of §§9.3–9.4 and two exercises with the definition taken from a Laplacian inverse, Layer 3 on the rest of §9.4, §10.3 and an exercise; the order is forced by 2.1 needing 1.2, 2.4 needing 2.2 and Layer 3 needing Layer 2).

Research link: The targets are the finite-network theory of Doyle–Snell (1984), Levin–Peres (2017, Chapters 9–10) and Lyons–Peres (2016, Chapter 2): Nash-Williams's inequality (1959), the commute time identity of Chandra, Raghavan, Ruzzo, Smolensky and Tiwari (1996/97), Foster's theorem (1948); prerequisites of recurrence, cover-time and spanning-tree results there. Rests on the sources read.

## Not verifiable

- R. M. Foster, 1948 (Reissner Anniversary Volume, pp. 333–340): no legal copy found through the sources service; the README says it was not consulted, and the attribution was checked in Lyons–Peres instead (`LP line 30670`).

## Source issues

- **Gap** in LPW at Proposition 9.1, p. 117: the source says the harmonic extension exists and is unique for any subset B of the state space; it should be for nonempty B, since for empty B every constant is harmonic; affects a stated result.
- **Error** in LPW at Proposition 10.7, p. 132: the source says, in the recalled notation, that the total weight equals twice the sum of the edge conductances; it should be so only for networks without loops, as §9.1, p. 116 says; affects nothing.
- **Misprint** in LPW at Exercise 10.20, p. 149: the source says "resistence"; it should be "resistance"; affects nothing.

## For the human reviewers

- none
