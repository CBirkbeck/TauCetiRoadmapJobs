# Review of InfinitelyDivisibleLawsAndTriangularArrays (pull request #2970 at eef493e)

**Verdict:** needs changes

**Summary.** Changes are needed, all of them local: the stated theorems and the Lean signatures survived the computed checks, but three passages beside them are wrong. The proof routes of §3.7 and §5.6 apply §4.1 and §5.3 to Lévy measures that charge `{|x| = 1}`, which those theorems exclude (the Poisson law is the case in point); the St. Petersburg example of Layer 7 is false for the exponents `p < 1`; and two proof-route sentences (§7.2, §8.1) are false as written. There are nine small corrections and three format notes, none blocking. Six of the seven cited books could not be read legally, so most source locators are unverified; that, and the stated prior formalization, are left to the human reviewers.

## R01 (P2) — The routes of §3.7 and §5.6 invoke §4.1 and §5.3 at Lévy measures that charge `{|x| = 1}`, where those theorems do not apply.

An implementer who follows the stated routes cannot instantiate the theorem they name. §4.1 (README lines 425–428) and §5.3 (lines 492–497) are stated only for the truncation level `1` and require that the limiting Lévy measure does not charge `{|x| = 1}`; `Suggested.lean` carries this as `h1` in `tendsto_iff_levyTriplet` and `tendstoInDistribution_iff_levyTriplet`. The route of §5.6 (line 544) reads "§5.3 with `T = (c, 0, c δ₁)`": here `T.levyMeasure {|x| = 1} = c`, which is nonzero for every `c > 0`. The route of §3.7 (lines 382–383) applies §4.1 to an arbitrary infinitely divisible `μ`, with no restriction on `ν`; for the Poisson law, the roadmap's own running example, `ν = λ δ₁`. §3.6 and §8.2 inherit the gap through §3.7.

The smallest change is to state §4.1 and §5.3 for a truncation level `h > 0` with `ν {|x| = h} = 0`, with `σ² + ∫_{|x| ≤ h} x² dν` and `b - ∫_{h < |x| ≤ 1} x dν` in place of `truncVar` and the drift (the locator "with `h = 1`" indicates that the source has this form). For the Poisson law at `h = 1/2` this gives the limits `0` and `c - c = 0`, and the two conditions of §5.6 follow. Alternatively keep `h = 1` and add §3.3 to both routes: the image under `x ↦ x/2` of the Poisson law has, by the drift formula of §3.3, triplet `(c/2, 0, c δ_{1/2})`, which §5.3 admits; for §3.7 choose `a` with `ν {|x| = 1/a} = 0`, possible since `ν` has countably many atoms. Add §3.3 to the two `*Needs:*` lines in that case.

## R02 (P2) — The example "St. Petersburg-type laws … lie outside every weak law of §7.1" is false for the exponents `p < 1`.

The second bullet of §7.1 (`tendstoInMeasure_rpow_weakLaw_iff`) says that for `p ∈ (0, 1)`, `n^{-1/p} S_n → 0` in probability iff `r^p P(|X₀| > r) → 0`. For the St. Petersburg law `P(X = 2^k) = 2^{-k}` one has `P(X > r) ≤ 2/r`, so `r^p P(X > r) ≤ 2 r^{p-1} → 0` (at `p = 0.8`: `0.25`, `0.0625`, `0.0156` at `r = 2¹⁰, 2²⁰, 2³⁰`). The law therefore satisfies the weak law of §7.1 for every `p < 1`, and the example (Layer 7, Examples, line 748) contradicts the theorem of its own section. What fails is only the case `p = 1`: write "lie outside Feller's weak law (`p = 1`) of §7.1".

## R03 (P2) — Two proof-route sentences are false as written: the root in §7.2 and the direction of the inequality in §8.1.

In the route of §7.2 (lines 676–677), infinite divisibility is obtained "with `n` copies of the law of `(X - b) / a`". If `X₁ + … + Xₙ` has the law of `a X + b`, the sum of `n` independent copies of `(X - b)/a` has the law of `X + b (1 - n)/a`, not of `X`; the root is the law of `(X - b/n) / a`.

In the route of §8.1 (line 770), the condition is written "`ν ≥ ν ∘ (x ↦ x / c)⁻¹`". With the convention the README uses in §7.2 (`ν ∘ f⁻¹` is the image of `ν` under `f`), this says `ν(B) ≥ ν(cB)`. For `ν(dx) = k(x)/x dx` on `(0, ∞)` with `k` nonincreasing, `ν(cB) = ∫_B k(cu)/u du ≥ ν(B)`, the opposite inequality; for the exponential law and `B = (1, 2)`, `c = 1/2`: `ν(B) = 0.170`, `ν(cB) = 0.340`. The component `ρ_c` has Lévy measure `ν - ν ∘ (x ↦ c x)⁻¹`, so the condition is `ν ≥ ν ∘ (x ↦ c x)⁻¹`.

