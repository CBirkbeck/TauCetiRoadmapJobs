# Review of ExpanderConstructions (pull request #2812 at eda9271)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem was tested in its degenerate cases and on random involutive rotation maps, every Check value was recomputed, and every locator was read in the two sources; all of it holds as stated, including the corrected orientation of the replacement-product bound. There is one small correction (a Check in 1.1 that omits "involutive") and one format note, neither blocking. One fact is left for the human reviewers: the family theorem of Layer 4 is conditional on a base graph that the roadmap cites and does not construct.

## C01 — The first matrix in the last Check of 1.1 is an adjacency count matrix, of a rotation map that is not involutive

The Check (README line 116) says of `[[0, 1], [0, 1]]` and `[[1, 1], [1, 0]]` that "neither is an adjacency count matrix". Since `adjCount` is defined for every function `R : V × P → V × P`, a reader takes this literally, and for the first matrix it is not so: on two vertices with one port, the map `(0, 0) ↦ (1, 0)`, `(1, 0) ↦ (1, 0)` has adjacency counts `[[0, 1], [0, 1]]`. The reason given in the same sentence is about involutions, and with that qualifier the Check is right (the second matrix has row sums `2` and `1`, so it is the adjacency count matrix of no map at all with a fixed port type). Writing "neither is the adjacency count matrix of an involutive rotation map" makes the sentence say what its reason proves.

## N01 — `zigZagFamily` and `zigZagFamily_spec` put `W` and `Q` in one universe

In `Suggested.lean` (lines 180 and 188) both take `{W Q : Type u}`, while `zigZagFamilyVertex` only needs the universe of `W` and the README has no such restriction. It costs nothing mathematically; separate universes would match the README.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 `adjCount`, `normAdj`, Checks | `Kₙ` (n = 2..7), complete graph with loops, one vertex two ports | `Kₙ`: involutive, counts `J − I`; loops: all counts 1, fixed points `(v,v)`; identity and swap both give count 2 | holds | none |
| 1.1 `exists_involutive_adjCount_eq` | `V` empty; `P` empty (A = 0); odd diagonal entry; non-symmetric `[[0,1],[0,1]]` | odd diagonal handled by a half-loop; non-symmetric matrix realized only by a non-involutive map | holds; both hypotheses needed | C01 |
| 1.2 `secondEigenvalue`, Checks | `Kₙ`, `C₅`, `C₄`, `C₄` with half-loops, identity on 2 vertices, no sum-zero condition | `1/(n−1)`; `0.80902 = (1+√5)/4`; `1` (spectrum `1,0,0,−1`); `1/3` (spectrum `3,1,1,−1`); `1`; non-involutive map gives `3/2` | holds | none |
| 1.3 `card_mul_secondEigenvalue_eq` | `K₅`, `C₄`, `K₂` (n = 2, both indices equal 1), `d = 0` with n ≥ 2 | `4·¼ = 1 = max(1,1)`; `2·1 = max(0,2)`; `1·1 = |−1|`; `0 = 0` | holds; row sums of `adjCount` force regularity | none |
| 2.1 `rotationPower`, `secondEigenvalue_rotationPower` | `C₅²`, `C₄²`, `t = 0` on one vertex, `P` empty, directed triangle, 600 random involutions, t ≤ 3 | `0.654508 = (3+√5)/8`; row `[2,0,2,0]`, λ = 1; `0` against `1`; `0 = 0`; `½` and `½` (not `¼`); max error `2.7e−15` | holds; `t ≥ 1` and involutivity needed | none |
| 2.2 `secondEigenvalue_rotationTensor` | `K₃ ⊗ C₅`, `K₂ ⊗ K₂`, one vertex no ports ⊗ `C₅`, one half-loop ⊗ `C₅`, `V` empty, 600 random | `0.80902`; matching, λ = 1; `0` against `0.809`; `0.80902`; `0` against `0.809`; max error `4.4e−15` | holds; all four nonemptiness hypotheses needed | none |
| 3.1 `zigZag`, `zigZagBound`, `secondEigenvalue_zigZag_le` | `K₅ⓩK₄`, triangle with half-loops ⓩ `K₃`, loops₂ ⓩ loops₂, `K₅ⓩC₄`, `P` or `Q` empty, 600 random; `f` on a 401² grid | `0.4624753 = (1+√10)/9 = f(¼,⅓)`, spectrum `9, 1⁵, (−1)⁶, (−1±√10)⁴`; `½ = f(0,½)`; `J`, λ = 0; `1 = f(¼,1)`; `0 ≤` each bound; least slack `−8e−15`; `f ≤ a+b`, `f ≤ 1−(1−b²)(1−a)/2`, case II bound `− f ≤ 1.1e−16` | holds; first two bounds attained | none |
| 3.2 `replacement`, `secondEigenvalue_replacement_pow_three_le` | loops₂ ⓡ loops₂, `K₅ⓡK₄`, `D = 0`, 600 random | matrix as printed, spectrum `3, 1, 1±√2`, `λ³ = 0.52115 ≤ 23/27 = 0.85185`, printed source form `4/27 = 0.14815` fails; `λ = ¾`, `0.4219 ≤ 0.9244`; `λ³ ≤ 1`; least slack `−2e−14` | holds in the README's orientation | none |
| 4.1 `zigZagFamily`, `zigZagFamily_spec` | `d = 1`; `d = 2` (16-cycle, path with half-loops); induction step; `Q` empty | one vertex, λ = 0; λ = 1 and `cos(π/16) = 0.980785`; `1/16 ≤ ½`, `¼ + ¼ = ½`; all types empty, λ = 0 | holds; types of `relabelPorts`, `rotationPower`, `zigZag` compose as stated | none |
| 4.1 cited base graph | `AP_q ⊗ AP_q` then two zig-zags with `AP_q` | `q⁴·q²·q² = q⁸` vertices, degree `q²`, `λ ≤ 3/√q ≤ ¼` iff `q ≥ 144`; 149 is prime | consistent with RVW Lemma 5.1, Proposition 5.2 | none |
| Scope: comparison with other roadmaps' quantities | normalized Laplacian `I − M`; absolute spectral gap; Cayley rotation map `(h,s) ↦ (hs, s⁻¹)` | `max(|1−λ₁|, |1−λ_(n−1)|) = max(1−λ₁, λ_(n−1)−1)`; MarkovChainMixing 2.2 takes eigenvalues `z ≠ 1`; map is an involution | holds | none |

