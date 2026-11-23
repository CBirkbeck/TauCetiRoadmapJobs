# Review of GraphSpectra (pull request #3014 at 7c5d696)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: two proof routes of Layer 3 rest on theorems that nothing owns, namely that the path has the least index among trees (3.4, where the cited source is said not to give the equality case either) and the Motzkin–Straus inequality (3.5). Every statement was recomputed on small and degenerate instances and none was found false; `Suggested.lean` elaborates with `sorry` as its only warning. There are four small corrections and three format notes, none blocking. None of the five cited books could be read legally, so no locator was checked against its text; that, and the reliance on two draft supplier roadmaps, is left to the human reviewers.

## R01 (P2) — The routes of 3.4 and 3.5 use two theorems that are neither targets, nor supplied, nor in the pinned libraries

An implementer of the extremes of the index is stuck at the main step. In the suggested proof of 3.4 (README line 681) the lower bound `2cos(π/(n+1)) ≤ θ₁` and its equality case are reduced to "among trees the path has the least index". That is a theorem of its own: the path on `n` vertices is not a subgraph of an arbitrary tree on `n` vertices, so the monotonicity of 3.4 does not give it, and no layer, supplier section or pinned declaration states it. The same paragraph says that the cited source "states only that the bounds are attained", so the clause "with equality on the left only for `Pₙ`", which `Connected.largestEigenvalue_bounds` states as an equivalence, has neither a locator nor a route. The right-hand equality case is fine: it does follow from the strictness in 3.4.

The second instance is in 3.5 (README line 716): the bounds of Wilf and Nikiforov are obtained by applying the Motzkin–Straus inequality `∑_{xy∈E} 2v_xv_y ≤ (1 - 1/ω)(∑v_x)²`. I searched the roadmaps on main, the open roadmap pull requests, the pinned Mathlib and the pinned Tau Ceti for it and found only this line. The inequality is true (on `K₃` with `v = 𝟙/√3` both sides are `2`), but nobody is asked to prove it.

The smallest change: state each as a target where it is used, with its hypotheses, a locator and a route. For 3.4: "a tree on `n` vertices has `θ₁ ≥ 2cos(π/(n+1))`, with equality only for `Pₙ`". For 3.5: the Motzkin–Straus inequality for a nonnegative vector, with `ω = G.cliqueNum` on a nonempty vertex type. Then list them in the `*Needs:*` lines of 3.4 and 3.5.

## C01 — Nine declarations of `Suggested.lean` close in one tactic, and three more are special cases of other declarations

As targets these ask an implementer for nothing. On a copy of the file, `signlessLapMatrix_apply_self`, `signlessLapMatrix_apply_of_ne`, `isSymm_signlessLapMatrix`, `signlessLapMatrix_mulVec_one`, `IsRegularOfDegree.lapMatrix_eq`, `trace_adjMatrix_pow`, `adjMatrix_pow_apply_pos_iff` and `isRegularOfDegree_iff_adjMatrix_mulVec_one` each close with a single `simp` that unfolds `signlessLapMatrix`, `degMatrix` or uses Mathlib's `SimpleGraph.adjMatrix_pow_apply_eq_card_walk`; `adjSpectrum_eq_roots_charpoly` closes with `exact` and three uses of `Matrix.IsHermitian.roots_charpoly_eq_eigenvalues₀`. Further, `adjSpectrum_hypercube` is `adjSpectrum_hammingGraph` at `Q = Bool`, `adjSpectrum_petersenGraph` is `adjSpectrum_kneserGraph` at `(5, 2)`, and `petersenGraph_card` computes three small numbers.

The file states 93 sorried theorems, which makes it a catalogue of the API; the README already carries each of these as a prose bullet. Would you either mark these twelve as sanity checks in their docstrings, or keep them as README bullets only (without the backticked names)?

## C02 — The Check of 1.8 on oblique idempotents conjugates by an arbitrary invertible matrix, which destroys the symmetry the theorem assumes

In the Checks of 1.8 (README line 370) the sentence "conjugating the `Eᵢ` by an invertible matrix (oblique idempotents) leaves it unchanged" is meant to show that the `Eᵢ` need not be symmetric. But `∑ θᵢ S Eᵢ S⁻¹ = S M S⁻¹` is not Hermitian for a general `S` (for `M = diag(1, -1)` and `S = [[1, 1], [0, 1]]` it is `[[1, -2], [0, -1]]`), so the theorem, which reads the spectrum from `eigenvalues₀` of a Hermitian `M`, does not apply to it. What does test the claim: keep `M` and replace `E₁, E₃` by two oblique idempotents with `E₁ + E₃` the orthogonal projection onto the `1.5`-eigenspace (equivalently, conjugate by an `S` that commutes with `M`).

