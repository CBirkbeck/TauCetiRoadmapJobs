# Review of DimensionOfMeasuresAndDigitSets (pull request #2937 at 75b7dc6)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the four layers was recomputed in its degenerate cases (`b ≤ 1`, the zero measure, infinite measures, zero entries of `p`, `k = 0`, `R ≤ 1`) and each agrees with its Checks; all twelve sampled locators were read in the three sources and support the statements at the stated generality, and where the roadmap is wider than a source it says so and gives a route that holds. There are one small correction and two format notes, none blocking. For the humans: two of the three sources are an author's draft and unpublished lecture notes, and the draft's numbering was not compared with the published book.

## C01 — Three sentences leave the base hypothesis `b ≥ 2` tacit, against the convention that a statement needing it says so

The Conventions (line 47) promise that a statement that needs `b ≥ 2` says so, and 1.2 proves that for `b ≤ 1` the local dimension is identically `0`. Read with that convention, three sentences are then asserted for every `b` and fail at `b = 1`: the Summary's "Dimension of a measure" bullet (lines 19–21), which has no base hypothesis although 2.2 needs one and its own Check (line 259) shows the failure for Lebesgue measure on `[0, 1)`; the first Check of 1.2 (line 112, "the local dimension is `1`": it is `0` for `b = 1`); and the second Check of 1.2 (line 114, `⊤` at `y ≠ x₀`: it is `0` for `b = 1`). No stated result is touched, since 1.3, 1.4, 2.2 and the Lean signatures carry the hypothesis correctly.

Adding "for `b ≥ 2`" to each of the three sentences makes them agree with the layers.

## N01 — In the last Check of 3.1 (line 316), "the positions `j²`" should say `j ≥ 0`

With positions `0, 1, 4, 9, …` the number is at least `1/2` and every cell of level `n ≥ 1` misses `0`, so has `μ_p`-mass `0`, as stated. If a reader starts at `j = 1`, the first digit is `0`, the level-one cell is `[0, 1/2)` and has mass `1`.

## N02 — "Jarník, 1928" is cited in 4.2 (line 467) but is not in the References

