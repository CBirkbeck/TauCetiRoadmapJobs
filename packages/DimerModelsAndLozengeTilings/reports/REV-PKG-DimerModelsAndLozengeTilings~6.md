<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6901223307 -->
Review (claude) of 3e57c8c

Verdict: accepted

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The one finding of round 5 is repaired, the repair introduced nothing, and an
independent pass over `packages/DimerModelsAndLozengeTilings/README.md` and `Suggested.lean`
(brute-force enumerations and numerical evaluations of this round, below) found no statement that
is false, vacuous, unowned or overclaimed. The elaboration passes with `sorry` as the only warning
and the dependency check reports no problem. No supplier gap is declared, so the acceptance is
unconditional.

## Round 5 findings, one by one

- **F01 (a gloss in 9.1 dropped the factor `1/π` and shadowed a source sentence): repaired.**
  README 9.1, lines 1860–1862, now reads: "Angles: `w₁G_w(−e₂) = θ₁/π`, `w₂G_w(e₁) = θ₂/π`,
  `w₃G_w(0) = θ₃/π`, where `θ_k` is the angle opposite the side `w_k` in the triangle with sides
  `w₁, w₂, w₃` (gorin2021 Theorem 6.1, lines 2256–2279; kenyon2009 lines 976–1007)." The clause
  "the density of a lozenge is the angle…" is gone; nothing else in the bullet changed.
- **Adversarial pass on the changed bullet.** Recomputed this round with the `φ`-integral of `G_w`
  done by residues and a 40,000-point midpoint rule in `θ`: at slope `(0.3, 0.45)`,
  `w = (sin 0.3π, sin 0.45π, sin 0.25π)`, the three values are `0.30000`, `0.45000`, `0.25000`
  (sum `1`); at `(0.5, 0.25)` they are `0.50000`, `0.25000`, `0.25000`; at `(1/3,1/3)` all are
  `0.3333`. The row formula of the same bullet agrees with 9.6 and 9.7(a): for displacement `m`
  it is `(−1)^m |ξ|^{−m} · |ξ|^m sin(πsm)/(πm)`.
- **The repaired pattern elsewhere.** Citations followed by a colon gloss: the Conventions bullet
  on Gorin's height (README line 180; gorin2021 lines 447–453 read: `+1` along a lozenge side,
  `−2` across, as glossed) and the bullet on type-1 positions (README lines 256–257; aggarwal2023
  lines 463–464 read: with Aggarwal's type-1 vertices `(x,y),(x,y+1),(x+1,y+2),(x+1,y+1)` the inner
  edge is `((x,y+1),1)` and the centre is `(x+1/2, y+1)`, as glossed). Both are true and in the
  roadmap's own words. No other gloss of a theorem in words was found.

## Verified sound

**Elaboration.** `lake env lean` on `packages/DimerModelsAndLozengeTilings/Suggested.lean`, run from
the content repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184,
198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message. Header:
`module`, `import Mathlib`, `import TauCeti.MeasureTheory.Group.ErgodicExtreme` (used by
`Specification.gibbsInvariant` and the two Layer 4 theorems); 57 of the 201 `Suggested.lean` files
on main open with `module` in the same way. No `set_option`, `#eval`, `#print`, `#synth`, `opaque`,
`lemma` keyword, `example`, `True` placeholder or sorried data; longest line 100 characters; every
declaration and instance has a docstring.

**Signatures.** The worker's elaborated types of the 57 declarations (35 `def`, 1 `abbrev`, 4
`structure`, 17 `theorem`) were compared with the README statements: the two Layer 4 theorems carry
`[Countable Γ] [Infinite Γ] [Countable I] [DecidableEq I] [Finite S] [DiscreteTopology S]
[DiscreteMeasurableSpace S]`, properness, `X`, `γ` and `γ.IsEquivariant` in their own signatures;
`torus_partitionFunction_eq` carries both `NeZero` instances and periodicity of `w`. The file has
no `variable` line, so no binder can be lost. README and Lean generality agree for every theorem.

