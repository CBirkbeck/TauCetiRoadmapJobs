# Review of TopologicalDataAnalysis (pull request #2525 at 91b88cb)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review (the two interleaving lemmas of 2.3 now carry the strict margin) and all its small corrections and format notes, and the full pass over every statement found nothing false. There are three small corrections (two proof routes with a step that does not go through as written, in 3.4 and in the Crawley-Boevey route of 1.3, and one inaccurate reason in the module docstring) and three format notes, none blocking. Two of the five main sources could still not be read; that, and the licence of the author's earlier formalization, are left to the human reviewers.

## C01 — The route of 3.4 gets "finite type" from a lemma that does not cover the sublevel set at a critical value

An implementer who follows the route literally is stuck at the first step. It reads "Between critical values the sublevel sets are homotopy equivalent (`TauCeti.exists_sublevelHomotopyEquiv`), so the module is of finite type (1.3) with critical values as `A`" (README lines 631–633). `IsFiniteType` asks for an isomorphism `V_s → V_t` whenever `(s, t]` misses `A`, so also for `s` itself a critical value. The Tau Ceti lemma (`Geometry/Manifold/Morse/Deformation.lean`, line 213) assumes no critical point with `a ≤ f x ≤ b`, the closed band. For the height on a circle with minimum value `0`, finite type with `0 ∈ A` needs `H({f ≤ 0}) → H({f ≤ 1})` to be an isomorphism (a point into an arc: true), and the lemma does not apply because the minimum lies in the band.

The statement is unaffected, and so are its two neighbours, because `rankDiagram` ignores decorations. Two repairs, either suffices: name the input that gives `H({f ≤ c}) → H({f ≤ c + ε})` an isomorphism at a critical value `c` (a Morse-chart retraction, stated as a target of 3.4); or drop finite type from the route: the module is pointwise finite-dimensional and its maps are isomorphisms inside each open interval between consecutive critical values, so it decomposes by Crawley-Boevey's theorem and no bar begins or ends strictly between critical values.

## C02 — The Crawley-Boevey route of 1.3 forms the image subspaces at a point on the wrong side of the cut

The route says "For each cut `c` of `ℝ` … and `t` in its lower part, form the images `Im⁻_{c,t}` and `Im⁺_{c,t}` of the maps from below `c` and the kernels `Ker^±_{c,t}` of the maps beyond it" (README lines 267–269). With `t` in the lower part the images from below `c` include that of the identity of `V_t`, so both are `V_t` and carry no information. In the paper the images are formed for `t` in the upper part of the cut (the union over the lower part, and the intersection over the points of the upper part up to `t`) and the kernels for `t` in the lower part (CrawleyBoevey2015 lines 75–92); an interval is the upper part of one cut met with the lower part of another, and `t` lies in both (lines 112–118).

The smallest change: "for a cut `c` and `t` in its upper part form the images …; for a cut `c'` and `t` in its lower part form the kernels …". The uniqueness route of the same section already has it right: its `A`, `A'`, `K`, `K'` are these four subspaces.

## C03 — The module docstring says intrinsic Čech stability needs a complex the file lacks, but `cechComplex` of the identity is that complex

The docstring of `Suggested.lean` (lines 38–39) gives as the reason for leaving the prose target of 6.4 unstated that "it needs the intrinsic Čech complex, with centres in the space, which nothing else here uses". The file's `cechComplex x r` has the faces `σ` with a centre `z : E` within `r` of every `x a` (lines 615–619); for a metric space `X` and `x = id : X → X` the centres range over `X` itself, which is the intrinsic complex. So the target is statable with what the file has: the bottleneck distance between the diagrams of `cechModule 𝕜 (id : X → X) p` and `cechModule 𝕜 (id : Y → Y) p` is at most twice `ENNReal.ofReal (GromovHausdorff.ghDist X Y)`, for finite nonempty metric spaces. For two-point spaces at distances `2` and `2 + 2ε` the intrinsic edge enters at `2` and `2 + 2ε`, the diagrams are at distance `2ε = 2 d_GH`, so the factor `2` is attained and separates this statement from the Rips one.

