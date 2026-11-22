# Review of InfinitelyDivisibleLawsAndTriangularArrays (pull request #2970 at c147155)

**Verdict:** needs changes

**Summary.** Changes are needed, in one sentence: the proof route of §5.3 asserts that the squared truncated means of an infinitesimal array sum to `0` in the limit, which is false (a deterministic array with entries `±1/√n` gives the constant `2`); the theorem itself and its Lean statement are sound. All three findings and all nine small corrections of the previous review are repaired, and every stated theorem and every numeric Check survived the computed pass. There are three small corrections and three format notes, none blocking. None of the eight cited books could be read legally in this round, so the source locators are unverified; that, and the stated prior formalization, are left to the human reviewers.

## R01 (P2) — The route of §5.3 claims `∑_j (E truncOne (X n j))² → 0` "a consequence of infinitesimality and the variance bound"; this is false.

An implementer who follows the route will try to prove a statement that fails under the hypotheses of the theorem. In the route of §5.3 (README lines 520–521) the translation from the centred compound Poisson laws back to the stated conditions is said to cost "only `∑_j (E truncOne (X n j))² → 0`, a consequence of infinitesimality and the variance bound". Take the deterministic array `X n j = (-1)^j / √n`, `j < 2n`. It is row-independent and infinitesimal (`P(|X n j| > ε) = 0` once `n > ε⁻²`), its row sums are `0` and converge to `δ₀` with triplet `(0, 0, 0)`, and all three conditions of §5.3 hold (`∑_j Var = 0`, `∑_j E truncOne = 0`, no mass away from the origin). Yet `∑_j (E truncOne (X n j))² = 2n · (1/n) = 2` for every `n`.

The translation does not need that limit. With `c = E truncOne X` one has `E((X - c)²; |X| ≤ 1) = Var(truncOne X) - c² P(|X| > 1)`, so the centred second moments differ from the truncated variances by at most `max_j (c n j)² · ∑_j P(|X n j| > 1)` and by the change of truncation set from `|X| ≤ 1` to `|X - c| ≤ 1`; both vanish because `max_j |c n j| → 0` by infinitesimality, `∑_j P(|X n j| > 1/2)` stays bounded, and `ν {|x| = 1} = 0`. Replace the clause after "translate the conditions back" by that statement. (The corresponding sentence in the route of §5.6, lines 570–571, is correct: there the squared means are bounded by `max_j P(X n j > 0) · ∑_j P(X n j > 0)`, which does tend to `0`.)

## C01 — The route of §1.3 attributes the upper bound on `a n` to tightness alone and treats only the case of two limits with different scale.

"Tightness bounds `a n` above" (line 133) cannot be right as written: in the README's own negative control (`μ n = δ₀`, `a n = n`) everything is tight and `a n → ∞`. The upper bound uses nondegeneracy of `μ₀`: if `a n → ∞` along a subsequence, `|φ_{μ n}(t)| = |φ_{ν n}(t / a n)| → 1`, so `μ₀` is degenerate. Likewise the last step (lines 135–136) covers only `a₀ ≠ a₁` (`c ≠ 1`); for `a₀ = a₁`, `b₀ ≠ b₁` the law `μ₀` would be invariant under a nonzero translation `β`, so `φ_{μ₀}(t) (e^{itβ} - 1) = 0`, contradicting `φ_{μ₀} → 1` at `0`. One clause each would do.

## C02 — "Layer 8 is two independent applications of Layer 3" does not agree with the layer's own `*Needs:*` lines.

