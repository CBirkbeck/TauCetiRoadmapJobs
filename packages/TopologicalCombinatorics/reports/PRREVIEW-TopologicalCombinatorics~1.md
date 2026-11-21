# Review of TopologicalCombinatorics (pull request #2872 at 83b2e5f)

**Verdict:** needs changes

**Summary.** Changes are needed on one point. Both forms of Tucker's lemma in Layer 2, and through them Layers 3 to 5, rest on a theorem about triangulated spheres whose proof uses facet-incidence counts that the README establishes only by machine for small cases and never states as targets. Every stated theorem survived the degenerate-case and brute-force checks, and `Suggested.lean` elaborates with `sorry` as its only warning. There is one small correction and one format note, neither blocking. Two sources could not be read legally, and the human reviewers are told which.

## R01 (P2) — The route to both Tucker lemmas uses facet-incidence counts for all `n` and `m` that are neither targets nor proved, so the claim that the proof "uses no topology" is unsupported

An implementer of 2.1 or 2.2 has no statable intermediate theorem to prove. The route hands the work to Prescott–Su, Theorem 2, which is about a symmetric triangulation of `Sⁿ` with a flag of sets "homeomorphic to a `d`-ball" (`prescott-su line 69`). Its proof, the proof of Theorem 1, uses two incidence facts without argument: a `(d − 1)`-simplex carried by `±H_d` is a facet of exactly two `d`-simplices of that carrier (`prescott-su line 306`), and a `d`-simplex carried by `±H_d` is a facet of exactly one simplex of `H_(d+1)` and one of `−H_(d+1)` (`prescott-su line 320`). For a general triangulated ball these are topological facts. Theorem 2 itself is only sketched after Theorem 1 (`prescott-su lines 402–417`).

The README checks the topological hypothesis by a geometric argument in the route of 2.2 (lines 270–280). It records the incidence facts themselves only as Checks: for the chains of sign vectors "for `n ≤ 5`" (2.1, lines 235–238), and for the glued complex for `n ≤ 2, m ≤ 4`; `n = 3, m ≤ 3`; `n = 4, m ≤ 2` (2.2, lines 289–294). No target states them for all `n` and `m`, and no target states the lemma in a form that avoids triangulations of spheres, which the pinned Mathlib does not have. So the sentence of 2.1 "The proof is a path-following argument over almost-alternating simplices and uses no topology" (line 222) holds only once those counts are proved combinatorially.

The smallest change is to add two things to Layer 2. First, the lemma as a target in combinatorial form: for a finite simplicial complex with a free simplicial involution and subcomplexes `H₀ ⊆ ⋯ ⊆ H_n` such that `H₀` is a vertex, `H_n ∪ −H_n` is the whole complex, each `H_d` is pure of dimension `d`, and every `(d − 1)`-simplex of `H_d` lies in exactly two `d`-simplices of `H_d`, or, when it lies in `H_(d−1) ∪ −H_(d−1)`, in exactly one of `H_d` and one of `−H_d`, every antisymmetric labelling by `±1, …, ±n` has a complementary edge (Prescott–Su, Theorem 2, with the two steps above as its hypotheses). Second, as items of 2.1 and 2.2 "proved here", the statements that the chain complex of nonzero sign vectors and the glued complex satisfy these hypotheses for every `n` and `m`; the Freudenthal description already in the routes gives the counts. Alternatively 2.1 can take a direct combinatorial proof as its route, but 2.2 would still need the counts for the glued complex.

## C01 — The Borsuk–Ulam statement excludes infinite-dimensional `E`, where the theorem holds and the summary's wording promises it

The summary says "Every continuous map from a sphere of a real normed space to a finite-dimensional real normed space of smaller dimension takes equal values at two antipodal points" (lines 30–32). For `E` infinite-dimensional and `F` finite-dimensional this is true: restrict to a subspace of dimension `finrank F + 1`. But 4.1 and `borsuk_ulam` assume `finrank F < finrank E`, which is false there because `finrank E = 0`, so the library statement would not apply to the unit sphere of a Hilbert space. The hypothesis would cover every case as `FiniteDimensional ℝ E → finrank ℝ F < finrank ℝ E`, or as an inequality of `Module.rank` (with `Cardinal.lift` if `E` and `F` are in different universes), which is how Mathlib's `isConnected_sphere` states its dimension condition. Step 3 of the route then begins by passing to a finite-dimensional subspace. If the narrower form is intended, the summary would say "finite-dimensional" for `E` as well.

## N01 — One sentence of the References narrates the drafting

