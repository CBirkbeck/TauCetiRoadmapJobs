# Review of HeightsRationalPointsAndObstructions (pull request #3027 at 4b01d78)

**Verdict:** accepted

**Summary.** This re-review covers the 14 lines changed since `0b5086d`, and the earlier finding is repaired. Case (iii) of 5.17c.2 now takes the space `H(Ω, φ)` as ComplexComparisonPartII defines it in C7.9 and C7.13. C7.9 now states the Hilbert-space structure and the kernel identity this roadmap used, so the space has a single owner. The corrected sentence of 5.9b.1 and the completed step of the 5.17f.2 route were recomputed and hold. One small correction (the description's summary of this roadmap's additions) and one format note remain; neither blocks, and nothing is left for a human to decide.

## C01 — The description still summarises this roadmap's additions as "slopes of Hermitian vector bundles, heights", which leaves out the Bergman-kernel sections and the change of metric

Half of the earlier point is settled. The description now names BanachSpaceTheory B7.HermitianNorms as a new supplier, and says that §5.17c.2 cites ComplexComparisonPartII C7.9. Its list of the largest additions still describes this roadmap only as "(slopes of Hermitian vector bundles, heights)". A reader would not learn that the roadmap also gains:

- §§5.17c.1–5.17c.7: Bergman densities and their asymptotics, the Suita inequality, and Demailly's characterisation of big line bundles;
- §5.17a.1: the change of metric in arithmetic intersection numbers.

Text that would be right: "ArakelovGeometryAndAbelianHeights and HeightsRationalPointsAndObstructions (slopes of Hermitian vector bundles, heights; in the latter also Bergman kernels and their asymptotics and the change of metric in arithmetic intersection numbers)".

## N01 — The code-font names of the added sections are still proposed names that `Suggested.lean` does not declare

Examples are `projectiveCycleHeight_eq_chowSphericalHeight` (5.9b.1), `fekete_superadditive_error` (5.17d.1) and `symmetricPower_maxSlope_bounds` (5.17f.2). House style writes a proposed name in prose, or declares it, so that a reader can tell a proposal from a declaration.

## Previous findings

- R01 — repaired (it was deferred as D01): 5.17c.2, line 2876: "in case (iii) this is the space `H(Ω, φ) = {f ∈ O(Ω) : ∫_Ω |f|²e^(−φ) dλ < ∞}` that ComplexComparisonPartII defines in C7.9 and C7.13, used here as it stands."
- C01 — partly repaired: the description now has "HeightsRationalPointsAndObstructions gains BanachSpaceTheory as a supplier, for B7.HermitianNorms", but still lists the additions as "(slopes of Hermitian vector bundles, heights)" (C01 above).
- C02 — repaired: line 2496: "With the spherical height of the Chow form in place of its coefficient height, the comparison of §5.9b, which holds up to an error controlled by the degree, becomes an identity."
- C03 — repaired: line 3068: "the line of index `α` (`|α| = ℓ`) has normalised degree `Σ_i α_i·deĝ_n(M̄_i) + ½·log(ℓ!/α!)` … this is at most `ℓ·μ̂_max(Ē_0) + (ℓ/2)·log r`."
- N01 — not repaired: the proposed names of the added sections, such as `fekete_superadditive_error`, remain in code font without a declaration (N01 above).

## Deferred findings

- D01 — resolved: ComplexComparisonPartII C7.9 now states the Hilbert space, continuous evaluation and kernel-diagonal identity, and §5.17c.2 case (iii) uses `H(Ω, φ)` as it stands, citing it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 5.17c.2 (iii): `weightedBergmanSpace` is `H(Ω, φ)` | unit disc, `φ = 0` | Both are `{f ∈ O(D) : ∫|f|² < ∞}`. Density at `0`: `Σ(k+1)/π·0^{2k} = 1/π`; `sup|f(0)|² = 1/π`, at `f = 1/√π` | holds |
| 5.17c.2 (iii): density = sup, via the factor `e^(−φ(x))` | `φ = c`; `φ = log|z|²` at `z ≠ 0` and at `0` | `φ = c`: `e^{−c}·e^{c}/(π(1−|z|²)²)` on both sides. `log|z|²`: `|z|^{−2}·|z|²/(π(1−|z|²)²)` on both sides. At `z = 0` the weight is infinite and excluded | holds |
| CC C7.9 identity, as cited (`φ(z) > −∞`) | `φ = log|z|²`, `z = 0` | `Σ|z·g_k(0)|² = 0` and `sup|f(0)|² = 0` | holds there too; the restriction only narrows it |
| Supplier contract on CC C7.9 (line 127) | each clause against CC README lines 5370–5381 | Separable: yes. Closed in `L²(e^{−φ}dλ)`: yes. Continuous evaluation: yes. Diagonal = sup where `φ(z) > −∞`: yes | agrees |
| 5.9b.1 sentence (C02 repair) | `[1:1] ⊂ ℙ¹_ℚ`; `ℙ¹ ⊂ ℙ¹` | `[1:1]`: `½log2 = (½log2−½)+½`; the coefficient height is `0`, an error of `½log2`. `ℙ¹`: `½ = −½+1` | identity with the spherical height only |
| 5.17f.2 bound on the monomial lines (C03 repair) | `Sym²ℤ²`; `ℓ=3, r=2`; rank 1 | `Sym²`: `½log2 ≤ 0+log2`, `1+2+1 = 4 = 2²`. `ℓ=3`: `3!/(2!1!) = 3 ≤ 8 = 1+3+3+1`. Rank 1: `ℓ!/ℓ! = 1`, `log 1 = 0` | holds |
| 5.17f.2 collected constant | general `r`; `r = 2` | `½ + ½ + (r−1)/2 + r/2 = r + ½`. `r = 2`: `2.5·log2 ≈ 1.733 ≤ 4·log2 ≈ 2.773` | holds |
| gaudron2008 p. 85 for the new clause | gaudron2008 lines 2169–2181 | The source bounds `μ_max(S^ℓ E_0)` by `ℓ·μ_max(E_0) + (ℓ/2)·log n`. The README has the same bound, with `r` for `n` | supported |
| Headlines (`Suggested.lean`, unchanged) | elaboration | 11 declarations; 7 `sorry` warnings, no errors | unchanged |

