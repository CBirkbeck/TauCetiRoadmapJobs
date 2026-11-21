# Review of TopologicalCombinatorics (pull request #2872 at 575662f)

**Verdict:** accepted

**Summary.** Accepted: no finding. The earlier blocking point is repaired: Tucker's lemma for a flag of hemispheres is now a target in combinatorial form, its parity proof is complete as written, and the hypotheses on the octahedral and lattice flags are proved for all `n` and `m`; both were re-derived by hand and confirmed by machine on small cases, as were all the counterexamples in the Checks. There is one format note and no small correction. Two sources (Su, Matoušek) could not be read, and the human reviewers are told which.

## N01 — The Conventions say "rank" where Mathlib's `finrank` is meant

In the Conventions, under Dimensions (line 92), "Mathlib sets the rank of an infinite-dimensional space to `0`" is true of `Module.finrank` only; `Module.rank` of such a space is an infinite cardinal, and step 3 of the route of 4.1 uses exactly that (`Module.rank_lt_aleph0_iff`). The sentence would read "Mathlib sets `finrank` of an infinite-dimensional space to `0`".

## Verified sound

Earlier findings against this head:

- Earlier R01 (the Tucker lemmas rested on unproved incidence counts): repaired. 2.1 now states `flag_tucker` with the four hypotheses on the flag, and 2.2 and 2.3 each say "The hypotheses on the flag are proved here", for every `n ≥ 1` (and `m ≥ 1`), with the counting arguments written out.
- Earlier C01 (Borsuk–Ulam excluded infinite-dimensional `E`): repaired. 4.1 asks "`finrank F < finrank E` if `E` is finite-dimensional (no condition if it is not)", and `borsuk_ulam` carries `FiniteDimensional ℝ E → …`.
- Earlier N01 (a drafting remark in the References): repaired; the sentence now ends "its properties are proved in 1.1".

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 grid, cells, owners | `(n,N)` = (2,2), (2,3), (3,2), (1,4), (0,3), (0,0), (2,0), (3,3), (2,4) | points 6, 10, 10, 5, 1, 1, 1, 20, 15; cells 4, 9, 8, 4, 1, 1, 0, 27, 16 = `Nⁿ`; owners distinct, vertices close, facets in 1 or 2 cells | holds | none |
| 1.1 Check, cell at `(0,0,2)` | `σ` = swap, Lean `kuhnVertex` unfolded | steps `e₁−e₂`, `e₀−e₁`: `(0,0,2)`, `(0,1,1)`, `(1,0,1)`; owners `2x₀+x₁` mod 3 = 0, 1, 2 | holds | none |
| 1.2 Sperner's lemma | all Sperner labellings at (1,5), (2,2), (2,3), (2,4), (3,2), (4,2); `N = 0`; `n = 0` | 16, 8, 192, 13824, 64, 1024 labellings, 0 with even count; `N = 0` no labelling; `n = 0`, `N ≥ 1` one full cell | holds | none |
| 1.2 Checks | least-index labelling; negative control | 1 full cell at (2,2), (2,3), (2,4), (3,3); control: only `(0,0,2)` violates, 0 full cells | holds | none |
| 1.3 owners form | 3000 random triples of labellings at (2,2); route | 0 triples without close points; `x ↦ L (own x) x` Sperner, owners distinct on a cell | holds | none |
| 2.1 flag Tucker, proof | parity chain redone by hand; `n = 0`; `n = 1` | `a 0 = 1`, `a n = 0`, `a d ≡ a (d−1)`; doors per simplex 1 / 0 or 2; `n = 0` unsatisfiable labels | holds | none |
| 2.1 Lean against README | each binder | `hdown`, `hmono`, `hdisj`, `hinc` (count `= if … then 1 else 2`), `hH₀`, `hlab` on `H n`, `hodd` on `H d`, `d < n` | agree | none |
| 2.1 Checks, hypotheses needed | nine examples (six with `n = 1`, three with `n = 2`) | failing hypothesis exactly: one vertex; incidence; deletion; label 2; label 0; antisymmetry; third; `ιs ∈ H 2`; `s ∈ H 2`; no opposite pair in any | holds | none |
| 2.2 octahedral Tucker | `n = 0, 1, 2`; bound `≤ n`; flags `n ≤ 5` | `n = 0` conclusion false; `n = 1` vacuous; `n = 2`: 16 labellings, 0 bad; labels to `±2`: 80 of 256 bad; flags satisfy 2.1; counts 1, 4, 24, 192, 1920 | holds | none |
| 2.2 Check, first-nonzero labelling | `n = 3, 4` | antipodal, 0 comparable pairs with opposite labels | holds | none |
| 2.3 lattice Tucker | `n = 0`; `m = 0`; (1,3), (2,2); bound `n + 1` | vacuous; vacuous; 64 and 262144 labellings, 0 bad; `n = 1, m = 2`, labels to `±2`: 80 of 256 bad; `1,1,2,−1,−1` has no opposite neighbours | holds | none |
| 2.3 flags | `(n,m)`: (1,1–4), (2,1–3), (3,1–2); `m = 0` | all hypotheses of 2.1 hold; top simplices 2, 4, 6, 8; 4, 16, 36; 8, 64 = `(2m)ⁿ`; members close; `m = 0`: third and fourth fail | holds | none |
| 3.1 Kneser graphs | (5,2), (7,3), (6,3), (4,1), `k = 0` | 10 vertices degree 3; 35 degree 4; 20 degree 1; `K₄`; one vertex degree 0 against `C(n,0) = 1` | holds | none |
| 3.2 Dol'nikov | `𝓕 = ∅`; `{∅}`; `r = 0`; label ranges; family count | `Y = ∅`; fails, nonempty needed; `𝓕` empty; `±[1,m]` and `±[m+1, n−1]`; `Σ_{j≤9} C(15,j) = 27824` | holds | none |
| 3.3 Kneser's conjecture | (5,2), (6,2), (7,2), (7,3), (3,2), (5,3), (6,3); `k = 0`; (2,2) | `χ` = 3, 4, 5, 3, 1, 1, 2 = `n + 2 − 2k`; `k = 0`: 1 against `n + 2`; (2,2): 1 against 0 | holds | none |
| 4.1 Borsuk–Ulam | `r < 0`, `r = 0`, equal dimensions, `F` infinite-dimensional, `E` infinite-dimensional, `dim E = 0` | empty sphere; `x = 0`; `−x ≠ x`; `finrank F = 0` counterexample; hypothesis vacuous, subspace of dimension `finrank F + 1`; hypothesis false | holds | N01 |
| 4.1 route | step 1 gap; step 2 map `h` | `fᵢ(z/m) ≥ ε`, `fᵢ(w/m) ≤ −ε`, gap `2ε` against `< ε`; `h` odd on `∑|xᵢ| = 1`, last coordinate 1 at `x = 0` | sound | none |
| 5.1 ham sandwich | `d = 0`; zero measures; `2δ₀ + δ₁`; Lebesgue on `[0, ∞)`; pole `a = 0` | no `a ≠ 0`; any hyperplane; (0,3), (0,1), (2,1), (2,0), (3,0); finite against infinite; `μᵢ E = 0`; `dim (E × ℝ) = d + 1 > d` | holds | none |

