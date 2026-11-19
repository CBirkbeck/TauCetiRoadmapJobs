# Review of TopologicalDataAnalysis (pull request #2525 at dd32e66)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding: the route of the isometry theorem asserts that intervals matched within `ε`, and intervals of half-length at most `ε` against `0`, are `ε`-interleaved, which is false at the boundary value and contradicts the roadmap's own Checks. Both findings of the previous review are repaired, and no stated theorem was found false. There are five small corrections (two hypotheses stronger than the cited source needs, a route that stops at the critical radii, an unlisted supplier, a description written for the earlier head) and four format notes, none blocking. Two of the five main sources could not be read, among them the one cited most; that is left to the human reviewers.

## R01 (P2) — Intervals whose endpoints differ by at most `ε` need not be `ε`-interleaved, and an interval of half-length `ε` need not be `ε`-interleaved with `0`

An implementer who takes the two parenthetical lemmas of the route `d_I ≤ d_B` in 2.3 (lines 447–449) as targets will try to prove false statements. The text says "two intervals whose endpoints differ by at most `ε` are `ε`-interleaved by identities where defined" and "an interval of half-length at most `ε` is `ε`-interleaved with `0`".

Take `ε = 1/2` and `intervalModule 𝕜 (Set.Icc 0 1)`, of half-length `1/2`: an interleaving with `0` would factor `V_0 → V_1` through `0`, but that map is the identity of `𝕜`. Take `ε = 0` and the intervals `Set.Ico 0 1`, `Set.Icc 0 1`, whose endpoints agree: the Checks of the same layer say that `0`-interleaved means isomorphic (line 522) and that these two modules are not isomorphic (lines 524–525). Both sentences hold with a strict margin, which is how the source argues (ChazalDeSilvaGlisseOudot2016 line 2135, its theorem for decomposable modules, proved through matchings with a margin).

The smallest change: "are `ε'`-interleaved for every `ε' > ε`" in both parentheses. Since both distances are infima, the conclusion `d_I ≤ d_B` is unaffected, and the Check at line 488 (half-open `[0, 1)`, exactly `ε ≥ 1/2`) stays true as written.

## C01 — Uniqueness of the barcode does not need pointwise finite dimension

`IntervalDecomposition.exists_equiv` (README lines 267–269, `Suggested.lean` line 197) assumes the module pointwise finite-dimensional. The theorem it cites has no such hypothesis: any two interval decompositions of a persistence module are matched by a bijection, because the endomorphism ring of an interval module is the field (ChazalDeSilvaGlisseOudot2016 lines 424–437). The hypothesis comes from the counting route, not from the mathematics, and it excludes decomposable modules that are only `q`-tame, such as the sum of the interval modules of `[0, 1/n)`, `n ≥ 1`. Dropping `hV` gives the cited statement; the route can keep the count for the pointwise finite-dimensional case and name Azumaya's theorem for arbitrary families (Tau Ceti's `TauCeti.exists_equiv_linearEquiv_of_isLocalRing_end` covers finite ones, as the README says).

## C02 — The diagram of a decomposition holds for `q`-tame decomposable modules

`rankDiagram_eq_encard_of_decomposition` (README lines 297–299, `Suggested.lean` line 202) assumes pointwise finite dimension, but only the finiteness of the four ranks of each rectangle is used, and that is `q`-tameness, the class in which the isometry theorem is stated. For the sum of the interval modules of `[0, 1/n)`, which is `q`-tame with `V_0` of infinite dimension, a rectangle `a < 0 < b < c < 1/n < d` has finite ranks and measure equal to the number of summands with endpoints in the windows, and the infimum is `1` at `(0, 1/n)`, the count. Would `IsQTame V` serve as the hypothesis? Without any tameness the statement fails through the truncated subtraction (countably many copies of `[0, 1)` give `⊤ - ⊤`), so some hypothesis must stay.

## C03 — The route of 6.3 applies the isotopy lemma across the radius `r` itself, which may be critical

The route compares the closed offset of radius `r` with the open offset of radius `r + δ` "by 5.2" (lines 1052–1054). The isotopy lemma of 5.2 needs `0 < a` and no critical value in the closed window `[a, b]` (lines 898–899). Here the window starts at `r`, and `r` is a critical value exactly where the module changes: for two points at distance `2` and `r = 1`, the midpoint is critical with value `1`; and `r = 0` is excluded by `0 < a`. So the cited lemma gives nothing at the radii that carry the bars. The statement itself is unaffected (the nerve lemma for finite closed convex covers gives it directly). Either state that form of the nerve lemma as the input of 6.3, or add to 5.2 the half-open version for finite point sets (no critical value in `(a, b]`, `a ≥ 0`) with its own route.