**One-tactic probe, all 17 sorried theorems.** Each `sorry` replaced, on a scratch copy, by
`first | rfl | (simp; done) | infer_instance | (constructor <;> simp; done) | (intros; simp_all; done) | decide | trivial | (exact?; done)`:
17 of 17 fail at the last alternative. No padding: no boundary-case theorem, no mirrored Check, no
value computation, and each of the 40 definitions and structures is used by a headline statement.

**Headline theorems (README lines 18–28) against `Suggested.lean`.** 1.5 `tilingSubgraph_bijOn`;
2.5 `tilingOfHeight_bijOn`; 2.8 `flip_connected`; 2.9 `thurston_tileable_iff`; 3.2
`partitionFunction_eq_abs_det`; 3.3 `lozenge_correlation_eq_det`; 4.6 `gibbsInvariant_isExtreme`,
`gibbsInvariant_extreme_iff_ergodic`; 5.4 `lozengeGibbsInvariant_isExtreme`,
`lozengeGibbs_extreme_iff_ergodic`; 6.3 `slopeEdge_ergodicGibbs_equiv`,
`two_ergodicGibbs_of_slopeEdge`; 7.3 `torusLimit_mem_gibbsInvariant_slope`; 8.3
`torus_partitionFunction_eq`; 9.5 `exists_ergodicGibbs_of_slope`; 9.7
`incompleteBetaProcess_exists_unique`; 10.2 `localLimit_isLozengeGibbs`. 5.3 is named in the module
docstring with its reason (its statement needs the dimer specification of 5.2, a constructed family
of kernels, which cannot be given as data without proofs); it is 4.6 specialised, and both 4.6 and
its lozenge instance are stated. No headline goes through a stand-in; each names the roadmap's
objects.

**Names and shape.** 180 backticked identifiers of the README resolved by script: every one is a
declaration of `Suggested.lean`, a declaration found in the pinned Mathlib or Tau Ceti, or
mathematical notation defined in the text (`R_ring`, `R_strip`, the field `isWhite`); all 57 Lean
names occur in the README; all 63 backticked library file paths exist at the pins. 51 numbered
targets, each with at least three Checks and a `*Needs:*` line; ten layers, each ending with
Examples and Dependencies. Pattern search over both files for LaTeX delimiters, pull-request
numbers, dates, machine paths, HTML anchors, round labels, "removed", "optional", "deferred",
"current", "follows <source>": no hit. No layer is named after a source.

**Remarks that need no change.** (i) `torusMeasure 0 s t = 0` (the set is infinite and
`uniformOn` of an infinite set is `0`); a strictly increasing `φ` meets `0` at most once, so 7.3
is unaffected. (ii) An empty subshift makes both sets of `gibbsInvariant_isExtreme` empty. (iii)
The bounds `0 ≤ s ≤ 1` of `slopeEdge_ergodicGibbs_equiv` are not needed for truth (both sets are
empty outside them); harmless. (iv) `sources.toml` line 30 says "proposed Part II" inside a
locator; the README does not.

### Adversarial table (values computed this round)

