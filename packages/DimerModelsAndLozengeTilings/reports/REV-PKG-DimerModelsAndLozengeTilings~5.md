<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6900468733 -->
Review (claude) of 493a17d

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a gloss in 9.1 drops the factor `1/π` and shadows a sentence of the source

   - **Location.** `packages/DimerModelsAndLozengeTilings/README.md` lines 1861–1862, in 9.1, API,
     "Angles": "(gorin2021 Theorem 6.1, lines 2256–2279: the density of a lozenge is the angle
     opposite the side of its weight; kenyon2009 lines 976–1007)".
   - **Claim.** The gloss states Theorem 6.1 in words.
   - **Witness.** As a statement it is off by `π`: for `w = (1,1,1)` the angle is `π/3 ≈ 1.047`, the
     density `1/3` (the same bullet says `θ_k/π`). It follows gorin2021 lines 2278–2279: 6
     consecutive words shared, and all 14 of its words occur there in the same order.
   - **Repair.** Delete the gloss; the citation becomes "(gorin2021 Theorem 6.1, lines 2256–2279;
     kenyon2009 lines 976–1007)". The bullet already states the theorem as `w₁G_w(−e₂) = θ₁/π`,
     `w₂G_w(e₁) = θ₂/π`, `w₃G_w(0) = θ₃/π`. Tested on the instance: with the gloss gone the bullet
     gives `1/3` at `w = (1,1,1)`, the value of the first Check of 9.1. Rated P3 and not as a wording
     P2: the clause is fourteen words, inside the allowance for a statement of a dozen words, and a
     scan of both files against the eight readable texts finds no shared run of seven words of prose.

One finding, P3 (0 blocking). The one finding of round 4 is repaired. No statement of
`packages/DimerModelsAndLozengeTilings/README.md` or `Suggested.lean` was found false, vacuous or
unowned; the elaboration passes with `sorry` as the only warning; the dependency check reports no
problem. The repair asked for is the deletion of one clause of README 9.1.

## Round 4 findings, one by one

- **F01 (target 2.4 has no locator while the manifest lists it under aggarwal2023): repaired.**
  README 2.4, lines 744–746, now reads: "Thus for every domain in Aggarwal's sense, an induced
  subgraph with vertex set `V` whose union of faces `F(Faces(V))` is simply connected (aggarwal2023
  lines 338–341), the region `Faces(V)` of 1.3 is simply connected here." aggarwal2023 lines
  338–341 were read: they define `V(R)` and `F(R)` for an induced subgraph, simple connectivity of
  `R` through `F(R)`, a domain, and its boundary. The repair's change of the suggested wording is
  right: `IsSimplyConnectedRegion` is a predicate on sets of faces, so the sentence has to pass
  through `Faces(V)`.
- **Adversarial pass on the changed sentence.** `V = {(0,0),(1,0),(1,1),(0,1)}`: the triangles
  with all vertices in `V` are `W(0)`, `B(0)`, so Aggarwal's `F(R)` and `F(Faces(V))` are both the
  unit square, convex; `{W(0)} ∪ {B(0)}` is simply connected by shelling (shared edge `(0,3)`, new
  vertex `(0,1)`). `V = {(0,0),(1,0)}`: `Faces(V) = ∅`, `F = ∅`, which fails Mathlib's
  `IsSimplyConnected` (it includes nonemptiness), so nothing is claimed. `V = ℤ²`: `F = ℝ²`, and
  the conclusion is 2.2. The sentence is true and one-directional, as 2.4 is.
- **The repaired pattern elsewhere.** My own scan (51 numbered sections against the ten manifest
  keys, ranges of `cited_for` expanded against the README headings): every section names a key;
  for each of the ten records the sections naming the key and the sections listed agree in both
  directions (missing: none; extra: none).

## Verified sound

