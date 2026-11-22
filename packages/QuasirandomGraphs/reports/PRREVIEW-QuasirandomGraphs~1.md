# Review of QuasirandomGraphs (pull request #2966 at 406f094)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every implication was recomputed with its explicit tolerance (polarization, DISC ⇒ COUNT, C4 ⇒ CODEG, CODEG ⇒ DISC, the trace formula, C4 ⇔ EIG, the graphon form of C4, and the Borel–Cantelli route for `G(n, p)`), every Check was evaluated, all locators into Zhao's book were read at the cited pages, and every cited Mathlib and Tau Ceti declaration was opened at the pins. There are two small corrections and no format notes, none blocking. Two points are left for the human reviewers (a single textbook source; the copied `adjEigenvalues`).

## C01 — The opening overview states DISC ⇒ COUNT without the nonempty vertex type that 2.2 requires

The headline bullet "If `G` satisfies DISC with tolerance `δ`, then for every finite graph `F` … `|t(F, G) − p^e(F)| ≤ e(F) δ`" (README line 17) has no hypothesis on `n`, while 2.2 and the Lean statement assume `[Nonempty V]`, and the first Check of 2.2 shows the statement fails on the empty vertex type: DISC holds there with `δ = 0`, and for the pattern with one vertex and no edges `t(F, G) = 0/0¹ = 0` against `p⁰ = 1`, so `|0 − 1| = 1 > 0`. A reader who takes the overview as the statement gets one the roadmap itself refutes. Adding "on at least one vertex" to that bullet repairs it; the second bullet of "What it asks for" in the pull request description has the same omission.

## C02 — The scope remark that the expander mixing lemma gives DISC with tolerance `β/n` fails on one vertex with `β < 0`

