Verdict: part-ii
Name: AnalyticNumberTheoryPartIII
Base: AnalyticNumberTheoryPartI
Owner: none

# Analytic number theory, Part III: the smoothed contour-shift route from zero-free regions to prime error terms, and the Dirichlet series of the classical arithmetic functions

## Scope

**Place in the series.** The analytic number theory series has two roadmaps, both open pull
requests earlier in the merge order. AnalyticNumberTheoryPartI (#1126, merge order line 49) owns
Layers 0–3: quantitative primes, the exclusion of Landau–Siegel zeros, explicit formulas, Hecke and
Artin comparisons, multiplicative means. AnalyticNumberTheoryPartII (#1167, line 50) owns
Layers 4–6 (Lerch and Barnes functions, double Dirichlet series, Bost–Connes) and consumes Part I.
The unsuffixed AnalyticNumberTheory (board #123) was only a navigation index and was rejected
(`packages/AnalyticNumberTheory/reports/REV-PKG-AnalyticNumberTheory~2.md`, finding F01).

This target extends Part I in its own direction: it adds the analytic route from a zero-free region
to an error term for prime sums, and the Dirichlet series of the arithmetic functions whose averages
Part I's Layer 3 estimates. It reuses Part I's carriers and conventions: the `d_n` of §3.3 and the
zero-free strip of §0.33. It plans none of Part II's objects. So it is the third part of the series,
with Part I as its base. It owns **Layers 7–13**, starting where the series stops. The filed
Layers 0–6 are renumbered 7–13, so that citations such as "AnalyticNumberTheoryPartI §0.33" and
"Part III §7.1" never collide.

**What the roadmap owns.** All statements use Mathlib's carriers: the Fourier transform `𝓕` on `ℝ`
(kernel `e^{−2πixξ}`), `mellin`/`mellinInv`, `riemannZeta`, `LSeries`, `ArithmeticFunction`,
`ArithmeticFunction.vonMangoldt` and `Chebyshev.psi`.

- **Layer 7, Fourier and Laplace tools.**
  - Decay of the Fourier transform of an integrable function of bounded variation, and of a
    function whose first derivative is of bounded variation.
  - The sine-integral function `Si` and its bounds. The limit `∫₀^∞ sin x/x dx = π/2` itself is
    Tau Ceti's and is consumed.
  - Principal-value inversion on vertical lines for the two-sided Laplace and the Mellin
    transform, with a windowed error for the truncated (Dirichlet-kernel) integral.
- **Layer 8, contours and discs.**
  - Shifting a vertical line integral across a strip that contains finitely many poles, in the
    full and the half-infinite (U-shaped) versions.
  - The derivative form of the Borel–Carathéodory inequality.
  - Landau's local logarithmic-derivative lemma on a disc, with the zeros removed.
- **Layer 9, Mellin smoothing.**
  - Mellin convolution and its transform.
  - Mellin transforms of compactly supported `C^k` bumps.
  - Approximate identities for the Haar measure `dx/x`.
  - The smoothed cutoffs `1̃_ε` with `𝓜1̃_ε(s) = 𝓜ν(εs)/s` and their bounds.
- **Layer 10, from a zero-free region to an error term.**
  - Smoothed summatory functions of Dirichlet series as line integrals, and their comparison with
    the sharp sums.
  - The general transfer theorem (Ingham's form): a zero-free region of width `η(t)` together with
    a polylogarithmic bound for the logarithmic derivative gives an error `x exp(−c ω(x))`.
  - The classical logarithmic-derivative bound inside the de la Vallée Poussin region, for `ζ`,
    `ζ_K` and Hecke `L`-functions of a fixed field and character.
- **Layer 11, Dirichlet series of classical arithmetic functions.**
  - A completely multiplicative predicate on `ArithmeticFunction R`, its API, and its equivalence
    with Mathlib's `ℕ →*₀ R` carrier of completely multiplicative Euler products.
  - The divisor functions `σ_ν` (`ν ∈ ℂ`) and `d_z` (`z ∈ ℂ`).
  - Ramanujan's four-shift identity and its corollaries.
  - The series of `2^ω`, `μ²`, `λ` and `φ`.
  - The half-plane of absolute convergence of each series.
- **Layer 12, summability.**
  - The Hardy–Landau Tauberian theorem for Cesàro means.
  - Fejér's theorem: uniform convergence for continuous functions and `L^p` convergence, on
    `AddCircle T`.
- **Layer 13, arithmetic applications with no other home.**
  - The asymptotic number of factors needed to write `n!` as a product of integers at most `n²`
    (Erdős problem #392), and at most `n`.
  - The Goldbach-range propositions and the elementary even-to-odd transfer.
  - The published finite verifications, recorded as named propositions that theorems take as
    hypotheses.

**Changes from the filed wording.** The changes are of two kinds: generalisations required by the
brief, and trims where the library or another roadmap already owns the item.

1. *Transfer theorem, generalised.* The filed form takes a region `σ ≥ 1 − A/log^{n₁}|t|` and a
   bound `|ζ′/ζ| ≪ log^{n₂}|t|`, and concludes `ψ(x) = x + O(x exp(−c (log x)^{1/(1+n₁)}))`.
   That is one instance of Ingham's theorem. Ingham's theorem allows any nonincreasing width
   `η(t)`, with `ω(x) = min_{t≥1}(η(t) log x + log t)`, as stated in `platttrudgian2020`
   lines 21–32. It also holds for any Dirichlet series `F` whose coefficients are bounded by a
   multiple of `log n`, and whose continuation has at most a simple pole at 1 in the region. So T10.2
   is stated in that generality. The `n₁`-form is a Check. The case `n₁ = 9, n₂ = 9` is the
   blueprint's `MediumPNT` (`kontorovichtao-pntplus` line 1684). The case `n₁ = 1` is the classical
   error term. The Vinogradov–Korobov width is also a Check, kept conditional (Risks 3).
2. *Classical PNT not restated.* The error term `ψ(x) = x + O(x exp(−c √log x))` is
   ZerosOfLFunctions §8.5 at `K = ℚ`, proved there through the truncated explicit formula. Here
   it is only a consistency Check of T10.2 and T10.3. ZerosOfLFunctions also keeps the zero-free
   regions (§§6.2–6.4). AnalyticNumberTheoryPartI keeps every effective and conductor-uniform
   statement. The Explicit roadmaps keep every decimal constant.
3. *Sine integral, trimmed.* The Dirichlet integral is
   `TauCeti.Contour.tendsto_integral_sin_div_atTop`, with its `Real.sinc` form
   `tendsto_integral_sinc_atTop`. Only the function `Si` and its uniform bounds are owned here.
4. *Density, trimmed to an adapter.* Density of `C_c^∞(ℝ)` for `‖f‖₁ + ‖f′‖₁ + ‖f″‖₁` is
   `TauCeti.Wkp.denseRange_ofTestFunctionₗ_top`, applied to `E = ℝ`, `k = 2`, `p = 1`. It says
   test functions are dense in the whole-space `W^{k,p}`. Only the comparison of that norm with
   `‖f‖₁ + ‖f′‖₁ + ‖f″‖₁` for `C²` functions is owned, as an adapter.
5. *Integrals against integrators of bounded variation, removed from scope.* The Banach-valued
   Riemann–Stieltjes integral on bounded-variation paths is BanachAlgebras §2.1 on main. The
   Lebesgue–Stieltjes vector measure is Mathlib's `BoundedVariationOn.vectorMeasure`. Abel–Stieltjes
   summation is ArithmeticDirichletSeries Layer 6.1. None of these is planned again.
6. *Fejér, built on the existing owner.* OperatorTheory/ToeplitzOperators T1 on main defines the
   Fejér means on circle `L¹` and proves their `L¹` approximation. T12.2 adds uniform convergence
   for continuous functions and `L^p` convergence, on T1's definition. The `L¹` statement is a
   Check.
7. *Divisor functions, generalised.* `d_k` is AnalyticNumberTheoryPartI §3.3's `d_n`, the ordered
   `n`-fold factorisation count, and is not redefined. It is generalised to `d_z` for complex `z`,
   with `L(d_z, s) = ζ(s)^z` (`tenenbaum2015`, Chapter II.5); `d_k` is a Check. Mathlib's
   `ArithmeticFunction.sigma k` with `k : ℕ` is generalised to `σ_ν` with `ν ∈ ℂ`, with an agreement
   lemma.
8. *Completely multiplicative functions, matched to Mathlib.* Mathlib's Euler product for
   completely multiplicative functions is stated for `ℕ →*₀ F`
   (`Mathlib/NumberTheory/EulerProduct/Basic.lean`, section `CompletelyMultiplicative`). The
   predicate must therefore come with an equivalence to that carrier, not with a second Euler
   product.
9. *Goldbach, as propositions and an elementary transfer.* The even-to-odd transfer needs primes
   in short intervals. Those are ExplicitPrimeCounting's (merge order line 269, after this
   roadmap). So here the prime-in-interval statement is a hypothesis of the transfer. The instances
   with published prime-gap theorems belong to a roadmap after ExplicitPrimeCounting. The
   verifications themselves are named propositions, never proved here.
10. *Erdős #392, both bounds.* The blueprint proves the upper bounds (`kontorovichtao-pntplus`
    lines 3096–3100). The matching lower bounds follow from Stirling (Mathlib
    `Stirling.factorial_isEquivalent_stirling`), so the asymptotic equality is the target.

**Boundaries (not owned here).**
- Zero-free regions, zero counting, the explicit formula and the PNT for `ζ_K` and Hecke
  `L`-functions: ZerosOfLFunctions Layers 4–8.
- Siegel, Landau–Siegel exclusion, conductor-uniform estimates, the Dirichlet divisor average
  (§3.22) and the pointwise divisor bounds (§§3.1, 3.4): AnalyticNumberTheoryPartI.
- Every decimal constant, the explicit truncated and smoothed Perron formulas, the
  Vinogradov–Korobov region and Pintz-type sharpenings: ExplicitZetaBounds, ExplicitPrimeCounting
  and ExplicitMultiplicativeFunctions.
- Truncated Perron for `LSeries`, the generic `ψ → θ → π` transfer and Wiener–Ikehara:
  ArithmeticDirichletSeries Layers 6, 9 and 10.
- Newman's Tauberian theorem: TauberianBoundaryConvergence.
- The one-sided Laplace carrier `HasLaplace` and Delange's theorem: ArithmeticDirichletSeriesPartII.
  T7.3 is stated for Mathlib's Fourier carrier and needs neither.
- Residue calculus: ContourIntegration (Completed).

## Final targets

Locators: `<source id> line N` refers to the worker's line-numbered extraction of a certified
source. Uncertified works are cited by chapter or equation. Each target is to be stated in the
design's own words.

### Layer 7: Fourier and Laplace tools

**T7.1 (Fourier decay).**
- (a) Let `f : ℝ → ℂ` be integrable and of bounded variation on `ℝ`, with total variation `V`.
  Then `|𝓕f(ξ)| ≤ V/(2π|ξ|)` for every `ξ ≠ 0`.
- (b) Let `f` be integrable and absolutely continuous, with `f′` of bounded variation, of total
  variation `V₁`. Then `|𝓕f(ξ)| ≤ V₁/(2π|ξ|)²` for `ξ ≠ 0`, and
  `(1 + ξ²)|𝓕f(ξ)| ≤ ‖f‖₁ + V₁/(4π²)` for all `ξ`.
- (c) The `C²` form: if `|f(t)|, |f″(t)| ≤ A/(1 + t²)`, then `|𝓕f(ξ)| ≤ C·A/(1 + ξ²)` with an
  absolute `C`.

Locators: `kontorovichtao-pntplus` lines 185–220 (Lemmas 3.1.3–3.1.7); `katznelson2004`
Chapter I for the periodic analogue.

**T7.2 (sine integral).** Define `Si(x) = ∫₀^x sin t/t dt` for real `x`.
- `Si` is odd and continuous.
- `|Si(x)| ≤ Si(π)` for all `x`.
- `Si(x) → π/2` as `x → +∞`. This is the consumed Tau Ceti limit.
- `|π/2 − Si(x)| ≤ 2/x` for `x > 0`.

The same bounds hold for the Dirichlet kernel integrals `∫_{−T}^{T} e^{iuv} dv/(πu)` used in T7.3.
Locator: standard; used in the blueprint's Perron and sinc-kernel chapters
(`kontorovichtao-pntplus` §4.2).

**T7.3 (principal-value inversion on vertical lines).**
- (a) Two-sided Laplace transform. Let `g : ℝ → ℂ` be such that `u ↦ e^{−cu} g(u)` is integrable.
  Put `G(s) = ∫ g(u) e^{−su} du` on `Re s = c`. If `g` is of bounded variation on a neighbourhood
  of `u₀`, then `(1/2πi)∫_{c−iT}^{c+iT} G(s) e^{su₀} ds → (g(u₀⁺) + g(u₀⁻))/2` as `T → ∞`.
- (b) Mellin transform. The same conclusion holds for the Mellin transform: if `x^{c−1} f(x)` is
  integrable on `(0, ∞)` and `f` is of bounded variation near `x₀ > 0`, the truncated
  `mellinInv` integrals converge to the mean of the one-sided limits at `x₀`.
- (c) Windowed error. The truncated integral equals the convolution of the weighted function with
  the Dirichlet kernel `sin(Tv)/(πv)`. Its distance from the local mean over a window `|v| ≤ δ`
  is bounded by the variation of the weighted function on the window, plus a tail of size
  `‖e^{−cu} g‖₁/(Tδ)` up to an absolute constant.
- (d) Instance. For `f = 1_{(0,1]}` this is the truncated Perron kernel, Tau Ceti's
  `TauCeti.truncatedPerronKernel` and `truncatedPerronKernel_one` (ArithmeticDirichletSeries
  §6.3). That instance is a Check, not a new theorem.

Locators: `kontorovichtao-pntplus` §4.2 (Perron formula on rectangles, lines 643–866);
`montgomeryvaughan2007` Chapter 5 (filer's locator).

### Layer 8: contours and discs

**T8.1 (line shifting).** Let `σ₁ < σ₂`. Let `f` be holomorphic on an open set containing the
closed strip `σ₁ ≤ Re s ≤ σ₂`, except at a finite set `P` of poles in the open strip. Assume `f`
is integrable on both vertical lines and `sup_{σ₁≤σ≤σ₂} |f(σ + it)| → 0` as `|t| → ∞`. Then
`∫_{(σ₂)} f − ∫_{(σ₁)} f = 2πi Σ_{ρ∈P} Res_ρ f`.

The half-infinite version is the same identity for the U-shaped contours, with
`(σ₂ ± i∞) → σ₂ ± iT → σ₁ ± iT → (σ₁ ± i∞)` and the poles above or below height `T`.

Locators: `kontorovichtao-pntplus` lines 589–642 (Definitions 4.1.1–4.1.5, Lemma 4.1.1); the
residue theorem is consumed from Tau Ceti `TauCeti.Contour.classicalResidueTheorem_nullHomologous`.

**T8.2 (Borel–Carathéodory, derivative form).** Let `f` be holomorphic on `|z − z₀| < R`, with
`Re f ≤ M` there. Then for `k ≥ 1` and `|z − z₀| ≤ r < R`:
`|f^{(k)}(z)| ≤ 2·k!·R·(M − Re f(z₀))/(R − r)^{k+1}`.

This follows from Carathéodory's coefficient inequality
`|a_n| Rⁿ ≤ 2(M − Re a₀)`, `n ≥ 1`, and summation. The blueprint's
`|f′(z)| ≤ 16MR²/(R − r)³` (with `f(z₀) = 0`) is a weaker Check.

Locators: `kontorovichtao-pntplus` lines 1733–1758 (Lemma 5.3.3, Theorem 5.3.2);
`montgomeryvaughan2007` §6.1 (filer's chapter 6). The value form is Mathlib's
`Complex.borelCaratheodory` and is consumed.

**T8.3 (local logarithmic-derivative lemma).** Fix `0 < r₁ < r₂ < R`. There is
`C = C(r₁/R, r₂/R)` with the following property. Let `f` be holomorphic on a neighbourhood of
`|z − z₀| ≤ R`, with `f(z₀) ≠ 0` and `|f(z)| ≤ e^M |f(z₀)|` there (so `M ≥ 0`). Then for every
`z` with `|z − z₀| ≤ r₁` and `f(z) ≠ 0`:
`|f′(z)/f(z) − Σ_{|ρ − z₀| ≤ r₂, f(ρ) = 0} m_ρ/(z − ρ)| ≤ C·M/R`,
where `m_ρ` is the order of the zero `ρ`. The classical radii are `r₁ = R/4` and `r₂ = R/2`.

Locators: `kontorovichtao-pntplus` lines 1971–1977 (Theorem 5.3.7, explicit constants);
`titchmarsh1986` Chapter 3 and `montgomeryvaughan2007` Chapter 6 (filer's locators). The zero
count inside the disc is ZerosOfLFunctions §4.3 (Jensen) and is consumed.

### Layer 9: Mellin smoothing

**T9.1 (Mellin convolution).** For `f, g : (0, ∞) → ℂ` define
`(f ⋆ g)(x) = ∫₀^∞ f(y) g(x/y) dy/y`.
- `f ⋆ g = g ⋆ f` wherever either side converges absolutely.
- If `(x, y) ↦ f(y) g(x/y) x^{s−1}/y` is integrable on `(0, ∞)²`, then
  `mellin (f ⋆ g) s = mellin f s · mellin g s`.

Locator: `kontorovichtao-pntplus` lines 893–925 (Definition 4.3.1, Lemma 4.3.2, Theorem 4.3.1).

**T9.2 (Mellin transforms of bumps).** Let `ν` be `C^k` (`k ≥ 1`) with compact support in
`(0, ∞)`. Then:
- `mellin ν` is entire;
- for `σ₁ ≤ Re s ≤ σ₂` there is `C` with `|mellin ν (s)| ≤ C (1 + |s|)^{−k}`;
- `mellin ν (0) = ∫ ν(x) dx/x`.

Locator: `kontorovichtao-pntplus` §4.3 (Lemma 4.3.1 and Theorem 4.3.2, lines 867–963).

**T9.3 (approximate identity for `dx/x`).** Let `ν ≥ 0` be supported in `[1/2, 2]`, with
`∫ ν dx/x = 1`. Put `ν_ε(x) = ε⁻¹ ν(x^{1/ε})`. Then:
- `ν_ε` is supported in `[2^{−ε}, 2^{ε}]` and has mass 1;
- `mellin ν_ε (s) = mellin ν (εs)`, hence `mellin ν_ε (1) = 1 + O(ε)`;
- `ν_ε ⋆ f → f` as `ε → 0`, at every point of continuity of a locally integrable `f`, and
  locally uniformly for continuous `f`.

Locator: `kontorovichtao-pntplus` lines 964–985 (Definition 4.3.2, Lemma 4.3.3, Theorem 4.3.3,
Lemma 4.3.4).

**T9.4 (smoothed cutoffs).** Put `1̃_ε = 1_{(0,1]} ⋆ ν_ε`. Then:
- `0 ≤ 1̃_ε ≤ 1`;
- `1̃_ε(x) = 1` for `x ≤ 2^{−ε}` and `1̃_ε(x) = 0` for `x ≥ 2^{ε}`;
- for `Re s > 0`, `mellin 1̃_ε (s) = mellin ν (εs)/s`, consuming Mathlib's `hasMellin_one_Ioc`;
- if `ν` is `C^k`, then `|mellin 1̃_ε (s)| ≤ C_k/(|s| (1 + ε|s|)^k)` on vertical strips in
  `Re s > 0`;
- `mellin 1̃_ε (1) = 1 + O(ε)`.

Locator: `kontorovichtao-pntplus` lines 1015–1134 (Definition 4.3.3, Lemmas 4.3.5–4.3.11).

### Layer 10: from a zero-free region to an error term

**T10.1 (smoothed summatory functions).** Let `a : ℕ → ℂ` with `Σ |a(n)| n^{−σ} < ∞` for `σ > 1`,
and `F = LSeries a`. Then for `X > 0`, `σ > 1` and `0 < ε ≤ 1`:
`Σ_n a(n) 1̃_ε(n/X) = (1/2πi) ∫_{(σ)} F(s) mellin 1̃_ε (s) X^s ds`.

If moreover `|a(n)| ≤ B log(n + 1)`, then for `X ≥ 2`:
`|Σ_{n≤X} a(n) − Σ_n a(n) 1̃_ε(n/X)| ≤ C B ε X log X`.

With `a = Λ` this is the smoothed Chebyshev function `ψ_ε` and its comparison with
`Chebyshev.psi`.

Locator: `kontorovichtao-pntplus` lines 1463–1506 (Definition 4.5.2, Theorems 4.5.2–4.5.3).

**T10.2 (transfer theorem, Ingham's form).** Hypotheses:
- `η : [3, ∞) → (0, 1/2]` is continuous and nonincreasing, with `η(t) ≥ a(log t)^{−A}` for some
  `a, A > 0`. Put `ω(x) = min_{t ≥ 3}(η(t) log x + log t)`.
- `a(n)` and `F` are as in T10.1, with `|a(n)| ≤ B log(n + 1)`.
- `F` continues holomorphically to the region `σ ≥ 1 − η(|t| + 3)`, except for at most a simple
  pole at `s = 1` with residue `r`.
- `|F(σ + it)| ≤ C log^{B′}(|t| + 3)` in that region, away from a fixed neighbourhood of `1`.

Conclusion: there are `c, C′ > 0` with `|Σ_{n≤x} a(n) − r x| ≤ C′ x exp(−c ω(x))` for `x ≥ 3`.

Checks:
- `η(t) = A₀/log^{n₁} t` gives `x exp(−c (log x)^{1/(1+n₁)})`, the filed form
  (`kontorovichtao-pntplus` lines 1507–1509 and 1673–1677: Definition 4.5.3, Theorem 4.6.1).
- `n₁ = 9` is the blueprint's `MediumPNT` (line 1684).
- `n₁ = 1` with T10.3 recovers ZerosOfLFunctions §8.5 at `K = ℚ`.
- With `F = −L′/L` for a fixed nonprincipal character there is no pole (`r = 0`).

Locators: `platttrudgian2020` lines 21–32 for Ingham's statement; `montgomeryvaughan2007`
Chapter 6, `tenenbaum2015` Chapter II.4 and `iwanieckowalski2004` Chapter 5 (filer's
locators). Ingham's constant `1/2 − ε` and Pintz's `1 − ε` (`platttrudgian2020` lines 54–56) are
refinements, out of scope (Risks 3).

**T10.3 (classical logarithmic-derivative bound).** Let `L` be `ζ_K` for a fixed number field `K`,
or the continued Hecke `L`-function of a fixed primitive finite-order ray-class character `χ`
(the records of ZerosOfLFunctions Layers 4–6; `ζ` is `K = ℚ`). Then there are `c, C > 0`,
depending on `K` and `χ`, with:
- `L(s) ≠ 0` for `σ ≥ 1 − c/log(|t| + 3)`, `|t| ≥ 1`;
- `|L′(s)/L(s)| ≤ C log(|t| + 3)` there.

Route: T8.3 on discs of radius `≍ 1` centred at `1 + 1/log(|t|+3) + it`, the local zero count of
ZerosOfLFunctions §4.4, and the region of §§6.2–6.4, shrunk to avoid the at most one real
exceptional zero, which is a fixed point for fixed `K` and `χ`. For `ζ`, compare
AnalyticNumberTheoryPartI §0.33. The blueprint's weaker `log²` bound
(`kontorovichtao-pntplus` §5.3, Theorem 5.3.27) is a Check.

Locators: `montgomeryvaughan2007` Chapter 6 and `titchmarsh1986` Chapter 3 (filer's locators).

### Layer 11: Dirichlet series of the classical arithmetic functions

**T11.1 (completely multiplicative functions).** A predicate on `ArithmeticFunction R`, for
`R` a monoid with zero: `f 1 = 1` and `f (m n) = f m · f n` for all `m, n`.

API:
- it implies `IsMultiplicative`;
- it is equivalent to `f` being the coercion of a unique `ℕ →*₀ R`;
- it is closed under pointwise product;
- for such `f`, `f · (g ⋆ h) = (f · g) ⋆ (f · h)` and the Dirichlet inverse of `f` is `μ · f`;
- on the half-plane of absolute convergence, `LSeries f` is the Euler product
  `∏_p (1 − f(p) p^{−s})^{−1}`, through Mathlib's completely multiplicative Euler product.

Instances: `liouville`, Dirichlet characters, `n ↦ n^ν`.

Locators: `kontorovichtao-pntplus` lines 3590–3600 (Definition 9.1.8, Theorems 9.1.66–9.1.67);
`apostol1976` Chapter 2.

**T11.2 (divisor functions).**
- (a) `σ_ν(n) = Σ_{d|n} d^ν` for `ν ∈ ℂ`, agreeing with `ArithmeticFunction.sigma k` at `ν = k`.
  It is multiplicative, and `LSeries σ_ν (s) = ζ(s) ζ(s − ν)` for `Re s > max(1, 1 + Re ν)`.
  This is the half-plane of absolute convergence: `abscissaOfAbsConv σ_ν = max(1, 1 + Re ν)`.
- (b) For `z ∈ ℂ`, `d_z` is the multiplicative function with
  `d_z(p^a) = (z + a − 1 choose a)` (generalised binomial). It satisfies
  `LSeries d_z (s) = exp(z · log ζ(s))` for `Re s > 1`, where `log ζ` is the Euler-product
  logarithm. For `z ≠ 0` the abscissa is 1. At `z = k ∈ ℕ`, `d_k` equals AnalyticNumberTheoryPartI
  §3.3's `d_k` and `LSeries d_k = ζ^k` (Check).

Locators: `kontorovichtao-pntplus` lines 3151–3200 and 3215–3320 (Definition 9.1.3,
Theorems 9.1.12, 9.1.15, 9.1.32); `iwanieckowalski2004` (1.25); `tenenbaum2015` Chapter II.5;
`titchmarsh1986` Chapter 1.

**T11.3 (four-shift identity).** Let `α, β ∈ ℂ` and
`Re s > max(1, 1 + Re α, 1 + Re β, 1 + Re(α + β))`. Then
`Σ σ_α(n) σ_β(n) n^{−s} = ζ(s) ζ(s − α) ζ(s − β) ζ(s − α − β)/ζ(2s − α − β)`,
the series converging absolutely.

Corollaries, for `Re s > 1`:
- `Σ τ(n)² n^{−s} = ζ(s)⁴/ζ(2s)` (`α = β = 0`);
- `Σ τ(n²) n^{−s} = ζ(s)³/ζ(2s)`, proved through the same Euler-factor comparison.

Locators: `kontorovichtao-pntplus` lines 3324–3353 and 3489 (Theorems 9.1.33–9.1.36, 9.1.50);
`iwanieckowalski2004` (1.28); `titchmarsh1986` Chapter 1 (filer's locator).

**T11.4 (other classical series).** For `Re s > 1`:
- `Σ 2^{ω(n)} n^{−s} = ζ(s)²/ζ(2s)`;
- `Σ μ(n)² n^{−s} = ζ(s)/ζ(2s)`;
- `Σ λ(n) n^{−s} = ζ(2s)/ζ(s)`.

For `Re s > 2`: `Σ φ(n) n^{−s} = ζ(s − 1)/ζ(s)`.

The abscissas of absolute convergence are 1, 1, 1 and 2. The value 2 for `φ` is sharp: the
blueprint records that a hypothesis `Re s > 1` there is false (line 3631).

Locators: `kontorovichtao-pntplus` lines 3379–3632 (Theorems 9.1.38–9.1.70);
`iwanieckowalski2004` (1.33); `apostol1976` Chapter 11.

### Layer 12: summability

**T12.1 (Hardy–Landau Tauberian theorem for Cesàro means).**
- Let `(a_n)` be real, with `n a_n ≥ −K` for all `n`. If the Cesàro means of the partial sums
  `S_N = Σ_{n≤N} a_n` converge to `S`, then `S_N → S`.
- The two-sided form, `n‖a_n‖ ≤ K`, holds in any Banach space.
- Mathlib's `Filter.Tendsto.cesaro`, convergence implies Cesàro convergence, is the consumed
  converse.

Locator: `hardy1949` (filer's chapter 5; uncertified, see Risks 4).

**T12.2 (Fejér).** For `f` continuous on `AddCircle T` (complex values), the Fejér means
(ToeplitzOperators T1's definition) converge to `f` uniformly. For `f ∈ L^p`, `1 ≤ p < ∞`, they
converge in `L^p`. The `L¹` case is T1's and is a Check.

Locator: `katznelson2004` Chapter I.

### Layer 13: arithmetic applications

**T13.1 (Erdős #392).** Let `A(n)` be the least `t` such that `n! = a₁⋯a_t` with positive integers
`a_i ≤ n²`, and `A₁(n)` the same with `a_i ≤ n`. Then:
- `A(n) = n/2 − n/(2 log n) + o(n/log n)`;
- `A₁(n) = n − n/log n + o(n/log n)`.

The upper bounds are the blueprint's Theorems 8.1.1–8.1.2 (`kontorovichtao-pntplus`
lines 3096–3101). Their inputs are the prime number theorem (ArithmeticDirichletSeries Layer 10)
and Mertens-type sums (AnalyticNumberTheoryPartI §§0.11, 0.21). The lower bounds are
`t · log(n²) ≥ log n!` and Stirling. Method background: `alexeevetal2025factorial` §1, on the
neighbouring problem #391.

**T13.2 (Goldbach ranges).** Define:
- `EvenGoldbachUpTo H`: every even `n` with `4 ≤ n ≤ H` is a sum of two primes;
- `OddGoldbachUpTo H`: every odd `n` with `7 ≤ n ≤ H` is a sum of three primes.

Prove:
- monotonicity in `H`;
- `EvenGoldbachUpTo H → OddGoldbachUpTo (H + 3)`;
- the interval transfer: from `EvenGoldbachUpTo H`, `OddGoldbachUpTo (x₀ + 4)` and the
  hypothesis that every `(x(1 − 1/Δ), x]` with `x ≥ x₀` contains a prime (with `Δ ≥ 1` and
  `x₀(1 − 1/Δ) ≥ 2`), deduce `OddGoldbachUpTo ((H − 4)Δ + 4)`.

The published verifications are named propositions that theorems take as hypotheses:
- `EvenGoldbachUpTo (4·10¹⁸)`: `oliveiraesilva-herzog-pardi2014`, abstract and §1, lines 11–14;
- `OddGoldbachUpTo (8.875·10³⁰)`: `helfgottplatt2013`, abstract, lines 9–10.

Checks: `EvenGoldbachUpTo 30` and `OddGoldbachUpTo 33` by finite computation.

## Suppliers

All suppliers are on main or earlier in the merge order.

- **Mathlib (pinned):**
  - `𝓕` on `ℝ`, `BoundedVariationOn`, `eVariationOn`, `BoundedVariationOn.vectorMeasure`;
  - `mellin`, `mellinInv`, `MellinConvergent`, `HasMellin`, `hasMellin_one_Ioc`,
    `mellinInv_mellin_eq`, `Complex.VerticalIntegrable`;
  - `Complex.borelCaratheodory`;
  - `riemannZeta`, `LSeries`, `LSeriesSummable`, `LSeries.abscissaOfAbsConv`,
    `LSeries_zeta_eq_riemannZeta`, `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`;
  - `ArithmeticFunction` (`sigma`, `cardDistinctFactors`, `moebius`, `liouville`, `vonMangoldt`,
    `IsMultiplicative`, `eulerProduct`), `Nat.totient`, and the completely multiplicative Euler
    product of `Mathlib/NumberTheory/EulerProduct/Basic.lean`;
  - `Filter.Tendsto.cesaro`, `fourierCoeff`, `Stirling.factorial_isEquivalent_stirling`.
- **Tau Ceti (pinned):**
  - `TauCeti.Contour.tendsto_integral_sin_div_atTop` and `tendsto_integral_sinc_atTop`
    (`TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`);
  - `TauCeti.Wkp.denseRange_ofTestFunctionₗ_top` (`TauCeti/Analysis/Sobolev/Wkp/Density.lean`);
  - `TauCeti.Contour.classicalResidueTheorem_nullHomologous`;
  - `TauCeti.truncatedPerronKernel`, `truncatedPerronKernel_one` and `truncatedPerron_LSeries`
    (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/`);
  - `TauCeti/Analysis/Fourier/Decay.lean`;
  - `DirichletCharacter.LSeries_zetaMul`.
- **ContourIntegration (Completed), Layers 2–4:** residues and the residue theorem behind T8.1.
- **ArithmeticDirichletSeries (Completed):**
  - Layer 6, Abel–Stieltjes summation and truncated Perron, consumed by T7.3(d) and T10.1;
  - Layer 10, the `ψ → θ → π` transfer and the PNT used by T13.1.
- **ZerosOfLFunctions (main; merge order line 48):**
  - §4.3, Jensen's bound, for T8.3;
  - §4.4, local zero counts, for T10.3;
  - §§6.2–6.4, the zero-free regions and the exceptional zero, for T10.3;
  - §8.5, the PNT with classical error, as a Check of T10.2.
- **AnalyticNumberTheoryPartI (#1126; merge order line 49):**
  - §0.33, the zero-free strip and logarithmic bounds for `ζ`, for T10.3;
  - §§0.11 and 0.21, Mertens, for T13.1;
  - §3.3, the `d_n` carrier, for T11.2(b);
  - §3.22, the divisor average, as a Check of T11.2.
- **BanachAlgebras §2.1 (main):** the Riemann–Stieltjes integral on bounded-variation paths, for
  the filed bounded-variation integrator item, which is not planned again.
- **OperatorTheory/ToeplitzOperators T1 (main):** the Fejér means on the circle and their `L¹`
  approximation, for T12.2.

Merge order: anywhere after AnalyticNumberTheoryPartI and before ExplicitZetaBounds (line 267).
Directly after AnalyticNumberTheoryPartII (line 50) keeps the series together, and lets
SieveMethodsAndPrimePatterns (line 56) and ProbabilisticAndMetricNumberTheory (line 61) import it
if their designs choose to. Part III consumes nothing from AnalyticNumberTheoryPartII, from
ArithmeticDirichletSeriesPartII or from any Explicit roadmap.

## Consumers

The Explicit roadmaps sit later in the merge order (ORDER.txt lines 267–272). Their open designs
now plan, locally or through Mathlib, objects this roadmap would own. Once it exists they should
import them:

- **ExplicitPrimeCounting:** its §2.1 extends the Weil test class by mollifying kernels of bounded
  variation multiplicatively and bounding their Mellin transforms
  (`packages/ExplicitPrimeCounting/README.md` §2.1). That is T9.1–T9.3 and T7.1.
- **ExplicitZetaBounds:** its §7.10 route (the reciprocal of `ζ` on the line one) runs the
  Borel–Carathéodory and three-circle method with bounds for `|ζ′/ζ|` near the line one
  (`packages/ExplicitZetaBounds/README.md` §7.10, citing Mathlib `Complex.borelCaratheodory`).
  That is T8.2–T8.3. Its smoothed Perron kernels (§6.1) are explicit refinements of T7.2–T7.3.
- **ExplicitMultiplicativeFunctions:** its Examples and Layer 7 use the Dirichlet series of
  `2^ω/n`, `τ_k`, `μ²` and `φ` (`packages/ExplicitMultiplicativeFunctions/README.md`, the
  `2^ω/n` example in the Layer 5 Examples). That is T11. Its README at the #1946 head also takes a
  Borel–Carathéodory step from Mathlib above a verified height; that step is T8.2.
- **ExplicitNumberFields:** listed in `packages/ExplicitZetaBounds/target.md` as a consumer of
  "the Perron and Mellin tools". It would take T7.3 and T9.
- **CircleMethodThreePrimes (#1803):** it excludes every numerical form of ternary Goldbach. The
  propositions of T13.2 are the interface a later explicit treatment needs.
- **A later Part IV:** Pintz-type sharpenings of T10.2 and the conditional Vinogradov–Korobov
  consequence. Both need zero-density or exponential-sum input that lies after this roadmap.

## Sources

Recorded in `packages/AnalyticNumberTheoryPartIII/sources.toml`. Certified works were fetched and
read by the worker; uncertified works are paywalled and cited by locator only.

| Key | Work | Status | Used for |
| --- | --- | --- | --- |
| `kontorovichtao-pntplus` | Kontorovich, Tao et al., PrimeNumberTheoremAnd blueprint (Apache-2.0 project, author page) | certified | T7.1, T8.1–T8.3, T9, T10.1–T10.2, T11, T13.1 |
| `platttrudgian2020` | Platt–Trudgian, *The error term in the prime number theorem*, arXiv:1809.03134v2 | certified | T10.2 (Ingham's theorem, §1) |
| `oliveiraesilva-herzog-pardi2014` | Oliveira e Silva–Herzog–Pardi, Math. Comp. 83 (2014) | certified (publisher-open) | T13.2 |
| `helfgottplatt2013` | Helfgott–Platt, arXiv:1305.3062v2 | certified | T13.2 |
| `alexeevetal2025factorial` | Alexeev et al., *Decomposing a factorial into large factors*, arXiv:2503.20170v4 | certified | T13.1 (background) |
| `montgomeryvaughan2007` | Montgomery–Vaughan, *Multiplicative Number Theory I* | uncertified | T8.2, T8.3, T10.2, T10.3 |
| `titchmarsh1986` | Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed. | uncertified | T8.3, T10.3, T11.2–T11.4 |
| `iwanieckowalski2004` | Iwaniec–Kowalski, *Analytic Number Theory* | uncertified | T10.2, T11.2–T11.4 |
| `tenenbaum2015` | Tenenbaum, *Introduction to Analytic and Probabilistic Number Theory*, 3rd ed. | uncertified | T10.2, T11.2 |
| `apostol1976` | Apostol, *Introduction to Analytic Number Theory* | uncertified | T11.1, T11.4 |
| `hardy1949` | Hardy, *Divergent Series* | uncertified | T12.1 |
| `katznelson2004` | Katznelson, *An Introduction to Harmonic Analysis*, 3rd ed. | uncertified | T7.1, T12.2 |

No source is missing, so there is no `needs-references.toml`. Three texts were tried and dropped.
Their statements are covered by certified sources above:
- Tao's 254A Notes 2: the sources service failed on the blog URL.
- Pintz 1980 (ICM archive): an image-only scan, and OCR is not installed.
- Fejér 1904 (EuDML and GDZ): only a landing page and an image-only scan were available.

## Risks

1. **Breadth of the filed scope.** Layers 7–11 form one chain: tools, then smoothing, then the
   transfer, plus the series that feed it. Layers 12–13 (Hardy–Landau, Fejér, Erdős #392,
   Goldbach propositions) are loosely tied to that chain. They are kept because no other roadmap
   or open design owns them, and the filer placed them here. A design reviewer may still ask to
   move T12.2 next to ToeplitzOperators, or T13.2 to a roadmap after ExplicitPrimeCounting. Both
   are cheap moves, since neither layer supplies Layers 7–11.
2. **Two owners with the Explicit designs.** ExplicitPrimeCounting §2.1 already plans
   multiplicative mollification and Mellin bounds for its kernel class. ExplicitMultiplicativeFunctions
   and ExplicitZetaBounds use Borel–Carathéodory and the classical Dirichlet series through
   Mathlib. If this roadmap is accepted, those designs must import T7–T11 instead of planning them;
   otherwise the same objects get two owners. This roadmap must also never consume them. The
   prime-in-interval input of T13.2 and the Vinogradov–Korobov region of the T10.2 Check stay
   hypotheses here, because their owners come later (ORDER.txt lines 267–269).
3. **Generality of T10.2.** With a polylogarithmic bound on `F` only, the method gives
   `exp(−c ω(x))` for some `c > 0`. Ingham's `c = 1/2 − ε` and Pintz's `1 − ε` need zero-density
   input and are left to a later part. The lower bound `η(t) ≥ a(log t)^{−A}` is needed so that
   the logarithmic losses of the contour shift are absorbed in `exp(−c ω(x))`. The design must
   keep that hypothesis, or carry the losses as an explicit `(log x)^{B″}` factor.
4. **Sources.** All the filer's textbooks are paywalled and uncertified. Their chapter locators
   are the filer's, and theorem numbers are left to the design. The Hardy–Landau theorem (T12.1)
   and Fejér's uniform theorem (T12.2) currently rest on uncertified textbooks only (`hardy1949`,
   whose chapter locator is the filer's and unverified, and `katznelson2004`). The design should
   find a legal open text for them (lecture notes or an open journal article) or keep them
   uncertified. Everything in Layers 7–11 and T13.1 has a certified locator in
   `kontorovichtao-pntplus`.
5. **Moving suppliers.** AnalyticNumberTheoryPartI is an open pull request. T11.2(b) relies on its
   §3.3 `d_n` carrier, and T10.3 on its §0.33. A renumbering there needs a matching update here;
   check with `roadmaps overlaps AnalyticNumberTheoryPartI` at design time. ToeplitzOperators also
   has an open revision (#1684) that touches T1's Fejér text.
6. **Size of T7.3.** Mathlib has Mellin inversion only for transforms integrable on the line
   (`mellinInv_mellin_eq`). The principal-value inversion for locally bounded-variation functions,
   with a quantitative window, is a genuine new development, moderate in size. No foundation far
   above the library is missing.
