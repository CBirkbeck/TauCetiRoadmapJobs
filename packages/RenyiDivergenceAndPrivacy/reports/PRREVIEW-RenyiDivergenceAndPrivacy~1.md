# Review of RenyiDivergenceAndPrivacy (pull request #2658 at 8dd2c34)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem was recomputed on finite spaces with the `ℝ≥0∞` conventions of the Lean definitions (including the chain bound below order `1`, which neither source states), every numerical Check was recomputed, and every locator into the two arXiv texts was read at its place and supports the statement as written. There are five small corrections and three format notes, none blocking. One question of scope is left to the human reviewers.

## C01 — The two identities of the remark in 1.2 are neither targets nor supplier contracts

An implementer cannot tell whether `hellingerIntegral (1/2) P Q` = affinity and `hellingerIntegral 2 P Q = 1 + chiSqDiv P Q` are to be proved. The remark (README line 134) asserts them and says they "compare the two roadmaps' objects", but 1.2's *Needs:* line names only 1.1 and Mathlib, and the supplier contracts have no entry for MathematicalStatisticsNonparametric, whose 1.1 and 1.2 define the affinity (a real number, on main at its line 408) and `chiSqDiv` (line 172). Both identities are true: for `Ber(1/2)`, `Ber(1/4)` the two sides are `0.96593` and `4/3 = 1 + 1/3`, and for a pair that is not absolutely continuous both sides of the second are `∞`.

Either say in the remark that the identities are commentary and not targets, or make them two API bullets of 1.2 with `ENNReal.ofReal` around the real-valued affinity, add MathematicalStatisticsNonparametric 1.1 and 1.2 to that *Needs:* line, and add a `### From TauCetiRoadmap.MathematicalStatisticsNonparametric` entry.

## C02 — Adaptive composition (4.3) and the Gaussian mechanism (4.4) assume `1 < α`, which their own routes do not use

The definition `IsRenyiDP`, the post-processing bullet and the constant-mechanism Check of 4.2 are for every order, while `isRenyiDP_compProd` and `isRenyiDP_gaussianMechanism` take `hα : 1 < α` (`Suggested.lean` lines 138 and 149). The route of 4.3 is 3.3 with `c = ε₂`, and that of 4.4 is 3.2 with 1.4; all three are stated for every order `0 < α`, `α ≠ 1`. A check on 3000 random instances at the orders `0.05, 0.2, 0.5, 0.7, 0.9, 0.99` found no violation of the chain bound, and the Gaussian value `α Δ² / (2 v)` is exact below `1` as well.

Would you either weaken both to `(hα : 0 < α) (hα1 : α ≠ 1)`, or add one sentence in 4.3 and 4.4 saying that the restriction to `α > 1` follows Mironov's definition and is not needed by the proof?

## C03 — The `k`-fold composition sentence of 4.3 leaves its countability hypothesis unstated

"By induction, the adaptive composition of `k` such mechanisms … is `(α, ε₁ + ⋯ + ε_k)`-private" (README line 438) is promised without the hypothesis the induction needs. At step `j` the kernel goes from `Y₁ × ⋯ × Y_j` to `Y_{j+1}`, so `isRenyiDP_compProd` applies when that product is countable or `Y_{j+1}` is countably generated. Suggested wording: "…of `k` such mechanisms, the `(j+1)`-st a Markov kernel from `Y₁ × ⋯ × Y_j` to `Y_{j+1}` with `Y₁, …, Y_j` countable or `Y_{j+1}` countably generated, is `(α, ε₁ + ⋯ + ε_k)`-private".

## C04 — The References place the Laplace–Gaussian example in 2.2; it is in 2.1

The last References bullet (README line 605) says "the Laplace–Gaussian example of 2.2". The example is the fourth Check of 2.1 (line 245) and the Examples of Layer 2; 2.2 does not mention it. Change "2.2" to "2.1".

## C05 — `hA : MeasurableSet A` in `measureReal_le_of_renyiDiv_le` is not needed

The conversion holds for every set `A`: take a measurable `B ⊇ A` with `Q(B) = Q(A)`; then `P(A) ≤ P(B) ≤ exp(…) Q(B) + δ = exp(…) Q(A) + δ`. The Summary already says "for every event `A`" while 4.1 and `Suggested.lean` line 124 ask for measurability. Would you drop `hA` (and "measurable" in 4.1 and in the conversion bullet of 4.2), or keep it and say it is there for uniformity with the `(ε, δ)` definition of other roadmaps?

## N01 — A status phrase that will go stale

"StatisticalLearningTheory (an open roadmap, not on main)" in Scope and ownership (README line 512) describes the state of another pull request at the time of writing. "StatisticalLearningTheory, Layer 7, defines …" says the same without a date.

## N02 — The route of 3.2 uses a product-density step with no declaration in its *Needs:* line

"Densities of products … are products of densities" (README line 319) is Mathlib's `prod_withDensity` (`Mathlib/MeasureTheory/Measure/WithDensity.lean`, line 747); naming it in the *Needs:* line of 3.2 would complete the list.