- Source locators checked against the text: 17 (ziegler-kneser 8: lines 23–29, 66–69, 99–101, 155, 185, 216–218, 221–243, 593; prescott-su 6: lines 23–31, 69–89, 269–274, 290–325, 384–394, 415–418; roldan-soberon 3: lines 161–167, 210–212, 213–236). Locators into Su and Matoušek not readable.
- Library declarations opened at the pin: 12 in Mathlib (`SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable` at `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean:345`, `SimpleGraph.chromaticNumber` at :210, `coe_neg_sphere` at `Mathlib/Analysis/Normed/Group/BallSphere.lean:33` with the `InvolutiveNeg` instance at :28, `ContinuousLinearEquiv.ofFinrankEq` at `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:429`, `Module.rank_lt_aleph0_iff` at `Mathlib/LinearAlgebra/Dimension/Free.lean:271`, `exists_linearIndependent_of_le_rank` at `Mathlib/LinearAlgebra/Dimension/Finite.lean:206`, `finrank_span_eq_card` at `Mathlib/LinearAlgebra/Dimension/Constructions.lean:462`, `IsCompact.exists_isMinOn` at `Mathlib/Topology/Order/Compact.lean:255`, `CompactSpace.uniformContinuous_of_continuous` at `Mathlib/Topology/UniformSpace/HeineCantor.lean:41`, `MeasureTheory.tendsto_lintegral_filter_of_dominated_convergence` at `Mathlib/MeasureTheory/Integral/Lebesgue/DominatedConvergence.lean:114`, `PreAbstractSimplicialComplex` at `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:52`) and 2 in Tau Ceti (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean:140`, `TauCeti/Geometry/Convex/Cone/Alternative.lean:159`).
- Duplication by object: no Kneser graph, Borsuk–Ulam, ham sandwich, Sperner's lemma or combinatorial Tucker lemma in the pinned Mathlib or Tau Ceti, on main, or at any open head; this roadmap owns them. Ownership against open pull requests was checked by searching their heads.
- Cross-roadmap citations resolved: 4 (KakutaniFixedPointAndContinuousGames Layer 4 at 4.1 and its scope line naming Sperner's lemma; HamiltonianCycles 1.2; SpectralGraphBounds 3.2; AlgebraicTopology 8.5 on main), all present as cited and all boundaries, none a supplier.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder. The automatic checks all passed.
- Elaboration: `Suggested.lean` elaborates with nine `sorry` warnings and nothing else; one import, no `set_option`, no sorry'd data. The elaborated types of all 16 declarations were compared with the README statements: they agree, and no binder is lost.
- Headlines and padding: all nine headline theorems (1.2, 1.3, 2.1, 2.2, 2.3, 3.2, 3.3, 4.1, 5.1) are stated. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp` with the definitions unfolded, `exact?`) closes none of them.
- Pull request text: the title and description agree with the head (new roadmap, 9 theorems and 7 definitions, the flag form, the Borsuk–Ulam generality, no supplier roadmap).