## C01 — The Dependencies of Layer 3 say "Layers 1–2", but §3.7 needs §4.1 and §3.6 needs §3.7.

The `*Needs:*` line of §3.7 (line 385) names §4.1, a later layer, and §4.1 needs §3.2, so at the level of layers 3 and 4 depend on each other, while "How to read the build" presents Layer 4 as following Layer 3. The targets themselves are not circular. Either add "§4.1 for §§3.6–3.7" to the Dependencies of Layer 3 and a clause to the guide, or place §§3.6–3.7 after §4.1.

## C02 — The submultiplicative moment criterion of §3.4 has no locator and its example does not fit the plain definition.

With `g(x + y) ≤ g(x) g(y)`, the function `|x|^p ∨ 1` is not submultiplicative (`g(2) = 2^p > 1 = g(1)²`); it is under the definition with a constant, `g(x + y) ≤ a g(x) g(y)`. State that definition, add that `g` is measurable and locally bounded, and give the locator of the theorem.

## C03 — The Poisson Check of §2.4 does not show that the factor `1/2` is needed.

The Check (lines 254–256) concludes from `|φ(π)| = e^{-10} < 1/2` that "the factor `1/2` and the Gaussian factor are both needed". That value shows only that the Gaussian factor is needed: for the Poisson law `5 (1 - cos t) ≤ 2.5 t²`, so `|φ(t)| ≥ e^{-2.5 t²}` holds with no factor `1/2`. (With `γ = 1.77` the bound itself is right: `max (5 (1 - cos t) - 1.77 t²) = 0.681 < log 2 = 0.693`.) The Cauchy law, `|φ(t)| = e^{-|t|}`, is the witness for the `1/2`: no bound `e^{-γ t²}` holds near `0`.

## C04 — Two examples of Layer 7 are true only for symmetric laws, which is not said.

The Check with `P(|X| > x) = 1/(x log x)` (lines 741–742) says Feller's weak law "applies"; the second condition of §7.1, convergence of `E(X₀; |X₀| ≤ r)`, holds for the symmetric law but fails for the positive one, where the truncated mean grows like `log log r`. The example `S_n / (n log n)^{1/2} → N(0, 1)` "for the Pareto law of index `2`" (lines 746–747) holds for the symmetric law with `P(|ξ| > x) = x⁻²`; the one-sided Pareto law has mean `2` and needs the centring `2n`. Add "symmetric" in both.

## C05 — The degenerate case stated in prose in §5.6 omits row independence.

As written (lines 540–542) it is about "an infinitesimal array". Without independence it fails: `X n j = ξ/n` for `j < n`, `ξ` standard normal, satisfies the three conditions with `b = 0` and has row sum `ξ`. Add "of row-independent variables".

## C06 — The module docstring of `Suggested.lean` points to a section that does not exist.

Line 17 says laws are "on `ℕ` in §2.6"; the lattice case is §8.2.

## C07 — `measureReal_abs_gt_le_integral_charFun` is not in the file the supplier contract names.

The contract (lines 865–867) places it in `Mathlib/MeasureTheory/Measure/LevyConvergence.lean`; at the pin it is in `Mathlib/MeasureTheory/Measure/IntegralCharFun.lean`, line 96.

## C08 — `charFun_iidSumLaw` follows in one tactic from a Mathlib lemma the README does not name.

`simp [iidSumLaw, charFun_map_sum_pi_eq_prod]` closes it (`Mathlib/Probability/Independence/CharacteristicFunction.lean`, line 206). It is already marked as a sanity check, so nothing need be removed; the route of §2.1 and the supplier contract would name `charFun_map_sum_pi_eq_prod` in place of `charFun_pi` with `IndepFun.charFun_map_add_eq_mul`.

## C09 — The description's count of definitions is off by two.

"There are 69 Lean-named headlines: 49 theorems and 20 definitions." The head declares 22 definitions (`levyInversionIntegral`, `IsDegenerate`, `affineMap`, `iidSumLaw`, `IsInfinitelyDivisible`, `distLog`, `LevyTriplet`, `levyIntegrand`, `LevyTriplet.exponent`, `HasLevyTriplet`, `LevyTriplet.truncVar`, `TendstoAwayFromZero`, `IsInfinitesimalArray`, `truncOne`, `IsRegularlyVarying`, `IsSlowlyVarying`, `truncSecondMoment`, `IsStable`, `IsStableWithIndex`, `IsInDomainOfAttraction`, `powerLevyDensity`, `IsSelfDecomposable`), so 71 named declarations beside the 3 sanity checks. The 52 `sorry`s are right.

