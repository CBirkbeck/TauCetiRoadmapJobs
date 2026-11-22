# Review of ExpanderCodes (pull request #2965 at ac5ef44)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and route was recomputed (degenerate types, non-bijective maps, the sign and size of `δ₀` and `ε`), every source locator was read in Spielman's and Zhao's texts, every cited Mathlib and Tau Ceti declaration was opened at the pins, and both supplier roadmaps were resolved at their open heads. There is one small correction (the hypothesis `n ≥ 2` of 1.3 is stronger than the statement needs, and its Check calls it needed) and one format note, neither blocking. Two points are left for a human: the main source is an unpublished draft, and no refereed primary source is cited by locator.

## C01 — The comparison of 1.3 holds whenever the graph has at least three vertices, so `n ≥ 2` is not "needed"

The Check of 1.3 (README line 180) says "The hypothesis `n ≥ 2` is needed", and `secondSingularValue_eq_adjEigenvalues` carries `2 ≤ Fintype.card U`. A reader concludes the comparison fails with one left vertex; it does not. For the star with one left and two right vertices, `B = (1 1)`, `BᵀB` has eigenvalues `2, 0`, so `σ₂ = 0`, and the adjacency eigenvalues are `√2, 0, −√2`, with `0` at index `1`. In general the route's count of zeros, `n + |V| − 2r`, is positive for `r ≤ 1` as soon as `n + |V| ≥ 3`; only the single edge (the Check's example) and the case of at most one vertex are excluded.

The statement is true as written, so nothing is forced. Either the hypothesis would become `3 ≤ Fintype.card U + Fintype.card V` (the index proof `by rw [Fintype.card_sum]; omega` still goes through), or the Check would say that some hypothesis excluding the single edge is needed and that `n ≥ 2` is the one chosen.

## N01 — The Layer 1 section comment of `Suggested.lean` has another title than the README's layer