The rows for untouched statements stand as in the previous review, of `0b5086d`.

- **Changed text:** 7 lines change, each a sentence reworded or extended: the scope, the supplier contracts, 5.9b.1, three lines of 5.17c.2 and 5.17f.2. No heading, layer, item or Lean declaration is removed.
- **Source read:** gaudron2008 pp. 84–86 (lines 2142–2207), for the 5.17f.2 step and the collected constant `(n + ½)·log n`.
- **Supplier sections resolved at this head:**
  - ComplexComparisonPartII C7.9 (its README line 5363) and C7.13 (line 5455). Both come with Layer C7, which this pull request adds to that roadmap, and ComplexComparisonPartII cites this roadmap nowhere.
  - ArakelovGeometryAndAbelianHeights §1.2a (v) (its line 123): the monomial-line degrees and `Σ_{|α|=m} m!/α! = r^m`.
  - This roadmap's §5.9b (line 2473): the comparison with the coefficient height, with its degree error.
- **Libraries at the pin:** Mathlib `HilbertBasis` (`Mathlib/Analysis/InnerProductSpace/l2Space.lean:376`) and `MeasureTheory.Lp` (`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89`).
- **Automatic checks:** the worker's run passed every check. Dependency check: `depcheck: 132 roadmaps, 1482 edges, 0 problem(s)`. In a run by hand, every other check also passed.
- **Elaboration:** `lake env lean` on `Suggested.lean`, unchanged since `0b5086d`, gives 7 `declaration uses sorry` warnings and no errors.
- **Seeded sample:** none of the 15 targets lies in the changed lines. The README flags no locator as unverified.
- **Pull request text:** checked against this head. The sentences on C7.9, §5.17c.2, §5.9b.1 and BanachSpaceTheory are accurate; one summary is incomplete (C01).

Overlap check:
- I read HeightsRationalPointsAndObstructionsPartII (open), and ArakelovGeometryAndAbelianHeights, ArakelovGeometryAndAbelianHeightsPartII and ArithmeticStatisticsPartVI (main); their ownership stands as in the previous review.
- For the changed text I searched every open head and `main` for weighted Bergman spaces:
  - `H(Ω, φ)` is owned by ComplexComparisonPartII C7.9 and cited here.
  - SingularHermitianMetricsAndL2Methods §3.6 cites §5.17c.2.
  - VonNeumannAlgebras and SpecialFunctionsGroupModels build their own Bergman models for discrete series, on the half-plane and the disc. None is owned here.

Source independence: 5 changed passages compared, one of them with a source text (gaudron2008 p. 85); only the forced bound `ℓ·μ̂_max(Ē_0) + (ℓ/2)·log r` is shared. The other four are citations and bookkeeping with no source wording (changed passages only). The changed passages add no source locator. Contents were not compared, since no layer is added, removed or reordered.

Research link: the sections 5.17a–g supply the slope-method and Bergman-kernel inputs to the Arakelov route of the README's finiteness theorems: Rémond's form of Faltings and Bogomolov through Zhang's successive minima. They rest on Zhang 1995, Bost 2001, Gaudron 2008, Chen 2010, Gaudron–Rémond 2013, Tian 1990 and Berman 2004. This line rests on the README Summary and §§5.17a–g, and on the sources read.

## Not verifiable

- Nothing in the changed passages. The previous review's list concerns untouched text and stands: bgs1994 (an image-only scan), and the unfetched Zhang 1995, Błocki 2013, Suita 1972, Guan–Zhou 2015, Tian, Zelditch, Catlin, Kobayashi, Aronszajn, and Demailly's LNM 1507 and CADG.

Automatic checks set aside as false positives: the rule that a pull request changes nothing outside its roadmap folder (so that a review of one roadmap sees every edit it lets through), when run by hand without the list of this pull request's other folders, flags 123 files as changes outside this folder; each of them lies in a roadmap folder this pull request owns (checked file by file).

## Source issues

- none

## For the human reviewers

- none