Either state it, or give the docstring the actual reason it is left in prose (a variant of `bottleneckDist_ripsModule_le_ghDist` with the same route).

## N01 — The docstring's reason for 8.3 covers the central limit theorem only

Weak convergence in `ℓ^∞([0, T])` and Donsker classes are what the central limit theorem lacks; the uniform strong law needs neither. What it lacks at the pins is a measurable structure on finite diagrams (there is no `MeasurableSpace` on `Multiset (ℝ × ℝ)` in the pinned Mathlib), and the docstring could say so.

## N02 — "Dey–Wang, Thm 6.3(b)" in 6.4

The theorem's two parts are numbered 1 and 2 in the copy read (the source later calls them Part (i) and Part (ii)); "(b)" is not a label a reader will find.

## N03 — The *Needs:* line of 6.3 lists 6.2 only

The statement is about `cechModule` (6.1), and the route passes from singular homology of the realization to ordered simplicial homology of the nerve by the comparison of 4.1.

## Questions for the author

- 6.4 cites Chazal–de Silva–Glisse–Oudot, Thm 1.1, p. 6, for Rips stability. The arXiv version has no numbered statement in its introduction; its only sentence on Rips complexes is a remark (ChazalDeSilvaGlisseOudot2016 lines 1383–1386). Does the Springer edition have a Theorem 1.1 with this content? That edition could not be read.
- 1.3 cites Chazal–de Silva–Glisse–Oudot, Thm 2.8, for Crawley-Boevey's theorem. In the arXiv version the corresponding theorem covers finite and locally finite index sets, and the result over `ℝ` is a remark after it (lines 441–452). Is it part of the theorem in the edition cited? Same obstacle.

## Previous findings