## C03 — 4.1 says the supplier states spectral inclusion "for Hermitian `A`", which is not what the supplier says

In 4.1 (README line 860): "EquitableOperatorReduction, Layer 2, states the inclusion of spectra and the lifting of eigenvectors for Hermitian `A`; this statement needs no symmetry." Layer 2 of EquitableOperatorReduction at its open head begins "Specialize to square real or complex matrices" and lists "eigenvectors lift, geometric multiplicities do not decrease, and quotient spectrum is contained in host spectrum" without a Hermitian hypothesis; only two of its bullets assume Hermitian `A`. What 4.1 adds is therefore the algebraic multiplicity (divisibility of characteristic polynomials), not the removal of symmetry. Would you say that instead?

## C04 — Two sentences of the pull request description do not describe the head

"… and AssociationSchemes and DelsarteTheoryOfCodesAndDesigns the Johnson and Hamming schemes; this roadmap consumes them" contradicts the README, whose scope section lists the Hamming scheme of DelsarteTheoryOfCodesAndDesigns under "Owned by other open roadmaps and not used here", and the description's own dependency list, which omits it. Right would be: "… AssociationSchemes the Johnson scheme, which this roadmap consumes; the Hamming scheme of DelsarteTheoryOfCodesAndDesigns is not used."

The paragraph "For later consumers (renames in this roadmap)" lists former names (`G.adjEigenvalue i`, `signlessLapEigenvalue`, …). The pull request adds the roadmap, so no reader has seen those names; the paragraph describes an earlier head and can go.

## N01 — Header and layout of `Suggested.lean`

The file opens with `module` and 21 `public import Mathlib.<submodule>` lines where the house form is the single line `import Mathlib` followed by the four `TauCeti.*` modules. The closing header "Supplier declarations named in the README" has only `#check` lines under it, and the header "Layer 4: equitable quotients" differs from the README's "equitable compressions".

## N02 — The tree bound of 3.4 needs Hong's bound of 3.5, a later section

There is no cycle (3.5 needs only 1.2, 3.2 and SpectralGraphBounds 1.1), but a reader building in order meets the dependency backwards. Moving the tree bound after Hong's bound, or a clause in 3.4 saying so, would do.

## N03 — Wording that dates the text, and Checks a reader cannot recompute

"formalized in later Tau Ceti; it is not at the pin" (4.1, line 868, and the scope section, line 930) and the heading "Beyond this roadmap (a roadmap for a roadmap; do not implement)" describe a moment rather than the mathematics. The Checks "All formulas agree with a numerical diagonalization" (2.6), "Exhaustive over connected graphs with at most 7 vertices" (3.4, 3.9) and "Random integer matrices …" (4.1) report runs, not a value a reader can recompute; the small instances beside them already do the work.

## Questions for the author

