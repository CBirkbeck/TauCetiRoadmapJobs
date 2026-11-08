# Design report: DESIGN-AnalyticNumberTheoryPartIII

Deliverables: `packages/AnalyticNumberTheoryPartIII/design/README.md`,
`packages/AnalyticNumberTheoryPartIII/design/plan.json` (7 layers, 36 targets, 10 definitions each
with at least three tests, no gaps) and `packages/AnalyticNumberTheoryPartIII/sources.toml`
(`sources check`: 0 problems).

## What the design covers

The design is a Part II-type extension of AnalyticNumberTheoryPartI (`parent` in `plan.json`),
numbered Layers 7–13 after Parts I–II.

- **Layer 7.** Fourier decay of `𝓕f` for integrable bounded-variation `f` (sharp constant
  `V/(2π|ξ|)`), for `f` with a bounded-variation derivative, and the `C²` form as a corollary of
  Mathlib's `Real.one_add_sq_mul_norm_fourier_le`. It also has the two uniform bounds on the
  truncated Dirichlet integral, and principal-value inversion of the two-sided Laplace and Mellin
  transforms with a windowed error, plus the Perron instance as a Check.
- **Layer 8.** The rectangle residue theorem in Mathlib's edge form and the U-shaped contour
  identity; Carathéodory's coefficient inequality and the `k`-th derivative Borel–Carathéodory
  bound; Landau's local logarithmic-derivative lemma.
- **Layer 9.** Mellin convolution, Mellin transforms of compactly supported `C^k` bumps, delta
  spikes and their approximate-identity property, and smoothed cutoffs.
- **Layer 10.** The smoothed sum as an inverse Mellin integral and its comparison with the sharp
  sum; Ingham's transfer theorem at the generality of `platttrudgian2020` (any continuous
  nonincreasing width with a polylogarithmic lower bound, any Dirichlet series with
  `|a(n)| ≤ B log(n + 1)` and an at most simple pole); the classical `L′/L ≪ log(|t| + 3)` bound for
  every presented Hecke `L`-function of a fixed field and character.
- **Layer 11.** Complete multiplicativity with its equivalence to `ℕ →*₀ R`; `σ_ν` and `d_z` for
  complex parameters with exact abscissas; Ramanujan's identity; the series of `2^ω`, `μ²`, `λ`, `φ`.
- **Layer 12.** The Hardy–Landau Tauberian theorem (one-sided real and two-sided Banach forms).
- **Layer 13.** Erdős problem 392 (both bounds, both factor sizes) and the Goldbach-range
  propositions with two transfers and the published verifications as named hypotheses.

### Items of the target left to other roadmaps, and why

- **Fejér's theorem** (target T12.2, uniform and `L^p` convergence on `AddCircle T`) is not planned
  here. The Fejér means are owned on main by OperatorTheory/ToeplitzOperators T1, which proves their
  `L¹` approximation (the open revision of that roadmap defines them by their coefficients
  `(1 − |k|/N) f̂(k)`). Uniform and `L^p` convergence extend that object, and no target of this roadmap
  uses them. Under the brief's rule ("an extension in an existing roadmap's direction is '<that
  roadmap>, Part II'"), they are proposed below as ToeplitzOperators, Part II, rather than defining a
  second Fejér mean here.
- **The sine integral `Si` as a function** (target T7.2) is planned, as an entire function with
  oddness, derivative, asymptotics and the Gibbs maximum at `π`, by SpecialFunctionsEiLiErfIncompleteGamma
  Layer 9 (an open new-roadmap pull request of another author). 7.2 here states only the two
  uniform bounds on the real truncated Dirichlet integral that 7.3 uses, with no new definition.
- **The shift of a full vertical line across a strip under uniform decay** (first half of target
  T8.1) is AsymptoticExpansions §8.2 (an open new-roadmap pull request of another author). 8.1 here
  is the finite-height rectangle statement with poles of any order and no decay hypothesis, which is
  what 10.2 needs. No target here consumes AsymptoticExpansions.
- **The `W^{2,1}` norm adapter** (target "Changes" item 4) is not planned: no target of the
  roadmap or of its consumers uses it, and the density theorem itself is Tau Ceti's
  `TauCeti.Wkp.denseRange_ofTestFunctionₗ_top`.