In the SpectralGraphBounds paragraph of the scope section (README line 513), "gives DISC with tolerance `β/n` directly from a bound `β` on the nontrivial eigenvalues" is true for `n ≥ 2`, where the hypothesis of SpectralGraphBounds 4.1 forces `β ≥ 0` and `β√(st(1 − s/n)(1 − t/n)) ≤ βn = (β/n) n²`. On one vertex that hypothesis is empty and `β` may be negative (SpectralGraphBounds 4.1 says so); then `d = 0`, the lemma reads `0 ≤ 0`, but DISC at `p = 0` with tolerance `β/1 < 0` asks for `0 ≤ β`, which is false. Writing "for `n ≥ 2`" (or "for `β ≥ 0`") makes the sentence true. No stated result uses it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `IsDisc`, `IsDiscSelf` | `Kₙ`, `p = 1`; `K₄`, `p = 3/4`; one vertex, `p = 1`; unordered variant | `e(X,Y) − \|X\|\|Y\| = −\|X∩Y\|`, max `n`, tol `1/n`; `K₄`: `ab/4 − c`, extremes `+1` (disjoint pairs), `−1` (`X=Y`, size 2), tol `1/16` both; one vertex `\|0−1\| = 1`; unordered `(n²+n)/2` | all Checks true | none |
| 1.1 diagonal identity, cut discrepancy | algebra; `steppedCount_top`, `cutDiscrepancy_le_iff` opened | `2e(X) − p\|X\|(\|X\|−1) − p\|X\| = e(X,X) − p\|X\|²`; `edgeDensity univ univ = 2\|E\|/n²` | true | none |
| 1.2 `IsCodeg` | `K₄`, `p = 1`, `3/4`; one vertex | `12·2 + 4·1 = 28`, `7/16`; `12·¼ + 4·¾ = 6`, `3/32`; `\|0−1\| = 1`; `∑codeg² = 48 + 36 = 84 = 3⁴ + 3` | true | none |
| 1.3 `IsEig` | `K₄`, `p = 1`; star `K_(1,3)`, `p = 3/8`; one vertex; `K_m` + `m` isolated | `\|3−4\| = \|−1\| = 1`, tol `1/4`; `\|−√3\|/4`; `\|0−1\|`; spectrum `m−1, 0^m, (−1)^(m−1)`, tol `1/(2m)`, density `(m−1)/(4m) = p/2` | true | none |
| 2.1 DISC′(ε) ⇒ DISC(2ε) | bilinear expansion on `A, B, C`; `K₄`, `X = {1,2,3}`, `Y = {2,3,4}`; `ε < 0`; `n = 0` | RHS `= 2BB + 2AB + 2AC + 2BC = 2e(X,Y)`; `2·7 = 12 + 2 − 0 − 0`; `ε < 0`, `n ≥ 1` hypothesis false at `X = ∅` | true | none |
| 2.2 DISC ⇒ COUNT | empty `V`; `K₄`, `p = 1`, `δ = 1/4`, `F = K₃, C₄`; one vertex, `p = 1/2`, `F = K₂`; `F` on empty type | empty `V`: `1 > 0` (excluded); `5/8 ≤ 3/4`; `43/64 ≤ 1`; `1/2 = 1·1/2` (attained); `\|1 − 1\| ≤ 0`; `counting_lemma` constant `e(F)` at the pin | true with `[Nonempty V]` | C01 (overview only) |
| 3.1 C4 ⇒ CODEG(√(5δ)) | `p ≤ δ`; `p > δ`; `δ < 0`; `n = 0`; `K₄`, `p = 3/4`; one vertex, `p = 1`, `δ = 0` | `∑(c−p²n)² ≤ n⁴(2p⁴+δ−2p²t²) ≤ (1+4p³)δn⁴`; `δ<0`: `δ(1+2p²(2p−δ)) < 0`, vacuous; `δ = 3/256`, `3/32 ≤ √15/16 ≈ 0.242`; edge hypothesis fails `0 ≥ 1` | true | none |
| 3.2 CODEG ⇒ DISC | steps 1–3; `K₄`, `p = 3/4`, `δ = 3/32`; empty graph, `p = 0`; `n = 0` | `∑(deg−pn)² ≤ δ(1+2p)n³ ≤ 3δn³`; `∑(d_Y−p\|Y\|)² ≤ δn³ + 2p\|Y\|√(3δ)n²`; bound `√1.154 > 1 ≥ 1/16`; `0 = 0` | true | none |
| 4.1 trace formula, `k ≥ 2` | `K₄`, `k = 4`; `K_(1,3)`, `k = 3, 4`; `k = 2`; `k = 1`; `n = 0` | `84 = 81 + 3`; `0 = 3√3 − 3√3`; `18 = 9 + 9` (also `∑codeg² = 9 + 9`); `2\|E\|`; `k = 1`: `n ≠ 0 = tr A`; `0 = 0` | true; bound `k ≥ 2` needed | none |
| 4.2 C4 ⇒ EIG((5δ)^(1/4)) | `δ < 0`; `δ ≤ p`; `δ > p`; `K_(1,3)`, `p = 3/8` | `δ<0`: `λ₁⁴ > p⁴n⁴ > (p⁴+δ)n⁴`, vacuous; `p⁴ − (p−δ)⁴ ≤ 4p³δ`; `p⁴ ≤ δ`; `min(δ,1) ≤ (5δ)^(1/4)`; `δ = 207/4096`, `1035/4096 ≥ 144/4096` | true | none |
| 4.3 EIG ⇒ C4 | `K₄`, `p = 1`, `δ = 1/4`; one vertex, `p = δ = 0`; `n = 0` | `∑_{i≠0} λᵢ⁴ ≤ δ²n²·2\|E\| ≤ δ²n⁴`; `21/64 ≤ 641/256`; `0 ≤ 0`; `0 ≤ (p+δ)⁴ + δ²` | true | none |
| 5.1 `t(C₄,W) = t(K₂,W)⁴` iff `W` a.e. constant | constant graphon; two-clique graphon; one-point space; `K₂` on two uniform points | `c⁴ ≤ (∫d²)² ≤ ∬s²`, equality gives `∫U(x,z)U(z,y)dz = c²−c²−c²+c² = 0`; `1/8 ≠ 1/16`; `w⁴ = w⁴`; `2/16 ≠ 1/16` | true on any probability space | none |
| 5.2 `G(n, p)` a.s. DISC | `p = 0`, `p = 1`; side conditions of the concentration bound; discreteness of `SimpleGraph (Fin n)` | `q = 2`: `8 ≤ δn`, `2exp(−δ²n/8)`; `q = 4`: `32 ≤ δn`, `2exp(−δ²n/32)`; `δ ≤ √(5δ)` for `δ ≤ 5`; `Kₙ` tol `1/n`; instance found by elaboration | true | none |
| Scope: two-sided C4 | `δ ≤ p`, `δ > p` | `t(C₄) ≥ t(K₂)⁴ ≥ max(p−δ,0)⁴ ≥ p⁴ − 4δ`; upper `≤ p⁴ + δ` | true | none |
| Scope: expander mixing gives DISC(`β/n`) | `n ≥ 2`; `n = 1`, `β < 0` | `β√(st) ≤ βn = (β/n)n²`; `n = 1`: `0 ≤ β` false | false only at `n = 1`, `β < 0` | C02 |