- Layer 7 of SpectralQuantumWalks asks, for each family, for "its adjacency formula, spectrum/projectors or character diagonalization", as alternatives. The route of 2.6 needs, for the path, the rank-one projectors onto `x ↦ sin(πj(x + 1)/(n + 1))`, and for `K_{a,b}` and `K_{r×t}` explicit projectors. If that roadmap delivers only the eigenvalue set of a family, where do the projectors come from? I could not decide this: the supplier has no statement-level text or Lean for Layer 7. A direct route (the eigenvectors, as 2.2 does for the Laplacian of the path) would remove the question.
- Which printing do the Brouwer–Haemers page numbers refer to? The suppliers cite the same items with other pages (§12.4.2 at p. 175 in AssociationSchemes 5.1 against p. 179 here; Proposition 3.4.1 at p. 46 in PeriodicNonnegativeMatrices 3.2 against p. 38 here; §1.3.2 at p. 14 in LaplacianEigenvaluesOfGraphs 2.1 against p. 4 here). I could not read the book, so I cannot say which is right.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 forms, `UUᵀ = Q`, nullity of `Q`, sign conjugation | `P₃`, `K₃`, `K₂`, `K₂ ⊕ K₃`, edgeless, empty type | `P₃`: `Q = [[1,1,0],[1,2,1],[0,1,1]]`, `u=(1,-1,1)` gives `0`; nullities `1, 0, 1, n, 0`; `K₂`: `SLS = [[1,1],[1,1]]` | holds | none |
| 1.2 regular graphs, reversed index | `K₄` | `ν = 4,4,4,0 = 3 - θ` at reversed index; `q = 6,2,2,2`; same index would give `0 ≠ 4` | holds | none |
| 1.3 trace identities | `K₃`, `K₄`, `C₄`, `K₂`, empty type | `8-1-1 = 6·1`; `27-3 = 6·4`; `0`; `∑ν = 2 = 2m`; `0 = 0` | holds | C01 (trace lemma is one `simp`) |
| 1.4 row sums, `ν, q ≤ 2k_max` | `K_{1,3}`, `K₂` | `A𝟙 = (3,1,1,1)`; `q₁ = 4 ≤ 6`; `ν₁ = 2 = 2k_max` | holds | C01 |
| 1.5 variational formula | `P₃`, `K₂`, `2K₁`, `K₁` | `u=(1,0,-1)`: `2/2 = 1 = ν₂`; `K₂`: `4/2 = 2`; `2K₁`: `0`; `n = 1`: set empty, so `2 ≤ n` needed | holds | none |
| 1.6 irreducibility | `K₂`, `K₁`, `2K₁` | `A² = I` irreducible; `[0]` not (Mathlib asks positive-length paths, `Irreducible/Defs.lean:83`); `0` reducible | holds | none |
| 1.7 unions, isomorphisms, components | `K₂ ⊕ K₁`, `K₃ ⊕ K₃`, `K_{1,4}` vs `C₄ ⊕ K₁` | `{1,-1,0}`, `χ = (X²-1)X`; `{0,0,3,3,3,3}`; both `2, 0³, -2` | holds | none |
| 1.8 spectrum from idempotents | `K₂`; empty index type; a zero `Eᵢ`; repeated `θ` | `E± = (I ± A)/2`, rank = trace = `1`; `ι` empty forces `n` empty; `replicate 0`; count `5 ≠ rank 2` | holds | C02 (Check) |
| 2.1 degrees | `K_{1,3}`, `K_{2,2,2}`, one part of size `t` | `4-1 = 3`, `4-3 = 1`; `6-2 = 4`; `t - t = 0` | holds | none |
| 2.2 Laplacian of the path | `n = 0, 1, 3, 4` | `∅`; `{0}`; `{0,1,3}` (sum `4 = 2m`); `{0, 2-√2, 2, 2+√2}` | holds | none |
| 2.3–2.4 Hamming, Johnson, Kneser API | `H(0,q)`, empty `Q`, `J(4,2)`, `K(4,2)`, `J(α,1)` | one vertex, degree `0`; empty type; degree `2·2 = 4`; `3K₂`; distinct singletons are disjoint | holds | none |
| 2.5 line graphs | `K₂`, `K₃`, `K₄`, `k = 0, 1` | `UᵀU = [2]`; `2,-1,-1`; `4, 0³, (-2)²` (6 values, sum `0`); `2k-2` truncates to `0`, line graph edgeless | holds | none |
| 2.6 multiset spectra | `K_{r×t}`, `H(d,q)`, `q = 1`, `J(5,2)`, `K(6,3)`, `J(4,3)`, `C₂` | counts `1+r(t-1)+(r-1) = rt`, `∑C(d,i)(q-1)^i = q^d`; `{0}`; `6,1⁴,(-2)⁵`; `1¹⁰,(-1)¹⁰`; six values on 4 vertices; `±2 ≠ ±1` | holds; hypotheses needed | C01 (two special cases) |
| 3.1 distinct eigenvalues | `Kₙ`, `C₅`, `Pₙ`, `K₁`, `2K₂`, `⊥` | diam+1 vs distinct: `2,2`; `3,3`; `n,n`; `1,1`; `2K₂` has two and is not complete; `L = Q = 0` | holds | none |
| 3.2 Perron–Frobenius | `K₁`, `K_{1,3}`, `2K₂` | `θ₁ = 0`, count `1`, `v = (1)`; `A(√3,1,1,1) = √3(√3,1,1,1)`; multiplicity `2` | holds | none |
| 3.3 degree bounds | `P₄`, `K_{1,3}`, `K₁`, `K₃ ⊕ K₂` | `1 < 1.5 < 1.618 < 2`; `1 < 1.5 < 1.732 < 3`; `0 = 0` regular; `θ₁ = 2 = k_max` not regular | holds | none |
| 3.4 monotonicity and extremes | `n = 1, 2`, `P₄`, `K_{1,3}`, `K₃ ⊕ K₁` | `0 ≤ 0 ≤ 0`; `1 ≤ 1 ≤ 1`; `2cos(π/5) = 1.618`; `√3 = √(n-1)`; same index `2` | statements hold; route has an unowned step | R01, N02 |
| 3.5 index, edges, cliques | `K₄`, `K_{1,3}`, edgeless, `K₁`, `C₅`, `K₃` | Stanley `3 = 3`, Hong `3 = 3`; Hong `√3`, Hofmeister `√(12/4) = √3`; `0 = 0`, `s = ∅`; `2 ≤ 2.5`, `2 ≤ √5`; `4 ≤ 4` | statements hold; Motzkin–Straus unowned | R01 |
| 3.6 Hoffman | `K₃`, `C₄`, `K₁`, `2K₂` | `J = A + I`; `A(A+2I)/2` has row sums `(4+4)/2 = 4`; empty product gives `J = I`; no polynomial | holds | none |
| 3.7 bipartite regular | `C₄`, `C₅`, `K₁`, `C₄ ⊕ K₃` | `-2 = -k`; `-1.618 ≠ -2`; `0 = -0`; `θₙ = -2` with a triangle | holds | none |
| 3.8 complement | `P₃`, `Kₙ`, `J(5,2)` | `(3I-J-L)₀₀ = 1`, the Laplacian of `K₂ ⊕ K₁`; `0ⁿ`; `10-6-1 = 3`, `-1-1 = -2` ×4, `-1+2 = 1` ×5 | holds | none |
| 3.9 main eigenvalues | `K_{1,3}`, `C₄`, `K₁`, `P₃` | main `±√3`, two orbits; `N_h = 4·2ʰ`; `1 = 1·1·0⁰`; main `±√2` | holds | none |
| 4.1 divisibility | `P₃` two partitions, `P₄`, empty `I` | `X²-2 ∣ X³-2X`; `X²-X-1 ∣ X⁴-3X²+1`; `X²-X-1/2` not a factor; `1 ∣ 1` | holds | C03 (commentary) |
| Motzkin–Straus as used in 3.5 | `K₃`, `v = 𝟙/√3` | `2·3·(1/3) = 2 ≤ (2/3)·3 = 2`; owner searched: none | true, unowned | R01 |
| Oblique conjugation in the Check of 1.8 | `M = diag(1,-1)`, `S = [[1,1],[0,1]]` | `SMS⁻¹ = [[1,-2],[0,-1]]`, not symmetric | Check outside the hypotheses | C02 |