## C04 — The route of 4.5 uses a roadmap that neither its *Needs:* line nor the supplier contracts list

The route of the single-linkage count rests on "the minimax property of minimum spanning forests (the SpanningTreesAndShortestPaths roadmap, §2.4)" (lines 786–787). That section exists at the head of that roadmap and states the property used. But the *Needs:* line of 4.5 reads "1.2, 6.1" (line 795) and the supplier contracts list four roadmaps, all on main (lines 176–185). A reader of the contracts does not learn that 4.5 waits for a roadmap that is not on main. Add it to both places, with the statement assumed of it.

## C05 — The description was written for the earlier head

Four sentences no longer describe the change.

- "No other roadmap consumes this one." The README's Downstream consumers section names KernelsAndSpectralMethods §5.4, and that roadmap cites 8.4 and 5.3 of this one.
- "**Dependencies** (all on main)". SpanningTreesAndShortestPaths §2.4 is now used by 4.5 and is not on main (C04).
- "its 42 theorems are admitted". The file has 43.
- "results whose only source is a paper not at hand" and "a resampling roadmap in an open pull request". The README now says "results whose source is a paper" and names MathematicalStatisticsHigherOrderAndResampling.

## N01 — Section comments of the Lean file differ from the README's layer titles

Layers 3, 5, 7 and 8 carry other titles in `Suggested.lean` (for instance "filtrations of spaces and sublevel persistence" against "sublevel persistence of functions on spaces"), and the two declarations of 4.5 stand under Layer 6.

## N02 — Two sections need a later layer

5.1 needs 6.2 and 4.5 needs 6.1, while 6.3 and 6.4 need Layer 5. The sections form no cycle, but Layers 5 and 6 cannot be built one after the other; a sentence in "How to read the build" would say so.

## N03 — `𝕜^ℕ` with "countable dimension"

In the Checks of 1.4 (lines 314 and 317) the space meant is the direct sum of countably many copies of `𝕜`; `𝕜^ℕ` usually denotes the product, whose dimension is uncountable.

## N04 — 7.3 does not say that the sample is nonempty

The prose of 7.3 has "`P` finite" (line 1184), the Lean statement has `[Nonempty ι]`. Mathlib's `hausdorffDist K ∅` is `0`, so the hypothesis is needed in Lean; the Conventions could record this junk value beside that of `infDist`.

## Questions for the author

- 6.4 cites Chazal–de Silva–Glisse–Oudot, Thm 1.1, p. 6, "quoting" the 2014 paper. The arXiv version of that work (v3) has no numbered statement in its introduction and no statement on the Gromov–Hausdorff distance; its only sentence on Rips complexes is a remark on `q`-tameness (ChazalDeSilvaGlisseOudot2016 lines 1383–1386). Does the Springer edition have a Theorem 1.1 with this content? I could not read that edition.
- 1.3 cites Chazal–de Silva–Glisse–Oudot, Thm 2.8, for Crawley-Boevey's theorem. In the arXiv version the corresponding theorem covers finite and locally finite index sets, and the result for `ℝ` is a remark after it (lines 441–452). Is it part of the theorem in the edition cited? Same obstacle.

## Earlier findings