- **Integrals against bounded-variation integrators** (target "Changes" item 5) stay with Mathlib's
  `BoundedVariationOn.vectorMeasure` and `∫ᵛ`, which 7.1 consumes directly.

## Corrections to the filed statements found by the adversarial pass

1. **Windowed inversion error (target T7.3(c)) was false.** The tail cannot be bounded by
   `‖e^{−cu}g‖₁/(Tδ)` for merely integrable weights: for `h(u₀ − v) = sin(T₀v)1_[δ,2δ](v)`, at
   `T = T₀` the tail integral tends to `(log 2)/(2π) ≈ 0.110` while `‖h‖₁/(T₀δ) ≤ 1/T₀ → 0`. The
   design states the window bound under global bounded variation, with error
   `C(V⁺_δ + V⁻_δ + V/(Tδ))`. Pointwise convergence keeps the local hypothesis and uses the
   Riemann–Lebesgue lemma for the tail.
2. **Smoothed-sum comparison (target T10.1) was false for `εX < 1`.** For `a ≡ 1`, `X = 2`,
   symmetric `ν` and `ε ≤ log₂(3/2)`, the sharp and smoothed sums differ by `1/2`, while
   `CBεX log X = 2Cε → 0`. The design's bound is `C B (εX + 1) log X`.
3. **Transfer theorem (target T10.2) hypothesis "bound on F away from a fixed neighbourhood of 1"
   was insufficient.** The left edge of the contour is at `1 − η(T + 3)`, which tends to `1`, so it
   passes arbitrarily close to the pole. The design bounds the regular part `G = F − r/(s − 1)`,
   holomorphic on an open set containing the region, on the whole region. The pole term is bounded
   by `|r|/η(T + 3)` and absorbed using `η ≥ a₀(log t)^{−A}`.
4. **Erdős 392 inputs (target T13.1).** The target named the PNT (ArithmeticDirichletSeries Layer 10)
   and Mertens (Part I §§0.11, 0.21). The certified source's route needs only Chebyshev's bound,
   `π(n) ≤ √n + 2n log 4/log n`, Legendre's formula and Stirling
   (`kontorovichtao-pntplus` lines 3063–3090). The design cites only Mathlib for it.
5. **Mellin-convolution symmetry (source Lemma 4.3.2, "x ≠ 0").** This holds only for `x > 0` in a
   carrier on `ℝ`. The design asserts it at `x > 0`, and a Check exhibits failure at `x = 0`.
6. **Principal-value inversion locator.** The target cited `kontorovichtao-pntplus` §4.2 for T7.3,
   but that section proves the smoothed formula `(2πi)⁻¹∫ x^s/(s(s+1)) ds = (1 − 1/x)₊`
   (lines 846–865), not principal-value inversion. The design cites `montgomeryvaughan2007` §5.1
   and `titchmarsh1986` Chapter III, by locator.
7. **Classical log-derivative bound (target T10.3)** is stated on the whole region, including
   `|t| < 1`, as a regular part `G` plus `δ_χ/(s − 1)`. This is the form 10.2 consumes, with the
   exceptional real zero excluded by shrinking `c`. It also covers imprimitive presented
   characters and the trivial character of any modulus.