**Elaboration.** `lake env lean` on `packages/DimerModelsAndLozengeTilings/Suggested.lean`, run
from the content repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168,
184, 198, 234, 245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message.
Imports: `import Mathlib` and `TauCeti.MeasureTheory.Group.ErgodicExtreme` (used by
`Specification.gibbsInvariant` and the two Layer 4 theorems). No `set_option`, `#eval`, `#print`,
`#synth`, `lemma`, `opaque`, `True` placeholder, sorried data or `example`; no line over 100
characters; a docstring on every declaration, the four instances included.

**Signatures.** `#check @name` for all 57 named declarations (35 `def`, 1 `abbrev`, 4 `structure`,
17 `theorem`) appended to a scratch copy and elaborated once: exit 0, no error. The elaborated
types agree with the README statements; the two Layer 4 theorems carry `[Countable Γ] [Infinite Γ]
[Countable I] [DecidableEq I] [Finite S] [DiscreteTopology S] [DiscreteMeasurableSpace S]`,
properness, `X`, `γ` and `γ.IsEquivariant` in their own signatures; `torus_partitionFunction_eq`
carries both `NeZero` instances and the periodicity of `w`. Nothing lost.

**One-tactic probe, all 17 sorried theorems.** Each `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | (constructor <;> simp; done) | (intros; simp_all; done) | decide | trivial | (exact?; done)`
on a scratch copy: 17 of 17 fail, each at the last alternative (`exact?` could not close the
goal). No padding: no boundary-case theorem, no mirrored Check, no value computation; each of the
40 definitions and structures is used by a headline statement.

**Headline theorems (README lines 18–28) against `Suggested.lean`.** 1.5 `tilingSubgraph_bijOn`;
2.5 `tilingOfHeight_bijOn`; 2.8 `flip_connected`; 2.9 `thurston_tileable_iff`; 3.2
`partitionFunction_eq_abs_det`; 3.3 `lozenge_correlation_eq_det`; 4.6 `gibbsInvariant_isExtreme`,
`gibbsInvariant_extreme_iff_ergodic`; 5.4 `lozengeGibbsInvariant_isExtreme`,
`lozengeGibbs_extreme_iff_ergodic`; 6.3 `slopeEdge_ergodicGibbs_equiv`,
`two_ergodicGibbs_of_slopeEdge`; 7.3 `torusLimit_mem_gibbsInvariant_slope`; 8.3
`torus_partitionFunction_eq`; 9.5 `exists_ergodicGibbs_of_slope`; 9.7
`incompleteBetaProcess_exists_unique`; 10.2 `localLimit_isLozengeGibbs`. 5.3 is named in the module
docstring as not stated separately, with its reason (the dimer specification is a constructed
family of kernels). Every statable headline is stated; none goes through a stand-in; each names the
roadmap's objects.

**Names and shape.** The worker's resolution lists no Lean name and no cross-roadmap citation found
nowhere; I confirmed the 57 names occur in the README. 51 numbered targets, each with at least
three Checks and a `*Needs:*` line (counted by script: none below three, none without `*Needs:*`);
ten layers, each ending with Examples and Dependencies. No LaTeX delimiters, pull-request numbers,
dates, machine paths, HTML anchors, round labels or "follows <source>" sentences (pattern search
over both files: no hit); "lemma" occurs three times, as an English word. No layer is named after a
source.

**Remarks that need no change.** (i) `torusMeasure 0 s t` is `0` (the set is infinite); a strictly
increasing `φ` meets `0` at most once, so `torusLimit_mem_gibbsInvariant_slope` is unaffected.
(ii) An empty subshift makes the ambient set of `gibbsInvariant_isExtreme` empty; the statement
holds. (iii) `sources.toml` line 30 says "proposed Part II" inside a locator; the README does not.

### Adversarial table (values computed this round)