Either add the entry or cite the theorem through Beresnevich, Ramírez and Velani alone, as the locator already does.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `badicCell`, digits | `b=2, x=3/4`; `b=3, x=1/3`; `b=0, n≥1`; `n=0` | `⌊3/2⌋,⌊3⌋,⌊6⌋ = 1,3,6` give `[1/2,1),[3/4,1),[3/4,7/8)`, digits `1,1,0`; `⌊3ⁿ/3⌋=3ⁿ⁻¹`; `b=0`: `Ico 0 0 = ∅` | agrees with Checks | none |
| 1.1 maximal cells disjoint with same union | chains of cells, levels in `ℕ` | level `≥ 0` bounds every chain above, so maximal members exist; nested-or-disjoint for `b ≥ 2` | true | none |
| 1.2 `badicLowerLocalDim` | Lebesgue on `[0,1)`; `δ_{x₀}`; Lebesgue `+ δ₀`, `b=2`; Cantor measure at `1/3`; `b ≤ 1`; `n = 0` | `1`; `0` at `x₀`, `⊥/(−n log b)=⊤` elsewhere; `log(3/2)/(−log 2) = −0.585 → 0`; cell `[1/3,2/3)∩C={1/3}`, `⊤`; denominator `0`, value `0` | agrees | C01 (base tacit) |
| 1.2 two reformulations | `μ(I)=0`, `μ(I)=∞`, `n=0` | `f_n > α' ⇔ μ(I_n) < b^(−nα')` incl. `⊤`,`⊥`; one index `n=0` irrelevant to liminf | true | none |
| 1.3 lower bound | `b ≤ 1`; `α ≤ 0`; zero measure; infinite `μ`; non-measurable `A` | `b ≤ 1`: hypothesis forces `α ≤ 0`, `ofReal α = 0`; ball of radius `≤ b⁻ⁿ` meets `≤ 3` cells, `ν(ball) ≤ 3b^α' r^α'`; `μ=0`, `A={0}`: hypothesis holds, `dimH = 0` | true; `μ A ≠ 0` needed | none |
| 1.4 upper bound | `β < 0`; `b = 1`; counting measure on `ℚ∩[0,1)` | `β<0`: `f ≥ 0` so `A = ∅`, `dimH ∅ = 0`; `b=1`: `f≡0`, `dimH [0,1) = 1 > 0`; `⊤/(−n log b) = ⊥ ≤ 0`, `dimH = 1` | true; both hypotheses needed | none |
| Layer 1 example `A_S` | `S` finite, cofinite, infinite | cell mass `2^(−#(S∩[0,n)))` in each case (tails of ones are null or absent); both bounds give the liminf | true | none |
| 2.1 `upperDimH`, `lowerDimH` | `μ = 0`; Lebesgue `+ δ₀`; Cantor measure | `0` and `⊤` (empty infimum); `1` and `0`; both `log 2/log 3` | agrees | none |
| 2.2 essential bounds | `μ=0`; `b=1`; counting measure on `ℚ∩[0,1)`; Lebesgue `+ δ₀`; `essSup = ⊤`? | `0 ≠ ⊥`; `0 ≠ 1`; `0 ≠ ⊥`; `(1, 0)` both sides; 1.3 forces `f ≤ 1` a.e., so no `⊤` | true; three hypotheses needed | none |
| 3.1 digit measures, `digitFrequencySet` | `p=(1/3,2/3)`; `p(b−1)=1`; factorial-block number; `p=(1,0)` with ones at `j²` | `1/3`, `(2/3)(1/3)=2/9`; `δ₁`, cell `[1,1+b⁻ⁿ)` mass `1`; frequencies `→ 0` and `→ 1` along `(2k+2)!`, `(2k+1)!`; `√N/N → 0` | agrees | N01 |
| 3.2 `dimH_digitMeasure` | `p=(1/3,2/3)`; uniform; unit mass; `b=1`; `μ=0` | `0.63651/0.69315 = 0.91830`; `1`; `0` (incl. `p(b−1)=1`, `δ₁`); identity map, any `μ`; `lowerDimH = ⊤` | true | none |
| 3.3 Besicovitch–Eggleston | `p=(1/2,1/2,0)`, `b=3`; `p=(1,0)`, `q=(1−t,t)`; `b=1` | `0.63093`; `−log(1−t)/log 2 = 0.15200, 0.01450, 0.00144`; set `[0,1)`, dimension `1` vs formula `0/0 = 0` | true; cross-entropy route covers zero entries | none |
| 3.4 non-normal numbers | `b=1`; `b=10`, `ε=0.01, 0.001`; sum of `p_ε` | `IsNormalBase` false, set `[0,1)`, `1`; `2.26598/2.30259=0.98410`, `0.99981`; `(b−1)(1/b−ε)+1/b+(b−1)ε = 1` | true for all `b ≥ 1` | none |
| 4.1 prefix-restricted Cantor set | `k=0`; `R=0`; `R=1,k=1`; `k=1`; `k=R`; `R=5,k=3` | `∅`, `0`; no sequences, `0`; `{0}`, `0/0=0`; point, `0`; `[0,1]`, `1`; `log 3/log 5 = 0.68261`; lower bound `Σdᵢˢ ≥ 1/(2k)` | true | none |
| 4.2 Jarník | `R=4,10,100`; `R=4,n=6`; `n=4`; separation | `0.5, 0.90309, 0.99561`; `Σφ(q), q=8..15 = 54`, least gap `1/(14·15)=1/210 > 1/256`; `1/3,1/2,2/3`; needs `R+1 ≤ R²`; `R⁻ⁿ ≥ R⁻³q⁻²` | true | N02 |
| Summary, bullet on the dimension of a measure | `b = 1`, Lebesgue on `[0,1)` | local dimension `0`, `upperDimH = 1` | false without `b ≥ 2` | C01 |

- Source locators read against the text: 23 (Bishop–Peres draft: §1.4, Lemma 1.4.1, Example 1.4.2, Definition 1.4.3, Lemma 1.4.4, Example 1.4.5, §1.5, Example 1.5.1, Theorem 1.5.2, Lemma 1.5.4, Example 1.5.6; Hochman: §4.2, Lemma 4.6, Proposition 4.7, Remark 4.8, Proposition 4.9, Corollary 4.10, Definitions 6.20, 6.22, Propositions 6.21, 6.24; Beresnevich–Ramírez–Velani: §1.3, Corollary 2.1, Lemma 7.1, Theorem 7.1 and its proof). All pages agree with the README.
- Library declarations opened at the pins: 27 in Mathlib (among them `Topology/MetricSpace/HausdorffDimension.lean` lines 124, 131, 143, 168, 474, 496; `MeasureTheory/Measure/Hausdorff.lean` 555, 563; `MeasureTheory/Measure/Continuity.lean` 74; `MeasureTheory/Measure/Restrict.lean` 75, 163; `Analysis/Real/OfDigits.lean` 67, 98, 113, 116, 158, 199; `Data/EReal/Inv.lean` 341, 365; `Probability/StrongLaw.lean` 787) and 3 in Tau Ceti (`NumberTheory/DiophantineApproximation/BadlyApproximable.lean` 62, 67, 86). No pinned declaration states any of the eight theorems.
- Cross-roadmap citations resolved: FractalGeometry 1.1, 1.5, 2.1, 3.1, 5.1, 5.3 at its open head (`IFS.existsUnique_selfSimilarMeasure`, `measure_le_mul_hausdorffMeasure`, `dimH_digitRestricted` are declared there with the hypotheses the contracts state); ProbabilisticAndMetricNumberTheory §§2.8, 3.8–3.10, 4.10, 5.1a and DiophantineApproximationAndTranscendence §0.6 on main. `IsNormalBase` is character for character the definition of ProbabilisticAndMetricNumberTheory.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only supplier not on main is FractalGeometry, an open pull request that adds a new roadmap, and the description names it.
- Elaboration of `Suggested.lean`: eight `sorry` warnings and nothing else; `#check @name` on all 14 declarations, each type compared with its README statement, no binder lost and nothing changed. One-tactic probe (`rfl`, `simp`, `infer_instance`, `norm_num`) on a scratch copy: none of the eight theorems closes. All headline theorems of the Summary are stated; no `set_option`, no sorried data, single `import Mathlib` plus one existing Tau Ceti module.
- The pull request changes nothing outside the roadmap folder; its description agrees with the head (8 theorems, 6 definitions, suppliers, locators).
- Automatic checks: all passed.

