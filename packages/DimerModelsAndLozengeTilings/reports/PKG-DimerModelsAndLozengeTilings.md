# PKG-DimerModelsAndLozengeTilings

Package of the accepted design (`design/README.md`, `design/plan.json`, review
`REV-DESIGN-DimerModelsAndLozengeTilings~7`: accepted, 0 findings). Files written:
`packages/DimerModelsAndLozengeTilings/README.md` (2178 lines), `Suggested.lean` (558 lines),
`metadata.toml` (`topic = "math.PR"`), and `sources.toml` (two `cited_for` entries extended).
`design/plan.json` is unchanged: its `gaps` list stays `[]`, since nothing is needed from another
roadmap. No source was fetched and `needs-references.toml` was not written: every cited text is in
the manifest (8 certified, 2 settled uncertified).

## Headline theorems

Listed from the design's end theorems, plus flip connectivity, which the design builds and which a
reader names the theory by. Each statable one is stated in `Suggested.lean` with `sorry`.

| README | Headline | Lean | Status |
|---|---|---|---|
| 1.5 | tilings of any region are the perfect matchings of the induced dual graph | `tilingSubgraph_bijOn` | stated |
| 2.5 | plane tilings are height functions vanishing at 0 | `tilingOfHeight_bijOn` | stated |
| 2.8 | flip connectivity on finite simply connected regions | `flip_connected` | stated |
| 2.9 | Thurston's criterion | `thurston_tileable_iff` | stated |
| 3.2 | Kasteleyn's theorem | `partitionFunction_eq_abs_det` | stated |
| 3.3 | determinantal local statistics on finite regions | `lozenge_correlation_eq_det` | stated |
| 4.6(b) | face property of invariant Gibbs measures | `gibbsInvariant_isExtreme` | stated |
| 4.6(b) | extreme invariant Gibbs measures are the ergodic ones | `gibbsInvariant_extreme_iff_ergodic` | stated |
| 5.3 / 5.4 | face and ergodicity theorem, lozenge instance | `lozengeGibbsInvariant_isExtreme`, `lozengeGibbs_extreme_iff_ergodic` | stated (lozenge instance) |
| 5.3 | the same for a general locally finite periodic graph | none | not stated separately (see below) |
| 6.3(d)–(e) | classification of invariant Gibbs measures on the edge `t = 0` | `slopeEdge_ergodicGibbs_equiv` | stated |
| 6.3(f) | two ergodic Gibbs measures at every non-corner edge slope | `two_ergodicGibbs_of_slopeEdge` | stated |
| 7.3 | torus limits are invariant Gibbs measures of the slope | `torusLimit_mem_gibbsInvariant_slope` | stated (uniform tori) |
| 8.3 | torus partition function as four determinants | `torus_partitionFunction_eq` | stated |
| 9.5 | an ergodic Gibbs measure of every slope | `exists_ergodicGibbs_of_slope` | stated |
| 9.7 | existence, uniqueness, ergodicity and slope of the incomplete beta process | `incompleteBetaProcess_exists_unique` | stated ((b)–(d)) |
| 10.2 | local limits of uniform measures on exhausting tileable regions are Gibbs | `localLimit_isLozengeGibbs` | stated ((c)–(d)) |

17 theorems, over 40 definitions with real bodies (no `sorry` in any definition, instance or
proof term). These include the carriers `TriEdge`, `TriFace` and `TriFace.edges`, and
`hexGraph`, `IsTiling`, `IsSimplyConnectedRegion`, `kasteleynMatrix`, `Subshift`,
`Specification`, `IsLozengeGibbs`, `slope`, `twistedKasteleyn`, `incompleteBetaKernel` and
`LocalConvergence`. There are three instances: the `ℤ²` translation action on edges, Mathlib's
`arrowAddAction` on configurations, and the action on a subshift.

