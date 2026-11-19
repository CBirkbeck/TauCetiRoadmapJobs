# Review of TopologicalDataAnalysis (pull request #2525 at 46bedc4)

**Verdict:** needs changes

**Summary.** Changes are needed: two findings. The rank invariant at infinite arguments is defined as a limit, so the diagram of a module gives multiplicity `0` to every bar with an infinite endpoint, which makes the diagram-of-a-decomposition theorem and the isometry theorem false as stated; and the identification of Čech persistence with offset persistence is false for the empty family. There are nine small corrections and three format notes, none blocking. Three of the five main sources could not be read, among them the one cited most, which is left to the human reviewers.

## R01 (P1) — The diagram loses every bar with an infinite endpoint, so the diagram of a decomposition and the isometry theorem are false as stated

Every later stability and inference statement passes through `rankDiagram`, and with the present `rankE` an essential class is invisible to it.

`rankE V s t` (`Suggested.lean` lines 138–140, README 1.4 lines 277–278) takes the infimum of `rankInv` over all real arguments when `s = ⊥` or `t = ⊤`. Take `V = intervalModule 𝕜 (Set.Ici 0)` and the point `(0, ⊤)`. The rectangles allowed by `rankDiagram` (lines 145–149) have `a < 0 < b < c < ⊤ = d`, and then `rankE V b c = 1`, `rankE V a ⊤ = 0`, `rankE V a c = 0`, `rankE V b ⊤ = 1` (the map `V_b → V_t` has rank `1` for every `t ≥ b`), so the multiplicity is `(1 + 0) - (0 + 1) = 0`. The same happens at `(⊥, 0)` for `Set.Iic 0` (`(1 + 0) - (1 + 0) = 0`) and at `(⊥, ⊤)` for the constant module (`(1 + 1) - (1 + 1) = 0`). Hence:

- `rankDiagram_eq_encard_of_decomposition` (line 176) fails for `Set.Ici 0`: the left side is `0`, the right side `1`.
- `interleavingDist_eq_bottleneckDist` (line 259) fails for `V = intervalModule 𝕜 (Set.Ici 0)`, `W = 0`, both pointwise finite-dimensional: the left side is `⊤` (the README's own Check, line 464), while `rankDiagram V` is the zero diagram, so the right side is `0`.
- The Check of 1.4 at lines 317–318 ("the multiplicity is `1` at `(0, ⊤)`") is false for the definition as written; it accounts for `rankE V a ⊤` and omits `rankE V b ⊤ = 1`.

The cited source sets the module to zero at both infinities, so that a rectangle reaching `+∞` has measure `r(b, c) - r(a, c)` (ChazalDeSilvaGlisseOudot2016 line 1123, §2.6 in the arXiv numbering). The smallest change: define `rankE V s t = 0` when `s = ⊥` or `t = ⊤`, and `rankInv` at real arguments otherwise. Then the three values above become `(1 + 0) - (0 + 0) = 1`. The Checks on `rankE` at lines 360–363 (values `1` at `(0, ⊤)` and `(⊥, 0)`) and the sentence of 1.4 defining it change with it.

## R02 (P2) — Čech persistence equals offset persistence only for a nonempty family

`nonempty_iso_cechModule_offsetModule` (`Suggested.lean` lines 610–613, README 6.3 line 995) assumes `[Finite ι]` only. For `ι` empty the Čech complex has no faces, so `cechModule 𝕜 x 0` is zero, while `Set.range x = ∅` and Mathlib's `infDist y ∅ = 0` make the offset at every `r ≥ 0` the whole of `ℝ^D`, with `H_0 = 𝕜`. The two modules are not isomorphic. The README's own convention (lines 110–111) says every theorem about offsets assumes the set nonempty, and the Layer 7 statements that use 6.3 do carry `[Nonempty ι]`. Add `[Nonempty ι]` to the Lean statement and "nonempty" to the sentence of 6.3.

## C01 — The homological critical values of 3.1 miss values at which the homology changes

`IsHomCriticalValue` (README lines 517–518, `Suggested.lean` lines 301–303) asks for a non-isomorphism across the window `[a - ε, a + ε]` for every `ε > 0`, large ones included. For `f(x) = x³ - 3x` on `ℝ` the degree-zero sublevel module is `ℝ ⊕ [-2, 2)`, yet neither `-2` nor `2` is critical in this sense: at `ε = 5` both sublevel sets are connected half-lines and the map is an isomorphism in every degree. So this function has no critical value although its module has a finite bar. No stated theorem uses the finiteness clause of `IsTameFunction` (the route of 3.2 uses only pointwise finite dimension), so nothing stated is false. Quantifying over all sufficiently small `ε` (there is `ε₀ > 0` with the non-isomorphism for all `0 < ε < ε₀`) gives `-2` and `2` here and keeps the Checks of lines 593, 610 and 612. I could not read the source cited for the definition, so I do not say which form it has.

## C02 — The second locator of 4.5 is a running-time statement, not single linkage

In 4.5 (line 743) the count of Rips components by minimum-spanning-tree edges is cited to Dey–Wang, Thm 3.18. That theorem bounds the running time of a union-find procedure for the degree-zero diagram of a lower-star filtration (DeyWang2022 lines 4084–4086); the remark on minimum spanning forests follows it (lines 4087–4092) and concerns edge weights `max(f(u), f(v))`, not a metric space. The statement of 4.5 rests on the route given there. Cite the remark after Thm 3.18 as related, or drop the locator.

## C03 — Two definitions attributed to Dey–Wang differ from theirs in normalisation

In 2.2 (lines 397–398) the `q`-cost uses the `ℓ^∞` distance between points; Def 3.10 of Dey–Wang uses the `ℓ^q` norm in the plane (DeyWang2022 lines 2773–2780). The roadmap's distance is the smaller one, so their Thm 3.4 does imply `wassersteinDist_simplicialModule_le`, but a reader comparing constants should be told. In 5.4 (lines 894–895) `distortion` is the supremum itself, while their Def 6.3 includes the factor `1/2` (DeyWang2022 line 6660). One clause at each place suffices.

## C04 — The Lean statement for modules of finite type omits the shape of the intervals

The README (lines 233–236) concludes that each summand is `[a, a')`, `[a, ∞)`, `(-∞, a')` or `ℝ` with endpoints in `A`; `exists_intervalDecomposition_of_isFiniteType` (lines 159–160) concludes only that the index type is finite. The scope paragraph (lines 22–23) says each Lean headline carries every conclusion the README attaches to it. Either add the clause on the intervals to the Lean statement or soften that sentence.

## C05 — Minimum spanning trees and the cut property are planned by an open roadmap

4.5 defines `IsMinSpanningTree` and its route proves the cut property by exchange (lines 739–748). The open roadmap SpanningTreesAndShortestPaths (pull request #2512, its README lines 196 and 220) defines minimum spanning forests of weighted graphs and states the cut property. A minimum spanning tree of a finite metric space is its minimum spanning forest for the complete graph weighted by distance. One sentence in the scope section saying that 4.5 keeps only this specialisation, to state the single-linkage count, and that the cut property is that roadmap's, would settle the ownership.

## C06 — The Checks point 23 times to a script that is not in the folder

"computed in `checks.py`" appears at lines 450, 664, 759 and twenty other places; the folder holds only the README, the Lean file and the metadata. A reader cannot open it. Say the values were recomputed by hand, or drop the pointer. Two Checks rest on it entirely (the pairing lemma "tested on 300 random matrices", line 775, and the simulated probability, line 1288): these are numerical experiments rather than computed values and would be better replaced by one worked instance each.

## C07 — The module docstring does not say which prose headlines are not statable and what each lacks

The docstring (lines 21–26) says the other headlines are stated in the README. The limit theorems of 8.3 are in the roadmap's summary; their central limit theorem needs the Donsker classes of MathematicalStatisticsAsymptotic, which are not in the pinned libraries. Name the prose-only headlines (3.4, 5.3, 8.3) and the missing carrier for each.

## C08 — `measure_bottleneckDist_le` is monotonicity of the measure applied to 3.2

The statement of 3.3 (lines 326–332) follows from `bottleneckDist_sublevelModule_le` by inclusion of events, as its own route says. As a target it asks an implementer for nothing beyond 3.2. If it is kept as the form consumers will use, say so in its docstring.

## C09 — The hypothesis `ε < √(3/20) τ` of 7.1 is implied by the others

In `exists_deformationRetraction_offset` (line 657), `2ε < r < √(3/5) τ` gives `ε < √(3/5) τ / 2 = √(3/20) τ`. The Check at line 1156 computes this identity. The hypothesis can stay as documentation; the README could say it is redundant.

## N01 — Text that dates or will not resolve

"a resampling roadmap in an open pull request" (lines 72 and 1342) names no roadmap; "a paper not at hand" (line 15) describes the writing, not the mathematics. Name the roadmap and drop the phrase.

## N02 — Two pointers are off

The Check at lines 921–924 says "6.3 is attained"; the bound meant is that of 6.4. The route of 6.2 (line 982) cites `TauCeti.isZero_singularHomologyFunctor_of_contractibleSpace` for the degree-zero value as well; that declaration covers `n ≠ 0` only.

## N03 — Lean file form

The last section comment (line 783) has only `#check` lines under it. `bottleneckDist_triangle`, `bottleneckDist_le_wassersteinDist` and `wassersteinDist_triangle` (lines 246–256) have no docstring.

## Questions for the author

- 6.4 cites Chazal–de Silva–Glisse–Oudot, Thm 1.1, p. 6, for Gromov–Hausdorff stability of Rips persistence of compact spaces. The arXiv text of that work has no statement on the Gromov–Hausdorff distance; its only remark on Rips complexes refers to another paper for `q`-tameness (ChazalDeSilvaGlisseOudot2016 lines 1383–1386). Is the locator meant for Chazal–de Silva–Oudot, *Persistence stability for geometric complexes* (2014)? I could not read the Springer edition.
- 5.3 states the volume bound for `0 < r < τ`. Does the Niyogi–Smale–Weinberger lemma cover that range, or only `r < τ/2`? The projection argument in the route needs the projection to the tangent space to be injective on the ball. I could not read the paper.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `rankInv`, `IsQTame` | `Ico 0 1`; `𝕜^ℕ` constant; zero maps | ranks `1`, `0`, `0` at `(0,1/2)`, `(0,1)`, `(1/2,0)`; `⊤`; `0` across gaps | agrees with Checks | none |
| 1.2 `rankInv_eq_encard_of_decomposition` | one interval; countably many copies of `[0,1)` | `1` or `0`; `⊤ = ⊤` | sound | none |
| 1.3 finite type | `(0,1)`; `[0,1]`; `A = ∅` | not finite type; not finite type (`V_1 → V_{1.5}`); single `ℝ` | sound; Lean weaker than README | C04 |
| 1.4 `rankDiagram_eq_encard_of_decomposition` | `Ici 0` at `(0,⊤)`; `Iic 0` at `(⊥,0)`; constant at `(⊥,⊤)`; `Ico 0 1` at `(0,1)` | `0` vs `1`; `0` vs `1`; `0` vs `1`; `1 = 1` | false | R01 |
| 2.1–2.2 distances | `{(0,2)}` vs `{(0,3)}`, `{(5,7)}`, `∅`; `{(0,⊤)}` vs `{(1,⊤)}`; `W_2` of `{(0,2),(0,4)}` vs `∅` | `1`, `1`, `1`; `1`; `√5` | sound | C03 |
| 2.3 isometry theorem | `Ici 0` vs `0`; `Ico 0 2` vs `Ico 0 3` | `⊤` vs `0`; `1 = 1` | false with present `rankE` | R01 |
| 2.4 `exists_matching_of_bottleneckDist_le` | finite diagrams, `η = ⊤`, empty matching | infimum over a finite nonempty set is attained | sound | none |
| 3.1 `IsHomCriticalValue` | `x²`; `x³ - 3x`; `x sin(1/x)` | `{0}`; `∅` though bar `[-2,2)`; infinitely many (parity of components) | misses values | C01 |
| 3.2 stability | empty `X`; `δ = 0` | both modules zero; identity interleaving | sound | none |
| 3.4 Morse bars | upright torus | `c = (1,2,1) = β`; no finite bars | sound | none |
| 4.1 simplicial filtrations | `f = card` on filled triangle | degree `0`: `[1,∞) ⊕ [1,2)²`; degree `1`: `[2,3)` | sound | none |
| 4.2 Euler–Poincaré, insertion | hollow, filled triangle; `ℝP²` on six vertices; `N = 0` | `χ = 0, 1`; `6 - 15 + 10 = 1`; both sides `0` | sound | none |
| 4.3 pairing lemma | `m = 1`, `D = [1]`; triangle order `0,1,2,01,12,02,012` | `1 - 0 + 0 - 0 = 1`; pairs `(1,3)`, `(2,4)`, `(5,6)` | sound | none |
| 4.5 single linkage | points `0,1,3,6`, `r = 0.6`; non-minimal path | `2 + 1 = 3`; `3 + 1 = 4 ≠ 3` | sound | C02, C05 |
| 5.2 `reach_le_wfs`, 5.4 | `{0,2}`; circle; two tangent circles; `X × Y` | `1 = 1`; `1 = 1`; `0 < 1`; distortion `max diam` | sound | none |
| 6.1 inclusions | equilateral triangle of side `2`; `r < 0` | circumradius `1.1547 ∈ (1, √2]`; all complexes empty | sound | none |
| 6.2 nerve lemma | `ι` empty; three arcs; two arcs | `0 ≅ 0`; `β₁ = 1`; hypothesis fails | sound | N02 |
| 6.3 Čech equals offsets | `ι` empty, `p = 0`; one point | `0` vs `𝕜`; both `[0,∞)` | false without nonemptiness | R02 |
| 6.4 Rips stability | two-point spaces at distances `2`, `2 + 2ε` | distortion `2ε`, bottleneck `ε` | sound; one locator in question | question |
| 7.1 Niyogi–Smale–Weinberger | constants | `√(3/5)/2 = √(3/20)` | hypothesis redundant | C09 |
| 7.2 inference windows | offsets; Rips with `a = α/2`, `b = 2α` | nonempty iff `4ε < wfs`; iff `9ε < wfs` | sound | none |
| 7.3 Rips pairs | pairs `(α, 2√2α)`, `(√2α, 2α)`; `ε = 0.05`, `τ = 1`; `ε = α = 0` | window `ε < τ/(5 + 4√2) = 0.0938τ`; `α ∈ [0.171, 0.336)`; both sides `H_p(K)` | sound; Dey–Wang constants as cited | none |
| 8.1 distance to a measure | `(δ₀ + δ₂)/2`; `δ₀` vs `(1-m)δ₀ + mδ_L`; sample `{0,1,3}` | `1`, `√2`; `L = 0 + L`; `1/2` | sound | none |
| 8.2 landscapes | `{(0,4),(1,3)}` at `t = 2`; `k` beyond the bars | `2`, `1`; `0 ≤ c` | sound | none |
| 8.3 limit theorems | class `t ↦ λ_k(·, t)` on `[0,T]` | Lipschitz constant `1`, envelope `T/2`, brackets `≲ T/ε` | sound; supplier sections resolve | C07 |
| 8.4 sampling bound | uniform on `[0,1]`, `n = 60`, `ε = 0.1`; `n = 0` | `40 e^{-3} = 1.99`; event empty | sound | C06 |

- Source locators checked against the text: 15 in DeyWang2022 (statements agree except C02 and C03; its author copy is paginated differently from the edition cited, so pages were not checked) and 5 in ChazalDeSilvaGlisseOudot2016 (contents agree; the arXiv numbering differs from the edition cited).
- Library declarations opened at the pins: 9, among them `Realization` (weak topology, `Realization/Basic.lean` line 165), `isZero_singularHomologyFunctor_of_contractibleSpace` (`Contractible.lean` line 53), `quasiIso_cechTotalAugmentation` (`OrderedQuasiIso.lean` line 409), `gabrielIndecomposableEquivPositiveRoot` (`Correspondence.lean` line 78), `exists_equiv_linearEquiv_of_isLocalRing_end` (`Uniqueness.lean` line 168), `GromovHausdorff.ghDist` (line 176).
- Cross-roadmap citations resolved on main: 8 (MathematicalStatisticsAsymptotic §§3.1, 3.2, 3.4; QuiverRepresentations §5.1; MorseTheory Layer 2 and §4.1; OptimalTransport §§3.1, 15.6; AlgebraicTopology §4.7).
- Dependency check output: `depcheck: 200 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 42 `sorry` warnings and nothing else. Elaborated types compared with the README statements: differences are R02 and C04; the three declarations reported as losing a section binder (`dtm`, `kNNDist`, `tent`) do not need it.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 42 theorems closes.
- Duplication: no persistence module, Rips or Čech complex, nerve of a cover, reach, Gromov–Hausdorff correspondence or landscape in the pinned Mathlib or Tau Ceti, nor in another roadmap, apart from C05.
- Overlap check: read KernelsAndSpectralMethods, MathematicalStatisticsHigherOrderAndResampling, StatisticalLearningTheory, MathematicalStatisticsNonparametric; nothing shared (KernelsAndSpectralMethods lists topological data analysis and manifold reach as outside its scope). Outside those lists, minimum spanning trees are shared with SpanningTreesAndShortestPaths, which is the owner (C05).

Source independence: 20 passages compared with 2 sources (DeyWang2022, ChazalDeSilvaGlisseOudot2016), none shared; largest share Oudot2015, 18 of 64 locators; contents compared with Oudot2015: not possible, its text and table of contents could not be read here. The layer order does not follow the chapter order of the two sources read.

Research link: Layers 1–2 state the decomposition theorem of Crawley-Boevey (2015) and the isometry theorem of Chazal–de Silva–Glisse–Oudot (2016); Layer 7 the inference theorems of Niyogi–Smale–Weinberger (2008) and Chazal–Lieutier (2007); Layer 8 Bubenik's landscapes (2015). Rests on the README's references and ChazalDeSilvaGlisseOudot2016 line 2299.

## Not verifiable

- Oudot2015 (18 locators, among them those of 2.2, 3.2, 7.1, 7.2 and 8.1): the author's copy was fetched but is encrypted and could not be extracted.
- EdelsbrunnerHarer2010 (16 locators, among them those of 3.2, 3.4, 4.2 and 6.2): no legal copy found; the README cites the pages of a 2008 manuscript.
- CarlssonVejdemoJohansson2022 (the first locator of 4.5): no legal copy found.
- Page numbers of Dey–Wang and theorem numbers of Chazal–de Silva–Glisse–Oudot in the editions cited: only the author copy and the arXiv version were read.
- Ownership against board packages not yet in a pull request was not checked.

Automatic checks set aside as false positives: none.

## Source issues

- **Misprint** in DeyWang2022 at Definition 3.9, printed p. 63 of the author copy (line 2740): the source says the sup-norm distance of two points is the larger of the coordinate differences within each point; it should be the larger of the differences between corresponding coordinates of the two points; affects nothing.

## For the human reviewers

- **Not tested.** Oudot2015 has the largest share of the locators (18 of 64) and could not be read; neither could EdelsbrunnerHarer2010 (16). Wording and arrangement were not compared with either.
- **Licence.** README "Prior formalization" (lines 1351–1376) says parts of every layer are formalized in the author's lean-CKSD (Apache 2.0). `Suggested.lean` was not compared with that repository.
- **Licence.** README line 1395 gives Edelsbrunner–Harer page numbers "as in the authors' 2008 manuscript" rather than the published book.