`Suggested.lean` line 137 reads "Layer 1: bipartite multigraphs and the bipartite expander mixing lemma"; the README's layer is "bipartite multigraphs and the second singular value". Use one title.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `biadjMatrix`, `secondSingularValue` | `K_(n,n)`; double cover of `K₄`; of `C₄`; `|V| ≤ 1`; `P` empty | `BᵀB = nJ`: `n²,0,…` so `σ₂=0`; `(J−I)² = 2J+I`: `9,1,1,1` so `σ₂=1`; `A²`: `4,4,0,0` so `σ₂=2`; index `1 ≥ finrank` gives `0`; `B=0` | all as README | none |
| 1.2 mixing lemma | `K₄` cover, three pairs; `C₄` cover component; `n=0`; `D=0`; `n=1`; non-bijective `2×1` | `3/4 ≤ 1`, `1 ≤ 2`, `3/4 ≤ √3`; `2 ≤ 4` (fails with `0`); `0 ≤ 0`; `0 ≤ 0`; `D−D=0 ≤ 0`; `1/2 > 0` | true; bijectivity control valid | none |
| 1.2 route | decomposition `𝟙_S = (|S|/n)𝟙 + x` | `e − D|S||T|/n = ⟨Bᵀx, 𝟙_T⟩` by column sums `D`; `‖x‖² = |S| − |S|²/n` | sound; inputs exist at pin | none |
| 1.3 `σ₂` = adjacency eigenvalue at index 1 | `K₄` cover; single edge; `r ≤ 1` with `n ≥ 2`; `|V| = 0`; star `K_(1,2)` | `3,1,1,1,−1,−1,−1,−3` → `1`; `1,−1` → `−1 ≠ 0`; zeros `n+|V|−2r ≥ 1`; all `0`; `√2,0,−√2` → `0 = σ₂` | true; hypothesis stronger than needed | C01 |
| 1.4 `σ₂ = D λ(R)` | `K₄`; directed triangle; `|V| ≤ 1`; `P` empty | `3 · 1/3 = 1`; `σ₂ = 1`, `λ = 1/2` (`Σ x_v x_(v+1) = −‖x‖²/2`); `0 = 0`; `0 = 0·λ` | true; involutivity control valid | none |
| 2.1 `tannerCode` | `K_(3,3)` even-weight; `K₄` cover even-weight; `C₀ = ⊤`, `C₀ = 0` | product code dim `4`, weight `4`; cycle space of the cube graph, `12−8+1 = 5`, girth `4`; `⊤`, `0` | as README; Lean body matches prose | none |
| 2.2 rate | product; `K₄` cover; `k₀ = D`; `D = 0`; `n = 0`; non-bijective `1+2` vertices | `12 ≤ 13`; `16 ≤ 17`; `2Dn = Dn+Dn`; `0 ≤ 0`; `0 ≤ dim`; code `0`, `4 > 3` | true; ℕ statement has no subtraction | none |
| 3.1 distance | product (`ε=0`); `K₄` cover (`ε=1/3`); no right vertex; `δ₀ = −2`; `δ₀ > 1`; `δ₀ = 0` | `4 ≤ 4`; `8/3 ≤ 4`; `2 < 6`; `4 > 1`; `C₀ = 0`, vacuous; `0 ≤ wt` | true; both controls valid | none |
| 3.1 route | algebra redone | `δ₀D(s+t)/2 ≤ |F|(s+t)/(2nδ₀) + εD(s+t)/2`, so `|F| ≥ δ₀(δ₀−ε)Dn`; `ε ≥ 0` from `0 ≤ σ₂ ≤ εD`, `D ≥ 1` | sound | none |
| 3.2 edge-set lemma | algebra; `P` empty; `δ₀ = 0` on `K_(n,n)`; `n = 0` | `|T|(7δ₀/9 − ε) ≤ ε|S|`, `7δ₀/9 − δ₀/3 = 4δ₀/9`, ratio `3/4`; `T = V`; `T = V`; `T = ∅` | true; `[Nonempty P]` and `0 < δ₀` in the Lean signature | none |
| 4.1 zig-zag family | degenerate base (`|W|=|Q|=1`); Reed–Solomon, `D` odd; RVW sizes | `2 ≤ 1+1`, `1/2 ≤ 1`; `δ₀ = (D+1)/(2D)`, rate `1/D`, distance `(D+1)/(4D²)`; `|Q| = q²`, `|W| = q⁸ = |Q|⁴`, `D = q⁴` | true; follows from 1.4, 2.2, 3.1 with `ε = 1/2` and the supplier's theorem | none |
| Conventions: Laplacian form of `ε`-approximation | simple `D`-regular bipartite, `n ≥ 2` | eigenvalues `D − μ`, `μ ∈ {±σᵢ, 0}`; inner ones within `εD` of `D` iff `σ₂ ≤ εD` | true | none |
| Scope: relation to the mixing lemma for regular simple graphs | double cover of a `d`-regular simple graph | `σ₂ = dλ(R) = max(|λ₂|,|λₙ|)`; that lemma has the factor `√((1−s/n)(1−t/n))` | as README | none |