## Adversarial-pass table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.1 decay `‖𝓕f(ξ)‖ ≤ V/(2π|ξ|)` | `f = 1_[0,1]`, `ξ = 1/2`; `ξ = 0`; `f = 1/(1+x²)`, `ξ = 0.1` | `2/π = 2/π`; `1 > 0` (junk `V/0`); `1.68 ≤ 3.18` | holds, sharp; fails at `ξ = 0` | hypothesis `ξ ≠ 0` kept, Check added |
| 7.1 BV + integrable ⇒ bounded, `→ 0` | `1_[0,1]`; `1_[0,∞)` | `sup = 1 ≤ V = 2`; not integrable, limit `1` | holds; non-example shows integrability needed | API lemma added |
| 7.1 derivative of bounded variation | tent `max(0,1−|x|)`, `ξ = 1/2`, `ξ = 0` | `4/π² = 4/π²`; `1 ≤ 1 + 1/π²` | holds, sharp | none |
| 7.1 `C²` form | `f = 1/(1+t²)`, `A = 2`, `ξ = 0` | `π ≤ 2(π + 1/(4π)) ≈ 6.44` | holds | reduced to Mathlib + `f′` integrability lemma |
| 7.2 `|I(x)| ≤ I(π)`, tail `≤ 2/x` | `x = π, 2π, −1`; claim `|I| ≤ π/2` | `I(π) ≈ 1.85194`; `0.281 ≤ 0.637`; `0.153 ≤ 0.318`; `2.517 > −2` | holds for `x > 0`; `π/2` claim false | `x > 0` kept; Si function not defined |
| 7.3 pointwise inversion | `1_(0,1]` at `x₀ = 1` | `π⁻¹ arctan(T/σ) → 1/2`, not `f(1) = 1` | holds with mean of one-sided limits | none |
| 7.3 windowed error | `h(u₀−v) = sin(T₀v)1_[δ,2δ]`; `h = e^{−σu}1_{u≥0}` | tail `→ 0.110` vs `‖h‖₁/(T₀δ) → 0`; error `π⁻¹ arctan(σ/T) ≤ C(σδ + 2/(Tδ))` | filed form false | global BV hypothesis, bound `C(V⁺+V⁻+V/(Tδ))` |
| 8.1 rectangle residues | `1/s`, `1/(s−2)`, `1/s²` on `[−1,1]²` | `2πi` (clockwise `−2πi`); `0`; `0` | holds; orientation pinned | poles restricted to open rectangle |
| 8.2 Carathéodory, derivative BC | extremal `−2M(z−z₀)/(R−(z−z₀))`, `k = 1, 2`; `k = 0`, `f ≡ i`; `r = R/2` | equality `2k!MR/(R−r)^{k+1}`; `|i| ≤ 0` false; `8M/R ≤ 128M/R` | holds `k ≥ 1`, sharp | `k ≥ 1` kept |
| 8.3 Landau lemma | `f = z−ρ`; `f = z−z₀−ε`; `M = 0`; rescaling `z ↦ λz` | `0 = 0`; `1/ε` vs `C log((R+ε)/ε)/R`; constant `f`; both sides scale by `λ` | holds; zero sum necessary | `C` depends on ratios only |
| 9.1 Mellin convolution, symmetry | `1_(0,1] ⋆ 1_(0,1]`; `x = 0` with `1_[0,1]`, `1_[1,2]`; `1_[1,2]⋆1_[1,2]` at 2 | `log(1/x)`, transform `1/s²`; `log 2 ≠ 0`; `log 2`, support `[1,4]` | symmetry only at `x > 0` | statement restricted to `x > 0` |
| 9.2 bump transforms | `(x−1)²(2−x)²1_[1,2]`; `max(0,1−x)²`; sign at `s = 1` | `4 log 2 − 11/4 ≈ 0.0226` vs `1/30`; `2/(s(s+1)(s+2))` not entire; `1/30 = 1/30` | holds with support in `(0,∞)` | support hypothesis `0 < a` kept |
| 9.3 delta spikes | `ε = 1`, `ε = 1/2`, `x = −1` | `ν_1 = ν`, mass `1` (without `ε⁻¹`: `ε`); support `[2^{−1/2}, 2^{1/2}]`; value `0` | holds | explicit `0` on `x ≤ 0` |
| 9.4 smoothed cutoffs | symmetric `ν`, `x = 1`; `x = 0`; `ε → 0`; `s = 1 + iT` | `1/2`; `0`; `1/s` (wrong normalization → `0`); `≍ 1/T` then `≍ 1/(εT²)` | holds | `ε ≤ 1` for uniformity |
| 10.1 identity | `a = δ₁` | both sides `1̃_ε(1/X)` | holds; needs `k ≥ 1` | `k ≥ 1` hypothesis |
| 10.1 comparison | `a ≡ 1`, `X = 2`, `ε ≤ log₂ 1.5` | difference `1/2` vs `2Cε` | filed bound false | `(εX + 1)` |
| 10.2 Ingham exponent | `η = 1/log t`, `x = e^{100}`; `η ≡ η₀`; `η(x) log x` | `20` at `log t = 10`; `η₀ log x + log 3`; constant `c₀` | infimum form correct | API added |
| 10.2 transfer | `η = c/log t`; `η = A₀/log⁹ t`; `a = μ`; `a ≡ 1`; `a = Λ` | `exp(−c√log x)`; `exp(−c(log x)^{1/10})`; `M(x)` bound; `⌊x⌋ − x = O(1)`; `ψ` | consistent with ZerosOfLFunctions §8.5 and source line 1684 | regular-part hypothesis on whole region |
| 10.3 log-derivative bound | `K = ℚ, χ = 1`; residue sign; trivial character mod 2 | residue of `−ζ′/ζ` is `+1`; Part I §0.33 gives `log³ t`; extra `G` term `(log 2)2^{−s}/(1−2^{−s})` bounded on `Re s ≥ 1/2` | holds; consistent | whole-region form with `δ_χ` |
| 11.1 complete multiplicativity | `λ(4), λ(12)`; `μ(4)`; zero function; `λ ⋆ μ²` at 4 | `1 = 1`, `−1 = −1`; `0 ≠ 1`; not `→*₀`; `0 − 1 + 1 = 0` | holds | `f 1 = 1` kept |
| 11.2 `σ_ν` and abscissa | `σ₁(6)`, `σ_{−1}(6)`, `σ_{1/2}(4)`; `ν = 2, −2, i`; `s = 3, ν = 1` | `12`, `2`, `3 + √2`; `3`, `1`, `1`; `ζ(3)ζ(2) ≈ 1.97730` | holds; `1 + Re ν` alone wrong for `Re ν < 0` | `max` form; `Re ν = 0` needs `ζ(1+it) ≠ 0` |
| 11.2 `d_z` | `d_{1/2}(p²)`, `d_{1/2}⋆d_{1/2}(p²)`; `d_3(4)`; `d_{−1}`; `z = 0`; principal `ζ^{1/2}` | `3/8`, `1`; `6` (unordered `2`); `μ`; abscissa `⊥`; sign differs off `Im log ζ ∈ (−π,π]` | holds; Euler-product log required | `z ≠ 0` for abscissa 1 |
| 11.3 Ramanujan | `α = β = 0` at `p²`; `τ(n²)` factors; `α = 2, β = 0, s = 3` | `9` (without `ζ(2s)`: `10`); `1 + 3X + 5X²`; boundary divergence `Σ 2(p²+1)/p³` | holds on the open half-plane | none |
| 11.4 classical series | Euler factors; `φ` at `Re s ∈ (1, 2]`; `μ²(12)` | `1+2X+2X²`, `1+X`, `1−X+X²`, `1+(p−1)X`; `Σ(p−1)/p² = ∞`; `0` | holds; abscissa of `φ` is `2` | `Re s > 2` for `φ` |
| 12.1 Hardy–Landau | `(−1)^n`; `a_n = 1`; `(−1)^n/√n`; `(−1)^n/(n+1)` | means `1/2`, sums alternate; means diverge; outside hypothesis; `log 2` | hypothesis necessary | none |
| 13.1 Erdős 392 | `n = 4`, `B = 16` and `4`; `n = 0, 1`; wrong main term | `2`, `3`; `0`; contradicts `log n!/(2 log n)` | holds | inputs reduced to Chebyshev |
| 13.2 Goldbach ranges | `H = 30, 33`; `H = 3, 6`; starts `2`, `5`; transfer `Δ = 2, x₀ = 5` | true by search; vacuous; false; `OddGoldbachUpTo 56`, `55 = 3+5+47` | holds | `Δ > 1`, `x₀(1−1/Δ) ≥ 2` |