Rows for the fifteen sampled targets, the headline theorems and the targets of the repair and of
R01. Values are my own hand computations of this round; where a row leans on round 4's
enumerations, it says so.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions: `ρ`, heights | `ρ` on `e₁,e₂,e₃`; `M₁,M₂,M₃` | `ρ(1,0)=(0,1)`, `ρ(0,1)=(−1,−1)`, `ρ(1,1)=(−1,0)`; `ρ⁻¹w=(w₂−w₁,−w₁)`; `H_{M₁}`: `w₂`; `H_{M₂}`: `−w₁+w₁=0`; `H_{M₃}`: `w₁` | agree with `ρM₁=M₂`, `ρM₂=M₃`, `ρM₃=M₁` |
| Conventions: Gorin's height `x+y−3H` | steps `e₁`, `e₂`, `−e₃` in and out of `M` | `1−3[(v,1)∈M]`: `+1`, `−2`; along `−e₃`: `−2+3(1−[(v,3)∈M])`: `+1`, `−2` | gorin2021 lines 447–453 |
| Conventions: restricted Leibniz sum | `A=[[1,2,0],[0,1,3],[4,0,1]]`, rows `(0,2)`, columns `(1,0)` | `det A=1+24=25`; cofactors give `25A⁻¹=[[1,−2,6],[12,1,−3],[−4,8,1]]`; `det[[12,−3],[1,6]]=75`, `75/625=3/25`; `25·3/25=3=A(1,2)` | agree |
| 1.1 faces | type-1 lozenge at `v`; `(0,1)` in `B(0)` | `B(v−e₂)={v−e₂,v,v+e₁}`; `(1,0)∉B(0)` | true |
| 1.2 `hexGraph` | neighbours of `W(0)`; the 6-cycle at `0` | `B(0)`, `B(−e₂)`, `B(e₁)` across `(0,3)`, `(0,1)`, `(e₁,2)`; `T_a` meets each of the six faces in exactly one edge | true |
| 1.3 regions | `{W(0)}`, hexagon; boundary-vertex criterion | `3=2·0+3`, `18=2·6+6`; a vertex with a face outside `R` and one inside has two consecutive faces in and out, whose common edge passes through it | true |
| 1.5 `tilingSubgraph_bijOn` | `R=∅`; `{W(0)}`; injectivity | `M=∅` and the empty matching; none and none; an edge of `M` is the unique common edge of its two faces, both in `R` | true |
| 2.1 shelling | hexagon order `W(0),B(0),W(−e₁),B(−e₃),W(−e₃),B(−e₂)` | new vertices `(0,1)`, `(−1,0)`, `(−1,−1)`, `(0,−1)`; last face shares `((0,−1),2)` and `(0,1)` | true |
| 2.4 changed sentence | unit square; two points; `ℤ²` | `Faces={W(0),B(0)}`, convex; `Faces=∅`, hypothesis fails; `F=ℝ²` | true |
| 2.5 `tilingOfHeight_bijOn` | cochain of `M` on `W(v)` | `(1,0,·)`: `1+0=1−0`; `(0,0,1)`: `0=1−1`; `(0,1,·)`: `0+1=1` | closed, so 2.2 applies |
| 2.6 heights on regions | hexagon from `H(1,0)=0`; `R_ring` with `T` | `T_a`: `H(0)=0`, `H=0` at `(1,1)`, `(0,1)`, `−1` at `(−1,0)`, `(0,−1)`, `(−1,−1)`; `T_b`: `H(0)=−1`, the rest equal; `T` covers the 12 faces of the ring once, increments `0,0,1` round `W(0)`, sum `−1` | true; simple connectivity needed |
| 2.8 lattice and flips | hexagon; the tie-break | `H_max(0)=min(−1+1, 0+0)=0`, `H_min(0)=max(0−1, −1−0)=−1`; at a maximiser of `H−H_min` with `H` maximal, `H(v+e_k)=H(v)`; if `H(v−e_k)=H(v)` then `v−e_k` is a maximiser with the same `H` and smaller `v₁+v₂`; flipped value `H(v)−1 ≥ H_min(v)` | true |
| `flip_connected` | hexagon; `IsFlip` on a tiling of `R` | `T_a → T_b` at `v=0`; the three removed edges have their six faces in `R`; round 4 enumerated 564 tileable simply connected regions, not repeated | true |
| 2.9 `thurston_tileable_iff` | `R₆'`; `{W(0)}` | 13 edges of `R₆'` classified: 8 boundary edges all with neutral increments for the stated `h`; `h(1,1)−h(2,1)=1>0=ρ_R`; `W(0,0)`, `W(1,0)` adjacent only to `B(1,0)`; `c₀` round a triangle: `0+0≠1`; round 4 compared 52,235 regions, not repeated | true |
| 3.1 Kasteleyn matrix | hexagon, weights `(a,b,c)` | rows `[c,0,a]`, `[b,a,0]`, `[0,c,b]`; `det=c·ab+a·bc=2abc`; unit: `2` | agree; gorin2021 lines 722–744 |
| `partitionFunction_eq_abs_det` | hexagon; `R₆'`; `R_ring` | `2abc=abc+abc`; rows `[1,0,0]`, `[1,0,0]`, `[1,1,1]`, `det 0`, no tiling; ring: 12-cycle checked edge by edge, two tilings, 6-cycle odd | true; simple connectivity needed |
| `lozenge_correlation_eq_det` | hexagon; `n=0`; shared `B(0)` | `K·½[[1,1,−1],[−1,1,1],[1,−1,1]]` has first row `(1,0,0)`; `det[[½,½],[−½,½]]=½`; `n=0`: `Z/Z=1=1·1`; two equal rows: `0` | true, no absolute value |
| 4.2, 4.6(a),(b) | Borel–Cantelli step; density `f` | `μ(AΔγ_kC_k)=μ(AΔC_k)<2^{−k}`; `∫γ_Λ(C\|·)f dμ=∫γ_Λ(f1_C\|·)dμ=∫f1_C dμ`; empty `X`: ambient set `∅` | true |
| 5.1 matchings | `ℤ`; the non-locally-finite graph; `C₆` | 2 points; `M_k → {x_ny_n}`, `c`, `d` uncovered; 2 points | true |
| 5.4 `IsLozengeGibbs` | `δ_∅`; `2δ_{M₃}`; type weights | `F≠∅`: `E` holds a whole face, cylinders of tilings miss `∅`: `0=0`; mass `2`; `abc=abc` | both extra clauses needed |
| 6.1 slope | `ρ_*`; `ν₃`; Bernoulli rows | `slope(ρ_*μ)=(1−s−t,s)`: `(1,0)↦(0,1)`; `(⅓,⅓)`; `(s,0)`, type-3 density `1−s` | true |
| 6.2 corners | `(1,0)`, `(0,0)`; `δ_{M_ε}`, `ε=1_{[0,∞)}` | all direction-1 edges a.s.: `M₁`; no direction-1 or 2 edge a.s.: `M₃`; mass `1` at `(0,1)` without invariance | true |
| 6.3 `slopeEdge_ergodicGibbs_equiv` | intertwining; (b); (c) | `rowCode(e₁+ᵥω)(x)=ω((x−1,0),1)=σ(rowCode ω)(x)`; `H_{M'}−H_M` nondecreasing on verticals with equal limits, so constant, `0` at the origin; a member of `Φ₂` in `[ω]_E` swapped on `F` is a tiling, hence equal, so both cylinders are `Φ₂`-null when `ω≠ω'` | true |
| `two_ergodicGibbs_of_slopeEdge` | `β_s`; `ρ` | `P(ε₀=ε₁=1)`: `s²` against `(s+s²)/2`, `¼` and `⅜` at `½`; `(s,0)↦(1−s,s)↦(0,1−s)` | true |
| 7.1, `torusLimit_mem_gibbsInvariant_slope` | floor tiling; local change | increments `⌊τ+a/n₁⌋−⌊τ⌋∈{0,1}`, along `e₃` since `a/n₁+b/n₂≤1`; a swap on `F` leaves some row of the torus untouched, so `h₁` is unchanged; `E=∅` gives mass `1` | true |
| 8.1 `twistedKasteleyn` | `1×2`, unit weights | `K=[[1+(−1)^a,(−1)^b],[1,1+(−1)^a]]`: dets `3, 5, −1, 1` for `(a,b)=00,01,10,11` | convention pinned |
| 8.2 sign formula | all parities, `n₁,n₂` even | `Σε_{ab}s_{ab}`: `(0,0)`: `−1+3`; `(1,0)`: `1+1−1+1`; `(1,1)`: `1+1+1−1`; each `2` | true; gorin2021 lines 1478–1504 pair `a` with `n₁` as here |
| 8.3 `torus_partitionFunction_eq` | `1×2` unit; `1×2` with `w((0,0),3)=−1`; `2×2` unit | `(3+5+1+1)/2=5`; dets `−1,1,−1,1`, `(−1+1+1+1)/2=1`; eigenvalues `3,1,1,−1`, `(3+5+5+5)/2=9` | true for signed weights |
| 8.4 torus correlations | `2×2`, weights `(1,1,1)` and `(2,3,5)` | `c=(−1,1,1,3)`, `6/18=⅓`; dets `0, 68·8=544, 58·18=1044, 26·50=1300`, `Z=1444`; `c₀₁=136·(16/68+4/8)=100`, `c₁₀=261·(14/58+6/18)=150`, `c₁₁=325·(10/26+10/50)=190`, `c₀₀=10·6·4/4=60`; `5·380/2888=25/38` | agree |
| 9.1 kernel | `w=(1,1,1)`; `(1,1,3)`; `(1,1,2)` | `G(0,−2)=(√3−4π/3+2π/3)/(2π)=√3/(2π)−⅓`; `G(1,−1)=(2π)⁻¹∫_{2π/3}^{4π/3}e^{iθ}dθ=−√3/(2π)=−sin(π/3)/π`; `\|P̂\|≥1`, constant term `⅓`; partials `−i`, `i` at `(π,π)` | agree; the gloss of R01 aside |
| 9.2 good sizes | `θ=π/2` | even `n`: distance `0`, also at `n+2`; odd `n`: `π/(2n)>n^{−3/2}` | (a) with `n+1` |
| 9.6 kernel | diagonal; row; vertical pair | `arg ξ/π=s`; `(ξ^m−ξ̄^m)/(2πim)=\|ξ\|^m sin(πsm)/(πm)`; `(2πs−2π+2πt)/(2π)=−(1−s−t)`; `s−Im ξ/π` | agree |
| 9.7, `incompleteBetaProcess_exists_unique` | (a) on the diagonal, a row, a vertical pair; `m=0`; uniqueness | `s=s`; `(−1)^m sin(πsm)/(πm)` both sides; `√3/(2π)−⅓` both sides; `1=1`; two-point `1/9+(1/3)(1/3−√3/(2π))=2/9−√3/(6π)`, equal to 9.3; heights `1_{x>0}` then `1` or `y` are both height functions with `X={(0,y):y≤0}` | agree; (f) is the right uniqueness statement |
| `exists_ergodicGibbs_of_slope` | `(½,¼)`; `(½,0)` | `w=(1,√2/2,√2/2)`, `1<√2`; `w=(1,0,1)` not positive | true |
| 10.2 `localLimit_isLozengeGibbs` | swap on `F+v_N`; `min(0,x,y)` | faces meeting `F+v_N` lie in `R_N` for large `N`, so the swapped set is a tiling of `R_N`; `H(e_k)=0=H(−e_k)+1` for `k=1,2,3` | true; uniformity used |