## N01 — The section comment "Library suppliers named in the README" in `Suggested.lean` (line 41) heads only `#check` lines and no declaration; a plain comment would do.

## N02 — The text is dated in places: "formalized in Tau Ceti after the pin, in `TauCeti/Probability/CentralLimitTheorem/Lindeberg.lean`" (lines 835–836) names a file that is not at the pin, and several Checks say "python:" where the computed value alone would serve.

## N03 — `ω(t, α)` in the stable characteristic function of §7.2 (line 671) is not defined; give its two cases.

## Questions for the author

- §7.1 says that Kallenberg's Theorem 6.17 "omits the condition `E X₀ = 0` from the statement for `p ∈ (1, 2)`". Is that so in the third edition? I could not read the book (paywalled), so I could not confirm that the statement there lacks the condition; if it has it, the parenthesis should go.
- The page numbers given for Durrett (for example p. 111 for Theorem 3.3.11) are not those of the author's posted copy of the fifth edition, where that theorem stands on the page numbered 128. Are they the pages of the Cambridge print?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 inversion (`tendsto_levyInversionIntegral`) | Bernoulli `(δ₀+δ₁)/2`, `a=0,b=1`; sign of inner integral | limit `0+(½+½)/2=½`; numeric `0.500058` at `T=2000`; inner integral `→π(sgn(x-a)-sgn(x-b))`, `/2π=1` inside | agrees; Durrett2019 line 6501 | none |
| 1.1 atom formula | Poisson(1) at `0` | `e⁻¹=0.36788` | agrees | none |
| 1.2 locally uniform convergence; doubling inequality | `ψ=\|φ\|²`; `1-cos 2u=2(1-cos u)(1+cos u)≤4(1-cos u)` | identity checked; `simp` does not close the Lean statement | true | none |
| 1.3 convergence of types | `μₙ=δ₀`, `aₙ=n` | `νₙ=δ₀`, `aₙ→∞`: nondegeneracy needed | agrees; Durrett2019 line 9526 | none |
| 2.1 no zeros, closure | Bernoulli `φ(π)=0`; `n=0` | `iidSumLaw μ 0=δ₀`, excluded by `0<n` | true | none |
| 2.2 distinguished logarithm (`distLog`, existence, continuity) | `φ` with a zero; `φ 0≠1` | no lift exists, `distLog=0`; `φ₀ 0=1` follows from the limit | definition determines object; Mathlib lemmas present at pin | none |
| 2.3 roots, compound Poisson approximation | `N(0,1)`, `t=1.3`, `n=10⁴` | error `≈φ·t⁴/(8n)=0.4296·3.57e-5=1.53e-5` | agrees with Check | none |
| 2.4 Gaussian lower bound | Poisson(5), `γ=1.77`; Cauchy | `max(5(1-cos t)-1.77t²)=0.681<log 2`; Cauchy forces the `½` | theorem true; Check's inference wrong | C03 |
| 2.4 bounded support | roots of a law on `[-R,R]` | roots in `[-R/n,R/n]`, `Var μ≤R²/n→0` | true | none |
| 3.2 existence, representation, uniqueness | second difference averaged over `h∈[-1,1]`, times `-½` | `σ²/6+∫e^{itx}(1-sin x/x)dν` | matches route | none |
| 3.3 affine images (`map_affine`) | Poisson: `a=2,d=0`; `a=½,d=0.3,λ=2` | drift `2λ-2λ=0`; `1+0.3+0=1.3`; general formula rederived by change of variable | agrees | none |
| 3.4 finite variance | exponential(1): `(1-e⁻¹,0,e⁻ˣ/x)` | mean `1-e⁻¹+e⁻¹=1`; variance `∫xe⁻ˣ=1` | agrees | C02 (prose target) |
| 3.5 Doeblin | Poisson; exponential | finite `ν`, atom `≥e^{-λ}`; infinite `ν`, diffuse | agrees | none |
| 3.6 half-line | exponential(1) | `b-∫₀¹x·e⁻ˣ/x dx=0≥0`, `σ²=0`, `∫min(1,x)dν<∞` | agrees | none |
| 3.7 Lévy measure from roots | Poisson: `ν=λδ₁` | `ν{\|x\|=1}=λ≠0`: §4.1 not applicable | statement true, route gap | R01, C01 |
| 4.1 convergence through triplets | jumps `δ_{1+1/n}→δ₁`; `N(0,1/n)→δ₀` | drifts `0` vs `1`, truncVar `0` vs `1`: `h1` needed; `(0,1/n,0)→(0,0,0)` | agrees | R01 (general `h`) |
| 5.1–5.2 infinitesimal arrays, Khintchine | `X n 0=ξ` Bernoulli | limit Bernoulli, not infinitely divisible | hypothesis needed | none |
| 5.3 Doeblin–Gnedenko | Poisson limit at `h=½` | `a^h=0`, `b^h=c-c=0` | consistent at general `h` | R01 |
| 5.4 Gaussian convergence | centred Bernoulli rows; `c=0` | `\|X\|≤max(p,q)/√(npq)≤1`: sums `0` and `1`; `N(b,0)=δ_b` | agrees | none |
| 5.5 Feller's converse | `X n 0~N(0,1)`, rest `0`, `ε=½` | `E(Z²;\|Z\|>½)=1-0.0309=0.969` | `max Var→0` needed | none |
| 5.6 Poisson convergence | `Bin(n,1.5/n)`, `n=5000`; values in `{0,2}` | `ℓ¹=1.57e-4`; limit `2·Poi(c/2)`, variance `2c` | theorem agrees (Durrett2019 line 8733, sufficiency); route gap | R01, C05 |
| 6.1 regular variation, power limit, uniform convergence | `U=e^{-t}`; `h(x₀)=0` | ratio diverges for `x<1`; `h(x₀)=0` forces divergence at `1/x₀`: `h>0` automatic | true | none |
| 6.2 Karamata | `x^{½}log x`; `x⁻²`; `ρ=-1`: `1/x` | `1.660, 1.576, 1.550→1.5`; `→0≠-1`; `1/log x→0=ρ+1` | agrees | none |
| 6.3 truncated moments | Pareto `x⁻²`; `δ_c`, `c≠0` | `L₀=2 log x`, ratio `1/(2 log x)`; translate `L=0`, not slowly varying | nondegeneracy needed | none |
| 7.1 weak laws | Cauchy; `1/(x log x)`; St. Petersburg, `p=0.8` | `rP→2/π`; `1/log r→0`; `r^pP≤2r^{-0.2}→0` | theorems consistent; example false | R02, C04 |
| 7.2 stable laws | Cauchy, Gaussian, Poisson; `α>2`; root | `a=n`, `√n`; lattice forces `a=1`, `λ≠nλ`; `n^{2/α-1}→0` gives `\|φ\|≡1`; root `(X-b/n)/a` | statements true; route slip | R03 |
| 7.3 stable laws as limits | `S_{kn}` as `k` blocks | matches Durrett2019 lines 9512–9525 | agrees | none |
| 7.4 domains of attraction | Pareto `x^{-3/2}`; bounded law | `L=3(√x-1)`, ratio `1.41425` at `10⁸`; `L` eventually constant, slowly varying | agrees; Durrett2019 line 9247 (sufficiency, normings) | none |
| 7.5 moments | Pareto `x^{-3/2}` | `E X^β=1.5/(1.5-β)`, finite iff `β<3/2` | agrees | none |
| 8.1 self-decomposable laws | exponential, `B=(1,2)`, `c=½`; Poisson | `ν(B)=0.170`, `ν(cB)=0.340`; no density | theorem true; route direction reversed | R03 |
| 8.2 infinite divisibility on `ℕ` | geometric; Bernoulli; `P(ξ=0)=0` | `ν_k=p^k/k`; `ν₂=-½<0`; `P(ξ=0)=P(root=0)ⁿ>0` forced | agrees | none |