All values below were computed in this round by scripts written for it (exact rational arithmetic
for the enumerations, numerical quadrature for the kernels), independently of the earlier rounds.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 1.2 `hexGraph`, 1.4 `IsTiling` | unit hexagon; `{W(0)}`; `W(0) ∪ B(1,1)` | hexagon: exactly 2 tilings, `{(0,3),((−1,0),1),((0,−1),2)}` and `{(0,1),(0,2),((−1,−1),3)}`; single face: 0; pinched pair: 0 | as README 1.4 |
| 1.5 `tilingSubgraph_bijOn` | `R = ∅`; injectivity; surjectivity | `∅`: one tiling `M = ∅` (edges need both faces in `R`), one perfect matching of the empty graph; two tilings differing at `e` differ on the adjacency of the two faces of `e`, which share no other edge; a matched pair's shared edge lies in exactly those two faces | true |
| 2.1 `IsSimplyConnectedRegion` | hexagon; `R_ring`; five faces at `0` without `W(0)` | Euler characteristic `V − E + F` with connected edge graph: `7−12+6 = 1`; ring `12−24+12 = 0`, not simply connected; five faces `1` | as README 2.1, 2.3 |
| 2.2, 2.5 `tilingOfHeight_bijOn` | increments round `W(v)`; `H = x+y`; `min(0,x,y)` | `(a,b,a+b) ∈ {(0,0,0),(1,0,1),(0,1,1)}`: one edge each; `e₃`-increment `2`, excluded; `min(0,x,y)`: increments in `{0,1}`, `H(e_k) = 0`, `H(−e_k) = −1` | true |
| 2.3 holes | `Q = {W(0)}` in `R_ring` | the two ring tilings `T`, `T'` of README 3.2 are the only ones; region not simply connected | true |
| 2.7 boundary graph | all simply connected regions in a `3×3` window | 88,765 regions, boundary graph connected in every one | true |
| 2.8 `flip_connected` (Lean `IsFlip`) | the same 88,765 regions (4,538 tileable) | flip graph on the tilings connected in every tileable one; hexagon: `T_a ↔ T_b` at `v = 0` | true |
| 2.9 `thurston_tileable_iff` | the same 88,765 regions; `R₆'` | "`h` with neutral boundary increments and `h(u') − h(u) ≤ min positiveSteps`" holds iff tileable in all 88,765; `R₆'`: simply connected, 3+3 faces, 0 tilings, criterion fails | true |
| 3.2 `partitionFunction_eq_abs_det` | the same regions, random integer weights in `[1,5]`; `R_ring` | balanced regions: `\|det K\| = Σ_M ∏ w` exactly in every case; unbalanced: 0 tilings; ring (excluded): 2 tilings | true; simple connectivity needed |
| 3.3 `lozenge_correlation_eq_det` | hexagon; `n = 0`; repeated face | `K = [[1,0,1],[1,1,0],[0,1,1]]`, `K⁻¹ = ½[[1,1,−1],[−1,1,1],[1,−1,1]]`, single edge `1·½`, pair `det[[½,½],[−½,½]] = ½`; `n=0`: `Z/Z = 1 = 1·1`; equal columns: `0` | true |
| 4.2, 4.6 face property | Borel–Cantelli step; density step; empty `X` | `μ(AΔγ_kC_k) = μ(AΔC_k) < 2^{−k}`; `∫γ_Λ(C\|·)f dμ = ∫γ_Λ(f1_C\|·)dμ = ∫f1_C dμ` for tail-measurable `f`; ambient set `∅` | true |
| 5.4 `IsLozengeGibbs` | swap on `F` inside a window `E`; `F ⊆ E` | a face meeting `F` has its three edges in `E`, so the swapped configuration has one edge on it; taking `e' = e` in the Lean clause gives `F ⊆ E` | cylinder form equals the DLR form |
| 6.1 slope, rotation | `ρ(x,y) = (−y,x−y)` on `e₁,e₂,e₃`; `ρ³`; `δ_{M₁}` | `e₂`, `−e₃`, `−e₁`; `ρ²(x,y) = (y−x,−x)`, `ρ³ = id`; slope `(1,0) ↦ (1−1−0, 1) = (0,1)` | true |
| 6.3 `slopeEdge_ergodicGibbs_equiv` | no type-2 edge ⇒ column-constant; intertwining; `s = 0` | `W(x,y)∋(x,y),3 ⇒ W(x,y+1)∋(x,y+1),3` and likewise for type 1; `rowCode(e₁ +ᵥ ω)(x) = ω((x−1,0),1)`; `s=0`: `δ_{M₃} ↦ δ_0` | true |
| 6.3 `two_ergodicGibbs_of_slopeEdge` | `β_s` against `Bern(s)` | `P(ε₀=ε₁=1)`: `(s+s²)/2` against `s²`; `3/8` and `1/4` at `s = ½` | distinct for `0<s<1` |
| 6.4 | `ν₃` | `μ ≤ 2ν₃` forces `μ = Σa_kδ_{M_k}`, slope `(a₁,a₂) = (⅓,⅓)` | extreme in the fibre, not ergodic |
| 7.1–7.2 | tori `1×1`, `1×2`, `2×2`; floor tiling | 3, 5, 9 torus tilings; `2×2` by height change `(0,0):1, (1,0):2, (0,1):2, (2,0):1, (0,2):1, (1,1):2`; `⌊ns⌋+⌊nt⌋ ≤ n` gives increments in `{0,1}` | as README |
| 7.3 `torusLimit_mem_gibbsInvariant_slope` | mass; slope; periodic swap | empty cylinder: mass `1`; `⌊ns⌋/n → s`; for large `n` the translates of `F` are disjoint and a row of the torus is untouched, so `h₁`, `h₂` are unchanged | true |
| 8.1 `twistedKasteleyn` (Lean formula transliterated) | unit weights, `(a,b) = 00,01,10,11` | `1×1`: `3,1,1,−1`; `1×2`: `3,5,−1,1`; `2×1`: `3,−1,5,1`; `2×2`: `−3,5,5,5`; `3×3`: `0,28,28,−28` | convention pinned by `1×2` against `2×1` |
| 8.2 sign formula | every torus tiling of 13 sizes up to `4×3`, all four twists | 1,696 cases: permutation sign times seam signs equals `(−1)^{h₁h₂+(n₂+1+b)h₁+(n₁+1+a)h₂}` in all | true |
| 8.3 `torus_partitionFunction_eq` | 15 sizes from `1×1` to `4×3`, unit weights and six random signed periodic weights each | unit: `3, 5, 5, 9, 9, 9, 17, 17, 42, 17, 17, 33, 33, 113, 113` tilings equal the right side; signed weights: equal in all 90 trials | true for real weights |
| 8.4 torus correlations | `3×4` torus, random positive periodic weights, 1–3 lozenges; `2×2`, weights `(2,3,5)` | 113 tilings, `Z = 6524032`, all four determinants nonzero; brute-force probability equals the four-determinant formula on every trial, shared faces included (`0`); `2×2`: `Z = 1444`, `25/38` | true |
| 9.1 kernel | `w=(1,1,1)` | `G(0,−2) = −0.05768`, `√3/(2π) − ⅓ = −0.05767` | agree |
| 9.2(a) | `θ = π/2`; general `θ ∉ πℤ` | even `n`: distance `0`, also at `n+2`; `j'−j = θ/π + O(n^{−1/2})` cannot be an integer | `n+1` is right, `n+2` is not |
| 9.6 `incompleteBetaKernel` (Lean polygonal form, Simpson rule) | diagonal; vertical pair; row pair | `K(v;v) = 0.33333, 0.30000, 0.50000` at slopes `(⅓,⅓)`, `(0.3,0.45)`, `(½,¼)`; at `(⅓,⅓)`: `K₁₂ = −0.33333`, `K₂₁ = 0.05767 = ⅓ − √3/(2π)`; row pair `0.14868 = ¼ − 1/π²` at `s = ½` | agree |
| 9.7(a) kernel identity | 15 pairs `(v_i,v_j)` at three slopes | `max \|w₁G_w(v_i−v_j−e₂) − (−1)^{…}\|ξ\|^{x_j−x_i}\|1−ξ\|^{y_i−y_j}K_ξ(v_j;v_i)\|`: `1.7e−5`, `1.2e−9`, `1.6e−9` | agree |
| 9.7 `incompleteBetaProcess_exists_unique` | slope; triple `(0,0),(1,2),(−1,1)`; vertical pair; uniqueness | `arg ξ/π`, `−arg(1−ξ)/π` return `(0.3,0.45)`, `(0.5,0.25)`; determinants `0.03421` both forms; vertical pair `0.13033 = 2/9 − √3/(6π)` and `0.07507`; two candidate vertical increments force identical rows and then an `e₃`-increment `2` when a row has a type-1 lozenge | true; (f) is the right uniqueness statement |
| 9.5 `exists_ergodicGibbs_of_slope` | `(½,¼)`; `(½,0)` | `w = (1, 0.7071, 0.7071)`, liquid, slope returned `(0.5,0.25)`; `(1,0,1)` not positive, edge by 6.3 | true |
| 10.2 `localLimit_isLozengeGibbs` | swap on `F + v_N`; `min(0,x,y)` | faces meeting `F + v_N` lie in `R_N` for large `N`, so new edges have both faces in `R_N`; non-uniform point masses converge to a non-Gibbs limit | true; uniformity used |