### Sources: the seeded sample, read at the locators

Seven texts read; thurston1990 and georgii2011 are settled as uncertified; the author flagged no
locator as unverified. Each locator below supports the statement as written.

- 1.1: aggarwal2023 lines 324–337 (the lattice, its two kinds of triangle); gorin2021 lines
  405–420 (six directions).
- 1.2: gorin2021 lines 690–700 (the dual hexagonal lattice and its colouring); kenyon2009 Section
  1.1, lines 95–113 (dimer coverings, the honeycomb graph).
- 1.3: aggarwal2023 lines 338–341 (induced subgraphs, `F(R)`, domains, boundary).
- 2.6: aggarwal2023 lines 380–401 (free tilings and height functions); gorin2021 lines 511–514
  (the boundary height of a simply connected region).
- 2.8: gorin2021 lines 756–782 and footnote 1 at 765–769; kenyon2009 lines 537–550;
  cohn-kenyon-propp2001 Section 1.4 (heading at line 341; the order, join and meet at lines
  405–411).
- 2.9: gorin2021 Theorem 1.4, lines 521–526; Corollary 1.5, line 613.
- 3.1: gorin2021 lines 1199–1215 and 722–744; kenyon2009 Sections 3.1 and 3.4, lines 428–503.
- 5.1: kenyon2009 lines 96–100; gorin2021 lines 4494–4501.
- 5.4: aggarwal2023 lines 412–420; kenyon2009 lines 781–809, 825–835, 869–878; gorin2021
  Definition 13.4 (4534–4537), Definition 13.6 and Lemma 13.7 (4556–4562), Exercises 13.3 and 13.9
  (4520–4526, 4583–4585); sheffield2005 Lemma 3.2.2, lines 1367–1371, attributed there to
  Georgii's Theorem 14.15 (line 1366).