- Source locators checked against the text: 0 of 79 (no cited book could be read legally).
- Library declarations opened at the pin: `Matrix.IsIrreducible` (`Mathlib/LinearAlgebra/Matrix/Irreducible/Defs.lean:83`), `Matrix.isIrreducible_iff_exists_pow_pos` (same file, line 160), `SimpleGraph.lapMatrix_toLinearMap₂'` and `SimpleGraph.posSemidef_lapMatrix` (`Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:176, 191`); the 50 Mathlib and 7 Tau Ceti names the file pins with `#check` all resolve.
- Cross-roadmap citations resolved at the suppliers' heads: 15 (RandomMatrices 1.2 on main; SpectralGraphBounds 1.1–1.4; LaplacianEigenvaluesOfGraphs 1.1, 1.2, 2.1, Layer 3; PeriodicNonnegativeMatrices 3.2, 3.3; EquitableOperatorReduction Layers 1, 2, 5; SpectralQuantumWalks Layers 1, 5, 7; TopologicalCombinatorics 3.1; AssociationSchemes 1.2, 5.1; QuasirandomGraphs 4.1; DelsarteTheoryOfCodesAndDesigns 2.1). The copied definitions agree with the suppliers' `Suggested.lean` character for character (three of SpectralGraphBounds, two of LaplacianEigenvaluesOfGraphs, two of TopologicalCombinatorics, four of EquitableOperatorReduction).
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every supplier not on main is an open pull request that adds a new roadmap.
- Elaboration: `lake env lean` on `TauCetiRoadmap/GraphSpectra/Suggested.lean` exits 0 with 93 `sorry` warnings and no other message; no `set_option`, no sorried definition. The elaborated types of all declarations were compared with the README; the four definitions that do not carry `[Fintype V]` do not need it.
- One-tactic probe: 19 declarations tried on a copy of the file, 9 closed (C01).
- No change outside `TauCetiRoadmap/GraphSpectra/`.
- Overlap check: read SpectralGraphBounds, LaplacianEigenvaluesOfGraphs, AssociationSchemes, LovaszThetaFunction, StronglyRegularAndMooreGraphs (and the suppliers EquitableOperatorReduction, SpectralQuantumWalks, PeriodicNonnegativeMatrices, TopologicalCombinatorics); sorted adjacency eigenvalues: SpectralGraphBounds, copied; sorted Laplacian eigenvalues and algebraic connectivity: LaplacianEigenvaluesOfGraphs, copied; the variational formula: here (a route step there); irreducibility of a connected graph's adjacency matrix: here (a route step in PeriodicNonnegativeMatrices 3.1); eigenvalues and projectors of the standard families: SpectralQuantumWalks, the multisets with multiplicities here; spectral projectors of a Hermitian matrix: SpectralQuantumWalks, the real adjacency case kept here as a variant; Kneser graph: TopologicalCombinatorics, copied; Johnson scheme: AssociationSchemes. Nothing has two owners.