Overlap check: read GraphColouring, SpectralGraphBounds, RamseyNumbers, PerfectAndChordalGraphs, LovaszLocalLemma; nothing shared (the Petersen graph and the graph on 3-subsets of a 7-set appear there as examples only, and none declares a Kneser graph).

Source independence: 8 passages compared with 3 sources, none shared (longest common run three words); largest share ziegler-kneser, about 9 of 28 locators; contents compared with ziegler-kneser: independent (3.2 corresponds to its §4 and 3.3 to its §3, in the opposite order; Layers 1, 2, 4, 5 have no counterpart). Su's article and Matoušek's preprint could not be read.

Research link: Layer 3 is Lovász's 1978 theorem and Dol'nikov's bound as in Ziegler (2001), who extends them to Kneser hypergraphs; Layer 2 is Tucker's lemma as in Prescott–Su (2005); Layer 5 opens the mass-partition results surveyed by Roldán-Pensado–Soberón (2020). Rests on the README's sources, three of them read.

## Not verifiable

- Su, *Rental harmony* (1.2, 1.3 and the fair-division consumer; §§2–4, pp. 3–8 of the author's copy): the sources manifest has no entry for it and no cached text exists; the statements of 1.2 and 1.3 were checked by computation instead.
- Matoušek, *A combinatorial proof of Kneser's conjecture* (2.2, 2.3, 3.3; abstract, Lemma 2.1, §2, pp. 1–3 of the preprint): recorded as paywalled and cited by locator only; the text was not read.

## Source issues

- **Gap** in prescott-su at the proof of Theorem 1, steps (1) and (3), arXiv p. 4: the source says a simplex carried by a hemisphere is a facet of exactly two simplices of the stated carriers, without argument; it should be derived from the hemispheres being triangulated balls; affects the proof.
- **Gap** in roldan-soberon at the proof of Theorem 1.2.2, p. 5: the source says a zero of the test map is clearly not one of the two poles; it should treat the case where all measures are zero, where the poles are zeros; affects the proof.
- **Gap** in ziegler-kneser at the proof of Theorem 4.2, p. 5: the source says the labels lie in `±1, …, ±(n − 1)`, which needs `m < n`; it should first dispose of `m ≥ n`, where the defect is at most `n`; affects the proof.
- **Error** in ziegler-kneser at Lemma 4.1, p. 5: the source says the lemma holds with no condition on `n`; it should assume `n ≥ 1`, since for `n = 0` there is no nonzero signed set; affects nothing.

## For the human reviewers

- Licence: the README cites Su and Matoušek by copies on the authors' pages (Harvey Mudd College, Charles University); neither text was read in this review, so their locators (1.2, 1.3, 2.2, 2.3, 3.3) are unchecked.
- Wording: the route of 3.2 is headed "Ziegler's proof" and follows the steps of the proof of Theorem 4.2 (`ziegler-kneser` lines 224–243) in the README's own words, with two added cases; no run over three words is shared.
- AI use: the description states the roadmap was drafted and reviewed by Claude Opus agents, with brute-force checks in Python; the author states they read both files.