"no source for it was opened" (line 636) reports how the text was written and not a fact about the mathematics. The sentence would read as well ending at "is customary; its properties are proved in 1.1".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 grid, cells, owners | `(n,N)` = (2,2), (2,3), (3,2), (1,4), (0,3), (0,0), (2,0), (3,3) | points 6, 10, 10, 5, 1, 1, 1, 20; cells 4, 9, 8, 4, 1, 1, 0, 27 = `Nⁿ`; owners distinct, vertices close on every cell | holds | none |
| 1.1 Check, cell at `(0,0,2)` | `σ` = swap 0 1 | vertices `(0,0,2)`, `(0,1,1)`, `(1,0,1)` (also by `decide` on a probe copy); owners 0, 1, 2 | holds | none |
| 1.2 Sperner's lemma | all Sperner labellings, (1,5), (2,3), (3,2); `N = 0`; `n = 0` | 16, 192, 64 labellings, 0 with even count; `N = 0`: no labelling, 0 cells for `n ≥ 1`; `n = 0`: 1 cell | holds | none |
| 1.2 Checks | least-index labelling; negative control | exactly 1 full cell for (2,2), (2,3), (2,4), (3,3); control: only `(0,0,2)` violates, label 2 unused, count 0 | holds | none |
| 1.2 labelling counts | products of numbers of positive coordinates | 8, 192, 13824, 64, 1024 | match | none |
| 1.3 owners form | `n = 0`; check at (2,2) | `n = 0, N ≥ 1`: `x 0 = (N)`, bijection of `Fin 1`; owners 0,1,2 with labels 2,1,0 | holds | none |
| 2.1 octahedral Tucker | `n = 0, 1, 2`; bound `≤ n` | `n = 0`: no `A ≠ 0`, conclusion false, `0 < n` needed; `n = 1` vacuous; `n = 2`: 16 labellings, 0 bad; labels to `±2`: 80 of 256 bad | holds | R01 (route) |
| 2.2 lattice Tucker | `n = 0`; `m = 0`; (1,3), (2,2); bound `n + 1` | vacuous; vacuous (`lab 0 = −lab 0`); 64 and 262144 labellings, 0 bad; `n = 1, m = 2`, labels to `±2`: 80 of 256 bad | holds | R01 (route) |
| 2.2 gluing | antipode of first-copy `x` | second-copy label at `−x` is `−lab x`; on the boundary `−lab(−x) = lab x` | consistent | none |
| 3.1 Kneser graphs | (5,2), (7,3), `k = 0`, `k = 1` | 10 vertices degree `C(3,2) = 3`; 35 vertices degree `C(4,3) = 4`; one vertex, loop removed; complete graph | holds | none |
| 3.2 Dol'nikov | `𝓕 = ∅`; `{∅}`; all singletons; `r = 0`; count of families | `Y = ∅`; fails, nonempty needed; `Y = α`, `χ = n`; vacuous; `Σ_{j≤9} C(15,j) = 27824` | holds | none |
| 3.2 route | label ranges, both cases | case 1 in `±[1,m]`, case 2 in `±[m+1, n−1]`, `m < n`; equal absolute values force case 1 twice | sound | none |
| 3.3 Kneser's conjecture | (5,2), (6,2), (7,2), (7,3), (3,2), (5,3); `k = 0`; (2,2) | `χ` = 3, 4, 5, 3, 1, 1 = `n − 2k + 2`; `k = 0`: 1 against `n + 2`; (2,2): 1 against 0 | holds | none |
| 4.1 Borsuk–Ulam | `r < 0`, `r = 0`, equal dimensions, `F` infinite-dimensional, `E` infinite-dimensional | empty sphere; `x = 0`; inclusion of circle fails; `finrank F = 0` counterexample; hypothesis false although theorem true | holds as stated | C01 |
| 4.1 route, step 1 | labels at close `z`, `w` | `fᵢ(z/m) ≥ ε`, `fᵢ(w/m) ≤ −ε`, gap `2ε` against `< ε` | sound | none |
| 5.1 ham sandwich | `d = 0`; zero measures; `2δ₀ + δ₁`; Lebesgue on `[0, ∞)`; pole `a = 0` | no `a ≠ 0`; any hyperplane; pairs (0,3), (0,1), (2,1), (2,0), (3,0); finite against infinite; `μᵢ E = 0` | holds | none |