## Notions moved down from later roadmaps

None. One overlap is recorded with a later roadmap: ArithmeticDirichletSeriesPartII (merge order
line 91) §5.1, `LSeriesHasSum_zeta_pow`, states the Dirichlet series of `d_k = ζ^k` for `k ∈ ℕ`.
That is the natural-number case of 11.2 (`generalizedDivisor`). Since that roadmap comes later, its
revision should cite 11.2 for the series identity and keep its counting theorem. All other
neighbouring roadmaps use Mathlib's `ArithmeticFunction.zeta ^ k` for `τ_k`
(SieveMethodsAndPrimePatterns §1.1, ProbabilisticAndMetricNumberTheory); 11.2's agreement lemma
matches that carrier.

AnalyticNumberTheoryPartI §3.24 (earlier in the order) uses the identity
`Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)` as a step of its fourth-moment route without stating it as a
target; 11.3 here proves it. Part I cannot cite a later roadmap, so its revision should either
state the `α = β = 0` case locally or take this identity as a proof-route ingredient it plans
itself.

## Proposed Part IIs

- **ToeplitzOperators, Part II:** uniform convergence of the Fejér means of continuous functions on
  the circle and their `L^p` convergence, `1 ≤ p < ∞`, on T1's Fejér means. Uniform trigonometric
  approximation of continuous symbols in T2 would use it. Open sources: Jerison, MIT 18.103 notes,
  Theorem 1, already cited by the open ToeplitzOperators revision.