Overlap check: read FractalGeometry, ProjectionsSlicesAndKakeya, EntropyAndSourceCoding, ProbabilisticAndMetricNumberTheory; shared objects: the mass distribution principle and self-similar measures (owner FractalGeometry, cited here), digit-restricted sets with one digit set at every position (owner FractalGeometry 5.3; 4.1 here is the word-dependent generalisation and says so), `IsNormalBase` and Borel's theorem (owner ProbabilisticAndMetricNumberTheory §2.8, cited), `BadlyApproximable` (Tau Ceti). No other roadmap, open or on main, states Billingsley's lemma, the dimension of a measure, digit-frequency sets or the dimension of the badly approximable numbers.

Source independence: 23 locators and 6 further passages (the routes of 1.3, 1.4, 2.2, 3.3, 4.1, 4.2 and the docstrings of 1.3 and 4.1) compared with 3 sources, none shared beyond formulas the mathematics forces; largest share Hochman, 17 of 36 citations; contents compared with Hochman (§§4.2, 6.3, 6.4 against Layers 1–3, Layer 4 absent from it) and with Bishop–Peres §§1.4–1.5: independent, the order of Layers 1–3 being forced by 2.2 needing 1.3 and 1.4 and Layer 3 needing 2.2.

Research link: Billingsley's lemma (Billingsley 1961) and the Besicovitch–Eggleston theorem as in Bishop–Peres §§1.4–1.5 and Hochman §4.2; Jarník's 1928 theorem, which Beresnevich–Ramírez–Velani (2016, §7) take as the starting point for badly approximable vectors and Schmidt games. Rests on the three sources read.

## Not verifiable

- Jarník's 1928 paper: cited by name only in 4.2, not opened; the statement and proof were checked against Beresnevich, Ramírez and Velani, Theorem 7.1.
- The published edition of Bishop and Peres (Cambridge University Press): not read; the README cites the draft's numbering and says so.

## Source issues

- **Misprint** in BishopPeres2015 at Lemma 1.4.4, printed page 19: the source says the base `b` is any positive integer; it should be an integer `b ≥ 2`, as at the start of its Section 1.4, since for `b = 1` the intervals have length one; affects a stated result.
- **Error** in BishopPeres2015 at Example 1.4.5, printed page 20: the source says the limit of the logarithmic ratio is `log₃ 2` at every point of the Cantor set; it should be at every point that is not the left end of a removed gap (at `1/3` the half-open cells are null), hence almost everywhere; affects nothing.
- **Misprint** in Hochman2012 at Corollary 4.10, printed page 18: the source says the last entry of the perturbed vector is `1/10 + 10ε`, so the entries sum to `1 + ε`; it should be `1/10 + 9ε`; affects nothing.
- **Misprint** in Hochman2012 at Proposition 4.9, printed page 17: the source says the entropy uses base-two logarithms and then divides it by `log 10`; it should use the same base in numerator and denominator; affects a stated result.
- **Gap** in Hochman2012 at the proof of Proposition 4.9, printed pages 17–18: the source says the cell-mass formula gives the limit at every point of the frequency set; it should treat vectors with zero entries, where points of the set have null cells and the upper bound needs another measure; affects the proof.
- **Misprint** in Hochman2012 at the example after Definition 6.20, printed page 51: the source says the two notions differ at `x = 1/2` in the middle-third Cantor set, with value `0`; it should be the point `1/3`, where the `3`-adic value is infinite; affects nothing.

## For the human reviewers

- Licence: BishopPeres2015 is a 2015 draft of a since-published book, read on the first author's university page; Hochman2012 is unpublished lecture notes on the author's page. Both were fetched as author pages.
- Not tested: the README's Bishop–Peres locators are those of the draft (README line 613); the published book's numbering and pages were not compared.