- Source locators checked against the text: 14 (Ziegler 7, Prescott–Su 4 by content, Roldán-Pensado–Soberón 3); 10 into Su and Matoušek not readable.
- Library declarations opened at the pin: 12 in Mathlib (among them `SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable` at `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean:345`, `coe_neg_sphere` at `Mathlib/Analysis/Normed/Group/BallSphere.lean:33`, `ContinuousLinearEquiv.ofFinrankEq` at `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:429`, `MeasureTheory.tendsto_lintegral_filter_of_dominated_convergence` at `Mathlib/MeasureTheory/Integral/Lebesgue/DominatedConvergence.lean:114`) and 2 in Tau Ceti (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean:140`, `TauCeti/Geometry/Convex/Cone/Alternative.lean:159`).
- Duplication by object: no Kneser graph, Borsuk–Ulam, ham sandwich, Sperner's lemma or combinatorial Tucker lemma in the pinned Mathlib or Tau Ceti, on main, or at any open head; the only hits are the three roadmaps the README names.
- Cross-roadmap citations resolved: 4 (KakutaniFixedPointAndContinuousGames Layer 4 and its scope line on Sperner's lemma, HamiltonianCycles 1.2, SpectralGraphBounds 3.2, AlgebraicTopology 8.5), all present as cited.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and nothing else; one import, no `set_option`, no sorry'd data. One-tactic probe (`simp`, `rfl`, `infer_instance`, `decide`, `simp` with the definitions unfolded, `aesop`) closes none of the eight theorems. All eight headline theorems of the README are stated; the elaborated signatures agree with the README statements and no binder is lost.

Overlap check: read GraphColouring, SpectralGraphBounds, RamseyNumbers, PerfectAndChordalGraphs; nothing shared (the Petersen graph and the graph on 3-subsets of a 7-set appear there as examples only, and none declares a Kneser graph).

Source independence: 9 passages compared with 3 sources, none shared; largest share ziegler-kneser, about a third of the locators; contents compared with ziegler-kneser: independent (3.2 corresponds to its §4 and 3.3 to its §3, in the opposite order; Layers 1, 2, 4, 5 have no counterpart). Su's article and Matoušek's preprint could not be read.

Research link: Layer 3 is Lovász's 1978 theorem and Dol'nikov's bound in the form of Ziegler (2001), who extends it to Kneser hypergraphs; Layer 2 is Tucker's lemma as in Prescott–Su (2005); Layer 5 opens the mass-partition results surveyed by Roldán-Pensado–Soberón (2020). Rests on the README's sources, three of them read.

## Not verifiable

- Su, *Rental harmony* (1.2, 1.3 and the fair-division consumer; §§2–4, pp. 3–8 of the author's copy): the publisher's page refused access and the sources service did not accept the author's page; the statements of 1.2 and 1.3 were checked by computation instead.
- Matoušek, *A combinatorial proof of Kneser's conjecture* (2.1, 2.2, 3.3; abstract, Lemma 2.1, §2, pp. 1–3 of the preprint): paywalled at the publisher and no copy found on the author's page; recorded as cited by locator only.
- Prescott–Su page numbers 258, 259 and 264 of the published version: the text read was arXiv:math/0310444v1, where the same passages are on pp. 1, 2 and 6; the content at each locator matches.

## Source issues

- **Gap** in prescott-su at the proof of Theorem 1, steps (1) and (3), arXiv p. 4: the source says a simplex carried by a hemisphere is a facet of exactly two simplices of the stated carriers, without argument; it should be derived from the hemispheres being triangulated balls; affects the proof.
- **Gap** in roldan-soberon at the proof of Theorem 1.2.2, p. 5: the source says a zero of the test map is clearly not one of the two poles; it should exclude or treat the case where all measures are zero, where the poles are zeros; affects the proof.
- **Gap** in ziegler-kneser at the proof of Theorem 4.2, p. 5: the source says the labels lie in `±1, …, ±(n − 1)`, which needs `m < n`; it should first dispose of `m ≥ n`, where the defect is at most `n`; affects the proof.
- **Error** in ziegler-kneser at Lemma 4.1, p. 5: the source says the lemma holds with no condition on `n`; it should assume `n ≥ 1`, since for `n = 0` there is no nonzero signed set; affects nothing.

## For the human reviewers

- Licence: the README cites two texts by their copies on authors' pages (Su at Harvey Mudd College, Matoušek at Charles University) that the sources service could not fetch; their locators were not checked against the text.
- Not tested: Prescott–Su was read in the arXiv version, not the published version on the author's page whose page numbers the README uses.
- Wording: the route of 3.2 is headed "Ziegler's proof" and follows the steps of the proof of Theorem 4.2 of `ziegler-kneser` (lines 224–243) in the README's own words, with two added cases; no run of more than five words is shared.
- AI use: the description states the roadmap was drafted and reviewed by Claude Opus agents, with brute-force checks in Python; the author states they read both files.