- Source locators checked against the text: 9, all in Durrett2019 (Theorems 2.2.12, 3.3.11, 3.6.10, 3.7.1, 3.8.2, 3.8.8, 3.8.9, 3.9.6, 3.9.7; lines 3377, 6501, 8632, 8733, 9247, 9512, 9526, 9693, 9713); theorem numbers and statements agree, printed pages not checked.
- Library declarations opened at the pin: `charFun_map_sum_pi_eq_prod` (`Mathlib/Probability/Independence/CharacteristicFunction.lean:206`), `measureReal_abs_gt_le_integral_charFun` (`Mathlib/MeasureTheory/Measure/IntegralCharFun.lean:96`), `Complex.isCoveringMap_exp` (`Mathlib/Analysis/Complex/CoveringMap.lean:46`), `isTightMeasureSet_of_tendsto_charFun` and `ProbabilityMeasure.tendsto_iff_tendsto_charFun` (`Mathlib/MeasureTheory/Measure/LevyConvergence.lean:44, 214`), `TauCeti.exists_probabilityMeasure_of_tendsto_charFun` (`TauCeti/MeasureTheory/Measure/LevyConvergence.lean:48`), `charFun_compoundPoissonMeasure_cond` (`TauCeti/Probability/Distributions/CompoundPoisson/Intensity.lean:52`), `stableLevyMeasure` (`TauCeti/Probability/Distributions/Stable/LevyMeasure.lean:56`).
- Duplication by object at the pins: no regular variation, infinite divisibility, general Lévy–Khintchine triplet, convergence of types, domain of attraction, self-decomposability or Lindeberg converse in Mathlib or Tau Ceti; the Tau Ceti stable and compound Poisson files are the special cases the README names.
- Cross-roadmap citations resolved on main: MathematicalStatisticsAsymptotic §1.2 (Lindeberg–Feller sufficiency, arrays on `(Ωₙ, μₙ)`), StandardDistributions Layer 15 (stable laws, excluding the general classification), MathematicalStatisticsFoundations §8.5 (weak law for integrable sequences), FreeProbability.