- R01 — repaired: "a matching of cost `ε` gives, for every `ε' > ε`, `ε'`-interleavings of matched interval modules … and both distances are infima, so `d_I ≤ d_B`. The margin is needed: `intervalModule (Icc 0 1)` … is not `1/2`-interleaved with `0`" (README lines 471–477).
- C01 — repaired: "two decompositions of any persistence module are matched by a bijection … No finiteness is assumed" (lines 275–278); `IntervalDecomposition.exists_equiv` no longer takes `hV`. The new route (four subspaces and a subquotient) was checked on one summand and is sound.
- C02 — repaired: "for a `q`-tame module and any decomposition" (line 309); the Lean hypothesis is `IsQTame V`; two Checks added (`⊕ [0, 1/n)`, and the non-tame control with `⊤ - ⊤`).
- C03 — repaired: 6.2 now has "The nerve lemma for compact convex sets" with its own route, and 6.3 uses it: "No critical radius needs separate treatment" (line 1099).
- C04 — repaired: "*Needs:* 1.2, 6.1; SpanningTreesAndShortestPaths §2.4" (line 823) and a supplier contract (lines 187–191).
- C05 — repaired: the description reads "this roadmap merges after it", "(the four roadmaps on main, and one in an open pull request)" and "cites the small-ball bound of 5.3".
- N01–N04 — repaired: the Lean section comments carry the README's layer titles and 4.5 is marked; "Layers 5 and 6 are built together" (line 204); "the direct sum of countably many copies of `𝕜`" (lines 327, 330); "`P` finite and nonempty" (line 1228) with the junk value recorded in Conventions.
- The two questions were not answered in the text and are asked again above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `rankInv`, `IsQTame` (sampled) | `Ico 0 1`; constant `⊕_ℕ 𝕜`; zero maps | `1, 0, 0` at `(0,1/2), (0,1), (1/2,0)`; `⊤`; `0` across gaps | sound; source line 259 | none |
| 1.2 `rankInv_eq_encard_of_decomposition` | one interval; countably many `[0,1)` | `1` or `0`; `⊤ = ⊤` | sound | none |
| 1.3 finite type (sampled) | `A = ∅`; `V = 0`; `(0,1)` | copies of `ℝ`; empty index; not finite type (`V_0 = 0 → V_t = 𝕜`) | sound; Oudot locators unread | none |
| 1.3 Crawley-Boevey route | cut `c`, `t ∈ c⁻` | images from below include `id`: both equal `V_t` | route slip | C02 |
| 1.3 `IntervalDecomposition.exists_equiv` | summand `J ∋ t` against `I`: `J = I`; `I = (0,1)`, `J = [0,1)`; `I = [0,1)`, `J = [0,2)` | subquotient `𝕜`; `A' = 𝕜` so `0`; `K = 𝕜` so `0` | sound without finiteness | none |
| 1.4 `rankDiagram_eq_encard_of_decomposition` (sampled) | `Ici 0` at `(0,⊤)`; `⊕[0,1/n)` at `(0,1/n)`; `ℵ₀·[0,1) ⊕ [0,1/2)` | `(1+0)-(0+0) = 1`; `#{m : c < 1/m ≤ d} = 1`; `(⊤+0)-(0+⊤) = 0 ≠ 1` | sound under `IsQTame`; hypothesis needed | none |
| 2.1 bottleneck, triangle (sampled) | `{(0,2)}` vs `{(0,3)}`, `{(5,7)}`, `∅`; `{(0,⊤)}` vs `{(1,⊤)}`, `∅` | `1, 1, 1`; `1`, `⊤` | sound; Edelsbrunner–Harer page unread | none |
| 2.2 Wasserstein | `{(0,2),(0,4)}` vs `∅`, `q = 1, 2`; empty matching `q = 2` | `3`, `√5`; `√13/2`; `d_B = 2 ≤ 3` | sound; ground norm differs from source, noted | none |
| 2.3 isometry theorem and route | `Ici 0` vs `0`; `Ico 0 2` vs `Ico 0 3`; `Icc 0 1` vs `0` at `ε = 1/2`, `ε' > 1/2`; matched intervals with margin | `⊤ = ⊤`; `1 = 1`; not interleaved, interleaved; `r - ε' < p ≤ t`, `t + ε' ≤ q - ε' < s` | theorem and repaired route sound | none |
| 2.4 `exists_matching_of_bottleneckDist_le` | `{(0,2)}` vs `{(0,3)}`, `η = 1`; `η = ⊤` | two matchings, costs `3/2`, `1`; empty matching | sound | none |
| 3.1 definitions (sampled) | `x²`; `x³ - 3x`; `x` on `[0,1]`; `(x²-1)²` | `{0}`; `{-2, 2}`, module `ℝ ⊕ [-2,2)`; `{0}`; `[0,∞) ⊕ [0,1)` | sound; source line 1323 for polyhedra | none |
| 3.2, 3.3 stability, coverage | empty `X` with `δ < 0`; `r < 0`, `X` nonempty | both modules `0`, `0 ≤ 0`; left event empty | sound | none |
| 3.4 `encard_criticalPoints_index_eq` | circle, minima `0,1`, maxima `2,3`; torus; `n = 0`, `k` points; `s = 0` critical | `c₀ = 2`, `c₁ = 1 + 1`; `c = β = (1,2,1)`; `k = k`, all bars infinite; supplier lemma inapplicable | statement sound; route gap | C01 |
| 4.1 simplicial filtrations (sampled) | `f = card`, filled triangle; `f = 0` | degree 0 `[1,∞) ⊕ [1,2)²`, degree 1 `[2,3)`; degree 1 `0` | sound; matches source lines 2402, 2561 | none |
| 4.2 Euler–Poincaré, insertion | hollow, filled triangle; six-vertex `ℝP²`; point | `0`, `1`; `6-15+10 = 1 = 1-1+1 = 1-0+0`; `(-1)^2 = 1` | sound | none |
| 4.3 pairing lemma, correctness (sampled) | `D = [1]`; `D = [0]`; order `0,1,2,01,12,02,012`; `V = 0` | `1-0+0-0 = 1`; `0`; pairs `(1,3),(2,4),(5,6)`, ranks `1,0,0,0` and `1,0,0,1`; excluded by nonzero diagonal | sound; source lines 3065–3083 | none |
| 4.3 `rankInv_simplicialModule_eq_card` | triangle, `f = card`: `p = 0`, `(1,1)`, `(1,2)`; `p = 1`, `(2,2)` | `3`, `1`; `1` | sound | none |
| 4.4 stability (sampled) | `f = g`; `K` empty; one vertex shifted by `c` | `0 ≤ 0`; `0 ≤ 0`; both bounds `c` | sound; source lines 2760, 2795 | none |
| 4.5 single linkage (sampled) | points `0,1,3,6`, `r = 0.6`; path `0—6—3—1`; one point | `2 + 1 = 3` components; `3 + 1 = 4 ≠ 3`; `0 + 1 = 1` | sound; supplier §2.4 states the minimax property | none |
| 5.1 distance functions (sampled) | `{0}` vs `{0,1}`; offsets route | `sup = 1 = d_H`; finite union of closed balls, nerve finite | sound; uses the compact convex nerve lemma | none |
| 5.2 reach, wfs, isotopy | `{0,2}`; circle; tangent circles; `∅`; critical `x` with `d < reach` | `1 = 1`; `1 = 1`; `0 < 1` (hull at height `h/√(1+h²) ≠ h`); `0`; unique nearest point forces `x ∈ K` | sound | none |
| 5.4 correspondences (sampled) | two-point spaces `2`, `2+2ε`; `X × Y`; empty relation | distortion `2ε`, `d_GH = ε`; `2 + 2ε`; not a correspondence | sound; factor `1/2` as source line 6660 | none |
| 6.1 complexes, inclusions (sampled) | equilateral side `2`; `r < 0`; unit square | `2/√3 ∈ (1, √2]`; all empty; cycle on `[1/2, √2/2)` in both | sound; source lines 1382–1413 | none |
| 6.2 nerve lemma, open form | `ι` empty; three arcs; two arcs | `0 ≅ 0`; `β₁ = 1`; hypothesis fails | sound | none |
| 6.2 nerve lemma, compact convex form | `ι` empty; `D = 0`; route step (c) | `0 ≅ 0`; full simplex vs point; segment within `|ρy - y| < δ'` of `X` | sound | none |
| 6.3 Čech equals offsets | one point; `D = 0`; `r < 0`; `r = 0` | `[0,∞)`; simplex vs point; both `0`; `cthickening 0` is the finite set | sound; needs 6.1, 4.1 | N03 |
| 6.4 Rips stability; intrinsic Čech | two-point spaces | Rips: `ε = ε`; intrinsic Čech via `cechComplex id`: `2ε = 2 d_GH` | sound; prose target statable | C03, N02 |
| 7.1 Niyogi–Smale–Weinberger | constants; `N = ∅`; `d = 0`; squared distance | `2√(3/20) = √(3/5)`; vacuous; `P = M`, disjoint balls; `ε² + s'ε²/τ + s'²` | sound; primary source unread | none |
| 7.2 inference windows | offsets; Rips pairs `(a,2b)`, `(2a,b)`; `K = {0,2}`, `i = 0.1`, `j = 0.5`, `1.2` | iff `4ε < wfs`; iff `9ε < wfs`; image `𝕜²`, `𝕜` | sound | none |
| 7.3 Rips pairs (sampled) | pairs `(α, 2√2α)`, `(√2α, 2α)`; `ε = 0.05`, `τ = 1`; `ε = α = 0` | `2/(2-√2) = 2+√2`; `[0.1707, 0.3359)`; `1/(5+4√2) = 0.09383`; `|K| = |K|` | sound; source constants `3ε`, `0.14524` as cited | none |
| 8.1 distance to a measure | `(δ₀+δ₂)/2`; `δ₀` vs `(1-m)δ₀+mδ_L`; sample `{0,1,3}`, `k = 2` | `1`, `√2`; `L = 0 + L`; `1/2` | sound | none |
| 8.2 landscapes (sampled) | `{(0,4),(1,3)}`, `t = 2`; `{(0,2)}` vs `{(0,3)}`; bar `(1,1)`; `D = ∅` | `2, 1`; `1 = d_B`; zero tent, dropped; `0 ≤ c` | sound; source lines 13609, 13648 | none |
| 8.3 limit theorems | class `t ↦ λ_k(·, t)` on `[0,T]` | Lipschitz constant `1`, envelope `T/2`, brackets `≲ T/ε` | sound; docstring reason partial | N01 |
| 8.4 sampling bound, rate (sampled) | uniform on `[0,1]`, `n = 60, 100`, `ε = 0.1`; `n = 0`; `S = ∅`; source at `ε/2` | `40e⁻³ = 1.99`, `40e⁻⁵ = 0.27`; event empty; vacuous; `4^b/(aε^b)·e^{-naε^b/2^b}` | sound; agrees with source line 442 | none |