- R01 of the previous review (bars with an infinite endpoint lost): repaired. `rankE` is now `0` at infinite arguments (`Suggested.lean` lines 159–160; README 1.4, "`rankE V s t = 0` when `s` or `t` is `⊥` or `⊤`"), which is the source's convention (ChazalDeSilvaGlisseOudot2016 lines 1123–1130). Recomputed: `Set.Ici 0` at `(0, ⊤)` gives `1 - 0 = 1`; `Set.Iic 0` at `(⊥, 0)` gives `1 - 0 = 1`; the constant module at `(⊥, ⊤)` gives `1`.
- R02 (Čech equals offsets for the empty family): repaired, `[Nonempty ι]` at line 664 and "finite nonempty family" in 6.3.
- C01–C09: repaired (small windows in `IsHomCriticalValue`; the locator of 4.5 reworded; the two normalisations stated; the shape of the intervals in the Lean statement; the scope sentence on minimum spanning trees; the pointers to a script removed; the docstring lists the prose headlines; the docstring of 3.3 says what it is; the redundant hypothesis of 7.1 dropped).
- N01–N03: repaired. The first question (6.4) is asked again above; the second is settled by the range `0 < r < τ/2` in 5.3.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `rankInv`, `IsQTame` | `Ico 0 1`; sum of copies of `𝕜` constant; zero maps | `1, 0, 0` at `(0,1/2), (0,1), (1/2,0)`; `⊤`; `0` | sound | N03 |
| 1.2 `rankInv_eq_encard_of_decomposition` | one interval; countably many `[0,1)` | `1` or `0`; `⊤ = ⊤` | sound | none |
| 1.3 finite type (sampled) | `A = ∅`; `V = 0`; `(0,1)`; `[a,a')` sums | single `ℝ`; empty index; not finite type; cells `(-∞,a₁), [a_i,a_{i+1}), [a_k,∞)` | sound; Oudot locators unread | none |
| 1.3 Crawley-Boevey, uniqueness | `⊕ [0,1/n)`; source hypotheses | decomposable, `q`-tame, not PFD; source needs no PFD for uniqueness | sound; narrower than source | C01 |
| 1.4 `rankDiagram_eq_encard_of_decomposition` | `Ici 0` `(0,⊤)`; `Iic 0` `(⊥,0)`; constant `(⊥,⊤)`, `(0,⊤)`; `Ico 0 1` `(⊥,⊤)`; `⊕[0,1/n)` | `1`; `1`; `1`, `1-1=0`; `0`; `1` at `(0,1/n)` | sound | C02 |
| 2.1 bottleneck, triangle | `{(0,2)}` vs `{(0,3)}`, `{(5,7)}`, `∅`; `{(0,⊤)}` vs `{(1,⊤)}`, `∅` | `1, 1, 1`; `1`, `⊤` | sound | none |
| 2.2 Wasserstein (sampled) | `{(0,2),(0,4)}` vs `∅`, `q = 1, 2`; empty matching `q = 2` | `3`, `√5`; `√13/2`; `d_B = 2 ≤ 3` | sound; source uses `ℓ^q`, noted | none |
| 2.3 isometry theorem | `Ici 0` vs `0`; `Ico 0 2` vs `Ico 0 3`; ephemeral `𝕜^(ℕ)` vs `0`; `Icc 0 1` vs `0`, `ε = 1/2` | `⊤ = ⊤`; `1 = 1`; `0 = 0`; not interleaved | theorem sound; route sentence false | R01 |
| 2.4 `exists_matching_of_bottleneckDist_le` (sampled) | `{(0,2)}` vs `{(0,3)}`, `η = 1`; `η = ⊤` | full matching cost `1`; empty matching allowed | sound | none |
| 3.1 `IsHomCriticalValue` (sampled) | `x²`; `x³-3x`; `x` on `[0,1]` | `{0}`; `{-2, 2}`, module `ℝ ⊕ [-2,2)`; `{0}` | sound; EH pages unread | none |
| 3.2 stability | empty `X`, `δ < 0`; `δ = 0` | both modules `0`; identity | sound | none |
| 3.3 `measure_bottleneckDist_le` (sampled) | inclusion of events | left event inside right by 3.2 | sound; marked as a consequence | none |
| 3.4 Morse bars | circle, minima `0,1`, maxima `2,3`; torus; `M = ∅` | `c₀ = 2`, `c₁ = 1+1`; `c = β = (1,2,1)`; `0 = 0` | sound | none |
| 4.1 simplicial filtrations (sampled) | `f = card`, filled triangle; `f = 0` | degree 0 `[1,∞) ⊕ [1,2)²`, degree 1 `[2,3)`; degree 1 `0` | sound | none |
| 4.2 Euler–Poincaré, insertion (sampled) | hollow, filled triangle; six-vertex `ℝP²`; point | `0`, `1`; `6-15+10 = 1 = 1-1+1`; exponent `card+1` gives `+1` | sound | none |
| 4.3 pairing lemma, correctness (sampled) | order `0,1,2,01,12,02,012`; `i = m-1`; `R = D`, `V = 1` | pairs `(1,3),(2,4),(5,6)`; corner ranks `1,0,0,0` and `1,0,0,1`; rows `≥ m` rank `0` | sound; `j+1` is natural-number addition | none |
| 4.4 simplicial stability (sampled) | `f = g`; one vertex shifted by `c` | `0 ≤ 0`; `W_q ≤ c`, `d_B ≤ c` | sound; matches DeyWang2022 lines 2760, 2795 | none |
| 4.5 single linkage | points `0,1,3,6`, `r = 0.6`; path `0—6—3—1` | `2 + 1 = 3`; `3 + 1 = 4 ≠ 3` | sound | C04 |
| 5.1 `iSup_abs_infDist_sub_eq_hausdorffDist` | `{0}` vs `{0,1}` | `1 = 1` | sound | none |
| 5.2 reach, wfs, isotopy | `{0,2}`; circle; tangent circles; `∅`; point | `1 = 1`; `1 = 1`; `0 < 1`; `0`; `⊤` | sound | C03 |
| 5.4 correspondences (sampled) | two-point spaces `2`, `2+2ε`; `X × Y`; empty relation | distortion `2ε`, `d_GH = ε`; `max diam`; not a correspondence | sound; factor `1/2` as DeyWang2022 line 6660 | none |
| 6.1 inclusions | equilateral side `2`; `r < 0`; Jung `d = 2` | `2/√3 ∈ (1, √2]`; both empty; `1/√3` | sound | none |
| 6.2 nerve lemma (sampled) | `ι` empty; three arcs; two arcs | `0 ≅ 0`; `β₁ = 1`; hypothesis fails | sound; homological form, own route | none |
| 6.3 Čech equals offsets | one point; two points, `r = 1`; `D = 0` | `[0,∞)`; midpoint critical at `1`; full simplex vs point | sound; route gap at critical `r` | C03 |
| 6.4 Rips stability | two-point spaces; distortion `2η` | `ε = ε`; edge `≤ 2r + 2η = 2(r+η)` | sound | question |
| 7.1 Niyogi–Smale–Weinberger (sampled) | constants; `N = ∅`; squared distance | `2√(3/20) = √(3/5)`; vacuous; `ε² + s'ε²/τ + s'²` | sound; primary source unread | none |
| 7.2 inference windows | offsets; Rips pairs `(a,2b)`, `(2a,b)` | nonempty iff `4ε < wfs`; iff `9ε < wfs`; both pairs meet the offset conditions | sound | none |
| 7.3 Rips pairs (sampled) | pairs `(α, 2√2α)`, `(√2α, 2α)`; `ε = 0.05`, `τ = 1`; `ε = α = 0` | `α ≥ (2+√2)ε`; `[0.1707, 0.3359)`; `1/(5+4√2) = 0.09383`; both `H_p(K)` | sound; source constants `3ε`, `0.14524` agree | N04 |
| 8.1 distance to a measure | `(δ₀+δ₂)/2`; `δ₀` vs `(1-m)δ₀+mδ_L`; sample `{0,1,3}` | `1`, `√2`; `L = 0 + L`; `1/2` | sound | none |
| 8.2 landscapes (sampled) | `{(0,4),(1,3)}`, `t = 2`; `{(0,2)}` vs `{(0,3)}`; bar `(1,1)` | `2, 1`; `1 = d_B`; zero tent | sound; matches DeyWang2022 lines 13609, 13639 | none |
| 8.4 sampling bound, rate (sampled) | uniform on `[0,1]`, `n = 60, 100`, `ε = 0.1`; `n = 0`; source with `ε/2` | `40e⁻³ = 1.99`, `40e⁻⁵ = 0.27`, true value `0.0037`; event empty; `4^b/(aε^b)·e^{-naε^b/2^b}` | sound; agrees with ChazalGlisseLabruereMichel2015 line 442 | none |