- **Analytic number theory, a later part with zero-density input:** Ingham's constant `1/2 − ε` and
  Pintz's `1 − ε` in 10.2 (`platttrudgian2020` lines 54–56), and the Vinogradov–Korobov width as
  an instance. Both need zero-density or exponential-sum input that lies after this roadmap.

## Gaps

None. Every prerequisite is a pinned declaration (read at the pin), a section of a roadmap on main
(ZerosOfLFunctions, LFunctions, ContourIntegration, ArithmeticDirichletSeries), a section of
AnalyticNumberTheoryPartI (merge order line 49), or an earlier target.

## Sources

- Certified and read: `kontorovichtao-pntplus`, `platttrudgian2020`,
  `oliveiraesilva-herzog-pardi2014`, `helfgottplatt2013`, `alexeevetal2025factorial`.
- Fetched in this job: `estradavindas2012littlewood` (arXiv:1201.1408v1, open repository; the
  one-sided Hardy–Littlewood theorem at lines 32–35, used for 12.1) and `dlmf-ch6` (DLMF Chapter 6,
  institutional; the auxiliary-function bounds 6.12.5–6.12.8 and the first maximum of `Si`, §6.16,
  used for 7.2). For `dlmf-ch6` the chapter page is cached; sections 6.12 and 6.16 were read
  online on the same site.
- Uncertified, cited by locator only (settled): `montgomeryvaughan2007`, `titchmarsh1986`,
  `iwanieckowalski2004`, `tenenbaum2015`, `apostol1976`, `hardy1949`, `katznelson2004`. Their
  locators are now chapter- or section-level, and no theorem numbers are guessed. `hardy1949` is
  cited for the statement only; the certified support for 12.1 is `estradavindas2012littlewood`
  together with the elementary route written out in the README.
- No text is missing, and `needs-references.toml` was not written.

## Ownership against open pull requests

Checked with `roadmaps grep` over main and the heads of all 471 open roadmap pull requests, by
object. Searches covered: Mellin convolution; vertical-line shifts; Borel–Carathéodory; Fejér;
Hardy/Landau/Cesàro Tauberian; sine integral; complete multiplicativity; Goldbach; Erdős 392;
`d_z` and generalized divisor functions. Planned Lean names were also checked against every
`Suggested.lean`, with no collision. Findings:
- AsymptoticExpansions §8.2 (line shift) and SpecialFunctionsEiLiErfIncompleteGamma Layer 9 (`Si`)
  are owned there; the design cites them in Scope and does not consume them.
- ToeplitzOperators T1 owns the Fejér means.
- ArithmeticDirichletSeriesPartII §5.1 overlaps 11.2, as above.
- ProbabilisticAndMetricNumberTheory's `powOfAdditive` (for `2^ω`) is not needed: 11.4 uses
  `n ↦ 2^{ω(n)}` inside `LSeries` without a carrier.
- SieveMethodsAndPrimePatterns has Goldbach-type sieve bounds, not the range propositions.
- CircleMethodThreePrimes excludes numerical ternary Goldbach.

The ZerosOfLFunctions sections cited (§§3.4, 4.3, 6.2–6.5, 7.1, 8.5, 8.6) keep their numbers at the
heads of both open revisions of that roadmap (#1907, #1913). The overlap tool reports no dropped id
for AnalyticNumberTheoryPartI or ZerosOfLFunctions.

## Dependency check

    candidate: AnalyticNumberTheoryPartIII is not in the merge order yet; checked as if placed after AnalyticNumberTheoryPartI (the intake inserts it when its design is accepted)
    depcheck: 237 roadmaps, 2422 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no
TauCetiRoadmap Lean name found nowhere. The tool did not check Mathlib or Tau Ceti names on this
host; each of them was read at the pins by hand.

## Untrusted text

Issue text, other roadmaps' READMEs and Lean files, and the fetched papers and pages were treated
as data. None contained an instruction directed at the worker.