- Source locators checked against the text: 36 passages in 4 sources (19 in DeyWang2022, 12 in ChazalDeSilvaGlisseOudot2016, 2 in ChazalGlisseLabruereMichel2015, 3 in CrawleyBoevey2015). Contents agree; the author copy of Dey–Wang is paginated differently from the edition cited and the arXiv numbering of Chazal–de Silva–Glisse–Oudot is one chapter behind it.
- Library declarations opened at the pins: `TauCeti.exists_sublevelHomotopyEquiv` (`Geometry/Manifold/Morse/Deformation.lean` line 213, closed band without critical points), `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation` (`Morse/RelCWComplex.lean` line 298), `Metric.hausdorffDist_empty` (`Topology/MetricSpace/HausdorffDistance.lean` line 700), `GromovHausdorff.ghDist_le_hausdorffDist` (`GromovHausdorff.lean` line 185), `TauCeti.cechSingularChainsMap` (`Singular/Cech/Map.lean` line 56), `TauCeti.quasiIso_cechTotalAugmentation` (`Cech/OrderedQuasiIso.lean` line 409), `TauCeti.cellularChainComplexRealizationIso` (`Realization/CWComplex/OrderedChainComplex.lean` line 132). No `MeasurableSpace` instance on `Multiset` at the pins.
- Cross-roadmap citations resolved: 9 on main (MathematicalStatisticsAsymptotic §§3.1, 3.2, 3.4; QuiverRepresentations §5.1; MorseTheory Layer 2 and §4.1; OptimalTransport §§3.1, 15.6; AlgebraicTopology §4.7) and 5 at open heads (SpanningTreesAndShortestPaths §§2.1, 2.2, 2.4; MathematicalStatisticsHigherOrderAndResampling Layer 6; KernelsAndSpectralMethods §5.4).
- Dependency check output: `depcheck: 196 roadmaps, 2150 edges, 0 problem(s)`; no UPWARD or CYCLE line. SpanningTreesAndShortestPaths is a new roadmap in another author's open pull request.
- Automatic checks: all passed. Elaboration: `Suggested.lean` elaborates with 44 `sorry` warnings and nothing else. Elaborated types compared with the README statements for all 44 theorems; the three declarations reported as losing a section binder (`dtm`, `kNNDist`, `tent`) do not need it; `cornerRank D ↑i (↑j + 1)` and `↑k / ↑n` have the casts innermost. No change outside the roadmap folder.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 44 theorems closes. `measure_bottleneckDist_le` follows from 3.2 by monotonicity and says so in its docstring.
- Duplication: no persistence module, bottleneck distance, Rips or Čech complex, nerve of a cover, reach, weak feature size, correspondence or landscape in the pinned Mathlib or Tau Ceti, nor in a roadmap on main or at an open head; the three same-name library hits (`eulerChar`, `IsReduced`, `distortion`) are other objects.
- Description read against the head: the eight layer sentences, the supplier list, the ownership paragraph and the count of 44 admitted theorems agree with it.