- Source locators checked against the text: 14 in DeyWang2022 (statements agree; its author copy is paginated differently from the edition cited), 9 in ChazalDeSilvaGlisseOudot2016 (contents agree; the arXiv numbering is one chapter behind the edition cited), 2 in ChazalGlisseLabruereMichel2015.
- Library declarations opened at the pins: 8, among them `TauCeti.wassersteinEDist` (`MeasureTheory/OptimalTransport/Wasserstein/Basic.lean` line 189, an infimum of `eLpNorm` over couplings, no measurability of the distance assumed), `TauCeti.IsMorse` (`Geometry/Manifold/Morse/Basic.lean` line 212, smoothness included), `TauCeti.quasiIso_cechTotalAugmentation` (`OrderedQuasiIso.lean` line 409), `TauCeti.cechSingularChainsMap` (`Cech/Map.lean` line 56).
- Cross-roadmap citations resolved: 8 on main (MathematicalStatisticsAsymptotic §§3.1, 3.2, 3.4; QuiverRepresentations §5.1; MorseTheory Layer 2 and §4.1; OptimalTransport §§3.1, 15.6; AlgebraicTopology §4.7) and 3 at open heads (SpanningTreesAndShortestPaths §§2.1, 2.2, 2.4; MathematicalStatisticsHigherOrderAndResampling Layer 6; KernelsAndSpectralMethods §5.4).
- Dependency check output: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line. SpanningTreesAndShortestPaths is a new roadmap of another author's open pull request and is not in the merge order yet.
- Elaboration: `Suggested.lean` elaborates with 43 `sorry` warnings and nothing else. Elaborated types compared with the README statements; the three declarations reported as losing a section binder (`dtm`, `kNNDist`, `tent`) do not need it; `cornerRank D i (j + 1)` and `k / n` elaborate with the casts innermost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 43 theorems closes. `measure_bottleneckDist_le` follows from 3.2 by monotonicity and says so in its docstring.
- Duplication: no persistence module, bottleneck distance, Rips or Čech complex, nerve of a cover, reach, correspondence or landscape in the pinned Mathlib or Tau Ceti; the three same-name hits (`eulerChar`, `IsReduced`, `distortion`) are other objects. No change outside the roadmap folder.
- Overlap check: read KernelsAndSpectralMethods, StatisticalLearningTheory, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsNonparametric, MorseTheory, MathematicalStatisticsAsymptotic; nothing shared (KernelsAndSpectralMethods consumes 8.4 and 5.3 and owns neither; minimum spanning forests are SpanningTreesAndShortestPaths's, cited).

Source independence: 25 passages compared with 3 sources (DeyWang2022, ChazalDeSilvaGlisseOudot2016, ChazalGlisseLabruereMichel2015), none shared; largest share Oudot2015, 19 of 67 locators, whose text and table of contents could not be read; contents compared with DeyWang2022 (17 locators): independent, its Chapter 2 material stands in Layer 6 after its Chapter 3 material in Layer 4, and Layers 1, 2 and 5 match none of its chapters.

Research link: Layers 1–2 state Crawley-Boevey's decomposition theorem (2015) and the isometry theorem of Chazal–de Silva–Glisse–Oudot (2016); Layer 7 the inference theorems of Niyogi–Smale–Weinberger (2008) and Chazal–Lieutier (2007); Layer 8 the rates of Chazal–Glisse–Labruère–Michel (2015) and Bubenik's landscapes (2015). Rests on the README's references and ChazalDeSilvaGlisseOudot2016 line 2299, ChazalGlisseLabruereMichel2015 line 442.

## Not verifiable

- Oudot2015 (19 locators, among them those of 1.3, 2.2, 7.1, 7.2 and 8.1): no legal copy could be read.
- EdelsbrunnerHarer2010 (16 locators, among them those of 3.1, 4.2, 4.3, 4.4 and 6.2): no legal copy found; the README cites the pages of a 2008 manuscript.
- CarlssonVejdemoJohansson2022 (the first locator of 4.5): no legal copy found.
- NiyogiSmaleWeinberger2008 (7.1, 5.3): the citation resolves only to a paywalled page.
- Page numbers of Dey–Wang and theorem numbers and pages of Chazal–de Silva–Glisse–Oudot in the editions cited: only the author copy and the arXiv version were read.
- Ownership against board packages not yet in a pull request was not checked.

Automatic checks set aside as false positives: none.

## Source issues

- **Misprint** in DeyWang2022 at Definition 3.9, printed p. 62 of the author copy (line 2740): the source says the sup-norm distance of two points is the larger of the coordinate differences within each point; it should be the larger of the differences between corresponding coordinates of the two points; affects nothing.

## For the human reviewers

- **Not tested.** Oudot2015 has the largest share of the locators (19 of 67) and could not be read; neither could EdelsbrunnerHarer2010 (16). Wording and arrangement were not compared with either.
- **Licence.** README "Prior formalization" (lines 1404–1429) says parts of every layer are formalized in the author's lean-CKSD (Apache 2.0). `Suggested.lean` was not compared with that repository.
- **Licence.** README line 1448 gives Edelsbrunner–Harer page numbers "as in the authors' 2008 manuscript" rather than the published book.