## N03 — Three unwrapped lines

README lines 53, 519 and 523 run well past the width of the rest of the file.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `hellingerIntegral` | `Ber(1/2)`, `Ber(1/4)` at `α = 1/2, 2`; `P = P`; `Ber(1/2)` vs `δ₀` at `2`; `δ₀` vs `δ₁` at `α = 0` | `0.965926`, `1.333333`; `1`; `∞` against `∫(dP/dQ)² dQ = 1/4`; `1` (junk, divergence `0`) | as README | none |
| 1.1 range and Tau Ceti entropy | `N = 2`: `S_2(Ber(1/2) ∣ Ber(1/4))` | `-0.353553 - 0.612372 = -0.965926 = -H_{1/2}`; Hölder bound with `A = univ` gives `-1 ≤ S`, so `H ≤ 1` | consistent | none |
| 1.2 `renyiDiv` | `Ber(1/2)`, `Ber(1/4)` at `1/2, 2, 3`; conditional law `(0.4, 0.6, 0)` of `(0.2, 0.3, 0.5)` at six orders; `α = 1` | `0.069336`, `0.287682`, `0.399254`; `0.693147` six times; `0` (junk, excluded by every theorem) | as README | none |
| 1.2 remark, orders `1/2`, `2` | `Ber(1/2)`, `Ber(1/4)`; non-absolutely-continuous pair | `H_{1/2} = 0.96593` = affinity; `H_2 = 4/3 = 1 + 1/3`; `∞ = 1 + ∞` | true | C01 |
| 1.3 `renyiDiv_eq_zero_iff` | 3000 random pairs with zero masses, 12 orders, both directions; `α = 1` | `D = 0` exactly when `P = Q`, 0 exceptions; at `α = 1` value `0` for `P ≠ Q` | holds; `α ≠ 1` needed | none |
| 1.3 `renyiDiv_eq_top_iff_mutuallySingular` | same pairs, orders below `1`, both directions; `Ber(1/2)` vs `δ₀` | `D = ∞` iff disjoint supports, 0 exceptions; `D_{1/2} = 0.693147` finite, `D_2 = ∞` | holds; fails for `α > 1` as README says | none |
| 1.4 `renyiDiv_gaussianReal` | completing the square for `α` on both sides of `1`; `v = 0`, `m₀ ≠ m₁` | exponent `-(x - m̄)²/(2v) - α(1-α)(m₀-m₁)²/(2v)`; `H = exp(α(α-1)(m₀-m₁)²/(2v))`; `v = 0`: `∞` against `ofReal(x/0) = 0` | holds; `v ≠ 0` needed | none |
| 2.1 limit from below | `Ber(1/2)`, `Ber(1/4)` at `1 - 10⁻⁶`; `Ber(1/2)` vs `δ₀` at `0.9, 0.99, 0.999` | `0.143841` against `KL = 0.143841`; `6.2383`, `68.6216`, `692.4540 → ∞ = klDiv` | holds | none |
| 2.1 limit from above | same pair at `1 + 10⁻⁶`; Laplace `e^(-2∣x∣)` vs `N(0,1)`; case `KL = ∞` | `0.143841`; `KL = log√(2π) - 3/4 = 0.168939`, integrand `exp((β-1)x²/2 - 2β∣x∣)` not integrable; `KL = ∞` forces `D_β = ∞` | holds; hypothesis needed | none |
| 2.2 `renyiDiv_le_renyiDiv_of_le` | 3000 random pairs, 12 orders across `1`; exponent `(α-1)/(β-1)` | nondecreasing, 0 violations; `0.06934 ≤ 0.14384 ≤ 0.28768 ≤ 0.39925`; exponent `> 1` below `1`, in `(0,1)` above | holds | none |
| 3.1 `renyiDiv_comp_le` | 3000 pairs with random stochastic matrices, 12 orders; merging kernel; identity | 0 violations; `0 ≤ 0.287682`; equality | holds | none |
| 3.2 `renyiDiv_prod` | 3000 random pairs of pairs with zero masses, 12 orders; Bernoulli square at `2`; one infinite factor | both sides equal (or both `∞`), 0 exceptions; `log(16/9) = 0.575364 = 2 · 0.287682`; `∞ = ∞ + 0.287682` | holds | N02 |
| 3.3 `renyiDiv_compProd_le` | 3000 random instances, 12 orders (six below `1`); two-point mixture at `2` | 0 violations; joint `log(7/6) = 0.154151`, average `0.143841`, bound `0.287682` | holds, also for `α < 1` | none |
| 4.1 probability preservation | 3000 pairs, `α ∈ {1.01, 1.5, 2, 3, 10}`, all events | `P(A) ≤ (e^D Q(A))^((α-1)/α)`, 0 violations | holds | none |
| 4.1 `measureReal_le_of_renyiDiv_le` | same, `δ ∈ {10⁻³, 0.05, 0.3, 0.9, 1, 2}`; `δ = 0` instance; Gaussian `δ = 10⁻⁵` | 0 violations; `1/2 > (4/3)(1/4) = 1/3`; `α = 5.798526`, `ε = 5.298526`, exact `δ = 1.3004 · 10⁻⁷` | holds; `δ > 0` needed | C05 |
| 4.2 `IsRenyiDP` | constant mechanism; `M D = δ_D` on `Bool` | `D = 0 ≤ 0`; `D(δ₀ ‖ δ₁) = ∞` at every order, exceeds every `ε` | definition separates the two | none |
| 4.3 `isRenyiDP_compProd` | 3.3 with `c = ε₂`; two Gaussian mechanisms `v = 1`; four with `v = 4` | `↑(ε₁ + ε₂) = ↑ε₁ + ↑ε₂`; `α/2 + α/2 = α = α/(2 · 1/2)`; `4 · α/8 = α/2` | holds; `1 < α` unused | C02, C03 |
| 4.4 `isRenyiDP_gaussianMechanism` | `d = 0`; `d = 1`, `Δ = v = 1`; `v = 0`; negative `Δ` | divergence `0`; `α/2`; `∞` against `0`; only `Δ²` enters, `toNNReal` of a nonnegative number | holds; `v ≠ 0` needed; `1 < α` unused | C02 |

