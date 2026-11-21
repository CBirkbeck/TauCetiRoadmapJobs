# Review of LaplacianEigenvaluesOfGraphs (pull request #2941 at 3b3ffa3)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem was recomputed on all labelled graphs with at most five vertices (with the Lean index conventions and junk values) and no counterexample was found; the negative controls of the Checks fail as the README says they do; the locators into Spielman, Davies–Leydold–Stadler and Trevisan agree with the texts. There is one small correction and one format note, neither blocking. One matter is left for a human: the locators into Brouwer–Haemers, the source cited most, could not be read from a legal copy and are unverified.

## C01 — The supplier contract for the Davis–Kahan bound asks symmetry of `B` only, while the declaration asks it of both operators

A reader who matches the contract in "From Tau Ceti" against the library finds a hypothesis the contract does not list. The entry for `Submodule.projectionGap_le_norm_sub_div` reads "for an `A`-invariant subspace `U` and a `B`-invariant subspace `V`, `B` symmetric" (README line 910–911); the declaration at the pin takes `hA : (A : E →ₗ[𝕜] E).IsSymmetric` and `hB : (B : E →ₗ[𝕜] E).IsSymmetric` (`TauCeti/Analysis/InnerProductSpace/Projection/SinTheta.lean`, lines 186–188). The use in 9.1 is unaffected, since `L(α)` and `L(β)` are both symmetric. The smallest change: "for symmetric `A` and `B`, an `A`-invariant subspace `U` and a `B`-invariant subspace `V` whose quadratic forms …".

## N01 — The Lean section comment of Layer 2 has another title than the README layer