Overlap check: read the scope of SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, LocalLimitTheorems, MathematicalStatisticsHigherOrderAndResampling, BinomialToBlackScholes, StandardDistributions and MathematicalStatisticsAsymptotic, and searched MathematicalStatisticsNonparametric by object; nothing shared.
- Dependency check: `depcheck: 155 roadmaps, 1785 edges, 0 problem(s)`; both suppliers are on main.
- Elaboration of `Suggested.lean` at the pins: no error, 52 `sorry` warnings and nothing else. Ten signatures printed with `#check @name` and compared with the README: the array and i.i.d. theorems keep `[∀ n, IsProbabilityMeasure (μ n)]` and `[IsProbabilityMeasure P]`; nothing changed. One-tactic probe on five theorems: only `charFun_iidSumLaw` closes (C08).

Source independence: 14 passages compared with 1 source (Durrett2019), none shared; largest share Klenke, 26 of 85 locators; contents of Klenke not read (text and contents page unavailable): by locator numbers alone its citations fall in Layers 2, 3, 5 and 7, and Kallenberg's Chapter 7 locators (Layers 2–5) precede its Chapter 6 locators (§§5.4–5.6) in the roadmap's order, so no one-to-one mapping in order was found.

Research link: the headline targets (the Lévy–Khintchine formula, the Khintchine–Doeblin–Gnedenko limit theorem, domains of attraction) are prerequisites of Lévy processes and the Lévy–Itô decomposition (Kallenberg 2021, Chapter 7) and of local limit and rate theorems in stable domains; this rests on the README's "Downstream consumers" and "Beyond this roadmap" sections.

## Not verifiable

- Every locator into Kallenberg, Klenke, Petrov, Billingsley, Loève and Resnick: the six books are behind paywalls and no legal copy was found (publisher pages only, and no local copy).
- Of the sample this leaves unverified at the locator: 1.2 (Petrov), 2.3, 3.3 and 3.7 (Klenke), 5.4 and 5.5 (Kallenberg, Petrov), 6.1 and 6.2 (Resnick), 6.3 (Kallenberg), 8.1 (Petrov), and the necessity halves of 5.6, 7.3 and 7.4 (Kallenberg, Klenke, Petrov); 2.2 has no source locator and was checked against the Mathlib declarations of its route.
- The printed page numbers given for Durrett: the readable copy is the author's posted fifth edition, whose pagination differs from the pages cited.
- The README's statement that Kallenberg's Theorem 6.17 omits `E X₀ = 0` for `p ∈ (1, 2)`.

Automatic checks set aside as false positives: the 21 code-font names reported as occurring nowhere in the libraries are this roadmap's own declarations, each declared in `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- Not tested: Klenke, *Probability Theory* (3rd ed.), has the largest share of the locators (26 of 85); its text and contents page could not be read, so wording and arrangement were not compared with it.
- Not tested: six of the seven cited books (Kallenberg, Klenke, Petrov, Billingsley, Loève, Resnick) could not be read; 75 of 85 locators are unverified.
- Licence: the README's "Prior formalization" section names the Lean project CKMA (Apache 2.0, a repository of the pull request's author) as the starting point for §§2.1–2.3, 3.1–3.2 and 5.5; `Suggested.lean` was not compared with it.
