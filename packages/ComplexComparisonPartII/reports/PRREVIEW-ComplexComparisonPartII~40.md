# Review of ComplexComparisonPartII (pull request #3027 at 4b01d78)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 14 lines changed since `3b77a6a`, which add to C7.9 the separability of the weighted Bergman space `H(B, φ)` and the identity `Σ_k|σ_k(z)|² = sup{|f(z)|² : ‖f‖ ≤ 1}`, and make the *Needs:* lines of C7.9 and C7.13 name them. Both added statements are true (recomputed on the unit disc with the weights `0` and `2log|z|`, and on the zero space), and the description states the change. There is no finding; one small correction and one format note, neither blocking; one question to the author stays open from the previous review, and nothing is left for a human to decide.

## C01 — The addition to C7.9 asks for a pseudoconvex `B`, a plurisubharmonic `φ` and `φ(z) > −∞`, and uses none of them

A reader of C7.9 (lines 5376–5381) would conclude that separability and the kernel identity need pseudoconvexity, plurisubharmonicity and a finite weight at `z`, where the sentence just before grants the Hilbert space and the continuity of evaluation "for every bounded open `B ⊆ ℂⁿ` and every upper semicontinuous `φ`" and at every point. The two added facts follow from exactly that: `H(B, φ)` is a closed subspace of `L²(B, e^{−φ}dλ)`, which is second countable (Mathlib `MeasureTheory.Lp.SecondCountableTopology`, `Mathlib/MeasureTheory/Measure/SeparableMeasure.lean` line 427, for an s-finite measure on a countably generated space), and `Σ_k|σ_k(z)|² = ‖ev_z‖²` is Parseval for the Riesz representative of `ev_z`. A point with `φ(z) = −∞` is no exception: on the unit disc with `φ = 2log|z|`, `H` is the functions vanishing at `0`, `σ_k = √(k/π)·zᵏ` for `k ≥ 1`, and both sides are `0` at `z = 0`.

The statement is true as written and covers what C7.13 and HeightsRationalPointsAndObstructions §5.17c.2 use, so nothing depends on this. It would be more accurate to state the two facts in the generality of the preceding sentence (bounded open `B`, upper semicontinuous `φ`, every `z ∈ B`), with the pseudoconvex plurisubharmonic case named as the one used.

## N01 — "Given the continuity of evaluation, both are Hilbert-space theory" (C7.9, line 5380)

Separability does not come from the continuity of evaluation: it is inherited from the ambient `L²(B, e^{−φ}dλ)`, as the *Needs:* line already indicates by naming `MeasureTheory.Lp`. The sentence could say so ("separability is inherited from `L²`; the kernel identity is Parseval for the evaluation functional").

## Questions for the author

- C5.4j (a) and (b) are cited as Theorems 1 and 2 of Błocki–Kołodziej 2007, in that order. Is that right? The DOI resolves to the AMS journal page, a host I cannot certify, so I could not open the paper. (Carried from the previous review; the passage is unchanged.)

## Previous findings

- none: the previous review, of `3b77a6a`, had no finding, no small correction and no format note. Its one question to the author is carried above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| C7.9, kernel identity (added) | unit disc, `φ = 0`, `σ_k = √((k+1)/π)·zᵏ`, `z = 0` and general `z` | sum `= 1/(π(1−|z|²)²)`, at `0`: `1/π`; sup: `|f(0)|² ≤ (1/π)∫|f|²`, equality for `f = 1/√π`: `1/π` | holds |
| C7.9, kernel identity at a pole of the weight | unit disc, `φ = 2log|z|`, `z = 0` | `∫|z|^{2k−2} = π/k`, `σ_k = √(k/π)zᵏ`, `k ≥ 1`: sum at `0` is `0`; every `f ∈ H` has `f(0) = 0`: sup `0` | holds also where `φ = −∞`; C01 |
| C7.9, kernel identity, zero space | `H = {0}` (empty basis) | empty sum `0`; sup over `{0}` is `0` | holds; no `0/0`, independent of basis trivially |
| C7.9, independence of the basis | Riesz representative `K_z` of `ev_z` | `Σ_k|⟨σ_k, K_z⟩|² = ‖K_z‖² = ‖ev_z‖²` for every Hilbert basis (Mathlib `HilbertBasis.hasSum_inner_mul_inner`, `l2Space.lean` line 461) | holds |
| C7.9, separability (added) | `μ = e^{−φ}dλ` on `B`, `φ` measurable with values in `[−∞, ∞)` | `withDensity` of Lebesgue is s-finite, `B` countably generated: `Lp.SecondCountableTopology` applies; a subspace of a second-countable space is separable | holds, for every measurable weight |
| C7.9, evaluation bound (cited by the addition) | ball of radius `r` in `ℂⁿ` | volume `πⁿr^{2n}/n!`; `e^{−φ} ≥ e^{−M_K}` on `B(z, r)`: `|f(z)|² ≤ (n!/(πⁿr^{2n}))·e^{M_K}∫|f|²e^{−φ}` | as written; unchanged |
| C7.13, first line of the route and its *Needs:* (changed) | `Ω` bounded pseudoconvex domain, weight `mφ`, `m ≥ 1` | `mφ` plurisubharmonic, `Ω` bounded pseudoconvex open: the hypotheses of the C7.9 addition; identity as in C7.9 | the citation matches what C7.9 states |
| HeightsRationalPointsAndObstructions §5.17c.2, case (iii), citing C7.9 | its lines 127 and 2876 against C7.9 | cites: separable Hilbert space, closed in `L²`, continuous evaluations, diagonal kernel `= sup{|f(z)|² : ‖f‖ ≤ 1}`; C7.9 states each | resolved; one owner of `H(Ω, φ)` (this roadmap) |