`Suggested.lean` line 52 has "complements and adding edges"; the README has "Layer 2: complements and added edges". One wording would do.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 sorted eigenvalues, `algebraicConnectivity` | P₃, K₁,₄, C₅, K₅, K₂+K₁, n = 0, 1 | P₃: 3, 1, 0; K₁,₄: 5, 1, 1, 1, 0; C₅: 3.618², 1.382², 0; K₂+K₁: 2, 0, 0, a = 0; n ≤ 1: a = 0 | Checks true; index 0 largest | none |
| 1.2 zero count = components | all 1100 labelled graphs, n ≤ 5, incl. n = 0 | counts equal in every case; K₂+K₁: 2 = 2; n = 0: 0 = 0 | holds | none |
| 2.1 complement, `i + j + 2 = n` | all graphs n ≤ 5; K₂ with `i + j + 1 = n` | P₃ᶜ: 2 = 3 − 1, 0 = 3 − 3; wrong index on K₂ gives 0 = 2 | holds; wrong variant excluded | none |
| 2.2 monotone and `r`-edge interlacing | every pair `G ≤ H`, n ≤ 5 | 0 failures; with `r − 1` in place of `r` 16687 pairs fail; ∅→P₃: 1 ≤ 0 false at r = 1 | holds; `r` sharp | none |
| 3.1 superadditivity | every edge-disjoint pair, n ≤ 5; G = H = K₂ | K₄ = C₄ ⊔ 2K₂: 2 + 0 ≤ 4; non-disjoint K₂, K₂: 4 > 2 | holds; hypothesis needed | none |
| 3.2 vertex cut | every graph n ≤ 5, every `D`; D = V; n = 0, 1 | P₃, D = {1}: 1 ≤ 1; Kₙ, D = V: n ≤ n; n = 0: 0 ≤ 0; cut vector: `L(H)u = |D|u` recomputed | holds | none |
| 4.1 Anderson–Morley | every graph with an edge, n ≤ 5 | K₁,₄: 5 ≤ 5; C₅: 3.618 ≤ 4; Gershgorin row of `MᵀM` at edge: 2, radius d(x)+d(y)−2 | holds | none |
| 4.2 `Δ + 1 ≤ ν₁` | every graph with an edge, n ≤ 5; one vertex | K₁,₄: 5 = 5; P₄: 3.414 ≥ 3; K₁: 0 < 1 (excluded by `G ≠ ⊥`) | holds | none |
| 5.1 Grone bound with `h` | every graph n ≤ 5, every `Z`, Lean form of `h` | P₃: Z={1}: 1+2 = 3; Z=V: 0+4 = 4; K₂+K₁, Z={v}: 0 ≤ 2; `tr(PᵀP+QᵀQ)` identity rederived | holds | none |
| 6.1 Fiedler nodal domains | 34244 eigenvectors (rational-echelon bases, coefficients −1, 0, 1, 2), n ≤ 5, every t ≤ 0; ψ = 0 | star: 1 ≤ 1; t > 0 violates in 871 cases; ψ = 0: components ≤ #{ν < θ}; step 2 identity rederived | holds; `t ≤ 0` needed | none |
| 6.2 strong domains | same vectors, all graphs incl. disconnected, θ = 0 | K₁,₄: 4 ≤ 4; K₂+K₁: 2 ≤ 3; 0 failures | holds | none |
| 6.3 weak domains, `IsWeakNodalDomain` | same vectors, connected graphs; maximal sets by brute force; ψ = 0 | K₁,₄: 2 ≤ 2; P₃: 2 ≤ 2; ψ = 0: 1 ≤ 1; disconnected: 12018 violations (2K₂: 4 > 3) | holds; connectedness needed | none |
| 7.1 Kirchhoff sum, grounded-inverse definition | every connected graph n ≤ 5, exact inverses; K₂+K₁; n = 1 | P₃: 8 = 2·3·(1/3+1); Kₙ: 2(n−1) both sides; K₂+K₁: 0 ≠ 3; n = 1: 0 = 0 | holds; connectedness needed | none |
| 7.1 `unitNetwork` | off-diagonal entries by `simp`; diagonal reduces to `#{x \| G.Adj i x} = G.degree i` | Laplacian of unit network equals `G.lapMatrix ℝ` entrywise | agrees | none |
| 8.1 `σ`, `β` | K₃, C₅, K₄, K₂, C₄, K₂+K₁; denominator `Σ|y|` | K₃: 1/2, 1/3; C₅: 0.19098, 1/5; K₄: 2/3, 1/3; bipartite: 0, 0; wrong denominator on K₃: 2/3 | Checks true | none |
| 8.2 dual Cheeger | every graph n ≤ 5, β over all 3ⁿ vectors; edgeless (both 0) | K₃: 0.25 ≤ 0.333 ≤ 1; C₅: 0.0955 ≤ 0.2 ≤ 0.618; K₄: 0.3333 ≤ 0.3333 ≤ 1.1547 | holds | none |
| 9.1 Grone–Merris | every graph n ≤ 5, t = 0 … n+1 | K₁,₃: 4, 5, 6 = 4, 5, 6; P₄: 3.41 ≤ 4, 5.41 ≤ 6, 6 ≤ 6; t = 0: 0 ≤ 0 | holds | none |
| 9.1 route, Lemma 3.11.4 step | `X(0)`; column sums of `X`; fixed-point identity | `X(0) = −Jᵀ/(n−c)` from eigenspace of `n`; column sums −1 give `XJ = −XJX`, so the identity is consistent | consistent | none |
| C01 Davis–Kahan contract | declaration opened | contract: `B` symmetric; declaration: `hA`, `hB` both | contract incomplete | C01 |

- Source locators checked against the text: 12 (Spielman Theorem 24.5.1, Claim 11.8.2, §12.1; Davies–Leydold–Stadler Definition 1, Theorem 2, Lemmas 1 and 2, §4; Trevisan notes §6.1, Lemma 6.1; Trevisan arXiv Lemma 3, inequality (8)); printed pages agree.
- Library declarations opened at the pins: 52 (39 Mathlib, 13 Tau Ceti), all present in the files the contracts name; the statements of the nine Tau Ceti eigenvalue lemmas read against the contracts.
- Cross-roadmap citations resolved: ElectricalNetworksAndRandomWalks 1.1, 2.1 and its scope remark (the six copied definitions are identical to its head), SpectralGraphBounds 1.1, 1.4, KernelsAndSpectralMethods 1.1–1.4, 2.1, 3.2, MarkovChainMixing 2.2, 2.4, 3.2, GeometricTopology 4.4.5, EquitableOperatorReduction, DirectedMatrixTreeAndBEST.
- Dependency check: `depcheck: 60 roadmaps, 579 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (15 theorems); `#check`ed signatures compared with the README, the three dropped binders (`IsWeakNodalDomain`, `unitNetwork`, `bipartitenessRatio`) are instances the types do not need.
- One-tactic probe: none of the 15 theorems closes with `rfl`, `simp` (with the definitions unfolded), `positivity`, `infer_instance` or `aesop`.
- The worker's automatic checks all passed; the pull request's title and description agree with the head (15 theorems, 12 definitions, one structure).