**5.3 for a general graph is not stated separately.** Its own statement needs two constructions
as values: the dimer specification `γ^w` of README 5.2 (a consistent family of proper kernels
on the closed set of perfect matchings) and that closed set as a `Subshift`. Building them means
proving the set is closed for a locally finite graph and that each kernel is measurable for the
exterior σ-algebra. Both are library work, so they stay README targets. The theorem's general
form is 4.6, stated over an arbitrary equivariant `Specification` of an arbitrary `Subshift`,
and its lozenge instance is 5.4. The module docstring says so. Restating 5.3 with hypotheses that
pin the kernels would make it a specialisation of 4.6. 9.3–9.4 (Kenyon's measure `μ^w` and its
mixing) are not listed as separate headlines: 9.5 and 9.7 state their consequences. They, 4.2,
4.3 and the other targets remain README targets.

## Decisions and corrections relative to the design

- **Lean names.** Two design names became declarations with different names. The theorem behind
  `planeHeight_bijective` is `tilingOfHeight_bijOn`, a `Set.BijOn` of the explicit inverse map
  `tilingOfHeight`. The theorem behind `isTiling_iff_isPerfectMatching` is `tilingSubgraph_bijOn`,
  a `Set.BijOn` of `tilingSubgraph`. `IsPlaneTiling` is written `IsTiling Set.univ`. Every other
  backticked own name of the design is declared. No backticked own name remains undeclared: this
  was checked by script, and the two dot-notation forms `hexGraph.induce …` and `rowCode_* μ` were
  rewritten as `SimpleGraph.induce R hexGraph` and in prose. All 57 Lean declarations appear in
  the README. This applies both package-stage remarks of review ~7.
- **`IsLozengeGibbs` is defined in cylinder form.** It is a probability measure on `TriEdge → Bool`,
  concentrated on plane tilings, satisfying the cylinder identities of 5.2 with `w ≡ 1`.
  Equivalence with the Gibbs property of `γ^unif` on `𝔛(hexGraph)` is a 5.4 API item. Two new
  Checks in 5.4 (the empty configuration, `2δ_{M₃}`) show that the concentration and probability
  clauses are needed.
- **Weak limits as cylinder convergence.** This is used in 7.3 and `LocalConvergence` (10.1). On
  the compact metrisable space `TriEdge → Bool`, weak convergence of probability measures is
  convergence of all cylinder masses (README 4.4). The limit has mass one, from the empty cylinder.
  This avoids `ProbabilityMeasure` coercions that would need proofs inside the statements.
- **8.1–8.3 widened to real periodic weights.** The sources assume positive weights, but the
  four-determinant identity is a polynomial identity. It was checked exactly on every torus up to
  3 × 3 with unit and with random signed rational periodic weights (18 cases), and a signed-weight
  Check was added to 8.3. The README and Lean generality agree: real periodic `w`, no positivity.
- **Locator fix.** The design's span "Definitions 13.4–13.6 … lines 4534–4582" is correct. The new
  5.4 and Lean citation of gorin2021 Definition 13.6 uses lines 4556–4582, read at the cached text
  (Definition 13.6 at line 4556, Lemma 13.7 at line 4561).
- **Timeless wording.** "proposed DimerModelsAndLozengeTilingsPartII" became "its Part II,
  DimerModelsAndLozengeTilingsPartII" (Scope, 10.3, Downstream consumers).
- **Scope.** Two not-owned bullets were added after the by-object duplication sweep. Tau Ceti's
  `TauCeti.IsPerfectMatching` covers perfect matchings of a finite type as fixed-point-free
  involutions, in `TauCeti/Combinatorics/Enumerative/PerfectMatching.lean`. Tau Ceti's
  `Matrix.gibbsState` covers quantum Gibbs (KMS) states, in
  `TauCeti/Analysis/CStarAlgebra/Action/Gibbs.lean`. Both are different objects and neither is
  used.
- **Supplier contracts.** The Mathlib declarations the Lean statements use were added with file and
  line at the pin: `SimpleGraph.fromRel`, `SimpleGraph.toSubgraph`, `SimpleGraph.Walk.darts`,
  `Set.BijOn`, `Relation.ReflTransGen`, `arrowAddAction`, `VAddInvariantMeasure`, `ErgodicVAdd`,
  `Ergodic`, `MeasurePreserving`, `ProbabilityTheory.uniformOn`, `Measure.real`, `Measure.bind`,
  `MeasurableSpace.comap_mono`, `finsum`/`finprod`, `Matrix.submatrix` and `IsExtreme`. Each was
  checked at the pinned Mathlib `1b1ccf4b`, together with what each does not include: `finsum` is
  `0` on an infinite support, `uniformOn` of an infinite set is `0`, and `arrowAddAction` is a
  definition, not an instance.