Source independence: 0 passages compared with 0 sources, because none of the five cited books could be read; largest share BH, 46 of 79 locators; contents not compared with BH (its table of contents could not be opened). By subject the layers do not track one chapter each (Layer 1 mixes BH §§1.1–1.3, 1.7 and 3.1, Layer 2 mixes §1.4 and §12.4, Layer 3 mixes §§1.3, 3.1, 3.3, 3.4 with CRS and St), but this rests on the README's own locators, not on the book.

Research link: the headline targets are the classical index bounds (Stanley, Hong, Wilf, Nikiforov, Nosal, Hofmeister), Hoffman's polynomial, main eigenvalues and the spectra of Hamming, Johnson and Kneser graphs, as in Brouwer–Haemers 2012, Cvetković–Rowlinson–Simić 2010 and Stanić 2015; the open roadmaps on strongly regular graphs, association schemes and the theta function build on them. Rests on the README.

## Not verifiable

- BH (Brouwer–Haemers, *Spectra of Graphs*): all 46 locators, including those of the sampled sections 1.1, 1.3, 1.5, 1.7, 2.2, 2.5, 3.1, 3.2, 3.3, 3.7, 3.8. The publisher's page is paywalled, a copy on a university page could not be shown to be an author's page, and no local copy is held.
- CRS (Cvetković–Rowlinson–Simić): all 17 locators (sampled: 1.1, 3.2, 3.3, 3.5, 3.7, 4.1). The publisher's page is not an open host; no local copy.
- B (Biggs): all 7 locators (sampled: 1.3, 1.8, 2.5, 3.1, 3.8). Same.
- Ba (Bapat): all 3 locators (sampled: 1.1, 2.5). Paywalled.
- St (Stanić): all 6 locators (sampled: 3.5). The publisher's page is not an open host; no local copy.
- Sections 2.1 and 1.8 of the sample carry no locator for their statements (2.1 none at all; 1.8 only for the spectral decomposition in its introduction); they were checked by computation only.
- Ownership against open pull requests was checked through the search over all open heads; the suppliers' folders were read at their heads.

Automatic checks set aside as false positives: two Mathlib lemma names ending in a prime (`Matrix.charpoly_mul_comm'`, `SimpleGraph.lapMatrix_toLinearMap₂'`) were taken for names this roadmap claims to declare; both are Mathlib's and both resolve at the pin.

## Source issues

- none

## For the human reviewers

- **Not tested.** BH has the largest share of the locators (46 of 79); neither its text nor its table of contents could be read legally, and the same holds for CRS, B, Ba and St. Wording and arrangement were not compared with any source.
- **Licence.** `Suggested.lean` (lines 129–143) copies four definitions from the `Suggested.lean` of EquitableOperatorReduction, whose README names the public library Graphplay (MIT/Apache-2.0) as the provenance of that material.
- **Scope of the suppliers.** Sections 2.6, 3.9 and 4.1 depend on EquitableOperatorReduction and SpectralQuantumWalks, two draft pull requests of another author whose layers are lists of topics without statement-level targets; whether they can carry the contracts stated in this README is a merge-order decision.