Overlap check: read SpectralGraphBounds, StronglyRegularAndMooreGraphs, EquiangularLinesAndTwoGraphs, PeriodicNonnegativeMatrices, ElectricalNetworksAndRandomWalks, KernelsAndSpectralMethods; `Network` and effective resistance: owner ElectricalNetworksAndRandomWalks; nothing else shared.

Source independence: 9 passages compared with 4 sources (Spielman, DLS, TrevisanNotes, TrevisanMaxCut), none shared; largest share BH, 27 of 52 source mentions; contents of BH not compared (its text could not be read), the BH sections the README names (1.3, 1.7, 2.6, 2.8, 3.2, 3.9, 3.10, 3.11) are spread over Layers 1–5 and 9 out of order.

Research link: Layers 3–5 and 9 state Fiedler's connectivity bounds and the Grone–Merris inequality proved by Bai, as Brouwer–Haemers (2012) present them; Layer 6 is the nodal domain theorem of Davies, Leydold and Stadler (2000); Layer 8 is Trevisan's (2008) Cheeger-type inequality for Max Cut; rests on the README's references and the three texts read.

## Not verifiable

- Brouwer–Haemers, *Spectra of Graphs*: every locator (§1.3.2, §1.4.1, Propositions 1.3.7, 1.7.1, 1.7.2, 3.2.1, 3.9.3, 3.10.1, 3.11.1, Corollary 3.9.2, Theorems 2.6.1, 2.8.1, 2.8.2, 3.11.2, Lemmas 2.10.1, 3.11.3, 3.11.4, and the numbering conventions of §3.9–§3.11). The sources service did not accept the address on the first author's page as an author's page, and the published book is behind a paywall; it is recorded as uncertified. The statements themselves were checked by computation, not against the text.
- The sample targets 1.2, 2.1, 2.2, 3.1, 3.2, 4.1, 4.2 and 5.1 carry only Brouwer–Haemers locators, so their theorem numbers, pages and source hypotheses are unverified for the same reason.

## Source issues

- **Misprint** in TrevisanNotes at §6.1.1, printed p. 31 (TrevisanNotes line 1257): the source says the sum over edges of `(|x_u| + |x_v|)²` is at most the sum of `2x_u² + x_v²`; it should be the sum of `2x_u² + 2x_v²`; affects nothing.
- **Misprint** in DLS at the proof of Theorem 2, after (4), p. 4 (DLS line 118): the source says `g` is orthogonal to `f_j` for `i ≤ j < k′`; it should be `1 ≤ j < k′`; affects nothing.
- **Gap** in Spielman at Theorem 24.5.1, printed p. 202: the source says the theorem holds for every `t ≤ 0` but proves only `t = 0`, noting that more work is needed; it should include the argument for `t < 0`; affects the proof.

## For the human reviewers

- **Not tested.** Brouwer–Haemers has the largest share of the locators (27 of 52 source mentions in the README) and its text and table of contents could not be read legally; the wording and arrangement checks were not made against it.
- **Licence.** The README cites the Brouwer–Haemers PDF at an address on the first author's CWI page (README line 927); the sources service could not classify that host as an author's page.
- **Licence.** Two sources are unpublished texts on their authors' pages: Spielman's incomplete draft of April 2, 2025 (cited for 6.1 and 7.1) and Trevisan's 2017 lecture notes (cited for 8.1 and 8.2).