### Sources: the seeded sample, read at the locators

Eight texts read this round; thurston1990 and georgii2011 are settled as uncertified; the author
flagged no locator as unverified. Each locator supports the statement as written.

- 1.2: gorin2021 lines 690–700 (dual hexagonal lattice, bipartite colouring); kenyon2009 lines
  95–113 (dimer coverings, honeycomb).
- 1.4: aggarwal2023 lines 342–364 (dimer coverings, the three lozenge types with their vertices),
  380–383 (free tilings); gorin2021 lines 698–702.
- 2.2: gorin2021 lines 454–457 (consistency of the local rule).
- 2.3: kenyon2009 lines 360–367 (divergence-free flows dual to height functions).
- 2.8: gorin2021 lines 756–782 and footnote, lines 765–769; kenyon2009 lines 537–550;
  cohn-kenyon-propp2001 Section 1.4, heading at line 341, order, join and meet at lines 405–411.
- 2.9: gorin2021 Theorem 1.4, lines 521–526; Corollary 1.5, line 613.
- 3.3: gorin2021 Theorem 3.5, lines 1281–1288; kenyon2009 Corollary 3, lines 557–565 (with the
  Jacobi lemma); kenyon1997 Theorem 6, lines 362–373 (displayed formulas lost in the extraction).