- Source locators checked against the text: 20 of van Erven–Harremoës (arXiv:1206.2459v2: Definitions 1–2, Remark 1, (5), (6), (9)–(12), Example 1, Theorem 1, Example 2, Theorems 3, 5, 8, 24, 28, Lemmas 1–2, Proposition 2, the Laplace–Gaussian example) and 8 of Mironov (arXiv:1702.07476v3: Definition 4, Propositions 1, 3, 7, 10, Corollary 3); all 28 agree in number, page, hypotheses and content.
- Library declarations opened at the pin: 27 of Mathlib (among them `klDiv` at `Mathlib/InformationTheory/KullbackLeibler/Basic.lean:56`, `ConvexOn.comp_rnDeriv_map_le` at `…/KullbackLeibler/DataProcessing.lean:55`, `rnDeriv_measure_compProd` at `Mathlib/Probability/Kernel/Composition/RadonNikodym.lean:129`, `ConvexOn.map_integral_le` at `Mathlib/Analysis/Convex/Integral.lean:196`) and 4 of Tau Ceti (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/RenyiEntropy.lean` lines 106, 153, 194, 215); each exists in the cited file with the cited hypotheses. Neither pin has a Rényi divergence, a Hellinger integral of general order or a privacy notion.
- Cross-roadmap citations resolved: MathematicalStatisticsNonparametric 1.1–1.4 on main (affinity, `chiSqDiv`, the Checks `0.96593`, `1/3`, `e - 1`, `1/2`, and `klDiv_le_log_one_add_chiSqDiv`); StatisticalLearningTheory Layer 7 at its open head (substitution adjacency, `(ε, δ)` mechanisms and composition, Rényi privacy listed as beyond its scope).
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 12 `sorry` warnings and nothing else. The elaborated types of all 15 declarations were compared with the README statements; none lost a binder and the generality agrees.
- One-tactic probe (`rfl`, `simp`, `simp` with the three definitions unfolded, `infer_instance`) on a scratch copy: none of the 12 theorems closes. No padding.
- Headline theorems of the README: positivity, the mutual-singularity criterion, the Gaussian formula, the two limits, monotonicity, data processing, additivity, the chain bound, the conversion, adaptive composition, the Gaussian mechanism. All 12 are statable at the pins and stated.
- Ownership: a search of all open heads and of main for the Rényi divergence, the Hellinger integral, `f`-divergences and differential privacy found no second owner.

Overlap check: read StatisticalLearningTheory, MultiArmedBandits, MathematicalStatisticsNonparametric, DenoisingDiffusion, StandardDistributions (HiddenMarkovModels has no divergence); nothing shared. The affinity and `chiSqDiv` are owned by MathematicalStatisticsNonparametric and `(ε, δ)`-privacy by StatisticalLearningTheory; this roadmap restates neither.

Source independence: 34 passages compared with 2 sources (28 locators and 6 further passages: the routes of 1.3, 2.1, 2.2, 3.3 and 4.1 and the docstring of `hellingerIntegral`), none shared beyond formulas; largest share van Erven–Harremoës, 20 of 28 locators; contents compared with van Erven–Harremoës: independent (Layer 1 draws on its §II-A, §III-A and §III-F, Layer 2 on §II-C in the opposite order, Layer 3 on §II-B, §III-G and Mironov).

Research link: The targets are the simple-order results of van Erven and Harremoës (2014) and the composition, conversion and Gaussian statements of Mironov (2017), which Mironov, Talwar and Zhang (2019) build on for the sampled Gaussian mechanism; rests on the README's references and the three texts read.

## Not verifiable

- Nothing: both cited texts and the scope reference were read in their arXiv versions.

## Source issues

- none

## For the human reviewers

- **Scope.** Layer 4 (Rényi differential privacy) rests on Mironov, arXiv:1702.07476, a computer-security symposium paper; Layers 1–3 rest on a refereed IEEE Transactions on Information Theory article. The metadata topic is `math.ST`.