- 6.1: aggarwal2023 lines 421–431 and 453–456; gorin2021 Definition 13.10, from line 4590; kos2006
  lines 203–205; kenyon2009 lines 829–832.
- 6.2: gorin2021 Exercises 13.3 and 13.9; kenyon2009 Exercise 13, line 891.
- 6.3: gorin2021 lines 4638–4642 (extreme slopes); sheffield2005 Theorem 9.5.1, lines 6195–6198;
  kenyon2009 line 891.
- 8.3: gorin2021 Theorem 3.10 and table (3.4), lines 1458–1472, with the proof at 1473–1504;
  kenyon2009 equation (3), line 724 (odd `n`); kenyon1997 Lemma 7, lines 392–396; kos2006 lines
  657–666.
- 8.4: gorin2021 Theorem 4.10, lines 1847–1850; kos2006 Theorem 4.2, lines 658–666; kenyon1997
  Lemma 8, lines 401–406.
- 9.1: gorin2021 Theorem 4.11, lines 1853–1871, Theorem 6.1, lines 2256–2279, Exercise 6.2, lines
  2281–2286; kenyon2009 lines 958–980; kos2006 Theorem 4.3, lines 714–727, and lines 728–740.

### Library declarations opened at the pins

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the revisions of `lake-manifest.json`). Opened this
round, at the lines the README gives: `infinitePi_map_piCongrLeft` 494, `iIndepFun_infinitePi` 124,
`iIndepFun.precomp` 323, `iIndepFun_iff_iIndep` 231, `Pi.borelSpace` 645,
`exists_measure_symmDiff_lt_of_generateFrom_isSetRing` 86, `Kernel` 55, its notation 70,
`IsMarkovKernel` 138, `Kernel.comp` 50, `Kernel.comap` 152, `measurable_id''` 233,
`MeasurableSpace.comap_mono` 121, `Kernel.IsProper` 47 (a structure whose field restricts to
`𝓑 ⊓ 𝓧`; `isProper_iff_inter_eq_indicator_mul` at 57 needs `𝓑 ≤ 𝓧`, which the README states),
`IsPiSystem.comap` 106, `measure_zero_or_one_of_measurableSet_limsup_atTop` 290,
`SimpleGraph.fromRel` 135, `SimpleGraph.toSubgraph` 574, `Walk.darts` 123, `Set.BijOn` 318,
`Relation.ReflTransGen` 374, `VAddInvariantMeasure` 51, `ErgodicVAdd` 31, `Ergodic` 49,
`MeasurePreserving` 44, `Measure.real` 102, `Measure.bind` 235, `Matrix.submatrix` 457,
`IsExtreme` 63, `uniformOn` 60; Tau Ceti `arrayTail` 43, `invariantMeasuresOfMeasureUnivEq`
(`TauCeti/MeasureTheory/Group/ErgodicExtreme.lean` line 75: invariance and total mass `c`, no
other condition), `ErgodicSMul.iff_mem_extremePoints` (line 239), `isExtreme_setOf_measure_eq_zero`
(`Measure/Face.lean` line 40), `ergodic_shift_infinitePi_const`, `TauCeti.IsPerfectMatching`,
`Matrix.gibbsState`. Found by name in the files the README gives:
`tendsto_integral_exp_inner_smul_cocompact`, `IsCoveringMap.existsUnique_continuousMap_lifts`,
`Function.compactSpace`, `Pi.compactSpace`, `DiscreteMeasurableSpace.toBorelSpace`,
`Subtype.borelSpace`, `Bool.borelSpace`, `Bool.instMeasurableSpace` (`⊤`),
`IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`, `HasOuterApproxClosed`,
`SimpleGraph.Subgraph.isPerfectMatching_iff`, `SimpleGraph.LocallyFinite`, `Kernel.id`. Round 4
opened the others by line; none of those files changed (the pins are the same).