- 6.1: aggarwal2023 lines 421–431 and 453–456; gorin2021 Definition 13.10, from line 4590; kos2006
  lines 203–205; kenyon2009 lines 829–832.
- 6.3: gorin2021 lines 4638–4642; sheffield2005 Theorem 9.5.1, lines 6195–6198; kenyon2009 line 891.
- 6.4: kenyon2009 lines 858–866 (the argument the README corrects).
- 7.2: kos2006 lines 206–213; kenyon2009 lines 860–863.
- 7.3: kenyon2009 lines 844–866; kos2006 Theorem 2.1, lines 215–220; gorin2021 lines 4689–4694.
- 8.1: gorin2021 Definition 3.9, lines 1452–1457; kenyon1997 Section 4.1, lines 380–390. Also
  read for 8.3: Theorem 3.10 and table (3.4), lines 1458–1472, proof at 1473–1504.
- 9.7: okounkov-reshetikhin2003 Definition 4 (965–968), Theorem 2 (993–1006), equation (36)
  (1076–1083); aggarwal2023 Definitions 1.2–1.3 and (1.2), lines 463–507; gorin2021 lines
  4744–4786.
- 10.2: aggarwal2023 lines 413–415 and 568–580; gorin2021 lines 4538–4541; kenyon2009 lines
  786–809.
- Headline locators outside the sample, also read: sheffield2005 Section 1.1.2 (303–342), Lemmas
  3.2.1–3.2.2 (1352–1371); kenyon1997 Theorem 2 (184–186); kenyon2009 Theorem 2 (504); gorin2021
  Theorems 2.1 (714–717), 3.1 (1218–1219), 4.11 (from 1853), 6.1 (from 2256), Corollary 6.3 (2287).

### Library declarations opened at the pins