- Source locators checked against the text: 14 (Theorem 3.1.1 p. 92; Remarks 3.1.4, 3.1.6 and Proposition 3.1.8 p. 93; Corollary 3.1.9 p. 94; Proposition 3.1.14 p. 95; proofs of DISC′ ⇒ DISC, DISC ⇒ COUNT and C4 ⇒ CODEG p. 96; CODEG ⇒ DISC p. 97; Remark 3.1.18 p. 98; EIG ⇒ C4 pp. 98–99; Lemma 3.1.20, Remark 3.1.19 and C4 ⇒ EIG p. 99; Theorem 4.5.1 p. 144; Definition 5.0.6 p. 165), all correct; no locator is flagged unverified in the README.
- Library declarations opened at the pin: 33 Tau Ceti declarations located by name, with the statements of `homDensityFin` (`HomDensity/Finite.lean:99`), `homDensityFin_top_fin_two` (`:236`), `homDensityFin_sub_injHomDensity_le` (`HomDensity/Closeness.lean:56`), `cutNorm_le_iff` (`Kernel/CutNorm.lean:193`), `counting_lemma` (`Counting.lean:271`), `sampleGraph_homDensityFin_concentration` (`Sampling/Concentration.lean:71`), `tsum_sampleGraph_homDensityFin_tail_ne_top` (`Sampling/Summability.lean:55`), `sampleGraph_const` (`Sampling/Finite.lean:372`), `rectIntegral_uniformOn_univ` (`Kernel/Integral.lean:169`), `homDensity_finiteGraphGraphon` (`StepGraphon/FiniteGraph/Basic.lean:269`), `sidorenko_cycleGraph_four` (`Applications.lean:433`, with private helpers as the README says), `trace_pow_eq_sum_eigenvalues_pow` (`Analysis/Matrix/Spectrum.lean:140`), `steppedCount_top`, `cutDiscrepancy`, `cutDiscrepancy_le_iff` (`Regularity/Graph/CutDiscrepancy.lean:141, 200, 212`) read; 31 Mathlib declarations resolved by `#check`, 20 file paths confirmed.
- Cross-roadmap citations resolved: 4, all at the head of the open SpectralGraphBounds pull request (1.1 `adjEigenvalues` and `largestEigenvalue`, identical body; 1.2 `two_mul_card_edgeFinset_le` with `[Nonempty V]`; 4.1 `abs_card_interedges_sub_le`; the `k = 2` trace sums in the 1.1 API).
- Duplication by object: no trace-of-powers/closed-walk count for `adjMatrix` in Mathlib (only `trace_adjMatrix`) or Tau Ceti; no quasirandom, codegree or DISC predicate in either library; no other roadmap, on main or open, states any of the nine theorems (PaleyGraphsAndCharacterSums places quasirandomness outside its scope).
- Elaboration: the targeted build of the `Suggested` module succeeds, `sorry` the only warnings (9); `#check @name` on all 14 declarations, no lost binder, each type equal to its README statement.
- One-tactic probe (`simp`, `rfl`, `simp_all` with the four definitions unfolded, `exact?`) on the 9 theorems: none closes. No padding.
- Dependency check: `depcheck: 168 roadmaps, 1958 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier is SpectralGraphBounds, an open pull request that adds a new roadmap, named in the description's dependency block.
- The worker's automatic checks all passed; nothing outside the roadmap folder is changed.

Overlap check: read DenseGraphLimits (main, and its open revision), Regularity, RandomGraphs, PaleyGraphsAndCharacterSums, SpectralGraphBounds; shared objects: homomorphism densities, cut norm, counting lemma, sampling concentration — owner DenseGraphLimits (cited, not restated); sorted adjacency eigenvalues and `2|E| ≤ nλ₁` — owner SpectralGraphBounds (cited; the definition is copied under this roadmap's namespace only to state 4.1–4.3); `binomialRandom` — Mathlib. Nothing has two owners.

Source independence: 12 passages compared with 1 source, none shared; largest share Zhao (author's version of 18 June 2024), 20 of 20 locators; contents compared with Zhao §3.1, §4.5 and Chapter 5: independent (Layers 1–4 all lie inside the single section 3.1 and are grouped by property, not by the source's sequence; 5.2 precedes the proofs in the source and 5.1 comes from Chapter 5; the order 3.1, 3.2 → 5.2 and 4.1 → 4.2, 4.3 is forced by the *Needs* lines).

Research link: The headline targets are the quantitative form of the equivalence theorem of Chung, Graham and Wilson (1989), with Thomason (1987), and the `C₄` case of the forcing conjecture of Skokan–Thoma (2004) and Conlon–Fox–Sudakov (2010); rests on the README's References and Zhao's text, lines 3770–3772 and 4051–4057.

## Not verifiable

- The original papers of Chung–Graham–Wilson (1989) and Thomason (1987): the README attributes them through Zhao and cites no locator in them; not opened.

## Source issues

- none

## For the human reviewers

- **Scope.** Every locator (20 of 20) is to one textbook, Zhao's *Graph Theory and Additive Combinatorics* (CUP 2023), read in the author's version on the author's page; the 1989 and 1987 research papers are attributed through it and were not opened.
- **Licence.** `adjEigenvalues` in `TauCetiRoadmap/QuasirandomGraphs/Suggested.lean` (line 38) has the same name, binders and body as the definition in the open SpectralGraphBounds roadmap by the same author; the README says it is copied from there.