## What the README could not support; notions moved down

Nothing. No notion is needed from a roadmap later in the merge order, none moved down, and no
supplier gap was declared (`gaps: []`).

## Duplication sweep and ownership

- **Pinned libraries** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to `lake-manifest.json`).
  Searched for lozenge, dimer, Kasteleyn, specification, Gibbs, tail σ-algebra, subshift and
  Bernoulli shift actions. Mathlib has `Kernel.IsProper` and a single kernel's invariance, but no
  specification. Its subshifts are indexed by the acting monoid only. Tau Ceti has the ergodic and
  extreme results, `tailProcess`, and the complementary-minor identity, all consumed and cited.
  Its only Gibbs objects are quantum KMS states, now cited as not used. Its `IsPerfectMatching` is
  for involutions, now cited as not used. Nothing in the design duplicates a pinned declaration.
- **Roadmaps** on main and at the heads of the 475 open roadmap pull requests (`roadmaps grep`).
  "lozenge", "dimer", "discrete sine" and "Gibbs specification" match nowhere. "Kasteleyn" matches
  only the Fortuin–Kasteleyn identity of TemperleyLiebOperatorAlgebras, which is unrelated.
  "Gibbs measure" matches ClassicalErgodicTheory (open) §8.6, which treats Bowen–Ruelle Gibbs
  measures of a transformation, and PDE, which treats stochastic quantisation. Neither is a lattice
  specification. "Perfect matching" and "subshift" give no shared object (GraphConnectivityAndFlows
  §6.7 is already cited as not used). "Incomplete beta" matches the special function of
  SpecialFunctionsEiLiErfIncompleteGamma Layer 15, a different object from the contour-integral
  kernel of 9.6. "Tail σ-algebra" matches Completed/Exchangeability, whose content is Tau Ceti's
  `tailProcess`, which is cited.
- **Overlap list.** The scratch overlaps file names ClassicalErgodicTheory, PointProcesses,
  MathematicalBilliards, RandomGraphs, MathematicalStatisticsNonparametric, Exchangeability,
  ProbabilisticAndMetricNumberTheory and StochasticCalculus. Of these, ClassicalErgodicTheory
  (open) §0.3 and §1.4 build Bernoulli actions on `G → α` for `I = Γ` and their mixing. This
  roadmap's 4.3 remains a kept variant (a proper action on an index set with several orbits, any
  law). The owner cited for `I = Γ` stays VonNeumannAlgebras V8.BernoulliArbitraryDiscrete, which
  is on main. RandomGraphs and MathematicalStatisticsNonparametric use "specification" in the
  sense of "the content of the roadmap", so nothing is shared. PointProcesses is never cited.
- **Cross-roadmap citations** re-resolved on main `1a19c9f`: VonNeumannAlgebras
  V8.BernoulliArbitraryDiscrete (README line 2788), FactorRigidity §8.3, TensorProductCombinatorics
  §1.1, RandomMatrices §8.3–8.4, GraphConnectivityAndFlows §6.7. All are scope citations; none is
  a supplier.
- **Removals:** none. The design contained no target that exists elsewhere, and the sweep found
  none.
- The overlaps file lists no open pull request changing this roadmap, no dropped id, and no id
  defined only by an open revision. The Lean declarations live in the namespace
  `TauCetiRoadmap.DimerModelsAndLozengeTilings`; none shares a fully qualified name with another
  roadmap's declaration.

## Adversarial pass