In "How to read the build" (lines 53–54). §8.1 needs §§3.2, 3.3 and §5.2 (Khintchine's theorem, for the infinite divisibility of the components), and §8.2 needs only §2.3; the Dependencies of Layer 8 say "Layers 2–5". Write, for instance, "Layer 8 is two independent applications: self-decomposability, of Layers 3 and 5, and the lattice `ℕ`, of Layer 2".

## C03 — "the scalar form is formalized in Tau Ceti" is not true at the pin.

In "Not owned here" (lines 865–866). The pinned Tau Ceti has no Lindeberg–Feller theorem: a case-insensitive search of the pinned sources for "Lindeberg" finds nothing, and the only central limit files are those of free probability (`TauCeti/Probability/FreeProbability/CentralLimit.lean`). The earlier text said "after the pin"; with that qualifier gone the sentence reads as a statement about the pin. Drop the parenthesis, or name the declaration once a pin contains it.

## N01 — Two `*Needs:*` lines do not match their routes: §7.1 names §5.6, although it uses only the degenerate case, which is §5.4 with `c = 0` (so Feller's weak law is placed behind the Poisson theorem and §3.3); and the route of §3.6 uses Tau Ceti's Bernstein-function Lévy–Khintchine theorem (`IsBernsteinFunction.existsUnique_eqOn_bernsteinLevyKhintchineExponent`), which neither its `*Needs:*` line nor the Dependencies of Layer 3 name.

## N02 — The opening (lines 33–35) and the module docstring call the prose-only targets "headlines … of the same standing". If the Karamata representation, the stable characteristic functions of §7.2 and the degenerate case of §5.6 are meant as headline theorems, they are statable at the pins and would be stated in `Suggested.lean`; if not, "targets" is the word.

## N03 — `IsStable` is also a root-level Mathlib declaration (`Mathlib/Order/Monotone/Defs.lean`, stability of a sort). The roadmap's namespace shadows it here, but the name will be ambiguous wherever both are open; `IsStableLaw` or a namespace of its own would avoid that.

## Questions for the author

- §7.1 still says that Kallenberg's Theorem 6.17 "omits the condition `E X₀ = 0` from the statement for `p ∈ (1, 2)` and derives it in the proof". Is that the wording of the third edition? I could not read the book; the theorem itself (with the condition) is right, and the constant sequence does show the condition is needed.
- Are the page numbers given for Durrett those of the Cambridge print of the fifth edition? No copy could be read in this round.

## Verified sound

Previous findings at this head: R01 (routes of §3.7 and §5.6 at `ν {|x| = 1} ≠ 0`) repaired: §3.7 now rescales by `a` with `ν {|x| = 1/a} = 0` (lines 395–403), §5.6 halves the array (lines 564–572), both with §3.3 in `*Needs:*`. R02 repaired (lines 778–779: outside the weak law "(`p = 1`)", inside for `p < 1`). R03 repaired (line 703: root `(X - b/n) / a`; lines 801–802: `ν ≥ ν ∘ (x ↦ c x)⁻¹`). C01–C09 repaired (lines 48–50 and 434; 339–342; 257–262; 768 and 776; 559–560; `Suggested.lean` line 17; 897–898; the one-tactic statement is now a Check at 251–252; the description's counts). N01, N03 repaired; N02 partly (C03 above).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 inversion, atom formula | inner integral; Poisson(1) at `0`, `T = 3000` | `2∫₀^∞ sin(tu)/t dt = π sgn u`, so weight `1` inside, `½` at ends; trapezoid `0.367897` vs `e⁻¹ = 0.367879` | agrees | none |
| 1.2 locally uniform convergence; doubling | `ψ = \|φ\|²`; one-tactic probes | `1 - cos 2u = 2(1 - cos u)(1 + cos u) ≤ 4(1 - cos u)`; `simp`, `exact?` do not close either | true, not padding | none |
| 1.3 convergence of types | `μ n = δ₀`, `a n = n`; `a₀ = a₁`, `b₀ ≠ b₁` | tight, `a n → ∞`: bound needs `μ₀` nondegenerate; translation case gives `φ(e^{itβ} - 1) = 0` | theorem true; route elliptical | C01 |
| 2.1 definition and closure | `n = 0`; Bernoulli; `exp(-\|t\|^α)` roots | `iidSumLaw μ 0 = δ₀` excluded by `0 < n`; `φ(π) = 0`; `\|φ\|^{2/n} → 1{φ ≠ 0}` | true; probes fail | none |
| 2.2–2.3 distinguished logarithm, roots, compound Poisson | `N(0,1)`, `t = 1.3`, `n = 10⁴` | error `1.5336e-5` | agrees with Check | none |
| 2.4 Gaussian lower bound, bounded support | Poisson(5), `γ = 1.77`; Cauchy; roots on `[-R, R]` | max `0.68112 < log 2 = 0.69315`; `1/(4 log 2) = 0.36067`; `Var μ ≤ R²/n` | agrees | none |
| 3.1 triplets (`LevyTriplet`, `HasLevyTriplet`) | Poisson `(λ, 0, λδ₁)`; infinite `μ`; `λ = 0` | exponent `iλt + λ(e^{it} - 1 - it) = λ(e^{it} - 1)`; `charFun μ 0 = 0 ≠ 1`; `δ₀` | definition determines object | none |
| 3.2 existence, representation, uniqueness | second difference averaged on `[-1, 1]`, times `-½` | `σ²/6 + ∫ e^{itx}(1 - sin x / x) dν` | matches route | none |
| 3.3 affine images | Poisson: `a = 2`; `a = ½`, `d = 0.3`, `λ = 2`; general change of variable | drift `2λ - 2λ = 0`; `1 + 0.3 + 0 = 1.3`; formula rederived | agrees with Lean | none |
| 3.4–3.6 moments, atoms, half-line | exponential(1); `\|x\|^p ∨ 1` | mean `1 - e⁻¹ + e⁻¹ = 1`, variance `1`, half-line drift `0`; `\|x+y\|^p ≤ 2^p (\|x\|^p ∨ 1)(\|y\|^p ∨ 1)` | agrees | none |
| 3.7 Lévy measure from roots | Poisson `ν = λδ₁`, `a = 2` | image `λδ₂`, `ν'{\|x\| = 1} = 0`: §4.1 applies | route now sound | none |
| 4.1 convergence through triplets | jumps `δ_{1+1/n} → δ₁`; `N(0, 1/n)` | drifts `0` vs `1`, `truncVar` `0` vs `1`; `(0, 1/n, 0) → (0, 0, 0)` | `h1` needed, as stated | none |
| 5.1 infinitesimal arrays | empty row; `\|1 - φ(t)\| ≤ \|t\|ε + 2P(\|X\| > ε)` | empty `⨆` is `0` in `ℝ≥0∞` and in `ℝ` | agrees | none |
| 5.2 Khintchine | `X n 0 = ξ` Bernoulli, rest `0` | limit Bernoulli, not infinitely divisible | hypothesis needed | none |
| 5.3 Doeblin–Gnedenko | `X n j = (-1)^j/√n`, `j < 2n` | limit `δ₀`; conditions `0, 0, 0` hold; `∑ c² = 2` at `n = 10, 1000` | theorem true; route sentence false | R01 |
| 5.4–5.5 Gaussian, Feller's converse | `c = 0`; `X n 0 ~ N(0,1)`, `ε = ½` | `gaussianReal b 0 = δ_b`; Lindeberg sum `0.96914` | agrees | none |
| 5.6 Poisson convergence | halved array; `Bin(5000, 1.5/5000)`; values in `{0, 2}` | triplet `(c/2, 0, cδ_{1/2})`, `truncVar = c/4`, truncated mean `P(X=1)/2 + P(X=2)`; `ℓ¹ = 1.569e-4`; variance `2c` | agrees | none |
| 6.1 regular variation | `U = e^{-t}`; `h(x₀) = 0` | ratio diverges for `x < 1`; forces divergence at `1/x₀`, so `h > 0` | true | none |
| 6.2–6.3 Karamata, truncated moments | `x^{½} log x`; `x⁻²`; `δ_c` | `1.6602, 1.5761, 1.5499 → 1.5`; `→ 0 ≠ -1`; translate has `L = 0` | agrees | none |
| 7.1 weak laws | Cauchy; positive `1/(x log x)` tail; `X ≡ 1`, `p = 3/2`; non-integrable `X`, `p > 1` | `2/π`; `2.788, 3.553, 4.283`; `n^{1/3} → ∞`; tail condition forces `E\|X\| < ∞`, so the Bochner integral is not junk | agrees | N01 |
| 7.2 stable laws | `α ≤ 0` in `IsStableWithIndex`; root; `ν = 0`, `σ² = 0` | `\|φ(a^k t)\| = \|φ(t)\|^{n^k}` forces degenerate; `(∑Xᵢ - b)/a ~ X`; excluded by nondegeneracy | statements true | N03 |
| 7.3 stable laws as limits | `S_{kn}` as `k` blocks; one-tactic probe on self-attraction | `ν^{∗k} = affineMap ν a b`; `simp` does not close | agrees | none |
| 7.4 domains of attraction | Pareto `x^{-3/2}`; denominator `P(\|X\| ≥ x)` | `L = 3(√x - 1)`, ratio `1.414255` vs `√2`; index `2 - α > 0` makes the support unbounded, no `0/0` | agrees | none |
| 7.5 moments | Pareto `x^{-3/2}` | `E X^β = 1.5/(1.5 - β)`, finite iff `β < 3/2` | agrees | none |
| 8.1 self-decomposable laws | `k` nonincreasing, image under `x ↦ cx` | `ν_c(B) = ∫_B k(u/c)/u du ≤ ν(B)` | route direction now right | C02 |
| 8.2 infinite divisibility on `ℕ` | geometric; Bernoulli; `δ₁`; `s → 0` | `ν_k = p^k/k`; `ν₂ = -½`; `-log s` unbounded, right side bounded; `P(ξ = 0) = e^{-∑ν} > 0` forced | agrees | none |

- Source locators checked against the text: 0 of 101 (no cited text was readable in this round).
- Library declarations opened at the pin: the eleven pinned by `#check` in `Suggested.lean` (all elaborate; `charFun_map_sum_pi_eq_prod` in `Mathlib/Probability/Independence/CharacteristicFunction.lean`, `measureReal_abs_gt_le_integral_charFun` in `Mathlib/MeasureTheory/Measure/IntegralCharFun.lean`, `TauCeti.exists_probabilityMeasure_of_tendsto_charFun` at `TauCeti/MeasureTheory/Measure/LevyConvergence.lean:48`), `ProbabilityMeasure.map` (`Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:636`), `IsBernsteinFunction.existsUnique_eqOn_bernsteinLevyKhintchineExponent` (`TauCeti/Analysis/CompletelyMonotone/Bernstein/LevyKhintchine/Uniqueness.lean:134`); the five Tau Ceti paths and seven Mathlib paths of the supplier contracts exist.
- Duplication by object at the pins: no infinite divisibility, regular or slow variation, self-decomposability, domain of attraction, convergence of types, Lindeberg condition or locally uniform convergence of `charFun` in Mathlib or Tau Ceti; the Tau Ceti Bernstein, stable and compound Poisson files are the special cases the README names.
- Cross-roadmap citations resolved on main: MathematicalStatisticsAsymptotic §1.2 (README line 231), StandardDistributions Layer 15 (line 2366, excluding the general classification at line 2628), MathematicalStatisticsFoundations §8.5 (line 1263), FreeProbability.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; both suppliers are on main. No change outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean` at the pins: exit 0, 51 `sorry` warnings and the eleven `#check` lines, nothing else. `#check @name` on all 73 declarations: the array theorems keep `[∀ n, IsProbabilityMeasure (μ n)]`, the i.i.d. theorems `[IsProbabilityMeasure P]`; signatures agree with the README. One-tactic probes on ten theorems (`simp`, `simp_all`, `exact?`): none closes.

Overlap check: read SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, LocalLimitTheorems, MathematicalStatisticsHigherOrderAndResampling, BinomialToBlackScholes, PoissonApproximation, MathematicalStatisticsAsymptotic, StandardDistributions, and searched every roadmap by object (infinite divisibility, Lévy–Khintchine, regular variation, domains of attraction, convergence of types, self-decomposability); nothing shared.

Source independence: 0 passages compared with 0 sources (none readable); largest share Klenke, 32 of 101 locators; contents of Klenke not read (text and contents page unavailable): its locators fall in Layers 2, 3, 5 and 7 only, and Layers 1, 4, 6 and 8 cite other books, so no one-to-one mapping in order is visible from the locators alone.

Research link: the headline targets (the Lévy–Khintchine formula, the Khintchine–Doeblin–Gnedenko limit theorem, domains of attraction) are prerequisites of Lévy processes and the Lévy–Itô decomposition (Kallenberg 2021) and of local limit and rate theorems in stable domains; this rests on the README's "Downstream consumers" and "Beyond this roadmap" sections.

## Not verifiable

- Every locator into Kallenberg, Klenke, Petrov, Loève and Resnick: Springer, paywalled, recorded as uncertified by the sources service.
- Every locator into Billingsley, Applebaum and Durrett: the service found no legal copy (publisher landing pages only; the Durrett copy the previous round read could not be fetched here, as its address does not name the author).
- Hence all fifteen sampled targets are unverified at their locators in this round (1.1, 1.2, 2.1, 3.1, 3.2, 3.3, 4.1, 5.1, 5.2, 5.3, 5.6, 6.1, 7.3, 7.4, 7.5); their statements were checked by computation only. The previous round confirmed the nine Durrett theorem numbers; those lines are unchanged.
- The README's statement about the wording of Kallenberg's Theorem 6.17, and the printed pages given for Durrett.

Automatic checks set aside as false positives: the 21 code-font names reported as occurring nowhere in the libraries are this roadmap's own declarations, each declared in `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- Not tested: Klenke, *Probability Theory* (3rd ed.), has the largest share of the locators (32 of 101); its text and contents page could not be read, so wording and arrangement were not compared with it.
- Not tested: none of the eight cited books could be read in this round; all 101 locators are unverified here, and wording was compared with no source.
- Licence: the README's "Prior formalization" section (lines 948–959) names the Lean project CKMA (Apache 2.0, a repository of the pull request's author) as the starting point for §§2.1–2.3, 3.1–3.2 and 5.5; `Suggested.lean` was not compared with it.