Duplication by object: no target is proved at the pin; Kasteleyn, lozenge and dimer occur in
neither pinned library apart from Mathlib's four-functions file (round 4's search, pins unchanged).

### Cross-roadmap citations resolved

On main: VonNeumannAlgebras V8.BernoulliArbitraryDiscrete (README line 2788, finite `S`, two
positive weights, as the scope paragraph says); FactorRigidity §8.3 (line 767);
TensorProductCombinatorics §1.1 (line 465); RandomMatrices §8.3 and §8.4 (lines 1183, 1253);
GraphConnectivityAndFlows §6.7 (line 753). At its open head: ClassicalErgodicTheory §0.3 item 2
(line 410, Bernoulli shifts and the action of a countable discrete group) and §1.4 item 2 (line
772, mixing). All are scope deferrals: no `*Needs:*` line names a roadmap, and the package declares
no gap (`design/plan.json`: `"gaps": []`).

### Dependency check

    depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is the last line of the merge order.

### Duplication and overlap audit

The overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no id
is defined only by an open revision, no second copy (main has no folder of this name). Searches
over the open heads and main, by object: Kasteleyn (only the Potts–Fortuin–Kasteleyn identity of
TemperleyLiebOperatorAlgebras); lozenge, dimer, discrete sine, Gibbs specification (no match);
determinantal point processes and the sine kernel (RandomMatrices §8.3–8.4, continuous kernels,
cited; PointProcesses lists them as outside its scope); Gibbs (OperatorAlgebraDynamics: KMS and
matrix Gibbs states, the quantum object the scope paragraph already separates;
ClassicalErgodicTheory §8.4–8.6: the Bowen–Gibbs property of an equilibrium state of a potential,
not a specification); tail σ-algebra (Exchangeability, ProbabilisticAndMetricNumberTheory,
StochasticCalculus: `ℕ`-indexed, as Tau Ceti's `tailProcess`); perfect matchings
(GraphConnectivityAndFlows §6.7, cited as not used). No declaration of `Suggested.lean` has the
fully qualified name of a declaration in a roadmap I could read. ClassicalErgodicTheory is not
among the 240 names of the open-pull-request list of this job; its head was read through the
roadmaps tool. Maintainer notes: none were left.

Overlap check: read ClassicalErgodicTheory, PointProcesses, MathematicalBilliards, RandomGraphs,
MathematicalStatisticsFoundations, Exchangeability, ProbabilisticAndMetricNumberTheory,
StochasticCalculus; Bernoulli action of a countable group on `G → α`: VonNeumannAlgebras on main
for finite `S`, also built by the open ClassicalErgodicTheory, this roadmap keeps the proper-action
variant 4.3 and says how it differs; `ℕ`-indexed tail σ-algebra: Tau Ceti `tailProcess`, cited and
identified with 4.1; nothing else shared.

### Copyright, licences and scope

Wording: the fifteen sampled targets and six further passages (the height conventions, the route
of 3.2, 4.6(b), the statement of 2.9, 7.3, the uniqueness remark of 9.7) set beside the texts at
their locators, and a scan of `README.md` and `Suggested.lean` against the eight readable texts for
shared runs of seven words: the only hits are bibliographic titles and four generic phrases ("is
the Borel σ-algebra of the product topology", "translation-invariant Gibbs measure of slope",
"is the absolute value of the determinant of the", a formula). One clause follows a source
sentence (R01). Arrangement: gorin2021 has the largest share, 49 of 171 occurrences of a source
key. Its lectures set beside the layers: Layers 1–2 draw on Lecture 1, Layer 3 on Lecture 2 and
Sections 3.1–3.2, Layer 4 on nothing there, Layers 5–6 on Lecture 13, Layers 7–8 on Section 3.3 and
Lecture 4, Layer 9 on Lectures 4, 6 and 13, Layer 10 on Sections 13.1–13.2: no run of layers maps
one to one onto a run of lectures, and the order is the one the dependency lines force (3 needs
2.8; 5 needs 4; 6 needs 5; 7 needs 4–6; 8 needs 7; 9 needs 4–8; 10 needs 5 and 9). Reuse: table
(3.4) of gorin2021 is restated as a rule; the unit-hexagon matrix of 3.1 coincides with the
example of gorin2021 lines 722–744 (to the humans, below).

Source independence: 21 passages compared with 7 sources, one clause following a source sentence
(R01), none else shared; largest share gorin2021, 49 of 171 locators; contents compared with
gorin2021: independent.

## Not verifiable

- thurston1990 and georgii2011: recorded as uncertified, cited by locator only; not read.
- kenyon1997 Lemmas 7 and 8: the sentences are readable, the displayed formulas are lost in the
  text extraction; 8.3 and 8.4 were checked by computation instead.
- gorin2021 Definition 3.9 refers to a figure for the sides of the fundamental domain; the pairing
  of `a` with the horizontal period was confirmed from the proof (lines 1478–1504) and by the
  `1 × 2` computation, not from the figure.
- 4.3, 9.4 and the weak-closedness half of 4.6: no finite computation decides them; the routes were
  read and their inputs resolved at the pins.
- `flip_connected`, `thurston_tileable_iff` and 8.2 beyond the instances of the table: round 4's
  enumerations (564 regions, 52,235 regions, 796 torus cases) were not repeated.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, line 1766: the source says that for large `n` either `n` or `n + 2` lies in `W_θ`; it should be `n` or `n + 1`, since for `θ = π/2` no even `n` lies in `W_θ`; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and Section 5.4, lines 836–839 and 858–866: the source says there is a unique ergodic Gibbs measure for every slope admitting an invariant measure and deduces ergodicity from extremality in a slope fibre; it should restrict uniqueness to interior slopes, and fibre-extreme measures need not be ergodic; affects a stated result.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require type-1 lozenges in one of every two consecutive rows (two tilings share the positions `{(0,y) : y ≤ 0}`); affects nothing.

## For the human reviewers

- **Licence.** gorin2021 was read from the author's page as a pre-publication copy of a Cambridge University Press book (`sources.toml`, `licence_class = "author-page"`); the README cites the printed numbering.
- **Licence.** The 3 × 3 unit-hexagon matrix and its column-swap remark in README 3.1 (lines 955–957) coincide with the worked example of gorin2021 lines 722–744; the README cites it and adds type weights.
- **Scope.** Interior uniqueness, the variational principle and Aggarwal's theorem are left to DimerModelsAndLozengeTilingsPartII (README lines 129–137, 2133–2137); no roadmap on main, open pull request or board package has that name.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "493a17d0df2552768c0233716c43d0fe6d782a55", "job": "REV-PKG-DimerModelsAndLozengeTilings~5", "model": "fable", "worker": "chris-x88"} -->