The rows for the untouched statements stand as in the previous review, of `3b77a6a`.

- The diff: 14 lines of the README (10 added, 4 removed), in C7.9 and in the *Needs:* lines of C7.9 and C7.13; `Suggested.lean` is unchanged and no layer is added, removed or reordered.
- Source locators checked against the text this round: 2 (demailly-analytic-methods, proof of Th. 14.2 (a), lines 6826–6828, the kernel as the squared norm of evaluation; Prop. 5.7 as cited in C7.9, unchanged).
- Library declarations opened at the pin: 3 (`MeasureTheory.Lp.SecondCountableTopology`, `Mathlib/MeasureTheory/Measure/SeparableMeasure.lean` line 427, with the instance at line 382; `HilbertBasis.hasSum_inner_mul_inner`, `Mathlib/Analysis/InnerProductSpace/l2Space.lean` line 461; `exists_hilbertBasis`, line 593).
- Cross-roadmap citations resolved: the change adds none; HeightsRationalPointsAndObstructions (lines 64, 127, 2876) and SingularHermitianMetricsAndL2Methods (lines 20, 1819, 1821) cite C7.9, and the head states what each cites.
- Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean` gives ten `sorry` warnings and nothing else.
- Seeded sample: none of the 15 targets lies in or cites the changed passages; they stand as in the previous review.
- Pull request text: "ComplexComparisonPartII C7.9 now states that the weighted Bergman space of a bounded pseudoconvex open set is a separable Hilbert space whose kernel on the diagonal is the squared norm of evaluation, wherever the weight is finite; C7.13 uses this, and HeightsRationalPointsAndObstructions §5.17c.2 cites it" agrees with the head.

Overlap check: read SingularHermitianMetricsAndL2Methods and HeightsRationalPointsAndObstructions (this head), ComplexKahlerGeometry and RealAnalyticGeometry (`main`). The space `H(Ω, φ)` of a plurisubharmonic weight on a bounded pseudoconvex open set is owned here (C7.9, C7.13); HeightsRationalPointsAndObstructions §5.17c.2 excepts it from its own Bergman spaces and cites C7.9; the others share nothing with the changed passages. The other open pull request that changes this README edits *Needs:* lines of Layers C-1 to C6 only.

Source independence: changed passages only; 3 passages (the addition to C7.9, the two *Needs:* lines) compared with 1 source (demailly-analytic-methods, Prop. 5.7 and the proof of Th. 14.2), none shared beyond the phrase "norm of evaluation", which the identity forces; largest share demailly-analytic-methods, as in the previous review; the arrangement was not compared again, no layer being added, removed or reordered.

Research link: Layer C7 states the `L²` theory that work on multiplier ideals and positivity builds on: Hörmander 1965, Skoda 1972, Ohsawa–Takegoshi 1987 with Błocki's constant (2013), Nadel 1990, Demailly 1992, Siu 1974, Guan–Zhou 2015. It rests on the README's references and on *Analytic Methods*.

## Not verifiable

- Błocki–Kołodziej 2007 (C5.4j (a), (b)): the DOI resolves to the AMS journal page, a host I cannot certify.
- Błocki 2013 (C7.7), Fornæss–Narasimhan 1980 (C5.4d, C5.4j (c)), Hörmander's *Introduction* (C5.4e (j), C7.1 (a)) and Lazarsfeld I–II: paywalled.
- Demailly 1992, Proposition 3.7 (C7.15): not opened; its counterpart, *Analytic Methods* Th. 14.12, was checked in the previous review.

## Source issues

- **Misprint** in demailly-analytic-methods at Theorem 14.12 (a), p. 142: the source says the approximants are strictly larger than the function at every point; it should be larger or equal, strict only where the function is finite, since both are `−∞` where the Lelong number exceeds `n/m`; affects a stated result.

## For the human reviewers

- none
