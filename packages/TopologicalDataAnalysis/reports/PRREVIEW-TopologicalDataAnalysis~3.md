# Review of TopologicalDataAnalysis (pull request #2525 at dd32e66)

**Verdict:** needs changes

**Summary.** Changes are still needed, for the one finding of the previous review: the files are unchanged, so the route of the isometry theorem in 2.3 still asserts two interleaving lemmas that are false at the boundary value and that the roadmap's own Checks refute. The rewritten description now agrees with the head on the four points raised before (the consumer, the supplier that is not on main, the count of 43 theorems, the wording on sources). There are five small corrections (four carried over because the README and the Lean file did not change, one new on the description's fallback route) and four format notes, none blocking. Two of the five main sources could not be read; that is left to the human reviewers.

## R01 (P2) — Intervals whose endpoints differ by at most `ε` need not be `ε`-interleaved, and an interval of half-length `ε` need not be `ε`-interleaved with `0`

An implementer who takes the two parenthetical lemmas of the route `d_I ≤ d_B` in 2.3 (README lines 447–449) as targets will try to prove false statements. The text reads "two intervals whose endpoints differ by at most `ε` are `ε`-interleaved by identities where defined" and "an interval of half-length at most `ε` is `ε`-interleaved with `0`".

Take `ε = 1/2` and `intervalModule 𝕜 (Set.Icc 0 1)`, of half-length `1/2`: by the third clause of `IsInterleaved` (`Suggested.lean` lines 263–264) at `t = 0`, the structure map `V_0 → V_1` would equal `φ_0 ≫ ψ_{1/2}` and so factor through `W_{1/2} = 0`; but `0` and `1` both lie in `Set.Icc 0 1`, so that map is the identity of `𝕜`. Take `ε = 0` and the intervals `Set.Ico 0 1`, `Set.Icc 0 1`, whose endpoints agree: the Checks of the same layer say that `0`-interleaved means isomorphic (lines 522–523) and that these two modules are not isomorphic (lines 524–525). Both sentences hold with a strict margin.

The smallest change: "are `ε'`-interleaved for every `ε' > ε`" in both parentheses. Both distances are infima, so the conclusion `d_I ≤ d_B` is unaffected, and the Check at lines 488–489 (the half-open `[0, 1)`, exactly `ε ≥ 1/2`) stays true as written.

## C01 — Uniqueness of the barcode does not need pointwise finite dimension

`IntervalDecomposition.exists_equiv` (README 1.3; `Suggested.lean` line 197) assumes the module pointwise finite-dimensional. Any two interval decompositions of a persistence module are matched by a bijection, because the endomorphism ring of an interval module is the field (ChazalDeSilvaGlisseOudot2016 lines 424–437). The hypothesis excludes decomposable modules that are only `q`-tame, such as the sum of the interval modules of `[0, 1/n)`, `n ≥ 1`, where `V_0` has infinite dimension. Dropping `hV` gives the cited statement; the route can keep the count for the pointwise finite-dimensional case and name Azumaya's theorem for arbitrary families.

## C02 — The diagram of a decomposition holds for `q`-tame decomposable modules

`rankDiagram_eq_encard_of_decomposition` (README 1.4; `Suggested.lean` line 202) assumes pointwise finite dimension, but only the finiteness of the four ranks of each rectangle is used, which is `q`-tameness, the class in which the isometry theorem is stated. For the sum of the interval modules of `[0, 1/n)` and a rectangle `a < 0 < b < c < 1/n < d`, the ranks are `r(b,c) = #{m : 1/m > c}`, `r(b,d) = #{m : 1/m > d}`, `r(a,c) = r(a,d) = 0`, all finite, and the measure `#{m : c < 1/m ≤ d}` shrinks to `1` at `(0, 1/n)`, the count. Would `IsQTame V` serve as the hypothesis? Some tameness must stay: countably many copies of `[0, 1)` give `⊤ - ⊤`.

## C03 — The route of 6.3 applies the isotopy lemma across the radius `r` itself, which may be critical

The route compares the closed offset of radius `r` with the open offset of radius `r + δ` "by 5.2". The isotopy lemma of 5.2 needs `0 < a` and no critical value in the closed window `[a, b]`. Here the window starts at `r`, and `r` is critical exactly where the module changes: for the points `-1`, `1` of the line and `r = 1`, the midpoint `0` is at distance `1` from both and is critical; and `r = 0` is excluded by `0 < a`. The statement itself is unaffected. Either state the nerve lemma for finite closed convex covers as the input of 6.3, or add to 5.2 the half-open version for finite point sets (no critical value in `(a, b]`, `a ≥ 0`) with its own route.