The values come from two scripts kept in the job's scratch directory (`adversarial.py`,
`extra.py`). These scripts transcribe the Lean definitions literally (direction index
`0,1,2` = README directions `1,2,3`). Further values were computed by hand. Unless a row says
otherwise, the computed values match the Lean definitions as stated.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `TriFace.edges`, edge–face incidence | all 75 edges with `v ∈ [−2,2]²` | each edge lies in exactly the white and black face of the conventions (`(v,1)`: `W(v)`, `B(v−e₂)`; `(v,2)`: `W(v−e₁)`, `B(v)`; `(v,3)`: `W(v)`, `B(v)`) | holds | none |
| 2 | `IsTiling` | unit hexagon; `{W(0)}`; `R_ring`; `R₆'`; 2×2×2 hexagon | 2 tilings `= {T_a, T_b}`; 0; 2; 0; 20 (MacMahon's count) | holds | none |
| 3 | `tilingSubgraph_bijOn` | `R = ∅`; `{W(0)}`; unit hexagon | `{∅} ↔` the empty spanning subgraph; `∅ ↔ ∅` (one vertex, no perfect matching); 2 tilings ↔ 2 perfect matchings of the induced 6-cycle | holds | renamed from `isTiling_iff_isPerfectMatching` |
| 4 | `tilingOfHeight_bijOn` | `H = 0`, `x`, `y`, `⌊(x+y)/2⌋`, `x + y`; one face | images `M₃`, `M₁`, `M₂`, the tiling with no type-3 lozenge (`e₃`-increments all `1`); `x + y` excluded (`e₃`-increment `2`); round `W(v)`, `(a, b, a+b) ∈ {(0,0,0),(1,0,1),(0,1,1)}` selects exactly one edge | holds | renamed from `planeHeight_bijective` |
| 5 | `IsFlip`, `flip_connected` | hexagon; 2×2×2 hexagon; `R_ring` | `T_a ∖ A ∪ B = T_b` at `v = 0`; the flip class of one tiling has 20 of 20 tilings; both tilings of `R_ring` admit 0 flips, so simple connectivity is needed | holds | new headline |
| 6 | `thurston_tileable_iff` (walk form) | hexagon; `{W(0)}`; `R₆'`; 2×2×2 hexagon | h exists, tileable; no h (`0 + 0 ≠ 1`), 0 tilings; no h (`h(1,1) − h(2,1) = 1 > 0 = ρ`), 0 tilings; h exists, 20 tilings (0-1 BFS for ρ) | holds | none |
| 7 | `partitionFunction_eq_abs_det` | hexagon unit; hexagon `(w₁,w₂,w₃) = (2,3,5)`; 2×2×2 hexagon, random positive weights, random `σ`; `R₆'`; `R_ring` | `\|2\| = 2`; matrix `[[5,0,2],[3,2,0],[0,5,3]]`, `det = 60 = Z`; `\|det\| = Z = 43368841/11250`; `0 = 0`; `det 0 ≠ Z = 2` (not simply connected, excluded) | holds | none |
| 8 | `lozenge_correlation_eq_det` (with `K⁻¹(g,f) = (Kσ)⁻¹(σ g, f)`) | hexagon; 2×2×2 hexagon, `n = 1,2,3,4`; repeated black face; `n = 0` | `1/2`; `1/2` (pair); exact equalities `1615113/216844205`, `2257092/216844205`, `4604800/130106523`, `0 = 0`; right side `0`; `Z/Z = 1 = det of the empty matrix`; `K Kinv = I` checked | holds | Lean form stated in README |
| 9 | Untileable balanced region in 3.3 | `R₆'` with `σ` | `Z = 0`: the left side is `0/0 = 0` and `det K = 0`, so Mathlib's inverse is `0`; for `n = 0` the right side is `1`, which is false without tileability | hypothesis `∃ M, IsTiling R M` needed | kept, stated in README |
| 10 | `Specification` consistency direction | `ν = Bern(1/2)`, `ν' = Bern(1/3)` on `{0,1}^ℤ` | `γ_{0} ∘ₖ γ_{0,1}` gives `{ω(0)=1}` mass `1/2`, while `γ_{0,1}` gives `1/3`; the reverse order is vacuous | `comp_eq` direction correct | none |
| 11 | `gibbsInvariant_isExtreme`, `…_extreme_iff_ergodic` | `ℤ` acting trivially on `{pt}` (not proper); trivial group on `{pt}` (proper, finite); `X₀ = {0̄,1̄}` with the identity specification | `Bern(1/2)` is the only Gibbs measure, extreme, but `μ{ω(pt)=1} = 1/2` (not ergodic), so properness is needed; same failure for a finite group, so `Infinite Γ` is needed; on `X₀` the extreme points `δ_{0̄}`, `δ_{1̄}` are ergodic, the midpoint gives `{1̄}` mass `1/2` | holds with the stated hypotheses | none |
| 12 | `IsLozengeGibbs` | `δ_∅`; `2δ_{M₃}`; `δ_{M₃}`; `(δ_{M₃} + δ_{M_c})/2` | identities hold (both cylinders empty) but not concentrated; concentrated but mass `2`; Gibbs (an `M₃`-alternating cycle takes steps `−e₁`/`+e₂` and cannot close); fails at the hexagon window round `0` (`1/2` against `0`) | each clause needed | two Checks added |
| 13 | `lozengeGibbsInvariant_isExtreme`, `lozengeGibbs_extreme_iff_ergodic` | `ν₃ = (δ_{M₁}+δ_{M₂}+δ_{M₃})/3` | in the set, a proper convex combination of members, and the invariant event `{M = M₁}` has mass `1/3`: neither extreme nor ergodic | consistent | none |
| 14 | `slope` | `δ_{M_k}`; `ν₃`; `ρ` | `(1,0), (0,1), (0,0)`; `(1/3,1/3)`; `(s,t) ↦ (1−s−t, s)` sends `(1,0) ↦ (0,1)` | holds | none |
| 15 | `slopeEdge_ergodicGibbs_equiv` | `s = 0`, `s = 1`; translation direction | `{δ_{M₃}} ↔ {δ_{0̄}}`, `{δ_{M₁}} ↔ {δ_{1̄}}`; `rowCode(τ_{e₁}ω)(x) = ω((x−1,0),1) = (σ rowCode ω)(x)` with `σε = ε(·−1)` | holds | Lean form stated in README |
| 16 | `two_ergodicGibbs_of_slopeEdge` | `s = 1/2`; corner `(1,0)` | `P(ε₀=ε₁=1)`: `1/4` under `Bern(1/2)` against `3/8` under `β_{1/2}`; at the corner only `δ_{M₁}`, so corners are excluded | holds | none |
| 17 | `IsTorusTiling`, `heightChange` | 1×1; 1×2; 2×2 | `(1,0),(0,1),(0,0)`; `(0,0),(1,0),(0,2)` once each and `(0,1)` twice; `(0,0):1, (1,0):2, (0,1):2, (2,0):1, (0,2):1, (1,1):2` | holds | none |
| 18 | `torusMeasure` | `n = 2`, `(1/2,0)`; `n = 0` | height change `(1,0)`, 2 tilings of mass `1/2`; for `n = 0` the set is all plane tilings (infinite), so `uniformOn = 0`, a junk value met at most once along a strictly increasing `φ` | holds | none |
| 19 | `torusLimit_mem_gibbsInvariant_slope` | `(1/2,0)` | cylinder masses `C(2m−k, m−j)/C(2m,m) → 2^{−k}`, so the limit is `Bern(1/2)` rows, Gibbs with slope `(1/2,0)`; the empty cylinder gives mass `1` | holds | cylinder form |
| 20 | `twistedKasteleyn`, `torus_partitionFunction_eq` | all `(n₁,n₂) ∈ {1,2,3}²`, unit and random signed periodic weights (18 cases); 1×2 with `w((0,0),3) = −1` | all 18 equal; unit 2×2 dets `(−3,5,5,5)`, `Z = 9`; unit 3×3 `(0,28,28,−28)`, `Z = 42`; 1×2 unit `(3,5,−1,1)` pins `a` to the vertical seam; signed 1×2: dets `(−1,1,−1,1)`, `ε₁₀ = −1`, `(−1+1+1+1)/2 = 1 = Z` | holds for real weights | widened from positive weights, Check added |
| 21 | `incompleteBetaKernel` | `ξ = e^{πi/3}`; slope `(0.3, 0.45)`; diagonal crossing at `−1` | `K(v;v) = 0.333333`; vertical pair `−0.333333` and `0.0576689 = 1/3 − √3/(2π)`; `K(v;v) = 0.300000`, `K((0,0);(0,1)) = −0.250000 = −(1−s−t)`, `K((0,1);(0,0)) = −0.0597019 = s − Im ξ/π`, rows `m = 1,2,3`: `0.359702, 0.295322, 0.089354 = \|ξ\|^m sin(πsm)/(πm)`; crossing at `−1` gives `−0.700000 = −(1−s)`, so the side of crossing matters | holds | none |
| 22 | `incompleteBetaProcess_exists_unique` | `e^{πi/3}`; `ξ(0.3,0.45)`; `m = 0` | slope `(1/3,1/3)`; `arg ξ/π = 0.3`, `−arg(1−ξ)/π = 0.45`; two-point `det = 0.130334 = 2/9 − √3/(6π)`; empty determinant `1 = μ(univ)` | holds | none |
| 23 | `LocalConvergence` sign | `R_N = R₆ + v_N` | `μ_N{ω(v_N + e) = σ e}` is the hexagon law at the origin; `−v_N` in place of `+v_N` would make the window recede | holds | none |
| 24 | `localLimit_isLozengeGibbs` | restrictions of `M_c` (height `min(0,x,y)`) | the point masses converge to `δ_{M_c}`, not Gibbs (completion set of size 2 at the hexagon round `0`, one point carrying mass): the uniform hypothesis is needed | holds | none |
| 25 | `Subshift` closedness | finitely supported configurations | `1_{[0,n]} → 1_{[0,∞)}` leaves the set | `isClosed` needed | none |

**Context.** No declaration uses section variables. Every binder is in the declaration's own
signature. The `#check @name` run over all 57 declarations, in a scratch copy of the file, shows
every hypothesis in place: `Infinite Γ`, `Countable Γ`, `Countable I`, properness,
`Finite S`, `DiscreteTopology S` and `DiscreteMeasurableSpace S` in the two 4.6 theorems; tileability
and positivity in 3.3; `NeZero` and periodicity in 8.3; `0 < ξ.im` in 9.7. A `pp.explicit` check
confirms the details the pretty-printer hides. `Specification.kernel Λ` has source σ-algebra
`Subshift.exterior X Λ` and target the subtype σ-algebra of `MeasurableSpace.pi`. The kernel
composition in `comp_eq` reads `γ_Λ` through `Kernel.comap id (measurable_id'' …)`. Configurations
translate as stated: `(w +ᵥ ω)(w +ᵥ e) = ω e`, checked by a proved `example` in scratch. Between
the first and the final run the elaborated types are identical.

## Elaboration

Command: `lake env lean <absolute path of Suggested.lean>` from the content checkout. Exit 0;
17 messages in total, all `declaration uses 'sorry'` (one per theorem), and no other message. The
only Tau Ceti import is `TauCeti.MeasureTheory.Group.ErgodicExtreme`, whose object file was
present. The file starts with `module`, then `import Mathlib`. It has no `set_option`, no `lemma`,
no sorry'd definition and no proved `example`.

## Dependency check

```text
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is listed at line 412 of the merge order.
`roadmaps resolve` on the final README finds no cross-roadmap citation and no Lean name found
nowhere.

## Review notes carried forward

- Both package-stage remarks of review ~7 are applied (see "Decisions").
- Two questions for human reviewers remain theirs: the licence of `gorin2021` (author's
  pre-publication copy, `licence_class = "author-page"`) and whether to commission
  DimerModelsAndLozengeTilingsPartII. The README names that Part II as the home of the excluded
  material.
- The source issues recorded by review ~7 (gorin2021 Lemma 4.7 and Theorem 4.10, kenyon2009
  Theorem 6 and Section 5.4, aggarwal2023 after Definition 1.2) remain corrected in README 9.2,
  8.4, 6.4 and 9.7 as in the design.

No text read during the job asked for any action outside it.