At the lines the README gives, in the pinned Mathlib: `infinitePi_map_piCongrLeft` 494,
`cylinderEvents` 409, `measurableCylinders` 275, `Kernel.IsProper` 47,
`isProper_iff_inter_eq_indicator_mul` 57 (hypothesis `𝓑 ≤ 𝓧`, as the README says),
`IsProper.setLIntegral_eq_comp` 73, `MulSubshift` 253, `Subshift` 233, `mulShift` 150,
`arrowAddAction` 99–101 (a `def`, additive form of `arrowAction`, `(g +ᵥ F) a = F (−g +ᵥ a)`), the
`CompactSpace (ProbabilityMeasure E)` instance 176, `cylinderEventsCompl` 534,
`measure_zero_or_one_of_measurableSet_limsup_atTop` 290, `Kernel.Invariant` 39,
`exists_measure_symmDiff_lt_of_generateFrom_isSetRing` 86, `isSetRing_measurableCylinders` 57,
`ProbabilityMeasure.tendsto_measure_of_isClopen_of_tendsto` and
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem` (`Portmanteau.lean` 362, 829). In the
pinned Tau Ceti: `invariantMeasuresOfMeasureUnivEq` (`MeasureTheory/Group/ErgodicExtreme.lean` 75:
invariance and total mass `c`, nothing else), `ErgodicSMul.iff_mem_extremePoints` (239, for a
countable group and a probability measure), `ergodicSMul_iff_forall_smul_invariant` 68,
`exists_smul_invariant_ae_eq` 53, `isExtreme_setOf_measure_eq_zero` (`Measure/Face.lean` 40),
`tailProcess` 47, `tailProcess_eq_iInf_tailFamily` 64, `arrayTail` 43,
`det_submatrix_comp_inr_eq_sign_mul_det_mul_det_submatrix_comp_inl_nonsing_inv`
(`ComplementaryMinor.lean` 160, statement read: `IsUnit A.det`, `e : m ⊕ p ≃ n`, `σ τ : Perm n`),
`det_mul_det_submatrix_adjugate` (`Jacobi.lean` 54), `TauCeti.IsPerfectMatching`
(`Combinatorics/Enumerative/PerfectMatching.lean` 97). The remaining cited names were resolved by
script (above). Duplication by object: Kasteleyn, lozenge, dimer, height function of a tiling and
Gibbs specification occur in neither pinned library; no target is proved at the pin. The one
same-name lead, Mathlib's `slope` (`Mathlib/LinearAlgebra/AffineSpace/Slope.lean`, a difference
quotient), is a different object in the root namespace; this file's `slope` is namespaced.

### Cross-roadmap citations resolved

On main: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (README line 2788: finite `S`, at least
two positive weights, as the scope paragraph says); FactorRigidity §8.3 (line 767, the general
standard base); TensorProductCombinatorics §1.1 (line 465); RandomMatrices §8.3 and §8.4 (lines
1183, 1253, continuous kernels); GraphConnectivityAndFlows §6.7 (line 753). At its open head:
ClassicalErgodicTheory §0.3 item 2 (Bernoulli action of a countable discrete group on `G → α`) and
§1.4 item 2 (mixing). All are scope deferrals: no `*Needs:*` line names a roadmap, and the package
declares no gap. The worker's resolution lists no citation and no Lean name found nowhere.

### Dependency check

    depcheck: 243 roadmaps, 2246 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

### Duplication and overlap audit

Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, none is
defined only by an open revision, and main has no folder of this name (no second copy). Searches
over the open heads and main, by object: Kasteleyn (only the Potts–Fortuin–Kasteleyn identity of
TemperleyLiebOperatorAlgebras); lozenge, dimer, discrete sine, Thurston's tiling criterion (no
match); height function (arithmetic heights and Morse functions only); Gibbs
(ClassicalErgodicTheory §8.4: the Bowen–Gibbs property of an equilibrium state and Bowen's
specification property of a map, neither a DLR specification; PointProcesses lists infinite-volume
Gibbs processes and determinantal processes as outside its scope); tail σ-algebra (Exchangeability,
ProbabilisticAndMetricNumberTheory: `ℕ`-indexed, as Tau Ceti's `tailProcess`, which 4.1 cites and
identifies). No declaration of `Suggested.lean` has the fully qualified name of a declaration in a
roadmap I could read. Ownership against open pull requests was checked through the roadmaps tool
at the open heads. Maintainer notes: none were left.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards, RandomGraphs, MathematicalStatisticsFoundations, Exchangeability, ProbabilisticAndMetricNumberTheory, StochasticCalculus; Bernoulli action of a countable group on `G → α`: VonNeumannAlgebras on main for finite `S` (also built by the open ClassicalErgodicTheory), this roadmap keeps the proper-action variant 4.3 and says how it differs; `ℕ`-indexed tail σ-algebra: Tau Ceti `tailProcess`, cited; nothing else shared.

### Copyright, licences and scope

Wording: the fifteen sampled targets and eight further passages (the height convention, the route
of 3.2, the face statement of 4.6, the Gibbs definition of 4.5, the cylinder property of 5.2, 7.3,
9.2, and the docstring of `IsLozengeGibbs`) were set beside the texts at their locators, and both
files were scanned against the eight readable texts for shared runs of seven words: the hits are
bibliographic titles, one formula, and three generic phrases ("is the absolute value of the
determinant of the", "is a translation invariant Gibbs measure of slope", "the Borel algebra of the
product topology"). Arrangement: gorin2021 has the largest share, 47 of 159 occurrences of a source
key before the References. Its contents (17 lectures) beside the layers: Layers 1–2 draw on
Lecture 1, Layer 3 on Lecture 2 and Sections 3.1–3.2, Layer 4 on nothing there, Layers 5–6 on
Lecture 13, Layers 7–8 on Section 3.3, Layer 9 on Lectures 4, 6 and 13, Layer 10 on Sections
13.1–13.2; Lectures 5, 7–12 and 14–17 are not used. No run of layers maps one to one onto a run of
lectures, and the order kept is forced by the dependency lines (3 needs 2.8; 5 needs 4; 6 needs 5;
7 needs 4–6; 8 needs 7; 9 needs 4–8; 10 needs 5 and 9). Reuse: table (3.4) of gorin2021 is stated
as a rule and verified here by enumeration; the hexagon matrix of 3.1 is noted for the humans.

Source independence: 23 passages compared with 8 sources, none shared; largest share gorin2021, 47 of 159 locators; contents compared with gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011: recorded as uncertified, cited by locator only; not read.
- kenyon1997 Theorem 6 and Lemmas 7–8: the sentences are readable, the displayed formulas are lost
  in the extraction; 3.3, 8.3 and 8.4 were checked by enumeration instead.
- gorin2021 Definition 3.9 refers to a figure for the sides of the fundamental domain; the pairing
  of `a` with `n₁` was fixed by the `1×2` against `2×1` computation, not from the figure.
- 4.3, 9.3 (the limit itself), 9.4 and the weak-closedness part of 4.6: no finite computation
  decides them; the routes were read and their inputs resolved at the pins.
- `flip_connected`, `thurston_tileable_iff` and Kasteleyn's theorem beyond a `3×3` window, and 8.2,
  8.3 beyond the `4×3` torus: not enumerated.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, line 1766: the source says that for large `n` either `n` or `n + 2` lies in `W_θ`; it should be `n` or `n + 1`, since for `θ = π/2` no even `n` lies in `W_θ`; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, lines 836–839 and 858–866: the source says every slope of the closed triangle carries a unique ergodic Gibbs measure and infers ergodicity from fibre extremality; it should restrict uniqueness to interior slopes, and fibre-extreme measures need not be ergodic; affects a stated result.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require a type-1 lozenge in one of every two consecutive rows; affects nothing.

## For the human reviewers

- **Licence.** gorin2021 was read from the author's page as a pre-publication copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`); the README cites the printed numbering.
- **Licence.** The `3 × 3` unit-hexagon matrix and column-swap remark of README 3.1 (lines 955–957) coincide with the worked example of gorin2021 lines 722–744; the README cites it and adds type weights.
- **Scope.** Interior uniqueness, the variational principle and Aggarwal's theorem are left to DimerModelsAndLozengeTilingsPartII (README lines 129–137, 2133–2137); no roadmap on main, open pull request or board package has that name.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e57c8cf4bf3ee98b2839a5e702e346a8d5b816f", "job": "REV-PKG-DimerModelsAndLozengeTilings~6", "model": "fable", "worker": "chris-x88"} -->