- Source locators checked against the text: 30 (RVW02: Theorem 1.4, §2.1, Definitions 2.1–2.2, §2.3, Propositions 2.3–2.4, Definition 3.1, Claims 4.1–4.2, Theorem 4.3 and proof, Lemma 5.1, Proposition 5.2 with footnote 3, Definition 6.3, Theorems 6.4, 6.7; HLW06: §2.1, §2.4, Theorem 8.2, Theorem 9.1, §9.2, Proposition 9.2, Definition 9.3, pp. 510–512); all pages agree.
- Library declarations opened at the pins: 23, all present in the files the README names (for example `Equiv.Perm.permMatrix`, `Mathlib/LinearAlgebra/Matrix/Permutation.lean:37`; `Matrix.IsHermitian.eigenvalues₀_antitone`, `Mathlib/Analysis/Matrix/Spectrum.lean:63`; `LinearMap.IsSymmetric.eigenvalues_eq_of_eigenbasis`, `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:325`; `TauCeti.SerreGraph`, `TauCeti/Combinatorics/Graph/Serre/Basic.lean:42`). Neither library has rotation maps, a zig-zag product or a spectral parameter for multigraphs.
- Cross-roadmap citations resolved: 7 roadmaps, 12 sections, all found with the layer titles the README gives (SpectralGraphBounds 1.1, 4.1, 5.2; MarkovChainMixing 2.2–2.3, 3.2; KernelsAndSpectralMethods 1.4, 3.2, 4.1; RandomWalksOnFiniteGroups 2.1; SieveMethodsAndPrimePatterns 5.4; SpectralQuantumWalks Layer 5; CoboundaryExpansion). None is a supplier.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (7 declarations); no `set_option`, a single `import Mathlib`, no sorried data. `#check @name` types compared with the README: the definitions keep only the binders they use, and every theorem carries its own (`[DecidableEq P]` is explicit in the two Layer 3 theorems); nothing changed.
- One-tactic probe (`simp`, `rfl`, `le_rfl`) on a copy: closes none of the 7 theorems. Headline theorems (realization, simple-graph comparison, powers, tensor, zig-zag, replacement, the family): all statable and all stated.
- Pull request text: title and description agree with the head (7 theorems, 11 definitions, 2 instances, new roadmap, no supplier roadmap).
- Automatic checks: all passed.

Overlap check: read SpectralGraphBounds, StronglyRegularAndMooreGraphs, MatchingPolynomial, ComparisonOfMarkovChains, MarkovChainMixing (no roadmap on main and none by results is listed as close); nothing shared. A search of all open and merged roadmaps for rotation maps, zig-zag and replacement products finds no other owner.

Source independence: 8 passages compared with 2 sources, none shared beyond the forced wording of the definition of a rotation map (about a dozen words); largest share RVW02, 18 of 28 citing passages; contents compared with RVW02: independent (Layer 1 adds the realization theorem and the simple-graph comparison, Layer 3 joins its §3.1, §4 and §6.2, Layer 4 is the squaring recursion of its introduction, its §5 and §6.1 are left out; the order definitions, λ, powers, zig-zag, family is forced by the *Needs:* lines).

Research link: The zig-zag theorem and the iterated family are Reingold–Vadhan–Wigderson (2002); Hoory–Linial–Wigderson (2006, §9.5) use the third bound of Theorem 9.1 in Reingold's proof that SL = L, and the second for the expander family. Rests on the README's sources, read in HLW06 and RVW02.

## Not verifiable

- none

## Source issues

- **Error** in RVW02 at Theorem 6.4, p. 183: the source says the cube of the replacement product's parameter is at most `p + (1 − p) f` with `p = D₂²/(D₂ + 1)³`; it should be `p f + (1 − p)`, as the decomposition of `M³` in its own proof gives; affects a stated result.
- **Error** in HLW06 at §9.3, remark after Definition 9.3, p. 510: the source says the third bound of Theorem 9.1 holds for the replacement product; it should exclude the unweighted product defined there (`K₅` with `K₄`: `λ = 3/4 > 2/3`); affects nothing.

## For the human reviewers

- Scope: the family theorem of 4.1 assumes a base graph with `λ ≤ 1/4`; the only instance inside the roadmap is `d = 1` (one vertex). The README (4.1, after the Checks) cites the affine-plane graphs for `q ≥ 144` and leaves them out of scope.