Overlap check: read KernelsAndSpectralMethods, StatisticalLearningTheory, MathematicalStatisticsHigherOrderAndResampling; nothing shared (KernelsAndSpectralMethods consumes 8.4 and 5.3 and owns neither; outside the lists, minimum spanning forests are SpanningTreesAndShortestPaths's, cited).

Source independence: 36 passages compared with 4 sources (DeyWang2022, ChazalDeSilvaGlisseOudot2016, ChazalGlisseLabruereMichel2015, CrawleyBoevey2015), none shared; largest share Oudot2015, about 20 of about 72 locators (DeyWang2022 has as many within one), whose text and table of contents could not be read; contents compared with DeyWang2022: independent (its Chapter 2 material stands in Layer 6 after its Chapter 3 material in Layer 4; Layers 1, 2 and 5 match none of its chapters). By the README's own locators Oudot's Chapter 3 feeds Layers 2 and 3, Chapter 4 Layers 5 and 7, Chapter 5 Layers 7 and 8: not one to one.

Research link: Layers 1–2 state Crawley-Boevey's decomposition theorem (2015) and the isometry theorem of Chazal–de Silva–Glisse–Oudot (2016); Layer 7 the inference theorems of Niyogi–Smale–Weinberger (2008) and Chazal–Lieutier (2007); Layer 8 the rates of Chazal–Glisse–Labruère–Michel (2015) and Bubenik's landscapes (2015). Rests on the README's references and ChazalDeSilvaGlisseOudot2016 line 2299, CrawleyBoevey2015 line 39, ChazalGlisseLabruereMichel2015 line 442.

## Not verifiable

- Oudot2015 (about 20 locators, among them those of 1.3, 2.2, 7.1, 7.2 and 8.1): no legal copy could be read.
- EdelsbrunnerHarer2010 (about 17 locators, among them those of the sampled 2.1, 3.1, 4.3, 4.4 and 6.1): no legal copy could be read; the README cites the pages of a 2008 manuscript.
- CarlssonVejdemoJohansson2022 (the first locator of the sampled 4.5): no legal copy could be read.
- NiyogiSmaleWeinberger2008 (7.1, 5.3) and the other papers cited by author and year, apart from the three read: not fetched; their statements were checked by computation only.
- Page numbers of Dey–Wang and theorem numbers and pages of Chazal–de Silva–Glisse–Oudot in the editions cited: only the author copy and the arXiv version were read.
- The description's account of what is proved and what is admitted in lean-CKSD, and its statement that the locators were checked against printed pages: not checked.
- Ownership against board packages not yet in a pull request was not checked.

Automatic checks set aside as false positives: none.

## Source issues

- **Misprint** in DeyWang2022 at Definition 3.9, printed p. 62 of the author copy (line 2740): the source says the sup-norm distance of two points is the larger of the coordinate differences within each point; it should be the larger of the differences between corresponding coordinates of the two points; affects nothing.
- **Misprint** in CrawleyBoevey2015 at the proof of Lemma 2.1, printed p. 3 of the arXiv version (line 101): the source says the third image in the chain is strictly contained in itself; it should be strictly contained in the second image of the chain; affects nothing.

## For the human reviewers

- **Not tested.** Oudot2015, which with DeyWang2022 has the largest share of the locators (about 20 of 72), could not be read; neither could EdelsbrunnerHarer2010 (about 17). Wording and arrangement were not compared with either text.
- **Licence.** README "Prior formalization" (lines 1450–1479) says parts of every layer are formalized in the author's lean-CKSD (Apache 2.0). `Suggested.lean` was not compared with that repository.
- **Licence.** README line 1494 gives Edelsbrunner–Harer page numbers "as in the authors' 2008 manuscript of the book" rather than the published book.