## C04 — The route of 4.5 uses a roadmap that neither its *Needs:* line nor the supplier contracts list

The route of the single-linkage count rests on "the minimax property of minimum spanning forests (the SpanningTreesAndShortestPaths roadmap, §2.4)" (README lines 786–788); that section exists at the head of that roadmap and states the property. The description now lists this supplier, but in the README the *Needs:* line of 4.5 still reads "1.2, 6.1" (line 795) and the supplier contracts (lines 176–187, headed "From roadmaps on main") list four roadmaps only. Add it to both places, with the statement assumed of it.

## C05 — The description promises a fallback route that the README does not contain

The description says of SpanningTreesAndShortestPaths: "this roadmap merges after it, or the route reverts to its own exchange argument". The README has no exchange argument: the route of 4.5 gives only the minimax property of §2.4 of that roadmap (lines 783–788). Either write "this roadmap merges after it", or put the exchange argument in 4.5 as the alternative route. In the same paragraph, "(on main, except the last)" is followed by eight bullets of which the fifth, not the last, is the roadmap that is not on main; "the four roadmaps on main, and one in an open pull request" would say it. The sentence on KernelsAndSpectralMethods could add that it also cites 5.3 (line 639 of that roadmap's README at its head).

## N01 — Section comments of the Lean file differ from the README's layer titles

Layers 3, 5, 7 and 8 carry other titles in `Suggested.lean`, and the two declarations of 4.5 stand under Layer 6.

## N02 — Two sections need a later layer

5.1 needs 6.2 and 4.5 needs 6.1, while 6.3 and 6.4 need Layer 5; a sentence in "How to read the build" would say that Layers 5 and 6 are built together.

## N03 — `𝕜^ℕ` with "countable dimension"

In the Checks of 1.4 the space meant is the direct sum of countably many copies of `𝕜`; `𝕜^ℕ` usually denotes the product.

## N04 — 7.3 does not say that the sample is nonempty

The prose has "`P` finite", the Lean statement `[Nonempty ι]`; Mathlib's `hausdorffDist K ∅` is `0`, so the hypothesis is needed and the Conventions could record this junk value.

## Questions for the author

- 6.4 cites Chazal–de Silva–Glisse–Oudot, Thm 1.1, p. 6. The arXiv version of that work has no numbered statement in its introduction and none on the Gromov–Hausdorff distance (its only sentence on Rips complexes is ChazalDeSilvaGlisseOudot2016 lines 1383–1386). Does the Springer edition have a Theorem 1.1 with this content? I could not read that edition.
- 1.3 cites Chazal–de Silva–Glisse–Oudot, Thm 2.8, for Crawley-Boevey's theorem. In the arXiv version the corresponding theorem covers finite and locally finite index sets, and the result for `ℝ` is a remark after it (lines 441–452). Is it part of the theorem in the edition cited? Same obstacle.

## Previous findings

- R01 — not repaired: "two intervals whose endpoints differ by at most `ε` are `ε`-interleaved by identities where defined … an interval of half-length at most `ε` is `ε`-interleaved with `0`" (README lines 447–449, unchanged). Raised again as R01.
- C01–C03 — not repaired (files unchanged): raised again as C01–C03.
- C04 — partly repaired: the description lists SpanningTreesAndShortestPaths §2.4; the README's *Needs:* line of 4.5 is still "1.2, 6.1". Raised again as C04.
- C05 — repaired: the description now has "KernelsAndSpectralMethods (§5.4 …) cites the sampling bound and rate of 8.4", "(on main, except the last)", "its 43 theorems are admitted", "results whose source is a paper". A residue is C05 above.
- N01–N04 — not repaired (files unchanged): written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.3 route lemma, interval against `0` | `Icc 0 1`, `ε = 1/2`; `Ico 0 1`, `ε = 1/2` | `V_0 → V_1 = id ≠ 0` through `W_{1/2} = 0`; `V_0 → V_1 = 0`, interleaved | false for closed interval | R01 |
| 2.3 route lemma, matched intervals | `Ico 0 1` vs `Icc 0 1`, `ε = 0`; `ε' > 0` | not isomorphic, so not `0`-interleaved; `ε'`-interleaved, `d_I = 0` | false at `ε`, true above | R01 |
| 2.3 `interleavingDist_eq_bottleneckDist` | `Ico 0 2` vs `Ico 0 3`; `Ici 0` vs `0` | `1 = 1`; `⊤ = ⊤` | theorem sound | none |
| 1.3 uniqueness, 1.4 diagram | `⊕ [0,1/n)` | `dim V_0 = ∞`; ranks `#{m: 1/m > t}` finite for `t > 0`; rectangle measure `1` | sound, narrower than needed | C01, C02 |
| 6.3 route | points `-1, 1`, `r = 1` | `infDist 0 = 1`, `0` in hull of nearest points: critical value `1` | statement sound, route gap | C03 |
| 4.5 single-linkage count (cited by the description) | points `0,1,3,6`, `r = 0.6` | tree edges `1,2,3`; two exceed `1.2`: `2 + 1 = 3`; Rips components `{0,1},{3},{6}`: `3` | sound | C04 |
| 8.4 sampling bound (cited by the description) | consumer's citation | KernelsAndSpectralMethods README lines 628–641 at its head cite 8.4 and 5.3 | description true, incomplete | C05 |

The rows for all other statements stand as in the previous review, of `dd32e66`; no statement changed.

- Source locators checked against the text: none new (no passage of the folder changed); the 25 of the previous review stand.
- Library declarations opened at the pins: `IsInterleaved` of `Suggested.lean` (lines 257–266) read against the route; no persistence module, bottleneck distance or Rips complex in the pinned Mathlib or Tau Ceti (searched again).
- Cross-roadmap citations of the description resolved: 4 on main (MathematicalStatisticsAsymptotic, QuiverRepresentations under `RepresentationTheory/`, MorseTheory, OptimalTransport; the four links point at existing folders) and 3 at open heads (SpanningTreesAndShortestPaths §2.4 "Uniqueness, weights and the minimax property"; MathematicalStatisticsHigherOrderAndResampling "Layer 6: the bootstrap"; KernelsAndSpectralMethods §5.4). The three pull-request numbers in the description match those heads.
- Description claims checked against the head: the eight layer sentences against the README's headings and targets; the Mathlib and Tau Ceti lists against the supplier contracts; the ownership paragraph against Scope and ownership and against main (no persistence module, bottleneck distance, weak feature size, landscape, distance to a measure or nerve lemma for covers of spaces on main); the prior-formalization lists against the README section of that name; `43` theorems counted in the file.
- Dependency check output: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration: `Suggested.lean` elaborates with 43 `sorry` warnings and nothing else. No change outside the roadmap folder.
- Overlap check: read KernelsAndSpectralMethods, StatisticalLearningTheory, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MorseTheory; nothing shared (KernelsAndSpectralMethods consumes 8.4 and 5.3 and owns neither; minimum spanning forests are SpanningTreesAndShortestPaths's, cited).

Source independence: changed passages only: no passage of the folder changed, so nothing new was compared; as in the previous review, 25 passages compared with 3 sources, none shared; largest share Oudot2015, 19 of 67 locators, whose text and table of contents could not be read; contents compared with DeyWang2022: independent. No layer was added, removed or reordered.

Research link: Layers 1–2 state Crawley-Boevey's decomposition theorem (2015) and the isometry theorem of Chazal–de Silva–Glisse–Oudot (2016); Layer 7 the inference theorems of Niyogi–Smale–Weinberger (2008) and Chazal–Lieutier (2007); Layer 8 the rates of Chazal–Glisse–Labruère–Michel (2015) and Bubenik's landscapes (2015). Rests on the README's references and ChazalDeSilvaGlisseOudot2016 line 2299, ChazalGlisseLabruereMichel2015 line 442.

## Not verifiable

- Oudot2015 (19 locators), EdelsbrunnerHarer2010 (16 locators), CarlssonVejdemoJohansson2022 (the first locator of 4.5): no legal copy could be read.
- NiyogiSmaleWeinberger2008 (7.1, 5.3): the citation resolves only to a paywalled page.
- Page numbers of Dey–Wang and theorem numbers and pages of Chazal–de Silva–Glisse–Oudot in the editions cited: only the author copy and the arXiv version were read.
- The description's account of what is proved and what is admitted in lean-CKSD: that repository was not read.
- Ownership against board packages not yet in a pull request was not checked.

Automatic checks set aside as false positives: none.

## Source issues

- **Misprint** in DeyWang2022 at Definition 3.9, printed p. 62 of the author copy (line 2740): the source says the sup-norm distance of two points is the larger of the coordinate differences within each point; it should be the larger of the differences between corresponding coordinates of the two points; affects nothing.

## For the human reviewers

- **Not tested.** Oudot2015 has the largest share of the locators (19 of 67) and could not be read; neither could EdelsbrunnerHarer2010 (16). Wording and arrangement were not compared with either.
- **Licence.** README "Prior formalization" (lines 1404–1429) says parts of every layer are formalized in the author's lean-CKSD (Apache 2.0). `Suggested.lean` was not compared with that repository.
- **Licence.** README line 1448 gives Edelsbrunner–Harer page numbers "as in the authors' 2008 manuscript" rather than the published book.