- Source locators checked against the text: 12 in Spielman (Thm 27.3.1 pp. 221–222; §29.1, Def 29.1.1, Prop 29.1.2, Fig 29.1, Thm 29.1.3, Cor 29.1.4 pp. 236–238; §§29.2–29.3 p. 238; Thm 29.4.1 pp. 239–240, with `δ₀(δ₀−ε) ≤ φ` at its text line 9480; Lemma 29.5.1 pp. 240–241; §29.6 pp. 241–242), 6 in Zhao (Remark 3.1.23 p. 100; Thm 3.2.4, Def 3.2.7, Ex 3.2.8 p. 104; Thm 3.2.9, Ex 3.2.10 p. 105). All agree.
- Library declarations opened at the pin: 17 Mathlib (for example `LinearMap.singularValues`, `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:95`, a `ℕ →₀ ℝ` padded with zeros beyond the source's dimension) and 13 Tau Ceti (for example `LinearMap.sq_singularValues_eq_of_adjoint_comp_self_eigenbasis`, `TauCeti/Analysis/InnerProductSpace/SingularValues.lean:347`; `TauCeti.LinearCode.exists_isParityCheckMatrix`, `TauCeti/InformationTheory/Coding/GeneratorParityCheck.lean:114`). All exist in the files the README names and say what it says.
- Cross-roadmap citations resolved at the open heads: SpectralGraphBounds 1.1 and 4.1; ExpanderConstructions 1.1, 1.2, 1.3, 2.1, 3.1, 4.1 and its scope paragraph; `zigZagFamily_spec` has the hypotheses and three conclusions the README states. The 11 copied declarations agree character for character with the suppliers' files.
- Duplication: no Tanner code, biadjacency matrix or bipartite mixing lemma in the pinned libraries, on main or at any open head searched.
- Dependency check: `depcheck: 168 roadmaps, 1958 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning (7); the `#check` types of all 21 declarations were compared with the README (the binders reported dropped are unused instances of copied definitions; nothing changed). One-tactic probe (`rfl`, `simp`, `omega`, `infer_instance`) closes none of the 7 theorems.
- Headline theorems (mixing lemma, two comparisons, rate, distance, edge-set lemma, zig-zag family) are all stated; none is padding.
- The automatic checks all passed on this head.

Overlap check: read ExpanderConstructions, BoundsOnCodes, LaplacianEigenvaluesOfGraphs, QuantumErrorCorrection, AlgebraicCodingTheory, SpectralGraphBounds; nothing shared (rotation maps, `λ` and the zig-zag family: ExpanderConstructions; sorted adjacency eigenvalues and the mixing lemma for regular simple graphs: SpectralGraphBounds; Reed–Solomon codes: BoundsOnCodes, used here only in a Check).

Source independence: 24 passages compared with 2 sources (18 locators and 6 further passages: the summary's definition of the code, the routes of 2.2, 3.1 and 3.2, the double-cover convention, the docstring of `tannerCode`), none shared; largest share Spielman, 15 of 19 locators; contents compared with Spielman Chapter 29: independent (Layer 1 covers §29.1 and two comparisons absent from it, Layer 2 covers §§29.2–29.3, Layer 3 merges §§29.4–29.5, Layer 4 and §29.6 have no counterpart; the order is forced by the Needs lines of 3.1, 3.2 and 4.1).

Research link: The codes are Zémor's (2001) variant of the expander codes of Sipser and Spielman (1996), after Tanner (1981) and Gallager (1963), per Spielman §29.6 (source read); the family is that of Reingold, Vadhan and Wigderson, per ExpanderConstructions 4.1.

## Not verifiable

- The displayed formulas of Zhao's Theorems 3.2.4 and 3.2.9 are garbled in the recognised text (its lines 4228 and 4266); their numbers, pages, hypotheses and surrounding prose were read, the symbols of the displays only in part.

## Source issues

- **Misprint** in Spielman, *Spectral and Algebraic Graph Theory* (draft of April 2, 2025) at proof of Theorem 27.3.1, p. 222: the source says the norm of the orthogonalised indicator vector is `n(α − α²)`; it should be that its squared norm is `n(α − α²)`; affects nothing.
- **Error** in Spielman, *Spectral and Algebraic Graph Theory* (draft of April 2, 2025) at §29.3, p. 239: the source says the codewords form a space of dimension exactly `dn(2r₀ − 1)`; it should be at least that, since the constraints may be dependent (the product code of the even-weight code of length 3 has dimension 4, not 3); affects nothing.
- **Misprint** in Spielman, *Spectral and Algebraic Graph Theory* (draft of April 2, 2025) at proof of Theorem 29.5.3, p. 241: the source says each vertex of `S` meets at least `δd/2` edges in error; it should be `δ₀d/2`; affects nothing.

## For the human reviewers

- Scope: 15 of the README's 19 locators point to one chapter of an incomplete draft (Spielman, April 2, 2025, author's page); Zhao's book (CUP 2023) carries the other 4. The refereed papers (Sipser–Spielman, Zémor) are named, not cited by locator.
- Scope: the bipartite mixing lemma for multigraphs (1.2) and the comparisons 1.3 and 1.4 have no printed proof in the cited sources; the README supplies its own routes, which were recomputed in this review.
